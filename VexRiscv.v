// Generator : SpinalHDL v1.3.3    git head : ffafc27104d49c7dd10f7eaf6b679b56674f34e6
// Date      : 06/04/2019, 13:54:54
// Component : VexRiscv


`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_WFI 2'b10
`define EnvCtrlEnum_defaultEncoding_ECALL 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define MmuPlugin_shared_State_defaultEncoding_type [2:0]
`define MmuPlugin_shared_State_defaultEncoding_IDLE 3'b000
`define MmuPlugin_shared_State_defaultEncoding_L1_CMD 3'b001
`define MmuPlugin_shared_State_defaultEncoding_L1_RSP 3'b010
`define MmuPlugin_shared_State_defaultEncoding_L0_CMD 3'b011
`define MmuPlugin_shared_State_defaultEncoding_L0_RSP 3'b100

module InstructionCache (
      input   io_flush,
      input   io_cpu_prefetch_isValid,
      output reg  io_cpu_prefetch_haltIt,
      input  [31:0] io_cpu_prefetch_pc,
      input   io_cpu_fetch_isValid,
      input   io_cpu_fetch_isStuck,
      input   io_cpu_fetch_isRemoved,
      input  [31:0] io_cpu_fetch_pc,
      output [31:0] io_cpu_fetch_data,
      input   io_cpu_fetch_dataBypassValid,
      input  [31:0] io_cpu_fetch_dataBypass,
      output  io_cpu_fetch_mmuBus_cmd_isValid,
      output [31:0] io_cpu_fetch_mmuBus_cmd_virtualAddress,
      output  io_cpu_fetch_mmuBus_cmd_bypassTranslation,
      input  [31:0] io_cpu_fetch_mmuBus_rsp_physicalAddress,
      input   io_cpu_fetch_mmuBus_rsp_isIoAccess,
      input   io_cpu_fetch_mmuBus_rsp_allowRead,
      input   io_cpu_fetch_mmuBus_rsp_allowWrite,
      input   io_cpu_fetch_mmuBus_rsp_allowExecute,
      input   io_cpu_fetch_mmuBus_rsp_exception,
      input   io_cpu_fetch_mmuBus_rsp_refilling,
      output  io_cpu_fetch_mmuBus_end,
      output [31:0] io_cpu_fetch_physicalAddress,
      input   io_cpu_decode_isValid,
      input   io_cpu_decode_isStuck,
      input  [31:0] io_cpu_decode_pc,
      output [31:0] io_cpu_decode_physicalAddress,
      output [31:0] io_cpu_decode_data,
      output  io_cpu_decode_cacheMiss,
      output  io_cpu_decode_error,
      output  io_cpu_decode_mmuRefilling,
      output  io_cpu_decode_mmuException,
      input   io_cpu_decode_isUser,
      input   io_cpu_fill_valid,
      input  [31:0] io_cpu_fill_payload,
      output  io_mem_cmd_valid,
      input   io_mem_cmd_ready,
      output [31:0] io_mem_cmd_payload_address,
      output [2:0] io_mem_cmd_payload_size,
      input   io_mem_rsp_valid,
      input  [31:0] io_mem_rsp_payload_data,
      input   io_mem_rsp_payload_error,
      input   clk,
      input   reset);
  reg [21:0] zz_10_;
  reg [31:0] zz_11_;
  wire  zz_12_;
  wire  zz_13_;
  wire [0:0] zz_14_;
  wire [0:0] zz_15_;
  wire [21:0] zz_16_;
  reg  zz_1_;
  reg  zz_2_;
  reg  lineLoader_fire;
  reg  lineLoader_valid;
  reg [31:0] lineLoader_address;
  reg  lineLoader_hadError;
  reg  lineLoader_flushPending;
  reg [7:0] lineLoader_flushCounter;
  reg  zz_3_;
  reg  lineLoader_cmdSent;
  reg  lineLoader_wayToAllocate_willIncrement;
  wire  lineLoader_wayToAllocate_willClear;
  wire  lineLoader_wayToAllocate_willOverflowIfInc;
  wire  lineLoader_wayToAllocate_willOverflow;
  reg [2:0] lineLoader_wordIndex;
  wire  lineLoader_write_tag_0_valid;
  wire [6:0] lineLoader_write_tag_0_payload_address;
  wire  lineLoader_write_tag_0_payload_data_valid;
  wire  lineLoader_write_tag_0_payload_data_error;
  wire [19:0] lineLoader_write_tag_0_payload_data_address;
  wire  lineLoader_write_data_0_valid;
  wire [9:0] lineLoader_write_data_0_payload_address;
  wire [31:0] lineLoader_write_data_0_payload_data;
  wire  zz_4_;
  wire [6:0] zz_5_;
  wire  zz_6_;
  wire  fetchStage_read_waysValues_0_tag_valid;
  wire  fetchStage_read_waysValues_0_tag_error;
  wire [19:0] fetchStage_read_waysValues_0_tag_address;
  wire [21:0] zz_7_;
  wire [9:0] zz_8_;
  wire  zz_9_;
  wire [31:0] fetchStage_read_waysValues_0_data;
  wire  fetchStage_hit_hits_0;
  wire  fetchStage_hit_valid;
  wire  fetchStage_hit_error;
  wire [31:0] fetchStage_hit_data;
  wire [31:0] fetchStage_hit_word;
  reg [31:0] io_cpu_fetch_data_regNextWhen;
  reg [31:0] decodeStage_mmuRsp_physicalAddress;
  reg  decodeStage_mmuRsp_isIoAccess;
  reg  decodeStage_mmuRsp_allowRead;
  reg  decodeStage_mmuRsp_allowWrite;
  reg  decodeStage_mmuRsp_allowExecute;
  reg  decodeStage_mmuRsp_exception;
  reg  decodeStage_mmuRsp_refilling;
  reg  decodeStage_hit_valid;
  reg  decodeStage_hit_error;
  reg [21:0] ways_0_tags [0:127];
  reg [31:0] ways_0_datas [0:1023];
  assign zz_12_ = (! lineLoader_flushCounter[7]);
  assign zz_13_ = (lineLoader_flushPending && (! (lineLoader_valid || io_cpu_fetch_isValid)));
  assign zz_14_ = zz_7_[0 : 0];
  assign zz_15_ = zz_7_[1 : 1];
  assign zz_16_ = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  always @ (posedge clk) begin
    if(zz_2_) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= zz_16_;
    end
  end

  always @ (posedge clk) begin
    if(zz_6_) begin
      zz_10_ <= ways_0_tags[zz_5_];
    end
  end

  always @ (posedge clk) begin
    if(zz_1_) begin
      ways_0_datas[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(zz_9_) begin
      zz_11_ <= ways_0_datas[zz_8_];
    end
  end

  always @ (*) begin
    zz_1_ = 1'b0;
    if(lineLoader_write_data_0_valid)begin
      zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    zz_2_ = 1'b0;
    if(lineLoader_write_tag_0_valid)begin
      zz_2_ = 1'b1;
    end
  end

  always @ (*) begin
    io_cpu_prefetch_haltIt = 1'b0;
    if((lineLoader_valid || lineLoader_flushPending))begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(zz_12_)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if((! zz_3_))begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
  end

  always @ (*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid)begin
      if((lineLoader_wordIndex == (3'b111)))begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  assign io_mem_cmd_valid = (lineLoader_valid && (! lineLoader_cmdSent));
  assign io_mem_cmd_payload_address = {lineLoader_address[31 : 5],(5'b00000)};
  assign io_mem_cmd_payload_size = (3'b101);
  always @ (*) begin
    lineLoader_wayToAllocate_willIncrement = 1'b0;
    if(lineLoader_fire)begin
      lineLoader_wayToAllocate_willIncrement = 1'b1;
    end
  end

  assign lineLoader_wayToAllocate_willClear = 1'b0;
  assign lineLoader_wayToAllocate_willOverflowIfInc = 1'b1;
  assign lineLoader_wayToAllocate_willOverflow = (lineLoader_wayToAllocate_willOverflowIfInc && lineLoader_wayToAllocate_willIncrement);
  assign zz_4_ = 1'b1;
  assign lineLoader_write_tag_0_valid = ((zz_4_ && lineLoader_fire) || (! lineLoader_flushCounter[7]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[7] ? lineLoader_address[11 : 5] : lineLoader_flushCounter[6 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[7];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 12];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && zz_4_);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[11 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign zz_5_ = io_cpu_prefetch_pc[11 : 5];
  assign zz_6_ = (! io_cpu_fetch_isStuck);
  assign zz_7_ = zz_10_;
  assign fetchStage_read_waysValues_0_tag_valid = zz_14_[0];
  assign fetchStage_read_waysValues_0_tag_error = zz_15_[0];
  assign fetchStage_read_waysValues_0_tag_address = zz_7_[21 : 2];
  assign zz_8_ = io_cpu_prefetch_pc[11 : 2];
  assign zz_9_ = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_waysValues_0_data = zz_11_;
  assign fetchStage_hit_hits_0 = (fetchStage_read_waysValues_0_tag_valid && (fetchStage_read_waysValues_0_tag_address == io_cpu_fetch_mmuBus_rsp_physicalAddress[31 : 12]));
  assign fetchStage_hit_valid = (fetchStage_hit_hits_0 != (1'b0));
  assign fetchStage_hit_error = fetchStage_read_waysValues_0_tag_error;
  assign fetchStage_hit_data = fetchStage_read_waysValues_0_data;
  assign fetchStage_hit_word = fetchStage_hit_data[31 : 0];
  assign io_cpu_fetch_data = (io_cpu_fetch_dataBypassValid ? io_cpu_fetch_dataBypass : fetchStage_hit_word);
  assign io_cpu_decode_data = io_cpu_fetch_data_regNextWhen;
  assign io_cpu_fetch_mmuBus_cmd_isValid = io_cpu_fetch_isValid;
  assign io_cpu_fetch_mmuBus_cmd_virtualAddress = io_cpu_fetch_pc;
  assign io_cpu_fetch_mmuBus_cmd_bypassTranslation = 1'b0;
  assign io_cpu_fetch_mmuBus_end = ((! io_cpu_fetch_isStuck) || io_cpu_fetch_isRemoved);
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuBus_rsp_physicalAddress;
  assign io_cpu_decode_cacheMiss = (! decodeStage_hit_valid);
  assign io_cpu_decode_error = decodeStage_hit_error;
  assign io_cpu_decode_mmuRefilling = decodeStage_mmuRsp_refilling;
  assign io_cpu_decode_mmuException = ((! decodeStage_mmuRsp_refilling) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute)));
  assign io_cpu_decode_physicalAddress = decodeStage_mmuRsp_physicalAddress;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      lineLoader_valid <= 1'b0;
      lineLoader_hadError <= 1'b0;
      lineLoader_flushPending <= 1'b1;
      lineLoader_cmdSent <= 1'b0;
      lineLoader_wordIndex <= (3'b000);
    end else begin
      if(lineLoader_fire)begin
        lineLoader_valid <= 1'b0;
      end
      if(lineLoader_fire)begin
        lineLoader_hadError <= 1'b0;
      end
      if(io_cpu_fill_valid)begin
        lineLoader_valid <= 1'b1;
      end
      if(io_flush)begin
        lineLoader_flushPending <= 1'b1;
      end
      if(zz_13_)begin
        lineLoader_flushPending <= 1'b0;
      end
      if((io_mem_cmd_valid && io_mem_cmd_ready))begin
        lineLoader_cmdSent <= 1'b1;
      end
      if(lineLoader_fire)begin
        lineLoader_cmdSent <= 1'b0;
      end
      if(io_mem_rsp_valid)begin
        lineLoader_wordIndex <= (lineLoader_wordIndex + (3'b001));
        if(io_mem_rsp_payload_error)begin
          lineLoader_hadError <= 1'b1;
        end
      end
    end
  end

  always @ (posedge clk) begin
    if(io_cpu_fill_valid)begin
      lineLoader_address <= io_cpu_fill_payload;
    end
    if(zz_12_)begin
      lineLoader_flushCounter <= (lineLoader_flushCounter + (8'b00000001));
    end
    zz_3_ <= lineLoader_flushCounter[7];
    if(zz_13_)begin
      lineLoader_flushCounter <= (8'b00000000);
    end
    if((! io_cpu_decode_isStuck))begin
      io_cpu_fetch_data_regNextWhen <= io_cpu_fetch_data;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_mmuRsp_physicalAddress <= io_cpu_fetch_mmuBus_rsp_physicalAddress;
      decodeStage_mmuRsp_isIoAccess <= io_cpu_fetch_mmuBus_rsp_isIoAccess;
      decodeStage_mmuRsp_allowRead <= io_cpu_fetch_mmuBus_rsp_allowRead;
      decodeStage_mmuRsp_allowWrite <= io_cpu_fetch_mmuBus_rsp_allowWrite;
      decodeStage_mmuRsp_allowExecute <= io_cpu_fetch_mmuBus_rsp_allowExecute;
      decodeStage_mmuRsp_exception <= io_cpu_fetch_mmuBus_rsp_exception;
      decodeStage_mmuRsp_refilling <= io_cpu_fetch_mmuBus_rsp_refilling;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_hit_valid <= fetchStage_hit_valid;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_hit_error <= fetchStage_hit_error;
    end
  end

endmodule

module DataCache (
      input   io_cpu_execute_isValid,
      input  [31:0] io_cpu_execute_address,
      input   io_cpu_execute_args_wr,
      input  [31:0] io_cpu_execute_args_data,
      input  [1:0] io_cpu_execute_args_size,
      input   io_cpu_execute_args_forceUncachedAccess,
      input   io_cpu_execute_args_isAtomic,
      input   io_cpu_memory_isValid,
      input   io_cpu_memory_isStuck,
      input   io_cpu_memory_isRemoved,
      input  [31:0] io_cpu_memory_address,
      output  io_cpu_memory_mmuBus_cmd_isValid,
      output [31:0] io_cpu_memory_mmuBus_cmd_virtualAddress,
      output  io_cpu_memory_mmuBus_cmd_bypassTranslation,
      input  [31:0] io_cpu_memory_mmuBus_rsp_physicalAddress,
      input   io_cpu_memory_mmuBus_rsp_isIoAccess,
      input   io_cpu_memory_mmuBus_rsp_allowRead,
      input   io_cpu_memory_mmuBus_rsp_allowWrite,
      input   io_cpu_memory_mmuBus_rsp_allowExecute,
      input   io_cpu_memory_mmuBus_rsp_exception,
      input   io_cpu_memory_mmuBus_rsp_refilling,
      output  io_cpu_memory_mmuBus_end,
      input   io_cpu_writeBack_isValid,
      input   io_cpu_writeBack_isStuck,
      input   io_cpu_writeBack_isUser,
      output reg  io_cpu_writeBack_haltIt,
      output  io_cpu_writeBack_isWrite,
      output reg [31:0] io_cpu_writeBack_data,
      input  [31:0] io_cpu_writeBack_address,
      output  io_cpu_writeBack_mmuException,
      output  io_cpu_writeBack_unalignedAccess,
      output reg  io_cpu_writeBack_accessError,
      input   io_cpu_writeBack_clearAtomicEntries,
      output reg  io_cpu_redo,
      input   io_cpu_flush_valid,
      output reg  io_cpu_flush_ready,
      output reg  io_mem_cmd_valid,
      input   io_mem_cmd_ready,
      output reg  io_mem_cmd_payload_wr,
      output reg [31:0] io_mem_cmd_payload_address,
      output reg [31:0] io_mem_cmd_payload_data,
      output reg [3:0] io_mem_cmd_payload_mask,
      output reg [2:0] io_mem_cmd_payload_length,
      output reg  io_mem_cmd_payload_last,
      input   io_mem_rsp_valid,
      input  [31:0] io_mem_rsp_payload_data,
      input   io_mem_rsp_payload_error,
      input   clk,
      input   reset);
  reg [21:0] zz_10_;
  reg [31:0] zz_11_;
  wire  zz_12_;
  wire  zz_13_;
  wire  zz_14_;
  wire [0:0] zz_15_;
  wire [0:0] zz_16_;
  wire [0:0] zz_17_;
  wire [0:0] zz_18_;
  wire [2:0] zz_19_;
  wire [1:0] zz_20_;
  wire [21:0] zz_21_;
  reg  zz_1_;
  reg  zz_2_;
  wire  haltCpu;
  reg  tagsReadCmd_valid;
  reg [6:0] tagsReadCmd_payload;
  reg  tagsWriteCmd_valid;
  reg [0:0] tagsWriteCmd_payload_way;
  reg [6:0] tagsWriteCmd_payload_address;
  reg  tagsWriteCmd_payload_data_valid;
  reg  tagsWriteCmd_payload_data_error;
  reg [19:0] tagsWriteCmd_payload_data_address;
  reg  tagsWriteLastCmd_valid;
  reg [0:0] tagsWriteLastCmd_payload_way;
  reg [6:0] tagsWriteLastCmd_payload_address;
  reg  tagsWriteLastCmd_payload_data_valid;
  reg  tagsWriteLastCmd_payload_data_error;
  reg [19:0] tagsWriteLastCmd_payload_data_address;
  reg  dataReadCmd_valid;
  reg [9:0] dataReadCmd_payload;
  reg  dataWriteCmd_valid;
  reg [0:0] dataWriteCmd_payload_way;
  reg [9:0] dataWriteCmd_payload_address;
  reg [31:0] dataWriteCmd_payload_data;
  reg [3:0] dataWriteCmd_payload_mask;
  wire  zz_3_;
  wire  ways_0_tagsReadRsp_valid;
  wire  ways_0_tagsReadRsp_error;
  wire [19:0] ways_0_tagsReadRsp_address;
  wire [21:0] zz_4_;
  wire  zz_5_;
  wire [31:0] ways_0_dataReadRsp;
  reg [3:0] zz_6_;
  wire [3:0] stage0_mask;
  wire [0:0] stage0_colisions;
  reg  stageA_request_wr;
  reg [31:0] stageA_request_data;
  reg [1:0] stageA_request_size;
  reg  stageA_request_forceUncachedAccess;
  reg  stageA_request_isAtomic;
  reg [3:0] stageA_mask;
  wire  stageA_wayHits_0;
  reg [0:0] stage0_colisions_regNextWhen;
  wire [0:0] zz_7_;
  wire [0:0] stageA_colisions;
  reg  stageB_request_wr;
  reg [31:0] stageB_request_data;
  reg [1:0] stageB_request_size;
  reg  stageB_request_forceUncachedAccess;
  reg  stageB_request_isAtomic;
  reg  stageB_mmuRspFreeze;
  reg [31:0] stageB_mmuRsp_physicalAddress;
  reg  stageB_mmuRsp_isIoAccess;
  reg  stageB_mmuRsp_allowRead;
  reg  stageB_mmuRsp_allowWrite;
  reg  stageB_mmuRsp_allowExecute;
  reg  stageB_mmuRsp_exception;
  reg  stageB_mmuRsp_refilling;
  reg  stageB_tagsReadRsp_0_valid;
  reg  stageB_tagsReadRsp_0_error;
  reg [19:0] stageB_tagsReadRsp_0_address;
  reg [31:0] stageB_dataReadRsp_0;
  wire [0:0] zz_8_;
  reg [0:0] stageB_waysHits;
  wire  stageB_waysHit;
  wire [31:0] stageB_dataMux;
  reg [3:0] stageB_mask;
  reg [0:0] stageB_colisions;
  reg  stageB_loaderValid;
  reg  stageB_flusher_valid;
  reg  stageB_atomic_reserved;
  reg  stageB_memCmdSent;
  wire [0:0] zz_9_;
  reg  loader_valid;
  reg  loader_counter_willIncrement;
  wire  loader_counter_willClear;
  reg [2:0] loader_counter_valueNext;
  reg [2:0] loader_counter_value;
  wire  loader_counter_willOverflowIfInc;
  wire  loader_counter_willOverflow;
  reg [0:0] loader_waysAllocator;
  reg  loader_error;
  reg [21:0] ways_0_tags [0:127];
  reg [7:0] ways_0_data_symbol0 [0:1023];
  reg [7:0] ways_0_data_symbol1 [0:1023];
  reg [7:0] ways_0_data_symbol2 [0:1023];
  reg [7:0] ways_0_data_symbol3 [0:1023];
  reg [7:0] zz_22_;
  reg [7:0] zz_23_;
  reg [7:0] zz_24_;
  reg [7:0] zz_25_;
  assign zz_12_ = (loader_valid && io_mem_rsp_valid);
  assign zz_13_ = ((((io_cpu_flush_valid && (! io_cpu_execute_isValid)) && (! io_cpu_memory_isValid)) && (! io_cpu_writeBack_isValid)) && (! io_cpu_redo));
  assign zz_14_ = ((! io_cpu_writeBack_isStuck) && (! stageB_mmuRspFreeze));
  assign zz_15_ = zz_4_[0 : 0];
  assign zz_16_ = zz_4_[1 : 1];
  assign zz_17_ = (! stageB_atomic_reserved);
  assign zz_18_ = loader_counter_willIncrement;
  assign zz_19_ = {2'd0, zz_18_};
  assign zz_20_ = {loader_waysAllocator,loader_waysAllocator[0]};
  assign zz_21_ = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  always @ (posedge clk) begin
    if(zz_2_) begin
      ways_0_tags[tagsWriteCmd_payload_address] <= zz_21_;
    end
  end

  always @ (posedge clk) begin
    if(zz_3_) begin
      zz_10_ <= ways_0_tags[tagsReadCmd_payload];
    end
  end

  always @ (*) begin
    zz_11_ = {zz_25_, zz_24_, zz_23_, zz_22_};
  end
  always @ (posedge clk) begin
    if(dataWriteCmd_payload_mask[0] && zz_1_) begin
      ways_0_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && zz_1_) begin
      ways_0_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && zz_1_) begin
      ways_0_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && zz_1_) begin
      ways_0_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
  end

  always @ (posedge clk) begin
    if(zz_5_) begin
      zz_22_ <= ways_0_data_symbol0[dataReadCmd_payload];
      zz_23_ <= ways_0_data_symbol1[dataReadCmd_payload];
      zz_24_ <= ways_0_data_symbol2[dataReadCmd_payload];
      zz_25_ <= ways_0_data_symbol3[dataReadCmd_payload];
    end
  end

  always @ (*) begin
    zz_1_ = 1'b0;
    if((dataWriteCmd_valid && dataWriteCmd_payload_way[0]))begin
      zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    zz_2_ = 1'b0;
    if((tagsWriteCmd_valid && tagsWriteCmd_payload_way[0]))begin
      zz_2_ = 1'b1;
    end
  end

  assign haltCpu = 1'b0;
  always @ (*) begin
    io_mem_cmd_valid = 1'b0;
    io_mem_cmd_payload_wr = 1'bx;
    io_mem_cmd_payload_address = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    io_mem_cmd_payload_data = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    io_mem_cmd_payload_mask = (4'bxxxx);
    io_mem_cmd_payload_length = (3'bxxx);
    io_mem_cmd_payload_last = 1'bx;
    tagsWriteCmd_valid = 1'b0;
    tagsWriteCmd_payload_way = (1'bx);
    tagsWriteCmd_payload_address = (7'bxxxxxxx);
    tagsWriteCmd_payload_data_valid = 1'bx;
    tagsWriteCmd_payload_data_error = 1'bx;
    tagsWriteCmd_payload_data_address = (20'bxxxxxxxxxxxxxxxxxxxx);
    dataWriteCmd_valid = 1'b0;
    dataWriteCmd_payload_way = (1'bx);
    dataWriteCmd_payload_address = (10'bxxxxxxxxxx);
    dataWriteCmd_payload_data = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    dataWriteCmd_payload_mask = (4'bxxxx);
    stageB_loaderValid = 1'b0;
    io_cpu_writeBack_haltIt = io_cpu_writeBack_isValid;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_valid = stageB_flusher_valid;
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
      tagsWriteCmd_payload_way = (1'b1);
      tagsWriteCmd_payload_data_valid = 1'b0;
      io_cpu_writeBack_haltIt = 1'b1;
    end
    io_cpu_redo = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if((stageB_request_forceUncachedAccess || stageB_mmuRsp_isIoAccess))begin
        if((stageB_request_wr ? io_mem_cmd_ready : io_mem_rsp_valid))begin
          io_cpu_writeBack_haltIt = 1'b0;
        end
        io_mem_cmd_valid = (! stageB_memCmdSent);
        io_mem_cmd_payload_wr = stageB_request_wr;
        io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],(2'b00)};
        io_mem_cmd_payload_mask = stageB_mask;
        io_mem_cmd_payload_data = stageB_request_data;
        io_mem_cmd_payload_length = (3'b000);
        io_mem_cmd_payload_last = 1'b1;
        if((stageB_request_isAtomic && (! stageB_atomic_reserved)))begin
          io_mem_cmd_valid = 1'b0;
          io_cpu_writeBack_haltIt = 1'b0;
        end
      end else begin
        if((stageB_waysHit || stageB_request_wr))begin
          if((stageB_request_wr && stageB_waysHit))begin
            dataWriteCmd_valid = 1'b1;
          end
          dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 2];
          dataWriteCmd_payload_data = stageB_request_data;
          dataWriteCmd_payload_mask = stageB_mask;
          dataWriteCmd_payload_way = stageB_waysHits;
          if(stageB_request_wr)begin
            io_mem_cmd_valid = 1'b1;
          end
          io_mem_cmd_payload_wr = 1'b1;
          io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],(2'b00)};
          io_mem_cmd_payload_mask = stageB_mask;
          io_mem_cmd_payload_data = stageB_request_data;
          io_mem_cmd_payload_length = (3'b000);
          io_mem_cmd_payload_last = 1'b1;
          if(((! stageB_request_wr) || io_mem_cmd_ready))begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
          io_cpu_redo = ((! stageB_request_wr) && ((stageB_colisions & stageB_waysHits) != (1'b0)));
          if((stageB_request_isAtomic && (! stageB_atomic_reserved)))begin
            io_mem_cmd_valid = 1'b0;
            dataWriteCmd_valid = 1'b0;
            io_cpu_writeBack_haltIt = 1'b0;
          end
        end else begin
          if((! stageB_memCmdSent))begin
            io_mem_cmd_valid = 1'b1;
          end
          io_mem_cmd_payload_wr = 1'b0;
          io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 5],(5'b00000)};
          io_mem_cmd_payload_length = (3'b111);
          io_mem_cmd_payload_last = 1'b1;
          if(io_mem_cmd_ready)begin
            stageB_loaderValid = 1'b1;
          end
        end
      end
    end
    if((((stageB_mmuRsp_refilling || io_cpu_writeBack_accessError) || io_cpu_writeBack_mmuException) || io_cpu_writeBack_unalignedAccess))begin
      io_mem_cmd_valid = 1'b0;
      tagsWriteCmd_valid = 1'b0;
      dataWriteCmd_valid = 1'b0;
      stageB_loaderValid = 1'b0;
      io_cpu_writeBack_haltIt = 1'b0;
    end
    if((io_cpu_writeBack_isValid && stageB_mmuRsp_refilling))begin
      io_cpu_redo = 1'b1;
    end
    loader_counter_willIncrement = 1'b0;
    if(zz_12_)begin
      dataWriteCmd_valid = 1'b1;
      dataWriteCmd_payload_address = {stageB_mmuRsp_physicalAddress[11 : 5],loader_counter_value};
      dataWriteCmd_payload_data = io_mem_rsp_payload_data;
      dataWriteCmd_payload_mask = (4'b1111);
      dataWriteCmd_payload_way = loader_waysAllocator;
      loader_counter_willIncrement = 1'b1;
    end
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_valid = 1'b1;
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
      tagsWriteCmd_payload_data_valid = 1'b1;
      tagsWriteCmd_payload_data_address = stageB_mmuRsp_physicalAddress[31 : 12];
      tagsWriteCmd_payload_data_error = (loader_error || io_mem_rsp_payload_error);
      tagsWriteCmd_payload_way = loader_waysAllocator;
    end
    if(loader_valid)begin
      io_cpu_redo = 1'b1;
    end
  end

  assign zz_3_ = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign zz_4_ = zz_10_;
  assign ways_0_tagsReadRsp_valid = zz_15_[0];
  assign ways_0_tagsReadRsp_error = zz_16_[0];
  assign ways_0_tagsReadRsp_address = zz_4_[21 : 2];
  assign zz_5_ = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_0_dataReadRsp = zz_11_;
  always @ (*) begin
    tagsReadCmd_valid = 1'b0;
    tagsReadCmd_payload = (7'bxxxxxxx);
    dataReadCmd_valid = 1'b0;
    dataReadCmd_payload = (10'bxxxxxxxxxx);
    if((io_cpu_execute_isValid && (! io_cpu_memory_isStuck)))begin
      tagsReadCmd_valid = 1'b1;
      dataReadCmd_valid = 1'b1;
      tagsReadCmd_payload = io_cpu_execute_address[11 : 5];
      dataReadCmd_payload = io_cpu_execute_address[11 : 2];
    end
  end

  always @ (*) begin
    case(io_cpu_execute_args_size)
      2'b00 : begin
        zz_6_ = (4'b0001);
      end
      2'b01 : begin
        zz_6_ = (4'b0011);
      end
      default : begin
        zz_6_ = (4'b1111);
      end
    endcase
  end

  assign stage0_mask = (zz_6_ <<< io_cpu_execute_address[1 : 0]);
  assign stage0_colisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == io_cpu_execute_address[11 : 2])) && ((stage0_mask & dataWriteCmd_payload_mask) != (4'b0000)));
  assign io_cpu_memory_mmuBus_cmd_isValid = io_cpu_memory_isValid;
  assign io_cpu_memory_mmuBus_cmd_virtualAddress = io_cpu_memory_address;
  assign io_cpu_memory_mmuBus_cmd_bypassTranslation = 1'b0;
  assign io_cpu_memory_mmuBus_end = ((! io_cpu_memory_isStuck) || io_cpu_memory_isRemoved);
  assign stageA_wayHits_0 = ((io_cpu_memory_mmuBus_rsp_physicalAddress[31 : 12] == ways_0_tagsReadRsp_address) && ways_0_tagsReadRsp_valid);
  assign zz_7_[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == io_cpu_memory_address[11 : 2])) && ((stageA_mask & dataWriteCmd_payload_mask) != (4'b0000)));
  assign stageA_colisions = (stage0_colisions_regNextWhen | zz_7_);
  always @ (*) begin
    stageB_mmuRspFreeze = 1'b0;
    if((stageB_loaderValid || loader_valid))begin
      stageB_mmuRspFreeze = 1'b1;
    end
  end

  assign zz_8_[0] = stageA_wayHits_0;
  assign stageB_waysHit = (stageB_waysHits != (1'b0));
  assign stageB_dataMux = stageB_dataReadRsp_0;
  always @ (*) begin
    io_cpu_flush_ready = 1'b0;
    if(zz_13_)begin
      io_cpu_flush_ready = 1'b1;
    end
  end

  always @ (*) begin
    io_cpu_writeBack_accessError = 1'b0;
    if((stageB_request_forceUncachedAccess || stageB_mmuRsp_isIoAccess))begin
      io_cpu_writeBack_data = io_mem_rsp_payload_data;
      io_cpu_writeBack_accessError = (io_mem_rsp_valid && io_mem_rsp_payload_error);
    end else begin
      io_cpu_writeBack_data = stageB_dataMux;
      io_cpu_writeBack_accessError = ((stageB_waysHits & zz_9_) != (1'b0));
    end
    if((stageB_request_isAtomic && stageB_request_wr))begin
      io_cpu_writeBack_data = {31'd0, zz_17_};
    end
  end

  assign io_cpu_writeBack_mmuException = (io_cpu_writeBack_isValid && ((stageB_mmuRsp_exception || ((! stageB_mmuRsp_allowWrite) && stageB_request_wr)) || ((! stageB_mmuRsp_allowRead) && (! stageB_request_wr))));
  assign io_cpu_writeBack_unalignedAccess = (io_cpu_writeBack_isValid && (((stageB_request_size == (2'b10)) && (stageB_mmuRsp_physicalAddress[1 : 0] != (2'b00))) || ((stageB_request_size == (2'b01)) && (stageB_mmuRsp_physicalAddress[0 : 0] != (1'b0)))));
  assign io_cpu_writeBack_isWrite = stageB_request_wr;
  assign zz_9_[0] = stageB_tagsReadRsp_0_error;
  assign loader_counter_willClear = 1'b0;
  assign loader_counter_willOverflowIfInc = (loader_counter_value == (3'b111));
  assign loader_counter_willOverflow = (loader_counter_willOverflowIfInc && loader_counter_willIncrement);
  always @ (*) begin
    loader_counter_valueNext = (loader_counter_value + zz_19_);
    if(loader_counter_willClear)begin
      loader_counter_valueNext = (3'b000);
    end
  end

  always @ (posedge clk) begin
    tagsWriteLastCmd_valid <= tagsWriteCmd_valid;
    tagsWriteLastCmd_payload_way <= tagsWriteCmd_payload_way;
    tagsWriteLastCmd_payload_address <= tagsWriteCmd_payload_address;
    tagsWriteLastCmd_payload_data_valid <= tagsWriteCmd_payload_data_valid;
    tagsWriteLastCmd_payload_data_error <= tagsWriteCmd_payload_data_error;
    tagsWriteLastCmd_payload_data_address <= tagsWriteCmd_payload_data_address;
    if((! io_cpu_memory_isStuck))begin
      stageA_request_wr <= io_cpu_execute_args_wr;
      stageA_request_data <= io_cpu_execute_args_data;
      stageA_request_size <= io_cpu_execute_args_size;
      stageA_request_forceUncachedAccess <= io_cpu_execute_args_forceUncachedAccess;
      stageA_request_isAtomic <= io_cpu_execute_args_isAtomic;
    end
    if((! io_cpu_memory_isStuck))begin
      stageA_mask <= stage0_mask;
    end
    if((! io_cpu_memory_isStuck))begin
      stage0_colisions_regNextWhen <= stage0_colisions;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_request_wr <= stageA_request_wr;
      stageB_request_data <= stageA_request_data;
      stageB_request_size <= stageA_request_size;
      stageB_request_forceUncachedAccess <= stageA_request_forceUncachedAccess;
      stageB_request_isAtomic <= stageA_request_isAtomic;
    end
    if(zz_14_)begin
      stageB_mmuRsp_isIoAccess <= io_cpu_memory_mmuBus_rsp_isIoAccess;
      stageB_mmuRsp_allowRead <= io_cpu_memory_mmuBus_rsp_allowRead;
      stageB_mmuRsp_allowWrite <= io_cpu_memory_mmuBus_rsp_allowWrite;
      stageB_mmuRsp_allowExecute <= io_cpu_memory_mmuBus_rsp_allowExecute;
      stageB_mmuRsp_exception <= io_cpu_memory_mmuBus_rsp_exception;
      stageB_mmuRsp_refilling <= io_cpu_memory_mmuBus_rsp_refilling;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_tagsReadRsp_0_valid <= ways_0_tagsReadRsp_valid;
      stageB_tagsReadRsp_0_error <= ways_0_tagsReadRsp_error;
      stageB_tagsReadRsp_0_address <= ways_0_tagsReadRsp_address;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_dataReadRsp_0 <= ways_0_dataReadRsp;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_waysHits <= zz_8_;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_mask <= stageA_mask;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_colisions <= stageA_colisions;
    end
    if(!(! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))) begin
      $display("ERROR writeBack stuck by another plugin is not allowed");
    end
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      stageB_flusher_valid <= 1'b1;
      stageB_mmuRsp_physicalAddress <= (32'b00000000000000000000000000000000);
      stageB_atomic_reserved <= 1'b0;
      stageB_memCmdSent <= 1'b0;
      loader_valid <= 1'b0;
      loader_counter_value <= (3'b000);
      loader_waysAllocator <= (1'b1);
      loader_error <= 1'b0;
    end else begin
      if(zz_14_)begin
        stageB_mmuRsp_physicalAddress <= io_cpu_memory_mmuBus_rsp_physicalAddress;
      end
      if(stageB_flusher_valid)begin
        if((stageB_mmuRsp_physicalAddress[11 : 5] != (7'b1111111)))begin
          stageB_mmuRsp_physicalAddress[11 : 5] <= (stageB_mmuRsp_physicalAddress[11 : 5] + (7'b0000001));
        end else begin
          stageB_flusher_valid <= 1'b0;
        end
      end
      if(zz_13_)begin
        stageB_mmuRsp_physicalAddress[11 : 5] <= (7'b0000000);
        stageB_flusher_valid <= 1'b1;
      end
      if(((((io_cpu_writeBack_isValid && (! io_cpu_writeBack_isStuck)) && (! io_cpu_redo)) && stageB_request_isAtomic) && (! stageB_request_wr)))begin
        stageB_atomic_reserved <= 1'b1;
      end
      if(io_cpu_writeBack_clearAtomicEntries)begin
        stageB_atomic_reserved <= 1'b0;
      end
      if(io_mem_cmd_ready)begin
        stageB_memCmdSent <= 1'b1;
      end
      if((! io_cpu_writeBack_isStuck))begin
        stageB_memCmdSent <= 1'b0;
      end
      if(stageB_loaderValid)begin
        loader_valid <= 1'b1;
      end
      loader_counter_value <= loader_counter_valueNext;
      if(zz_12_)begin
        loader_error <= (loader_error || io_mem_rsp_payload_error);
      end
      if(loader_counter_willOverflow)begin
        loader_valid <= 1'b0;
        loader_waysAllocator <= zz_20_[0:0];
        loader_error <= 1'b0;
      end
    end
  end

endmodule

module VexRiscv (
      input   timerInterrupt,
      input   externalInterrupt,
      input   softwareInterrupt,
      input   externalInterruptS,
      input   debug_bus_cmd_valid,
      output reg  debug_bus_cmd_ready,
      input   debug_bus_cmd_payload_wr,
      input  [7:0] debug_bus_cmd_payload_address,
      input  [31:0] debug_bus_cmd_payload_data,
      output reg [31:0] debug_bus_rsp_data,
      output  debug_resetOut,
      output  iBus_cmd_valid,
      input   iBus_cmd_ready,
      output reg [31:0] iBus_cmd_payload_address,
      output [2:0] iBus_cmd_payload_size,
      input   iBus_rsp_valid,
      input  [31:0] iBus_rsp_payload_data,
      input   iBus_rsp_payload_error,
      output  dBus_cmd_valid,
      input   dBus_cmd_ready,
      output  dBus_cmd_payload_wr,
      output [31:0] dBus_cmd_payload_address,
      output [31:0] dBus_cmd_payload_data,
      output [3:0] dBus_cmd_payload_mask,
      output [2:0] dBus_cmd_payload_length,
      output  dBus_cmd_payload_last,
      input   dBus_rsp_valid,
      input  [31:0] dBus_rsp_payload_data,
      input   dBus_rsp_payload_error,
      input   clk,
      input   reset,
      input   debugReset);
  wire  zz_234_;
  wire  zz_235_;
  wire  zz_236_;
  wire  zz_237_;
  wire  zz_238_;
  wire [31:0] zz_239_;
  wire  zz_240_;
  wire  zz_241_;
  wire  zz_242_;
  reg  zz_243_;
  reg [31:0] zz_244_;
  reg  zz_245_;
  reg [31:0] zz_246_;
  reg [1:0] zz_247_;
  reg  zz_248_;
  reg  zz_249_;
  reg  zz_250_;
  wire [31:0] zz_251_;
  reg  zz_252_;
  wire  zz_253_;
  wire [31:0] zz_254_;
  wire  zz_255_;
  wire  zz_256_;
  reg [31:0] zz_257_;
  reg [31:0] zz_258_;
  reg [31:0] zz_259_;
  reg  zz_260_;
  reg  zz_261_;
  reg  zz_262_;
  reg [9:0] zz_263_;
  reg [9:0] zz_264_;
  reg [9:0] zz_265_;
  reg [9:0] zz_266_;
  reg  zz_267_;
  reg  zz_268_;
  reg  zz_269_;
  reg  zz_270_;
  reg  zz_271_;
  reg  zz_272_;
  reg  zz_273_;
  reg [9:0] zz_274_;
  reg [9:0] zz_275_;
  reg [9:0] zz_276_;
  reg [9:0] zz_277_;
  reg  zz_278_;
  reg  zz_279_;
  reg  zz_280_;
  reg  zz_281_;
  wire  IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end;
  wire  IBusCachedPlugin_cache_io_cpu_decode_error;
  wire  IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling;
  wire  IBusCachedPlugin_cache_io_cpu_decode_mmuException;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_decode_data;
  wire  IBusCachedPlugin_cache_io_cpu_decode_cacheMiss;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_decode_physicalAddress;
  wire  IBusCachedPlugin_cache_io_mem_cmd_valid;
  wire [31:0] IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  wire [2:0] IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  wire  dataCache_1__io_cpu_memory_mmuBus_cmd_isValid;
  wire [31:0] dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress;
  wire  dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation;
  wire  dataCache_1__io_cpu_memory_mmuBus_end;
  wire  dataCache_1__io_cpu_writeBack_haltIt;
  wire [31:0] dataCache_1__io_cpu_writeBack_data;
  wire  dataCache_1__io_cpu_writeBack_mmuException;
  wire  dataCache_1__io_cpu_writeBack_unalignedAccess;
  wire  dataCache_1__io_cpu_writeBack_accessError;
  wire  dataCache_1__io_cpu_writeBack_isWrite;
  wire  dataCache_1__io_cpu_flush_ready;
  wire  dataCache_1__io_cpu_redo;
  wire  dataCache_1__io_mem_cmd_valid;
  wire  dataCache_1__io_mem_cmd_payload_wr;
  wire [31:0] dataCache_1__io_mem_cmd_payload_address;
  wire [31:0] dataCache_1__io_mem_cmd_payload_data;
  wire [3:0] dataCache_1__io_mem_cmd_payload_mask;
  wire [2:0] dataCache_1__io_mem_cmd_payload_length;
  wire  dataCache_1__io_mem_cmd_payload_last;
  wire  zz_282_;
  wire  zz_283_;
  wire  zz_284_;
  wire  zz_285_;
  wire  zz_286_;
  wire [1:0] zz_287_;
  wire  zz_288_;
  wire  zz_289_;
  wire  zz_290_;
  wire  zz_291_;
  wire  zz_292_;
  wire [5:0] zz_293_;
  wire  zz_294_;
  wire  zz_295_;
  wire  zz_296_;
  wire  zz_297_;
  wire  zz_298_;
  wire  zz_299_;
  wire  zz_300_;
  wire  zz_301_;
  wire  zz_302_;
  wire  zz_303_;
  wire  zz_304_;
  wire  zz_305_;
  wire  zz_306_;
  wire  zz_307_;
  wire  zz_308_;
  wire [4:0] zz_309_;
  wire [1:0] zz_310_;
  wire [1:0] zz_311_;
  wire [1:0] zz_312_;
  wire [1:0] zz_313_;
  wire [1:0] zz_314_;
  wire  zz_315_;
  wire [3:0] zz_316_;
  wire [2:0] zz_317_;
  wire [31:0] zz_318_;
  wire [2:0] zz_319_;
  wire [31:0] zz_320_;
  wire [31:0] zz_321_;
  wire [11:0] zz_322_;
  wire [11:0] zz_323_;
  wire [2:0] zz_324_;
  wire [31:0] zz_325_;
  wire [2:0] zz_326_;
  wire [2:0] zz_327_;
  wire [0:0] zz_328_;
  wire [0:0] zz_329_;
  wire [0:0] zz_330_;
  wire [0:0] zz_331_;
  wire [0:0] zz_332_;
  wire [0:0] zz_333_;
  wire [0:0] zz_334_;
  wire [0:0] zz_335_;
  wire [0:0] zz_336_;
  wire [0:0] zz_337_;
  wire [0:0] zz_338_;
  wire [0:0] zz_339_;
  wire [0:0] zz_340_;
  wire [0:0] zz_341_;
  wire [0:0] zz_342_;
  wire [0:0] zz_343_;
  wire [0:0] zz_344_;
  wire [0:0] zz_345_;
  wire [0:0] zz_346_;
  wire [0:0] zz_347_;
  wire [0:0] zz_348_;
  wire [2:0] zz_349_;
  wire [4:0] zz_350_;
  wire [11:0] zz_351_;
  wire [11:0] zz_352_;
  wire [31:0] zz_353_;
  wire [31:0] zz_354_;
  wire [31:0] zz_355_;
  wire [31:0] zz_356_;
  wire [1:0] zz_357_;
  wire [31:0] zz_358_;
  wire [1:0] zz_359_;
  wire [1:0] zz_360_;
  wire [32:0] zz_361_;
  wire [31:0] zz_362_;
  wire [32:0] zz_363_;
  wire [51:0] zz_364_;
  wire [51:0] zz_365_;
  wire [51:0] zz_366_;
  wire [32:0] zz_367_;
  wire [51:0] zz_368_;
  wire [49:0] zz_369_;
  wire [51:0] zz_370_;
  wire [49:0] zz_371_;
  wire [51:0] zz_372_;
  wire [65:0] zz_373_;
  wire [65:0] zz_374_;
  wire [31:0] zz_375_;
  wire [31:0] zz_376_;
  wire [0:0] zz_377_;
  wire [5:0] zz_378_;
  wire [32:0] zz_379_;
  wire [32:0] zz_380_;
  wire [31:0] zz_381_;
  wire [31:0] zz_382_;
  wire [32:0] zz_383_;
  wire [32:0] zz_384_;
  wire [32:0] zz_385_;
  wire [0:0] zz_386_;
  wire [32:0] zz_387_;
  wire [0:0] zz_388_;
  wire [32:0] zz_389_;
  wire [0:0] zz_390_;
  wire [31:0] zz_391_;
  wire [1:0] zz_392_;
  wire [1:0] zz_393_;
  wire [19:0] zz_394_;
  wire [11:0] zz_395_;
  wire [11:0] zz_396_;
  wire [0:0] zz_397_;
  wire [1:0] zz_398_;
  wire [0:0] zz_399_;
  wire [1:0] zz_400_;
  wire [0:0] zz_401_;
  wire [0:0] zz_402_;
  wire [0:0] zz_403_;
  wire [0:0] zz_404_;
  wire [0:0] zz_405_;
  wire [0:0] zz_406_;
  wire [0:0] zz_407_;
  wire [0:0] zz_408_;
  wire [0:0] zz_409_;
  wire [0:0] zz_410_;
  wire [0:0] zz_411_;
  wire [0:0] zz_412_;
  wire [0:0] zz_413_;
  wire [0:0] zz_414_;
  wire [0:0] zz_415_;
  wire [0:0] zz_416_;
  wire [0:0] zz_417_;
  wire [0:0] zz_418_;
  wire [0:0] zz_419_;
  wire [0:0] zz_420_;
  wire [0:0] zz_421_;
  wire [0:0] zz_422_;
  wire [0:0] zz_423_;
  wire [0:0] zz_424_;
  wire [0:0] zz_425_;
  wire [0:0] zz_426_;
  wire [0:0] zz_427_;
  wire [0:0] zz_428_;
  wire [0:0] zz_429_;
  wire [0:0] zz_430_;
  wire [0:0] zz_431_;
  wire [0:0] zz_432_;
  wire [0:0] zz_433_;
  wire [0:0] zz_434_;
  wire [0:0] zz_435_;
  wire [0:0] zz_436_;
  wire [0:0] zz_437_;
  wire [0:0] zz_438_;
  wire [0:0] zz_439_;
  wire [0:0] zz_440_;
  wire [0:0] zz_441_;
  wire [0:0] zz_442_;
  wire [0:0] zz_443_;
  wire [0:0] zz_444_;
  wire [0:0] zz_445_;
  wire [0:0] zz_446_;
  wire [0:0] zz_447_;
  wire [0:0] zz_448_;
  wire [0:0] zz_449_;
  wire [0:0] zz_450_;
  wire [0:0] zz_451_;
  wire [0:0] zz_452_;
  wire [0:0] zz_453_;
  wire [0:0] zz_454_;
  wire  zz_455_;
  wire  zz_456_;
  wire [1:0] zz_457_;
  wire  zz_458_;
  wire  zz_459_;
  wire [6:0] zz_460_;
  wire [4:0] zz_461_;
  wire  zz_462_;
  wire [4:0] zz_463_;
  wire [31:0] zz_464_;
  wire  zz_465_;
  wire [0:0] zz_466_;
  wire [0:0] zz_467_;
  wire [0:0] zz_468_;
  wire [0:0] zz_469_;
  wire  zz_470_;
  wire [0:0] zz_471_;
  wire [28:0] zz_472_;
  wire [31:0] zz_473_;
  wire [31:0] zz_474_;
  wire [0:0] zz_475_;
  wire [2:0] zz_476_;
  wire [0:0] zz_477_;
  wire [5:0] zz_478_;
  wire [5:0] zz_479_;
  wire [5:0] zz_480_;
  wire  zz_481_;
  wire [0:0] zz_482_;
  wire [25:0] zz_483_;
  wire [31:0] zz_484_;
  wire [31:0] zz_485_;
  wire [31:0] zz_486_;
  wire  zz_487_;
  wire  zz_488_;
  wire [31:0] zz_489_;
  wire [31:0] zz_490_;
  wire  zz_491_;
  wire [0:0] zz_492_;
  wire [2:0] zz_493_;
  wire [31:0] zz_494_;
  wire [31:0] zz_495_;
  wire  zz_496_;
  wire [0:0] zz_497_;
  wire [2:0] zz_498_;
  wire [31:0] zz_499_;
  wire [31:0] zz_500_;
  wire  zz_501_;
  wire [4:0] zz_502_;
  wire [4:0] zz_503_;
  wire  zz_504_;
  wire [0:0] zz_505_;
  wire [22:0] zz_506_;
  wire [31:0] zz_507_;
  wire [31:0] zz_508_;
  wire [31:0] zz_509_;
  wire [31:0] zz_510_;
  wire [31:0] zz_511_;
  wire  zz_512_;
  wire [0:0] zz_513_;
  wire [0:0] zz_514_;
  wire [31:0] zz_515_;
  wire [31:0] zz_516_;
  wire [31:0] zz_517_;
  wire  zz_518_;
  wire [0:0] zz_519_;
  wire [0:0] zz_520_;
  wire [31:0] zz_521_;
  wire  zz_522_;
  wire [0:0] zz_523_;
  wire [2:0] zz_524_;
  wire  zz_525_;
  wire [1:0] zz_526_;
  wire [1:0] zz_527_;
  wire  zz_528_;
  wire [0:0] zz_529_;
  wire [20:0] zz_530_;
  wire [31:0] zz_531_;
  wire [31:0] zz_532_;
  wire [31:0] zz_533_;
  wire [31:0] zz_534_;
  wire [31:0] zz_535_;
  wire [31:0] zz_536_;
  wire [31:0] zz_537_;
  wire [31:0] zz_538_;
  wire [31:0] zz_539_;
  wire [31:0] zz_540_;
  wire [31:0] zz_541_;
  wire  zz_542_;
  wire [0:0] zz_543_;
  wire [0:0] zz_544_;
  wire [31:0] zz_545_;
  wire  zz_546_;
  wire  zz_547_;
  wire [0:0] zz_548_;
  wire [0:0] zz_549_;
  wire  zz_550_;
  wire [0:0] zz_551_;
  wire [18:0] zz_552_;
  wire [31:0] zz_553_;
  wire [31:0] zz_554_;
  wire [31:0] zz_555_;
  wire [31:0] zz_556_;
  wire [0:0] zz_557_;
  wire [0:0] zz_558_;
  wire [2:0] zz_559_;
  wire [2:0] zz_560_;
  wire  zz_561_;
  wire [0:0] zz_562_;
  wire [15:0] zz_563_;
  wire [31:0] zz_564_;
  wire [31:0] zz_565_;
  wire [31:0] zz_566_;
  wire [31:0] zz_567_;
  wire  zz_568_;
  wire  zz_569_;
  wire  zz_570_;
  wire  zz_571_;
  wire [1:0] zz_572_;
  wire [1:0] zz_573_;
  wire  zz_574_;
  wire [0:0] zz_575_;
  wire [12:0] zz_576_;
  wire [31:0] zz_577_;
  wire [31:0] zz_578_;
  wire [31:0] zz_579_;
  wire [31:0] zz_580_;
  wire  zz_581_;
  wire [0:0] zz_582_;
  wire [0:0] zz_583_;
  wire [0:0] zz_584_;
  wire [0:0] zz_585_;
  wire [0:0] zz_586_;
  wire [0:0] zz_587_;
  wire  zz_588_;
  wire [0:0] zz_589_;
  wire [9:0] zz_590_;
  wire [31:0] zz_591_;
  wire [31:0] zz_592_;
  wire [31:0] zz_593_;
  wire [31:0] zz_594_;
  wire [31:0] zz_595_;
  wire  zz_596_;
  wire [0:0] zz_597_;
  wire [0:0] zz_598_;
  wire  zz_599_;
  wire [0:0] zz_600_;
  wire [6:0] zz_601_;
  wire [31:0] zz_602_;
  wire [31:0] zz_603_;
  wire [0:0] zz_604_;
  wire [0:0] zz_605_;
  wire [0:0] zz_606_;
  wire [0:0] zz_607_;
  wire [1:0] zz_608_;
  wire [1:0] zz_609_;
  wire  zz_610_;
  wire [0:0] zz_611_;
  wire [2:0] zz_612_;
  wire [31:0] zz_613_;
  wire [31:0] zz_614_;
  wire [31:0] zz_615_;
  wire [31:0] zz_616_;
  wire [31:0] zz_617_;
  wire [31:0] zz_618_;
  wire  zz_619_;
  wire [0:0] zz_620_;
  wire [2:0] zz_621_;
  wire [0:0] zz_622_;
  wire [1:0] zz_623_;
  wire [0:0] zz_624_;
  wire [0:0] zz_625_;
  wire  zz_626_;
  wire  zz_627_;
  wire [31:0] zz_628_;
  wire [31:0] zz_629_;
  wire [31:0] zz_630_;
  wire  zz_631_;
  wire [31:0] zz_632_;
  wire [31:0] zz_633_;
  wire [31:0] zz_634_;
  wire [31:0] zz_635_;
  wire [31:0] zz_636_;
  wire [31:0] zz_637_;
  wire [31:0] zz_638_;
  wire [31:0] zz_639_;
  wire [31:0] zz_640_;
  wire [31:0] zz_641_;
  wire [31:0] zz_642_;
  wire [31:0] zz_643_;
  wire [31:0] zz_644_;
  wire  zz_645_;
  wire [0:0] zz_646_;
  wire [16:0] zz_647_;
  wire [31:0] zz_648_;
  wire [31:0] zz_649_;
  wire [31:0] zz_650_;
  wire  zz_651_;
  wire [0:0] zz_652_;
  wire [10:0] zz_653_;
  wire [31:0] zz_654_;
  wire [31:0] zz_655_;
  wire [31:0] zz_656_;
  wire  zz_657_;
  wire [0:0] zz_658_;
  wire [4:0] zz_659_;
  wire [31:0] zz_660_;
  wire [31:0] zz_661_;
  wire [31:0] zz_662_;
  wire [31:0] zz_663_;
  wire [31:0] zz_664_;
  wire `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type zz_1_;
  wire `BranchCtrlEnum_defaultEncoding_type zz_2_;
  wire `BranchCtrlEnum_defaultEncoding_type zz_3_;
  wire [31:0] decode_SRC1;
  wire  decode_IS_SFENCE_VMA;
  wire  memory_MEMORY_WR;
  wire  decode_MEMORY_WR;
  wire  decode_CSR_WRITE_OPCODE;
  wire [33:0] memory_MUL_HH;
  wire [33:0] execute_MUL_HH;
  wire  decode_MEMORY_ATOMIC;
  wire  decode_IS_CSR;
  wire [31:0] memory_PC;
  wire  decode_IS_DIV;
  wire  decode_BYPASSABLE_EXECUTE_STAGE;
  wire `EnvCtrlEnum_defaultEncoding_type zz_4_;
  wire `EnvCtrlEnum_defaultEncoding_type zz_5_;
  wire `EnvCtrlEnum_defaultEncoding_type zz_6_;
  wire `EnvCtrlEnum_defaultEncoding_type zz_7_;
  wire `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type zz_8_;
  wire `EnvCtrlEnum_defaultEncoding_type zz_9_;
  wire `EnvCtrlEnum_defaultEncoding_type zz_10_;
  wire  decode_IS_RS2_SIGNED;
  wire  decode_MEMORY_MANAGMENT;
  wire [31:0] execute_SHIFT_RIGHT;
  wire [1:0] memory_MEMORY_ADDRESS_LOW;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire  decode_DO_EBREAK;
  wire [31:0] writeBack_FORMAL_PC_NEXT;
  wire [31:0] memory_FORMAL_PC_NEXT;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire [33:0] execute_MUL_LH;
  wire  decode_CSR_READ_OPCODE;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type zz_11_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type zz_12_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type zz_13_;
  wire  decode_IS_RS1_SIGNED;
  wire  memory_IS_MUL;
  wire  execute_IS_MUL;
  wire  decode_IS_MUL;
  wire `ShiftCtrlEnum_defaultEncoding_type zz_14_;
  wire `ShiftCtrlEnum_defaultEncoding_type zz_15_;
  wire `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type zz_16_;
  wire `ShiftCtrlEnum_defaultEncoding_type zz_17_;
  wire `ShiftCtrlEnum_defaultEncoding_type zz_18_;
  wire [31:0] execute_MUL_LL;
  wire [33:0] execute_MUL_HL;
  wire `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type zz_19_;
  wire `AluCtrlEnum_defaultEncoding_type zz_20_;
  wire `AluCtrlEnum_defaultEncoding_type zz_21_;
  wire  decode_SRC2_FORCE_ZERO;
  wire [31:0] execute_BRANCH_CALC;
  wire  execute_BYPASSABLE_MEMORY_STAGE;
  wire  decode_BYPASSABLE_MEMORY_STAGE;
  wire [51:0] memory_MUL_LOW;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire  execute_IS_DBUS_SHARING;
  wire  decode_SRC_LESS_UNSIGNED;
  wire  decode_MEMORY_ENABLE;
  wire  execute_BRANCH_DO;
  wire [31:0] decode_SRC2;
  wire  execute_IS_SFENCE_VMA;
  wire [31:0] memory_BRANCH_CALC;
  wire  memory_BRANCH_DO;
  wire [31:0] zz_22_;
  wire `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type zz_23_;
  wire  zz_24_;
  wire [31:0] execute_PC;
  wire  execute_DO_EBREAK;
  wire  decode_IS_EBREAK;
  wire  zz_25_;
  wire  execute_CSR_READ_OPCODE;
  wire  execute_CSR_WRITE_OPCODE;
  wire  execute_IS_CSR;
  wire `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type zz_26_;
  wire `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type zz_27_;
  wire  zz_28_;
  wire  zz_29_;
  wire `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type zz_30_;
  wire  execute_IS_RS1_SIGNED;
  wire [31:0] execute_RS1;
  wire  execute_IS_DIV;
  wire  execute_IS_RS2_SIGNED;
  wire  memory_IS_DIV;
  wire  writeBack_IS_MUL;
  wire [33:0] writeBack_MUL_HH;
  wire [51:0] writeBack_MUL_LOW;
  wire [33:0] memory_MUL_HL;
  wire [33:0] memory_MUL_LH;
  wire [31:0] memory_MUL_LL;
  wire [51:0] zz_31_;
  wire [33:0] zz_32_;
  wire [33:0] zz_33_;
  wire [33:0] zz_34_;
  wire [31:0] zz_35_;
  wire  decode_RS2_USE;
  wire  decode_RS1_USE;
  reg [31:0] zz_36_;
  wire  execute_REGFILE_WRITE_VALID;
  wire  execute_BYPASSABLE_EXECUTE_STAGE;
  wire  memory_REGFILE_WRITE_VALID;
  wire [31:0] memory_INSTRUCTION;
  wire  memory_BYPASSABLE_MEMORY_STAGE;
  wire  writeBack_REGFILE_WRITE_VALID;
  reg [31:0] decode_RS2;
  reg [31:0] decode_RS1;
  wire [31:0] memory_SHIFT_RIGHT;
  reg [31:0] zz_37_;
  wire `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type zz_38_;
  wire [31:0] zz_39_;
  wire `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type zz_40_;
  wire  zz_41_;
  wire [31:0] zz_42_;
  wire [31:0] zz_43_;
  wire  execute_SRC_LESS_UNSIGNED;
  wire  execute_SRC2_FORCE_ZERO;
  wire  execute_SRC_USE_SUB_LESS;
  wire [31:0] zz_44_;
  wire [31:0] zz_45_;
  wire `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type zz_46_;
  wire [31:0] zz_47_;
  wire [31:0] zz_48_;
  wire `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type zz_49_;
  wire [31:0] zz_50_;
  wire  decode_SRC_USE_SUB_LESS;
  wire  decode_SRC_ADD_ZERO;
  wire  zz_51_;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type zz_52_;
  wire [31:0] zz_53_;
  wire [31:0] execute_SRC2;
  wire [31:0] execute_SRC1;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type zz_54_;
  wire [31:0] zz_55_;
  wire  zz_56_;
  reg  zz_57_;
  wire [31:0] zz_58_;
  wire [31:0] zz_59_;
  wire [31:0] decode_INSTRUCTION_ANTICIPATED;
  reg  decode_REGFILE_WRITE_VALID;
  wire  decode_LEGAL_INSTRUCTION;
  wire  decode_INSTRUCTION_READY;
  wire  zz_60_;
  wire `Src2CtrlEnum_defaultEncoding_type zz_61_;
  wire  zz_62_;
  wire  zz_63_;
  wire  zz_64_;
  wire  zz_65_;
  wire  zz_66_;
  wire  zz_67_;
  wire  zz_68_;
  wire  zz_69_;
  wire  zz_70_;
  wire `AluCtrlEnum_defaultEncoding_type zz_71_;
  wire `ShiftCtrlEnum_defaultEncoding_type zz_72_;
  wire `BranchCtrlEnum_defaultEncoding_type zz_73_;
  wire  zz_74_;
  wire  zz_75_;
  wire `EnvCtrlEnum_defaultEncoding_type zz_76_;
  wire  zz_77_;
  wire  zz_78_;
  wire  zz_79_;
  wire  zz_80_;
  wire `Src1CtrlEnum_defaultEncoding_type zz_81_;
  wire  zz_82_;
  wire  zz_83_;
  wire  zz_84_;
  wire  zz_85_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type zz_86_;
  wire  zz_87_;
  wire  writeBack_IS_DBUS_SHARING;
  wire  memory_IS_DBUS_SHARING;
  wire  zz_88_;
  reg [31:0] zz_89_;
  wire [1:0] writeBack_MEMORY_ADDRESS_LOW;
  wire  writeBack_MEMORY_WR;
  wire [31:0] writeBack_REGFILE_WRITE_DATA;
  wire  writeBack_MEMORY_ENABLE;
  wire [31:0] memory_REGFILE_WRITE_DATA;
  wire  memory_MEMORY_ENABLE;
  wire [1:0] zz_90_;
  wire  execute_MEMORY_ATOMIC;
  wire  execute_MEMORY_MANAGMENT;
  wire [31:0] execute_RS2;
  wire  execute_MEMORY_WR;
  wire [31:0] execute_SRC_ADD;
  wire  execute_MEMORY_ENABLE;
  wire [31:0] execute_INSTRUCTION;
  wire  decode_FLUSH_ALL;
  reg  IBusCachedPlugin_rsp_issueDetected;
  reg  zz_91_;
  reg  zz_92_;
  reg [31:0] zz_93_;
  reg [31:0] zz_94_;
  wire [31:0] zz_95_;
  wire  zz_96_;
  wire [31:0] zz_97_;
  wire [31:0] zz_98_;
  wire [31:0] zz_99_;
  wire  decode_IS_RVC;
  wire [31:0] writeBack_PC /* verilator public */ ;
  wire [31:0] writeBack_INSTRUCTION /* verilator public */ ;
  wire [31:0] decode_PC /* verilator public */ ;
  wire [31:0] decode_INSTRUCTION /* verilator public */ ;
  reg  decode_arbitration_haltItself /* verilator public */ ;
  reg  decode_arbitration_haltByOther;
  reg  decode_arbitration_removeIt;
  reg  decode_arbitration_flushAll /* verilator public */ ;
  wire  decode_arbitration_redoIt;
  reg  decode_arbitration_isValid /* verilator public */ ;
  wire  decode_arbitration_isStuck;
  wire  decode_arbitration_isStuckByOthers;
  wire  decode_arbitration_isFlushed;
  wire  decode_arbitration_isMoving;
  wire  decode_arbitration_isFiring;
  reg  execute_arbitration_haltItself;
  reg  execute_arbitration_haltByOther;
  reg  execute_arbitration_removeIt;
  reg  execute_arbitration_flushAll;
  wire  execute_arbitration_redoIt;
  reg  execute_arbitration_isValid;
  wire  execute_arbitration_isStuck;
  wire  execute_arbitration_isStuckByOthers;
  wire  execute_arbitration_isFlushed;
  wire  execute_arbitration_isMoving;
  wire  execute_arbitration_isFiring;
  reg  memory_arbitration_haltItself;
  wire  memory_arbitration_haltByOther;
  reg  memory_arbitration_removeIt;
  reg  memory_arbitration_flushAll;
  wire  memory_arbitration_redoIt;
  reg  memory_arbitration_isValid;
  wire  memory_arbitration_isStuck;
  wire  memory_arbitration_isStuckByOthers;
  wire  memory_arbitration_isFlushed;
  wire  memory_arbitration_isMoving;
  wire  memory_arbitration_isFiring;
  reg  writeBack_arbitration_haltItself;
  wire  writeBack_arbitration_haltByOther;
  reg  writeBack_arbitration_removeIt;
  reg  writeBack_arbitration_flushAll;
  wire  writeBack_arbitration_redoIt;
  reg  writeBack_arbitration_isValid /* verilator public */ ;
  wire  writeBack_arbitration_isStuck;
  wire  writeBack_arbitration_isStuckByOthers;
  wire  writeBack_arbitration_isFlushed;
  wire  writeBack_arbitration_isMoving;
  wire  writeBack_arbitration_isFiring /* verilator public */ ;
  reg  IBusCachedPlugin_fetcherHalt;
  reg  IBusCachedPlugin_fetcherflushIt;
  reg  IBusCachedPlugin_incomingInstruction;
  wire  IBusCachedPlugin_pcValids_0;
  wire  IBusCachedPlugin_pcValids_1;
  wire  IBusCachedPlugin_pcValids_2;
  wire  IBusCachedPlugin_pcValids_3;
  wire  IBusCachedPlugin_redoBranch_valid;
  wire [31:0] IBusCachedPlugin_redoBranch_payload;
  reg  IBusCachedPlugin_decodeExceptionPort_valid;
  reg [3:0] IBusCachedPlugin_decodeExceptionPort_payload_code;
  wire [31:0] IBusCachedPlugin_decodeExceptionPort_payload_badAddr;
  wire  IBusCachedPlugin_mmuBus_cmd_isValid;
  wire [31:0] IBusCachedPlugin_mmuBus_cmd_virtualAddress;
  wire  IBusCachedPlugin_mmuBus_cmd_bypassTranslation;
  reg [31:0] IBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire  IBusCachedPlugin_mmuBus_rsp_isIoAccess;
  reg  IBusCachedPlugin_mmuBus_rsp_allowRead;
  reg  IBusCachedPlugin_mmuBus_rsp_allowWrite;
  reg  IBusCachedPlugin_mmuBus_rsp_allowExecute;
  reg  IBusCachedPlugin_mmuBus_rsp_exception;
  reg  IBusCachedPlugin_mmuBus_rsp_refilling;
  wire  IBusCachedPlugin_mmuBus_end;
  wire  DBusCachedPlugin_mmuBus_cmd_isValid;
  wire [31:0] DBusCachedPlugin_mmuBus_cmd_virtualAddress;
  reg  DBusCachedPlugin_mmuBus_cmd_bypassTranslation;
  reg [31:0] DBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire  DBusCachedPlugin_mmuBus_rsp_isIoAccess;
  reg  DBusCachedPlugin_mmuBus_rsp_allowRead;
  reg  DBusCachedPlugin_mmuBus_rsp_allowWrite;
  reg  DBusCachedPlugin_mmuBus_rsp_allowExecute;
  reg  DBusCachedPlugin_mmuBus_rsp_exception;
  reg  DBusCachedPlugin_mmuBus_rsp_refilling;
  wire  DBusCachedPlugin_mmuBus_end;
  reg  DBusCachedPlugin_redoBranch_valid;
  wire [31:0] DBusCachedPlugin_redoBranch_payload;
  reg  DBusCachedPlugin_exceptionBus_valid;
  reg [3:0] DBusCachedPlugin_exceptionBus_payload_code;
  wire [31:0] DBusCachedPlugin_exceptionBus_payload_badAddr;
  wire  decodeExceptionPort_valid;
  wire [3:0] decodeExceptionPort_payload_code;
  wire [31:0] decodeExceptionPort_payload_badAddr;
  reg  CsrPlugin_jumpInterface_valid;
  reg [31:0] CsrPlugin_jumpInterface_payload;
  reg  CsrPlugin_exceptionPending;
  wire  contextSwitching;
  reg [1:0] CsrPlugin_privilege;
  reg  CsrPlugin_selfException_valid;
  reg [3:0] CsrPlugin_selfException_payload_code;
  wire [31:0] CsrPlugin_selfException_payload_badAddr;
  reg  CsrPlugin_allowInterrupts;
  reg  CsrPlugin_allowException;
  reg  IBusCachedPlugin_injectionPort_valid;
  reg  IBusCachedPlugin_injectionPort_ready;
  wire [31:0] IBusCachedPlugin_injectionPort_payload;
  wire  BranchPlugin_jumpInterface_valid;
  wire [31:0] BranchPlugin_jumpInterface_payload;
  reg  MmuPlugin_dBusAccess_cmd_valid;
  reg  MmuPlugin_dBusAccess_cmd_ready;
  reg [31:0] MmuPlugin_dBusAccess_cmd_payload_address;
  wire [1:0] MmuPlugin_dBusAccess_cmd_payload_size;
  wire  MmuPlugin_dBusAccess_cmd_payload_write;
  wire [31:0] MmuPlugin_dBusAccess_cmd_payload_data;
  wire [3:0] MmuPlugin_dBusAccess_cmd_payload_writeMask;
  wire  MmuPlugin_dBusAccess_rsp_valid;
  wire [31:0] MmuPlugin_dBusAccess_rsp_payload_data;
  wire  MmuPlugin_dBusAccess_rsp_payload_error;
  wire  MmuPlugin_dBusAccess_rsp_payload_redo;
  wire  IBusCachedPlugin_jump_pcLoad_valid;
  wire [31:0] IBusCachedPlugin_jump_pcLoad_payload;
  wire [3:0] zz_100_;
  wire [3:0] zz_101_;
  wire  zz_102_;
  wire  zz_103_;
  wire  zz_104_;
  wire  IBusCachedPlugin_fetchPc_preOutput_valid;
  wire  IBusCachedPlugin_fetchPc_preOutput_ready;
  wire [31:0] IBusCachedPlugin_fetchPc_preOutput_payload;
  wire  zz_105_;
  wire  IBusCachedPlugin_fetchPc_output_valid;
  wire  IBusCachedPlugin_fetchPc_output_ready;
  wire [31:0] IBusCachedPlugin_fetchPc_output_payload;
  reg [31:0] IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg  IBusCachedPlugin_fetchPc_inc;
  reg  IBusCachedPlugin_fetchPc_propagatePc;
  reg [31:0] IBusCachedPlugin_fetchPc_pc;
  reg  IBusCachedPlugin_fetchPc_samplePcNext;
  reg  zz_106_;
  reg [31:0] IBusCachedPlugin_decodePc_pcReg /* verilator public */ ;
  wire [31:0] IBusCachedPlugin_decodePc_pcPlus;
  reg  IBusCachedPlugin_decodePc_injectedDecode;
  wire  IBusCachedPlugin_iBusRsp_stages_0_input_valid;
  wire  IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  wire  IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  wire  IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_stages_0_output_payload;
  reg  IBusCachedPlugin_iBusRsp_stages_0_halt;
  wire  IBusCachedPlugin_iBusRsp_stages_0_inputSample;
  wire  IBusCachedPlugin_iBusRsp_stages_1_input_valid;
  wire  IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  wire  IBusCachedPlugin_iBusRsp_stages_1_output_valid;
  wire  IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_stages_1_output_payload;
  wire  IBusCachedPlugin_iBusRsp_stages_1_halt;
  wire  IBusCachedPlugin_iBusRsp_stages_1_inputSample;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_valid;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_payload;
  reg  IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_inputSample;
  wire  zz_107_;
  wire  zz_108_;
  wire  zz_109_;
  wire  zz_110_;
  wire  zz_111_;
  reg  zz_112_;
  wire  zz_113_;
  reg  zz_114_;
  reg [31:0] zz_115_;
  reg  IBusCachedPlugin_iBusRsp_readyForError;
  wire  IBusCachedPlugin_iBusRsp_output_valid;
  wire  IBusCachedPlugin_iBusRsp_output_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_output_payload_pc;
  wire  IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
  wire [31:0] IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  wire  IBusCachedPlugin_iBusRsp_output_payload_isRvc;
  wire  IBusCachedPlugin_decompressor_inputBeforeStage_valid;
  wire  IBusCachedPlugin_decompressor_inputBeforeStage_ready;
  wire [31:0] IBusCachedPlugin_decompressor_inputBeforeStage_payload_pc;
  wire  IBusCachedPlugin_decompressor_inputBeforeStage_payload_rsp_error;
  wire [31:0] IBusCachedPlugin_decompressor_inputBeforeStage_payload_rsp_inst;
  wire  IBusCachedPlugin_decompressor_inputBeforeStage_payload_isRvc;
  reg  IBusCachedPlugin_decompressor_bufferValid;
  reg [15:0] IBusCachedPlugin_decompressor_bufferData;
  wire [31:0] IBusCachedPlugin_decompressor_raw;
  wire  IBusCachedPlugin_decompressor_isRvc;
  wire [15:0] zz_116_;
  reg [31:0] IBusCachedPlugin_decompressor_decompressed;
  wire [4:0] zz_117_;
  wire [4:0] zz_118_;
  wire [11:0] zz_119_;
  wire  zz_120_;
  reg [11:0] zz_121_;
  wire  zz_122_;
  reg [9:0] zz_123_;
  wire [20:0] zz_124_;
  wire  zz_125_;
  reg [14:0] zz_126_;
  wire  zz_127_;
  reg [2:0] zz_128_;
  wire  zz_129_;
  reg [9:0] zz_130_;
  wire [20:0] zz_131_;
  wire  zz_132_;
  reg [4:0] zz_133_;
  wire [12:0] zz_134_;
  wire [4:0] zz_135_;
  wire [4:0] zz_136_;
  wire [4:0] zz_137_;
  wire  zz_138_;
  reg [2:0] zz_139_;
  reg [2:0] zz_140_;
  wire  zz_141_;
  reg [6:0] zz_142_;
  wire  IBusCachedPlugin_injector_decodeInput_valid;
  wire  IBusCachedPlugin_injector_decodeInput_ready;
  wire [31:0] IBusCachedPlugin_injector_decodeInput_payload_pc;
  wire  IBusCachedPlugin_injector_decodeInput_payload_rsp_error;
  wire [31:0] IBusCachedPlugin_injector_decodeInput_payload_rsp_inst;
  wire  IBusCachedPlugin_injector_decodeInput_payload_isRvc;
  reg  zz_143_;
  reg [31:0] zz_144_;
  reg  zz_145_;
  reg [31:0] zz_146_;
  reg  zz_147_;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_0;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_1;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_2;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_3;
  reg  IBusCachedPlugin_injector_decodeRemoved;
  reg [31:0] IBusCachedPlugin_injector_formal_rawInDecode;
  wire  IBusCachedPlugin_s0_tightlyCoupledHit;
  reg  IBusCachedPlugin_s1_tightlyCoupledHit;
  reg  IBusCachedPlugin_s2_tightlyCoupledHit;
  wire  IBusCachedPlugin_rsp_iBusRspOutputHalt;
  reg  IBusCachedPlugin_rsp_redoFetch;
  wire  dataCache_1__io_mem_cmd_s2mPipe_valid;
  wire  dataCache_1__io_mem_cmd_s2mPipe_ready;
  wire  dataCache_1__io_mem_cmd_s2mPipe_payload_wr;
  wire [31:0] dataCache_1__io_mem_cmd_s2mPipe_payload_address;
  wire [31:0] dataCache_1__io_mem_cmd_s2mPipe_payload_data;
  wire [3:0] dataCache_1__io_mem_cmd_s2mPipe_payload_mask;
  wire [2:0] dataCache_1__io_mem_cmd_s2mPipe_payload_length;
  wire  dataCache_1__io_mem_cmd_s2mPipe_payload_last;
  reg  zz_148_;
  reg  zz_149_;
  reg [31:0] zz_150_;
  reg [31:0] zz_151_;
  reg [3:0] zz_152_;
  reg [2:0] zz_153_;
  reg  zz_154_;
  wire  dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_valid;
  wire  dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_ready;
  wire  dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_wr;
  wire [31:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_address;
  wire [31:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_data;
  wire [3:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_mask;
  wire [2:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_length;
  wire  dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_last;
  reg  zz_155_;
  reg  zz_156_;
  reg [31:0] zz_157_;
  reg [31:0] zz_158_;
  reg [3:0] zz_159_;
  reg [2:0] zz_160_;
  reg  zz_161_;
  reg  dBus_rsp_m2sPipe_valid;
  reg [31:0] dBus_rsp_m2sPipe_payload_data;
  reg  dBus_rsp_m2sPipe_payload_error;
  wire [1:0] execute_DBusCachedPlugin_size;
  reg [31:0] zz_162_;
  reg [31:0] writeBack_DBusCachedPlugin_rspShifted;
  wire  zz_163_;
  reg [31:0] zz_164_;
  wire  zz_165_;
  reg [31:0] zz_166_;
  reg [31:0] writeBack_DBusCachedPlugin_rspFormated;
  reg  DBusCachedPlugin_forceDatapath;
  wire [34:0] zz_167_;
  wire  zz_168_;
  wire  zz_169_;
  wire  zz_170_;
  wire  zz_171_;
  wire  zz_172_;
  wire  zz_173_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type zz_174_;
  wire `Src1CtrlEnum_defaultEncoding_type zz_175_;
  wire `EnvCtrlEnum_defaultEncoding_type zz_176_;
  wire `BranchCtrlEnum_defaultEncoding_type zz_177_;
  wire `ShiftCtrlEnum_defaultEncoding_type zz_178_;
  wire `AluCtrlEnum_defaultEncoding_type zz_179_;
  wire `Src2CtrlEnum_defaultEncoding_type zz_180_;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress1;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress2;
  wire [31:0] decode_RegFilePlugin_rs1Data;
  wire [31:0] decode_RegFilePlugin_rs2Data;
  reg  writeBack_RegFilePlugin_regFileWrite_valid /* verilator public */ ;
  wire [4:0] writeBack_RegFilePlugin_regFileWrite_payload_address /* verilator public */ ;
  wire [31:0] writeBack_RegFilePlugin_regFileWrite_payload_data /* verilator public */ ;
  reg  zz_181_;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] zz_182_;
  reg [31:0] zz_183_;
  wire  zz_184_;
  reg [19:0] zz_185_;
  wire  zz_186_;
  reg [19:0] zz_187_;
  reg [31:0] zz_188_;
  reg [31:0] execute_SrcPlugin_addSub;
  wire  execute_SrcPlugin_less;
  wire [4:0] execute_FullBarrelShifterPlugin_amplitude;
  reg [31:0] zz_189_;
  wire [31:0] execute_FullBarrelShifterPlugin_reversed;
  reg [31:0] zz_190_;
  reg  zz_191_;
  reg  zz_192_;
  wire  zz_193_;
  reg  zz_194_;
  reg [4:0] zz_195_;
  reg [31:0] zz_196_;
  wire  zz_197_;
  wire  zz_198_;
  wire  zz_199_;
  wire  zz_200_;
  wire  zz_201_;
  wire  zz_202_;
  reg  execute_MulPlugin_aSigned;
  reg  execute_MulPlugin_bSigned;
  wire [31:0] execute_MulPlugin_a;
  wire [31:0] execute_MulPlugin_b;
  wire [15:0] execute_MulPlugin_aULow;
  wire [15:0] execute_MulPlugin_bULow;
  wire [16:0] execute_MulPlugin_aSLow;
  wire [16:0] execute_MulPlugin_bSLow;
  wire [16:0] execute_MulPlugin_aHigh;
  wire [16:0] execute_MulPlugin_bHigh;
  wire [65:0] writeBack_MulPlugin_result;
  reg [32:0] memory_MulDivIterativePlugin_rs1;
  reg [31:0] memory_MulDivIterativePlugin_rs2;
  reg [64:0] memory_MulDivIterativePlugin_accumulator;
  reg  memory_MulDivIterativePlugin_div_needRevert;
  reg  memory_MulDivIterativePlugin_div_counter_willIncrement;
  reg  memory_MulDivIterativePlugin_div_counter_willClear;
  reg [5:0] memory_MulDivIterativePlugin_div_counter_valueNext;
  reg [5:0] memory_MulDivIterativePlugin_div_counter_value;
  wire  memory_MulDivIterativePlugin_div_counter_willOverflowIfInc;
  wire  memory_MulDivIterativePlugin_div_counter_willOverflow;
  reg  memory_MulDivIterativePlugin_div_done;
  reg [31:0] memory_MulDivIterativePlugin_div_result;
  wire [31:0] zz_203_;
  wire [32:0] zz_204_;
  wire [32:0] zz_205_;
  wire [31:0] zz_206_;
  wire  zz_207_;
  wire  zz_208_;
  reg [32:0] zz_209_;
  reg [1:0] CsrPlugin_misa_base;
  reg [25:0] CsrPlugin_misa_extensions;
  reg [1:0] CsrPlugin_mtvec_mode;
  reg [29:0] CsrPlugin_mtvec_base;
  reg [31:0] CsrPlugin_mepc;
  reg  CsrPlugin_mstatus_MIE;
  reg  CsrPlugin_mstatus_MPIE;
  reg [1:0] CsrPlugin_mstatus_MPP;
  reg  CsrPlugin_mip_MEIP;
  reg  CsrPlugin_mip_MTIP;
  reg  CsrPlugin_mip_MSIP;
  reg  CsrPlugin_mie_MEIE;
  reg  CsrPlugin_mie_MTIE;
  reg  CsrPlugin_mie_MSIE;
  reg [31:0] CsrPlugin_mscratch;
  reg  CsrPlugin_mcause_interrupt;
  reg [3:0] CsrPlugin_mcause_exceptionCode;
  reg [31:0] CsrPlugin_mtval;
  reg [63:0] CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg [63:0] CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg  CsrPlugin_medeleg_IAM;
  reg  CsrPlugin_medeleg_IAF;
  reg  CsrPlugin_medeleg_II;
  reg  CsrPlugin_medeleg_LAM;
  reg  CsrPlugin_medeleg_LAF;
  reg  CsrPlugin_medeleg_SAM;
  reg  CsrPlugin_medeleg_SAF;
  reg  CsrPlugin_medeleg_EU;
  reg  CsrPlugin_medeleg_ES;
  reg  CsrPlugin_medeleg_IPF;
  reg  CsrPlugin_medeleg_LPF;
  reg  CsrPlugin_medeleg_SPF;
  reg  CsrPlugin_mideleg_ST;
  reg  CsrPlugin_mideleg_SE;
  reg  CsrPlugin_mideleg_SS;
  reg  CsrPlugin_sstatus_SIE;
  reg  CsrPlugin_sstatus_SPIE;
  reg [0:0] CsrPlugin_sstatus_SPP;
  reg  CsrPlugin_sip_SEIP_SOFT;
  reg  CsrPlugin_sip_SEIP_INPUT;
  wire  CsrPlugin_sip_SEIP_OR;
  reg  CsrPlugin_sip_STIP;
  reg  CsrPlugin_sip_SSIP;
  reg  CsrPlugin_sie_SEIE;
  reg  CsrPlugin_sie_STIE;
  reg  CsrPlugin_sie_SSIE;
  reg [1:0] CsrPlugin_stvec_mode;
  reg [29:0] CsrPlugin_stvec_base;
  reg [31:0] CsrPlugin_sscratch;
  reg  CsrPlugin_scause_interrupt;
  reg [3:0] CsrPlugin_scause_exceptionCode;
  reg [31:0] CsrPlugin_stval;
  reg [31:0] CsrPlugin_sepc;
  reg [21:0] CsrPlugin_satp_PPN;
  reg [8:0] CsrPlugin_satp_ASID;
  reg [0:0] CsrPlugin_satp_MODE;
  wire  zz_210_;
  wire  zz_211_;
  wire  zz_212_;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg [3:0] CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg [31:0] CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  reg [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire [1:0] zz_213_;
  wire  zz_214_;
  reg  CsrPlugin_interrupt;
  reg [3:0] CsrPlugin_interruptCode /* verilator public */ ;
  reg [1:0] CsrPlugin_interruptTargetPrivilege;
  wire  CsrPlugin_exception;
  reg  CsrPlugin_lastStageWasWfi;
  reg  CsrPlugin_pipelineLiberator_done;
  wire  CsrPlugin_interruptJump /* verilator public */ ;
  reg  CsrPlugin_hadException;
  reg [1:0] CsrPlugin_targetPrivilege;
  reg [3:0] CsrPlugin_trapCause;
  reg [1:0] CsrPlugin_xtvec_mode;
  reg [29:0] CsrPlugin_xtvec_base;
  reg  execute_CsrPlugin_inWfi /* verilator public */ ;
  wire  execute_CsrPlugin_blockedBySideEffects;
  reg  execute_CsrPlugin_illegalAccess;
  reg  execute_CsrPlugin_illegalInstruction;
  reg [31:0] execute_CsrPlugin_readData;
  wire  execute_CsrPlugin_writeInstruction;
  wire  execute_CsrPlugin_readInstruction;
  wire  execute_CsrPlugin_writeEnable;
  wire  execute_CsrPlugin_readEnable;
  reg [31:0] execute_CsrPlugin_readToWriteData;
  reg [31:0] execute_CsrPlugin_writeData;
  wire [11:0] execute_CsrPlugin_csrAddress;
  reg  DebugPlugin_firstCycle;
  reg  DebugPlugin_secondCycle;
  reg  DebugPlugin_resetIt;
  reg  DebugPlugin_haltIt;
  reg  DebugPlugin_stepIt;
  reg  DebugPlugin_isPipActive;
  reg  DebugPlugin_isPipActive_regNext;
  wire  DebugPlugin_isPipBusy;
  reg  DebugPlugin_haltedByBreak;
  reg [31:0] DebugPlugin_busReadDataReg;
  reg  zz_215_;
  reg  zz_216_;
  reg  DebugPlugin_resetIt_regNext;
  wire  execute_BranchPlugin_eq;
  wire [2:0] zz_217_;
  reg  zz_218_;
  reg  zz_219_;
  wire [31:0] execute_BranchPlugin_branch_src1;
  wire  zz_220_;
  reg [10:0] zz_221_;
  wire  zz_222_;
  reg [19:0] zz_223_;
  wire  zz_224_;
  reg [18:0] zz_225_;
  reg [31:0] zz_226_;
  wire [31:0] execute_BranchPlugin_branch_src2;
  wire [31:0] execute_BranchPlugin_branchAdder;
  reg  MmuPlugin_status_sum;
  reg  MmuPlugin_status_mxr;
  reg  MmuPlugin_status_mprv;
  reg  MmuPlugin_satp_mode;
  reg [19:0] MmuPlugin_satp_ppn;
  reg  MmuPlugin_ports_0_cache_0_valid;
  reg  MmuPlugin_ports_0_cache_0_exception;
  reg  MmuPlugin_ports_0_cache_0_superPage;
  reg [9:0] MmuPlugin_ports_0_cache_0_virtualAddress_0;
  reg [9:0] MmuPlugin_ports_0_cache_0_virtualAddress_1;
  reg [9:0] MmuPlugin_ports_0_cache_0_physicalAddress_0;
  reg [9:0] MmuPlugin_ports_0_cache_0_physicalAddress_1;
  reg  MmuPlugin_ports_0_cache_0_allowRead;
  reg  MmuPlugin_ports_0_cache_0_allowWrite;
  reg  MmuPlugin_ports_0_cache_0_allowExecute;
  reg  MmuPlugin_ports_0_cache_0_allowUser;
  reg  MmuPlugin_ports_0_cache_1_valid;
  reg  MmuPlugin_ports_0_cache_1_exception;
  reg  MmuPlugin_ports_0_cache_1_superPage;
  reg [9:0] MmuPlugin_ports_0_cache_1_virtualAddress_0;
  reg [9:0] MmuPlugin_ports_0_cache_1_virtualAddress_1;
  reg [9:0] MmuPlugin_ports_0_cache_1_physicalAddress_0;
  reg [9:0] MmuPlugin_ports_0_cache_1_physicalAddress_1;
  reg  MmuPlugin_ports_0_cache_1_allowRead;
  reg  MmuPlugin_ports_0_cache_1_allowWrite;
  reg  MmuPlugin_ports_0_cache_1_allowExecute;
  reg  MmuPlugin_ports_0_cache_1_allowUser;
  reg  MmuPlugin_ports_0_cache_2_valid;
  reg  MmuPlugin_ports_0_cache_2_exception;
  reg  MmuPlugin_ports_0_cache_2_superPage;
  reg [9:0] MmuPlugin_ports_0_cache_2_virtualAddress_0;
  reg [9:0] MmuPlugin_ports_0_cache_2_virtualAddress_1;
  reg [9:0] MmuPlugin_ports_0_cache_2_physicalAddress_0;
  reg [9:0] MmuPlugin_ports_0_cache_2_physicalAddress_1;
  reg  MmuPlugin_ports_0_cache_2_allowRead;
  reg  MmuPlugin_ports_0_cache_2_allowWrite;
  reg  MmuPlugin_ports_0_cache_2_allowExecute;
  reg  MmuPlugin_ports_0_cache_2_allowUser;
  reg  MmuPlugin_ports_0_cache_3_valid;
  reg  MmuPlugin_ports_0_cache_3_exception;
  reg  MmuPlugin_ports_0_cache_3_superPage;
  reg [9:0] MmuPlugin_ports_0_cache_3_virtualAddress_0;
  reg [9:0] MmuPlugin_ports_0_cache_3_virtualAddress_1;
  reg [9:0] MmuPlugin_ports_0_cache_3_physicalAddress_0;
  reg [9:0] MmuPlugin_ports_0_cache_3_physicalAddress_1;
  reg  MmuPlugin_ports_0_cache_3_allowRead;
  reg  MmuPlugin_ports_0_cache_3_allowWrite;
  reg  MmuPlugin_ports_0_cache_3_allowExecute;
  reg  MmuPlugin_ports_0_cache_3_allowUser;
  wire  MmuPlugin_ports_0_cacheHits_0;
  wire  MmuPlugin_ports_0_cacheHits_1;
  wire  MmuPlugin_ports_0_cacheHits_2;
  wire  MmuPlugin_ports_0_cacheHits_3;
  wire  MmuPlugin_ports_0_cacheHit;
  wire  zz_227_;
  wire  zz_228_;
  wire [1:0] zz_229_;
  wire  MmuPlugin_ports_0_cacheLine_valid;
  wire  MmuPlugin_ports_0_cacheLine_exception;
  wire  MmuPlugin_ports_0_cacheLine_superPage;
  wire [9:0] MmuPlugin_ports_0_cacheLine_virtualAddress_0;
  wire [9:0] MmuPlugin_ports_0_cacheLine_virtualAddress_1;
  wire [9:0] MmuPlugin_ports_0_cacheLine_physicalAddress_0;
  wire [9:0] MmuPlugin_ports_0_cacheLine_physicalAddress_1;
  wire  MmuPlugin_ports_0_cacheLine_allowRead;
  wire  MmuPlugin_ports_0_cacheLine_allowWrite;
  wire  MmuPlugin_ports_0_cacheLine_allowExecute;
  wire  MmuPlugin_ports_0_cacheLine_allowUser;
  reg  MmuPlugin_ports_0_entryToReplace_willIncrement;
  wire  MmuPlugin_ports_0_entryToReplace_willClear;
  reg [1:0] MmuPlugin_ports_0_entryToReplace_valueNext;
  reg [1:0] MmuPlugin_ports_0_entryToReplace_value;
  wire  MmuPlugin_ports_0_entryToReplace_willOverflowIfInc;
  wire  MmuPlugin_ports_0_entryToReplace_willOverflow;
  reg  MmuPlugin_ports_0_requireMmuLockup;
  reg  MmuPlugin_ports_1_cache_0_valid;
  reg  MmuPlugin_ports_1_cache_0_exception;
  reg  MmuPlugin_ports_1_cache_0_superPage;
  reg [9:0] MmuPlugin_ports_1_cache_0_virtualAddress_0;
  reg [9:0] MmuPlugin_ports_1_cache_0_virtualAddress_1;
  reg [9:0] MmuPlugin_ports_1_cache_0_physicalAddress_0;
  reg [9:0] MmuPlugin_ports_1_cache_0_physicalAddress_1;
  reg  MmuPlugin_ports_1_cache_0_allowRead;
  reg  MmuPlugin_ports_1_cache_0_allowWrite;
  reg  MmuPlugin_ports_1_cache_0_allowExecute;
  reg  MmuPlugin_ports_1_cache_0_allowUser;
  reg  MmuPlugin_ports_1_cache_1_valid;
  reg  MmuPlugin_ports_1_cache_1_exception;
  reg  MmuPlugin_ports_1_cache_1_superPage;
  reg [9:0] MmuPlugin_ports_1_cache_1_virtualAddress_0;
  reg [9:0] MmuPlugin_ports_1_cache_1_virtualAddress_1;
  reg [9:0] MmuPlugin_ports_1_cache_1_physicalAddress_0;
  reg [9:0] MmuPlugin_ports_1_cache_1_physicalAddress_1;
  reg  MmuPlugin_ports_1_cache_1_allowRead;
  reg  MmuPlugin_ports_1_cache_1_allowWrite;
  reg  MmuPlugin_ports_1_cache_1_allowExecute;
  reg  MmuPlugin_ports_1_cache_1_allowUser;
  reg  MmuPlugin_ports_1_cache_2_valid;
  reg  MmuPlugin_ports_1_cache_2_exception;
  reg  MmuPlugin_ports_1_cache_2_superPage;
  reg [9:0] MmuPlugin_ports_1_cache_2_virtualAddress_0;
  reg [9:0] MmuPlugin_ports_1_cache_2_virtualAddress_1;
  reg [9:0] MmuPlugin_ports_1_cache_2_physicalAddress_0;
  reg [9:0] MmuPlugin_ports_1_cache_2_physicalAddress_1;
  reg  MmuPlugin_ports_1_cache_2_allowRead;
  reg  MmuPlugin_ports_1_cache_2_allowWrite;
  reg  MmuPlugin_ports_1_cache_2_allowExecute;
  reg  MmuPlugin_ports_1_cache_2_allowUser;
  reg  MmuPlugin_ports_1_cache_3_valid;
  reg  MmuPlugin_ports_1_cache_3_exception;
  reg  MmuPlugin_ports_1_cache_3_superPage;
  reg [9:0] MmuPlugin_ports_1_cache_3_virtualAddress_0;
  reg [9:0] MmuPlugin_ports_1_cache_3_virtualAddress_1;
  reg [9:0] MmuPlugin_ports_1_cache_3_physicalAddress_0;
  reg [9:0] MmuPlugin_ports_1_cache_3_physicalAddress_1;
  reg  MmuPlugin_ports_1_cache_3_allowRead;
  reg  MmuPlugin_ports_1_cache_3_allowWrite;
  reg  MmuPlugin_ports_1_cache_3_allowExecute;
  reg  MmuPlugin_ports_1_cache_3_allowUser;
  wire  MmuPlugin_ports_1_cacheHits_0;
  wire  MmuPlugin_ports_1_cacheHits_1;
  wire  MmuPlugin_ports_1_cacheHits_2;
  wire  MmuPlugin_ports_1_cacheHits_3;
  wire  MmuPlugin_ports_1_cacheHit;
  wire  zz_230_;
  wire  zz_231_;
  wire [1:0] zz_232_;
  wire  MmuPlugin_ports_1_cacheLine_valid;
  wire  MmuPlugin_ports_1_cacheLine_exception;
  wire  MmuPlugin_ports_1_cacheLine_superPage;
  wire [9:0] MmuPlugin_ports_1_cacheLine_virtualAddress_0;
  wire [9:0] MmuPlugin_ports_1_cacheLine_virtualAddress_1;
  wire [9:0] MmuPlugin_ports_1_cacheLine_physicalAddress_0;
  wire [9:0] MmuPlugin_ports_1_cacheLine_physicalAddress_1;
  wire  MmuPlugin_ports_1_cacheLine_allowRead;
  wire  MmuPlugin_ports_1_cacheLine_allowWrite;
  wire  MmuPlugin_ports_1_cacheLine_allowExecute;
  wire  MmuPlugin_ports_1_cacheLine_allowUser;
  reg  MmuPlugin_ports_1_entryToReplace_willIncrement;
  wire  MmuPlugin_ports_1_entryToReplace_willClear;
  reg [1:0] MmuPlugin_ports_1_entryToReplace_valueNext;
  reg [1:0] MmuPlugin_ports_1_entryToReplace_value;
  wire  MmuPlugin_ports_1_entryToReplace_willOverflowIfInc;
  wire  MmuPlugin_ports_1_entryToReplace_willOverflow;
  reg  MmuPlugin_ports_1_requireMmuLockup;
  reg  MmuPlugin_shared_busy;
  reg `MmuPlugin_shared_State_defaultEncoding_type MmuPlugin_shared_state_1_;
  reg [9:0] MmuPlugin_shared_vpn_0;
  reg [9:0] MmuPlugin_shared_vpn_1;
  reg [0:0] MmuPlugin_shared_portId;
  wire  MmuPlugin_shared_dBusRsp_pte_V;
  wire  MmuPlugin_shared_dBusRsp_pte_R;
  wire  MmuPlugin_shared_dBusRsp_pte_W;
  wire  MmuPlugin_shared_dBusRsp_pte_X;
  wire  MmuPlugin_shared_dBusRsp_pte_U;
  wire  MmuPlugin_shared_dBusRsp_pte_G;
  wire  MmuPlugin_shared_dBusRsp_pte_A;
  wire  MmuPlugin_shared_dBusRsp_pte_D;
  wire [1:0] MmuPlugin_shared_dBusRsp_pte_RSW;
  wire [9:0] MmuPlugin_shared_dBusRsp_pte_PPN0;
  wire [11:0] MmuPlugin_shared_dBusRsp_pte_PPN1;
  wire  MmuPlugin_shared_dBusRsp_exception;
  wire  MmuPlugin_shared_dBusRsp_leaf;
  reg  MmuPlugin_shared_pteBuffer_V;
  reg  MmuPlugin_shared_pteBuffer_R;
  reg  MmuPlugin_shared_pteBuffer_W;
  reg  MmuPlugin_shared_pteBuffer_X;
  reg  MmuPlugin_shared_pteBuffer_U;
  reg  MmuPlugin_shared_pteBuffer_G;
  reg  MmuPlugin_shared_pteBuffer_A;
  reg  MmuPlugin_shared_pteBuffer_D;
  reg [1:0] MmuPlugin_shared_pteBuffer_RSW;
  reg [9:0] MmuPlugin_shared_pteBuffer_PPN0;
  reg [11:0] MmuPlugin_shared_pteBuffer_PPN1;
  reg [19:0] execute_MmuPlugin_tlbWriteBuffer;
  reg [31:0] decode_to_execute_SRC2;
  reg  execute_to_memory_BRANCH_DO;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg  execute_to_memory_MEMORY_ENABLE;
  reg  memory_to_writeBack_MEMORY_ENABLE;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg  execute_to_memory_IS_DBUS_SHARING;
  reg  memory_to_writeBack_IS_DBUS_SHARING;
  reg [31:0] execute_to_memory_REGFILE_WRITE_DATA;
  reg [31:0] memory_to_writeBack_REGFILE_WRITE_DATA;
  reg [51:0] memory_to_writeBack_MUL_LOW;
  reg  decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg  execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg [31:0] execute_to_memory_BRANCH_CALC;
  reg  decode_to_execute_SRC2_FORCE_ZERO;
  reg `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg [33:0] execute_to_memory_MUL_HL;
  reg [31:0] execute_to_memory_MUL_LL;
  reg [31:0] decode_to_execute_RS1;
  reg [31:0] decode_to_execute_RS2;
  reg `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  reg  decode_to_execute_IS_MUL;
  reg  execute_to_memory_IS_MUL;
  reg  memory_to_writeBack_IS_MUL;
  reg  decode_to_execute_IS_RS1_SIGNED;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg  execute_to_memory_REGFILE_WRITE_VALID;
  reg  memory_to_writeBack_REGFILE_WRITE_VALID;
  reg `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg [33:0] execute_to_memory_MUL_LH;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg [31:0] execute_to_memory_FORMAL_PC_NEXT;
  reg [31:0] memory_to_writeBack_FORMAL_PC_NEXT;
  reg  decode_to_execute_DO_EBREAK;
  reg [1:0] execute_to_memory_MEMORY_ADDRESS_LOW;
  reg [1:0] memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg [31:0] execute_to_memory_SHIFT_RIGHT;
  reg  decode_to_execute_MEMORY_MANAGMENT;
  reg  decode_to_execute_IS_RS2_SIGNED;
  reg `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg  decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg  decode_to_execute_IS_DIV;
  reg  execute_to_memory_IS_DIV;
  reg [31:0] decode_to_execute_PC;
  reg [31:0] execute_to_memory_PC;
  reg [31:0] memory_to_writeBack_PC;
  reg  decode_to_execute_IS_CSR;
  reg  decode_to_execute_MEMORY_ATOMIC;
  reg [33:0] execute_to_memory_MUL_HH;
  reg [33:0] memory_to_writeBack_MUL_HH;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg  decode_to_execute_MEMORY_WR;
  reg  execute_to_memory_MEMORY_WR;
  reg  memory_to_writeBack_MEMORY_WR;
  reg  decode_to_execute_IS_SFENCE_VMA;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg [31:0] execute_to_memory_INSTRUCTION;
  reg [31:0] memory_to_writeBack_INSTRUCTION;
  reg [31:0] decode_to_execute_SRC1;
  reg `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg [2:0] zz_233_;
  `ifndef SYNTHESIS
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] zz_1__string;
  reg [31:0] zz_2__string;
  reg [31:0] zz_3__string;
  reg [39:0] zz_4__string;
  reg [39:0] zz_5__string;
  reg [39:0] zz_6__string;
  reg [39:0] zz_7__string;
  reg [39:0] decode_ENV_CTRL_string;
  reg [39:0] zz_8__string;
  reg [39:0] zz_9__string;
  reg [39:0] zz_10__string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] zz_11__string;
  reg [39:0] zz_12__string;
  reg [39:0] zz_13__string;
  reg [71:0] zz_14__string;
  reg [71:0] zz_15__string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] zz_16__string;
  reg [71:0] zz_17__string;
  reg [71:0] zz_18__string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] zz_19__string;
  reg [63:0] zz_20__string;
  reg [63:0] zz_21__string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] zz_23__string;
  reg [39:0] memory_ENV_CTRL_string;
  reg [39:0] zz_26__string;
  reg [39:0] execute_ENV_CTRL_string;
  reg [39:0] zz_27__string;
  reg [39:0] writeBack_ENV_CTRL_string;
  reg [39:0] zz_30__string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] zz_38__string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] zz_40__string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] zz_46__string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] zz_49__string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] zz_52__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] zz_54__string;
  reg [23:0] zz_61__string;
  reg [63:0] zz_71__string;
  reg [71:0] zz_72__string;
  reg [31:0] zz_73__string;
  reg [39:0] zz_76__string;
  reg [95:0] zz_81__string;
  reg [39:0] zz_86__string;
  reg [39:0] zz_174__string;
  reg [95:0] zz_175__string;
  reg [39:0] zz_176__string;
  reg [31:0] zz_177__string;
  reg [71:0] zz_178__string;
  reg [63:0] zz_179__string;
  reg [23:0] zz_180__string;
  reg [47:0] MmuPlugin_shared_state_1__string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [39:0] decode_to_execute_ENV_CTRL_string;
  reg [39:0] execute_to_memory_ENV_CTRL_string;
  reg [39:0] memory_to_writeBack_ENV_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign zz_282_ = (memory_arbitration_isValid && memory_IS_DIV);
  assign zz_283_ = (! memory_MulDivIterativePlugin_div_done);
  assign zz_284_ = ({decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid} != (2'b00));
  assign zz_285_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign zz_286_ = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign zz_287_ = writeBack_INSTRUCTION[29 : 28];
  assign zz_288_ = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign zz_289_ = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)) == 1'b0);
  assign zz_290_ = (DebugPlugin_stepIt && IBusCachedPlugin_incomingInstruction);
  assign zz_291_ = (IBusCachedPlugin_fetchPc_preOutput_valid && IBusCachedPlugin_fetchPc_preOutput_ready);
  assign zz_292_ = (! memory_arbitration_isStuck);
  assign zz_293_ = debug_bus_cmd_payload_address[7 : 2];
  assign zz_294_ = ((MmuPlugin_dBusAccess_rsp_valid && (! MmuPlugin_dBusAccess_rsp_payload_redo)) && (MmuPlugin_shared_dBusRsp_leaf || MmuPlugin_shared_dBusRsp_exception));
  assign zz_295_ = (MmuPlugin_shared_portId == (1'b1));
  assign zz_296_ = (MmuPlugin_shared_portId == (1'b0));
  assign zz_297_ = (IBusCachedPlugin_iBusRsp_output_valid && IBusCachedPlugin_iBusRsp_output_ready);
  assign zz_298_ = (zz_256_ && (! dataCache_1__io_mem_cmd_s2mPipe_ready));
  assign zz_299_ = (IBusCachedPlugin_mmuBus_cmd_isValid && IBusCachedPlugin_mmuBus_rsp_refilling);
  assign zz_300_ = (DBusCachedPlugin_mmuBus_cmd_isValid && DBusCachedPlugin_mmuBus_rsp_refilling);
  assign zz_301_ = (MmuPlugin_ports_0_entryToReplace_value == (2'b00));
  assign zz_302_ = (MmuPlugin_ports_0_entryToReplace_value == (2'b01));
  assign zz_303_ = (MmuPlugin_ports_0_entryToReplace_value == (2'b10));
  assign zz_304_ = (MmuPlugin_ports_0_entryToReplace_value == (2'b11));
  assign zz_305_ = (MmuPlugin_ports_1_entryToReplace_value == (2'b00));
  assign zz_306_ = (MmuPlugin_ports_1_entryToReplace_value == (2'b01));
  assign zz_307_ = (MmuPlugin_ports_1_entryToReplace_value == (2'b10));
  assign zz_308_ = (MmuPlugin_ports_1_entryToReplace_value == (2'b11));
  assign zz_309_ = {zz_116_[1 : 0],zz_116_[15 : 13]};
  assign zz_310_ = zz_116_[6 : 5];
  assign zz_311_ = zz_116_[11 : 10];
  assign zz_312_ = writeBack_INSTRUCTION[13 : 12];
  assign zz_313_ = execute_INSTRUCTION[13 : 12];
  assign zz_314_ = writeBack_INSTRUCTION[13 : 12];
  assign zz_315_ = execute_INSTRUCTION[13];
  assign zz_316_ = (zz_100_ - (4'b0001));
  assign zz_317_ = {IBusCachedPlugin_fetchPc_inc,(2'b00)};
  assign zz_318_ = {29'd0, zz_317_};
  assign zz_319_ = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign zz_320_ = {29'd0, zz_319_};
  assign zz_321_ = {{zz_126_,zz_116_[6 : 2]},(12'b000000000000)};
  assign zz_322_ = {{{(4'b0000),zz_116_[8 : 7]},zz_116_[12 : 9]},(2'b00)};
  assign zz_323_ = {{{(4'b0000),zz_116_[8 : 7]},zz_116_[12 : 9]},(2'b00)};
  assign zz_324_ = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign zz_325_ = {29'd0, zz_324_};
  assign zz_326_ = (writeBack_MEMORY_WR ? (3'b111) : (3'b101));
  assign zz_327_ = (writeBack_MEMORY_WR ? (3'b110) : (3'b100));
  assign zz_328_ = zz_167_[2 : 2];
  assign zz_329_ = zz_167_[3 : 3];
  assign zz_330_ = zz_167_[4 : 4];
  assign zz_331_ = zz_167_[5 : 5];
  assign zz_332_ = zz_167_[8 : 8];
  assign zz_333_ = zz_167_[9 : 9];
  assign zz_334_ = zz_167_[10 : 10];
  assign zz_335_ = zz_167_[11 : 11];
  assign zz_336_ = zz_167_[14 : 14];
  assign zz_337_ = zz_167_[15 : 15];
  assign zz_338_ = zz_167_[22 : 22];
  assign zz_339_ = zz_167_[23 : 23];
  assign zz_340_ = zz_167_[24 : 24];
  assign zz_341_ = zz_167_[25 : 25];
  assign zz_342_ = zz_167_[26 : 26];
  assign zz_343_ = zz_167_[27 : 27];
  assign zz_344_ = zz_167_[29 : 29];
  assign zz_345_ = zz_167_[30 : 30];
  assign zz_346_ = zz_167_[31 : 31];
  assign zz_347_ = zz_167_[34 : 34];
  assign zz_348_ = execute_SRC_LESS;
  assign zz_349_ = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign zz_350_ = decode_INSTRUCTION[19 : 15];
  assign zz_351_ = decode_INSTRUCTION[31 : 20];
  assign zz_352_ = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign zz_353_ = ($signed(zz_354_) + $signed(zz_358_));
  assign zz_354_ = ($signed(zz_355_) + $signed(zz_356_));
  assign zz_355_ = execute_SRC1;
  assign zz_356_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign zz_357_ = (execute_SRC_USE_SUB_LESS ? zz_359_ : zz_360_);
  assign zz_358_ = {{30{zz_357_[1]}}, zz_357_};
  assign zz_359_ = (2'b01);
  assign zz_360_ = (2'b00);
  assign zz_361_ = ($signed(zz_363_) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign zz_362_ = zz_361_[31 : 0];
  assign zz_363_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign zz_364_ = ($signed(zz_365_) + $signed(zz_370_));
  assign zz_365_ = ($signed(zz_366_) + $signed(zz_368_));
  assign zz_366_ = (52'b0000000000000000000000000000000000000000000000000000);
  assign zz_367_ = {1'b0,memory_MUL_LL};
  assign zz_368_ = {{19{zz_367_[32]}}, zz_367_};
  assign zz_369_ = ({16'd0,memory_MUL_LH} <<< 16);
  assign zz_370_ = {{2{zz_369_[49]}}, zz_369_};
  assign zz_371_ = ({16'd0,memory_MUL_HL} <<< 16);
  assign zz_372_ = {{2{zz_371_[49]}}, zz_371_};
  assign zz_373_ = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign zz_374_ = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign zz_375_ = writeBack_MUL_LOW[31 : 0];
  assign zz_376_ = writeBack_MulPlugin_result[63 : 32];
  assign zz_377_ = memory_MulDivIterativePlugin_div_counter_willIncrement;
  assign zz_378_ = {5'd0, zz_377_};
  assign zz_379_ = {1'd0, memory_MulDivIterativePlugin_rs2};
  assign zz_380_ = {zz_203_,(! zz_205_[32])};
  assign zz_381_ = zz_205_[31:0];
  assign zz_382_ = zz_204_[31:0];
  assign zz_383_ = zz_384_;
  assign zz_384_ = zz_385_;
  assign zz_385_ = ({1'b0,(memory_MulDivIterativePlugin_div_needRevert ? (~ zz_206_) : zz_206_)} + zz_387_);
  assign zz_386_ = memory_MulDivIterativePlugin_div_needRevert;
  assign zz_387_ = {32'd0, zz_386_};
  assign zz_388_ = zz_208_;
  assign zz_389_ = {32'd0, zz_388_};
  assign zz_390_ = zz_207_;
  assign zz_391_ = {31'd0, zz_390_};
  assign zz_392_ = (zz_213_ & (~ zz_393_));
  assign zz_393_ = (zz_213_ - (2'b01));
  assign zz_394_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign zz_395_ = execute_INSTRUCTION[31 : 20];
  assign zz_396_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign zz_397_ = MmuPlugin_ports_0_entryToReplace_willIncrement;
  assign zz_398_ = {1'd0, zz_397_};
  assign zz_399_ = MmuPlugin_ports_1_entryToReplace_willIncrement;
  assign zz_400_ = {1'd0, zz_399_};
  assign zz_401_ = MmuPlugin_dBusAccess_rsp_payload_data[0 : 0];
  assign zz_402_ = MmuPlugin_dBusAccess_rsp_payload_data[1 : 1];
  assign zz_403_ = MmuPlugin_dBusAccess_rsp_payload_data[2 : 2];
  assign zz_404_ = MmuPlugin_dBusAccess_rsp_payload_data[3 : 3];
  assign zz_405_ = MmuPlugin_dBusAccess_rsp_payload_data[4 : 4];
  assign zz_406_ = MmuPlugin_dBusAccess_rsp_payload_data[5 : 5];
  assign zz_407_ = MmuPlugin_dBusAccess_rsp_payload_data[6 : 6];
  assign zz_408_ = MmuPlugin_dBusAccess_rsp_payload_data[7 : 7];
  assign zz_409_ = execute_CsrPlugin_writeData[7 : 7];
  assign zz_410_ = execute_CsrPlugin_writeData[3 : 3];
  assign zz_411_ = execute_CsrPlugin_writeData[5 : 5];
  assign zz_412_ = execute_CsrPlugin_writeData[1 : 1];
  assign zz_413_ = execute_CsrPlugin_writeData[19 : 19];
  assign zz_414_ = execute_CsrPlugin_writeData[18 : 18];
  assign zz_415_ = execute_CsrPlugin_writeData[17 : 17];
  assign zz_416_ = execute_CsrPlugin_writeData[9 : 9];
  assign zz_417_ = execute_CsrPlugin_writeData[5 : 5];
  assign zz_418_ = execute_CsrPlugin_writeData[1 : 1];
  assign zz_419_ = execute_CsrPlugin_writeData[31 : 31];
  assign zz_420_ = execute_CsrPlugin_writeData[5 : 5];
  assign zz_421_ = execute_CsrPlugin_writeData[1 : 1];
  assign zz_422_ = execute_CsrPlugin_writeData[19 : 19];
  assign zz_423_ = execute_CsrPlugin_writeData[18 : 18];
  assign zz_424_ = execute_CsrPlugin_writeData[17 : 17];
  assign zz_425_ = execute_CsrPlugin_writeData[8 : 8];
  assign zz_426_ = execute_CsrPlugin_writeData[2 : 2];
  assign zz_427_ = execute_CsrPlugin_writeData[5 : 5];
  assign zz_428_ = execute_CsrPlugin_writeData[13 : 13];
  assign zz_429_ = execute_CsrPlugin_writeData[4 : 4];
  assign zz_430_ = execute_CsrPlugin_writeData[7 : 7];
  assign zz_431_ = execute_CsrPlugin_writeData[1 : 1];
  assign zz_432_ = execute_CsrPlugin_writeData[9 : 9];
  assign zz_433_ = execute_CsrPlugin_writeData[12 : 12];
  assign zz_434_ = execute_CsrPlugin_writeData[15 : 15];
  assign zz_435_ = execute_CsrPlugin_writeData[6 : 6];
  assign zz_436_ = execute_CsrPlugin_writeData[0 : 0];
  assign zz_437_ = execute_CsrPlugin_writeData[3 : 3];
  assign zz_438_ = execute_CsrPlugin_writeData[5 : 5];
  assign zz_439_ = execute_CsrPlugin_writeData[1 : 1];
  assign zz_440_ = execute_CsrPlugin_writeData[9 : 9];
  assign zz_441_ = execute_CsrPlugin_writeData[31 : 31];
  assign zz_442_ = execute_CsrPlugin_writeData[5 : 5];
  assign zz_443_ = execute_CsrPlugin_writeData[1 : 1];
  assign zz_444_ = execute_CsrPlugin_writeData[9 : 9];
  assign zz_445_ = execute_CsrPlugin_writeData[11 : 11];
  assign zz_446_ = execute_CsrPlugin_writeData[7 : 7];
  assign zz_447_ = execute_CsrPlugin_writeData[3 : 3];
  assign zz_448_ = execute_CsrPlugin_writeData[9 : 9];
  assign zz_449_ = execute_CsrPlugin_writeData[5 : 5];
  assign zz_450_ = execute_CsrPlugin_writeData[1 : 1];
  assign zz_451_ = execute_CsrPlugin_writeData[31 : 31];
  assign zz_452_ = execute_CsrPlugin_writeData[9 : 9];
  assign zz_453_ = execute_CsrPlugin_writeData[5 : 5];
  assign zz_454_ = execute_CsrPlugin_writeData[1 : 1];
  assign zz_455_ = 1'b1;
  assign zz_456_ = 1'b1;
  assign zz_457_ = {zz_104_,zz_103_};
  assign zz_458_ = (zz_116_[11 : 10] == (2'b01));
  assign zz_459_ = ((zz_116_[11 : 10] == (2'b11)) && (zz_116_[6 : 5] == (2'b00)));
  assign zz_460_ = (7'b0000000);
  assign zz_461_ = zz_116_[6 : 2];
  assign zz_462_ = zz_116_[12];
  assign zz_463_ = zz_116_[11 : 7];
  assign zz_464_ = (32'b00000000000000000100000001001000);
  assign zz_465_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001110000)) == (32'b00000000000000000000000000100000));
  assign zz_466_ = zz_173_;
  assign zz_467_ = ((decode_INSTRUCTION & zz_473_) == (32'b00000000000000000000000000000000));
  assign zz_468_ = ((decode_INSTRUCTION & zz_474_) == (32'b00000000000000000001000000001000));
  assign zz_469_ = (1'b0);
  assign zz_470_ = ({zz_168_,{zz_475_,zz_476_}} != (5'b00000));
  assign zz_471_ = ({zz_477_,zz_478_} != (7'b0000000));
  assign zz_472_ = {(zz_479_ != zz_480_),{zz_481_,{zz_482_,zz_483_}}};
  assign zz_473_ = (32'b00000000000000000000000000100000);
  assign zz_474_ = (32'b00000000000000000101000001001000);
  assign zz_475_ = ((decode_INSTRUCTION & zz_484_) == (32'b00000000000000000010000000010000));
  assign zz_476_ = {(zz_485_ == zz_486_),{zz_487_,zz_488_}};
  assign zz_477_ = zz_170_;
  assign zz_478_ = {(zz_489_ == zz_490_),{zz_491_,{zz_492_,zz_493_}}};
  assign zz_479_ = {(zz_494_ == zz_495_),{zz_496_,{zz_497_,zz_498_}}};
  assign zz_480_ = (6'b000000);
  assign zz_481_ = ((zz_499_ == zz_500_) != (1'b0));
  assign zz_482_ = (zz_501_ != (1'b0));
  assign zz_483_ = {(zz_502_ != zz_503_),{zz_504_,{zz_505_,zz_506_}}};
  assign zz_484_ = (32'b00000000000000000010000000110000);
  assign zz_485_ = (decode_INSTRUCTION & (32'b00000000000000000001000000110000));
  assign zz_486_ = (32'b00000000000000000000000000010000);
  assign zz_487_ = ((decode_INSTRUCTION & zz_507_) == (32'b00000000000000000000000000100000));
  assign zz_488_ = ((decode_INSTRUCTION & zz_508_) == (32'b00000000000000000010000000100000));
  assign zz_489_ = (decode_INSTRUCTION & (32'b00000000000000000001000000010000));
  assign zz_490_ = (32'b00000000000000000001000000010000);
  assign zz_491_ = ((decode_INSTRUCTION & zz_509_) == (32'b00000000000000000010000000010000));
  assign zz_492_ = (zz_510_ == zz_511_);
  assign zz_493_ = {zz_512_,{zz_513_,zz_514_}};
  assign zz_494_ = (decode_INSTRUCTION & (32'b00000000000000000010000001000000));
  assign zz_495_ = (32'b00000000000000000010000001000000);
  assign zz_496_ = ((decode_INSTRUCTION & zz_515_) == (32'b00000000000000000001000001000000));
  assign zz_497_ = (zz_516_ == zz_517_);
  assign zz_498_ = {zz_518_,{zz_519_,zz_520_}};
  assign zz_499_ = (decode_INSTRUCTION & (32'b00000000000000000000000000001000));
  assign zz_500_ = (32'b00000000000000000000000000001000);
  assign zz_501_ = ((decode_INSTRUCTION & zz_521_) == (32'b00000010000000000000000000110000));
  assign zz_502_ = {zz_522_,{zz_523_,zz_524_}};
  assign zz_503_ = (5'b00000);
  assign zz_504_ = (zz_525_ != (1'b0));
  assign zz_505_ = (zz_526_ != zz_527_);
  assign zz_506_ = {zz_528_,{zz_529_,zz_530_}};
  assign zz_507_ = (32'b00000010000000000011000000100000);
  assign zz_508_ = (32'b00010010000000000010000001100000);
  assign zz_509_ = (32'b00000000000000000010000000010000);
  assign zz_510_ = (decode_INSTRUCTION & (32'b00000000000000000010000000001000));
  assign zz_511_ = (32'b00000000000000000010000000001000);
  assign zz_512_ = ((decode_INSTRUCTION & zz_531_) == (32'b00000000000000000000000000010000));
  assign zz_513_ = zz_168_;
  assign zz_514_ = (zz_532_ == zz_533_);
  assign zz_515_ = (32'b00000000000000000001000001000000);
  assign zz_516_ = (decode_INSTRUCTION & (32'b00000000000000000000000001010000));
  assign zz_517_ = (32'b00000000000000000000000001000000);
  assign zz_518_ = ((decode_INSTRUCTION & zz_534_) == (32'b00000000000000000010000000001000));
  assign zz_519_ = (zz_535_ == zz_536_);
  assign zz_520_ = (zz_537_ == zz_538_);
  assign zz_521_ = (32'b00000010000000000100000001110100);
  assign zz_522_ = ((decode_INSTRUCTION & zz_539_) == (32'b00000000000000000000000000000000));
  assign zz_523_ = (zz_540_ == zz_541_);
  assign zz_524_ = {zz_542_,{zz_543_,zz_544_}};
  assign zz_525_ = ((decode_INSTRUCTION & zz_545_) == (32'b00000010000000000000000001010000));
  assign zz_526_ = {zz_546_,zz_547_};
  assign zz_527_ = (2'b00);
  assign zz_528_ = (zz_172_ != (1'b0));
  assign zz_529_ = (zz_548_ != zz_549_);
  assign zz_530_ = {zz_550_,{zz_551_,zz_552_}};
  assign zz_531_ = (32'b00000000000000000000000001010000);
  assign zz_532_ = (decode_INSTRUCTION & (32'b00000000000000000000000000101000));
  assign zz_533_ = (32'b00000000000000000000000000000000);
  assign zz_534_ = (32'b00001000000000000010000000001000);
  assign zz_535_ = (decode_INSTRUCTION & (32'b00000010000100000000000001000000));
  assign zz_536_ = (32'b00000000000000000000000001000000);
  assign zz_537_ = (decode_INSTRUCTION & (32'b00000000000000000000000000111000));
  assign zz_538_ = (32'b00000000000000000000000000000000);
  assign zz_539_ = (32'b00000000000000000000000001000100);
  assign zz_540_ = (decode_INSTRUCTION & (32'b00000000000000000000000000011000));
  assign zz_541_ = (32'b00000000000000000000000000000000);
  assign zz_542_ = ((decode_INSTRUCTION & (32'b00000000000000000110000000000100)) == (32'b00000000000000000010000000000000));
  assign zz_543_ = ((decode_INSTRUCTION & zz_553_) == (32'b00000000000000000001000000000000));
  assign zz_544_ = zz_171_;
  assign zz_545_ = (32'b00000010000000000011000001010000);
  assign zz_546_ = ((decode_INSTRUCTION & (32'b00000000000000000001000001010000)) == (32'b00000000000000000001000001010000));
  assign zz_547_ = ((decode_INSTRUCTION & (32'b00000000000000000010000001010000)) == (32'b00000000000000000010000001010000));
  assign zz_548_ = ((decode_INSTRUCTION & zz_554_) == (32'b00000000000000000100000000010000));
  assign zz_549_ = (1'b0);
  assign zz_550_ = ((zz_555_ == zz_556_) != (1'b0));
  assign zz_551_ = ({zz_557_,zz_558_} != (2'b00));
  assign zz_552_ = {(zz_559_ != zz_560_),{zz_561_,{zz_562_,zz_563_}}};
  assign zz_553_ = (32'b00000000000000000101000000000100);
  assign zz_554_ = (32'b00000000000000000100000000010100);
  assign zz_555_ = (decode_INSTRUCTION & (32'b00000000000000000110000000010100));
  assign zz_556_ = (32'b00000000000000000010000000010000);
  assign zz_557_ = ((decode_INSTRUCTION & zz_564_) == (32'b00000000000000000101000000010000));
  assign zz_558_ = ((decode_INSTRUCTION & zz_565_) == (32'b00000000000000000101000000100000));
  assign zz_559_ = {(zz_566_ == zz_567_),{zz_568_,zz_569_}};
  assign zz_560_ = (3'b000);
  assign zz_561_ = ({zz_170_,zz_570_} != (2'b00));
  assign zz_562_ = (zz_571_ != (1'b0));
  assign zz_563_ = {(zz_572_ != zz_573_),{zz_574_,{zz_575_,zz_576_}}};
  assign zz_564_ = (32'b00000000000000000111000000110100);
  assign zz_565_ = (32'b00000010000000000111000001100100);
  assign zz_566_ = (decode_INSTRUCTION & (32'b01000000000000000011000001010100));
  assign zz_567_ = (32'b01000000000000000001000000010000);
  assign zz_568_ = ((decode_INSTRUCTION & (32'b00000000000000000111000000110100)) == (32'b00000000000000000001000000010000));
  assign zz_569_ = ((decode_INSTRUCTION & (32'b00000010000000000111000001010100)) == (32'b00000000000000000001000000010000));
  assign zz_570_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000011100)) == (32'b00000000000000000000000000000100));
  assign zz_571_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001011000)) == (32'b00000000000000000000000001000000));
  assign zz_572_ = {(zz_577_ == zz_578_),(zz_579_ == zz_580_)};
  assign zz_573_ = (2'b00);
  assign zz_574_ = ({zz_581_,{zz_582_,zz_583_}} != (3'b000));
  assign zz_575_ = ({zz_584_,zz_585_} != (2'b00));
  assign zz_576_ = {(zz_586_ != zz_587_),{zz_588_,{zz_589_,zz_590_}}};
  assign zz_577_ = (decode_INSTRUCTION & (32'b00001000000000000000000000100000));
  assign zz_578_ = (32'b00001000000000000000000000100000);
  assign zz_579_ = (decode_INSTRUCTION & (32'b00000000000000000000000000101000));
  assign zz_580_ = (32'b00000000000000000000000000100000);
  assign zz_581_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000110100)) == (32'b00000000000000000000000000100000));
  assign zz_582_ = ((decode_INSTRUCTION & zz_591_) == (32'b00000000000000000000000000100000));
  assign zz_583_ = ((decode_INSTRUCTION & zz_592_) == (32'b00001000000000000000000000100000));
  assign zz_584_ = ((decode_INSTRUCTION & zz_593_) == (32'b00000000000000000000000001010000));
  assign zz_585_ = ((decode_INSTRUCTION & zz_594_) == (32'b00010000000000000000000001010000));
  assign zz_586_ = ((decode_INSTRUCTION & zz_595_) == (32'b00000000000000000000000001010000));
  assign zz_587_ = (1'b0);
  assign zz_588_ = (zz_172_ != (1'b0));
  assign zz_589_ = (zz_596_ != (1'b0));
  assign zz_590_ = {(zz_597_ != zz_598_),{zz_599_,{zz_600_,zz_601_}}};
  assign zz_591_ = (32'b00000000000000000000000001100100);
  assign zz_592_ = (32'b00001000000000000000000001110000);
  assign zz_593_ = (32'b00010000000100000011000001010000);
  assign zz_594_ = (32'b00010010001000000011000001010000);
  assign zz_595_ = (32'b00000010000100000011000001010000);
  assign zz_596_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001100100)) == (32'b00000000000000000000000000100100));
  assign zz_597_ = ((decode_INSTRUCTION & (32'b00010000000100000011000001010000)) == (32'b00000000000100000000000001010000));
  assign zz_598_ = (1'b0);
  assign zz_599_ = ({zz_171_,(zz_602_ == zz_603_)} != (2'b00));
  assign zz_600_ = ({zz_170_,{zz_604_,zz_605_}} != (3'b000));
  assign zz_601_ = {({zz_606_,zz_607_} != (2'b00)),{(zz_608_ != zz_609_),{zz_610_,{zz_611_,zz_612_}}}};
  assign zz_602_ = (decode_INSTRUCTION & (32'b00000000000000000000000001011000));
  assign zz_603_ = (32'b00000000000000000000000000000000);
  assign zz_604_ = zz_169_;
  assign zz_605_ = ((decode_INSTRUCTION & zz_613_) == (32'b00000000000000000000000000000100));
  assign zz_606_ = zz_169_;
  assign zz_607_ = ((decode_INSTRUCTION & zz_614_) == (32'b00000000000000000000000000000100));
  assign zz_608_ = {(zz_615_ == zz_616_),(zz_617_ == zz_618_)};
  assign zz_609_ = (2'b00);
  assign zz_610_ = ({zz_619_,{zz_620_,zz_621_}} != (5'b00000));
  assign zz_611_ = ({zz_622_,zz_623_} != (3'b000));
  assign zz_612_ = {(zz_624_ != zz_625_),{zz_626_,zz_627_}};
  assign zz_613_ = (32'b00000000000000000010000000010100);
  assign zz_614_ = (32'b00000000000000000000000001001100);
  assign zz_615_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign zz_616_ = (32'b00000000000000000010000000000000);
  assign zz_617_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000000));
  assign zz_618_ = (32'b00000000000000000001000000000000);
  assign zz_619_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001000000)) == (32'b00000000000000000000000001000000));
  assign zz_620_ = ((decode_INSTRUCTION & zz_628_) == (32'b00000000000000000100000000100000));
  assign zz_621_ = {(zz_629_ == zz_630_),{zz_168_,zz_631_}};
  assign zz_622_ = ((decode_INSTRUCTION & zz_632_) == (32'b00000000000000000000000001000000));
  assign zz_623_ = {(zz_633_ == zz_634_),(zz_635_ == zz_636_)};
  assign zz_624_ = ((decode_INSTRUCTION & zz_637_) == (32'b00000010000000000100000000100000));
  assign zz_625_ = (1'b0);
  assign zz_626_ = ((zz_638_ == zz_639_) != (1'b0));
  assign zz_627_ = ((zz_640_ == zz_641_) != (1'b0));
  assign zz_628_ = (32'b00000000000000000100000000100000);
  assign zz_629_ = (decode_INSTRUCTION & (32'b00000000000000000000000000110000));
  assign zz_630_ = (32'b00000000000000000000000000010000);
  assign zz_631_ = ((decode_INSTRUCTION & (32'b00010010000000000000000000100000)) == (32'b00000000000000000000000000100000));
  assign zz_632_ = (32'b00000000000000000000000001000100);
  assign zz_633_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010100));
  assign zz_634_ = (32'b00000000000000000010000000010000);
  assign zz_635_ = (decode_INSTRUCTION & (32'b01000000000000000000000000110100));
  assign zz_636_ = (32'b01000000000000000000000000110000);
  assign zz_637_ = (32'b00000010000000000100000001100100);
  assign zz_638_ = (decode_INSTRUCTION & (32'b00000000000000000001000000000000));
  assign zz_639_ = (32'b00000000000000000001000000000000);
  assign zz_640_ = (decode_INSTRUCTION & (32'b00000000000000000011000000000000));
  assign zz_641_ = (32'b00000000000000000010000000000000);
  assign zz_642_ = (32'b00000000000000000001000001111111);
  assign zz_643_ = (decode_INSTRUCTION & (32'b00000000000000000010000001111111));
  assign zz_644_ = (32'b00000000000000000010000001110011);
  assign zz_645_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001111111)) == (32'b00000000000000000100000001100011));
  assign zz_646_ = ((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000010000000010011));
  assign zz_647_ = {((decode_INSTRUCTION & (32'b00000000000000000110000000111111)) == (32'b00000000000000000000000000100011)),{((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & zz_648_) == (32'b00000000000000000000000000000011)),{(zz_649_ == zz_650_),{zz_651_,{zz_652_,zz_653_}}}}}};
  assign zz_648_ = (32'b00000000000000000101000001011111);
  assign zz_649_ = (decode_INSTRUCTION & (32'b00000000000000000111000001111011));
  assign zz_650_ = (32'b00000000000000000000000001100011);
  assign zz_651_ = ((decode_INSTRUCTION & (32'b00000000000000000110000001111111)) == (32'b00000000000000000000000000001111));
  assign zz_652_ = ((decode_INSTRUCTION & (32'b11111100000000000000000001111111)) == (32'b00000000000000000000000000110011));
  assign zz_653_ = {((decode_INSTRUCTION & (32'b11111000000000000111000001111111)) == (32'b00011000000000000010000000101111)),{((decode_INSTRUCTION & (32'b00000001111100000111000001111111)) == (32'b00000000000000000101000000001111)),{((decode_INSTRUCTION & zz_654_) == (32'b00000000000000000101000000010011)),{(zz_655_ == zz_656_),{zz_657_,{zz_658_,zz_659_}}}}}};
  assign zz_654_ = (32'b10111100000000000111000001111111);
  assign zz_655_ = (decode_INSTRUCTION & (32'b11111100000000000011000001111111));
  assign zz_656_ = (32'b00000000000000000001000000010011);
  assign zz_657_ = ((decode_INSTRUCTION & (32'b10111110000000000111000001111111)) == (32'b00000000000000000101000000110011));
  assign zz_658_ = ((decode_INSTRUCTION & (32'b10111110000000000111000001111111)) == (32'b00000000000000000000000000110011));
  assign zz_659_ = {((decode_INSTRUCTION & (32'b11111001111100000111000001111111)) == (32'b00010000000000000010000000101111)),{((decode_INSTRUCTION & (32'b11111110000000000111111111111111)) == (32'b00010010000000000000000001110011)),{((decode_INSTRUCTION & zz_660_) == (32'b00010000001000000000000001110011)),{(zz_661_ == zz_662_),(zz_663_ == zz_664_)}}}};
  assign zz_660_ = (32'b11011111111111111111111111111111);
  assign zz_661_ = (decode_INSTRUCTION & (32'b11111111111011111111111111111111));
  assign zz_662_ = (32'b00000000000000000000000001110011);
  assign zz_663_ = (decode_INSTRUCTION & (32'b11111111111111111111111111111111));
  assign zz_664_ = (32'b00010000010100000000000001110011);
  initial begin
    $readmemb("VexRiscv.v_toplevel_RegFilePlugin_regFile.bin",RegFilePlugin_regFile);
  end
  always @ (posedge clk) begin
    if(zz_57_) begin
      RegFilePlugin_regFile[writeBack_RegFilePlugin_regFileWrite_payload_address] <= writeBack_RegFilePlugin_regFileWrite_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(zz_455_) begin
      zz_257_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(zz_456_) begin
      zz_258_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  InstructionCache IBusCachedPlugin_cache ( 
    .io_flush(zz_234_),
    .io_cpu_prefetch_isValid(zz_235_),
    .io_cpu_prefetch_haltIt(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt),
    .io_cpu_prefetch_pc(IBusCachedPlugin_iBusRsp_stages_0_input_payload),
    .io_cpu_fetch_isValid(zz_236_),
    .io_cpu_fetch_isStuck(zz_237_),
    .io_cpu_fetch_isRemoved(zz_238_),
    .io_cpu_fetch_pc(IBusCachedPlugin_iBusRsp_stages_1_input_payload),
    .io_cpu_fetch_data(IBusCachedPlugin_cache_io_cpu_fetch_data),
    .io_cpu_fetch_dataBypassValid(IBusCachedPlugin_s1_tightlyCoupledHit),
    .io_cpu_fetch_dataBypass(zz_239_),
    .io_cpu_fetch_mmuBus_cmd_isValid(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid),
    .io_cpu_fetch_mmuBus_cmd_virtualAddress(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress),
    .io_cpu_fetch_mmuBus_cmd_bypassTranslation(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation),
    .io_cpu_fetch_mmuBus_rsp_physicalAddress(IBusCachedPlugin_mmuBus_rsp_physicalAddress),
    .io_cpu_fetch_mmuBus_rsp_isIoAccess(IBusCachedPlugin_mmuBus_rsp_isIoAccess),
    .io_cpu_fetch_mmuBus_rsp_allowRead(IBusCachedPlugin_mmuBus_rsp_allowRead),
    .io_cpu_fetch_mmuBus_rsp_allowWrite(IBusCachedPlugin_mmuBus_rsp_allowWrite),
    .io_cpu_fetch_mmuBus_rsp_allowExecute(IBusCachedPlugin_mmuBus_rsp_allowExecute),
    .io_cpu_fetch_mmuBus_rsp_exception(IBusCachedPlugin_mmuBus_rsp_exception),
    .io_cpu_fetch_mmuBus_rsp_refilling(IBusCachedPlugin_mmuBus_rsp_refilling),
    .io_cpu_fetch_mmuBus_end(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end),
    .io_cpu_fetch_physicalAddress(IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress),
    .io_cpu_decode_isValid(zz_240_),
    .io_cpu_decode_isStuck(zz_241_),
    .io_cpu_decode_pc(IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload),
    .io_cpu_decode_physicalAddress(IBusCachedPlugin_cache_io_cpu_decode_physicalAddress),
    .io_cpu_decode_data(IBusCachedPlugin_cache_io_cpu_decode_data),
    .io_cpu_decode_cacheMiss(IBusCachedPlugin_cache_io_cpu_decode_cacheMiss),
    .io_cpu_decode_error(IBusCachedPlugin_cache_io_cpu_decode_error),
    .io_cpu_decode_mmuRefilling(IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling),
    .io_cpu_decode_mmuException(IBusCachedPlugin_cache_io_cpu_decode_mmuException),
    .io_cpu_decode_isUser(zz_242_),
    .io_cpu_fill_valid(IBusCachedPlugin_rsp_redoFetch),
    .io_cpu_fill_payload(IBusCachedPlugin_cache_io_cpu_decode_physicalAddress),
    .io_mem_cmd_valid(IBusCachedPlugin_cache_io_mem_cmd_valid),
    .io_mem_cmd_ready(iBus_cmd_ready),
    .io_mem_cmd_payload_address(IBusCachedPlugin_cache_io_mem_cmd_payload_address),
    .io_mem_cmd_payload_size(IBusCachedPlugin_cache_io_mem_cmd_payload_size),
    .io_mem_rsp_valid(iBus_rsp_valid),
    .io_mem_rsp_payload_data(iBus_rsp_payload_data),
    .io_mem_rsp_payload_error(iBus_rsp_payload_error),
    .clk(clk),
    .reset(reset) 
  );
  DataCache dataCache_1_ ( 
    .io_cpu_execute_isValid(zz_243_),
    .io_cpu_execute_address(zz_244_),
    .io_cpu_execute_args_wr(zz_245_),
    .io_cpu_execute_args_data(zz_246_),
    .io_cpu_execute_args_size(zz_247_),
    .io_cpu_execute_args_forceUncachedAccess(zz_248_),
    .io_cpu_execute_args_isAtomic(zz_249_),
    .io_cpu_memory_isValid(zz_250_),
    .io_cpu_memory_isStuck(memory_arbitration_isStuck),
    .io_cpu_memory_isRemoved(memory_arbitration_removeIt),
    .io_cpu_memory_address(zz_251_),
    .io_cpu_memory_mmuBus_cmd_isValid(dataCache_1__io_cpu_memory_mmuBus_cmd_isValid),
    .io_cpu_memory_mmuBus_cmd_virtualAddress(dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress),
    .io_cpu_memory_mmuBus_cmd_bypassTranslation(dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation),
    .io_cpu_memory_mmuBus_rsp_physicalAddress(DBusCachedPlugin_mmuBus_rsp_physicalAddress),
    .io_cpu_memory_mmuBus_rsp_isIoAccess(DBusCachedPlugin_mmuBus_rsp_isIoAccess),
    .io_cpu_memory_mmuBus_rsp_allowRead(DBusCachedPlugin_mmuBus_rsp_allowRead),
    .io_cpu_memory_mmuBus_rsp_allowWrite(DBusCachedPlugin_mmuBus_rsp_allowWrite),
    .io_cpu_memory_mmuBus_rsp_allowExecute(DBusCachedPlugin_mmuBus_rsp_allowExecute),
    .io_cpu_memory_mmuBus_rsp_exception(DBusCachedPlugin_mmuBus_rsp_exception),
    .io_cpu_memory_mmuBus_rsp_refilling(DBusCachedPlugin_mmuBus_rsp_refilling),
    .io_cpu_memory_mmuBus_end(dataCache_1__io_cpu_memory_mmuBus_end),
    .io_cpu_writeBack_isValid(zz_252_),
    .io_cpu_writeBack_isStuck(writeBack_arbitration_isStuck),
    .io_cpu_writeBack_isUser(zz_253_),
    .io_cpu_writeBack_haltIt(dataCache_1__io_cpu_writeBack_haltIt),
    .io_cpu_writeBack_isWrite(dataCache_1__io_cpu_writeBack_isWrite),
    .io_cpu_writeBack_data(dataCache_1__io_cpu_writeBack_data),
    .io_cpu_writeBack_address(zz_254_),
    .io_cpu_writeBack_mmuException(dataCache_1__io_cpu_writeBack_mmuException),
    .io_cpu_writeBack_unalignedAccess(dataCache_1__io_cpu_writeBack_unalignedAccess),
    .io_cpu_writeBack_accessError(dataCache_1__io_cpu_writeBack_accessError),
    .io_cpu_writeBack_clearAtomicEntries(contextSwitching),
    .io_cpu_redo(dataCache_1__io_cpu_redo),
    .io_cpu_flush_valid(zz_255_),
    .io_cpu_flush_ready(dataCache_1__io_cpu_flush_ready),
    .io_mem_cmd_valid(dataCache_1__io_mem_cmd_valid),
    .io_mem_cmd_ready(zz_256_),
    .io_mem_cmd_payload_wr(dataCache_1__io_mem_cmd_payload_wr),
    .io_mem_cmd_payload_address(dataCache_1__io_mem_cmd_payload_address),
    .io_mem_cmd_payload_data(dataCache_1__io_mem_cmd_payload_data),
    .io_mem_cmd_payload_mask(dataCache_1__io_mem_cmd_payload_mask),
    .io_mem_cmd_payload_length(dataCache_1__io_mem_cmd_payload_length),
    .io_mem_cmd_payload_last(dataCache_1__io_mem_cmd_payload_last),
    .io_mem_rsp_valid(dBus_rsp_m2sPipe_valid),
    .io_mem_rsp_payload_data(dBus_rsp_m2sPipe_payload_data),
    .io_mem_rsp_payload_error(dBus_rsp_m2sPipe_payload_error),
    .clk(clk),
    .reset(reset) 
  );
  always @(*) begin
    case(zz_457_)
      2'b00 : begin
        zz_259_ = DBusCachedPlugin_redoBranch_payload;
      end
      2'b01 : begin
        zz_259_ = CsrPlugin_jumpInterface_payload;
      end
      2'b10 : begin
        zz_259_ = BranchPlugin_jumpInterface_payload;
      end
      default : begin
        zz_259_ = IBusCachedPlugin_redoBranch_payload;
      end
    endcase
  end

  always @(*) begin
    case(zz_229_)
      2'b00 : begin
        zz_260_ = MmuPlugin_ports_0_cache_0_valid;
        zz_261_ = MmuPlugin_ports_0_cache_0_exception;
        zz_262_ = MmuPlugin_ports_0_cache_0_superPage;
        zz_263_ = MmuPlugin_ports_0_cache_0_virtualAddress_0;
        zz_264_ = MmuPlugin_ports_0_cache_0_virtualAddress_1;
        zz_265_ = MmuPlugin_ports_0_cache_0_physicalAddress_0;
        zz_266_ = MmuPlugin_ports_0_cache_0_physicalAddress_1;
        zz_267_ = MmuPlugin_ports_0_cache_0_allowRead;
        zz_268_ = MmuPlugin_ports_0_cache_0_allowWrite;
        zz_269_ = MmuPlugin_ports_0_cache_0_allowExecute;
        zz_270_ = MmuPlugin_ports_0_cache_0_allowUser;
      end
      2'b01 : begin
        zz_260_ = MmuPlugin_ports_0_cache_1_valid;
        zz_261_ = MmuPlugin_ports_0_cache_1_exception;
        zz_262_ = MmuPlugin_ports_0_cache_1_superPage;
        zz_263_ = MmuPlugin_ports_0_cache_1_virtualAddress_0;
        zz_264_ = MmuPlugin_ports_0_cache_1_virtualAddress_1;
        zz_265_ = MmuPlugin_ports_0_cache_1_physicalAddress_0;
        zz_266_ = MmuPlugin_ports_0_cache_1_physicalAddress_1;
        zz_267_ = MmuPlugin_ports_0_cache_1_allowRead;
        zz_268_ = MmuPlugin_ports_0_cache_1_allowWrite;
        zz_269_ = MmuPlugin_ports_0_cache_1_allowExecute;
        zz_270_ = MmuPlugin_ports_0_cache_1_allowUser;
      end
      2'b10 : begin
        zz_260_ = MmuPlugin_ports_0_cache_2_valid;
        zz_261_ = MmuPlugin_ports_0_cache_2_exception;
        zz_262_ = MmuPlugin_ports_0_cache_2_superPage;
        zz_263_ = MmuPlugin_ports_0_cache_2_virtualAddress_0;
        zz_264_ = MmuPlugin_ports_0_cache_2_virtualAddress_1;
        zz_265_ = MmuPlugin_ports_0_cache_2_physicalAddress_0;
        zz_266_ = MmuPlugin_ports_0_cache_2_physicalAddress_1;
        zz_267_ = MmuPlugin_ports_0_cache_2_allowRead;
        zz_268_ = MmuPlugin_ports_0_cache_2_allowWrite;
        zz_269_ = MmuPlugin_ports_0_cache_2_allowExecute;
        zz_270_ = MmuPlugin_ports_0_cache_2_allowUser;
      end
      default : begin
        zz_260_ = MmuPlugin_ports_0_cache_3_valid;
        zz_261_ = MmuPlugin_ports_0_cache_3_exception;
        zz_262_ = MmuPlugin_ports_0_cache_3_superPage;
        zz_263_ = MmuPlugin_ports_0_cache_3_virtualAddress_0;
        zz_264_ = MmuPlugin_ports_0_cache_3_virtualAddress_1;
        zz_265_ = MmuPlugin_ports_0_cache_3_physicalAddress_0;
        zz_266_ = MmuPlugin_ports_0_cache_3_physicalAddress_1;
        zz_267_ = MmuPlugin_ports_0_cache_3_allowRead;
        zz_268_ = MmuPlugin_ports_0_cache_3_allowWrite;
        zz_269_ = MmuPlugin_ports_0_cache_3_allowExecute;
        zz_270_ = MmuPlugin_ports_0_cache_3_allowUser;
      end
    endcase
  end

  always @(*) begin
    case(zz_232_)
      2'b00 : begin
        zz_271_ = MmuPlugin_ports_1_cache_0_valid;
        zz_272_ = MmuPlugin_ports_1_cache_0_exception;
        zz_273_ = MmuPlugin_ports_1_cache_0_superPage;
        zz_274_ = MmuPlugin_ports_1_cache_0_virtualAddress_0;
        zz_275_ = MmuPlugin_ports_1_cache_0_virtualAddress_1;
        zz_276_ = MmuPlugin_ports_1_cache_0_physicalAddress_0;
        zz_277_ = MmuPlugin_ports_1_cache_0_physicalAddress_1;
        zz_278_ = MmuPlugin_ports_1_cache_0_allowRead;
        zz_279_ = MmuPlugin_ports_1_cache_0_allowWrite;
        zz_280_ = MmuPlugin_ports_1_cache_0_allowExecute;
        zz_281_ = MmuPlugin_ports_1_cache_0_allowUser;
      end
      2'b01 : begin
        zz_271_ = MmuPlugin_ports_1_cache_1_valid;
        zz_272_ = MmuPlugin_ports_1_cache_1_exception;
        zz_273_ = MmuPlugin_ports_1_cache_1_superPage;
        zz_274_ = MmuPlugin_ports_1_cache_1_virtualAddress_0;
        zz_275_ = MmuPlugin_ports_1_cache_1_virtualAddress_1;
        zz_276_ = MmuPlugin_ports_1_cache_1_physicalAddress_0;
        zz_277_ = MmuPlugin_ports_1_cache_1_physicalAddress_1;
        zz_278_ = MmuPlugin_ports_1_cache_1_allowRead;
        zz_279_ = MmuPlugin_ports_1_cache_1_allowWrite;
        zz_280_ = MmuPlugin_ports_1_cache_1_allowExecute;
        zz_281_ = MmuPlugin_ports_1_cache_1_allowUser;
      end
      2'b10 : begin
        zz_271_ = MmuPlugin_ports_1_cache_2_valid;
        zz_272_ = MmuPlugin_ports_1_cache_2_exception;
        zz_273_ = MmuPlugin_ports_1_cache_2_superPage;
        zz_274_ = MmuPlugin_ports_1_cache_2_virtualAddress_0;
        zz_275_ = MmuPlugin_ports_1_cache_2_virtualAddress_1;
        zz_276_ = MmuPlugin_ports_1_cache_2_physicalAddress_0;
        zz_277_ = MmuPlugin_ports_1_cache_2_physicalAddress_1;
        zz_278_ = MmuPlugin_ports_1_cache_2_allowRead;
        zz_279_ = MmuPlugin_ports_1_cache_2_allowWrite;
        zz_280_ = MmuPlugin_ports_1_cache_2_allowExecute;
        zz_281_ = MmuPlugin_ports_1_cache_2_allowUser;
      end
      default : begin
        zz_271_ = MmuPlugin_ports_1_cache_3_valid;
        zz_272_ = MmuPlugin_ports_1_cache_3_exception;
        zz_273_ = MmuPlugin_ports_1_cache_3_superPage;
        zz_274_ = MmuPlugin_ports_1_cache_3_virtualAddress_0;
        zz_275_ = MmuPlugin_ports_1_cache_3_virtualAddress_1;
        zz_276_ = MmuPlugin_ports_1_cache_3_physicalAddress_0;
        zz_277_ = MmuPlugin_ports_1_cache_3_physicalAddress_1;
        zz_278_ = MmuPlugin_ports_1_cache_3_allowRead;
        zz_279_ = MmuPlugin_ports_1_cache_3_allowWrite;
        zz_280_ = MmuPlugin_ports_1_cache_3_allowExecute;
        zz_281_ = MmuPlugin_ports_1_cache_3_allowUser;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(zz_1_)
      `BranchCtrlEnum_defaultEncoding_INC : zz_1__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : zz_1__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : zz_1__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : zz_1__string = "JALR";
      default : zz_1__string = "????";
    endcase
  end
  always @(*) begin
    case(zz_2_)
      `BranchCtrlEnum_defaultEncoding_INC : zz_2__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : zz_2__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : zz_2__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : zz_2__string = "JALR";
      default : zz_2__string = "????";
    endcase
  end
  always @(*) begin
    case(zz_3_)
      `BranchCtrlEnum_defaultEncoding_INC : zz_3__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : zz_3__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : zz_3__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : zz_3__string = "JALR";
      default : zz_3__string = "????";
    endcase
  end
  always @(*) begin
    case(zz_4_)
      `EnvCtrlEnum_defaultEncoding_NONE : zz_4__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : zz_4__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : zz_4__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : zz_4__string = "ECALL";
      default : zz_4__string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_5_)
      `EnvCtrlEnum_defaultEncoding_NONE : zz_5__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : zz_5__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : zz_5__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : zz_5__string = "ECALL";
      default : zz_5__string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_6_)
      `EnvCtrlEnum_defaultEncoding_NONE : zz_6__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : zz_6__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : zz_6__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : zz_6__string = "ECALL";
      default : zz_6__string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_7_)
      `EnvCtrlEnum_defaultEncoding_NONE : zz_7__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : zz_7__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : zz_7__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : zz_7__string = "ECALL";
      default : zz_7__string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : decode_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_ENV_CTRL_string = "ECALL";
      default : decode_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_8_)
      `EnvCtrlEnum_defaultEncoding_NONE : zz_8__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : zz_8__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : zz_8__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : zz_8__string = "ECALL";
      default : zz_8__string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_9_)
      `EnvCtrlEnum_defaultEncoding_NONE : zz_9__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : zz_9__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : zz_9__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : zz_9__string = "ECALL";
      default : zz_9__string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_10_)
      `EnvCtrlEnum_defaultEncoding_NONE : zz_10__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : zz_10__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : zz_10__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : zz_10__string = "ECALL";
      default : zz_10__string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_11_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : zz_11__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : zz_11__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : zz_11__string = "AND_1";
      default : zz_11__string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_12_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : zz_12__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : zz_12__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : zz_12__string = "AND_1";
      default : zz_12__string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_13_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : zz_13__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : zz_13__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : zz_13__string = "AND_1";
      default : zz_13__string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_14_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : zz_14__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : zz_14__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : zz_14__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : zz_14__string = "SRA_1    ";
      default : zz_14__string = "?????????";
    endcase
  end
  always @(*) begin
    case(zz_15_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : zz_15__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : zz_15__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : zz_15__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : zz_15__string = "SRA_1    ";
      default : zz_15__string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(zz_16_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : zz_16__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : zz_16__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : zz_16__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : zz_16__string = "SRA_1    ";
      default : zz_16__string = "?????????";
    endcase
  end
  always @(*) begin
    case(zz_17_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : zz_17__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : zz_17__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : zz_17__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : zz_17__string = "SRA_1    ";
      default : zz_17__string = "?????????";
    endcase
  end
  always @(*) begin
    case(zz_18_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : zz_18__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : zz_18__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : zz_18__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : zz_18__string = "SRA_1    ";
      default : zz_18__string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(zz_19_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : zz_19__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : zz_19__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : zz_19__string = "BITWISE ";
      default : zz_19__string = "????????";
    endcase
  end
  always @(*) begin
    case(zz_20_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : zz_20__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : zz_20__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : zz_20__string = "BITWISE ";
      default : zz_20__string = "????????";
    endcase
  end
  always @(*) begin
    case(zz_21_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : zz_21__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : zz_21__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : zz_21__string = "BITWISE ";
      default : zz_21__string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(zz_23_)
      `BranchCtrlEnum_defaultEncoding_INC : zz_23__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : zz_23__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : zz_23__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : zz_23__string = "JALR";
      default : zz_23__string = "????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : memory_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_ENV_CTRL_string = "ECALL";
      default : memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_26_)
      `EnvCtrlEnum_defaultEncoding_NONE : zz_26__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : zz_26__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : zz_26__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : zz_26__string = "ECALL";
      default : zz_26__string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : execute_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : execute_ENV_CTRL_string = "ECALL";
      default : execute_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_27_)
      `EnvCtrlEnum_defaultEncoding_NONE : zz_27__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : zz_27__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : zz_27__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : zz_27__string = "ECALL";
      default : zz_27__string = "?????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : writeBack_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : writeBack_ENV_CTRL_string = "ECALL";
      default : writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_30_)
      `EnvCtrlEnum_defaultEncoding_NONE : zz_30__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : zz_30__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : zz_30__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : zz_30__string = "ECALL";
      default : zz_30__string = "?????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(zz_38_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : zz_38__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : zz_38__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : zz_38__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : zz_38__string = "SRA_1    ";
      default : zz_38__string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(zz_40_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : zz_40__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : zz_40__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : zz_40__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : zz_40__string = "SRA_1    ";
      default : zz_40__string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(zz_46_)
      `Src2CtrlEnum_defaultEncoding_RS : zz_46__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : zz_46__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : zz_46__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : zz_46__string = "PC ";
      default : zz_46__string = "???";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(zz_49_)
      `Src1CtrlEnum_defaultEncoding_RS : zz_49__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : zz_49__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : zz_49__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : zz_49__string = "URS1        ";
      default : zz_49__string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(zz_52_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : zz_52__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : zz_52__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : zz_52__string = "BITWISE ";
      default : zz_52__string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_54_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : zz_54__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : zz_54__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : zz_54__string = "AND_1";
      default : zz_54__string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_61_)
      `Src2CtrlEnum_defaultEncoding_RS : zz_61__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : zz_61__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : zz_61__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : zz_61__string = "PC ";
      default : zz_61__string = "???";
    endcase
  end
  always @(*) begin
    case(zz_71_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : zz_71__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : zz_71__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : zz_71__string = "BITWISE ";
      default : zz_71__string = "????????";
    endcase
  end
  always @(*) begin
    case(zz_72_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : zz_72__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : zz_72__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : zz_72__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : zz_72__string = "SRA_1    ";
      default : zz_72__string = "?????????";
    endcase
  end
  always @(*) begin
    case(zz_73_)
      `BranchCtrlEnum_defaultEncoding_INC : zz_73__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : zz_73__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : zz_73__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : zz_73__string = "JALR";
      default : zz_73__string = "????";
    endcase
  end
  always @(*) begin
    case(zz_76_)
      `EnvCtrlEnum_defaultEncoding_NONE : zz_76__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : zz_76__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : zz_76__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : zz_76__string = "ECALL";
      default : zz_76__string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_81_)
      `Src1CtrlEnum_defaultEncoding_RS : zz_81__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : zz_81__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : zz_81__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : zz_81__string = "URS1        ";
      default : zz_81__string = "????????????";
    endcase
  end
  always @(*) begin
    case(zz_86_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : zz_86__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : zz_86__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : zz_86__string = "AND_1";
      default : zz_86__string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_174_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : zz_174__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : zz_174__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : zz_174__string = "AND_1";
      default : zz_174__string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_175_)
      `Src1CtrlEnum_defaultEncoding_RS : zz_175__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : zz_175__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : zz_175__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : zz_175__string = "URS1        ";
      default : zz_175__string = "????????????";
    endcase
  end
  always @(*) begin
    case(zz_176_)
      `EnvCtrlEnum_defaultEncoding_NONE : zz_176__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : zz_176__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : zz_176__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : zz_176__string = "ECALL";
      default : zz_176__string = "?????";
    endcase
  end
  always @(*) begin
    case(zz_177_)
      `BranchCtrlEnum_defaultEncoding_INC : zz_177__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : zz_177__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : zz_177__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : zz_177__string = "JALR";
      default : zz_177__string = "????";
    endcase
  end
  always @(*) begin
    case(zz_178_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : zz_178__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : zz_178__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : zz_178__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : zz_178__string = "SRA_1    ";
      default : zz_178__string = "?????????";
    endcase
  end
  always @(*) begin
    case(zz_179_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : zz_179__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : zz_179__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : zz_179__string = "BITWISE ";
      default : zz_179__string = "????????";
    endcase
  end
  always @(*) begin
    case(zz_180_)
      `Src2CtrlEnum_defaultEncoding_RS : zz_180__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : zz_180__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : zz_180__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : zz_180__string = "PC ";
      default : zz_180__string = "???";
    endcase
  end
  always @(*) begin
    case(MmuPlugin_shared_state_1_)
      `MmuPlugin_shared_State_defaultEncoding_IDLE : MmuPlugin_shared_state_1__string = "IDLE  ";
      `MmuPlugin_shared_State_defaultEncoding_L1_CMD : MmuPlugin_shared_state_1__string = "L1_CMD";
      `MmuPlugin_shared_State_defaultEncoding_L1_RSP : MmuPlugin_shared_state_1__string = "L1_RSP";
      `MmuPlugin_shared_State_defaultEncoding_L0_CMD : MmuPlugin_shared_state_1__string = "L0_CMD";
      `MmuPlugin_shared_State_defaultEncoding_L0_RSP : MmuPlugin_shared_state_1__string = "L0_RSP";
      default : MmuPlugin_shared_state_1__string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : decode_to_execute_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_to_execute_ENV_CTRL_string = "ECALL";
      default : decode_to_execute_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : execute_to_memory_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : execute_to_memory_ENV_CTRL_string = "ECALL";
      default : execute_to_memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : memory_to_writeBack_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_to_writeBack_ENV_CTRL_string = "ECALL";
      default : memory_to_writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign decode_BRANCH_CTRL = zz_1_;
  assign zz_2_ = zz_3_;
  assign decode_SRC1 = zz_50_;
  assign decode_IS_SFENCE_VMA = zz_68_;
  assign memory_MEMORY_WR = execute_to_memory_MEMORY_WR;
  assign decode_MEMORY_WR = zz_74_;
  assign decode_CSR_WRITE_OPCODE = zz_29_;
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = zz_32_;
  assign decode_MEMORY_ATOMIC = zz_65_;
  assign decode_IS_CSR = zz_69_;
  assign memory_PC = execute_to_memory_PC;
  assign decode_IS_DIV = zz_85_;
  assign decode_BYPASSABLE_EXECUTE_STAGE = zz_63_;
  assign zz_4_ = zz_5_;
  assign zz_6_ = zz_7_;
  assign decode_ENV_CTRL = zz_8_;
  assign zz_9_ = zz_10_;
  assign decode_IS_RS2_SIGNED = zz_77_;
  assign decode_MEMORY_MANAGMENT = zz_60_;
  assign execute_SHIFT_RIGHT = zz_39_;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = zz_90_;
  assign decode_DO_EBREAK = zz_25_;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = zz_95_;
  assign execute_MUL_LH = zz_34_;
  assign decode_CSR_READ_OPCODE = zz_28_;
  assign decode_ALU_BITWISE_CTRL = zz_11_;
  assign zz_12_ = zz_13_;
  assign decode_IS_RS1_SIGNED = zz_70_;
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = zz_66_;
  assign zz_14_ = zz_15_;
  assign decode_SHIFT_CTRL = zz_16_;
  assign zz_17_ = zz_18_;
  assign execute_MUL_LL = zz_35_;
  assign execute_MUL_HL = zz_33_;
  assign decode_ALU_CTRL = zz_19_;
  assign zz_20_ = zz_21_;
  assign decode_SRC2_FORCE_ZERO = zz_51_;
  assign execute_BRANCH_CALC = zz_22_;
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = zz_83_;
  assign memory_MUL_LOW = zz_31_;
  assign execute_REGFILE_WRITE_DATA = zz_53_;
  assign execute_IS_DBUS_SHARING = zz_88_;
  assign decode_SRC_LESS_UNSIGNED = zz_82_;
  assign decode_MEMORY_ENABLE = zz_80_;
  assign execute_BRANCH_DO = zz_24_;
  assign decode_SRC2 = zz_47_;
  assign execute_IS_SFENCE_VMA = decode_to_execute_IS_SFENCE_VMA;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_BRANCH_CTRL = zz_23_;
  assign execute_PC = decode_to_execute_PC;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = zz_79_;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = zz_26_;
  assign execute_ENV_CTRL = zz_27_;
  assign writeBack_ENV_CTRL = zz_30_;
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign decode_RS2_USE = zz_75_;
  assign decode_RS1_USE = zz_67_;
  always @ (*) begin
    zz_36_ = execute_REGFILE_WRITE_DATA;
    execute_arbitration_haltItself = 1'b0;
    if((zz_255_ && (! dataCache_1__io_cpu_flush_ready)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(((dataCache_1__io_cpu_redo && execute_arbitration_isValid) && execute_MEMORY_ENABLE))begin
      execute_arbitration_haltItself = 1'b1;
    end
    execute_CsrPlugin_inWfi = 1'b0;
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_WFI)))begin
      execute_CsrPlugin_inWfi = 1'b1;
      if((! CsrPlugin_interrupt))begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if((execute_arbitration_isValid && execute_IS_CSR))begin
      zz_36_ = execute_CsrPlugin_readData;
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(DBusCachedPlugin_forceDatapath)begin
      zz_36_ = MmuPlugin_dBusAccess_cmd_payload_address;
    end
  end

  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = zz_58_;
    decode_RS1 = zz_59_;
    if(zz_194_)begin
      if((zz_195_ == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = zz_196_;
      end
      if((zz_195_ == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = zz_196_;
      end
    end
    if((writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID))begin
      if(1'b1)begin
        if(zz_197_)begin
          decode_RS1 = zz_89_;
        end
        if(zz_198_)begin
          decode_RS2 = zz_89_;
        end
      end
    end
    if((memory_arbitration_isValid && memory_REGFILE_WRITE_VALID))begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(zz_199_)begin
          decode_RS1 = zz_37_;
        end
        if(zz_200_)begin
          decode_RS2 = zz_37_;
        end
      end
    end
    if((execute_arbitration_isValid && execute_REGFILE_WRITE_VALID))begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(zz_201_)begin
          decode_RS1 = zz_36_;
        end
        if(zz_202_)begin
          decode_RS2 = zz_36_;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @ (*) begin
    zz_37_ = memory_REGFILE_WRITE_DATA;
    memory_arbitration_haltItself = 1'b0;
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        zz_37_ = zz_190_;
      end
      `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
        zz_37_ = memory_SHIFT_RIGHT;
      end
      default : begin
      end
    endcase
    memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b0;
    if(zz_282_)begin
      if(zz_283_)begin
        memory_arbitration_haltItself = 1'b1;
        memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b1;
      end
      zz_37_ = memory_MulDivIterativePlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = zz_38_;
  assign execute_SHIFT_CTRL = zz_40_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign zz_44_ = decode_PC;
  assign zz_45_ = decode_RS2;
  assign decode_SRC2_CTRL = zz_46_;
  assign zz_48_ = decode_RS1;
  assign decode_SRC1_CTRL = zz_49_;
  assign decode_SRC_USE_SUB_LESS = zz_84_;
  assign decode_SRC_ADD_ZERO = zz_78_;
  assign execute_SRC_ADD_SUB = zz_43_;
  assign execute_SRC_LESS = zz_41_;
  assign execute_ALU_CTRL = zz_52_;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_ALU_BITWISE_CTRL = zz_54_;
  assign zz_55_ = writeBack_INSTRUCTION;
  assign zz_56_ = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    zz_57_ = 1'b0;
    if(writeBack_RegFilePlugin_regFileWrite_valid)begin
      zz_57_ = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = zz_99_;
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = zz_64_;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = zz_87_;
  assign decode_INSTRUCTION_READY = 1'b1;
  assign writeBack_IS_DBUS_SHARING = memory_to_writeBack_IS_DBUS_SHARING;
  assign memory_IS_DBUS_SHARING = execute_to_memory_IS_DBUS_SHARING;
  always @ (*) begin
    zz_89_ = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      zz_89_ = writeBack_DBusCachedPlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(zz_314_)
        2'b00 : begin
          zz_89_ = zz_375_;
        end
        default : begin
          zz_89_ = zz_376_;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_WR = memory_to_writeBack_MEMORY_WR;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_MEMORY_ATOMIC = decode_to_execute_MEMORY_ATOMIC;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_MEMORY_MANAGMENT;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_MEMORY_WR = decode_to_execute_MEMORY_WR;
  assign execute_SRC_ADD = zz_42_;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign decode_FLUSH_ALL = zz_62_;
  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected = zz_91_;
    zz_91_ = zz_92_;
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    IBusCachedPlugin_decodeExceptionPort_payload_code = (4'bxxxx);
    if(((zz_240_ && IBusCachedPlugin_cache_io_cpu_decode_mmuException) && (! zz_92_)))begin
      zz_91_ = 1'b1;
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
      IBusCachedPlugin_decodeExceptionPort_payload_code = (4'b1100);
    end
    if(((zz_240_ && IBusCachedPlugin_cache_io_cpu_decode_error) && (! zz_91_)))begin
      IBusCachedPlugin_rsp_issueDetected = 1'b1;
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
      IBusCachedPlugin_decodeExceptionPort_payload_code = (4'b0001);
    end
    if(IBusCachedPlugin_fetcherHalt)begin
      IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    end
  end

  always @ (*) begin
    zz_92_ = 1'b0;
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(((zz_240_ && (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss || IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling)) && (! 1'b0)))begin
      zz_92_ = 1'b1;
      IBusCachedPlugin_rsp_redoFetch = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @ (*) begin
    zz_93_ = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      zz_93_ = BranchPlugin_jumpInterface_payload;
    end
  end

  always @ (*) begin
    zz_94_ = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_redoBranch_valid)begin
      zz_94_ = IBusCachedPlugin_redoBranch_payload;
    end
  end

  assign decode_IS_RVC = zz_96_;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_PC = zz_98_;
  assign decode_INSTRUCTION = zz_97_;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    decode_arbitration_isValid = (IBusCachedPlugin_injector_decodeInput_valid && (! IBusCachedPlugin_injector_decodeRemoved));
    IBusCachedPlugin_injectionPort_ready = 1'b0;
    case(zz_233_)
      3'b000 : begin
      end
      3'b001 : begin
      end
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
        decode_arbitration_haltItself = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b100 : begin
        IBusCachedPlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    zz_243_ = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
    zz_244_ = execute_SRC_ADD;
    zz_245_ = execute_MEMORY_WR;
    zz_246_ = zz_162_;
    zz_247_ = execute_DBusCachedPlugin_size;
    zz_248_ = 1'b0;
    zz_249_ = 1'b0;
    if(execute_MEMORY_ATOMIC)begin
      zz_249_ = 1'b1;
    end
    MmuPlugin_dBusAccess_cmd_ready = 1'b0;
    DBusCachedPlugin_forceDatapath = 1'b0;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      decode_arbitration_haltByOther = 1'b1;
      if(((! ({writeBack_arbitration_isValid,{memory_arbitration_isValid,execute_arbitration_isValid}} != (3'b000))) && (! CsrPlugin_exceptionPending)))begin
        if((! dataCache_1__io_cpu_redo))begin
          zz_243_ = 1'b1;
          MmuPlugin_dBusAccess_cmd_ready = (! execute_arbitration_isStuck);
        end
        zz_245_ = MmuPlugin_dBusAccess_cmd_payload_write;
        zz_246_ = MmuPlugin_dBusAccess_cmd_payload_data;
        zz_247_ = MmuPlugin_dBusAccess_cmd_payload_size;
        zz_248_ = 1'b0;
        zz_249_ = 1'b0;
        zz_244_ = MmuPlugin_dBusAccess_cmd_payload_address;
        DBusCachedPlugin_forceDatapath = 1'b1;
      end
    end
    if((decode_arbitration_isValid && (zz_191_ || zz_192_)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_interrupt)begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != (3'b000)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(zz_284_)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(zz_216_)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_flushAll = 1'b0;
    execute_arbitration_removeIt = 1'b0;
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(CsrPlugin_selfException_valid)begin
      decode_arbitration_flushAll = 1'b1;
      execute_arbitration_removeIt = 1'b1;
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_redoIt = 1'b0;
  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    memory_arbitration_flushAll = 1'b0;
    writeBack_arbitration_removeIt = 1'b0;
    IBusCachedPlugin_fetcherHalt = 1'b0;
    IBusCachedPlugin_fetcherflushIt = 1'b0;
    CsrPlugin_jumpInterface_valid = 1'b0;
    CsrPlugin_jumpInterface_payload = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(DBusCachedPlugin_exceptionBus_valid)begin
      memory_arbitration_flushAll = 1'b1;
      writeBack_arbitration_removeIt = 1'b1;
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b1;
    end
    if(writeBack_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode}}} != (4'b0000)))begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(zz_285_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
      CsrPlugin_jumpInterface_valid = 1'b1;
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,(2'b00)};
      memory_arbitration_flushAll = 1'b1;
    end
    if(zz_286_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
      CsrPlugin_jumpInterface_valid = 1'b1;
      memory_arbitration_flushAll = 1'b1;
      case(zz_287_)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        2'b01 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_sepc;
        end
        default : begin
        end
      endcase
    end
    if(zz_288_)begin
      execute_arbitration_haltByOther = 1'b1;
      if(zz_289_)begin
        IBusCachedPlugin_fetcherflushIt = 1'b1;
        IBusCachedPlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(zz_290_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushAll = 1'b0;
    if(zz_288_)begin
      if(zz_289_)begin
        execute_arbitration_flushAll = 1'b1;
      end
    end
    if(BranchPlugin_jumpInterface_valid)begin
      execute_arbitration_flushAll = 1'b1;
    end
  end

  assign execute_arbitration_redoIt = 1'b0;
  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_redoIt = 1'b0;
  always @ (*) begin
    writeBack_arbitration_haltItself = 1'b0;
    if(dataCache_1__io_cpu_writeBack_haltIt)begin
      writeBack_arbitration_haltItself = 1'b1;
    end
  end

  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_flushAll = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid)begin
      writeBack_arbitration_flushAll = 1'b1;
    end
  end

  assign writeBack_arbitration_redoIt = 1'b0;
  always @ (*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if((IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid))begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
    if((IBusCachedPlugin_decompressor_bufferValid && (IBusCachedPlugin_decompressor_bufferData[1 : 0] != (2'b11))))begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
    if(IBusCachedPlugin_injector_decodeInput_valid)begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPending = 1'b0;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode}}} != (4'b0000)))begin
      CsrPlugin_exceptionPending = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if((DebugPlugin_haltIt || DebugPlugin_stepIt))begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_haltIt)begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  assign IBusCachedPlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,{DBusCachedPlugin_redoBranch_valid,IBusCachedPlugin_redoBranch_valid}}} != (4'b0000));
  assign zz_100_ = {IBusCachedPlugin_redoBranch_valid,{BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}};
  assign zz_101_ = (zz_100_ & (~ zz_316_));
  assign zz_102_ = zz_101_[3];
  assign zz_103_ = (zz_101_[1] || zz_102_);
  assign zz_104_ = (zz_101_[2] || zz_102_);
  assign IBusCachedPlugin_jump_pcLoad_payload = zz_259_;
  assign zz_105_ = (! IBusCachedPlugin_fetcherHalt);
  assign IBusCachedPlugin_fetchPc_output_valid = (IBusCachedPlugin_fetchPc_preOutput_valid && zz_105_);
  assign IBusCachedPlugin_fetchPc_preOutput_ready = (IBusCachedPlugin_fetchPc_output_ready && zz_105_);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_preOutput_payload;
  always @ (*) begin
    IBusCachedPlugin_fetchPc_propagatePc = 1'b0;
    if((IBusCachedPlugin_iBusRsp_stages_1_input_valid && IBusCachedPlugin_iBusRsp_stages_1_input_ready))begin
      IBusCachedPlugin_fetchPc_propagatePc = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + zz_318_);
    IBusCachedPlugin_fetchPc_samplePcNext = 1'b0;
    if(IBusCachedPlugin_fetchPc_inc)begin
      IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
    end
    if(IBusCachedPlugin_fetchPc_propagatePc)begin
      IBusCachedPlugin_fetchPc_samplePcNext = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_samplePcNext = 1'b1;
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    if(zz_291_)begin
      IBusCachedPlugin_fetchPc_samplePcNext = 1'b1;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
  end

  assign IBusCachedPlugin_fetchPc_preOutput_valid = zz_106_;
  assign IBusCachedPlugin_fetchPc_preOutput_payload = IBusCachedPlugin_fetchPc_pc;
  assign IBusCachedPlugin_decodePc_pcPlus = (IBusCachedPlugin_decodePc_pcReg + zz_320_);
  always @ (*) begin
    IBusCachedPlugin_decodePc_injectedDecode = 1'b0;
    if((zz_233_ != (3'b000)))begin
      IBusCachedPlugin_decodePc_injectedDecode = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_stages_0_input_valid = IBusCachedPlugin_fetchPc_output_valid;
  assign IBusCachedPlugin_fetchPc_output_ready = IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_payload = IBusCachedPlugin_fetchPc_output_payload;
  assign IBusCachedPlugin_iBusRsp_stages_0_inputSample = 1'b1;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign zz_107_ = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && zz_107_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && zz_107_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
  assign zz_108_ = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && zz_108_);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && zz_108_);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt = 1'b0;
    if((IBusCachedPlugin_rsp_issueDetected || IBusCachedPlugin_rsp_iBusRspOutputHalt))begin
      IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt = 1'b1;
    end
  end

  assign zz_109_ = (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_ready && zz_109_);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_valid = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid && zz_109_);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_payload = IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = zz_110_;
  assign zz_110_ = ((1'b0 && (! zz_111_)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign zz_111_ = zz_112_;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = zz_111_;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! zz_113_)) || IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready);
  assign zz_113_ = zz_114_;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid = zz_113_;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload = zz_115_;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
    if((IBusCachedPlugin_decompressor_bufferValid && IBusCachedPlugin_decompressor_isRvc))begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
    if(IBusCachedPlugin_injector_decodeInput_valid)begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusCachedPlugin_decompressor_raw = (IBusCachedPlugin_decompressor_bufferValid ? {IBusCachedPlugin_iBusRsp_output_payload_rsp_inst[15 : 0],IBusCachedPlugin_decompressor_bufferData} : {IBusCachedPlugin_iBusRsp_output_payload_rsp_inst[31 : 16],(IBusCachedPlugin_iBusRsp_output_payload_pc[1] ? IBusCachedPlugin_iBusRsp_output_payload_rsp_inst[31 : 16] : IBusCachedPlugin_iBusRsp_output_payload_rsp_inst[15 : 0])});
  assign IBusCachedPlugin_decompressor_isRvc = (IBusCachedPlugin_decompressor_raw[1 : 0] != (2'b11));
  assign zz_116_ = IBusCachedPlugin_decompressor_raw[15 : 0];
  always @ (*) begin
    IBusCachedPlugin_decompressor_decompressed = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    case(zz_309_)
      5'b00000 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{{{(2'b00),zz_116_[10 : 7]},zz_116_[12 : 11]},zz_116_[5]},zz_116_[6]},(2'b00)},(5'b00010)},(3'b000)},zz_118_},(7'b0010011)};
      end
      5'b00010 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{zz_119_,zz_117_},(3'b010)},zz_118_},(7'b0000011)};
      end
      5'b00110 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{zz_119_[11 : 5],zz_118_},zz_117_},(3'b010)},zz_119_[4 : 0]},(7'b0100011)};
      end
      5'b01000 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{zz_121_,zz_116_[11 : 7]},(3'b000)},zz_116_[11 : 7]},(7'b0010011)};
      end
      5'b01001 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{zz_124_[20],zz_124_[10 : 1]},zz_124_[11]},zz_124_[19 : 12]},zz_136_},(7'b1101111)};
      end
      5'b01010 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{zz_121_,(5'b00000)},(3'b000)},zz_116_[11 : 7]},(7'b0010011)};
      end
      5'b01011 : begin
        IBusCachedPlugin_decompressor_decompressed = ((zz_116_[11 : 7] == (5'b00010)) ? {{{{{{{{{zz_128_,zz_116_[4 : 3]},zz_116_[5]},zz_116_[2]},zz_116_[6]},(4'b0000)},zz_116_[11 : 7]},(3'b000)},zz_116_[11 : 7]},(7'b0010011)} : {{zz_321_[31 : 12],zz_116_[11 : 7]},(7'b0110111)});
      end
      5'b01100 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{((zz_116_[11 : 10] == (2'b10)) ? zz_142_ : {{(1'b0),(zz_458_ || zz_459_)},(5'b00000)}),(((! zz_116_[11]) || zz_138_) ? zz_116_[6 : 2] : zz_118_)},zz_117_},zz_140_},zz_117_},(zz_138_ ? (7'b0010011) : (7'b0110011))};
      end
      5'b01101 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{zz_131_[20],zz_131_[10 : 1]},zz_131_[11]},zz_131_[19 : 12]},zz_135_},(7'b1101111)};
      end
      5'b01110 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{zz_134_[12],zz_134_[10 : 5]},zz_135_},zz_117_},(3'b000)},zz_134_[4 : 1]},zz_134_[11]},(7'b1100011)};
      end
      5'b01111 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{zz_134_[12],zz_134_[10 : 5]},zz_135_},zz_117_},(3'b001)},zz_134_[4 : 1]},zz_134_[11]},(7'b1100011)};
      end
      5'b10000 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{(7'b0000000),zz_116_[6 : 2]},zz_116_[11 : 7]},(3'b001)},zz_116_[11 : 7]},(7'b0010011)};
      end
      5'b10010 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{{(4'b0000),zz_116_[3 : 2]},zz_116_[12]},zz_116_[6 : 4]},(2'b00)},zz_137_},(3'b010)},zz_116_[11 : 7]},(7'b0000011)};
      end
      5'b10100 : begin
        IBusCachedPlugin_decompressor_decompressed = ((zz_116_[12 : 2] == (11'b10000000000)) ? (32'b00000000000100000000000001110011) : ((zz_116_[6 : 2] == (5'b00000)) ? {{{{(12'b000000000000),zz_116_[11 : 7]},(3'b000)},(zz_116_[12] ? zz_136_ : zz_135_)},(7'b1100111)} : {{{{{zz_460_,zz_461_},(zz_462_ ? zz_463_ : zz_135_)},(3'b000)},zz_116_[11 : 7]},(7'b0110011)}));
      end
      5'b10110 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{zz_322_[11 : 5],zz_116_[6 : 2]},zz_137_},(3'b010)},zz_323_[4 : 0]},(7'b0100011)};
      end
      default : begin
      end
    endcase
  end

  assign zz_117_ = {(2'b01),zz_116_[9 : 7]};
  assign zz_118_ = {(2'b01),zz_116_[4 : 2]};
  assign zz_119_ = {{{{(5'b00000),zz_116_[5]},zz_116_[12 : 10]},zz_116_[6]},(2'b00)};
  assign zz_120_ = zz_116_[12];
  always @ (*) begin
    zz_121_[11] = zz_120_;
    zz_121_[10] = zz_120_;
    zz_121_[9] = zz_120_;
    zz_121_[8] = zz_120_;
    zz_121_[7] = zz_120_;
    zz_121_[6] = zz_120_;
    zz_121_[5] = zz_120_;
    zz_121_[4 : 0] = zz_116_[6 : 2];
  end

  assign zz_122_ = zz_116_[12];
  always @ (*) begin
    zz_123_[9] = zz_122_;
    zz_123_[8] = zz_122_;
    zz_123_[7] = zz_122_;
    zz_123_[6] = zz_122_;
    zz_123_[5] = zz_122_;
    zz_123_[4] = zz_122_;
    zz_123_[3] = zz_122_;
    zz_123_[2] = zz_122_;
    zz_123_[1] = zz_122_;
    zz_123_[0] = zz_122_;
  end

  assign zz_124_ = {{{{{{{{zz_123_,zz_116_[8]},zz_116_[10 : 9]},zz_116_[6]},zz_116_[7]},zz_116_[2]},zz_116_[11]},zz_116_[5 : 3]},(1'b0)};
  assign zz_125_ = zz_116_[12];
  always @ (*) begin
    zz_126_[14] = zz_125_;
    zz_126_[13] = zz_125_;
    zz_126_[12] = zz_125_;
    zz_126_[11] = zz_125_;
    zz_126_[10] = zz_125_;
    zz_126_[9] = zz_125_;
    zz_126_[8] = zz_125_;
    zz_126_[7] = zz_125_;
    zz_126_[6] = zz_125_;
    zz_126_[5] = zz_125_;
    zz_126_[4] = zz_125_;
    zz_126_[3] = zz_125_;
    zz_126_[2] = zz_125_;
    zz_126_[1] = zz_125_;
    zz_126_[0] = zz_125_;
  end

  assign zz_127_ = zz_116_[12];
  always @ (*) begin
    zz_128_[2] = zz_127_;
    zz_128_[1] = zz_127_;
    zz_128_[0] = zz_127_;
  end

  assign zz_129_ = zz_116_[12];
  always @ (*) begin
    zz_130_[9] = zz_129_;
    zz_130_[8] = zz_129_;
    zz_130_[7] = zz_129_;
    zz_130_[6] = zz_129_;
    zz_130_[5] = zz_129_;
    zz_130_[4] = zz_129_;
    zz_130_[3] = zz_129_;
    zz_130_[2] = zz_129_;
    zz_130_[1] = zz_129_;
    zz_130_[0] = zz_129_;
  end

  assign zz_131_ = {{{{{{{{zz_130_,zz_116_[8]},zz_116_[10 : 9]},zz_116_[6]},zz_116_[7]},zz_116_[2]},zz_116_[11]},zz_116_[5 : 3]},(1'b0)};
  assign zz_132_ = zz_116_[12];
  always @ (*) begin
    zz_133_[4] = zz_132_;
    zz_133_[3] = zz_132_;
    zz_133_[2] = zz_132_;
    zz_133_[1] = zz_132_;
    zz_133_[0] = zz_132_;
  end

  assign zz_134_ = {{{{{zz_133_,zz_116_[6 : 5]},zz_116_[2]},zz_116_[11 : 10]},zz_116_[4 : 3]},(1'b0)};
  assign zz_135_ = (5'b00000);
  assign zz_136_ = (5'b00001);
  assign zz_137_ = (5'b00010);
  assign zz_138_ = (zz_116_[11 : 10] != (2'b11));
  always @ (*) begin
    case(zz_310_)
      2'b00 : begin
        zz_139_ = (3'b000);
      end
      2'b01 : begin
        zz_139_ = (3'b100);
      end
      2'b10 : begin
        zz_139_ = (3'b110);
      end
      default : begin
        zz_139_ = (3'b111);
      end
    endcase
  end

  always @ (*) begin
    case(zz_311_)
      2'b00 : begin
        zz_140_ = (3'b101);
      end
      2'b01 : begin
        zz_140_ = (3'b101);
      end
      2'b10 : begin
        zz_140_ = (3'b111);
      end
      default : begin
        zz_140_ = zz_139_;
      end
    endcase
  end

  assign zz_141_ = zz_116_[12];
  always @ (*) begin
    zz_142_[6] = zz_141_;
    zz_142_[5] = zz_141_;
    zz_142_[4] = zz_141_;
    zz_142_[3] = zz_141_;
    zz_142_[2] = zz_141_;
    zz_142_[1] = zz_141_;
    zz_142_[0] = zz_141_;
  end

  assign IBusCachedPlugin_decompressor_inputBeforeStage_valid = (IBusCachedPlugin_decompressor_isRvc ? (IBusCachedPlugin_decompressor_bufferValid || IBusCachedPlugin_iBusRsp_output_valid) : (IBusCachedPlugin_iBusRsp_output_valid && (IBusCachedPlugin_decompressor_bufferValid || (! IBusCachedPlugin_iBusRsp_output_payload_pc[1]))));
  assign IBusCachedPlugin_decompressor_inputBeforeStage_payload_pc = IBusCachedPlugin_iBusRsp_output_payload_pc;
  assign IBusCachedPlugin_decompressor_inputBeforeStage_payload_isRvc = IBusCachedPlugin_decompressor_isRvc;
  assign IBusCachedPlugin_decompressor_inputBeforeStage_payload_rsp_inst = (IBusCachedPlugin_decompressor_isRvc ? IBusCachedPlugin_decompressor_decompressed : IBusCachedPlugin_decompressor_raw);
  assign IBusCachedPlugin_iBusRsp_output_ready = ((! IBusCachedPlugin_decompressor_inputBeforeStage_valid) || (! (((! IBusCachedPlugin_decompressor_inputBeforeStage_ready) || ((IBusCachedPlugin_decompressor_isRvc && (! IBusCachedPlugin_iBusRsp_output_payload_pc[1])) && (IBusCachedPlugin_iBusRsp_output_payload_rsp_inst[17 : 16] != (2'b11)))) || (((! IBusCachedPlugin_decompressor_isRvc) && IBusCachedPlugin_decompressor_bufferValid) && (IBusCachedPlugin_iBusRsp_output_payload_rsp_inst[17 : 16] != (2'b11))))));
  assign IBusCachedPlugin_decompressor_inputBeforeStage_ready = ((1'b0 && (! IBusCachedPlugin_injector_decodeInput_valid)) || IBusCachedPlugin_injector_decodeInput_ready);
  assign IBusCachedPlugin_injector_decodeInput_valid = zz_143_;
  assign IBusCachedPlugin_injector_decodeInput_payload_pc = zz_144_;
  assign IBusCachedPlugin_injector_decodeInput_payload_rsp_error = zz_145_;
  assign IBusCachedPlugin_injector_decodeInput_payload_rsp_inst = zz_146_;
  assign IBusCachedPlugin_injector_decodeInput_payload_isRvc = zz_147_;
  assign zz_99_ = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_decompressor_inputBeforeStage_payload_rsp_inst);
  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_0;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_1;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  assign zz_98_ = IBusCachedPlugin_decodePc_pcReg;
  assign zz_97_ = IBusCachedPlugin_injector_decodeInput_payload_rsp_inst;
  assign zz_96_ = IBusCachedPlugin_injector_decodeInput_payload_isRvc;
  assign zz_95_ = (decode_PC + zz_325_);
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign zz_235_ = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign zz_238_ = (IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt);
  assign zz_239_ = (32'b00000000000000000000000000000000);
  assign zz_236_ = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign zz_237_ = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign zz_240_ = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign zz_241_ = (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready);
  assign zz_242_ = (CsrPlugin_privilege == (2'b00));
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_redoBranch_valid = IBusCachedPlugin_rsp_redoFetch;
  assign IBusCachedPlugin_redoBranch_payload = decode_PC;
  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload[31 : 2],(2'b00)};
  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_valid;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_payload;
  assign IBusCachedPlugin_mmuBus_cmd_isValid = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid;
  assign IBusCachedPlugin_mmuBus_cmd_virtualAddress = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress;
  assign IBusCachedPlugin_mmuBus_cmd_bypassTranslation = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation;
  assign IBusCachedPlugin_mmuBus_end = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end;
  assign zz_234_ = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign dataCache_1__io_mem_cmd_s2mPipe_valid = (dataCache_1__io_mem_cmd_valid || zz_148_);
  assign zz_256_ = (! zz_148_);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_wr = (zz_148_ ? zz_149_ : dataCache_1__io_mem_cmd_payload_wr);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_address = (zz_148_ ? zz_150_ : dataCache_1__io_mem_cmd_payload_address);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_data = (zz_148_ ? zz_151_ : dataCache_1__io_mem_cmd_payload_data);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_mask = (zz_148_ ? zz_152_ : dataCache_1__io_mem_cmd_payload_mask);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_length = (zz_148_ ? zz_153_ : dataCache_1__io_mem_cmd_payload_length);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_last = (zz_148_ ? zz_154_ : dataCache_1__io_mem_cmd_payload_last);
  assign dataCache_1__io_mem_cmd_s2mPipe_ready = ((1'b1 && (! dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_valid)) || dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_ready);
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_valid = zz_155_;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_wr = zz_156_;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_address = zz_157_;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_data = zz_158_;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_mask = zz_159_;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_length = zz_160_;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_last = zz_161_;
  assign dBus_cmd_valid = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_valid;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_ready = dBus_cmd_ready;
  assign dBus_cmd_payload_wr = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_wr;
  assign dBus_cmd_payload_address = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_address;
  assign dBus_cmd_payload_data = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_data;
  assign dBus_cmd_payload_mask = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_mask;
  assign dBus_cmd_payload_length = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_length;
  assign dBus_cmd_payload_last = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_last;
  assign execute_DBusCachedPlugin_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        zz_162_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        zz_162_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        zz_162_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign zz_255_ = (execute_arbitration_isValid && execute_MEMORY_MANAGMENT);
  assign zz_90_ = zz_244_[1 : 0];
  always @ (*) begin
    zz_250_ = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
    if(memory_IS_DBUS_SHARING)begin
      zz_250_ = 1'b1;
    end
  end

  assign zz_251_ = memory_REGFILE_WRITE_DATA;
  assign DBusCachedPlugin_mmuBus_cmd_isValid = dataCache_1__io_cpu_memory_mmuBus_cmd_isValid;
  assign DBusCachedPlugin_mmuBus_cmd_virtualAddress = dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress;
  always @ (*) begin
    DBusCachedPlugin_mmuBus_cmd_bypassTranslation = dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation;
    if(memory_IS_DBUS_SHARING)begin
      DBusCachedPlugin_mmuBus_cmd_bypassTranslation = 1'b1;
    end
  end

  assign DBusCachedPlugin_mmuBus_end = dataCache_1__io_cpu_memory_mmuBus_end;
  always @ (*) begin
    zz_252_ = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
    if(writeBack_IS_DBUS_SHARING)begin
      zz_252_ = 1'b1;
    end
  end

  assign zz_253_ = (CsrPlugin_privilege == (2'b00));
  assign zz_254_ = writeBack_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusCachedPlugin_exceptionBus_valid = 1'b0;
    DBusCachedPlugin_exceptionBus_payload_code = (4'bxxxx);
    DBusCachedPlugin_redoBranch_valid = 1'b0;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      if(dataCache_1__io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, zz_326_};
      end
      if(dataCache_1__io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, zz_327_};
      end
      if(dataCache_1__io_cpu_writeBack_mmuException)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
        DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? (4'b1111) : (4'b1101));
      end
      if(dataCache_1__io_cpu_redo)begin
        DBusCachedPlugin_redoBranch_valid = 1'b1;
        DBusCachedPlugin_exceptionBus_valid = 1'b0;
      end
    end
  end

  assign DBusCachedPlugin_exceptionBus_payload_badAddr = writeBack_REGFILE_WRITE_DATA;
  assign DBusCachedPlugin_redoBranch_payload = writeBack_PC;
  always @ (*) begin
    writeBack_DBusCachedPlugin_rspShifted = dataCache_1__io_cpu_writeBack_data;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1__io_cpu_writeBack_data[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusCachedPlugin_rspShifted[15 : 0] = dataCache_1__io_cpu_writeBack_data[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1__io_cpu_writeBack_data[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign zz_163_ = (writeBack_DBusCachedPlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    zz_164_[31] = zz_163_;
    zz_164_[30] = zz_163_;
    zz_164_[29] = zz_163_;
    zz_164_[28] = zz_163_;
    zz_164_[27] = zz_163_;
    zz_164_[26] = zz_163_;
    zz_164_[25] = zz_163_;
    zz_164_[24] = zz_163_;
    zz_164_[23] = zz_163_;
    zz_164_[22] = zz_163_;
    zz_164_[21] = zz_163_;
    zz_164_[20] = zz_163_;
    zz_164_[19] = zz_163_;
    zz_164_[18] = zz_163_;
    zz_164_[17] = zz_163_;
    zz_164_[16] = zz_163_;
    zz_164_[15] = zz_163_;
    zz_164_[14] = zz_163_;
    zz_164_[13] = zz_163_;
    zz_164_[12] = zz_163_;
    zz_164_[11] = zz_163_;
    zz_164_[10] = zz_163_;
    zz_164_[9] = zz_163_;
    zz_164_[8] = zz_163_;
    zz_164_[7 : 0] = writeBack_DBusCachedPlugin_rspShifted[7 : 0];
  end

  assign zz_165_ = (writeBack_DBusCachedPlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    zz_166_[31] = zz_165_;
    zz_166_[30] = zz_165_;
    zz_166_[29] = zz_165_;
    zz_166_[28] = zz_165_;
    zz_166_[27] = zz_165_;
    zz_166_[26] = zz_165_;
    zz_166_[25] = zz_165_;
    zz_166_[24] = zz_165_;
    zz_166_[23] = zz_165_;
    zz_166_[22] = zz_165_;
    zz_166_[21] = zz_165_;
    zz_166_[20] = zz_165_;
    zz_166_[19] = zz_165_;
    zz_166_[18] = zz_165_;
    zz_166_[17] = zz_165_;
    zz_166_[16] = zz_165_;
    zz_166_[15 : 0] = writeBack_DBusCachedPlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(zz_312_)
      2'b00 : begin
        writeBack_DBusCachedPlugin_rspFormated = zz_164_;
      end
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspFormated = zz_166_;
      end
      default : begin
        writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspShifted;
      end
    endcase
  end

  assign zz_88_ = (MmuPlugin_dBusAccess_cmd_valid && MmuPlugin_dBusAccess_cmd_ready);
  assign MmuPlugin_dBusAccess_rsp_valid = ((writeBack_IS_DBUS_SHARING && (! dataCache_1__io_cpu_writeBack_isWrite)) && (dataCache_1__io_cpu_redo || (! dataCache_1__io_cpu_writeBack_haltIt)));
  assign MmuPlugin_dBusAccess_rsp_payload_data = dataCache_1__io_cpu_writeBack_data;
  assign MmuPlugin_dBusAccess_rsp_payload_error = (dataCache_1__io_cpu_writeBack_unalignedAccess || dataCache_1__io_cpu_writeBack_accessError);
  assign MmuPlugin_dBusAccess_rsp_payload_redo = dataCache_1__io_cpu_redo;
  assign zz_168_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000001100)) == (32'b00000000000000000000000000000100));
  assign zz_169_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001010000)) == (32'b00000000000000000100000001010000));
  assign zz_170_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001001000)) == (32'b00000000000000000000000001001000));
  assign zz_171_ = ((decode_INSTRUCTION & (32'b00000000000000000010000001010000)) == (32'b00000000000000000010000000000000));
  assign zz_172_ = ((decode_INSTRUCTION & (32'b00000000000000000001000000000000)) == (32'b00000000000000000000000000000000));
  assign zz_173_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign zz_167_ = {(((decode_INSTRUCTION & zz_464_) == (32'b00000000000000000100000000001000)) != (1'b0)),{({zz_173_,zz_465_} != (2'b00)),{({zz_466_,zz_467_} != (2'b00)),{(zz_468_ != zz_469_),{zz_470_,{zz_471_,zz_472_}}}}}};
  assign zz_87_ = ({((decode_INSTRUCTION & (32'b00000000000000000000000001011111)) == (32'b00000000000000000000000000010111)),{((decode_INSTRUCTION & (32'b00000000000000000000000001111111)) == (32'b00000000000000000000000001101111)),{((decode_INSTRUCTION & (32'b00000000000000000001000001101111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & zz_642_) == (32'b00000000000000000001000001110011)),{(zz_643_ == zz_644_),{zz_645_,{zz_646_,zz_647_}}}}}}} != (24'b000000000000000000000000));
  assign zz_174_ = zz_167_[1 : 0];
  assign zz_86_ = zz_174_;
  assign zz_85_ = zz_328_[0];
  assign zz_84_ = zz_329_[0];
  assign zz_83_ = zz_330_[0];
  assign zz_82_ = zz_331_[0];
  assign zz_175_ = zz_167_[7 : 6];
  assign zz_81_ = zz_175_;
  assign zz_80_ = zz_332_[0];
  assign zz_79_ = zz_333_[0];
  assign zz_78_ = zz_334_[0];
  assign zz_77_ = zz_335_[0];
  assign zz_176_ = zz_167_[13 : 12];
  assign zz_76_ = zz_176_;
  assign zz_75_ = zz_336_[0];
  assign zz_74_ = zz_337_[0];
  assign zz_177_ = zz_167_[17 : 16];
  assign zz_73_ = zz_177_;
  assign zz_178_ = zz_167_[19 : 18];
  assign zz_72_ = zz_178_;
  assign zz_179_ = zz_167_[21 : 20];
  assign zz_71_ = zz_179_;
  assign zz_70_ = zz_338_[0];
  assign zz_69_ = zz_339_[0];
  assign zz_68_ = zz_340_[0];
  assign zz_67_ = zz_341_[0];
  assign zz_66_ = zz_342_[0];
  assign zz_65_ = zz_343_[0];
  assign zz_64_ = zz_344_[0];
  assign zz_63_ = zz_345_[0];
  assign zz_62_ = zz_346_[0];
  assign zz_180_ = zz_167_[33 : 32];
  assign zz_61_ = zz_180_;
  assign zz_60_ = zz_347_[0];
  assign decodeExceptionPort_valid = ((decode_arbitration_isValid && decode_INSTRUCTION_READY) && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = (4'b0010);
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = zz_257_;
  assign decode_RegFilePlugin_rs2Data = zz_258_;
  assign zz_59_ = decode_RegFilePlugin_rs1Data;
  assign zz_58_ = decode_RegFilePlugin_rs2Data;
  always @ (*) begin
    writeBack_RegFilePlugin_regFileWrite_valid = (zz_56_ && writeBack_arbitration_isFiring);
    if(zz_181_)begin
      writeBack_RegFilePlugin_regFileWrite_valid = 1'b1;
    end
  end

  assign writeBack_RegFilePlugin_regFileWrite_payload_address = zz_55_[11 : 7];
  assign writeBack_RegFilePlugin_regFileWrite_payload_data = zz_89_;
  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        zz_182_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        zz_182_ = {31'd0, zz_348_};
      end
      default : begin
        zz_182_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign zz_53_ = zz_182_;
  assign zz_51_ = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  always @ (*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        zz_183_ = zz_48_;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        zz_183_ = {29'd0, zz_349_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        zz_183_ = {decode_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
      default : begin
        zz_183_ = {27'd0, zz_350_};
      end
    endcase
  end

  assign zz_50_ = zz_183_;
  assign zz_184_ = zz_351_[11];
  always @ (*) begin
    zz_185_[19] = zz_184_;
    zz_185_[18] = zz_184_;
    zz_185_[17] = zz_184_;
    zz_185_[16] = zz_184_;
    zz_185_[15] = zz_184_;
    zz_185_[14] = zz_184_;
    zz_185_[13] = zz_184_;
    zz_185_[12] = zz_184_;
    zz_185_[11] = zz_184_;
    zz_185_[10] = zz_184_;
    zz_185_[9] = zz_184_;
    zz_185_[8] = zz_184_;
    zz_185_[7] = zz_184_;
    zz_185_[6] = zz_184_;
    zz_185_[5] = zz_184_;
    zz_185_[4] = zz_184_;
    zz_185_[3] = zz_184_;
    zz_185_[2] = zz_184_;
    zz_185_[1] = zz_184_;
    zz_185_[0] = zz_184_;
  end

  assign zz_186_ = zz_352_[11];
  always @ (*) begin
    zz_187_[19] = zz_186_;
    zz_187_[18] = zz_186_;
    zz_187_[17] = zz_186_;
    zz_187_[16] = zz_186_;
    zz_187_[15] = zz_186_;
    zz_187_[14] = zz_186_;
    zz_187_[13] = zz_186_;
    zz_187_[12] = zz_186_;
    zz_187_[11] = zz_186_;
    zz_187_[10] = zz_186_;
    zz_187_[9] = zz_186_;
    zz_187_[8] = zz_186_;
    zz_187_[7] = zz_186_;
    zz_187_[6] = zz_186_;
    zz_187_[5] = zz_186_;
    zz_187_[4] = zz_186_;
    zz_187_[3] = zz_186_;
    zz_187_[2] = zz_186_;
    zz_187_[1] = zz_186_;
    zz_187_[0] = zz_186_;
  end

  always @ (*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        zz_188_ = zz_45_;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        zz_188_ = {zz_185_,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        zz_188_ = {zz_187_,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        zz_188_ = zz_44_;
      end
    endcase
  end

  assign zz_47_ = zz_188_;
  always @ (*) begin
    execute_SrcPlugin_addSub = zz_353_;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign zz_43_ = execute_SrcPlugin_addSub;
  assign zz_42_ = execute_SrcPlugin_addSub;
  assign zz_41_ = execute_SrcPlugin_less;
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    zz_189_[0] = execute_SRC1[31];
    zz_189_[1] = execute_SRC1[30];
    zz_189_[2] = execute_SRC1[29];
    zz_189_[3] = execute_SRC1[28];
    zz_189_[4] = execute_SRC1[27];
    zz_189_[5] = execute_SRC1[26];
    zz_189_[6] = execute_SRC1[25];
    zz_189_[7] = execute_SRC1[24];
    zz_189_[8] = execute_SRC1[23];
    zz_189_[9] = execute_SRC1[22];
    zz_189_[10] = execute_SRC1[21];
    zz_189_[11] = execute_SRC1[20];
    zz_189_[12] = execute_SRC1[19];
    zz_189_[13] = execute_SRC1[18];
    zz_189_[14] = execute_SRC1[17];
    zz_189_[15] = execute_SRC1[16];
    zz_189_[16] = execute_SRC1[15];
    zz_189_[17] = execute_SRC1[14];
    zz_189_[18] = execute_SRC1[13];
    zz_189_[19] = execute_SRC1[12];
    zz_189_[20] = execute_SRC1[11];
    zz_189_[21] = execute_SRC1[10];
    zz_189_[22] = execute_SRC1[9];
    zz_189_[23] = execute_SRC1[8];
    zz_189_[24] = execute_SRC1[7];
    zz_189_[25] = execute_SRC1[6];
    zz_189_[26] = execute_SRC1[5];
    zz_189_[27] = execute_SRC1[4];
    zz_189_[28] = execute_SRC1[3];
    zz_189_[29] = execute_SRC1[2];
    zz_189_[30] = execute_SRC1[1];
    zz_189_[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? zz_189_ : execute_SRC1);
  assign zz_39_ = zz_362_;
  always @ (*) begin
    zz_190_[0] = memory_SHIFT_RIGHT[31];
    zz_190_[1] = memory_SHIFT_RIGHT[30];
    zz_190_[2] = memory_SHIFT_RIGHT[29];
    zz_190_[3] = memory_SHIFT_RIGHT[28];
    zz_190_[4] = memory_SHIFT_RIGHT[27];
    zz_190_[5] = memory_SHIFT_RIGHT[26];
    zz_190_[6] = memory_SHIFT_RIGHT[25];
    zz_190_[7] = memory_SHIFT_RIGHT[24];
    zz_190_[8] = memory_SHIFT_RIGHT[23];
    zz_190_[9] = memory_SHIFT_RIGHT[22];
    zz_190_[10] = memory_SHIFT_RIGHT[21];
    zz_190_[11] = memory_SHIFT_RIGHT[20];
    zz_190_[12] = memory_SHIFT_RIGHT[19];
    zz_190_[13] = memory_SHIFT_RIGHT[18];
    zz_190_[14] = memory_SHIFT_RIGHT[17];
    zz_190_[15] = memory_SHIFT_RIGHT[16];
    zz_190_[16] = memory_SHIFT_RIGHT[15];
    zz_190_[17] = memory_SHIFT_RIGHT[14];
    zz_190_[18] = memory_SHIFT_RIGHT[13];
    zz_190_[19] = memory_SHIFT_RIGHT[12];
    zz_190_[20] = memory_SHIFT_RIGHT[11];
    zz_190_[21] = memory_SHIFT_RIGHT[10];
    zz_190_[22] = memory_SHIFT_RIGHT[9];
    zz_190_[23] = memory_SHIFT_RIGHT[8];
    zz_190_[24] = memory_SHIFT_RIGHT[7];
    zz_190_[25] = memory_SHIFT_RIGHT[6];
    zz_190_[26] = memory_SHIFT_RIGHT[5];
    zz_190_[27] = memory_SHIFT_RIGHT[4];
    zz_190_[28] = memory_SHIFT_RIGHT[3];
    zz_190_[29] = memory_SHIFT_RIGHT[2];
    zz_190_[30] = memory_SHIFT_RIGHT[1];
    zz_190_[31] = memory_SHIFT_RIGHT[0];
  end

  always @ (*) begin
    zz_191_ = 1'b0;
    zz_192_ = 1'b0;
    if((writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID))begin
      if((1'b0 || (! 1'b1)))begin
        if(zz_197_)begin
          zz_191_ = 1'b1;
        end
        if(zz_198_)begin
          zz_192_ = 1'b1;
        end
      end
    end
    if((memory_arbitration_isValid && memory_REGFILE_WRITE_VALID))begin
      if((1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE)))begin
        if(zz_199_)begin
          zz_191_ = 1'b1;
        end
        if(zz_200_)begin
          zz_192_ = 1'b1;
        end
      end
    end
    if((execute_arbitration_isValid && execute_REGFILE_WRITE_VALID))begin
      if((1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE)))begin
        if(zz_201_)begin
          zz_191_ = 1'b1;
        end
        if(zz_202_)begin
          zz_192_ = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      zz_191_ = 1'b0;
    end
    if((! decode_RS2_USE))begin
      zz_192_ = 1'b0;
    end
  end

  assign zz_193_ = (zz_56_ && writeBack_arbitration_isFiring);
  assign zz_197_ = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign zz_198_ = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign zz_199_ = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign zz_200_ = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign zz_201_ = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign zz_202_ = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_MulPlugin_a = execute_SRC1;
  assign execute_MulPlugin_b = execute_SRC2;
  always @ (*) begin
    case(zz_313_)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign zz_35_ = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign zz_34_ = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign zz_33_ = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign zz_32_ = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign zz_31_ = ($signed(zz_364_) + $signed(zz_372_));
  assign writeBack_MulPlugin_result = ($signed(zz_373_) + $signed(zz_374_));
  always @ (*) begin
    memory_MulDivIterativePlugin_div_counter_willClear = 1'b0;
    if(zz_292_)begin
      memory_MulDivIterativePlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_div_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_div_counter_value == (6'b100001));
  assign memory_MulDivIterativePlugin_div_counter_willOverflow = (memory_MulDivIterativePlugin_div_counter_willOverflowIfInc && memory_MulDivIterativePlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_MulDivIterativePlugin_div_counter_willOverflow)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (6'b000000);
    end else begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (memory_MulDivIterativePlugin_div_counter_value + zz_378_);
    end
    if(memory_MulDivIterativePlugin_div_counter_willClear)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (6'b000000);
    end
  end

  assign zz_203_ = memory_MulDivIterativePlugin_rs1[31 : 0];
  assign zz_204_ = {memory_MulDivIterativePlugin_accumulator[31 : 0],zz_203_[31]};
  assign zz_205_ = (zz_204_ - zz_379_);
  assign zz_206_ = (memory_INSTRUCTION[13] ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_rs1[31 : 0]);
  assign zz_207_ = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign zz_208_ = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    zz_209_[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    zz_209_[31 : 0] = execute_RS1;
  end

  assign CsrPlugin_sip_SEIP_OR = (CsrPlugin_sip_SEIP_SOFT || CsrPlugin_sip_SEIP_INPUT);
  assign zz_210_ = (CsrPlugin_sip_STIP && CsrPlugin_sie_STIE);
  assign zz_211_ = (CsrPlugin_sip_SSIP && CsrPlugin_sie_SSIE);
  assign zz_212_ = (CsrPlugin_sip_SEIP_OR && CsrPlugin_sie_SEIE);
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b11);
    case(CsrPlugin_exceptionPortCtrl_exceptionContext_code)
      4'b1000 : begin
        if(((1'b1 && CsrPlugin_medeleg_EU) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b01);
        end
      end
      4'b0010 : begin
        if(((1'b1 && CsrPlugin_medeleg_II) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b01);
        end
      end
      4'b0101 : begin
        if(((1'b1 && CsrPlugin_medeleg_LAF) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b01);
        end
      end
      4'b1101 : begin
        if(((1'b1 && CsrPlugin_medeleg_LPF) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b01);
        end
      end
      4'b0100 : begin
        if(((1'b1 && CsrPlugin_medeleg_LAM) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b01);
        end
      end
      4'b0111 : begin
        if(((1'b1 && CsrPlugin_medeleg_SAF) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b01);
        end
      end
      4'b0001 : begin
        if(((1'b1 && CsrPlugin_medeleg_IAF) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b01);
        end
      end
      4'b1001 : begin
        if(((1'b1 && CsrPlugin_medeleg_ES) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b01);
        end
      end
      4'b1100 : begin
        if(((1'b1 && CsrPlugin_medeleg_IPF) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b01);
        end
      end
      4'b1111 : begin
        if(((1'b1 && CsrPlugin_medeleg_SPF) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b01);
        end
      end
      4'b0110 : begin
        if(((1'b1 && CsrPlugin_medeleg_SAM) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b01);
        end
      end
      4'b0000 : begin
        if(((1'b1 && CsrPlugin_medeleg_IAM) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b01);
        end
      end
      default : begin
      end
    endcase
  end

  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign zz_213_ = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign zz_214_ = zz_392_[0];
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(zz_284_)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(memory_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_interrupt = 1'b0;
    CsrPlugin_interruptCode = (4'bxxxx);
    CsrPlugin_interruptTargetPrivilege = (2'bxx);
    if(((CsrPlugin_sstatus_SIE && (CsrPlugin_privilege == (2'b01))) || (CsrPlugin_privilege < (2'b01))))begin
      if(((zz_210_ && (1'b1 && CsrPlugin_mideleg_ST)) && (! 1'b0)))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b0101);
        CsrPlugin_interruptTargetPrivilege = (2'b01);
      end
      if(((zz_211_ && (1'b1 && CsrPlugin_mideleg_SS)) && (! 1'b0)))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b0001);
        CsrPlugin_interruptTargetPrivilege = (2'b01);
      end
      if(((zz_212_ && (1'b1 && CsrPlugin_mideleg_SE)) && (! 1'b0)))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b1001);
        CsrPlugin_interruptTargetPrivilege = (2'b01);
      end
    end
    if((CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < (2'b11))))begin
      if(((zz_210_ && 1'b1) && (! (CsrPlugin_mideleg_ST != (1'b0)))))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b0101);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
      if(((zz_211_ && 1'b1) && (! (CsrPlugin_mideleg_SS != (1'b0)))))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b0001);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
      if(((zz_212_ && 1'b1) && (! (CsrPlugin_mideleg_SE != (1'b0)))))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b1001);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
      if((((CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE) && 1'b1) && (! 1'b0)))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b0111);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
      if((((CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE) && 1'b1) && (! 1'b0)))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b0011);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
      if((((CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE) && 1'b1) && (! 1'b0)))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b1011);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
    end
    if((! CsrPlugin_allowInterrupts))begin
      CsrPlugin_interrupt = 1'b0;
    end
  end

  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = ((! ({writeBack_arbitration_isValid,{memory_arbitration_isValid,execute_arbitration_isValid}} != (3'b000))) && IBusCachedPlugin_pcValids_3);
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != (3'b000)))begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = (CsrPlugin_interrupt && CsrPlugin_pipelineLiberator_done);
  always @ (*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interruptTargetPrivilege;
    if(CsrPlugin_hadException)begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @ (*) begin
    CsrPlugin_trapCause = CsrPlugin_interruptCode;
    if(CsrPlugin_hadException)begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  always @ (*) begin
    CsrPlugin_xtvec_mode = (2'bxx);
    CsrPlugin_xtvec_base = (30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    case(CsrPlugin_targetPrivilege)
      2'b01 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_stvec_mode;
        CsrPlugin_xtvec_base = CsrPlugin_stvec_base;
      end
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign zz_29_ = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign zz_28_ = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
  assign execute_CsrPlugin_blockedBySideEffects = ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00));
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    execute_CsrPlugin_readData = (32'b00000000000000000000000000000000);
    case(execute_CsrPlugin_csrAddress)
      12'b001100000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[12 : 11] = CsrPlugin_mstatus_MPP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mstatus_MPIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mstatus_MIE;
        execute_CsrPlugin_readData[8 : 8] = CsrPlugin_sstatus_SPP;
        execute_CsrPlugin_readData[5 : 5] = CsrPlugin_sstatus_SPIE;
        execute_CsrPlugin_readData[1 : 1] = CsrPlugin_sstatus_SIE;
        execute_CsrPlugin_readData[19 : 19] = MmuPlugin_status_mxr;
        execute_CsrPlugin_readData[18 : 18] = MmuPlugin_status_sum;
        execute_CsrPlugin_readData[17 : 17] = MmuPlugin_status_mprv;
      end
      12'b001100000011 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[9 : 9] = CsrPlugin_mideleg_SE;
        execute_CsrPlugin_readData[5 : 5] = CsrPlugin_mideleg_ST;
        execute_CsrPlugin_readData[1 : 1] = CsrPlugin_mideleg_SS;
      end
      12'b111100010001 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[0 : 0] = (1'b1);
      end
      12'b000101000010 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 31] = CsrPlugin_scause_interrupt;
        execute_CsrPlugin_readData[3 : 0] = CsrPlugin_scause_exceptionCode;
      end
      12'b111100010100 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b000100000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[8 : 8] = CsrPlugin_sstatus_SPP;
        execute_CsrPlugin_readData[5 : 5] = CsrPlugin_sstatus_SPIE;
        execute_CsrPlugin_readData[1 : 1] = CsrPlugin_sstatus_SIE;
        execute_CsrPlugin_readData[19 : 19] = MmuPlugin_status_mxr;
        execute_CsrPlugin_readData[18 : 18] = MmuPlugin_status_sum;
        execute_CsrPlugin_readData[17 : 17] = MmuPlugin_status_mprv;
      end
      12'b001100000010 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[8 : 8] = CsrPlugin_medeleg_EU;
        execute_CsrPlugin_readData[2 : 2] = CsrPlugin_medeleg_II;
        execute_CsrPlugin_readData[5 : 5] = CsrPlugin_medeleg_LAF;
        execute_CsrPlugin_readData[13 : 13] = CsrPlugin_medeleg_LPF;
        execute_CsrPlugin_readData[4 : 4] = CsrPlugin_medeleg_LAM;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_medeleg_SAF;
        execute_CsrPlugin_readData[1 : 1] = CsrPlugin_medeleg_IAF;
        execute_CsrPlugin_readData[9 : 9] = CsrPlugin_medeleg_ES;
        execute_CsrPlugin_readData[12 : 12] = CsrPlugin_medeleg_IPF;
        execute_CsrPlugin_readData[15 : 15] = CsrPlugin_medeleg_SPF;
        execute_CsrPlugin_readData[6 : 6] = CsrPlugin_medeleg_SAM;
        execute_CsrPlugin_readData[0 : 0] = CsrPlugin_medeleg_IAM;
      end
      12'b001101000001 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mepc;
      end
      12'b101100000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mcycle[31 : 0];
      end
      12'b101110000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mcycle[63 : 32];
      end
      12'b001101000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mip_MEIP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mip_MTIP;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mip_MSIP;
        execute_CsrPlugin_readData[5 : 5] = CsrPlugin_sip_STIP;
        execute_CsrPlugin_readData[1 : 1] = CsrPlugin_sip_SSIP;
        execute_CsrPlugin_readData[9 : 9] = CsrPlugin_sip_SEIP_OR;
      end
      12'b001100000101 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 2] = CsrPlugin_mtvec_base;
        execute_CsrPlugin_readData[1 : 0] = CsrPlugin_mtvec_mode;
      end
      12'b000110000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 31] = MmuPlugin_satp_mode;
        execute_CsrPlugin_readData[19 : 0] = MmuPlugin_satp_ppn;
      end
      12'b000101000001 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_sepc;
      end
      12'b101100000010 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_minstret[31 : 0];
      end
      12'b111100010011 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[1 : 0] = (2'b11);
      end
      12'b000101000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[5 : 5] = CsrPlugin_sip_STIP;
        execute_CsrPlugin_readData[1 : 1] = CsrPlugin_sip_SSIP;
        execute_CsrPlugin_readData[9 : 9] = CsrPlugin_sip_SEIP_OR;
      end
      12'b001101000011 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mtval;
      end
      12'b000100000101 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 2] = CsrPlugin_stvec_base;
        execute_CsrPlugin_readData[1 : 0] = CsrPlugin_stvec_mode;
      end
      12'b110000000000 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mcycle[31 : 0];
      end
      12'b001100000001 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 30] = CsrPlugin_misa_base;
        execute_CsrPlugin_readData[25 : 0] = CsrPlugin_misa_extensions;
      end
      12'b001101000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mscratch;
      end
      12'b001100000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mie_MEIE;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mie_MTIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mie_MSIE;
        execute_CsrPlugin_readData[9 : 9] = CsrPlugin_sie_SEIE;
        execute_CsrPlugin_readData[5 : 5] = CsrPlugin_sie_STIE;
        execute_CsrPlugin_readData[1 : 1] = CsrPlugin_sie_SSIE;
      end
      12'b111100010010 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[1 : 0] = (2'b10);
      end
      12'b000101000011 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_stval;
      end
      12'b101110000010 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_minstret[63 : 32];
      end
      12'b000101000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_sscratch;
      end
      12'b110010000000 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mcycle[63 : 32];
      end
      12'b001101000010 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 31] = CsrPlugin_mcause_interrupt;
        execute_CsrPlugin_readData[3 : 0] = CsrPlugin_mcause_exceptionCode;
      end
      12'b000100000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[9 : 9] = CsrPlugin_sie_SEIE;
        execute_CsrPlugin_readData[5 : 5] = CsrPlugin_sie_STIE;
        execute_CsrPlugin_readData[1 : 1] = CsrPlugin_sie_SSIE;
      end
      default : begin
      end
    endcase
    if((CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]))begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(((! execute_arbitration_isValid) || (! execute_IS_CSR)))begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)))begin
      if((CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_valid = 1'b0;
    CsrPlugin_selfException_payload_code = (4'bxxxx);
    if((execute_CsrPlugin_illegalAccess || execute_CsrPlugin_illegalInstruction))begin
      CsrPlugin_selfException_valid = 1'b1;
      CsrPlugin_selfException_payload_code = (4'b0010);
    end
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL)))begin
      CsrPlugin_selfException_valid = 1'b1;
      case(CsrPlugin_privilege)
        2'b00 : begin
          CsrPlugin_selfException_payload_code = (4'b1000);
        end
        2'b01 : begin
          CsrPlugin_selfException_payload_code = (4'b1001);
        end
        default : begin
          CsrPlugin_selfException_payload_code = (4'b1011);
        end
      endcase
    end
  end

  assign CsrPlugin_selfException_payload_badAddr = execute_INSTRUCTION;
  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = ((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readEnable = ((execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  always @ (*) begin
    execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
    case(execute_CsrPlugin_csrAddress)
      12'b001101000100 : begin
        execute_CsrPlugin_readToWriteData[9 : 9] = CsrPlugin_sip_SEIP_SOFT;
      end
      12'b000101000100 : begin
        execute_CsrPlugin_readToWriteData[9 : 9] = CsrPlugin_sip_SEIP_SOFT;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    case(zz_315_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign DebugPlugin_isPipBusy = (DebugPlugin_isPipActive || DebugPlugin_isPipActive_regNext);
  always @ (*) begin
    debug_bus_cmd_ready = 1'b1;
    IBusCachedPlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(zz_293_)
        6'b000000 : begin
        end
        6'b000001 : begin
          if(debug_bus_cmd_payload_wr)begin
            IBusCachedPlugin_injectionPort_valid = 1'b1;
            debug_bus_cmd_ready = IBusCachedPlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if((! zz_215_))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign IBusCachedPlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign zz_25_ = ((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0));
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign zz_217_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((zz_217_ == (3'b000))) begin
        zz_218_ = execute_BranchPlugin_eq;
    end else if((zz_217_ == (3'b001))) begin
        zz_218_ = (! execute_BranchPlugin_eq);
    end else if((((zz_217_ & (3'b101)) == (3'b101)))) begin
        zz_218_ = (! execute_SRC_LESS);
    end else begin
        zz_218_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        zz_219_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        zz_219_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        zz_219_ = 1'b1;
      end
      default : begin
        zz_219_ = zz_218_;
      end
    endcase
  end

  assign zz_24_ = zz_219_;
  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign zz_220_ = zz_394_[19];
  always @ (*) begin
    zz_221_[10] = zz_220_;
    zz_221_[9] = zz_220_;
    zz_221_[8] = zz_220_;
    zz_221_[7] = zz_220_;
    zz_221_[6] = zz_220_;
    zz_221_[5] = zz_220_;
    zz_221_[4] = zz_220_;
    zz_221_[3] = zz_220_;
    zz_221_[2] = zz_220_;
    zz_221_[1] = zz_220_;
    zz_221_[0] = zz_220_;
  end

  assign zz_222_ = zz_395_[11];
  always @ (*) begin
    zz_223_[19] = zz_222_;
    zz_223_[18] = zz_222_;
    zz_223_[17] = zz_222_;
    zz_223_[16] = zz_222_;
    zz_223_[15] = zz_222_;
    zz_223_[14] = zz_222_;
    zz_223_[13] = zz_222_;
    zz_223_[12] = zz_222_;
    zz_223_[11] = zz_222_;
    zz_223_[10] = zz_222_;
    zz_223_[9] = zz_222_;
    zz_223_[8] = zz_222_;
    zz_223_[7] = zz_222_;
    zz_223_[6] = zz_222_;
    zz_223_[5] = zz_222_;
    zz_223_[4] = zz_222_;
    zz_223_[3] = zz_222_;
    zz_223_[2] = zz_222_;
    zz_223_[1] = zz_222_;
    zz_223_[0] = zz_222_;
  end

  assign zz_224_ = zz_396_[11];
  always @ (*) begin
    zz_225_[18] = zz_224_;
    zz_225_[17] = zz_224_;
    zz_225_[16] = zz_224_;
    zz_225_[15] = zz_224_;
    zz_225_[14] = zz_224_;
    zz_225_[13] = zz_224_;
    zz_225_[12] = zz_224_;
    zz_225_[11] = zz_224_;
    zz_225_[10] = zz_224_;
    zz_225_[9] = zz_224_;
    zz_225_[8] = zz_224_;
    zz_225_[7] = zz_224_;
    zz_225_[6] = zz_224_;
    zz_225_[5] = zz_224_;
    zz_225_[4] = zz_224_;
    zz_225_[3] = zz_224_;
    zz_225_[2] = zz_224_;
    zz_225_[1] = zz_224_;
    zz_225_[0] = zz_224_;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        zz_226_ = {{zz_221_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        zz_226_ = {zz_223_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        zz_226_ = {{zz_225_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = zz_226_;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign zz_22_ = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && (! memory_arbitration_isStuckByOthers)) && memory_BRANCH_DO);
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign MmuPlugin_ports_0_cacheHits_0 = ((MmuPlugin_ports_0_cache_0_valid && (MmuPlugin_ports_0_cache_0_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_0_superPage || (MmuPlugin_ports_0_cache_0_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12])));
  assign MmuPlugin_ports_0_cacheHits_1 = ((MmuPlugin_ports_0_cache_1_valid && (MmuPlugin_ports_0_cache_1_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_1_superPage || (MmuPlugin_ports_0_cache_1_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12])));
  assign MmuPlugin_ports_0_cacheHits_2 = ((MmuPlugin_ports_0_cache_2_valid && (MmuPlugin_ports_0_cache_2_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_2_superPage || (MmuPlugin_ports_0_cache_2_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12])));
  assign MmuPlugin_ports_0_cacheHits_3 = ((MmuPlugin_ports_0_cache_3_valid && (MmuPlugin_ports_0_cache_3_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_3_superPage || (MmuPlugin_ports_0_cache_3_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12])));
  assign MmuPlugin_ports_0_cacheHit = ({MmuPlugin_ports_0_cacheHits_3,{MmuPlugin_ports_0_cacheHits_2,{MmuPlugin_ports_0_cacheHits_1,MmuPlugin_ports_0_cacheHits_0}}} != (4'b0000));
  assign zz_227_ = (MmuPlugin_ports_0_cacheHits_1 || MmuPlugin_ports_0_cacheHits_3);
  assign zz_228_ = (MmuPlugin_ports_0_cacheHits_2 || MmuPlugin_ports_0_cacheHits_3);
  assign zz_229_ = {zz_228_,zz_227_};
  assign MmuPlugin_ports_0_cacheLine_valid = zz_260_;
  assign MmuPlugin_ports_0_cacheLine_exception = zz_261_;
  assign MmuPlugin_ports_0_cacheLine_superPage = zz_262_;
  assign MmuPlugin_ports_0_cacheLine_virtualAddress_0 = zz_263_;
  assign MmuPlugin_ports_0_cacheLine_virtualAddress_1 = zz_264_;
  assign MmuPlugin_ports_0_cacheLine_physicalAddress_0 = zz_265_;
  assign MmuPlugin_ports_0_cacheLine_physicalAddress_1 = zz_266_;
  assign MmuPlugin_ports_0_cacheLine_allowRead = zz_267_;
  assign MmuPlugin_ports_0_cacheLine_allowWrite = zz_268_;
  assign MmuPlugin_ports_0_cacheLine_allowExecute = zz_269_;
  assign MmuPlugin_ports_0_cacheLine_allowUser = zz_270_;
  always @ (*) begin
    MmuPlugin_ports_0_entryToReplace_willIncrement = 1'b0;
    MmuPlugin_ports_1_entryToReplace_willIncrement = 1'b0;
    if(zz_294_)begin
      if(zz_295_)begin
        MmuPlugin_ports_0_entryToReplace_willIncrement = 1'b1;
      end
      if(zz_296_)begin
        MmuPlugin_ports_1_entryToReplace_willIncrement = 1'b1;
      end
    end
  end

  assign MmuPlugin_ports_0_entryToReplace_willClear = 1'b0;
  assign MmuPlugin_ports_0_entryToReplace_willOverflowIfInc = (MmuPlugin_ports_0_entryToReplace_value == (2'b11));
  assign MmuPlugin_ports_0_entryToReplace_willOverflow = (MmuPlugin_ports_0_entryToReplace_willOverflowIfInc && MmuPlugin_ports_0_entryToReplace_willIncrement);
  always @ (*) begin
    MmuPlugin_ports_0_entryToReplace_valueNext = (MmuPlugin_ports_0_entryToReplace_value + zz_398_);
    if(MmuPlugin_ports_0_entryToReplace_willClear)begin
      MmuPlugin_ports_0_entryToReplace_valueNext = (2'b00);
    end
  end

  always @ (*) begin
    MmuPlugin_ports_0_requireMmuLockup = ((1'b1 && (! DBusCachedPlugin_mmuBus_cmd_bypassTranslation)) && MmuPlugin_satp_mode);
    if(((! MmuPlugin_status_mprv) && (CsrPlugin_privilege == (2'b11))))begin
      MmuPlugin_ports_0_requireMmuLockup = 1'b0;
    end
    if((CsrPlugin_privilege == (2'b11)))begin
      if(((! MmuPlugin_status_mprv) || (CsrPlugin_mstatus_MPP == (2'b11))))begin
        MmuPlugin_ports_0_requireMmuLockup = 1'b0;
      end
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_0_requireMmuLockup)begin
      DBusCachedPlugin_mmuBus_rsp_physicalAddress = {{MmuPlugin_ports_0_cacheLine_physicalAddress_1,(MmuPlugin_ports_0_cacheLine_superPage ? DBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12] : MmuPlugin_ports_0_cacheLine_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_virtualAddress[11 : 0]};
      DBusCachedPlugin_mmuBus_rsp_allowRead = (MmuPlugin_ports_0_cacheLine_allowRead || (MmuPlugin_status_mxr && MmuPlugin_ports_0_cacheLine_allowExecute));
      DBusCachedPlugin_mmuBus_rsp_allowWrite = MmuPlugin_ports_0_cacheLine_allowWrite;
      DBusCachedPlugin_mmuBus_rsp_allowExecute = MmuPlugin_ports_0_cacheLine_allowExecute;
      DBusCachedPlugin_mmuBus_rsp_exception = (MmuPlugin_ports_0_cacheHit && ((MmuPlugin_ports_0_cacheLine_exception || ((MmuPlugin_ports_0_cacheLine_allowUser && (CsrPlugin_privilege == (2'b01))) && (! MmuPlugin_status_sum))) || ((! MmuPlugin_ports_0_cacheLine_allowUser) && (CsrPlugin_privilege == (2'b00)))));
      DBusCachedPlugin_mmuBus_rsp_refilling = (! MmuPlugin_ports_0_cacheHit);
    end else begin
      DBusCachedPlugin_mmuBus_rsp_physicalAddress = DBusCachedPlugin_mmuBus_cmd_virtualAddress;
      DBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
      DBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
      DBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
      DBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
      DBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
    end
  end

  assign DBusCachedPlugin_mmuBus_rsp_isIoAccess = (((DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == (4'b1011)) || (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == (4'b1110))) || (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == (4'b1111)));
  assign MmuPlugin_ports_1_cacheHits_0 = ((MmuPlugin_ports_1_cache_0_valid && (MmuPlugin_ports_1_cache_0_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_0_superPage || (MmuPlugin_ports_1_cache_0_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12])));
  assign MmuPlugin_ports_1_cacheHits_1 = ((MmuPlugin_ports_1_cache_1_valid && (MmuPlugin_ports_1_cache_1_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_1_superPage || (MmuPlugin_ports_1_cache_1_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12])));
  assign MmuPlugin_ports_1_cacheHits_2 = ((MmuPlugin_ports_1_cache_2_valid && (MmuPlugin_ports_1_cache_2_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_2_superPage || (MmuPlugin_ports_1_cache_2_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12])));
  assign MmuPlugin_ports_1_cacheHits_3 = ((MmuPlugin_ports_1_cache_3_valid && (MmuPlugin_ports_1_cache_3_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_3_superPage || (MmuPlugin_ports_1_cache_3_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12])));
  assign MmuPlugin_ports_1_cacheHit = ({MmuPlugin_ports_1_cacheHits_3,{MmuPlugin_ports_1_cacheHits_2,{MmuPlugin_ports_1_cacheHits_1,MmuPlugin_ports_1_cacheHits_0}}} != (4'b0000));
  assign zz_230_ = (MmuPlugin_ports_1_cacheHits_1 || MmuPlugin_ports_1_cacheHits_3);
  assign zz_231_ = (MmuPlugin_ports_1_cacheHits_2 || MmuPlugin_ports_1_cacheHits_3);
  assign zz_232_ = {zz_231_,zz_230_};
  assign MmuPlugin_ports_1_cacheLine_valid = zz_271_;
  assign MmuPlugin_ports_1_cacheLine_exception = zz_272_;
  assign MmuPlugin_ports_1_cacheLine_superPage = zz_273_;
  assign MmuPlugin_ports_1_cacheLine_virtualAddress_0 = zz_274_;
  assign MmuPlugin_ports_1_cacheLine_virtualAddress_1 = zz_275_;
  assign MmuPlugin_ports_1_cacheLine_physicalAddress_0 = zz_276_;
  assign MmuPlugin_ports_1_cacheLine_physicalAddress_1 = zz_277_;
  assign MmuPlugin_ports_1_cacheLine_allowRead = zz_278_;
  assign MmuPlugin_ports_1_cacheLine_allowWrite = zz_279_;
  assign MmuPlugin_ports_1_cacheLine_allowExecute = zz_280_;
  assign MmuPlugin_ports_1_cacheLine_allowUser = zz_281_;
  assign MmuPlugin_ports_1_entryToReplace_willClear = 1'b0;
  assign MmuPlugin_ports_1_entryToReplace_willOverflowIfInc = (MmuPlugin_ports_1_entryToReplace_value == (2'b11));
  assign MmuPlugin_ports_1_entryToReplace_willOverflow = (MmuPlugin_ports_1_entryToReplace_willOverflowIfInc && MmuPlugin_ports_1_entryToReplace_willIncrement);
  always @ (*) begin
    MmuPlugin_ports_1_entryToReplace_valueNext = (MmuPlugin_ports_1_entryToReplace_value + zz_400_);
    if(MmuPlugin_ports_1_entryToReplace_willClear)begin
      MmuPlugin_ports_1_entryToReplace_valueNext = (2'b00);
    end
  end

  always @ (*) begin
    MmuPlugin_ports_1_requireMmuLockup = ((1'b1 && (! IBusCachedPlugin_mmuBus_cmd_bypassTranslation)) && MmuPlugin_satp_mode);
    if(((! MmuPlugin_status_mprv) && (CsrPlugin_privilege == (2'b11))))begin
      MmuPlugin_ports_1_requireMmuLockup = 1'b0;
    end
    if((CsrPlugin_privilege == (2'b11)))begin
      MmuPlugin_ports_1_requireMmuLockup = 1'b0;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_1_requireMmuLockup)begin
      IBusCachedPlugin_mmuBus_rsp_physicalAddress = {{MmuPlugin_ports_1_cacheLine_physicalAddress_1,(MmuPlugin_ports_1_cacheLine_superPage ? IBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12] : MmuPlugin_ports_1_cacheLine_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_virtualAddress[11 : 0]};
      IBusCachedPlugin_mmuBus_rsp_allowRead = (MmuPlugin_ports_1_cacheLine_allowRead || (MmuPlugin_status_mxr && MmuPlugin_ports_1_cacheLine_allowExecute));
      IBusCachedPlugin_mmuBus_rsp_allowWrite = MmuPlugin_ports_1_cacheLine_allowWrite;
      IBusCachedPlugin_mmuBus_rsp_allowExecute = MmuPlugin_ports_1_cacheLine_allowExecute;
      IBusCachedPlugin_mmuBus_rsp_exception = (MmuPlugin_ports_1_cacheHit && ((MmuPlugin_ports_1_cacheLine_exception || ((MmuPlugin_ports_1_cacheLine_allowUser && (CsrPlugin_privilege == (2'b01))) && (! MmuPlugin_status_sum))) || ((! MmuPlugin_ports_1_cacheLine_allowUser) && (CsrPlugin_privilege == (2'b00)))));
      IBusCachedPlugin_mmuBus_rsp_refilling = (! MmuPlugin_ports_1_cacheHit);
    end else begin
      IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_virtualAddress;
      IBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
      IBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
      IBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
      IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
      IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
    end
  end

  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = (((IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == (4'b1011)) || (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == (4'b1110))) || (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == (4'b1111)));
  assign MmuPlugin_shared_dBusRsp_pte_V = zz_401_[0];
  assign MmuPlugin_shared_dBusRsp_pte_R = zz_402_[0];
  assign MmuPlugin_shared_dBusRsp_pte_W = zz_403_[0];
  assign MmuPlugin_shared_dBusRsp_pte_X = zz_404_[0];
  assign MmuPlugin_shared_dBusRsp_pte_U = zz_405_[0];
  assign MmuPlugin_shared_dBusRsp_pte_G = zz_406_[0];
  assign MmuPlugin_shared_dBusRsp_pte_A = zz_407_[0];
  assign MmuPlugin_shared_dBusRsp_pte_D = zz_408_[0];
  assign MmuPlugin_shared_dBusRsp_pte_RSW = MmuPlugin_dBusAccess_rsp_payload_data[9 : 8];
  assign MmuPlugin_shared_dBusRsp_pte_PPN0 = MmuPlugin_dBusAccess_rsp_payload_data[19 : 10];
  assign MmuPlugin_shared_dBusRsp_pte_PPN1 = MmuPlugin_dBusAccess_rsp_payload_data[31 : 20];
  assign MmuPlugin_shared_dBusRsp_exception = (((! MmuPlugin_shared_dBusRsp_pte_V) || ((! MmuPlugin_shared_dBusRsp_pte_R) && MmuPlugin_shared_dBusRsp_pte_W)) || MmuPlugin_dBusAccess_rsp_payload_error);
  assign MmuPlugin_shared_dBusRsp_leaf = (MmuPlugin_shared_dBusRsp_pte_R || MmuPlugin_shared_dBusRsp_pte_X);
  always @ (*) begin
    MmuPlugin_dBusAccess_cmd_valid = 1'b0;
    MmuPlugin_dBusAccess_cmd_payload_address = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    case(MmuPlugin_shared_state_1_)
      `MmuPlugin_shared_State_defaultEncoding_IDLE : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_CMD : begin
        MmuPlugin_dBusAccess_cmd_valid = 1'b1;
        MmuPlugin_dBusAccess_cmd_payload_address = {{MmuPlugin_satp_ppn,MmuPlugin_shared_vpn_1},(2'b00)};
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_RSP : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L0_CMD : begin
        MmuPlugin_dBusAccess_cmd_valid = 1'b1;
        MmuPlugin_dBusAccess_cmd_payload_address = {{{MmuPlugin_shared_pteBuffer_PPN1[9 : 0],MmuPlugin_shared_pteBuffer_PPN0},MmuPlugin_shared_vpn_0},(2'b00)};
      end
      default : begin
      end
    endcase
  end

  assign MmuPlugin_dBusAccess_cmd_payload_write = 1'b0;
  assign MmuPlugin_dBusAccess_cmd_payload_size = (2'b10);
  assign MmuPlugin_dBusAccess_cmd_payload_data = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
  assign MmuPlugin_dBusAccess_cmd_payload_writeMask = (4'bxxxx);
  assign zz_21_ = decode_ALU_CTRL;
  assign zz_19_ = zz_71_;
  assign zz_52_ = decode_to_execute_ALU_CTRL;
  assign zz_18_ = decode_SHIFT_CTRL;
  assign zz_15_ = execute_SHIFT_CTRL;
  assign zz_16_ = zz_72_;
  assign zz_40_ = decode_to_execute_SHIFT_CTRL;
  assign zz_38_ = execute_to_memory_SHIFT_CTRL;
  assign zz_46_ = zz_61_;
  assign zz_13_ = decode_ALU_BITWISE_CTRL;
  assign zz_11_ = zz_86_;
  assign zz_54_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign zz_10_ = decode_ENV_CTRL;
  assign zz_7_ = execute_ENV_CTRL;
  assign zz_5_ = memory_ENV_CTRL;
  assign zz_8_ = zz_76_;
  assign zz_27_ = decode_to_execute_ENV_CTRL;
  assign zz_26_ = execute_to_memory_ENV_CTRL;
  assign zz_30_ = memory_to_writeBack_ENV_CTRL;
  assign zz_49_ = zz_81_;
  assign zz_3_ = decode_BRANCH_CTRL;
  assign zz_1_ = zz_73_;
  assign zz_23_ = decode_to_execute_BRANCH_CTRL;
  assign decode_arbitration_isFlushed = ({writeBack_arbitration_flushAll,{memory_arbitration_flushAll,{execute_arbitration_flushAll,decode_arbitration_flushAll}}} != (4'b0000));
  assign execute_arbitration_isFlushed = ({writeBack_arbitration_flushAll,{memory_arbitration_flushAll,execute_arbitration_flushAll}} != (3'b000));
  assign memory_arbitration_isFlushed = ({writeBack_arbitration_flushAll,memory_arbitration_flushAll} != (2'b00));
  assign writeBack_arbitration_isFlushed = (writeBack_arbitration_flushAll != (1'b0));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      CsrPlugin_privilege <= (2'b11);
      IBusCachedPlugin_fetchPc_pcReg <= (32'b10000000000000000000000000000000);
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      zz_106_ <= 1'b0;
      IBusCachedPlugin_decodePc_pcReg <= (32'b10000000000000000000000000000000);
      zz_112_ <= 1'b0;
      zz_114_ <= 1'b0;
      IBusCachedPlugin_decompressor_bufferValid <= 1'b0;
      zz_143_ <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_decodeRemoved <= 1'b0;
      zz_148_ <= 1'b0;
      zz_155_ <= 1'b0;
      dBus_rsp_m2sPipe_valid <= 1'b0;
      zz_181_ <= 1'b1;
      zz_194_ <= 1'b0;
      memory_MulDivIterativePlugin_div_counter_value <= (6'b000000);
      CsrPlugin_misa_base <= (2'b01);
      CsrPlugin_misa_extensions <= (26'b00000000000000000000000000);
      CsrPlugin_mtvec_mode <= (2'b00);
      CsrPlugin_mtvec_base <= (30'b100000000000000000000000001000);
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= (2'b11);
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_medeleg_IAM <= 1'b0;
      CsrPlugin_medeleg_IAF <= 1'b0;
      CsrPlugin_medeleg_II <= 1'b0;
      CsrPlugin_medeleg_LAM <= 1'b0;
      CsrPlugin_medeleg_LAF <= 1'b0;
      CsrPlugin_medeleg_SAM <= 1'b0;
      CsrPlugin_medeleg_SAF <= 1'b0;
      CsrPlugin_medeleg_EU <= 1'b0;
      CsrPlugin_medeleg_ES <= 1'b0;
      CsrPlugin_medeleg_IPF <= 1'b0;
      CsrPlugin_medeleg_LPF <= 1'b0;
      CsrPlugin_medeleg_SPF <= 1'b0;
      CsrPlugin_mideleg_ST <= 1'b0;
      CsrPlugin_mideleg_SE <= 1'b0;
      CsrPlugin_mideleg_SS <= 1'b0;
      CsrPlugin_sstatus_SIE <= 1'b0;
      CsrPlugin_sstatus_SPIE <= 1'b0;
      CsrPlugin_sstatus_SPP <= (1'b1);
      CsrPlugin_sip_SEIP_SOFT <= 1'b0;
      CsrPlugin_sip_STIP <= 1'b0;
      CsrPlugin_sip_SSIP <= 1'b0;
      CsrPlugin_sie_SEIE <= 1'b0;
      CsrPlugin_sie_STIE <= 1'b0;
      CsrPlugin_sie_SSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_lastStageWasWfi <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      MmuPlugin_status_sum <= 1'b0;
      MmuPlugin_status_mxr <= 1'b0;
      MmuPlugin_status_mprv <= 1'b0;
      MmuPlugin_satp_mode <= 1'b0;
      MmuPlugin_ports_0_cache_0_valid <= 1'b0;
      MmuPlugin_ports_0_cache_1_valid <= 1'b0;
      MmuPlugin_ports_0_cache_2_valid <= 1'b0;
      MmuPlugin_ports_0_cache_3_valid <= 1'b0;
      MmuPlugin_ports_0_entryToReplace_value <= (2'b00);
      MmuPlugin_ports_1_cache_0_valid <= 1'b0;
      MmuPlugin_ports_1_cache_1_valid <= 1'b0;
      MmuPlugin_ports_1_cache_2_valid <= 1'b0;
      MmuPlugin_ports_1_cache_3_valid <= 1'b0;
      MmuPlugin_ports_1_entryToReplace_value <= (2'b00);
      MmuPlugin_shared_busy <= 1'b0;
      MmuPlugin_shared_state_1_ <= `MmuPlugin_shared_State_defaultEncoding_IDLE;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      zz_233_ <= (3'b000);
      execute_to_memory_IS_DBUS_SHARING <= 1'b0;
      memory_to_writeBack_IS_DBUS_SHARING <= 1'b0;
      memory_to_writeBack_REGFILE_WRITE_DATA <= (32'b00000000000000000000000000000000);
      memory_to_writeBack_INSTRUCTION <= (32'b00000000000000000000000000000000);
    end else begin
      if(IBusCachedPlugin_fetchPc_propagatePc)begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusCachedPlugin_jump_pcLoad_valid)begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(zz_291_)begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_samplePcNext)begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      zz_106_ <= 1'b1;
      if((decode_arbitration_isFiring && (! IBusCachedPlugin_decodePc_injectedDecode)))begin
        IBusCachedPlugin_decodePc_pcReg <= IBusCachedPlugin_decodePc_pcPlus;
      end
      if(IBusCachedPlugin_jump_pcLoad_valid)begin
        IBusCachedPlugin_decodePc_pcReg <= IBusCachedPlugin_jump_pcLoad_payload;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        zz_112_ <= 1'b0;
      end
      if(zz_110_)begin
        zz_112_ <= IBusCachedPlugin_iBusRsp_stages_0_output_valid;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
        zz_114_ <= IBusCachedPlugin_iBusRsp_stages_1_output_valid;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        zz_114_ <= 1'b0;
      end
      if((IBusCachedPlugin_decompressor_inputBeforeStage_valid && IBusCachedPlugin_decompressor_inputBeforeStage_ready))begin
        IBusCachedPlugin_decompressor_bufferValid <= 1'b0;
      end
      if(zz_297_)begin
        IBusCachedPlugin_decompressor_bufferValid <= ((! (((! IBusCachedPlugin_decompressor_isRvc) && (! IBusCachedPlugin_iBusRsp_output_payload_pc[1])) && (! IBusCachedPlugin_decompressor_bufferValid))) && (! ((IBusCachedPlugin_decompressor_isRvc && IBusCachedPlugin_iBusRsp_output_payload_pc[1]) && IBusCachedPlugin_decompressor_inputBeforeStage_ready)));
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_decompressor_bufferValid <= 1'b0;
      end
      if(IBusCachedPlugin_decompressor_inputBeforeStage_ready)begin
        zz_143_ <= IBusCachedPlugin_decompressor_inputBeforeStage_valid;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        zz_143_ <= 1'b0;
      end
      if((! 1'b0))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        IBusCachedPlugin_injector_decodeRemoved <= 1'b1;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_injector_decodeRemoved <= 1'b0;
      end
      if(dataCache_1__io_mem_cmd_s2mPipe_ready)begin
        zz_148_ <= 1'b0;
      end
      if(zz_298_)begin
        zz_148_ <= dataCache_1__io_mem_cmd_valid;
      end
      if(dataCache_1__io_mem_cmd_s2mPipe_ready)begin
        zz_155_ <= dataCache_1__io_mem_cmd_s2mPipe_valid;
      end
      dBus_rsp_m2sPipe_valid <= dBus_rsp_valid;
      zz_181_ <= 1'b0;
      zz_194_ <= zz_193_;
      memory_MulDivIterativePlugin_div_counter_value <= memory_MulDivIterativePlugin_div_counter_valueNext;
      if((! decode_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if((! execute_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if((! memory_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if((! writeBack_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_lastStageWasWfi <= (writeBack_arbitration_isFiring && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_WFI));
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(zz_285_)begin
        CsrPlugin_privilege <= CsrPlugin_targetPrivilege;
        case(CsrPlugin_targetPrivilege)
          2'b01 : begin
            CsrPlugin_sstatus_SIE <= 1'b0;
            CsrPlugin_sstatus_SPIE <= CsrPlugin_sstatus_SIE;
            CsrPlugin_sstatus_SPP <= CsrPlugin_privilege[0 : 0];
          end
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(zz_286_)begin
        case(zz_287_)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= (2'b00);
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
            CsrPlugin_privilege <= CsrPlugin_mstatus_MPP;
          end
          2'b01 : begin
            CsrPlugin_sstatus_SPP <= (1'b0);
            CsrPlugin_sstatus_SIE <= CsrPlugin_sstatus_SPIE;
            CsrPlugin_sstatus_SPIE <= 1'b1;
            CsrPlugin_privilege <= {(1'b0),CsrPlugin_sstatus_SPP};
          end
          default : begin
          end
        endcase
      end
      MmuPlugin_ports_0_entryToReplace_value <= MmuPlugin_ports_0_entryToReplace_valueNext;
      MmuPlugin_ports_1_entryToReplace_value <= MmuPlugin_ports_1_entryToReplace_valueNext;
      case(MmuPlugin_shared_state_1_)
        `MmuPlugin_shared_State_defaultEncoding_IDLE : begin
          if(zz_299_)begin
            MmuPlugin_shared_busy <= 1'b1;
            MmuPlugin_shared_state_1_ <= `MmuPlugin_shared_State_defaultEncoding_L1_CMD;
          end
          if(zz_300_)begin
            MmuPlugin_shared_busy <= 1'b1;
            MmuPlugin_shared_state_1_ <= `MmuPlugin_shared_State_defaultEncoding_L1_CMD;
          end
        end
        `MmuPlugin_shared_State_defaultEncoding_L1_CMD : begin
          if(MmuPlugin_dBusAccess_cmd_ready)begin
            MmuPlugin_shared_state_1_ <= `MmuPlugin_shared_State_defaultEncoding_L1_RSP;
          end
        end
        `MmuPlugin_shared_State_defaultEncoding_L1_RSP : begin
          if(MmuPlugin_dBusAccess_rsp_valid)begin
            MmuPlugin_shared_state_1_ <= `MmuPlugin_shared_State_defaultEncoding_L0_CMD;
            if((MmuPlugin_shared_dBusRsp_leaf || MmuPlugin_shared_dBusRsp_exception))begin
              MmuPlugin_shared_state_1_ <= `MmuPlugin_shared_State_defaultEncoding_IDLE;
            end
            if(MmuPlugin_dBusAccess_rsp_payload_redo)begin
              MmuPlugin_shared_state_1_ <= `MmuPlugin_shared_State_defaultEncoding_L1_CMD;
            end
          end
        end
        `MmuPlugin_shared_State_defaultEncoding_L0_CMD : begin
          if(MmuPlugin_dBusAccess_cmd_ready)begin
            MmuPlugin_shared_state_1_ <= `MmuPlugin_shared_State_defaultEncoding_L0_RSP;
          end
        end
        default : begin
          if(MmuPlugin_dBusAccess_rsp_valid)begin
            MmuPlugin_shared_state_1_ <= `MmuPlugin_shared_State_defaultEncoding_IDLE;
            if(MmuPlugin_dBusAccess_rsp_payload_redo)begin
              MmuPlugin_shared_state_1_ <= `MmuPlugin_shared_State_defaultEncoding_L0_CMD;
            end
          end
        end
      endcase
      if(zz_294_)begin
        if(zz_295_)begin
          if(zz_301_)begin
            MmuPlugin_ports_0_cache_0_valid <= 1'b1;
          end
          if(zz_302_)begin
            MmuPlugin_ports_0_cache_1_valid <= 1'b1;
          end
          if(zz_303_)begin
            MmuPlugin_ports_0_cache_2_valid <= 1'b1;
          end
          if(zz_304_)begin
            MmuPlugin_ports_0_cache_3_valid <= 1'b1;
          end
        end
        if(zz_296_)begin
          if(zz_305_)begin
            MmuPlugin_ports_1_cache_0_valid <= 1'b1;
          end
          if(zz_306_)begin
            MmuPlugin_ports_1_cache_1_valid <= 1'b1;
          end
          if(zz_307_)begin
            MmuPlugin_ports_1_cache_2_valid <= 1'b1;
          end
          if(zz_308_)begin
            MmuPlugin_ports_1_cache_3_valid <= 1'b1;
          end
        end
      end
      if((execute_arbitration_isFiring && execute_IS_SFENCE_VMA))begin
        MmuPlugin_ports_0_cache_0_valid <= 1'b0;
        MmuPlugin_ports_0_cache_1_valid <= 1'b0;
        MmuPlugin_ports_0_cache_2_valid <= 1'b0;
        MmuPlugin_ports_0_cache_3_valid <= 1'b0;
        MmuPlugin_ports_1_cache_0_valid <= 1'b0;
        MmuPlugin_ports_1_cache_1_valid <= 1'b0;
        MmuPlugin_ports_1_cache_2_valid <= 1'b0;
        MmuPlugin_ports_1_cache_3_valid <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        execute_to_memory_IS_DBUS_SHARING <= execute_IS_DBUS_SHARING;
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_IS_DBUS_SHARING <= memory_IS_DBUS_SHARING;
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_REGFILE_WRITE_DATA <= zz_37_;
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
      end
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(zz_233_)
        3'b000 : begin
          if(IBusCachedPlugin_injectionPort_valid)begin
            zz_233_ <= (3'b001);
          end
        end
        3'b001 : begin
          zz_233_ <= (3'b010);
        end
        3'b010 : begin
          zz_233_ <= (3'b011);
        end
        3'b011 : begin
          if((! decode_arbitration_isStuck))begin
            zz_233_ <= (3'b100);
          end
        end
        3'b100 : begin
          zz_233_ <= (3'b000);
        end
        default : begin
        end
      endcase
      if(MmuPlugin_dBusAccess_rsp_valid)begin
        memory_to_writeBack_IS_DBUS_SHARING <= 1'b0;
      end
      case(execute_CsrPlugin_csrAddress)
        12'b001100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
            CsrPlugin_mstatus_MPIE <= zz_409_[0];
            CsrPlugin_mstatus_MIE <= zz_410_[0];
            CsrPlugin_sstatus_SPP <= execute_CsrPlugin_writeData[8 : 8];
            CsrPlugin_sstatus_SPIE <= zz_411_[0];
            CsrPlugin_sstatus_SIE <= zz_412_[0];
            MmuPlugin_status_mxr <= zz_413_[0];
            MmuPlugin_status_sum <= zz_414_[0];
            MmuPlugin_status_mprv <= zz_415_[0];
          end
        end
        12'b001100000011 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mideleg_SE <= zz_416_[0];
            CsrPlugin_mideleg_ST <= zz_417_[0];
            CsrPlugin_mideleg_SS <= zz_418_[0];
          end
        end
        12'b111100010001 : begin
        end
        12'b000101000010 : begin
        end
        12'b111100010100 : begin
        end
        12'b000100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_sstatus_SPP <= execute_CsrPlugin_writeData[8 : 8];
            CsrPlugin_sstatus_SPIE <= zz_420_[0];
            CsrPlugin_sstatus_SIE <= zz_421_[0];
            MmuPlugin_status_mxr <= zz_422_[0];
            MmuPlugin_status_sum <= zz_423_[0];
            MmuPlugin_status_mprv <= zz_424_[0];
          end
        end
        12'b001100000010 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_medeleg_EU <= zz_425_[0];
            CsrPlugin_medeleg_II <= zz_426_[0];
            CsrPlugin_medeleg_LAF <= zz_427_[0];
            CsrPlugin_medeleg_LPF <= zz_428_[0];
            CsrPlugin_medeleg_LAM <= zz_429_[0];
            CsrPlugin_medeleg_SAF <= zz_430_[0];
            CsrPlugin_medeleg_IAF <= zz_431_[0];
            CsrPlugin_medeleg_ES <= zz_432_[0];
            CsrPlugin_medeleg_IPF <= zz_433_[0];
            CsrPlugin_medeleg_SPF <= zz_434_[0];
            CsrPlugin_medeleg_SAM <= zz_435_[0];
            CsrPlugin_medeleg_IAM <= zz_436_[0];
          end
        end
        12'b001101000001 : begin
        end
        12'b101100000000 : begin
        end
        12'b101110000000 : begin
        end
        12'b001101000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_sip_STIP <= zz_438_[0];
            CsrPlugin_sip_SSIP <= zz_439_[0];
            CsrPlugin_sip_SEIP_SOFT <= zz_440_[0];
          end
        end
        12'b001100000101 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mtvec_base <= execute_CsrPlugin_writeData[31 : 2];
            CsrPlugin_mtvec_mode <= execute_CsrPlugin_writeData[1 : 0];
          end
        end
        12'b000110000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            MmuPlugin_satp_mode <= zz_441_[0];
          end
        end
        12'b000101000001 : begin
        end
        12'b101100000010 : begin
        end
        12'b111100010011 : begin
        end
        12'b000101000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_sip_STIP <= zz_442_[0];
            CsrPlugin_sip_SSIP <= zz_443_[0];
            CsrPlugin_sip_SEIP_SOFT <= zz_444_[0];
          end
        end
        12'b001101000011 : begin
        end
        12'b000100000101 : begin
        end
        12'b110000000000 : begin
        end
        12'b001100000001 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_misa_base <= execute_CsrPlugin_writeData[31 : 30];
            CsrPlugin_misa_extensions <= execute_CsrPlugin_writeData[25 : 0];
          end
        end
        12'b001101000000 : begin
        end
        12'b001100000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mie_MEIE <= zz_445_[0];
            CsrPlugin_mie_MTIE <= zz_446_[0];
            CsrPlugin_mie_MSIE <= zz_447_[0];
            CsrPlugin_sie_SEIE <= zz_448_[0];
            CsrPlugin_sie_STIE <= zz_449_[0];
            CsrPlugin_sie_SSIE <= zz_450_[0];
          end
        end
        12'b111100010010 : begin
        end
        12'b000101000011 : begin
        end
        12'b101110000010 : begin
        end
        12'b000101000000 : begin
        end
        12'b110010000000 : begin
        end
        12'b001101000010 : begin
        end
        12'b000100000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_sie_SEIE <= zz_452_[0];
            CsrPlugin_sie_STIE <= zz_453_[0];
            CsrPlugin_sie_SSIE <= zz_454_[0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
      zz_115_ <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(zz_297_)begin
      IBusCachedPlugin_decompressor_bufferData <= IBusCachedPlugin_iBusRsp_output_payload_rsp_inst[31 : 16];
    end
    if(IBusCachedPlugin_decompressor_inputBeforeStage_ready)begin
      zz_144_ <= IBusCachedPlugin_decompressor_inputBeforeStage_payload_pc;
      zz_145_ <= IBusCachedPlugin_decompressor_inputBeforeStage_payload_rsp_error;
      zz_146_ <= IBusCachedPlugin_decompressor_inputBeforeStage_payload_rsp_inst;
      zz_147_ <= IBusCachedPlugin_decompressor_inputBeforeStage_payload_isRvc;
    end
    if(IBusCachedPlugin_injector_decodeInput_ready)begin
      IBusCachedPlugin_injector_formal_rawInDecode <= IBusCachedPlugin_decompressor_raw;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready)begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    if(zz_298_)begin
      zz_149_ <= dataCache_1__io_mem_cmd_payload_wr;
      zz_150_ <= dataCache_1__io_mem_cmd_payload_address;
      zz_151_ <= dataCache_1__io_mem_cmd_payload_data;
      zz_152_ <= dataCache_1__io_mem_cmd_payload_mask;
      zz_153_ <= dataCache_1__io_mem_cmd_payload_length;
      zz_154_ <= dataCache_1__io_mem_cmd_payload_last;
    end
    if(dataCache_1__io_mem_cmd_s2mPipe_ready)begin
      zz_156_ <= dataCache_1__io_mem_cmd_s2mPipe_payload_wr;
      zz_157_ <= dataCache_1__io_mem_cmd_s2mPipe_payload_address;
      zz_158_ <= dataCache_1__io_mem_cmd_s2mPipe_payload_data;
      zz_159_ <= dataCache_1__io_mem_cmd_s2mPipe_payload_mask;
      zz_160_ <= dataCache_1__io_mem_cmd_s2mPipe_payload_length;
      zz_161_ <= dataCache_1__io_mem_cmd_s2mPipe_payload_last;
    end
    if(dBus_rsp_valid)begin
      dBus_rsp_m2sPipe_payload_data <= dBus_rsp_payload_data;
      dBus_rsp_m2sPipe_payload_error <= dBus_rsp_payload_error;
    end
    if(zz_193_)begin
      zz_195_ <= zz_55_[11 : 7];
      zz_196_ <= zz_89_;
    end
    if((memory_MulDivIterativePlugin_div_counter_value == (6'b100000)))begin
      memory_MulDivIterativePlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_MulDivIterativePlugin_div_done <= 1'b0;
    end
    if(zz_282_)begin
      if(zz_283_)begin
        memory_MulDivIterativePlugin_rs1[31 : 0] <= zz_380_[31:0];
        memory_MulDivIterativePlugin_accumulator[31 : 0] <= ((! zz_205_[32]) ? zz_381_ : zz_382_);
        if((memory_MulDivIterativePlugin_div_counter_value == (6'b100000)))begin
          memory_MulDivIterativePlugin_div_result <= zz_383_[31:0];
        end
      end
    end
    if(zz_292_)begin
      memory_MulDivIterativePlugin_accumulator <= (65'b00000000000000000000000000000000000000000000000000000000000000000);
      memory_MulDivIterativePlugin_rs1 <= ((zz_208_ ? (~ zz_209_) : zz_209_) + zz_389_);
      memory_MulDivIterativePlugin_rs2 <= ((zz_207_ ? (~ execute_RS2) : execute_RS2) + zz_391_);
      memory_MulDivIterativePlugin_div_needRevert <= ((zz_208_ ^ (zz_207_ && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == (32'b00000000000000000000000000000000)) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_sip_SEIP_INPUT <= externalInterruptS;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    end
    if(zz_284_)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (zz_214_ ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (zz_214_ ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(CsrPlugin_selfException_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= CsrPlugin_selfException_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= CsrPlugin_selfException_payload_badAddr;
    end
    if(DBusCachedPlugin_exceptionBus_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= DBusCachedPlugin_exceptionBus_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusCachedPlugin_exceptionBus_payload_badAddr;
    end
    if(zz_285_)begin
      case(CsrPlugin_targetPrivilege)
        2'b01 : begin
          CsrPlugin_scause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_scause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_sepc <= writeBack_PC;
          if(CsrPlugin_hadException)begin
            CsrPlugin_stval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= writeBack_PC;
          if(CsrPlugin_hadException)begin
            CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        default : begin
        end
      endcase
    end
    if((MmuPlugin_dBusAccess_rsp_valid && (! MmuPlugin_dBusAccess_rsp_payload_redo)))begin
      MmuPlugin_shared_pteBuffer_V <= MmuPlugin_shared_dBusRsp_pte_V;
      MmuPlugin_shared_pteBuffer_R <= MmuPlugin_shared_dBusRsp_pte_R;
      MmuPlugin_shared_pteBuffer_W <= MmuPlugin_shared_dBusRsp_pte_W;
      MmuPlugin_shared_pteBuffer_X <= MmuPlugin_shared_dBusRsp_pte_X;
      MmuPlugin_shared_pteBuffer_U <= MmuPlugin_shared_dBusRsp_pte_U;
      MmuPlugin_shared_pteBuffer_G <= MmuPlugin_shared_dBusRsp_pte_G;
      MmuPlugin_shared_pteBuffer_A <= MmuPlugin_shared_dBusRsp_pte_A;
      MmuPlugin_shared_pteBuffer_D <= MmuPlugin_shared_dBusRsp_pte_D;
      MmuPlugin_shared_pteBuffer_RSW <= MmuPlugin_shared_dBusRsp_pte_RSW;
      MmuPlugin_shared_pteBuffer_PPN0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
      MmuPlugin_shared_pteBuffer_PPN1 <= MmuPlugin_shared_dBusRsp_pte_PPN1;
    end
    case(MmuPlugin_shared_state_1_)
      `MmuPlugin_shared_State_defaultEncoding_IDLE : begin
        if(zz_299_)begin
          MmuPlugin_shared_vpn_1 <= IBusCachedPlugin_mmuBus_cmd_virtualAddress[31 : 22];
          MmuPlugin_shared_vpn_0 <= IBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12];
          MmuPlugin_shared_portId <= (1'b0);
        end
        if(zz_300_)begin
          MmuPlugin_shared_vpn_1 <= DBusCachedPlugin_mmuBus_cmd_virtualAddress[31 : 22];
          MmuPlugin_shared_vpn_0 <= DBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12];
          MmuPlugin_shared_portId <= (1'b1);
        end
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_CMD : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_RSP : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L0_CMD : begin
      end
      default : begin
      end
    endcase
    if(zz_294_)begin
      if(zz_295_)begin
        if(zz_301_)begin
          MmuPlugin_ports_0_cache_0_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != (10'b0000000000))));
          MmuPlugin_ports_0_cache_0_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_0_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_0_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_0_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_0_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_0_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_0_cache_0_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_0_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_0_superPage <= (MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(zz_302_)begin
          MmuPlugin_ports_0_cache_1_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != (10'b0000000000))));
          MmuPlugin_ports_0_cache_1_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_1_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_1_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_1_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_1_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_1_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_0_cache_1_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_1_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_1_superPage <= (MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(zz_303_)begin
          MmuPlugin_ports_0_cache_2_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != (10'b0000000000))));
          MmuPlugin_ports_0_cache_2_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_2_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_2_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_2_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_2_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_2_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_0_cache_2_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_2_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_2_superPage <= (MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(zz_304_)begin
          MmuPlugin_ports_0_cache_3_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != (10'b0000000000))));
          MmuPlugin_ports_0_cache_3_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_3_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_3_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_3_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_3_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_3_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_0_cache_3_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_3_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_3_superPage <= (MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
      end
      if(zz_296_)begin
        if(zz_305_)begin
          MmuPlugin_ports_1_cache_0_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != (10'b0000000000))));
          MmuPlugin_ports_1_cache_0_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_0_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_0_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_0_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_0_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_0_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_1_cache_0_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_0_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_0_superPage <= (MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(zz_306_)begin
          MmuPlugin_ports_1_cache_1_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != (10'b0000000000))));
          MmuPlugin_ports_1_cache_1_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_1_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_1_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_1_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_1_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_1_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_1_cache_1_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_1_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_1_superPage <= (MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(zz_307_)begin
          MmuPlugin_ports_1_cache_2_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != (10'b0000000000))));
          MmuPlugin_ports_1_cache_2_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_2_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_2_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_2_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_2_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_2_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_1_cache_2_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_2_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_2_superPage <= (MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(zz_308_)begin
          MmuPlugin_ports_1_cache_3_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != (10'b0000000000))));
          MmuPlugin_ports_1_cache_3_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_3_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_3_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_3_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_3_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_3_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_1_cache_3_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_3_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_3_superPage <= (MmuPlugin_shared_state_1_ == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
      end
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= zz_36_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= zz_20_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= zz_48_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= zz_45_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= zz_17_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= zz_14_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= zz_12_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= zz_94_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= zz_93_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_MANAGMENT <= decode_MEMORY_MANAGMENT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= zz_9_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= zz_6_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= zz_4_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= zz_44_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= execute_PC;
    end
    if(((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack)))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ATOMIC <= decode_MEMORY_ATOMIC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_WR <= decode_MEMORY_WR;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_WR <= execute_MEMORY_WR;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_WR <= memory_MEMORY_WR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_SFENCE_VMA <= decode_IS_SFENCE_VMA;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= zz_2_;
    end
    if((((! IBusCachedPlugin_iBusRsp_output_ready) && (IBusCachedPlugin_decompressor_inputBeforeStage_valid && IBusCachedPlugin_decompressor_inputBeforeStage_ready)) && (! (IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))))begin
      zz_115_[1] <= 1'b1;
    end
    if((zz_233_ != (3'b000)))begin
      zz_146_ <= IBusCachedPlugin_injectionPort_payload;
    end
    case(execute_CsrPlugin_csrAddress)
      12'b001100000000 : begin
      end
      12'b001100000011 : begin
      end
      12'b111100010001 : begin
      end
      12'b000101000010 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_scause_interrupt <= zz_419_[0];
          CsrPlugin_scause_exceptionCode <= execute_CsrPlugin_writeData[3 : 0];
        end
      end
      12'b111100010100 : begin
      end
      12'b000100000000 : begin
      end
      12'b001100000010 : begin
      end
      12'b001101000001 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mepc <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b101100000000 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mcycle[31 : 0] <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b101110000000 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mcycle[63 : 32] <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b001101000100 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mip_MSIP <= zz_437_[0];
        end
      end
      12'b001100000101 : begin
      end
      12'b000110000000 : begin
        if(execute_CsrPlugin_writeEnable)begin
          MmuPlugin_satp_ppn <= execute_CsrPlugin_writeData[19 : 0];
        end
      end
      12'b000101000001 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_sepc <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b101100000010 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_minstret[31 : 0] <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b111100010011 : begin
      end
      12'b000101000100 : begin
      end
      12'b001101000011 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mtval <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b000100000101 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_stvec_base <= execute_CsrPlugin_writeData[31 : 2];
          CsrPlugin_stvec_mode <= execute_CsrPlugin_writeData[1 : 0];
        end
      end
      12'b110000000000 : begin
      end
      12'b001100000001 : begin
      end
      12'b001101000000 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mscratch <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b001100000100 : begin
      end
      12'b111100010010 : begin
      end
      12'b000101000011 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_stval <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b101110000010 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_minstret[63 : 32] <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b000101000000 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_sscratch <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b110010000000 : begin
      end
      12'b001101000010 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mcause_interrupt <= zz_451_[0];
          CsrPlugin_mcause_exceptionCode <= execute_CsrPlugin_writeData[3 : 0];
        end
      end
      12'b000100000100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (posedge clk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready)begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipActive <= ({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != (4'b0000));
    DebugPlugin_isPipActive_regNext <= DebugPlugin_isPipActive;
    if(writeBack_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= zz_89_;
    end
    zz_215_ <= debug_bus_cmd_payload_address[2];
    if(zz_288_)begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @ (posedge clk or posedge debugReset) begin
    if (debugReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      zz_216_ <= 1'b0;
    end else begin
      if(debug_bus_cmd_valid)begin
        case(zz_293_)
          6'b000000 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(debug_bus_cmd_payload_data[16])begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[24])begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[17])begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
            end
          end
          6'b000001 : begin
          end
          default : begin
          end
        endcase
      end
      if(zz_288_)begin
        if(zz_289_)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(zz_290_)begin
        if(decode_arbitration_isValid)begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
      if((DebugPlugin_stepIt && ({writeBack_arbitration_redoIt,{memory_arbitration_redoIt,{execute_arbitration_redoIt,decode_arbitration_redoIt}}} != (4'b0000))))begin
        DebugPlugin_haltIt <= 1'b0;
      end
      zz_216_ <= (DebugPlugin_stepIt && decode_arbitration_isFiring);
    end
  end

endmodule

