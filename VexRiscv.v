// Generator : SpinalHDL v1.3.3    git head : a12ca43284eba978b42b54e49077a39c6b32b447
// Date      : 12/04/2019, 19:27:24
// Component : VexRiscv


`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_WFI 2'b10
`define EnvCtrlEnum_defaultEncoding_ECALL 2'b11

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
      input   io_cpu_fetch_mmuBus_busy,
      output [31:0] io_cpu_fetch_physicalAddress,
      output  io_cpu_fetch_haltIt,
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
      input  [2:0] _zz_36_,
      input  [31:0] _zz_37_,
      input   clk,
      input   reset);
  reg [21:0] _zz_38_;
  reg [31:0] _zz_39_;
  reg [21:0] _zz_40_;
  reg [31:0] _zz_41_;
  reg [21:0] _zz_42_;
  reg [31:0] _zz_43_;
  reg [21:0] _zz_44_;
  reg [31:0] _zz_45_;
  reg  _zz_46_;
  reg [31:0] _zz_47_;
  wire  _zz_48_;
  wire  _zz_49_;
  wire [0:0] _zz_50_;
  wire [1:0] _zz_51_;
  wire [0:0] _zz_52_;
  wire [0:0] _zz_53_;
  wire [0:0] _zz_54_;
  wire [0:0] _zz_55_;
  wire [0:0] _zz_56_;
  wire [0:0] _zz_57_;
  wire [0:0] _zz_58_;
  wire [0:0] _zz_59_;
  wire [21:0] _zz_60_;
  wire [21:0] _zz_61_;
  wire [21:0] _zz_62_;
  wire [21:0] _zz_63_;
  reg  _zz_1_;
  reg  _zz_2_;
  reg  _zz_3_;
  reg  _zz_4_;
  reg  _zz_5_;
  reg  _zz_6_;
  reg  _zz_7_;
  reg  _zz_8_;
  reg  lineLoader_fire;
  reg  lineLoader_valid;
  reg [31:0] lineLoader_address;
  reg  lineLoader_hadError;
  reg  lineLoader_flushPending;
  reg [7:0] lineLoader_flushCounter;
  reg  _zz_9_;
  reg  lineLoader_cmdSent;
  reg  lineLoader_wayToAllocate_willIncrement;
  wire  lineLoader_wayToAllocate_willClear;
  reg [1:0] lineLoader_wayToAllocate_valueNext;
  reg [1:0] lineLoader_wayToAllocate_value;
  wire  lineLoader_wayToAllocate_willOverflowIfInc;
  wire  lineLoader_wayToAllocate_willOverflow;
  reg [2:0] lineLoader_wordIndex;
  wire  lineLoader_write_tag_0_valid;
  wire [6:0] lineLoader_write_tag_0_payload_address;
  wire  lineLoader_write_tag_0_payload_data_valid;
  wire  lineLoader_write_tag_0_payload_data_error;
  wire [19:0] lineLoader_write_tag_0_payload_data_address;
  wire  lineLoader_write_tag_1_valid;
  wire [6:0] lineLoader_write_tag_1_payload_address;
  wire  lineLoader_write_tag_1_payload_data_valid;
  wire  lineLoader_write_tag_1_payload_data_error;
  wire [19:0] lineLoader_write_tag_1_payload_data_address;
  wire  lineLoader_write_tag_2_valid;
  wire [6:0] lineLoader_write_tag_2_payload_address;
  wire  lineLoader_write_tag_2_payload_data_valid;
  wire  lineLoader_write_tag_2_payload_data_error;
  wire [19:0] lineLoader_write_tag_2_payload_data_address;
  wire  lineLoader_write_tag_3_valid;
  wire [6:0] lineLoader_write_tag_3_payload_address;
  wire  lineLoader_write_tag_3_payload_data_valid;
  wire  lineLoader_write_tag_3_payload_data_error;
  wire [19:0] lineLoader_write_tag_3_payload_data_address;
  wire  lineLoader_write_data_0_valid;
  wire [9:0] lineLoader_write_data_0_payload_address;
  wire [31:0] lineLoader_write_data_0_payload_data;
  wire  lineLoader_write_data_1_valid;
  wire [9:0] lineLoader_write_data_1_payload_address;
  wire [31:0] lineLoader_write_data_1_payload_data;
  wire  lineLoader_write_data_2_valid;
  wire [9:0] lineLoader_write_data_2_payload_address;
  wire [31:0] lineLoader_write_data_2_payload_data;
  wire  lineLoader_write_data_3_valid;
  wire [9:0] lineLoader_write_data_3_payload_address;
  wire [31:0] lineLoader_write_data_3_payload_data;
  wire  _zz_10_;
  wire  _zz_11_;
  wire  _zz_12_;
  wire  _zz_13_;
  wire [6:0] _zz_14_;
  wire  _zz_15_;
  wire  fetchStage_read_waysValues_0_tag_valid;
  wire  fetchStage_read_waysValues_0_tag_error;
  wire [19:0] fetchStage_read_waysValues_0_tag_address;
  wire [21:0] _zz_16_;
  wire [9:0] _zz_17_;
  wire  _zz_18_;
  wire [31:0] fetchStage_read_waysValues_0_data;
  wire [6:0] _zz_19_;
  wire  _zz_20_;
  wire  fetchStage_read_waysValues_1_tag_valid;
  wire  fetchStage_read_waysValues_1_tag_error;
  wire [19:0] fetchStage_read_waysValues_1_tag_address;
  wire [21:0] _zz_21_;
  wire [9:0] _zz_22_;
  wire  _zz_23_;
  wire [31:0] fetchStage_read_waysValues_1_data;
  wire [6:0] _zz_24_;
  wire  _zz_25_;
  wire  fetchStage_read_waysValues_2_tag_valid;
  wire  fetchStage_read_waysValues_2_tag_error;
  wire [19:0] fetchStage_read_waysValues_2_tag_address;
  wire [21:0] _zz_26_;
  wire [9:0] _zz_27_;
  wire  _zz_28_;
  wire [31:0] fetchStage_read_waysValues_2_data;
  wire [6:0] _zz_29_;
  wire  _zz_30_;
  wire  fetchStage_read_waysValues_3_tag_valid;
  wire  fetchStage_read_waysValues_3_tag_error;
  wire [19:0] fetchStage_read_waysValues_3_tag_address;
  wire [21:0] _zz_31_;
  wire [9:0] _zz_32_;
  wire  _zz_33_;
  wire [31:0] fetchStage_read_waysValues_3_data;
  wire  fetchStage_hit_hits_0;
  wire  fetchStage_hit_hits_1;
  wire  fetchStage_hit_hits_2;
  wire  fetchStage_hit_hits_3;
  wire  fetchStage_hit_valid;
  wire  _zz_34_;
  wire  _zz_35_;
  wire [1:0] fetchStage_hit_id;
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
  reg [21:0] ways_1_tags [0:127];
  reg [31:0] ways_1_datas [0:1023];
  reg [21:0] ways_2_tags [0:127];
  reg [31:0] ways_2_datas [0:1023];
  reg [21:0] ways_3_tags [0:127];
  reg [31:0] ways_3_datas [0:1023];
  assign _zz_48_ = (! lineLoader_flushCounter[7]);
  assign _zz_49_ = (lineLoader_flushPending && (! (lineLoader_valid || io_cpu_fetch_isValid)));
  assign _zz_50_ = lineLoader_wayToAllocate_willIncrement;
  assign _zz_51_ = {1'd0, _zz_50_};
  assign _zz_52_ = _zz_16_[0 : 0];
  assign _zz_53_ = _zz_16_[1 : 1];
  assign _zz_54_ = _zz_21_[0 : 0];
  assign _zz_55_ = _zz_21_[1 : 1];
  assign _zz_56_ = _zz_26_[0 : 0];
  assign _zz_57_ = _zz_26_[1 : 1];
  assign _zz_58_ = _zz_31_[0 : 0];
  assign _zz_59_ = _zz_31_[1 : 1];
  assign _zz_60_ = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  assign _zz_61_ = {lineLoader_write_tag_1_payload_data_address,{lineLoader_write_tag_1_payload_data_error,lineLoader_write_tag_1_payload_data_valid}};
  assign _zz_62_ = {lineLoader_write_tag_2_payload_data_address,{lineLoader_write_tag_2_payload_data_error,lineLoader_write_tag_2_payload_data_valid}};
  assign _zz_63_ = {lineLoader_write_tag_3_payload_data_address,{lineLoader_write_tag_3_payload_data_error,lineLoader_write_tag_3_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_8_) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= _zz_60_;
    end
  end

  always @ (posedge clk) begin
    if(_zz_15_) begin
      _zz_38_ <= ways_0_tags[_zz_14_];
    end
  end

  always @ (posedge clk) begin
    if(_zz_4_) begin
      ways_0_datas[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_18_) begin
      _zz_39_ <= ways_0_datas[_zz_17_];
    end
  end

  always @ (posedge clk) begin
    if(_zz_7_) begin
      ways_1_tags[lineLoader_write_tag_1_payload_address] <= _zz_61_;
    end
  end

  always @ (posedge clk) begin
    if(_zz_20_) begin
      _zz_40_ <= ways_1_tags[_zz_19_];
    end
  end

  always @ (posedge clk) begin
    if(_zz_3_) begin
      ways_1_datas[lineLoader_write_data_1_payload_address] <= lineLoader_write_data_1_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_23_) begin
      _zz_41_ <= ways_1_datas[_zz_22_];
    end
  end

  always @ (posedge clk) begin
    if(_zz_6_) begin
      ways_2_tags[lineLoader_write_tag_2_payload_address] <= _zz_62_;
    end
  end

  always @ (posedge clk) begin
    if(_zz_25_) begin
      _zz_42_ <= ways_2_tags[_zz_24_];
    end
  end

  always @ (posedge clk) begin
    if(_zz_2_) begin
      ways_2_datas[lineLoader_write_data_2_payload_address] <= lineLoader_write_data_2_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_28_) begin
      _zz_43_ <= ways_2_datas[_zz_27_];
    end
  end

  always @ (posedge clk) begin
    if(_zz_5_) begin
      ways_3_tags[lineLoader_write_tag_3_payload_address] <= _zz_63_;
    end
  end

  always @ (posedge clk) begin
    if(_zz_30_) begin
      _zz_44_ <= ways_3_tags[_zz_29_];
    end
  end

  always @ (posedge clk) begin
    if(_zz_1_) begin
      ways_3_datas[lineLoader_write_data_3_payload_address] <= lineLoader_write_data_3_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_33_) begin
      _zz_45_ <= ways_3_datas[_zz_32_];
    end
  end

  always @(*) begin
    case(fetchStage_hit_id)
      2'b00 : begin
        _zz_46_ = fetchStage_read_waysValues_0_tag_error;
        _zz_47_ = fetchStage_read_waysValues_0_data;
      end
      2'b01 : begin
        _zz_46_ = fetchStage_read_waysValues_1_tag_error;
        _zz_47_ = fetchStage_read_waysValues_1_data;
      end
      2'b10 : begin
        _zz_46_ = fetchStage_read_waysValues_2_tag_error;
        _zz_47_ = fetchStage_read_waysValues_2_data;
      end
      default : begin
        _zz_46_ = fetchStage_read_waysValues_3_tag_error;
        _zz_47_ = fetchStage_read_waysValues_3_data;
      end
    endcase
  end

  always @ (*) begin
    _zz_1_ = 1'b0;
    if(lineLoader_write_data_3_valid)begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2_ = 1'b0;
    if(lineLoader_write_data_2_valid)begin
      _zz_2_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_3_ = 1'b0;
    if(lineLoader_write_data_1_valid)begin
      _zz_3_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_4_ = 1'b0;
    if(lineLoader_write_data_0_valid)begin
      _zz_4_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_5_ = 1'b0;
    if(lineLoader_write_tag_3_valid)begin
      _zz_5_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_6_ = 1'b0;
    if(lineLoader_write_tag_2_valid)begin
      _zz_6_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_7_ = 1'b0;
    if(lineLoader_write_tag_1_valid)begin
      _zz_7_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_8_ = 1'b0;
    if(lineLoader_write_tag_0_valid)begin
      _zz_8_ = 1'b1;
    end
  end

  assign io_cpu_fetch_haltIt = io_cpu_fetch_mmuBus_busy;
  always @ (*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid)begin
      if((lineLoader_wordIndex == (3'b111)))begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  always @ (*) begin
    io_cpu_prefetch_haltIt = (lineLoader_valid || lineLoader_flushPending);
    if(_zz_48_)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if((! _zz_9_))begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush)begin
      io_cpu_prefetch_haltIt = 1'b1;
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
  assign lineLoader_wayToAllocate_willOverflowIfInc = (lineLoader_wayToAllocate_value == (2'b11));
  assign lineLoader_wayToAllocate_willOverflow = (lineLoader_wayToAllocate_willOverflowIfInc && lineLoader_wayToAllocate_willIncrement);
  always @ (*) begin
    lineLoader_wayToAllocate_valueNext = (lineLoader_wayToAllocate_value + _zz_51_);
    if(lineLoader_wayToAllocate_willClear)begin
      lineLoader_wayToAllocate_valueNext = (2'b00);
    end
  end

  assign _zz_10_ = (lineLoader_wayToAllocate_value == (2'b00));
  assign lineLoader_write_tag_0_valid = ((_zz_10_ && lineLoader_fire) || (! lineLoader_flushCounter[7]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[7] ? lineLoader_address[11 : 5] : lineLoader_flushCounter[6 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[7];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 12];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && _zz_10_);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[11 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign _zz_11_ = (lineLoader_wayToAllocate_value == (2'b01));
  assign lineLoader_write_tag_1_valid = ((_zz_11_ && lineLoader_fire) || (! lineLoader_flushCounter[7]));
  assign lineLoader_write_tag_1_payload_address = (lineLoader_flushCounter[7] ? lineLoader_address[11 : 5] : lineLoader_flushCounter[6 : 0]);
  assign lineLoader_write_tag_1_payload_data_valid = lineLoader_flushCounter[7];
  assign lineLoader_write_tag_1_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_1_payload_data_address = lineLoader_address[31 : 12];
  assign lineLoader_write_data_1_valid = (io_mem_rsp_valid && _zz_11_);
  assign lineLoader_write_data_1_payload_address = {lineLoader_address[11 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_1_payload_data = io_mem_rsp_payload_data;
  assign _zz_12_ = (lineLoader_wayToAllocate_value == (2'b10));
  assign lineLoader_write_tag_2_valid = ((_zz_12_ && lineLoader_fire) || (! lineLoader_flushCounter[7]));
  assign lineLoader_write_tag_2_payload_address = (lineLoader_flushCounter[7] ? lineLoader_address[11 : 5] : lineLoader_flushCounter[6 : 0]);
  assign lineLoader_write_tag_2_payload_data_valid = lineLoader_flushCounter[7];
  assign lineLoader_write_tag_2_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_2_payload_data_address = lineLoader_address[31 : 12];
  assign lineLoader_write_data_2_valid = (io_mem_rsp_valid && _zz_12_);
  assign lineLoader_write_data_2_payload_address = {lineLoader_address[11 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_2_payload_data = io_mem_rsp_payload_data;
  assign _zz_13_ = (lineLoader_wayToAllocate_value == (2'b11));
  assign lineLoader_write_tag_3_valid = ((_zz_13_ && lineLoader_fire) || (! lineLoader_flushCounter[7]));
  assign lineLoader_write_tag_3_payload_address = (lineLoader_flushCounter[7] ? lineLoader_address[11 : 5] : lineLoader_flushCounter[6 : 0]);
  assign lineLoader_write_tag_3_payload_data_valid = lineLoader_flushCounter[7];
  assign lineLoader_write_tag_3_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_3_payload_data_address = lineLoader_address[31 : 12];
  assign lineLoader_write_data_3_valid = (io_mem_rsp_valid && _zz_13_);
  assign lineLoader_write_data_3_payload_address = {lineLoader_address[11 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_3_payload_data = io_mem_rsp_payload_data;
  assign _zz_14_ = io_cpu_prefetch_pc[11 : 5];
  assign _zz_15_ = (! io_cpu_fetch_isStuck);
  assign _zz_16_ = _zz_38_;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_52_[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_53_[0];
  assign fetchStage_read_waysValues_0_tag_address = _zz_16_[21 : 2];
  assign _zz_17_ = io_cpu_prefetch_pc[11 : 2];
  assign _zz_18_ = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_waysValues_0_data = _zz_39_;
  assign _zz_19_ = io_cpu_prefetch_pc[11 : 5];
  assign _zz_20_ = (! io_cpu_fetch_isStuck);
  assign _zz_21_ = _zz_40_;
  assign fetchStage_read_waysValues_1_tag_valid = _zz_54_[0];
  assign fetchStage_read_waysValues_1_tag_error = _zz_55_[0];
  assign fetchStage_read_waysValues_1_tag_address = _zz_21_[21 : 2];
  assign _zz_22_ = io_cpu_prefetch_pc[11 : 2];
  assign _zz_23_ = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_waysValues_1_data = _zz_41_;
  assign _zz_24_ = io_cpu_prefetch_pc[11 : 5];
  assign _zz_25_ = (! io_cpu_fetch_isStuck);
  assign _zz_26_ = _zz_42_;
  assign fetchStage_read_waysValues_2_tag_valid = _zz_56_[0];
  assign fetchStage_read_waysValues_2_tag_error = _zz_57_[0];
  assign fetchStage_read_waysValues_2_tag_address = _zz_26_[21 : 2];
  assign _zz_27_ = io_cpu_prefetch_pc[11 : 2];
  assign _zz_28_ = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_waysValues_2_data = _zz_43_;
  assign _zz_29_ = io_cpu_prefetch_pc[11 : 5];
  assign _zz_30_ = (! io_cpu_fetch_isStuck);
  assign _zz_31_ = _zz_44_;
  assign fetchStage_read_waysValues_3_tag_valid = _zz_58_[0];
  assign fetchStage_read_waysValues_3_tag_error = _zz_59_[0];
  assign fetchStage_read_waysValues_3_tag_address = _zz_31_[21 : 2];
  assign _zz_32_ = io_cpu_prefetch_pc[11 : 2];
  assign _zz_33_ = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_waysValues_3_data = _zz_45_;
  assign fetchStage_hit_hits_0 = (fetchStage_read_waysValues_0_tag_valid && (fetchStage_read_waysValues_0_tag_address == io_cpu_fetch_mmuBus_rsp_physicalAddress[31 : 12]));
  assign fetchStage_hit_hits_1 = (fetchStage_read_waysValues_1_tag_valid && (fetchStage_read_waysValues_1_tag_address == io_cpu_fetch_mmuBus_rsp_physicalAddress[31 : 12]));
  assign fetchStage_hit_hits_2 = (fetchStage_read_waysValues_2_tag_valid && (fetchStage_read_waysValues_2_tag_address == io_cpu_fetch_mmuBus_rsp_physicalAddress[31 : 12]));
  assign fetchStage_hit_hits_3 = (fetchStage_read_waysValues_3_tag_valid && (fetchStage_read_waysValues_3_tag_address == io_cpu_fetch_mmuBus_rsp_physicalAddress[31 : 12]));
  assign fetchStage_hit_valid = ({fetchStage_hit_hits_3,{fetchStage_hit_hits_2,{fetchStage_hit_hits_1,fetchStage_hit_hits_0}}} != (4'b0000));
  assign _zz_34_ = (fetchStage_hit_hits_1 || fetchStage_hit_hits_3);
  assign _zz_35_ = (fetchStage_hit_hits_2 || fetchStage_hit_hits_3);
  assign fetchStage_hit_id = {_zz_35_,_zz_34_};
  assign fetchStage_hit_error = _zz_46_;
  assign fetchStage_hit_data = _zz_47_;
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
      lineLoader_wayToAllocate_value <= (2'b00);
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
      if(_zz_49_)begin
        lineLoader_flushPending <= 1'b0;
      end
      if((io_mem_cmd_valid && io_mem_cmd_ready))begin
        lineLoader_cmdSent <= 1'b1;
      end
      if(lineLoader_fire)begin
        lineLoader_cmdSent <= 1'b0;
      end
      lineLoader_wayToAllocate_value <= lineLoader_wayToAllocate_valueNext;
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
    if(_zz_48_)begin
      lineLoader_flushCounter <= (lineLoader_flushCounter + (8'b00000001));
    end
    _zz_9_ <= lineLoader_flushCounter[7];
    if(_zz_49_)begin
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
    if((_zz_36_ != (3'b000)))begin
      io_cpu_fetch_data_regNextWhen <= _zz_37_;
    end
  end

endmodule

module DataCache (
      input   io_cpu_execute_isValid,
      input  [31:0] io_cpu_execute_address,
      input   io_cpu_execute_args_wr,
      input  [31:0] io_cpu_execute_args_data,
      input  [1:0] io_cpu_execute_args_size,
      input   io_cpu_execute_args_isLrsc,
      input   io_cpu_execute_args_isAmo,
      input   io_cpu_execute_args_amoCtrl_swap,
      input  [2:0] io_cpu_execute_args_amoCtrl_alu,
      input   io_cpu_memory_isValid,
      input   io_cpu_memory_isStuck,
      input   io_cpu_memory_isRemoved,
      output  io_cpu_memory_isWrite,
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
      input   io_cpu_memory_mmuBus_busy,
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
      input   io_cpu_writeBack_clearLrsc,
      output reg  io_cpu_redo,
      input   io_cpu_flush_valid,
      output reg  io_cpu_flush_ready,
      output reg  io_mem_cmd_valid,
      input   io_mem_cmd_ready,
      output reg  io_mem_cmd_payload_wr,
      output reg [31:0] io_mem_cmd_payload_address,
      output [31:0] io_mem_cmd_payload_data,
      output [3:0] io_mem_cmd_payload_mask,
      output reg [2:0] io_mem_cmd_payload_length,
      output reg  io_mem_cmd_payload_last,
      input   io_mem_rsp_valid,
      input  [31:0] io_mem_rsp_payload_data,
      input   io_mem_rsp_payload_error,
      input   clk,
      input   reset);
  reg [21:0] _zz_30_;
  reg [31:0] _zz_31_;
  reg [21:0] _zz_32_;
  reg [31:0] _zz_33_;
  reg [21:0] _zz_34_;
  reg [31:0] _zz_35_;
  reg [21:0] _zz_36_;
  reg [31:0] _zz_37_;
  reg [31:0] _zz_38_;
  wire  _zz_39_;
  wire  _zz_40_;
  wire  _zz_41_;
  wire [2:0] _zz_42_;
  wire [0:0] _zz_43_;
  wire [0:0] _zz_44_;
  wire [0:0] _zz_45_;
  wire [0:0] _zz_46_;
  wire [0:0] _zz_47_;
  wire [0:0] _zz_48_;
  wire [0:0] _zz_49_;
  wire [0:0] _zz_50_;
  wire [31:0] _zz_51_;
  wire [31:0] _zz_52_;
  wire [31:0] _zz_53_;
  wire [31:0] _zz_54_;
  wire [1:0] _zz_55_;
  wire [31:0] _zz_56_;
  wire [1:0] _zz_57_;
  wire [1:0] _zz_58_;
  wire [0:0] _zz_59_;
  wire [0:0] _zz_60_;
  wire [2:0] _zz_61_;
  wire [4:0] _zz_62_;
  wire [21:0] _zz_63_;
  wire [21:0] _zz_64_;
  wire [21:0] _zz_65_;
  wire [21:0] _zz_66_;
  wire [1:0] _zz_67_;
  reg  _zz_1_;
  reg  _zz_2_;
  reg  _zz_3_;
  reg  _zz_4_;
  reg  _zz_5_;
  reg  _zz_6_;
  reg  _zz_7_;
  reg  _zz_8_;
  wire  haltCpu;
  reg  tagsReadCmd_valid;
  reg [6:0] tagsReadCmd_payload;
  reg  tagsWriteCmd_valid;
  reg [3:0] tagsWriteCmd_payload_way;
  reg [6:0] tagsWriteCmd_payload_address;
  reg  tagsWriteCmd_payload_data_valid;
  reg  tagsWriteCmd_payload_data_error;
  reg [19:0] tagsWriteCmd_payload_data_address;
  reg  tagsWriteLastCmd_valid;
  reg [3:0] tagsWriteLastCmd_payload_way;
  reg [6:0] tagsWriteLastCmd_payload_address;
  reg  tagsWriteLastCmd_payload_data_valid;
  reg  tagsWriteLastCmd_payload_data_error;
  reg [19:0] tagsWriteLastCmd_payload_data_address;
  reg  dataReadCmd_valid;
  reg [9:0] dataReadCmd_payload;
  reg  dataWriteCmd_valid;
  reg [3:0] dataWriteCmd_payload_way;
  reg [9:0] dataWriteCmd_payload_address;
  reg [31:0] dataWriteCmd_payload_data;
  reg [3:0] dataWriteCmd_payload_mask;
  wire  _zz_9_;
  wire  ways_0_tagsReadRsp_valid;
  wire  ways_0_tagsReadRsp_error;
  wire [19:0] ways_0_tagsReadRsp_address;
  wire [21:0] _zz_10_;
  wire  _zz_11_;
  wire [31:0] ways_0_dataReadRsp;
  wire  _zz_12_;
  wire  ways_1_tagsReadRsp_valid;
  wire  ways_1_tagsReadRsp_error;
  wire [19:0] ways_1_tagsReadRsp_address;
  wire [21:0] _zz_13_;
  wire  _zz_14_;
  wire [31:0] ways_1_dataReadRsp;
  wire  _zz_15_;
  wire  ways_2_tagsReadRsp_valid;
  wire  ways_2_tagsReadRsp_error;
  wire [19:0] ways_2_tagsReadRsp_address;
  wire [21:0] _zz_16_;
  wire  _zz_17_;
  wire [31:0] ways_2_dataReadRsp;
  wire  _zz_18_;
  wire  ways_3_tagsReadRsp_valid;
  wire  ways_3_tagsReadRsp_error;
  wire [19:0] ways_3_tagsReadRsp_address;
  wire [21:0] _zz_19_;
  wire  _zz_20_;
  wire [31:0] ways_3_dataReadRsp;
  reg [3:0] _zz_21_;
  wire [3:0] stage0_mask;
  wire [9:0] _zz_22_;
  reg [3:0] stage0_colisions;
  reg  stageA_request_wr;
  reg [31:0] stageA_request_data;
  reg [1:0] stageA_request_size;
  reg  stageA_request_isLrsc;
  reg  stageA_request_isAmo;
  reg  stageA_request_amoCtrl_swap;
  reg [2:0] stageA_request_amoCtrl_alu;
  reg [3:0] stageA_mask;
  wire  stageA_wayHits_0;
  wire  stageA_wayHits_1;
  wire  stageA_wayHits_2;
  wire  stageA_wayHits_3;
  reg [3:0] stage0_colisions_regNextWhen;
  wire [9:0] _zz_23_;
  reg [3:0] _zz_24_;
  wire [3:0] stageA_colisions;
  reg  stageB_request_wr;
  reg [31:0] stageB_request_data;
  reg [1:0] stageB_request_size;
  reg  stageB_request_isLrsc;
  reg  stageB_isAmo;
  reg  stageB_request_amoCtrl_swap;
  reg [2:0] stageB_request_amoCtrl_alu;
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
  reg  stageB_tagsReadRsp_1_valid;
  reg  stageB_tagsReadRsp_1_error;
  reg [19:0] stageB_tagsReadRsp_1_address;
  reg  stageB_tagsReadRsp_2_valid;
  reg  stageB_tagsReadRsp_2_error;
  reg [19:0] stageB_tagsReadRsp_2_address;
  reg  stageB_tagsReadRsp_3_valid;
  reg  stageB_tagsReadRsp_3_error;
  reg [19:0] stageB_tagsReadRsp_3_address;
  reg [31:0] stageB_dataReadRsp_0;
  reg [31:0] stageB_dataReadRsp_1;
  reg [31:0] stageB_dataReadRsp_2;
  reg [31:0] stageB_dataReadRsp_3;
  reg [3:0] _zz_25_;
  reg [3:0] stageB_waysHits;
  wire  stageB_waysHit;
  wire  _zz_26_;
  wire  _zz_27_;
  wire  _zz_28_;
  wire [31:0] stageB_dataMux;
  reg [3:0] stageB_mask;
  reg [3:0] stageB_colisions;
  reg  stageB_loaderValid;
  reg  stageB_flusher_valid;
  reg  stageB_lrsc_reserved;
  reg [31:0] stageB_requestDataBypass;
  wire  stageB_amo_compare;
  wire  stageB_amo_unsigned;
  wire [31:0] stageB_amo_addSub;
  wire  stageB_amo_less;
  wire  stageB_amo_selectRf;
  reg [31:0] stageB_amo_result;
  reg  stageB_amo_resultRegValid;
  reg [31:0] stageB_amo_resultReg;
  reg  stageB_memCmdSent;
  reg [3:0] _zz_29_;
  reg  loader_valid;
  reg  loader_counter_willIncrement;
  wire  loader_counter_willClear;
  reg [2:0] loader_counter_valueNext;
  reg [2:0] loader_counter_value;
  wire  loader_counter_willOverflowIfInc;
  wire  loader_counter_willOverflow;
  reg [3:0] loader_waysAllocator;
  reg  loader_error;
  reg [21:0] ways_0_tags [0:127];
  reg [7:0] ways_0_data_symbol0 [0:1023];
  reg [7:0] ways_0_data_symbol1 [0:1023];
  reg [7:0] ways_0_data_symbol2 [0:1023];
  reg [7:0] ways_0_data_symbol3 [0:1023];
  reg [7:0] _zz_68_;
  reg [7:0] _zz_69_;
  reg [7:0] _zz_70_;
  reg [7:0] _zz_71_;
  reg [21:0] ways_1_tags [0:127];
  reg [7:0] ways_1_data_symbol0 [0:1023];
  reg [7:0] ways_1_data_symbol1 [0:1023];
  reg [7:0] ways_1_data_symbol2 [0:1023];
  reg [7:0] ways_1_data_symbol3 [0:1023];
  reg [7:0] _zz_72_;
  reg [7:0] _zz_73_;
  reg [7:0] _zz_74_;
  reg [7:0] _zz_75_;
  reg [21:0] ways_2_tags [0:127];
  reg [7:0] ways_2_data_symbol0 [0:1023];
  reg [7:0] ways_2_data_symbol1 [0:1023];
  reg [7:0] ways_2_data_symbol2 [0:1023];
  reg [7:0] ways_2_data_symbol3 [0:1023];
  reg [7:0] _zz_76_;
  reg [7:0] _zz_77_;
  reg [7:0] _zz_78_;
  reg [7:0] _zz_79_;
  reg [21:0] ways_3_tags [0:127];
  reg [7:0] ways_3_data_symbol0 [0:1023];
  reg [7:0] ways_3_data_symbol1 [0:1023];
  reg [7:0] ways_3_data_symbol2 [0:1023];
  reg [7:0] ways_3_data_symbol3 [0:1023];
  reg [7:0] _zz_80_;
  reg [7:0] _zz_81_;
  reg [7:0] _zz_82_;
  reg [7:0] _zz_83_;
  assign _zz_39_ = (loader_valid && io_mem_rsp_valid);
  assign _zz_40_ = ((((io_cpu_flush_valid && (! io_cpu_execute_isValid)) && (! io_cpu_memory_isValid)) && (! io_cpu_writeBack_isValid)) && (! io_cpu_redo));
  assign _zz_41_ = ((! io_cpu_writeBack_isStuck) && (! stageB_mmuRspFreeze));
  assign _zz_42_ = (stageB_request_amoCtrl_alu | {stageB_request_amoCtrl_swap,(2'b00)});
  assign _zz_43_ = _zz_10_[0 : 0];
  assign _zz_44_ = _zz_10_[1 : 1];
  assign _zz_45_ = _zz_13_[0 : 0];
  assign _zz_46_ = _zz_13_[1 : 1];
  assign _zz_47_ = _zz_16_[0 : 0];
  assign _zz_48_ = _zz_16_[1 : 1];
  assign _zz_49_ = _zz_19_[0 : 0];
  assign _zz_50_ = _zz_19_[1 : 1];
  assign _zz_51_ = ($signed(_zz_52_) + $signed(_zz_56_));
  assign _zz_52_ = ($signed(_zz_53_) + $signed(_zz_54_));
  assign _zz_53_ = stageB_request_data;
  assign _zz_54_ = (stageB_amo_compare ? (~ stageB_dataMux) : stageB_dataMux);
  assign _zz_55_ = (stageB_amo_compare ? _zz_57_ : _zz_58_);
  assign _zz_56_ = {{30{_zz_55_[1]}}, _zz_55_};
  assign _zz_57_ = (2'b01);
  assign _zz_58_ = (2'b00);
  assign _zz_59_ = (! stageB_lrsc_reserved);
  assign _zz_60_ = loader_counter_willIncrement;
  assign _zz_61_ = {2'd0, _zz_60_};
  assign _zz_62_ = {loader_waysAllocator,loader_waysAllocator[3]};
  assign _zz_63_ = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  assign _zz_64_ = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  assign _zz_65_ = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  assign _zz_66_ = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  assign _zz_67_ = {_zz_28_,_zz_27_};
  always @ (posedge clk) begin
    if(_zz_8_) begin
      ways_0_tags[tagsWriteCmd_payload_address] <= _zz_63_;
    end
  end

  always @ (posedge clk) begin
    if(_zz_9_) begin
      _zz_30_ <= ways_0_tags[tagsReadCmd_payload];
    end
  end

  always @ (*) begin
    _zz_31_ = {_zz_71_, _zz_70_, _zz_69_, _zz_68_};
  end
  always @ (posedge clk) begin
    if(dataWriteCmd_payload_mask[0] && _zz_7_) begin
      ways_0_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && _zz_7_) begin
      ways_0_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && _zz_7_) begin
      ways_0_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && _zz_7_) begin
      ways_0_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
  end

  always @ (posedge clk) begin
    if(_zz_11_) begin
      _zz_68_ <= ways_0_data_symbol0[dataReadCmd_payload];
      _zz_69_ <= ways_0_data_symbol1[dataReadCmd_payload];
      _zz_70_ <= ways_0_data_symbol2[dataReadCmd_payload];
      _zz_71_ <= ways_0_data_symbol3[dataReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(_zz_6_) begin
      ways_1_tags[tagsWriteCmd_payload_address] <= _zz_64_;
    end
  end

  always @ (posedge clk) begin
    if(_zz_12_) begin
      _zz_32_ <= ways_1_tags[tagsReadCmd_payload];
    end
  end

  always @ (*) begin
    _zz_33_ = {_zz_75_, _zz_74_, _zz_73_, _zz_72_};
  end
  always @ (posedge clk) begin
    if(dataWriteCmd_payload_mask[0] && _zz_5_) begin
      ways_1_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && _zz_5_) begin
      ways_1_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && _zz_5_) begin
      ways_1_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && _zz_5_) begin
      ways_1_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
  end

  always @ (posedge clk) begin
    if(_zz_14_) begin
      _zz_72_ <= ways_1_data_symbol0[dataReadCmd_payload];
      _zz_73_ <= ways_1_data_symbol1[dataReadCmd_payload];
      _zz_74_ <= ways_1_data_symbol2[dataReadCmd_payload];
      _zz_75_ <= ways_1_data_symbol3[dataReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(_zz_4_) begin
      ways_2_tags[tagsWriteCmd_payload_address] <= _zz_65_;
    end
  end

  always @ (posedge clk) begin
    if(_zz_15_) begin
      _zz_34_ <= ways_2_tags[tagsReadCmd_payload];
    end
  end

  always @ (*) begin
    _zz_35_ = {_zz_79_, _zz_78_, _zz_77_, _zz_76_};
  end
  always @ (posedge clk) begin
    if(dataWriteCmd_payload_mask[0] && _zz_3_) begin
      ways_2_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && _zz_3_) begin
      ways_2_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && _zz_3_) begin
      ways_2_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && _zz_3_) begin
      ways_2_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
  end

  always @ (posedge clk) begin
    if(_zz_17_) begin
      _zz_76_ <= ways_2_data_symbol0[dataReadCmd_payload];
      _zz_77_ <= ways_2_data_symbol1[dataReadCmd_payload];
      _zz_78_ <= ways_2_data_symbol2[dataReadCmd_payload];
      _zz_79_ <= ways_2_data_symbol3[dataReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(_zz_2_) begin
      ways_3_tags[tagsWriteCmd_payload_address] <= _zz_66_;
    end
  end

  always @ (posedge clk) begin
    if(_zz_18_) begin
      _zz_36_ <= ways_3_tags[tagsReadCmd_payload];
    end
  end

  always @ (*) begin
    _zz_37_ = {_zz_83_, _zz_82_, _zz_81_, _zz_80_};
  end
  always @ (posedge clk) begin
    if(dataWriteCmd_payload_mask[0] && _zz_1_) begin
      ways_3_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && _zz_1_) begin
      ways_3_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && _zz_1_) begin
      ways_3_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && _zz_1_) begin
      ways_3_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
  end

  always @ (posedge clk) begin
    if(_zz_20_) begin
      _zz_80_ <= ways_3_data_symbol0[dataReadCmd_payload];
      _zz_81_ <= ways_3_data_symbol1[dataReadCmd_payload];
      _zz_82_ <= ways_3_data_symbol2[dataReadCmd_payload];
      _zz_83_ <= ways_3_data_symbol3[dataReadCmd_payload];
    end
  end

  always @(*) begin
    case(_zz_67_)
      2'b00 : begin
        _zz_38_ = stageB_dataReadRsp_0;
      end
      2'b01 : begin
        _zz_38_ = stageB_dataReadRsp_1;
      end
      2'b10 : begin
        _zz_38_ = stageB_dataReadRsp_2;
      end
      default : begin
        _zz_38_ = stageB_dataReadRsp_3;
      end
    endcase
  end

  always @ (*) begin
    _zz_1_ = 1'b0;
    if((dataWriteCmd_valid && dataWriteCmd_payload_way[3]))begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2_ = 1'b0;
    if((tagsWriteCmd_valid && tagsWriteCmd_payload_way[3]))begin
      _zz_2_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_3_ = 1'b0;
    if((dataWriteCmd_valid && dataWriteCmd_payload_way[2]))begin
      _zz_3_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_4_ = 1'b0;
    if((tagsWriteCmd_valid && tagsWriteCmd_payload_way[2]))begin
      _zz_4_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_5_ = 1'b0;
    if((dataWriteCmd_valid && dataWriteCmd_payload_way[1]))begin
      _zz_5_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_6_ = 1'b0;
    if((tagsWriteCmd_valid && tagsWriteCmd_payload_way[1]))begin
      _zz_6_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_7_ = 1'b0;
    if((dataWriteCmd_valid && dataWriteCmd_payload_way[0]))begin
      _zz_7_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_8_ = 1'b0;
    if((tagsWriteCmd_valid && tagsWriteCmd_payload_way[0]))begin
      _zz_8_ = 1'b1;
    end
  end

  assign haltCpu = 1'b0;
  assign _zz_9_ = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_10_ = _zz_30_;
  assign ways_0_tagsReadRsp_valid = _zz_43_[0];
  assign ways_0_tagsReadRsp_error = _zz_44_[0];
  assign ways_0_tagsReadRsp_address = _zz_10_[21 : 2];
  assign _zz_11_ = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_0_dataReadRsp = _zz_31_;
  assign _zz_12_ = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_13_ = _zz_32_;
  assign ways_1_tagsReadRsp_valid = _zz_45_[0];
  assign ways_1_tagsReadRsp_error = _zz_46_[0];
  assign ways_1_tagsReadRsp_address = _zz_13_[21 : 2];
  assign _zz_14_ = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_1_dataReadRsp = _zz_33_;
  assign _zz_15_ = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_16_ = _zz_34_;
  assign ways_2_tagsReadRsp_valid = _zz_47_[0];
  assign ways_2_tagsReadRsp_error = _zz_48_[0];
  assign ways_2_tagsReadRsp_address = _zz_16_[21 : 2];
  assign _zz_17_ = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_2_dataReadRsp = _zz_35_;
  assign _zz_18_ = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_19_ = _zz_36_;
  assign ways_3_tagsReadRsp_valid = _zz_49_[0];
  assign ways_3_tagsReadRsp_error = _zz_50_[0];
  assign ways_3_tagsReadRsp_address = _zz_19_[21 : 2];
  assign _zz_20_ = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_3_dataReadRsp = _zz_37_;
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
    tagsWriteCmd_valid = 1'b0;
    tagsWriteCmd_payload_way = (4'bxxxx);
    tagsWriteCmd_payload_address = (7'bxxxxxxx);
    tagsWriteCmd_payload_data_valid = 1'bx;
    tagsWriteCmd_payload_data_error = 1'bx;
    tagsWriteCmd_payload_data_address = (20'bxxxxxxxxxxxxxxxxxxxx);
    dataWriteCmd_valid = 1'b0;
    dataWriteCmd_payload_way = (4'bxxxx);
    dataWriteCmd_payload_address = (10'bxxxxxxxxxx);
    dataWriteCmd_payload_data = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    dataWriteCmd_payload_mask = (4'bxxxx);
    stageB_loaderValid = 1'b0;
    io_cpu_writeBack_haltIt = io_cpu_writeBack_isValid;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_valid = stageB_flusher_valid;
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
      tagsWriteCmd_payload_way = (4'b1111);
      tagsWriteCmd_payload_data_valid = 1'b0;
      io_cpu_writeBack_haltIt = 1'b1;
    end
    io_cpu_redo = 1'b0;
    io_mem_cmd_valid = 1'b0;
    io_mem_cmd_payload_address = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    io_mem_cmd_payload_length = (3'bxxx);
    io_mem_cmd_payload_last = 1'bx;
    io_mem_cmd_payload_wr = stageB_request_wr;
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        if((stageB_request_wr ? io_mem_cmd_ready : io_mem_rsp_valid))begin
          io_cpu_writeBack_haltIt = 1'b0;
        end
        io_mem_cmd_valid = (! stageB_memCmdSent);
        io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],(2'b00)};
        io_mem_cmd_payload_length = (3'b000);
        io_mem_cmd_payload_last = 1'b1;
        if((stageB_request_isLrsc && (! stageB_lrsc_reserved)))begin
          io_mem_cmd_valid = 1'b0;
          io_cpu_writeBack_haltIt = 1'b0;
        end
      end else begin
        if((stageB_waysHit || (stageB_request_wr && (! stageB_isAmo))))begin
          if((stageB_request_wr && stageB_waysHit))begin
            dataWriteCmd_valid = 1'b1;
          end
          dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 2];
          dataWriteCmd_payload_data = stageB_requestDataBypass;
          dataWriteCmd_payload_mask = stageB_mask;
          dataWriteCmd_payload_way = stageB_waysHits;
          if(stageB_request_wr)begin
            io_mem_cmd_valid = 1'b1;
          end
          io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],(2'b00)};
          io_mem_cmd_payload_length = (3'b000);
          io_mem_cmd_payload_last = 1'b1;
          if(((! stageB_request_wr) || io_mem_cmd_ready))begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
          if(stageB_isAmo)begin
            if((! stageB_amo_resultRegValid))begin
              io_mem_cmd_valid = 1'b0;
              dataWriteCmd_valid = 1'b0;
              io_cpu_writeBack_haltIt = 1'b1;
            end
          end
          if((((! stageB_request_wr) || stageB_isAmo) && ((stageB_colisions & stageB_waysHits) != (4'b0000))))begin
            io_cpu_redo = 1'b1;
            io_mem_cmd_valid = 1'b0;
          end
          if((stageB_request_isLrsc && (! stageB_lrsc_reserved)))begin
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
    if(_zz_39_)begin
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

  always @ (*) begin
    case(io_cpu_execute_args_size)
      2'b00 : begin
        _zz_21_ = (4'b0001);
      end
      2'b01 : begin
        _zz_21_ = (4'b0011);
      end
      default : begin
        _zz_21_ = (4'b1111);
      end
    endcase
  end

  assign stage0_mask = (_zz_21_ <<< io_cpu_execute_address[1 : 0]);
  assign _zz_22_ = io_cpu_execute_address[11 : 2];
  always @ (*) begin
    stage0_colisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz_22_)) && ((stage0_mask & dataWriteCmd_payload_mask) != (4'b0000)));
    stage0_colisions[1] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[1]) && (dataWriteCmd_payload_address == _zz_22_)) && ((stage0_mask & dataWriteCmd_payload_mask) != (4'b0000)));
    stage0_colisions[2] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[2]) && (dataWriteCmd_payload_address == _zz_22_)) && ((stage0_mask & dataWriteCmd_payload_mask) != (4'b0000)));
    stage0_colisions[3] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[3]) && (dataWriteCmd_payload_address == _zz_22_)) && ((stage0_mask & dataWriteCmd_payload_mask) != (4'b0000)));
  end

  assign io_cpu_memory_mmuBus_cmd_isValid = io_cpu_memory_isValid;
  assign io_cpu_memory_mmuBus_cmd_virtualAddress = io_cpu_memory_address;
  assign io_cpu_memory_mmuBus_cmd_bypassTranslation = 1'b0;
  assign io_cpu_memory_mmuBus_end = ((! io_cpu_memory_isStuck) || io_cpu_memory_isRemoved);
  assign io_cpu_memory_isWrite = stageA_request_wr;
  assign stageA_wayHits_0 = ((io_cpu_memory_mmuBus_rsp_physicalAddress[31 : 12] == ways_0_tagsReadRsp_address) && ways_0_tagsReadRsp_valid);
  assign stageA_wayHits_1 = ((io_cpu_memory_mmuBus_rsp_physicalAddress[31 : 12] == ways_1_tagsReadRsp_address) && ways_1_tagsReadRsp_valid);
  assign stageA_wayHits_2 = ((io_cpu_memory_mmuBus_rsp_physicalAddress[31 : 12] == ways_2_tagsReadRsp_address) && ways_2_tagsReadRsp_valid);
  assign stageA_wayHits_3 = ((io_cpu_memory_mmuBus_rsp_physicalAddress[31 : 12] == ways_3_tagsReadRsp_address) && ways_3_tagsReadRsp_valid);
  assign _zz_23_ = io_cpu_memory_address[11 : 2];
  always @ (*) begin
    _zz_24_[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz_23_)) && ((stageA_mask & dataWriteCmd_payload_mask) != (4'b0000)));
    _zz_24_[1] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[1]) && (dataWriteCmd_payload_address == _zz_23_)) && ((stageA_mask & dataWriteCmd_payload_mask) != (4'b0000)));
    _zz_24_[2] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[2]) && (dataWriteCmd_payload_address == _zz_23_)) && ((stageA_mask & dataWriteCmd_payload_mask) != (4'b0000)));
    _zz_24_[3] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[3]) && (dataWriteCmd_payload_address == _zz_23_)) && ((stageA_mask & dataWriteCmd_payload_mask) != (4'b0000)));
  end

  assign stageA_colisions = (stage0_colisions_regNextWhen | _zz_24_);
  always @ (*) begin
    stageB_mmuRspFreeze = 1'b0;
    if((stageB_loaderValid || loader_valid))begin
      stageB_mmuRspFreeze = 1'b1;
    end
  end

  always @ (*) begin
    _zz_25_[0] = stageA_wayHits_0;
    _zz_25_[1] = stageA_wayHits_1;
    _zz_25_[2] = stageA_wayHits_2;
    _zz_25_[3] = stageA_wayHits_3;
  end

  assign stageB_waysHit = (stageB_waysHits != (4'b0000));
  assign _zz_26_ = stageB_waysHits[3];
  assign _zz_27_ = (stageB_waysHits[1] || _zz_26_);
  assign _zz_28_ = (stageB_waysHits[2] || _zz_26_);
  assign stageB_dataMux = _zz_38_;
  always @ (*) begin
    io_cpu_flush_ready = 1'b0;
    if(_zz_40_)begin
      io_cpu_flush_ready = 1'b1;
    end
  end

  always @ (*) begin
    stageB_requestDataBypass = stageB_request_data;
    if(stageB_isAmo)begin
      stageB_requestDataBypass = stageB_amo_resultReg;
    end
  end

  assign stageB_amo_compare = stageB_request_amoCtrl_alu[2];
  assign stageB_amo_unsigned = (stageB_request_amoCtrl_alu[2 : 1] == (2'b11));
  assign stageB_amo_addSub = _zz_51_;
  assign stageB_amo_less = ((stageB_request_data[31] == stageB_dataMux[31]) ? stageB_amo_addSub[31] : (stageB_amo_unsigned ? stageB_dataMux[31] : stageB_request_data[31]));
  assign stageB_amo_selectRf = (stageB_request_amoCtrl_swap ? 1'b1 : (stageB_request_amoCtrl_alu[0] ^ stageB_amo_less));
  always @ (*) begin
    case(_zz_42_)
      3'b000 : begin
        stageB_amo_result = stageB_amo_addSub;
      end
      3'b001 : begin
        stageB_amo_result = (stageB_request_data ^ stageB_dataMux);
      end
      3'b010 : begin
        stageB_amo_result = (stageB_request_data | stageB_dataMux);
      end
      3'b011 : begin
        stageB_amo_result = (stageB_request_data & stageB_dataMux);
      end
      default : begin
        stageB_amo_result = (stageB_amo_selectRf ? stageB_request_data : stageB_dataMux);
      end
    endcase
  end

  always @ (*) begin
    io_cpu_writeBack_accessError = 1'b0;
    if(stageB_mmuRsp_isIoAccess)begin
      io_cpu_writeBack_data = io_mem_rsp_payload_data;
      io_cpu_writeBack_accessError = (io_mem_rsp_valid && io_mem_rsp_payload_error);
    end else begin
      io_cpu_writeBack_data = stageB_dataMux;
      io_cpu_writeBack_accessError = ((stageB_waysHits & _zz_29_) != (4'b0000));
    end
    if((stageB_request_isLrsc && stageB_request_wr))begin
      io_cpu_writeBack_data = {31'd0, _zz_59_};
    end
  end

  assign io_cpu_writeBack_mmuException = (io_cpu_writeBack_isValid && ((stageB_mmuRsp_exception || ((! stageB_mmuRsp_allowWrite) && stageB_request_wr)) || ((! stageB_mmuRsp_allowRead) && ((! stageB_request_wr) || stageB_isAmo))));
  assign io_cpu_writeBack_unalignedAccess = (io_cpu_writeBack_isValid && (((stageB_request_size == (2'b10)) && (stageB_mmuRsp_physicalAddress[1 : 0] != (2'b00))) || ((stageB_request_size == (2'b01)) && (stageB_mmuRsp_physicalAddress[0 : 0] != (1'b0)))));
  assign io_cpu_writeBack_isWrite = stageB_request_wr;
  assign io_mem_cmd_payload_mask = stageB_mask;
  assign io_mem_cmd_payload_data = stageB_requestDataBypass;
  always @ (*) begin
    _zz_29_[0] = stageB_tagsReadRsp_0_error;
    _zz_29_[1] = stageB_tagsReadRsp_1_error;
    _zz_29_[2] = stageB_tagsReadRsp_2_error;
    _zz_29_[3] = stageB_tagsReadRsp_3_error;
  end

  assign loader_counter_willClear = 1'b0;
  assign loader_counter_willOverflowIfInc = (loader_counter_value == (3'b111));
  assign loader_counter_willOverflow = (loader_counter_willOverflowIfInc && loader_counter_willIncrement);
  always @ (*) begin
    loader_counter_valueNext = (loader_counter_value + _zz_61_);
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
      stageA_request_isLrsc <= io_cpu_execute_args_isLrsc;
      stageA_request_isAmo <= io_cpu_execute_args_isAmo;
      stageA_request_amoCtrl_swap <= io_cpu_execute_args_amoCtrl_swap;
      stageA_request_amoCtrl_alu <= io_cpu_execute_args_amoCtrl_alu;
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
      stageB_request_isLrsc <= stageA_request_isLrsc;
      stageB_isAmo <= stageA_request_isAmo;
      stageB_request_amoCtrl_swap <= stageA_request_amoCtrl_swap;
      stageB_request_amoCtrl_alu <= stageA_request_amoCtrl_alu;
    end
    if(_zz_41_)begin
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
      stageB_tagsReadRsp_1_valid <= ways_1_tagsReadRsp_valid;
      stageB_tagsReadRsp_1_error <= ways_1_tagsReadRsp_error;
      stageB_tagsReadRsp_1_address <= ways_1_tagsReadRsp_address;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_tagsReadRsp_2_valid <= ways_2_tagsReadRsp_valid;
      stageB_tagsReadRsp_2_error <= ways_2_tagsReadRsp_error;
      stageB_tagsReadRsp_2_address <= ways_2_tagsReadRsp_address;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_tagsReadRsp_3_valid <= ways_3_tagsReadRsp_valid;
      stageB_tagsReadRsp_3_error <= ways_3_tagsReadRsp_error;
      stageB_tagsReadRsp_3_address <= ways_3_tagsReadRsp_address;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_dataReadRsp_0 <= ways_0_dataReadRsp;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_dataReadRsp_1 <= ways_1_dataReadRsp;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_dataReadRsp_2 <= ways_2_dataReadRsp;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_dataReadRsp_3 <= ways_3_dataReadRsp;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_waysHits <= _zz_25_;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_mask <= stageA_mask;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_colisions <= stageA_colisions;
    end
    stageB_amo_resultRegValid <= 1'b1;
    if((! io_cpu_writeBack_isStuck))begin
      stageB_amo_resultRegValid <= 1'b0;
    end
    stageB_amo_resultReg <= stageB_amo_result;
    if(!(! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))) begin
      $display("ERROR writeBack stuck by another plugin is not allowed");
    end
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      stageB_flusher_valid <= 1'b1;
      stageB_mmuRsp_physicalAddress <= (32'b00000000000000000000000000000000);
      stageB_lrsc_reserved <= 1'b0;
      stageB_memCmdSent <= 1'b0;
      loader_valid <= 1'b0;
      loader_counter_value <= (3'b000);
      loader_waysAllocator <= (4'b0001);
      loader_error <= 1'b0;
    end else begin
      if(_zz_41_)begin
        stageB_mmuRsp_physicalAddress <= io_cpu_memory_mmuBus_rsp_physicalAddress;
      end
      if(stageB_flusher_valid)begin
        if((stageB_mmuRsp_physicalAddress[11 : 5] != (7'b1111111)))begin
          stageB_mmuRsp_physicalAddress[11 : 5] <= (stageB_mmuRsp_physicalAddress[11 : 5] + (7'b0000001));
        end else begin
          stageB_flusher_valid <= 1'b0;
        end
      end
      if(_zz_40_)begin
        stageB_mmuRsp_physicalAddress[11 : 5] <= (7'b0000000);
        stageB_flusher_valid <= 1'b1;
      end
      if(((((io_cpu_writeBack_isValid && (! io_cpu_writeBack_isStuck)) && (! io_cpu_redo)) && stageB_request_isLrsc) && (! stageB_request_wr)))begin
        stageB_lrsc_reserved <= 1'b1;
      end
      if(io_cpu_writeBack_clearLrsc)begin
        stageB_lrsc_reserved <= 1'b0;
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
      if(_zz_39_)begin
        loader_error <= (loader_error || io_mem_rsp_payload_error);
      end
      if(loader_counter_willOverflow)begin
        loader_valid <= 1'b0;
        loader_waysAllocator <= _zz_62_[3:0];
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
  wire  _zz_215_;
  wire  _zz_216_;
  wire  _zz_217_;
  wire  _zz_218_;
  wire  _zz_219_;
  wire [31:0] _zz_220_;
  wire  _zz_221_;
  wire  _zz_222_;
  wire  _zz_223_;
  reg  _zz_224_;
  reg  _zz_225_;
  reg [31:0] _zz_226_;
  reg  _zz_227_;
  reg [31:0] _zz_228_;
  reg [1:0] _zz_229_;
  reg  _zz_230_;
  reg  _zz_231_;
  wire  _zz_232_;
  wire [2:0] _zz_233_;
  reg  _zz_234_;
  wire [31:0] _zz_235_;
  reg  _zz_236_;
  reg  _zz_237_;
  wire  _zz_238_;
  wire [31:0] _zz_239_;
  wire  _zz_240_;
  wire  _zz_241_;
  reg [53:0] _zz_242_;
  reg [31:0] _zz_243_;
  reg [31:0] _zz_244_;
  reg [31:0] _zz_245_;
  reg  _zz_246_;
  reg  _zz_247_;
  reg  _zz_248_;
  reg [9:0] _zz_249_;
  reg [9:0] _zz_250_;
  reg [9:0] _zz_251_;
  reg [9:0] _zz_252_;
  reg  _zz_253_;
  reg  _zz_254_;
  reg  _zz_255_;
  reg  _zz_256_;
  reg  _zz_257_;
  reg  _zz_258_;
  reg  _zz_259_;
  reg [9:0] _zz_260_;
  reg [9:0] _zz_261_;
  reg [9:0] _zz_262_;
  reg [9:0] _zz_263_;
  reg  _zz_264_;
  reg  _zz_265_;
  reg  _zz_266_;
  reg  _zz_267_;
  wire  IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_haltIt;
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
  wire  dataCache_1__io_cpu_memory_isWrite;
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
  wire  _zz_268_;
  wire  _zz_269_;
  wire  _zz_270_;
  wire  _zz_271_;
  wire  _zz_272_;
  wire [1:0] _zz_273_;
  wire  _zz_274_;
  wire  _zz_275_;
  wire  _zz_276_;
  wire  _zz_277_;
  wire  _zz_278_;
  wire [5:0] _zz_279_;
  wire  _zz_280_;
  wire  _zz_281_;
  wire  _zz_282_;
  wire  _zz_283_;
  wire  _zz_284_;
  wire  _zz_285_;
  wire  _zz_286_;
  wire  _zz_287_;
  wire  _zz_288_;
  wire  _zz_289_;
  wire  _zz_290_;
  wire  _zz_291_;
  wire  _zz_292_;
  wire  _zz_293_;
  wire [1:0] _zz_294_;
  wire [1:0] _zz_295_;
  wire [1:0] _zz_296_;
  wire  _zz_297_;
  wire [3:0] _zz_298_;
  wire [2:0] _zz_299_;
  wire [31:0] _zz_300_;
  wire [9:0] _zz_301_;
  wire [19:0] _zz_302_;
  wire [29:0] _zz_303_;
  wire [9:0] _zz_304_;
  wire [1:0] _zz_305_;
  wire [0:0] _zz_306_;
  wire [1:0] _zz_307_;
  wire [0:0] _zz_308_;
  wire [1:0] _zz_309_;
  wire [1:0] _zz_310_;
  wire [0:0] _zz_311_;
  wire [1:0] _zz_312_;
  wire [0:0] _zz_313_;
  wire [1:0] _zz_314_;
  wire [2:0] _zz_315_;
  wire [2:0] _zz_316_;
  wire [0:0] _zz_317_;
  wire [0:0] _zz_318_;
  wire [0:0] _zz_319_;
  wire [0:0] _zz_320_;
  wire [0:0] _zz_321_;
  wire [0:0] _zz_322_;
  wire [0:0] _zz_323_;
  wire [0:0] _zz_324_;
  wire [0:0] _zz_325_;
  wire [0:0] _zz_326_;
  wire [0:0] _zz_327_;
  wire [0:0] _zz_328_;
  wire [0:0] _zz_329_;
  wire [0:0] _zz_330_;
  wire [0:0] _zz_331_;
  wire [0:0] _zz_332_;
  wire [0:0] _zz_333_;
  wire [0:0] _zz_334_;
  wire [0:0] _zz_335_;
  wire [0:0] _zz_336_;
  wire [0:0] _zz_337_;
  wire [0:0] _zz_338_;
  wire [2:0] _zz_339_;
  wire [4:0] _zz_340_;
  wire [11:0] _zz_341_;
  wire [11:0] _zz_342_;
  wire [31:0] _zz_343_;
  wire [31:0] _zz_344_;
  wire [31:0] _zz_345_;
  wire [31:0] _zz_346_;
  wire [31:0] _zz_347_;
  wire [31:0] _zz_348_;
  wire [31:0] _zz_349_;
  wire [32:0] _zz_350_;
  wire [31:0] _zz_351_;
  wire [32:0] _zz_352_;
  wire [51:0] _zz_353_;
  wire [51:0] _zz_354_;
  wire [51:0] _zz_355_;
  wire [32:0] _zz_356_;
  wire [51:0] _zz_357_;
  wire [49:0] _zz_358_;
  wire [51:0] _zz_359_;
  wire [49:0] _zz_360_;
  wire [51:0] _zz_361_;
  wire [65:0] _zz_362_;
  wire [65:0] _zz_363_;
  wire [31:0] _zz_364_;
  wire [31:0] _zz_365_;
  wire [0:0] _zz_366_;
  wire [5:0] _zz_367_;
  wire [32:0] _zz_368_;
  wire [32:0] _zz_369_;
  wire [31:0] _zz_370_;
  wire [31:0] _zz_371_;
  wire [32:0] _zz_372_;
  wire [32:0] _zz_373_;
  wire [32:0] _zz_374_;
  wire [0:0] _zz_375_;
  wire [32:0] _zz_376_;
  wire [0:0] _zz_377_;
  wire [32:0] _zz_378_;
  wire [0:0] _zz_379_;
  wire [31:0] _zz_380_;
  wire [1:0] _zz_381_;
  wire [1:0] _zz_382_;
  wire [19:0] _zz_383_;
  wire [11:0] _zz_384_;
  wire [11:0] _zz_385_;
  wire [0:0] _zz_386_;
  wire [1:0] _zz_387_;
  wire [0:0] _zz_388_;
  wire [1:0] _zz_389_;
  wire [0:0] _zz_390_;
  wire [0:0] _zz_391_;
  wire [0:0] _zz_392_;
  wire [0:0] _zz_393_;
  wire [0:0] _zz_394_;
  wire [0:0] _zz_395_;
  wire [0:0] _zz_396_;
  wire [0:0] _zz_397_;
  wire [0:0] _zz_398_;
  wire [0:0] _zz_399_;
  wire [0:0] _zz_400_;
  wire [0:0] _zz_401_;
  wire [0:0] _zz_402_;
  wire [0:0] _zz_403_;
  wire [0:0] _zz_404_;
  wire [0:0] _zz_405_;
  wire [0:0] _zz_406_;
  wire [0:0] _zz_407_;
  wire [0:0] _zz_408_;
  wire [0:0] _zz_409_;
  wire [0:0] _zz_410_;
  wire [0:0] _zz_411_;
  wire [0:0] _zz_412_;
  wire [0:0] _zz_413_;
  wire [0:0] _zz_414_;
  wire [0:0] _zz_415_;
  wire [0:0] _zz_416_;
  wire [0:0] _zz_417_;
  wire [0:0] _zz_418_;
  wire [0:0] _zz_419_;
  wire [0:0] _zz_420_;
  wire [0:0] _zz_421_;
  wire [0:0] _zz_422_;
  wire [0:0] _zz_423_;
  wire [0:0] _zz_424_;
  wire [0:0] _zz_425_;
  wire [0:0] _zz_426_;
  wire [0:0] _zz_427_;
  wire [0:0] _zz_428_;
  wire [0:0] _zz_429_;
  wire [0:0] _zz_430_;
  wire [0:0] _zz_431_;
  wire [0:0] _zz_432_;
  wire [0:0] _zz_433_;
  wire [0:0] _zz_434_;
  wire [0:0] _zz_435_;
  wire [0:0] _zz_436_;
  wire [0:0] _zz_437_;
  wire [0:0] _zz_438_;
  wire [0:0] _zz_439_;
  wire [0:0] _zz_440_;
  wire [0:0] _zz_441_;
  wire [0:0] _zz_442_;
  wire [53:0] _zz_443_;
  wire  _zz_444_;
  wire  _zz_445_;
  wire [1:0] _zz_446_;
  wire [31:0] _zz_447_;
  wire  _zz_448_;
  wire [0:0] _zz_449_;
  wire [0:0] _zz_450_;
  wire [0:0] _zz_451_;
  wire [3:0] _zz_452_;
  wire [1:0] _zz_453_;
  wire [1:0] _zz_454_;
  wire  _zz_455_;
  wire [0:0] _zz_456_;
  wire [29:0] _zz_457_;
  wire [31:0] _zz_458_;
  wire [31:0] _zz_459_;
  wire [31:0] _zz_460_;
  wire [31:0] _zz_461_;
  wire [31:0] _zz_462_;
  wire [31:0] _zz_463_;
  wire [31:0] _zz_464_;
  wire  _zz_465_;
  wire [0:0] _zz_466_;
  wire [1:0] _zz_467_;
  wire  _zz_468_;
  wire  _zz_469_;
  wire [1:0] _zz_470_;
  wire [1:0] _zz_471_;
  wire  _zz_472_;
  wire [0:0] _zz_473_;
  wire [27:0] _zz_474_;
  wire [31:0] _zz_475_;
  wire [31:0] _zz_476_;
  wire [31:0] _zz_477_;
  wire  _zz_478_;
  wire [31:0] _zz_479_;
  wire [31:0] _zz_480_;
  wire  _zz_481_;
  wire  _zz_482_;
  wire [0:0] _zz_483_;
  wire [0:0] _zz_484_;
  wire [2:0] _zz_485_;
  wire [2:0] _zz_486_;
  wire  _zz_487_;
  wire [0:0] _zz_488_;
  wire [25:0] _zz_489_;
  wire [31:0] _zz_490_;
  wire [31:0] _zz_491_;
  wire [31:0] _zz_492_;
  wire [31:0] _zz_493_;
  wire [31:0] _zz_494_;
  wire [31:0] _zz_495_;
  wire [31:0] _zz_496_;
  wire  _zz_497_;
  wire [0:0] _zz_498_;
  wire [0:0] _zz_499_;
  wire  _zz_500_;
  wire [0:0] _zz_501_;
  wire [0:0] _zz_502_;
  wire  _zz_503_;
  wire [0:0] _zz_504_;
  wire [23:0] _zz_505_;
  wire [31:0] _zz_506_;
  wire [31:0] _zz_507_;
  wire [31:0] _zz_508_;
  wire [0:0] _zz_509_;
  wire [2:0] _zz_510_;
  wire [0:0] _zz_511_;
  wire [0:0] _zz_512_;
  wire [1:0] _zz_513_;
  wire [1:0] _zz_514_;
  wire  _zz_515_;
  wire [0:0] _zz_516_;
  wire [20:0] _zz_517_;
  wire [31:0] _zz_518_;
  wire [31:0] _zz_519_;
  wire [31:0] _zz_520_;
  wire  _zz_521_;
  wire  _zz_522_;
  wire [31:0] _zz_523_;
  wire [31:0] _zz_524_;
  wire [31:0] _zz_525_;
  wire [31:0] _zz_526_;
  wire [31:0] _zz_527_;
  wire  _zz_528_;
  wire [0:0] _zz_529_;
  wire [0:0] _zz_530_;
  wire  _zz_531_;
  wire [0:0] _zz_532_;
  wire [17:0] _zz_533_;
  wire [31:0] _zz_534_;
  wire [31:0] _zz_535_;
  wire [31:0] _zz_536_;
  wire [0:0] _zz_537_;
  wire [5:0] _zz_538_;
  wire [0:0] _zz_539_;
  wire [0:0] _zz_540_;
  wire  _zz_541_;
  wire [0:0] _zz_542_;
  wire [14:0] _zz_543_;
  wire [31:0] _zz_544_;
  wire [31:0] _zz_545_;
  wire  _zz_546_;
  wire [0:0] _zz_547_;
  wire [2:0] _zz_548_;
  wire [31:0] _zz_549_;
  wire [31:0] _zz_550_;
  wire [31:0] _zz_551_;
  wire [0:0] _zz_552_;
  wire [2:0] _zz_553_;
  wire [0:0] _zz_554_;
  wire [0:0] _zz_555_;
  wire  _zz_556_;
  wire [0:0] _zz_557_;
  wire [11:0] _zz_558_;
  wire [31:0] _zz_559_;
  wire [31:0] _zz_560_;
  wire [31:0] _zz_561_;
  wire  _zz_562_;
  wire [0:0] _zz_563_;
  wire [0:0] _zz_564_;
  wire [31:0] _zz_565_;
  wire [31:0] _zz_566_;
  wire  _zz_567_;
  wire [0:0] _zz_568_;
  wire [0:0] _zz_569_;
  wire [31:0] _zz_570_;
  wire [31:0] _zz_571_;
  wire [0:0] _zz_572_;
  wire [4:0] _zz_573_;
  wire [1:0] _zz_574_;
  wire [1:0] _zz_575_;
  wire  _zz_576_;
  wire [0:0] _zz_577_;
  wire [9:0] _zz_578_;
  wire [31:0] _zz_579_;
  wire [31:0] _zz_580_;
  wire [31:0] _zz_581_;
  wire [31:0] _zz_582_;
  wire [31:0] _zz_583_;
  wire [31:0] _zz_584_;
  wire [31:0] _zz_585_;
  wire [31:0] _zz_586_;
  wire [31:0] _zz_587_;
  wire [31:0] _zz_588_;
  wire  _zz_589_;
  wire [0:0] _zz_590_;
  wire [2:0] _zz_591_;
  wire  _zz_592_;
  wire  _zz_593_;
  wire  _zz_594_;
  wire [0:0] _zz_595_;
  wire [0:0] _zz_596_;
  wire  _zz_597_;
  wire [0:0] _zz_598_;
  wire [7:0] _zz_599_;
  wire [31:0] _zz_600_;
  wire [31:0] _zz_601_;
  wire [31:0] _zz_602_;
  wire  _zz_603_;
  wire [0:0] _zz_604_;
  wire [0:0] _zz_605_;
  wire [31:0] _zz_606_;
  wire [31:0] _zz_607_;
  wire [31:0] _zz_608_;
  wire [1:0] _zz_609_;
  wire [1:0] _zz_610_;
  wire  _zz_611_;
  wire [0:0] _zz_612_;
  wire [5:0] _zz_613_;
  wire [31:0] _zz_614_;
  wire [31:0] _zz_615_;
  wire [31:0] _zz_616_;
  wire [31:0] _zz_617_;
  wire  _zz_618_;
  wire [0:0] _zz_619_;
  wire [0:0] _zz_620_;
  wire  _zz_621_;
  wire [1:0] _zz_622_;
  wire [1:0] _zz_623_;
  wire  _zz_624_;
  wire [0:0] _zz_625_;
  wire [2:0] _zz_626_;
  wire [31:0] _zz_627_;
  wire [31:0] _zz_628_;
  wire [31:0] _zz_629_;
  wire [31:0] _zz_630_;
  wire [31:0] _zz_631_;
  wire [31:0] _zz_632_;
  wire [31:0] _zz_633_;
  wire [31:0] _zz_634_;
  wire [0:0] _zz_635_;
  wire [3:0] _zz_636_;
  wire [2:0] _zz_637_;
  wire [2:0] _zz_638_;
  wire  _zz_639_;
  wire  _zz_640_;
  wire [31:0] _zz_641_;
  wire [31:0] _zz_642_;
  wire [31:0] _zz_643_;
  wire  _zz_644_;
  wire [0:0] _zz_645_;
  wire [0:0] _zz_646_;
  wire  _zz_647_;
  wire  _zz_648_;
  wire [31:0] _zz_649_;
  wire [31:0] _zz_650_;
  wire [31:0] _zz_651_;
  wire [31:0] _zz_652_;
  wire [31:0] _zz_653_;
  wire  _zz_654_;
  wire [0:0] _zz_655_;
  wire [17:0] _zz_656_;
  wire [31:0] _zz_657_;
  wire [31:0] _zz_658_;
  wire [31:0] _zz_659_;
  wire  _zz_660_;
  wire [0:0] _zz_661_;
  wire [11:0] _zz_662_;
  wire [31:0] _zz_663_;
  wire [31:0] _zz_664_;
  wire [31:0] _zz_665_;
  wire  _zz_666_;
  wire [0:0] _zz_667_;
  wire [5:0] _zz_668_;
  wire [31:0] _zz_669_;
  wire [31:0] _zz_670_;
  wire [31:0] _zz_671_;
  wire  _zz_672_;
  wire  _zz_673_;
  wire [1:0] memory_MEMORY_ADDRESS_LOW;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire  decode_CSR_WRITE_OPCODE;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_1_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_2_;
  wire `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_3_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_4_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_5_;
  wire  decode_DO_EBREAK;
  wire `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_6_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_7_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_8_;
  wire  decode_IS_CSR;
  wire  decode_BYPASSABLE_EXECUTE_STAGE;
  wire  execute_BYPASSABLE_MEMORY_STAGE;
  wire  decode_BYPASSABLE_MEMORY_STAGE;
  wire  memory_MEMORY_WR;
  wire  decode_MEMORY_WR;
  wire  decode_MEMORY_AMO;
  wire [33:0] execute_MUL_HL;
  wire  decode_SRC_LESS_UNSIGNED;
  wire `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_9_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_10_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_11_;
  wire  execute_PREDICTION_CONTEXT_hazard;
  wire  execute_PREDICTION_CONTEXT_hit;
  wire [19:0] execute_PREDICTION_CONTEXT_line_source;
  wire [1:0] execute_PREDICTION_CONTEXT_line_branchWish;
  wire [31:0] execute_PREDICTION_CONTEXT_line_target;
  wire  decode_PREDICTION_CONTEXT_hazard;
  wire  decode_PREDICTION_CONTEXT_hit;
  wire [19:0] decode_PREDICTION_CONTEXT_line_source;
  wire [1:0] decode_PREDICTION_CONTEXT_line_branchWish;
  wire [31:0] decode_PREDICTION_CONTEXT_line_target;
  wire  execute_BRANCH_DO;
  wire  decode_MEMORY_MANAGMENT;
  wire [33:0] execute_MUL_LH;
  wire [31:0] execute_SHIFT_RIGHT;
  wire [33:0] memory_MUL_HH;
  wire [33:0] execute_MUL_HH;
  wire [31:0] execute_NEXT_PC2;
  wire  decode_SRC2_FORCE_ZERO;
  wire  memory_IS_MUL;
  wire  execute_IS_MUL;
  wire  decode_IS_MUL;
  wire  execute_TARGET_MISSMATCH2;
  wire [51:0] memory_MUL_LOW;
  wire  decode_IS_DIV;
  wire  decode_IS_RS2_SIGNED;
  wire  execute_IS_DBUS_SHARING;
  wire  decode_CSR_READ_OPCODE;
  wire  decode_MEMORY_LRSC;
  wire  decode_IS_RS1_SIGNED;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_12_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_13_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_14_;
  wire  decode_IS_SFENCE_VMA;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_15_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_16_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_17_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_18_;
  wire `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_19_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_20_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_21_;
  wire [31:0] decode_SRC2;
  wire [31:0] execute_MUL_LL;
  wire [31:0] writeBack_FORMAL_PC_NEXT;
  wire [31:0] memory_FORMAL_PC_NEXT;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire [31:0] decode_SRC1;
  wire  execute_IS_SFENCE_VMA;
  wire [31:0] memory_NEXT_PC2;
  wire [31:0] memory_PC;
  wire [31:0] memory_BRANCH_CALC;
  wire  memory_TARGET_MISSMATCH2;
  wire  memory_BRANCH_DO;
  wire [31:0] execute_BRANCH_CALC;
  wire  _zz_22_;
  wire [31:0] _zz_23_;
  wire [31:0] _zz_24_;
  wire `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_25_;
  wire  _zz_26_;
  wire [31:0] execute_PC;
  wire  execute_DO_EBREAK;
  wire  decode_IS_EBREAK;
  wire  _zz_27_;
  wire  execute_CSR_READ_OPCODE;
  wire  execute_CSR_WRITE_OPCODE;
  wire  execute_IS_CSR;
  wire `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_28_;
  wire `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_29_;
  wire  _zz_30_;
  wire  _zz_31_;
  wire `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_32_;
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
  wire [51:0] _zz_33_;
  wire [33:0] _zz_34_;
  wire [33:0] _zz_35_;
  wire [33:0] _zz_36_;
  wire [31:0] _zz_37_;
  wire  decode_RS2_USE;
  wire  decode_RS1_USE;
  reg [31:0] _zz_38_;
  wire  execute_REGFILE_WRITE_VALID;
  wire  execute_BYPASSABLE_EXECUTE_STAGE;
  wire  memory_REGFILE_WRITE_VALID;
  wire [31:0] memory_INSTRUCTION;
  wire  memory_BYPASSABLE_MEMORY_STAGE;
  wire  writeBack_REGFILE_WRITE_VALID;
  reg [31:0] decode_RS2;
  reg [31:0] decode_RS1;
  wire [31:0] memory_SHIFT_RIGHT;
  reg [31:0] _zz_39_;
  wire `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_40_;
  wire [31:0] _zz_41_;
  wire `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_42_;
  wire  _zz_43_;
  wire [31:0] _zz_44_;
  wire [31:0] _zz_45_;
  wire  execute_SRC_LESS_UNSIGNED;
  wire  execute_SRC2_FORCE_ZERO;
  wire  execute_SRC_USE_SUB_LESS;
  wire [31:0] _zz_46_;
  wire [31:0] _zz_47_;
  wire `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_48_;
  wire [31:0] _zz_49_;
  wire [31:0] _zz_50_;
  wire `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_51_;
  wire [31:0] _zz_52_;
  wire  decode_SRC_USE_SUB_LESS;
  wire  decode_SRC_ADD_ZERO;
  wire  _zz_53_;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_54_;
  wire [31:0] _zz_55_;
  wire [31:0] execute_SRC2;
  wire [31:0] execute_SRC1;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_56_;
  wire [31:0] _zz_57_;
  wire  _zz_58_;
  reg  _zz_59_;
  wire [31:0] _zz_60_;
  wire [31:0] _zz_61_;
  wire [31:0] decode_INSTRUCTION_ANTICIPATED;
  reg  decode_REGFILE_WRITE_VALID;
  wire  decode_LEGAL_INSTRUCTION;
  wire  decode_INSTRUCTION_READY;
  wire  _zz_62_;
  wire  _zz_63_;
  wire  _zz_64_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_65_;
  wire  _zz_66_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_67_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_68_;
  wire  _zz_69_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_70_;
  wire  _zz_71_;
  wire  _zz_72_;
  wire  _zz_73_;
  wire  _zz_74_;
  wire  _zz_75_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_76_;
  wire  _zz_77_;
  wire  _zz_78_;
  wire  _zz_79_;
  wire  _zz_80_;
  wire  _zz_81_;
  wire  _zz_82_;
  wire  _zz_83_;
  wire  _zz_84_;
  wire  _zz_85_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_86_;
  wire  _zz_87_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_88_;
  wire  _zz_89_;
  wire  _zz_90_;
  wire  writeBack_IS_DBUS_SHARING;
  wire  memory_IS_DBUS_SHARING;
  wire  _zz_91_;
  reg [31:0] _zz_92_;
  wire [1:0] writeBack_MEMORY_ADDRESS_LOW;
  wire  writeBack_MEMORY_WR;
  wire [31:0] writeBack_REGFILE_WRITE_DATA;
  wire  writeBack_MEMORY_ENABLE;
  wire [31:0] memory_REGFILE_WRITE_DATA;
  wire  memory_MEMORY_ENABLE;
  wire [1:0] _zz_93_;
  wire  execute_MEMORY_AMO;
  wire  execute_MEMORY_LRSC;
  wire  execute_MEMORY_MANAGMENT;
  wire [31:0] execute_RS2;
  wire  execute_MEMORY_WR;
  wire [31:0] execute_SRC_ADD;
  wire  execute_MEMORY_ENABLE;
  wire [31:0] execute_INSTRUCTION;
  wire  decode_MEMORY_ENABLE;
  wire  decode_FLUSH_ALL;
  reg  IBusCachedPlugin_rsp_issueDetected;
  reg  _zz_94_;
  reg  _zz_95_;
  reg  _zz_96_;
  wire [31:0] _zz_97_;
  wire  memory_PREDICTION_CONTEXT_hazard;
  wire  memory_PREDICTION_CONTEXT_hit;
  wire [19:0] memory_PREDICTION_CONTEXT_line_source;
  wire [1:0] memory_PREDICTION_CONTEXT_line_branchWish;
  wire [31:0] memory_PREDICTION_CONTEXT_line_target;
  wire  _zz_98_;
  wire  _zz_99_;
  wire [19:0] _zz_100_;
  wire [1:0] _zz_101_;
  wire [31:0] _zz_102_;
  reg  _zz_103_;
  reg [31:0] _zz_104_;
  reg [31:0] _zz_105_;
  wire [31:0] _zz_106_;
  wire [31:0] _zz_107_;
  wire [31:0] _zz_108_;
  wire [31:0] writeBack_PC /* verilator public */ ;
  wire [31:0] writeBack_INSTRUCTION /* verilator public */ ;
  wire [31:0] decode_PC /* verilator public */ ;
  wire [31:0] decode_INSTRUCTION /* verilator public */ ;
  reg  decode_arbitration_haltItself /* verilator public */ ;
  reg  decode_arbitration_haltByOther;
  reg  decode_arbitration_removeIt;
  reg  decode_arbitration_flushAll /* verilator public */ ;
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
  reg  writeBack_arbitration_isValid /* verilator public */ ;
  wire  writeBack_arbitration_isStuck;
  wire  writeBack_arbitration_isStuckByOthers;
  wire  writeBack_arbitration_isFlushed;
  wire  writeBack_arbitration_isMoving;
  wire  writeBack_arbitration_isFiring /* verilator public */ ;
  reg  IBusCachedPlugin_fetcherHalt;
  reg  IBusCachedPlugin_fetcherflushIt;
  reg  IBusCachedPlugin_incomingInstruction;
  wire  IBusCachedPlugin_fetchPrediction_cmd_hadBranch;
  wire [31:0] IBusCachedPlugin_fetchPrediction_cmd_targetPc;
  wire  IBusCachedPlugin_fetchPrediction_rsp_wasRight;
  wire [31:0] IBusCachedPlugin_fetchPrediction_rsp_finalPc;
  wire [31:0] IBusCachedPlugin_fetchPrediction_rsp_sourceLastWord;
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
  wire  IBusCachedPlugin_mmuBus_busy;
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
  wire  DBusCachedPlugin_mmuBus_busy;
  reg  DBusCachedPlugin_redoBranch_valid;
  wire [31:0] DBusCachedPlugin_redoBranch_payload;
  reg  DBusCachedPlugin_exceptionBus_valid;
  reg [3:0] DBusCachedPlugin_exceptionBus_payload_code;
  wire [31:0] DBusCachedPlugin_exceptionBus_payload_badAddr;
  reg  _zz_109_;
  wire  decodeExceptionPort_valid;
  wire [3:0] decodeExceptionPort_payload_code;
  wire [31:0] decodeExceptionPort_payload_badAddr;
  reg  CsrPlugin_jumpInterface_valid;
  reg [31:0] CsrPlugin_jumpInterface_payload;
  reg  CsrPlugin_exceptionPending;
  wire  contextSwitching;
  reg [1:0] CsrPlugin_privilege;
  reg  CsrPlugin_forceMachineWire;
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
  wire  BranchPlugin_branchExceptionPort_valid;
  wire [3:0] BranchPlugin_branchExceptionPort_payload_code;
  wire [31:0] BranchPlugin_branchExceptionPort_payload_badAddr;
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
  wire [3:0] _zz_110_;
  wire [3:0] _zz_111_;
  wire  _zz_112_;
  wire  _zz_113_;
  wire  _zz_114_;
  wire  IBusCachedPlugin_fetchPc_preOutput_valid;
  wire  IBusCachedPlugin_fetchPc_preOutput_ready;
  wire [31:0] IBusCachedPlugin_fetchPc_preOutput_payload;
  wire  _zz_115_;
  wire  IBusCachedPlugin_fetchPc_output_valid;
  wire  IBusCachedPlugin_fetchPc_output_ready;
  wire [31:0] IBusCachedPlugin_fetchPc_output_payload;
  wire  IBusCachedPlugin_fetchPc_predictionPcLoad_valid;
  wire [31:0] IBusCachedPlugin_fetchPc_predictionPcLoad_payload;
  reg [31:0] IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg  IBusCachedPlugin_fetchPc_inc;
  reg  IBusCachedPlugin_fetchPc_propagatePc;
  reg [31:0] IBusCachedPlugin_fetchPc_pc;
  reg  IBusCachedPlugin_fetchPc_samplePcNext;
  reg  _zz_116_;
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
  reg  IBusCachedPlugin_iBusRsp_stages_1_halt;
  wire  IBusCachedPlugin_iBusRsp_stages_1_inputSample;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_valid;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_payload;
  reg  IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_inputSample;
  wire  _zz_117_;
  wire  _zz_118_;
  wire  _zz_119_;
  wire  _zz_120_;
  wire  _zz_121_;
  reg  _zz_122_;
  wire  _zz_123_;
  reg  _zz_124_;
  reg [31:0] _zz_125_;
  wire  IBusCachedPlugin_iBusRsp_readyForError;
  wire  IBusCachedPlugin_iBusRsp_decodeInput_valid;
  wire  IBusCachedPlugin_iBusRsp_decodeInput_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_decodeInput_payload_pc;
  wire  IBusCachedPlugin_iBusRsp_decodeInput_payload_rsp_error;
  wire [31:0] IBusCachedPlugin_iBusRsp_decodeInput_payload_rsp_inst;
  wire  IBusCachedPlugin_iBusRsp_decodeInput_payload_isRvc;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_0;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_1;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_2;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_3;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_4;
  reg  IBusCachedPlugin_injector_decodeRemoved;
  reg  IBusCachedPlugin_predictor_historyWrite_valid;
  wire [9:0] IBusCachedPlugin_predictor_historyWrite_payload_address;
  wire [19:0] IBusCachedPlugin_predictor_historyWrite_payload_data_source;
  reg [1:0] IBusCachedPlugin_predictor_historyWrite_payload_data_branchWish;
  wire [31:0] IBusCachedPlugin_predictor_historyWrite_payload_data_target;
  wire [29:0] _zz_126_;
  wire  _zz_127_;
  wire [19:0] IBusCachedPlugin_predictor_line_source;
  wire [1:0] IBusCachedPlugin_predictor_line_branchWish;
  wire [31:0] IBusCachedPlugin_predictor_line_target;
  wire [53:0] _zz_128_;
  wire  IBusCachedPlugin_predictor_hit;
  reg  IBusCachedPlugin_predictor_historyWriteLast_valid;
  reg [9:0] IBusCachedPlugin_predictor_historyWriteLast_payload_address;
  reg [19:0] IBusCachedPlugin_predictor_historyWriteLast_payload_data_source;
  reg [1:0] IBusCachedPlugin_predictor_historyWriteLast_payload_data_branchWish;
  reg [31:0] IBusCachedPlugin_predictor_historyWriteLast_payload_data_target;
  wire  IBusCachedPlugin_predictor_hazard;
  wire  IBusCachedPlugin_predictor_fetchContext_hazard;
  wire  IBusCachedPlugin_predictor_fetchContext_hit;
  wire [19:0] IBusCachedPlugin_predictor_fetchContext_line_source;
  wire [1:0] IBusCachedPlugin_predictor_fetchContext_line_branchWish;
  wire [31:0] IBusCachedPlugin_predictor_fetchContext_line_target;
  reg  IBusCachedPlugin_predictor_fetchContext_regNextWhen_hazard;
  reg  IBusCachedPlugin_predictor_fetchContext_regNextWhen_hit;
  reg [19:0] IBusCachedPlugin_predictor_fetchContext_regNextWhen_line_source;
  reg [1:0] IBusCachedPlugin_predictor_fetchContext_regNextWhen_line_branchWish;
  reg [31:0] IBusCachedPlugin_predictor_fetchContext_regNextWhen_line_target;
  wire  IBusCachedPlugin_predictor_injectorContext_hazard;
  wire  IBusCachedPlugin_predictor_injectorContext_hit;
  wire [19:0] IBusCachedPlugin_predictor_injectorContext_line_source;
  wire [1:0] IBusCachedPlugin_predictor_injectorContext_line_branchWish;
  wire [31:0] IBusCachedPlugin_predictor_injectorContext_line_target;
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
  reg  _zz_129_;
  reg  _zz_130_;
  reg [31:0] _zz_131_;
  reg [31:0] _zz_132_;
  reg [3:0] _zz_133_;
  reg [2:0] _zz_134_;
  reg  _zz_135_;
  wire  dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_valid;
  wire  dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_ready;
  wire  dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_wr;
  wire [31:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_address;
  wire [31:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_data;
  wire [3:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_mask;
  wire [2:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_length;
  wire  dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_last;
  reg  _zz_136_;
  reg  _zz_137_;
  reg [31:0] _zz_138_;
  reg [31:0] _zz_139_;
  reg [3:0] _zz_140_;
  reg [2:0] _zz_141_;
  reg  _zz_142_;
  reg  dBus_rsp_m2sPipe_valid;
  reg [31:0] dBus_rsp_m2sPipe_payload_data;
  reg  dBus_rsp_m2sPipe_payload_error;
  wire [1:0] execute_DBusCachedPlugin_size;
  reg [31:0] _zz_143_;
  reg [31:0] writeBack_DBusCachedPlugin_rspShifted;
  wire  _zz_144_;
  reg [31:0] _zz_145_;
  wire  _zz_146_;
  reg [31:0] _zz_147_;
  reg [31:0] writeBack_DBusCachedPlugin_rspFormated;
  reg  DBusCachedPlugin_forceDatapath;
  wire [35:0] _zz_148_;
  wire  _zz_149_;
  wire  _zz_150_;
  wire  _zz_151_;
  wire  _zz_152_;
  wire  _zz_153_;
  wire  _zz_154_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_155_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_156_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_157_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_158_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_159_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_160_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_161_;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress1;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress2;
  wire [31:0] decode_RegFilePlugin_rs1Data;
  wire [31:0] decode_RegFilePlugin_rs2Data;
  reg  writeBack_RegFilePlugin_regFileWrite_valid /* verilator public */ ;
  wire [4:0] writeBack_RegFilePlugin_regFileWrite_payload_address /* verilator public */ ;
  wire [31:0] writeBack_RegFilePlugin_regFileWrite_payload_data /* verilator public */ ;
  reg  _zz_162_;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] _zz_163_;
  reg [31:0] _zz_164_;
  wire  _zz_165_;
  reg [19:0] _zz_166_;
  wire  _zz_167_;
  reg [19:0] _zz_168_;
  reg [31:0] _zz_169_;
  reg [31:0] execute_SrcPlugin_addSub;
  wire  execute_SrcPlugin_less;
  wire [4:0] execute_FullBarrelShifterPlugin_amplitude;
  reg [31:0] _zz_170_;
  wire [31:0] execute_FullBarrelShifterPlugin_reversed;
  reg [31:0] _zz_171_;
  reg  _zz_172_;
  reg  _zz_173_;
  wire  _zz_174_;
  reg  _zz_175_;
  reg [4:0] _zz_176_;
  reg [31:0] _zz_177_;
  wire  _zz_178_;
  wire  _zz_179_;
  wire  _zz_180_;
  wire  _zz_181_;
  wire  _zz_182_;
  wire  _zz_183_;
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
  wire [31:0] _zz_184_;
  wire [32:0] _zz_185_;
  wire [32:0] _zz_186_;
  wire [31:0] _zz_187_;
  wire  _zz_188_;
  wire  _zz_189_;
  reg [32:0] _zz_190_;
  reg [1:0] _zz_191_;
  wire [1:0] CsrPlugin_misa_base;
  wire [25:0] CsrPlugin_misa_extensions;
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
  wire  _zz_192_;
  wire  _zz_193_;
  wire  _zz_194_;
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
  wire [1:0] _zz_195_;
  wire  _zz_196_;
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
  reg  DebugPlugin_isPipBusy;
  reg  DebugPlugin_godmode;
  reg  DebugPlugin_haltedByBreak;
  reg [31:0] DebugPlugin_busReadDataReg;
  reg  _zz_197_;
  reg  DebugPlugin_resetIt_regNext;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_198_;
  reg  _zz_199_;
  reg  _zz_200_;
  wire [31:0] execute_BranchPlugin_branch_src1;
  wire  _zz_201_;
  reg [10:0] _zz_202_;
  wire  _zz_203_;
  reg [19:0] _zz_204_;
  wire  _zz_205_;
  reg [18:0] _zz_206_;
  reg [31:0] _zz_207_;
  wire [31:0] execute_BranchPlugin_branch_src2;
  wire [31:0] execute_BranchPlugin_branchAdder;
  wire  memory_BranchPlugin_predictionMissmatch;
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
  wire  _zz_208_;
  wire  _zz_209_;
  wire [1:0] _zz_210_;
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
  wire  _zz_211_;
  wire  _zz_212_;
  wire [1:0] _zz_213_;
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
  reg [31:0] decode_to_execute_SRC1;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg [31:0] execute_to_memory_FORMAL_PC_NEXT;
  reg [31:0] memory_to_writeBack_FORMAL_PC_NEXT;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg [31:0] execute_to_memory_INSTRUCTION;
  reg [31:0] memory_to_writeBack_INSTRUCTION;
  reg [31:0] decode_to_execute_RS2;
  reg [31:0] execute_to_memory_MUL_LL;
  reg [31:0] decode_to_execute_SRC2;
  reg `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg [31:0] decode_to_execute_RS1;
  reg  decode_to_execute_IS_SFENCE_VMA;
  reg `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg  decode_to_execute_IS_RS1_SIGNED;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg  execute_to_memory_MEMORY_ENABLE;
  reg  memory_to_writeBack_MEMORY_ENABLE;
  reg  decode_to_execute_MEMORY_LRSC;
  reg [31:0] execute_to_memory_BRANCH_CALC;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg [31:0] decode_to_execute_PC;
  reg [31:0] execute_to_memory_PC;
  reg [31:0] memory_to_writeBack_PC;
  reg  execute_to_memory_IS_DBUS_SHARING;
  reg  memory_to_writeBack_IS_DBUS_SHARING;
  reg  decode_to_execute_IS_RS2_SIGNED;
  reg  decode_to_execute_IS_DIV;
  reg  execute_to_memory_IS_DIV;
  reg [51:0] memory_to_writeBack_MUL_LOW;
  reg  execute_to_memory_TARGET_MISSMATCH2;
  reg  decode_to_execute_IS_MUL;
  reg  execute_to_memory_IS_MUL;
  reg  memory_to_writeBack_IS_MUL;
  reg  decode_to_execute_SRC2_FORCE_ZERO;
  reg [31:0] execute_to_memory_NEXT_PC2;
  reg [33:0] execute_to_memory_MUL_HH;
  reg [33:0] memory_to_writeBack_MUL_HH;
  reg [31:0] execute_to_memory_SHIFT_RIGHT;
  reg [33:0] execute_to_memory_MUL_LH;
  reg  decode_to_execute_MEMORY_MANAGMENT;
  reg  execute_to_memory_BRANCH_DO;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg  execute_to_memory_REGFILE_WRITE_VALID;
  reg  memory_to_writeBack_REGFILE_WRITE_VALID;
  reg  decode_to_execute_PREDICTION_CONTEXT_hazard;
  reg  decode_to_execute_PREDICTION_CONTEXT_hit;
  reg [19:0] decode_to_execute_PREDICTION_CONTEXT_line_source;
  reg [1:0] decode_to_execute_PREDICTION_CONTEXT_line_branchWish;
  reg [31:0] decode_to_execute_PREDICTION_CONTEXT_line_target;
  reg  execute_to_memory_PREDICTION_CONTEXT_hazard;
  reg  execute_to_memory_PREDICTION_CONTEXT_hit;
  reg [19:0] execute_to_memory_PREDICTION_CONTEXT_line_source;
  reg [1:0] execute_to_memory_PREDICTION_CONTEXT_line_branchWish;
  reg [31:0] execute_to_memory_PREDICTION_CONTEXT_line_target;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg [33:0] execute_to_memory_MUL_HL;
  reg  decode_to_execute_MEMORY_AMO;
  reg  decode_to_execute_MEMORY_WR;
  reg  execute_to_memory_MEMORY_WR;
  reg  memory_to_writeBack_MEMORY_WR;
  reg  decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg  execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg  decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg  decode_to_execute_IS_CSR;
  reg `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg  decode_to_execute_DO_EBREAK;
  reg `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg [31:0] execute_to_memory_REGFILE_WRITE_DATA;
  reg [31:0] memory_to_writeBack_REGFILE_WRITE_DATA;
  reg [1:0] execute_to_memory_MEMORY_ADDRESS_LOW;
  reg [1:0] memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg [2:0] _zz_214_;
  `ifndef SYNTHESIS
  reg [71:0] _zz_1__string;
  reg [71:0] _zz_2__string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_3__string;
  reg [71:0] _zz_4__string;
  reg [71:0] _zz_5__string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_6__string;
  reg [63:0] _zz_7__string;
  reg [63:0] _zz_8__string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_9__string;
  reg [31:0] _zz_10__string;
  reg [31:0] _zz_11__string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_12__string;
  reg [39:0] _zz_13__string;
  reg [39:0] _zz_14__string;
  reg [39:0] _zz_15__string;
  reg [39:0] _zz_16__string;
  reg [39:0] _zz_17__string;
  reg [39:0] _zz_18__string;
  reg [39:0] decode_ENV_CTRL_string;
  reg [39:0] _zz_19__string;
  reg [39:0] _zz_20__string;
  reg [39:0] _zz_21__string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_25__string;
  reg [39:0] memory_ENV_CTRL_string;
  reg [39:0] _zz_28__string;
  reg [39:0] execute_ENV_CTRL_string;
  reg [39:0] _zz_29__string;
  reg [39:0] writeBack_ENV_CTRL_string;
  reg [39:0] _zz_32__string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_40__string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_42__string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_48__string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_51__string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_54__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_56__string;
  reg [31:0] _zz_65__string;
  reg [71:0] _zz_67__string;
  reg [63:0] _zz_68__string;
  reg [23:0] _zz_70__string;
  reg [39:0] _zz_76__string;
  reg [39:0] _zz_86__string;
  reg [95:0] _zz_88__string;
  reg [95:0] _zz_155__string;
  reg [39:0] _zz_156__string;
  reg [39:0] _zz_157__string;
  reg [23:0] _zz_158__string;
  reg [63:0] _zz_159__string;
  reg [71:0] _zz_160__string;
  reg [31:0] _zz_161__string;
  reg [47:0] MmuPlugin_shared_state_1__string;
  reg [39:0] decode_to_execute_ENV_CTRL_string;
  reg [39:0] execute_to_memory_ENV_CTRL_string;
  reg [39:0] memory_to_writeBack_ENV_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  `endif

  reg [53:0] IBusCachedPlugin_predictor_history [0:1023];
  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign _zz_268_ = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_269_ = (! memory_MulDivIterativePlugin_div_done);
  assign _zz_270_ = ({decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid} != (2'b00));
  assign _zz_271_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_272_ = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_273_ = writeBack_INSTRUCTION[29 : 28];
  assign _zz_274_ = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign _zz_275_ = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)) == 1'b0);
  assign _zz_276_ = (DebugPlugin_stepIt && IBusCachedPlugin_incomingInstruction);
  assign _zz_277_ = (IBusCachedPlugin_fetchPc_preOutput_valid && IBusCachedPlugin_fetchPc_preOutput_ready);
  assign _zz_278_ = (! memory_arbitration_isStuck);
  assign _zz_279_ = debug_bus_cmd_payload_address[7 : 2];
  assign _zz_280_ = ((MmuPlugin_dBusAccess_rsp_valid && (! MmuPlugin_dBusAccess_rsp_payload_redo)) && (MmuPlugin_shared_dBusRsp_leaf || MmuPlugin_shared_dBusRsp_exception));
  assign _zz_281_ = (MmuPlugin_shared_portId == (1'b1));
  assign _zz_282_ = (MmuPlugin_shared_portId == (1'b0));
  assign _zz_283_ = (_zz_241_ && (! dataCache_1__io_mem_cmd_s2mPipe_ready));
  assign _zz_284_ = (IBusCachedPlugin_mmuBus_cmd_isValid && IBusCachedPlugin_mmuBus_rsp_refilling);
  assign _zz_285_ = (DBusCachedPlugin_mmuBus_cmd_isValid && DBusCachedPlugin_mmuBus_rsp_refilling);
  assign _zz_286_ = (MmuPlugin_ports_0_entryToReplace_value == (2'b00));
  assign _zz_287_ = (MmuPlugin_ports_0_entryToReplace_value == (2'b01));
  assign _zz_288_ = (MmuPlugin_ports_0_entryToReplace_value == (2'b10));
  assign _zz_289_ = (MmuPlugin_ports_0_entryToReplace_value == (2'b11));
  assign _zz_290_ = (MmuPlugin_ports_1_entryToReplace_value == (2'b00));
  assign _zz_291_ = (MmuPlugin_ports_1_entryToReplace_value == (2'b01));
  assign _zz_292_ = (MmuPlugin_ports_1_entryToReplace_value == (2'b10));
  assign _zz_293_ = (MmuPlugin_ports_1_entryToReplace_value == (2'b11));
  assign _zz_294_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_295_ = execute_INSTRUCTION[13 : 12];
  assign _zz_296_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_297_ = execute_INSTRUCTION[13];
  assign _zz_298_ = (_zz_110_ - (4'b0001));
  assign _zz_299_ = {IBusCachedPlugin_fetchPc_inc,(2'b00)};
  assign _zz_300_ = {29'd0, _zz_299_};
  assign _zz_301_ = _zz_126_[9:0];
  assign _zz_302_ = (IBusCachedPlugin_iBusRsp_stages_1_input_payload >>> 12);
  assign _zz_303_ = (IBusCachedPlugin_iBusRsp_stages_1_input_payload >>> 2);
  assign _zz_304_ = _zz_303_[9:0];
  assign _zz_305_ = (memory_PREDICTION_CONTEXT_line_branchWish + _zz_307_);
  assign _zz_306_ = (memory_PREDICTION_CONTEXT_line_branchWish == (2'b10));
  assign _zz_307_ = {1'd0, _zz_306_};
  assign _zz_308_ = (memory_PREDICTION_CONTEXT_line_branchWish == (2'b01));
  assign _zz_309_ = {1'd0, _zz_308_};
  assign _zz_310_ = (memory_PREDICTION_CONTEXT_line_branchWish - _zz_312_);
  assign _zz_311_ = memory_PREDICTION_CONTEXT_line_branchWish[1];
  assign _zz_312_ = {1'd0, _zz_311_};
  assign _zz_313_ = (! memory_PREDICTION_CONTEXT_line_branchWish[1]);
  assign _zz_314_ = {1'd0, _zz_313_};
  assign _zz_315_ = (writeBack_MEMORY_WR ? (3'b111) : (3'b101));
  assign _zz_316_ = (writeBack_MEMORY_WR ? (3'b110) : (3'b100));
  assign _zz_317_ = _zz_148_[0 : 0];
  assign _zz_318_ = _zz_148_[3 : 3];
  assign _zz_319_ = _zz_148_[6 : 6];
  assign _zz_320_ = _zz_148_[7 : 7];
  assign _zz_321_ = _zz_148_[8 : 8];
  assign _zz_322_ = _zz_148_[9 : 9];
  assign _zz_323_ = _zz_148_[10 : 10];
  assign _zz_324_ = _zz_148_[11 : 11];
  assign _zz_325_ = _zz_148_[12 : 12];
  assign _zz_326_ = _zz_148_[14 : 14];
  assign _zz_327_ = _zz_148_[15 : 15];
  assign _zz_328_ = _zz_148_[18 : 18];
  assign _zz_329_ = _zz_148_[19 : 19];
  assign _zz_330_ = _zz_148_[20 : 20];
  assign _zz_331_ = _zz_148_[21 : 21];
  assign _zz_332_ = _zz_148_[22 : 22];
  assign _zz_333_ = _zz_148_[25 : 25];
  assign _zz_334_ = _zz_148_[30 : 30];
  assign _zz_335_ = _zz_148_[33 : 33];
  assign _zz_336_ = _zz_148_[34 : 34];
  assign _zz_337_ = _zz_148_[35 : 35];
  assign _zz_338_ = execute_SRC_LESS;
  assign _zz_339_ = (3'b100);
  assign _zz_340_ = decode_INSTRUCTION[19 : 15];
  assign _zz_341_ = decode_INSTRUCTION[31 : 20];
  assign _zz_342_ = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_343_ = ($signed(_zz_344_) + $signed(_zz_347_));
  assign _zz_344_ = ($signed(_zz_345_) + $signed(_zz_346_));
  assign _zz_345_ = execute_SRC1;
  assign _zz_346_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_347_ = (execute_SRC_USE_SUB_LESS ? _zz_348_ : _zz_349_);
  assign _zz_348_ = (32'b00000000000000000000000000000001);
  assign _zz_349_ = (32'b00000000000000000000000000000000);
  assign _zz_350_ = ($signed(_zz_352_) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_351_ = _zz_350_[31 : 0];
  assign _zz_352_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_353_ = ($signed(_zz_354_) + $signed(_zz_359_));
  assign _zz_354_ = ($signed(_zz_355_) + $signed(_zz_357_));
  assign _zz_355_ = (52'b0000000000000000000000000000000000000000000000000000);
  assign _zz_356_ = {1'b0,memory_MUL_LL};
  assign _zz_357_ = {{19{_zz_356_[32]}}, _zz_356_};
  assign _zz_358_ = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_359_ = {{2{_zz_358_[49]}}, _zz_358_};
  assign _zz_360_ = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_361_ = {{2{_zz_360_[49]}}, _zz_360_};
  assign _zz_362_ = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_363_ = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_364_ = writeBack_MUL_LOW[31 : 0];
  assign _zz_365_ = writeBack_MulPlugin_result[63 : 32];
  assign _zz_366_ = memory_MulDivIterativePlugin_div_counter_willIncrement;
  assign _zz_367_ = {5'd0, _zz_366_};
  assign _zz_368_ = {1'd0, memory_MulDivIterativePlugin_rs2};
  assign _zz_369_ = {_zz_184_,(! _zz_186_[32])};
  assign _zz_370_ = _zz_186_[31:0];
  assign _zz_371_ = _zz_185_[31:0];
  assign _zz_372_ = _zz_373_;
  assign _zz_373_ = _zz_374_;
  assign _zz_374_ = ({1'b0,(memory_MulDivIterativePlugin_div_needRevert ? (~ _zz_187_) : _zz_187_)} + _zz_376_);
  assign _zz_375_ = memory_MulDivIterativePlugin_div_needRevert;
  assign _zz_376_ = {32'd0, _zz_375_};
  assign _zz_377_ = _zz_189_;
  assign _zz_378_ = {32'd0, _zz_377_};
  assign _zz_379_ = _zz_188_;
  assign _zz_380_ = {31'd0, _zz_379_};
  assign _zz_381_ = (_zz_195_ & (~ _zz_382_));
  assign _zz_382_ = (_zz_195_ - (2'b01));
  assign _zz_383_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_384_ = execute_INSTRUCTION[31 : 20];
  assign _zz_385_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_386_ = MmuPlugin_ports_0_entryToReplace_willIncrement;
  assign _zz_387_ = {1'd0, _zz_386_};
  assign _zz_388_ = MmuPlugin_ports_1_entryToReplace_willIncrement;
  assign _zz_389_ = {1'd0, _zz_388_};
  assign _zz_390_ = MmuPlugin_dBusAccess_rsp_payload_data[0 : 0];
  assign _zz_391_ = MmuPlugin_dBusAccess_rsp_payload_data[1 : 1];
  assign _zz_392_ = MmuPlugin_dBusAccess_rsp_payload_data[2 : 2];
  assign _zz_393_ = MmuPlugin_dBusAccess_rsp_payload_data[3 : 3];
  assign _zz_394_ = MmuPlugin_dBusAccess_rsp_payload_data[4 : 4];
  assign _zz_395_ = MmuPlugin_dBusAccess_rsp_payload_data[5 : 5];
  assign _zz_396_ = MmuPlugin_dBusAccess_rsp_payload_data[6 : 6];
  assign _zz_397_ = MmuPlugin_dBusAccess_rsp_payload_data[7 : 7];
  assign _zz_398_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_399_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_400_ = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_401_ = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_402_ = execute_CsrPlugin_writeData[19 : 19];
  assign _zz_403_ = execute_CsrPlugin_writeData[18 : 18];
  assign _zz_404_ = execute_CsrPlugin_writeData[17 : 17];
  assign _zz_405_ = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_406_ = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_407_ = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_408_ = execute_CsrPlugin_writeData[31 : 31];
  assign _zz_409_ = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_410_ = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_411_ = execute_CsrPlugin_writeData[19 : 19];
  assign _zz_412_ = execute_CsrPlugin_writeData[18 : 18];
  assign _zz_413_ = execute_CsrPlugin_writeData[17 : 17];
  assign _zz_414_ = execute_CsrPlugin_writeData[8 : 8];
  assign _zz_415_ = execute_CsrPlugin_writeData[2 : 2];
  assign _zz_416_ = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_417_ = execute_CsrPlugin_writeData[13 : 13];
  assign _zz_418_ = execute_CsrPlugin_writeData[4 : 4];
  assign _zz_419_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_420_ = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_421_ = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_422_ = execute_CsrPlugin_writeData[12 : 12];
  assign _zz_423_ = execute_CsrPlugin_writeData[15 : 15];
  assign _zz_424_ = execute_CsrPlugin_writeData[6 : 6];
  assign _zz_425_ = execute_CsrPlugin_writeData[0 : 0];
  assign _zz_426_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_427_ = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_428_ = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_429_ = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_430_ = execute_CsrPlugin_writeData[31 : 31];
  assign _zz_431_ = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_432_ = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_433_ = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_434_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_435_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_436_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_437_ = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_438_ = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_439_ = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_440_ = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_441_ = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_442_ = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_443_ = {IBusCachedPlugin_predictor_historyWrite_payload_data_target,{IBusCachedPlugin_predictor_historyWrite_payload_data_branchWish,IBusCachedPlugin_predictor_historyWrite_payload_data_source}};
  assign _zz_444_ = 1'b1;
  assign _zz_445_ = 1'b1;
  assign _zz_446_ = {_zz_114_,_zz_113_};
  assign _zz_447_ = (32'b00000000000000000100000001001000);
  assign _zz_448_ = ((decode_INSTRUCTION & _zz_458_) == (32'b00001000000000000000000000100000));
  assign _zz_449_ = (_zz_459_ == _zz_460_);
  assign _zz_450_ = (_zz_461_ == _zz_462_);
  assign _zz_451_ = (_zz_463_ == _zz_464_);
  assign _zz_452_ = {_zz_465_,{_zz_466_,_zz_467_}};
  assign _zz_453_ = {_zz_150_,_zz_468_};
  assign _zz_454_ = (2'b00);
  assign _zz_455_ = (_zz_469_ != (1'b0));
  assign _zz_456_ = (_zz_470_ != _zz_471_);
  assign _zz_457_ = {_zz_472_,{_zz_473_,_zz_474_}};
  assign _zz_458_ = (32'b00001000000000000000000000100000);
  assign _zz_459_ = (decode_INSTRUCTION & (32'b00010000000000000000000000100000));
  assign _zz_460_ = (32'b00000000000000000000000000100000);
  assign _zz_461_ = (decode_INSTRUCTION & (32'b00000000000000000000000000101000));
  assign _zz_462_ = (32'b00000000000000000000000000100000);
  assign _zz_463_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000000));
  assign _zz_464_ = (32'b00000000000000000000000001000000);
  assign _zz_465_ = ((decode_INSTRUCTION & _zz_475_) == (32'b00000000000000000100000000100000));
  assign _zz_466_ = (_zz_476_ == _zz_477_);
  assign _zz_467_ = {_zz_153_,_zz_478_};
  assign _zz_468_ = ((decode_INSTRUCTION & _zz_479_) == (32'b00000000000000000000000000000100));
  assign _zz_469_ = ((decode_INSTRUCTION & _zz_480_) == (32'b00000000000000000000000001000000));
  assign _zz_470_ = {_zz_481_,_zz_482_};
  assign _zz_471_ = (2'b00);
  assign _zz_472_ = ({_zz_483_,_zz_484_} != (2'b00));
  assign _zz_473_ = (_zz_485_ != _zz_486_);
  assign _zz_474_ = {_zz_487_,{_zz_488_,_zz_489_}};
  assign _zz_475_ = (32'b00000000000000000100000000100000);
  assign _zz_476_ = (decode_INSTRUCTION & (32'b00000000000000000000000000110000));
  assign _zz_477_ = (32'b00000000000000000000000000010000);
  assign _zz_478_ = ((decode_INSTRUCTION & _zz_490_) == (32'b00000000000000000000000000100000));
  assign _zz_479_ = (32'b00000000000000000000000000011100);
  assign _zz_480_ = (32'b00000000000000000000000001011000);
  assign _zz_481_ = ((decode_INSTRUCTION & _zz_491_) == (32'b00000000000000000001000001010000));
  assign _zz_482_ = ((decode_INSTRUCTION & _zz_492_) == (32'b00000000000000000010000001010000));
  assign _zz_483_ = (_zz_493_ == _zz_494_);
  assign _zz_484_ = (_zz_495_ == _zz_496_);
  assign _zz_485_ = {_zz_497_,{_zz_498_,_zz_499_}};
  assign _zz_486_ = (3'b000);
  assign _zz_487_ = (_zz_500_ != (1'b0));
  assign _zz_488_ = (_zz_501_ != _zz_502_);
  assign _zz_489_ = {_zz_503_,{_zz_504_,_zz_505_}};
  assign _zz_490_ = (32'b00000010000000000000000000101000);
  assign _zz_491_ = (32'b00000000000000000001000001010000);
  assign _zz_492_ = (32'b00000000000000000010000001010000);
  assign _zz_493_ = (decode_INSTRUCTION & (32'b00000000000000000111000000110100));
  assign _zz_494_ = (32'b00000000000000000101000000010000);
  assign _zz_495_ = (decode_INSTRUCTION & (32'b00000010000000000111000001100100));
  assign _zz_496_ = (32'b00000000000000000101000000100000);
  assign _zz_497_ = ((decode_INSTRUCTION & (32'b01000000000000000011000001010100)) == (32'b01000000000000000001000000010000));
  assign _zz_498_ = ((decode_INSTRUCTION & _zz_506_) == (32'b00000000000000000001000000010000));
  assign _zz_499_ = ((decode_INSTRUCTION & _zz_507_) == (32'b00000000000000000001000000010000));
  assign _zz_500_ = ((decode_INSTRUCTION & (32'b00000000000000000100000000010100)) == (32'b00000000000000000100000000010000));
  assign _zz_501_ = ((decode_INSTRUCTION & _zz_508_) == (32'b00000000000000000010000000010000));
  assign _zz_502_ = (1'b0);
  assign _zz_503_ = ({_zz_153_,{_zz_509_,_zz_510_}} != (5'b00000));
  assign _zz_504_ = ({_zz_511_,_zz_512_} != (2'b00));
  assign _zz_505_ = {(_zz_513_ != _zz_514_),{_zz_515_,{_zz_516_,_zz_517_}}};
  assign _zz_506_ = (32'b00000000000000000111000000110100);
  assign _zz_507_ = (32'b00000010000000000111000001010100);
  assign _zz_508_ = (32'b00000000000000000110000000010100);
  assign _zz_509_ = ((decode_INSTRUCTION & _zz_518_) == (32'b00000000000000000010000000010000));
  assign _zz_510_ = {(_zz_519_ == _zz_520_),{_zz_521_,_zz_522_}};
  assign _zz_511_ = _zz_154_;
  assign _zz_512_ = ((decode_INSTRUCTION & _zz_523_) == (32'b00000000000000000000000000100000));
  assign _zz_513_ = {_zz_154_,(_zz_524_ == _zz_525_)};
  assign _zz_514_ = (2'b00);
  assign _zz_515_ = ((_zz_526_ == _zz_527_) != (1'b0));
  assign _zz_516_ = (_zz_528_ != (1'b0));
  assign _zz_517_ = {(_zz_529_ != _zz_530_),{_zz_531_,{_zz_532_,_zz_533_}}};
  assign _zz_518_ = (32'b00000000000000000010000000110000);
  assign _zz_519_ = (decode_INSTRUCTION & (32'b00000000000000000001000000110000));
  assign _zz_520_ = (32'b00000000000000000000000000010000);
  assign _zz_521_ = ((decode_INSTRUCTION & (32'b00000010000000000011000000100000)) == (32'b00000000000000000000000000100000));
  assign _zz_522_ = ((decode_INSTRUCTION & (32'b00000010000000000010000001101000)) == (32'b00000000000000000010000000100000));
  assign _zz_523_ = (32'b00000000000000000000000001110000);
  assign _zz_524_ = (decode_INSTRUCTION & (32'b00000000000000000000000000100000));
  assign _zz_525_ = (32'b00000000000000000000000000000000);
  assign _zz_526_ = (decode_INSTRUCTION & (32'b00000010000000000100000001100100));
  assign _zz_527_ = (32'b00000010000000000100000000100000);
  assign _zz_528_ = ((decode_INSTRUCTION & (32'b00000000000000000101000001001000)) == (32'b00000000000000000001000000001000));
  assign _zz_529_ = ((decode_INSTRUCTION & _zz_534_) == (32'b00000000000100000000000001010000));
  assign _zz_530_ = (1'b0);
  assign _zz_531_ = ((_zz_535_ == _zz_536_) != (1'b0));
  assign _zz_532_ = ({_zz_537_,_zz_538_} != (7'b0000000));
  assign _zz_533_ = {(_zz_539_ != _zz_540_),{_zz_541_,{_zz_542_,_zz_543_}}};
  assign _zz_534_ = (32'b00010000000100000011000001010000);
  assign _zz_535_ = (decode_INSTRUCTION & (32'b00000010000000000011000001010000));
  assign _zz_536_ = (32'b00000010000000000000000001010000);
  assign _zz_537_ = _zz_150_;
  assign _zz_538_ = {(_zz_544_ == _zz_545_),{_zz_546_,{_zz_547_,_zz_548_}}};
  assign _zz_539_ = ((decode_INSTRUCTION & _zz_549_) == (32'b00000000000000000001000000000000));
  assign _zz_540_ = (1'b0);
  assign _zz_541_ = ((_zz_550_ == _zz_551_) != (1'b0));
  assign _zz_542_ = ({_zz_552_,_zz_553_} != (4'b0000));
  assign _zz_543_ = {(_zz_554_ != _zz_555_),{_zz_556_,{_zz_557_,_zz_558_}}};
  assign _zz_544_ = (decode_INSTRUCTION & (32'b00000000000000000001000000010000));
  assign _zz_545_ = (32'b00000000000000000001000000010000);
  assign _zz_546_ = ((decode_INSTRUCTION & _zz_559_) == (32'b00000000000000000010000000010000));
  assign _zz_547_ = (_zz_560_ == _zz_561_);
  assign _zz_548_ = {_zz_562_,{_zz_563_,_zz_564_}};
  assign _zz_549_ = (32'b00000000000000000001000000000000);
  assign _zz_550_ = (decode_INSTRUCTION & (32'b00000000000000000011000000000000));
  assign _zz_551_ = (32'b00000000000000000010000000000000);
  assign _zz_552_ = (_zz_565_ == _zz_566_);
  assign _zz_553_ = {_zz_567_,{_zz_568_,_zz_569_}};
  assign _zz_554_ = (_zz_570_ == _zz_571_);
  assign _zz_555_ = (1'b0);
  assign _zz_556_ = ({_zz_572_,_zz_573_} != (6'b000000));
  assign _zz_557_ = (_zz_574_ != _zz_575_);
  assign _zz_558_ = {_zz_576_,{_zz_577_,_zz_578_}};
  assign _zz_559_ = (32'b00000000000000000010000000010000);
  assign _zz_560_ = (decode_INSTRUCTION & (32'b00000000000000000010000000001000));
  assign _zz_561_ = (32'b00000000000000000010000000001000);
  assign _zz_562_ = ((decode_INSTRUCTION & _zz_579_) == (32'b00000000000000000000000000010000));
  assign _zz_563_ = _zz_153_;
  assign _zz_564_ = (_zz_580_ == _zz_581_);
  assign _zz_565_ = (decode_INSTRUCTION & (32'b00000000000000000000000000110100));
  assign _zz_566_ = (32'b00000000000000000000000000100000);
  assign _zz_567_ = ((decode_INSTRUCTION & _zz_582_) == (32'b00000000000000000000000000100000));
  assign _zz_568_ = (_zz_583_ == _zz_584_);
  assign _zz_569_ = (_zz_585_ == _zz_586_);
  assign _zz_570_ = (decode_INSTRUCTION & (32'b00010000000000000000000000001000));
  assign _zz_571_ = (32'b00000000000000000000000000001000);
  assign _zz_572_ = (_zz_587_ == _zz_588_);
  assign _zz_573_ = {_zz_589_,{_zz_590_,_zz_591_}};
  assign _zz_574_ = {_zz_592_,_zz_593_};
  assign _zz_575_ = (2'b00);
  assign _zz_576_ = (_zz_594_ != (1'b0));
  assign _zz_577_ = (_zz_595_ != _zz_596_);
  assign _zz_578_ = {_zz_597_,{_zz_598_,_zz_599_}};
  assign _zz_579_ = (32'b00000000000000000000000001010000);
  assign _zz_580_ = (decode_INSTRUCTION & (32'b00000000000000000000000000101000));
  assign _zz_581_ = (32'b00000000000000000000000000000000);
  assign _zz_582_ = (32'b00000000000000000000000001100100);
  assign _zz_583_ = (decode_INSTRUCTION & (32'b00001000000000000000000001110000));
  assign _zz_584_ = (32'b00001000000000000000000000100000);
  assign _zz_585_ = (decode_INSTRUCTION & (32'b00010000000000000000000001110000));
  assign _zz_586_ = (32'b00000000000000000000000000100000);
  assign _zz_587_ = (decode_INSTRUCTION & (32'b00000000000000000010000001000000));
  assign _zz_588_ = (32'b00000000000000000010000001000000);
  assign _zz_589_ = ((decode_INSTRUCTION & _zz_600_) == (32'b00000000000000000001000001000000));
  assign _zz_590_ = (_zz_601_ == _zz_602_);
  assign _zz_591_ = {_zz_603_,{_zz_604_,_zz_605_}};
  assign _zz_592_ = ((decode_INSTRUCTION & _zz_606_) == (32'b00000000000000000010000000000000));
  assign _zz_593_ = ((decode_INSTRUCTION & _zz_607_) == (32'b00000000000000000001000000000000));
  assign _zz_594_ = ((decode_INSTRUCTION & _zz_608_) == (32'b00000000000000000000000000100100));
  assign _zz_595_ = _zz_152_;
  assign _zz_596_ = (1'b0);
  assign _zz_597_ = (_zz_152_ != (1'b0));
  assign _zz_598_ = (_zz_609_ != _zz_610_);
  assign _zz_599_ = {_zz_611_,{_zz_612_,_zz_613_}};
  assign _zz_600_ = (32'b00000000000000000001000001000000);
  assign _zz_601_ = (decode_INSTRUCTION & (32'b00000000000000000000000001010000));
  assign _zz_602_ = (32'b00000000000000000000000001000000);
  assign _zz_603_ = ((decode_INSTRUCTION & (32'b00000010000100000000000001000000)) == (32'b00000000000000000000000001000000));
  assign _zz_604_ = ((decode_INSTRUCTION & _zz_614_) == (32'b00000000000000000000000000000000));
  assign _zz_605_ = ((decode_INSTRUCTION & _zz_615_) == (32'b00010000000000000010000000001000));
  assign _zz_606_ = (32'b00000000000000000010000000010000);
  assign _zz_607_ = (32'b00000000000000000101000000000000);
  assign _zz_608_ = (32'b00000000000000000000000001100100);
  assign _zz_609_ = {_zz_151_,(_zz_616_ == _zz_617_)};
  assign _zz_610_ = (2'b00);
  assign _zz_611_ = ({_zz_618_,{_zz_619_,_zz_620_}} != (3'b000));
  assign _zz_612_ = (_zz_621_ != (1'b0));
  assign _zz_613_ = {(_zz_622_ != _zz_623_),{_zz_624_,{_zz_625_,_zz_626_}}};
  assign _zz_614_ = (32'b00000000000000000000000000111000);
  assign _zz_615_ = (32'b00011000000000000010000000001000);
  assign _zz_616_ = (decode_INSTRUCTION & (32'b00000000000000000000000001011000));
  assign _zz_617_ = (32'b00000000000000000000000000000000);
  assign _zz_618_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001000100)) == (32'b00000000000000000000000001000000));
  assign _zz_619_ = ((decode_INSTRUCTION & _zz_627_) == (32'b00000000000000000010000000010000));
  assign _zz_620_ = ((decode_INSTRUCTION & _zz_628_) == (32'b01000000000000000000000000110000));
  assign _zz_621_ = ((decode_INSTRUCTION & (32'b00000010000000000100000001110100)) == (32'b00000010000000000000000000110000));
  assign _zz_622_ = {(_zz_629_ == _zz_630_),(_zz_631_ == _zz_632_)};
  assign _zz_623_ = (2'b00);
  assign _zz_624_ = ((_zz_633_ == _zz_634_) != (1'b0));
  assign _zz_625_ = ({_zz_635_,_zz_636_} != (5'b00000));
  assign _zz_626_ = {(_zz_637_ != _zz_638_),{_zz_639_,_zz_640_}};
  assign _zz_627_ = (32'b00000000000000000010000000010100);
  assign _zz_628_ = (32'b01000000000000000000000000110100);
  assign _zz_629_ = (decode_INSTRUCTION & (32'b00010000000100000011000001010000));
  assign _zz_630_ = (32'b00000000000000000000000001010000);
  assign _zz_631_ = (decode_INSTRUCTION & (32'b00010010001000000011000001010000));
  assign _zz_632_ = (32'b00010000000000000000000001010000);
  assign _zz_633_ = (decode_INSTRUCTION & (32'b00000010000100000011000001010000));
  assign _zz_634_ = (32'b00000000000000000000000001010000);
  assign _zz_635_ = ((decode_INSTRUCTION & _zz_641_) == (32'b00000000000000000000000000000000));
  assign _zz_636_ = {(_zz_642_ == _zz_643_),{_zz_644_,{_zz_645_,_zz_646_}}};
  assign _zz_637_ = {_zz_150_,{_zz_149_,_zz_647_}};
  assign _zz_638_ = (3'b000);
  assign _zz_639_ = ({_zz_149_,_zz_648_} != (2'b00));
  assign _zz_640_ = ((_zz_649_ == _zz_650_) != (1'b0));
  assign _zz_641_ = (32'b00000000000000000000000001000100);
  assign _zz_642_ = (decode_INSTRUCTION & (32'b00000000000000000000000000011000));
  assign _zz_643_ = (32'b00000000000000000000000000000000);
  assign _zz_644_ = ((decode_INSTRUCTION & (32'b00000000000000000110000000000100)) == (32'b00000000000000000010000000000000));
  assign _zz_645_ = ((decode_INSTRUCTION & (32'b00000000000000000101000000000100)) == (32'b00000000000000000001000000000000));
  assign _zz_646_ = _zz_151_;
  assign _zz_647_ = ((decode_INSTRUCTION & (32'b00000000000000000010000000010100)) == (32'b00000000000000000000000000000100));
  assign _zz_648_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001001100)) == (32'b00000000000000000000000000000100));
  assign _zz_649_ = (decode_INSTRUCTION & (32'b00010000000000000000000000001000));
  assign _zz_650_ = (32'b00010000000000000000000000001000);
  assign _zz_651_ = (32'b00000000000000000001000001111111);
  assign _zz_652_ = (decode_INSTRUCTION & (32'b00000000000000000010000001111111));
  assign _zz_653_ = (32'b00000000000000000010000001110011);
  assign _zz_654_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001111111)) == (32'b00000000000000000100000001100011));
  assign _zz_655_ = ((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000010000000010011));
  assign _zz_656_ = {((decode_INSTRUCTION & (32'b00000000000000000110000000111111)) == (32'b00000000000000000000000000100011)),{((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & _zz_657_) == (32'b00000000000000000000000000000011)),{(_zz_658_ == _zz_659_),{_zz_660_,{_zz_661_,_zz_662_}}}}}};
  assign _zz_657_ = (32'b00000000000000000101000001011111);
  assign _zz_658_ = (decode_INSTRUCTION & (32'b00000000000000000111000001111011));
  assign _zz_659_ = (32'b00000000000000000000000001100011);
  assign _zz_660_ = ((decode_INSTRUCTION & (32'b00000000000000000110000001111111)) == (32'b00000000000000000000000000001111));
  assign _zz_661_ = ((decode_INSTRUCTION & (32'b00011000000000000111000001111111)) == (32'b00000000000000000010000000101111));
  assign _zz_662_ = {((decode_INSTRUCTION & (32'b11111100000000000000000001111111)) == (32'b00000000000000000000000000110011)),{((decode_INSTRUCTION & (32'b11101000000000000111000001111111)) == (32'b00001000000000000010000000101111)),{((decode_INSTRUCTION & _zz_663_) == (32'b00000000000000000101000000001111)),{(_zz_664_ == _zz_665_),{_zz_666_,{_zz_667_,_zz_668_}}}}}};
  assign _zz_663_ = (32'b00000001111100000111000001111111);
  assign _zz_664_ = (decode_INSTRUCTION & (32'b10111100000000000111000001111111));
  assign _zz_665_ = (32'b00000000000000000101000000010011);
  assign _zz_666_ = ((decode_INSTRUCTION & (32'b11111100000000000011000001111111)) == (32'b00000000000000000001000000010011));
  assign _zz_667_ = ((decode_INSTRUCTION & (32'b10111110000000000111000001111111)) == (32'b00000000000000000101000000110011));
  assign _zz_668_ = {((decode_INSTRUCTION & (32'b10111110000000000111000001111111)) == (32'b00000000000000000000000000110011)),{((decode_INSTRUCTION & (32'b11111001111100000111000001111111)) == (32'b00010000000000000010000000101111)),{((decode_INSTRUCTION & _zz_669_) == (32'b00010010000000000000000001110011)),{(_zz_670_ == _zz_671_),{_zz_672_,_zz_673_}}}}};
  assign _zz_669_ = (32'b11111110000000000111111111111111);
  assign _zz_670_ = (decode_INSTRUCTION & (32'b11011111111111111111111111111111));
  assign _zz_671_ = (32'b00010000001000000000000001110011);
  assign _zz_672_ = ((decode_INSTRUCTION & (32'b11111111111011111111111111111111)) == (32'b00000000000000000000000001110011));
  assign _zz_673_ = ((decode_INSTRUCTION & (32'b11111111111111111111111111111111)) == (32'b00010000010100000000000001110011));
  always @ (posedge clk) begin
    if(_zz_103_) begin
      IBusCachedPlugin_predictor_history[IBusCachedPlugin_predictor_historyWrite_payload_address] <= _zz_443_;
    end
  end

  always @ (posedge clk) begin
    if(_zz_127_) begin
      _zz_242_ <= IBusCachedPlugin_predictor_history[_zz_301_];
    end
  end

  initial begin
    $readmemb("VexRiscv.v_toplevel_RegFilePlugin_regFile.bin",RegFilePlugin_regFile);
  end
  always @ (posedge clk) begin
    if(_zz_59_) begin
      RegFilePlugin_regFile[writeBack_RegFilePlugin_regFileWrite_payload_address] <= writeBack_RegFilePlugin_regFileWrite_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_444_) begin
      _zz_243_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_445_) begin
      _zz_244_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  InstructionCache IBusCachedPlugin_cache ( 
    .io_flush(_zz_215_),
    .io_cpu_prefetch_isValid(_zz_216_),
    .io_cpu_prefetch_haltIt(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt),
    .io_cpu_prefetch_pc(IBusCachedPlugin_iBusRsp_stages_0_input_payload),
    .io_cpu_fetch_isValid(_zz_217_),
    .io_cpu_fetch_isStuck(_zz_218_),
    .io_cpu_fetch_isRemoved(_zz_219_),
    .io_cpu_fetch_pc(IBusCachedPlugin_iBusRsp_stages_1_input_payload),
    .io_cpu_fetch_data(IBusCachedPlugin_cache_io_cpu_fetch_data),
    .io_cpu_fetch_dataBypassValid(IBusCachedPlugin_s1_tightlyCoupledHit),
    .io_cpu_fetch_dataBypass(_zz_220_),
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
    .io_cpu_fetch_mmuBus_busy(IBusCachedPlugin_mmuBus_busy),
    .io_cpu_fetch_physicalAddress(IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress),
    .io_cpu_fetch_haltIt(IBusCachedPlugin_cache_io_cpu_fetch_haltIt),
    .io_cpu_decode_isValid(_zz_221_),
    .io_cpu_decode_isStuck(_zz_222_),
    .io_cpu_decode_pc(IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload),
    .io_cpu_decode_physicalAddress(IBusCachedPlugin_cache_io_cpu_decode_physicalAddress),
    .io_cpu_decode_data(IBusCachedPlugin_cache_io_cpu_decode_data),
    .io_cpu_decode_cacheMiss(IBusCachedPlugin_cache_io_cpu_decode_cacheMiss),
    .io_cpu_decode_error(IBusCachedPlugin_cache_io_cpu_decode_error),
    .io_cpu_decode_mmuRefilling(IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling),
    .io_cpu_decode_mmuException(IBusCachedPlugin_cache_io_cpu_decode_mmuException),
    .io_cpu_decode_isUser(_zz_223_),
    .io_cpu_fill_valid(_zz_224_),
    .io_cpu_fill_payload(IBusCachedPlugin_cache_io_cpu_decode_physicalAddress),
    .io_mem_cmd_valid(IBusCachedPlugin_cache_io_mem_cmd_valid),
    .io_mem_cmd_ready(iBus_cmd_ready),
    .io_mem_cmd_payload_address(IBusCachedPlugin_cache_io_mem_cmd_payload_address),
    .io_mem_cmd_payload_size(IBusCachedPlugin_cache_io_mem_cmd_payload_size),
    .io_mem_rsp_valid(iBus_rsp_valid),
    .io_mem_rsp_payload_data(iBus_rsp_payload_data),
    .io_mem_rsp_payload_error(iBus_rsp_payload_error),
    ._zz_36_(_zz_214_),
    ._zz_37_(IBusCachedPlugin_injectionPort_payload),
    .clk(clk),
    .reset(reset) 
  );
  DataCache dataCache_1_ ( 
    .io_cpu_execute_isValid(_zz_225_),
    .io_cpu_execute_address(_zz_226_),
    .io_cpu_execute_args_wr(_zz_227_),
    .io_cpu_execute_args_data(_zz_228_),
    .io_cpu_execute_args_size(_zz_229_),
    .io_cpu_execute_args_isLrsc(_zz_230_),
    .io_cpu_execute_args_isAmo(_zz_231_),
    .io_cpu_execute_args_amoCtrl_swap(_zz_232_),
    .io_cpu_execute_args_amoCtrl_alu(_zz_233_),
    .io_cpu_memory_isValid(_zz_234_),
    .io_cpu_memory_isStuck(memory_arbitration_isStuck),
    .io_cpu_memory_isRemoved(memory_arbitration_removeIt),
    .io_cpu_memory_isWrite(dataCache_1__io_cpu_memory_isWrite),
    .io_cpu_memory_address(_zz_235_),
    .io_cpu_memory_mmuBus_cmd_isValid(dataCache_1__io_cpu_memory_mmuBus_cmd_isValid),
    .io_cpu_memory_mmuBus_cmd_virtualAddress(dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress),
    .io_cpu_memory_mmuBus_cmd_bypassTranslation(dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation),
    .io_cpu_memory_mmuBus_rsp_physicalAddress(DBusCachedPlugin_mmuBus_rsp_physicalAddress),
    .io_cpu_memory_mmuBus_rsp_isIoAccess(_zz_236_),
    .io_cpu_memory_mmuBus_rsp_allowRead(DBusCachedPlugin_mmuBus_rsp_allowRead),
    .io_cpu_memory_mmuBus_rsp_allowWrite(DBusCachedPlugin_mmuBus_rsp_allowWrite),
    .io_cpu_memory_mmuBus_rsp_allowExecute(DBusCachedPlugin_mmuBus_rsp_allowExecute),
    .io_cpu_memory_mmuBus_rsp_exception(DBusCachedPlugin_mmuBus_rsp_exception),
    .io_cpu_memory_mmuBus_rsp_refilling(DBusCachedPlugin_mmuBus_rsp_refilling),
    .io_cpu_memory_mmuBus_end(dataCache_1__io_cpu_memory_mmuBus_end),
    .io_cpu_memory_mmuBus_busy(DBusCachedPlugin_mmuBus_busy),
    .io_cpu_writeBack_isValid(_zz_237_),
    .io_cpu_writeBack_isStuck(writeBack_arbitration_isStuck),
    .io_cpu_writeBack_isUser(_zz_238_),
    .io_cpu_writeBack_haltIt(dataCache_1__io_cpu_writeBack_haltIt),
    .io_cpu_writeBack_isWrite(dataCache_1__io_cpu_writeBack_isWrite),
    .io_cpu_writeBack_data(dataCache_1__io_cpu_writeBack_data),
    .io_cpu_writeBack_address(_zz_239_),
    .io_cpu_writeBack_mmuException(dataCache_1__io_cpu_writeBack_mmuException),
    .io_cpu_writeBack_unalignedAccess(dataCache_1__io_cpu_writeBack_unalignedAccess),
    .io_cpu_writeBack_accessError(dataCache_1__io_cpu_writeBack_accessError),
    .io_cpu_writeBack_clearLrsc(contextSwitching),
    .io_cpu_redo(dataCache_1__io_cpu_redo),
    .io_cpu_flush_valid(_zz_240_),
    .io_cpu_flush_ready(dataCache_1__io_cpu_flush_ready),
    .io_mem_cmd_valid(dataCache_1__io_mem_cmd_valid),
    .io_mem_cmd_ready(_zz_241_),
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
    case(_zz_446_)
      2'b00 : begin
        _zz_245_ = DBusCachedPlugin_redoBranch_payload;
      end
      2'b01 : begin
        _zz_245_ = CsrPlugin_jumpInterface_payload;
      end
      2'b10 : begin
        _zz_245_ = BranchPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_245_ = IBusCachedPlugin_redoBranch_payload;
      end
    endcase
  end

  always @(*) begin
    case(_zz_210_)
      2'b00 : begin
        _zz_246_ = MmuPlugin_ports_0_cache_0_valid;
        _zz_247_ = MmuPlugin_ports_0_cache_0_exception;
        _zz_248_ = MmuPlugin_ports_0_cache_0_superPage;
        _zz_249_ = MmuPlugin_ports_0_cache_0_virtualAddress_0;
        _zz_250_ = MmuPlugin_ports_0_cache_0_virtualAddress_1;
        _zz_251_ = MmuPlugin_ports_0_cache_0_physicalAddress_0;
        _zz_252_ = MmuPlugin_ports_0_cache_0_physicalAddress_1;
        _zz_253_ = MmuPlugin_ports_0_cache_0_allowRead;
        _zz_254_ = MmuPlugin_ports_0_cache_0_allowWrite;
        _zz_255_ = MmuPlugin_ports_0_cache_0_allowExecute;
        _zz_256_ = MmuPlugin_ports_0_cache_0_allowUser;
      end
      2'b01 : begin
        _zz_246_ = MmuPlugin_ports_0_cache_1_valid;
        _zz_247_ = MmuPlugin_ports_0_cache_1_exception;
        _zz_248_ = MmuPlugin_ports_0_cache_1_superPage;
        _zz_249_ = MmuPlugin_ports_0_cache_1_virtualAddress_0;
        _zz_250_ = MmuPlugin_ports_0_cache_1_virtualAddress_1;
        _zz_251_ = MmuPlugin_ports_0_cache_1_physicalAddress_0;
        _zz_252_ = MmuPlugin_ports_0_cache_1_physicalAddress_1;
        _zz_253_ = MmuPlugin_ports_0_cache_1_allowRead;
        _zz_254_ = MmuPlugin_ports_0_cache_1_allowWrite;
        _zz_255_ = MmuPlugin_ports_0_cache_1_allowExecute;
        _zz_256_ = MmuPlugin_ports_0_cache_1_allowUser;
      end
      2'b10 : begin
        _zz_246_ = MmuPlugin_ports_0_cache_2_valid;
        _zz_247_ = MmuPlugin_ports_0_cache_2_exception;
        _zz_248_ = MmuPlugin_ports_0_cache_2_superPage;
        _zz_249_ = MmuPlugin_ports_0_cache_2_virtualAddress_0;
        _zz_250_ = MmuPlugin_ports_0_cache_2_virtualAddress_1;
        _zz_251_ = MmuPlugin_ports_0_cache_2_physicalAddress_0;
        _zz_252_ = MmuPlugin_ports_0_cache_2_physicalAddress_1;
        _zz_253_ = MmuPlugin_ports_0_cache_2_allowRead;
        _zz_254_ = MmuPlugin_ports_0_cache_2_allowWrite;
        _zz_255_ = MmuPlugin_ports_0_cache_2_allowExecute;
        _zz_256_ = MmuPlugin_ports_0_cache_2_allowUser;
      end
      default : begin
        _zz_246_ = MmuPlugin_ports_0_cache_3_valid;
        _zz_247_ = MmuPlugin_ports_0_cache_3_exception;
        _zz_248_ = MmuPlugin_ports_0_cache_3_superPage;
        _zz_249_ = MmuPlugin_ports_0_cache_3_virtualAddress_0;
        _zz_250_ = MmuPlugin_ports_0_cache_3_virtualAddress_1;
        _zz_251_ = MmuPlugin_ports_0_cache_3_physicalAddress_0;
        _zz_252_ = MmuPlugin_ports_0_cache_3_physicalAddress_1;
        _zz_253_ = MmuPlugin_ports_0_cache_3_allowRead;
        _zz_254_ = MmuPlugin_ports_0_cache_3_allowWrite;
        _zz_255_ = MmuPlugin_ports_0_cache_3_allowExecute;
        _zz_256_ = MmuPlugin_ports_0_cache_3_allowUser;
      end
    endcase
  end

  always @(*) begin
    case(_zz_213_)
      2'b00 : begin
        _zz_257_ = MmuPlugin_ports_1_cache_0_valid;
        _zz_258_ = MmuPlugin_ports_1_cache_0_exception;
        _zz_259_ = MmuPlugin_ports_1_cache_0_superPage;
        _zz_260_ = MmuPlugin_ports_1_cache_0_virtualAddress_0;
        _zz_261_ = MmuPlugin_ports_1_cache_0_virtualAddress_1;
        _zz_262_ = MmuPlugin_ports_1_cache_0_physicalAddress_0;
        _zz_263_ = MmuPlugin_ports_1_cache_0_physicalAddress_1;
        _zz_264_ = MmuPlugin_ports_1_cache_0_allowRead;
        _zz_265_ = MmuPlugin_ports_1_cache_0_allowWrite;
        _zz_266_ = MmuPlugin_ports_1_cache_0_allowExecute;
        _zz_267_ = MmuPlugin_ports_1_cache_0_allowUser;
      end
      2'b01 : begin
        _zz_257_ = MmuPlugin_ports_1_cache_1_valid;
        _zz_258_ = MmuPlugin_ports_1_cache_1_exception;
        _zz_259_ = MmuPlugin_ports_1_cache_1_superPage;
        _zz_260_ = MmuPlugin_ports_1_cache_1_virtualAddress_0;
        _zz_261_ = MmuPlugin_ports_1_cache_1_virtualAddress_1;
        _zz_262_ = MmuPlugin_ports_1_cache_1_physicalAddress_0;
        _zz_263_ = MmuPlugin_ports_1_cache_1_physicalAddress_1;
        _zz_264_ = MmuPlugin_ports_1_cache_1_allowRead;
        _zz_265_ = MmuPlugin_ports_1_cache_1_allowWrite;
        _zz_266_ = MmuPlugin_ports_1_cache_1_allowExecute;
        _zz_267_ = MmuPlugin_ports_1_cache_1_allowUser;
      end
      2'b10 : begin
        _zz_257_ = MmuPlugin_ports_1_cache_2_valid;
        _zz_258_ = MmuPlugin_ports_1_cache_2_exception;
        _zz_259_ = MmuPlugin_ports_1_cache_2_superPage;
        _zz_260_ = MmuPlugin_ports_1_cache_2_virtualAddress_0;
        _zz_261_ = MmuPlugin_ports_1_cache_2_virtualAddress_1;
        _zz_262_ = MmuPlugin_ports_1_cache_2_physicalAddress_0;
        _zz_263_ = MmuPlugin_ports_1_cache_2_physicalAddress_1;
        _zz_264_ = MmuPlugin_ports_1_cache_2_allowRead;
        _zz_265_ = MmuPlugin_ports_1_cache_2_allowWrite;
        _zz_266_ = MmuPlugin_ports_1_cache_2_allowExecute;
        _zz_267_ = MmuPlugin_ports_1_cache_2_allowUser;
      end
      default : begin
        _zz_257_ = MmuPlugin_ports_1_cache_3_valid;
        _zz_258_ = MmuPlugin_ports_1_cache_3_exception;
        _zz_259_ = MmuPlugin_ports_1_cache_3_superPage;
        _zz_260_ = MmuPlugin_ports_1_cache_3_virtualAddress_0;
        _zz_261_ = MmuPlugin_ports_1_cache_3_virtualAddress_1;
        _zz_262_ = MmuPlugin_ports_1_cache_3_physicalAddress_0;
        _zz_263_ = MmuPlugin_ports_1_cache_3_physicalAddress_1;
        _zz_264_ = MmuPlugin_ports_1_cache_3_allowRead;
        _zz_265_ = MmuPlugin_ports_1_cache_3_allowWrite;
        _zz_266_ = MmuPlugin_ports_1_cache_3_allowExecute;
        _zz_267_ = MmuPlugin_ports_1_cache_3_allowUser;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_1_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_1__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_1__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_1__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_1__string = "SRA_1    ";
      default : _zz_1__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_2_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_2__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_2__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_2__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_2__string = "SRA_1    ";
      default : _zz_2__string = "?????????";
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
    case(_zz_3_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_3__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_3__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_3__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_3__string = "SRA_1    ";
      default : _zz_3__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_4_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_4__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_4__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_4__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_4__string = "SRA_1    ";
      default : _zz_4__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_5_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_5__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_5__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_5__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_5__string = "SRA_1    ";
      default : _zz_5__string = "?????????";
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
    case(_zz_6_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_6__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_6__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_6__string = "BITWISE ";
      default : _zz_6__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_7_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_7__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_7__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_7__string = "BITWISE ";
      default : _zz_7__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_8_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_8__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_8__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_8__string = "BITWISE ";
      default : _zz_8__string = "????????";
    endcase
  end
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
    case(_zz_9_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_9__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_9__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_9__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_9__string = "JALR";
      default : _zz_9__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_10_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_10__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_10__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_10__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_10__string = "JALR";
      default : _zz_10__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_11_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_11__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_11__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_11__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_11__string = "JALR";
      default : _zz_11__string = "????";
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
    case(_zz_12_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_12__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_12__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_12__string = "AND_1";
      default : _zz_12__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_13_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_13__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_13__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_13__string = "AND_1";
      default : _zz_13__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_14_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_14__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_14__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_14__string = "AND_1";
      default : _zz_14__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_15_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_15__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_15__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_15__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_15__string = "ECALL";
      default : _zz_15__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_16_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_16__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_16__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_16__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_16__string = "ECALL";
      default : _zz_16__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_17_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_17__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_17__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_17__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_17__string = "ECALL";
      default : _zz_17__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_18_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_18__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_18__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_18__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_18__string = "ECALL";
      default : _zz_18__string = "?????";
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
    case(_zz_19_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_19__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_19__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_19__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_19__string = "ECALL";
      default : _zz_19__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_20_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_20__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_20__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_20__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_20__string = "ECALL";
      default : _zz_20__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_21_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_21__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_21__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_21__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_21__string = "ECALL";
      default : _zz_21__string = "?????";
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
    case(_zz_25_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_25__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_25__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_25__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_25__string = "JALR";
      default : _zz_25__string = "????";
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
    case(_zz_28_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_28__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_28__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_28__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_28__string = "ECALL";
      default : _zz_28__string = "?????";
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
    case(_zz_29_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_29__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_29__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_29__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_29__string = "ECALL";
      default : _zz_29__string = "?????";
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
    case(_zz_32_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_32__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_32__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_32__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_32__string = "ECALL";
      default : _zz_32__string = "?????";
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
    case(_zz_40_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_40__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_40__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_40__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_40__string = "SRA_1    ";
      default : _zz_40__string = "?????????";
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
    case(_zz_42_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_42__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_42__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_42__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_42__string = "SRA_1    ";
      default : _zz_42__string = "?????????";
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
    case(_zz_48_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_48__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_48__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_48__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_48__string = "PC ";
      default : _zz_48__string = "???";
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
    case(_zz_51_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_51__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_51__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_51__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_51__string = "URS1        ";
      default : _zz_51__string = "????????????";
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
    case(_zz_54_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_54__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_54__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_54__string = "BITWISE ";
      default : _zz_54__string = "????????";
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
    case(_zz_56_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_56__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_56__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_56__string = "AND_1";
      default : _zz_56__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_65_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_65__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_65__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_65__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_65__string = "JALR";
      default : _zz_65__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_67_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_67__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_67__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_67__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_67__string = "SRA_1    ";
      default : _zz_67__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_68_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_68__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_68__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_68__string = "BITWISE ";
      default : _zz_68__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_70_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_70__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_70__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_70__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_70__string = "PC ";
      default : _zz_70__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_76_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_76__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_76__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_76__string = "AND_1";
      default : _zz_76__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_86_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_86__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_86__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_86__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_86__string = "ECALL";
      default : _zz_86__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_88_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_88__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_88__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_88__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_88__string = "URS1        ";
      default : _zz_88__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_155_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_155__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_155__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_155__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_155__string = "URS1        ";
      default : _zz_155__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_156_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_156__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_156__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_156__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_156__string = "ECALL";
      default : _zz_156__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_157_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_157__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_157__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_157__string = "AND_1";
      default : _zz_157__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_158_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_158__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_158__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_158__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_158__string = "PC ";
      default : _zz_158__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_159_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_159__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_159__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_159__string = "BITWISE ";
      default : _zz_159__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_160_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_160__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_160__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_160__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_160__string = "SRA_1    ";
      default : _zz_160__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_161_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_161__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_161__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_161__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_161__string = "JALR";
      default : _zz_161__string = "????";
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
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
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
  `endif

  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_93_;
  assign execute_REGFILE_WRITE_DATA = _zz_55_;
  assign decode_CSR_WRITE_OPCODE = _zz_31_;
  assign _zz_1_ = _zz_2_;
  assign decode_SHIFT_CTRL = _zz_3_;
  assign _zz_4_ = _zz_5_;
  assign decode_DO_EBREAK = _zz_27_;
  assign decode_ALU_CTRL = _zz_6_;
  assign _zz_7_ = _zz_8_;
  assign decode_IS_CSR = _zz_66_;
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_69_;
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_64_;
  assign memory_MEMORY_WR = execute_to_memory_MEMORY_WR;
  assign decode_MEMORY_WR = _zz_63_;
  assign decode_MEMORY_AMO = _zz_78_;
  assign execute_MUL_HL = _zz_35_;
  assign decode_SRC_LESS_UNSIGNED = _zz_79_;
  assign decode_BRANCH_CTRL = _zz_9_;
  assign _zz_10_ = _zz_11_;
  assign execute_PREDICTION_CONTEXT_hazard = decode_to_execute_PREDICTION_CONTEXT_hazard;
  assign execute_PREDICTION_CONTEXT_hit = decode_to_execute_PREDICTION_CONTEXT_hit;
  assign execute_PREDICTION_CONTEXT_line_source = decode_to_execute_PREDICTION_CONTEXT_line_source;
  assign execute_PREDICTION_CONTEXT_line_branchWish = decode_to_execute_PREDICTION_CONTEXT_line_branchWish;
  assign execute_PREDICTION_CONTEXT_line_target = decode_to_execute_PREDICTION_CONTEXT_line_target;
  assign decode_PREDICTION_CONTEXT_hazard = _zz_98_;
  assign decode_PREDICTION_CONTEXT_hit = _zz_99_;
  assign decode_PREDICTION_CONTEXT_line_source = _zz_100_;
  assign decode_PREDICTION_CONTEXT_line_branchWish = _zz_101_;
  assign decode_PREDICTION_CONTEXT_line_target = _zz_102_;
  assign execute_BRANCH_DO = _zz_26_;
  assign decode_MEMORY_MANAGMENT = _zz_62_;
  assign execute_MUL_LH = _zz_36_;
  assign execute_SHIFT_RIGHT = _zz_41_;
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = _zz_34_;
  assign execute_NEXT_PC2 = _zz_23_;
  assign decode_SRC2_FORCE_ZERO = _zz_53_;
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_85_;
  assign execute_TARGET_MISSMATCH2 = _zz_22_;
  assign memory_MUL_LOW = _zz_33_;
  assign decode_IS_DIV = _zz_71_;
  assign decode_IS_RS2_SIGNED = _zz_81_;
  assign execute_IS_DBUS_SHARING = _zz_91_;
  assign decode_CSR_READ_OPCODE = _zz_30_;
  assign decode_MEMORY_LRSC = _zz_89_;
  assign decode_IS_RS1_SIGNED = _zz_82_;
  assign decode_ALU_BITWISE_CTRL = _zz_12_;
  assign _zz_13_ = _zz_14_;
  assign decode_IS_SFENCE_VMA = _zz_74_;
  assign _zz_15_ = _zz_16_;
  assign _zz_17_ = _zz_18_;
  assign decode_ENV_CTRL = _zz_19_;
  assign _zz_20_ = _zz_21_;
  assign decode_SRC2 = _zz_49_;
  assign execute_MUL_LL = _zz_37_;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = _zz_106_;
  assign decode_SRC1 = _zz_52_;
  assign execute_IS_SFENCE_VMA = decode_to_execute_IS_SFENCE_VMA;
  assign memory_NEXT_PC2 = execute_to_memory_NEXT_PC2;
  assign memory_PC = execute_to_memory_PC;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_TARGET_MISSMATCH2 = execute_to_memory_TARGET_MISSMATCH2;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_BRANCH_CALC = _zz_24_;
  assign execute_BRANCH_CTRL = _zz_25_;
  assign execute_PC = decode_to_execute_PC;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_73_;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_28_;
  assign execute_ENV_CTRL = _zz_29_;
  assign writeBack_ENV_CTRL = _zz_32_;
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
  assign decode_RS2_USE = _zz_77_;
  assign decode_RS1_USE = _zz_87_;
  always @ (*) begin
    _zz_38_ = execute_REGFILE_WRITE_DATA;
    execute_arbitration_haltItself = 1'b0;
    if((_zz_240_ && (! dataCache_1__io_cpu_flush_ready)))begin
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
      _zz_38_ = execute_CsrPlugin_readData;
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(DBusCachedPlugin_forceDatapath)begin
      _zz_38_ = MmuPlugin_dBusAccess_cmd_payload_address;
    end
  end

  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = _zz_60_;
    decode_RS1 = _zz_61_;
    if(_zz_175_)begin
      if((_zz_176_ == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_177_;
      end
      if((_zz_176_ == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_177_;
      end
    end
    if((writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID))begin
      if(1'b1)begin
        if(_zz_178_)begin
          decode_RS1 = _zz_92_;
        end
        if(_zz_179_)begin
          decode_RS2 = _zz_92_;
        end
      end
    end
    if((memory_arbitration_isValid && memory_REGFILE_WRITE_VALID))begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_180_)begin
          decode_RS1 = _zz_39_;
        end
        if(_zz_181_)begin
          decode_RS2 = _zz_39_;
        end
      end
    end
    if((execute_arbitration_isValid && execute_REGFILE_WRITE_VALID))begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_182_)begin
          decode_RS1 = _zz_38_;
        end
        if(_zz_183_)begin
          decode_RS2 = _zz_38_;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @ (*) begin
    _zz_39_ = memory_REGFILE_WRITE_DATA;
    memory_arbitration_haltItself = 1'b0;
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_39_ = _zz_171_;
      end
      `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
        _zz_39_ = memory_SHIFT_RIGHT;
      end
      default : begin
      end
    endcase
    memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b0;
    if(_zz_268_)begin
      if(_zz_269_)begin
        memory_arbitration_haltItself = 1'b1;
        memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b1;
      end
      _zz_39_ = memory_MulDivIterativePlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_40_;
  assign execute_SHIFT_CTRL = _zz_42_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_46_ = decode_PC;
  assign _zz_47_ = decode_RS2;
  assign decode_SRC2_CTRL = _zz_48_;
  assign _zz_50_ = decode_RS1;
  assign decode_SRC1_CTRL = _zz_51_;
  assign decode_SRC_USE_SUB_LESS = _zz_84_;
  assign decode_SRC_ADD_ZERO = _zz_80_;
  assign execute_SRC_ADD_SUB = _zz_45_;
  assign execute_SRC_LESS = _zz_43_;
  assign execute_ALU_CTRL = _zz_54_;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_ALU_BITWISE_CTRL = _zz_56_;
  assign _zz_57_ = writeBack_INSTRUCTION;
  assign _zz_58_ = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_59_ = 1'b0;
    if(writeBack_RegFilePlugin_regFileWrite_valid)begin
      _zz_59_ = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = _zz_97_;
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_75_;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = _zz_90_;
  assign decode_INSTRUCTION_READY = 1'b1;
  assign writeBack_IS_DBUS_SHARING = memory_to_writeBack_IS_DBUS_SHARING;
  assign memory_IS_DBUS_SHARING = execute_to_memory_IS_DBUS_SHARING;
  always @ (*) begin
    _zz_92_ = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_92_ = writeBack_DBusCachedPlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_296_)
        2'b00 : begin
          _zz_92_ = _zz_364_;
        end
        default : begin
          _zz_92_ = _zz_365_;
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
  assign execute_MEMORY_AMO = decode_to_execute_MEMORY_AMO;
  assign execute_MEMORY_LRSC = decode_to_execute_MEMORY_LRSC;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_MEMORY_MANAGMENT;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_MEMORY_WR = decode_to_execute_MEMORY_WR;
  assign execute_SRC_ADD = _zz_44_;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign decode_MEMORY_ENABLE = _zz_83_;
  assign decode_FLUSH_ALL = _zz_72_;
  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected = _zz_94_;
    _zz_95_ = _zz_96_;
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    IBusCachedPlugin_decodeExceptionPort_payload_code = (4'bxxxx);
    if(((_zz_221_ && IBusCachedPlugin_cache_io_cpu_decode_mmuException) && (! _zz_96_)))begin
      _zz_95_ = 1'b1;
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
      IBusCachedPlugin_decodeExceptionPort_payload_code = (4'b1100);
    end
    if(((_zz_221_ && IBusCachedPlugin_cache_io_cpu_decode_error) && (! _zz_94_)))begin
      IBusCachedPlugin_rsp_issueDetected = 1'b1;
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
      IBusCachedPlugin_decodeExceptionPort_payload_code = (4'b0001);
    end
    if(IBusCachedPlugin_fetcherHalt)begin
      IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_94_ = _zz_95_;
    _zz_96_ = 1'b0;
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    _zz_224_ = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(((_zz_221_ && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! 1'b0)))begin
      _zz_96_ = 1'b1;
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(((_zz_221_ && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! _zz_95_)))begin
      _zz_94_ = 1'b1;
      _zz_224_ = 1'b1;
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if((! IBusCachedPlugin_iBusRsp_readyForError))begin
      IBusCachedPlugin_rsp_redoFetch = 1'b0;
    end
    if((! IBusCachedPlugin_iBusRsp_readyForError))begin
      _zz_224_ = 1'b0;
    end
  end

  assign memory_PREDICTION_CONTEXT_hazard = execute_to_memory_PREDICTION_CONTEXT_hazard;
  assign memory_PREDICTION_CONTEXT_hit = execute_to_memory_PREDICTION_CONTEXT_hit;
  assign memory_PREDICTION_CONTEXT_line_source = execute_to_memory_PREDICTION_CONTEXT_line_source;
  assign memory_PREDICTION_CONTEXT_line_branchWish = execute_to_memory_PREDICTION_CONTEXT_line_branchWish;
  assign memory_PREDICTION_CONTEXT_line_target = execute_to_memory_PREDICTION_CONTEXT_line_target;
  always @ (*) begin
    _zz_103_ = 1'b0;
    if(IBusCachedPlugin_predictor_historyWrite_valid)begin
      _zz_103_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_104_ = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_104_ = BranchPlugin_jumpInterface_payload;
    end
  end

  always @ (*) begin
    _zz_105_ = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_redoBranch_valid)begin
      _zz_105_ = IBusCachedPlugin_redoBranch_payload;
    end
  end

  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_PC = _zz_108_;
  assign decode_INSTRUCTION = _zz_107_;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    decode_arbitration_isValid = (IBusCachedPlugin_iBusRsp_decodeInput_valid && (! IBusCachedPlugin_injector_decodeRemoved));
    if(((DBusCachedPlugin_mmuBus_busy && decode_arbitration_isValid) && decode_MEMORY_ENABLE))begin
      decode_arbitration_haltItself = 1'b1;
    end
    IBusCachedPlugin_injectionPort_ready = 1'b0;
    case(_zz_214_)
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
    _zz_225_ = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
    _zz_226_ = execute_SRC_ADD;
    _zz_227_ = execute_MEMORY_WR;
    _zz_228_ = _zz_143_;
    _zz_229_ = execute_DBusCachedPlugin_size;
    _zz_230_ = 1'b0;
    if(execute_MEMORY_LRSC)begin
      _zz_230_ = 1'b1;
    end
    _zz_231_ = execute_MEMORY_AMO;
    MmuPlugin_dBusAccess_cmd_ready = 1'b0;
    DBusCachedPlugin_forceDatapath = 1'b0;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      decode_arbitration_haltByOther = 1'b1;
      if(((! ({writeBack_arbitration_isValid,{memory_arbitration_isValid,execute_arbitration_isValid}} != (3'b000))) && (! CsrPlugin_exceptionPending)))begin
        if((! dataCache_1__io_cpu_redo))begin
          _zz_225_ = 1'b1;
          MmuPlugin_dBusAccess_cmd_ready = (! execute_arbitration_isStuck);
        end
        _zz_227_ = MmuPlugin_dBusAccess_cmd_payload_write;
        _zz_228_ = MmuPlugin_dBusAccess_cmd_payload_data;
        _zz_229_ = MmuPlugin_dBusAccess_cmd_payload_size;
        _zz_230_ = 1'b0;
        _zz_231_ = 1'b0;
        _zz_226_ = MmuPlugin_dBusAccess_cmd_payload_address;
        DBusCachedPlugin_forceDatapath = 1'b1;
      end
    end
    if((decode_arbitration_isValid && (_zz_172_ || _zz_173_)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_interrupt)begin
      decode_arbitration_haltByOther = decode_arbitration_isValid;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != (3'b000)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(_zz_270_)begin
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
    if(_zz_271_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
      CsrPlugin_jumpInterface_valid = 1'b1;
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,(2'b00)};
      memory_arbitration_flushAll = 1'b1;
    end
    if(_zz_272_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
      CsrPlugin_jumpInterface_valid = 1'b1;
      memory_arbitration_flushAll = 1'b1;
      case(_zz_273_)
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
    if(_zz_274_)begin
      execute_arbitration_haltByOther = 1'b1;
      if(_zz_275_)begin
        IBusCachedPlugin_fetcherflushIt = 1'b1;
        IBusCachedPlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_276_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushAll = 1'b0;
    if(BranchPlugin_branchExceptionPort_valid)begin
      execute_arbitration_flushAll = 1'b1;
    end
    if(_zz_274_)begin
      if(_zz_275_)begin
        execute_arbitration_flushAll = 1'b1;
      end
    end
    if(BranchPlugin_jumpInterface_valid)begin
      execute_arbitration_flushAll = 1'b1;
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(BranchPlugin_branchExceptionPort_valid)begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

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

  always @ (*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if((IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid))begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  always @ (*) begin
    _zz_109_ = 1'b0;
    CsrPlugin_forceMachineWire = 1'b0;
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode)begin
      CsrPlugin_allowException = 1'b0;
      CsrPlugin_forceMachineWire = 1'b1;
      _zz_109_ = 1'b1;
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

  assign IBusCachedPlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,{DBusCachedPlugin_redoBranch_valid,IBusCachedPlugin_redoBranch_valid}}} != (4'b0000));
  assign _zz_110_ = {IBusCachedPlugin_redoBranch_valid,{BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}};
  assign _zz_111_ = (_zz_110_ & (~ _zz_298_));
  assign _zz_112_ = _zz_111_[3];
  assign _zz_113_ = (_zz_111_[1] || _zz_112_);
  assign _zz_114_ = (_zz_111_[2] || _zz_112_);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_245_;
  assign _zz_115_ = (! IBusCachedPlugin_fetcherHalt);
  assign IBusCachedPlugin_fetchPc_output_valid = (IBusCachedPlugin_fetchPc_preOutput_valid && _zz_115_);
  assign IBusCachedPlugin_fetchPc_preOutput_ready = (IBusCachedPlugin_fetchPc_output_ready && _zz_115_);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_preOutput_payload;
  always @ (*) begin
    IBusCachedPlugin_fetchPc_propagatePc = 1'b0;
    if((IBusCachedPlugin_iBusRsp_stages_1_input_valid && IBusCachedPlugin_iBusRsp_stages_1_input_ready))begin
      IBusCachedPlugin_fetchPc_propagatePc = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_300_);
    IBusCachedPlugin_fetchPc_samplePcNext = 1'b0;
    if(IBusCachedPlugin_fetchPc_propagatePc)begin
      IBusCachedPlugin_fetchPc_samplePcNext = 1'b1;
    end
    if(IBusCachedPlugin_fetchPc_predictionPcLoad_valid)begin
      IBusCachedPlugin_fetchPc_samplePcNext = 1'b1;
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_fetchPc_predictionPcLoad_payload;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_samplePcNext = 1'b1;
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    if(_zz_277_)begin
      IBusCachedPlugin_fetchPc_samplePcNext = 1'b1;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
    IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
  end

  assign IBusCachedPlugin_fetchPc_preOutput_valid = _zz_116_;
  assign IBusCachedPlugin_fetchPc_preOutput_payload = IBusCachedPlugin_fetchPc_pc;
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

  assign _zz_117_ = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_117_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_117_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_fetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_118_ = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_118_);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_118_);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt = 1'b0;
    if((IBusCachedPlugin_rsp_issueDetected || IBusCachedPlugin_rsp_iBusRspOutputHalt))begin
      IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt = 1'b1;
    end
  end

  assign _zz_119_ = (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_ready && _zz_119_);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_valid = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid && _zz_119_);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_payload = IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_120_;
  assign _zz_120_ = ((1'b0 && (! _zz_121_)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_121_ = _zz_122_;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_121_;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! _zz_123_)) || IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready);
  assign _zz_123_ = _zz_124_;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid = _zz_123_;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload = _zz_125_;
  assign IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_1;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_4;
  assign IBusCachedPlugin_iBusRsp_decodeInput_ready = (! decode_arbitration_isStuck);
  assign _zz_108_ = IBusCachedPlugin_iBusRsp_decodeInput_payload_pc;
  assign _zz_107_ = IBusCachedPlugin_iBusRsp_decodeInput_payload_rsp_inst;
  assign _zz_106_ = (decode_PC + (32'b00000000000000000000000000000100));
  assign _zz_126_ = (IBusCachedPlugin_iBusRsp_stages_0_input_payload >>> 2);
  assign _zz_127_ = (IBusCachedPlugin_iBusRsp_stages_0_output_ready || (IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt));
  assign _zz_128_ = _zz_242_;
  assign IBusCachedPlugin_predictor_line_source = _zz_128_[19 : 0];
  assign IBusCachedPlugin_predictor_line_branchWish = _zz_128_[21 : 20];
  assign IBusCachedPlugin_predictor_line_target = _zz_128_[53 : 22];
  assign IBusCachedPlugin_predictor_hit = ((IBusCachedPlugin_predictor_line_source == _zz_302_) && 1'b1);
  assign IBusCachedPlugin_predictor_hazard = (IBusCachedPlugin_predictor_historyWriteLast_valid && (IBusCachedPlugin_predictor_historyWriteLast_payload_address == _zz_304_));
  assign IBusCachedPlugin_fetchPc_predictionPcLoad_valid = (((IBusCachedPlugin_predictor_line_branchWish[1] && IBusCachedPlugin_predictor_hit) && (! IBusCachedPlugin_predictor_hazard)) && (IBusCachedPlugin_iBusRsp_stages_1_output_valid && IBusCachedPlugin_iBusRsp_stages_1_output_ready));
  assign IBusCachedPlugin_fetchPc_predictionPcLoad_payload = IBusCachedPlugin_predictor_line_target;
  assign IBusCachedPlugin_predictor_fetchContext_hazard = IBusCachedPlugin_predictor_hazard;
  assign IBusCachedPlugin_predictor_fetchContext_hit = IBusCachedPlugin_predictor_hit;
  assign IBusCachedPlugin_predictor_fetchContext_line_source = IBusCachedPlugin_predictor_line_source;
  assign IBusCachedPlugin_predictor_fetchContext_line_branchWish = IBusCachedPlugin_predictor_line_branchWish;
  assign IBusCachedPlugin_predictor_fetchContext_line_target = IBusCachedPlugin_predictor_line_target;
  assign IBusCachedPlugin_predictor_injectorContext_hazard = IBusCachedPlugin_predictor_fetchContext_regNextWhen_hazard;
  assign IBusCachedPlugin_predictor_injectorContext_hit = IBusCachedPlugin_predictor_fetchContext_regNextWhen_hit;
  assign IBusCachedPlugin_predictor_injectorContext_line_source = IBusCachedPlugin_predictor_fetchContext_regNextWhen_line_source;
  assign IBusCachedPlugin_predictor_injectorContext_line_branchWish = IBusCachedPlugin_predictor_fetchContext_regNextWhen_line_branchWish;
  assign IBusCachedPlugin_predictor_injectorContext_line_target = IBusCachedPlugin_predictor_fetchContext_regNextWhen_line_target;
  assign _zz_98_ = IBusCachedPlugin_predictor_injectorContext_hazard;
  assign _zz_99_ = IBusCachedPlugin_predictor_injectorContext_hit;
  assign _zz_100_ = IBusCachedPlugin_predictor_injectorContext_line_source;
  assign _zz_101_ = IBusCachedPlugin_predictor_injectorContext_line_branchWish;
  assign _zz_102_ = IBusCachedPlugin_predictor_injectorContext_line_target;
  assign IBusCachedPlugin_fetchPrediction_cmd_hadBranch = ((memory_PREDICTION_CONTEXT_hit && (! memory_PREDICTION_CONTEXT_hazard)) && memory_PREDICTION_CONTEXT_line_branchWish[1]);
  assign IBusCachedPlugin_fetchPrediction_cmd_targetPc = memory_PREDICTION_CONTEXT_line_target;
  always @ (*) begin
    IBusCachedPlugin_predictor_historyWrite_valid = 1'b0;
    if(IBusCachedPlugin_fetchPrediction_rsp_wasRight)begin
      IBusCachedPlugin_predictor_historyWrite_valid = memory_PREDICTION_CONTEXT_hit;
      IBusCachedPlugin_predictor_historyWrite_payload_data_branchWish = (_zz_305_ - _zz_309_);
    end else begin
      if(memory_PREDICTION_CONTEXT_hit)begin
        IBusCachedPlugin_predictor_historyWrite_valid = 1'b1;
        IBusCachedPlugin_predictor_historyWrite_payload_data_branchWish = (_zz_310_ + _zz_314_);
      end else begin
        IBusCachedPlugin_predictor_historyWrite_valid = 1'b1;
        IBusCachedPlugin_predictor_historyWrite_payload_data_branchWish = (2'b10);
      end
    end
    if((memory_PREDICTION_CONTEXT_hazard || (! memory_arbitration_isFiring)))begin
      IBusCachedPlugin_predictor_historyWrite_valid = 1'b0;
    end
  end

  assign IBusCachedPlugin_predictor_historyWrite_payload_address = IBusCachedPlugin_fetchPrediction_rsp_sourceLastWord[11 : 2];
  assign IBusCachedPlugin_predictor_historyWrite_payload_data_source = (IBusCachedPlugin_fetchPrediction_rsp_sourceLastWord >>> 12);
  assign IBusCachedPlugin_predictor_historyWrite_payload_data_target = IBusCachedPlugin_fetchPrediction_rsp_finalPc;
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign _zz_216_ = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign _zz_219_ = (IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt);
  assign _zz_220_ = (32'b00000000000000000000000000000000);
  assign _zz_217_ = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign _zz_218_ = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_221_ = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign _zz_222_ = (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready);
  assign _zz_223_ = (CsrPlugin_privilege == (2'b00));
  assign _zz_97_ = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_cache_io_cpu_fetch_data);
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload[31 : 2],(2'b00)};
  assign IBusCachedPlugin_redoBranch_valid = IBusCachedPlugin_rsp_redoFetch;
  assign IBusCachedPlugin_redoBranch_payload = IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload;
  assign IBusCachedPlugin_iBusRsp_decodeInput_valid = IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_valid;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_ready = IBusCachedPlugin_iBusRsp_decodeInput_ready;
  assign IBusCachedPlugin_iBusRsp_decodeInput_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_decodeInput_payload_pc = IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_payload;
  assign IBusCachedPlugin_mmuBus_cmd_isValid = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid;
  assign IBusCachedPlugin_mmuBus_cmd_virtualAddress = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress;
  assign IBusCachedPlugin_mmuBus_cmd_bypassTranslation = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation;
  assign IBusCachedPlugin_mmuBus_end = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end;
  assign _zz_215_ = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign dataCache_1__io_mem_cmd_s2mPipe_valid = (dataCache_1__io_mem_cmd_valid || _zz_129_);
  assign _zz_241_ = (! _zz_129_);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_wr = (_zz_129_ ? _zz_130_ : dataCache_1__io_mem_cmd_payload_wr);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_address = (_zz_129_ ? _zz_131_ : dataCache_1__io_mem_cmd_payload_address);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_data = (_zz_129_ ? _zz_132_ : dataCache_1__io_mem_cmd_payload_data);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_mask = (_zz_129_ ? _zz_133_ : dataCache_1__io_mem_cmd_payload_mask);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_length = (_zz_129_ ? _zz_134_ : dataCache_1__io_mem_cmd_payload_length);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_last = (_zz_129_ ? _zz_135_ : dataCache_1__io_mem_cmd_payload_last);
  assign dataCache_1__io_mem_cmd_s2mPipe_ready = ((1'b1 && (! dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_valid)) || dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_ready);
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_valid = _zz_136_;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_wr = _zz_137_;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_address = _zz_138_;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_data = _zz_139_;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_mask = _zz_140_;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_length = _zz_141_;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_last = _zz_142_;
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
        _zz_143_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_143_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_143_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign _zz_240_ = (execute_arbitration_isValid && execute_MEMORY_MANAGMENT);
  assign _zz_233_ = execute_INSTRUCTION[31 : 29];
  assign _zz_232_ = execute_INSTRUCTION[27];
  assign _zz_93_ = _zz_226_[1 : 0];
  always @ (*) begin
    _zz_234_ = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
    if(memory_IS_DBUS_SHARING)begin
      _zz_234_ = 1'b1;
    end
  end

  assign _zz_235_ = memory_REGFILE_WRITE_DATA;
  assign DBusCachedPlugin_mmuBus_cmd_isValid = dataCache_1__io_cpu_memory_mmuBus_cmd_isValid;
  assign DBusCachedPlugin_mmuBus_cmd_virtualAddress = dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress;
  always @ (*) begin
    DBusCachedPlugin_mmuBus_cmd_bypassTranslation = dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation;
    if(memory_IS_DBUS_SHARING)begin
      DBusCachedPlugin_mmuBus_cmd_bypassTranslation = 1'b1;
    end
  end

  always @ (*) begin
    _zz_236_ = DBusCachedPlugin_mmuBus_rsp_isIoAccess;
    if((_zz_109_ && (! dataCache_1__io_cpu_memory_isWrite)))begin
      _zz_236_ = 1'b1;
    end
  end

  assign DBusCachedPlugin_mmuBus_end = dataCache_1__io_cpu_memory_mmuBus_end;
  always @ (*) begin
    _zz_237_ = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
    if(writeBack_IS_DBUS_SHARING)begin
      _zz_237_ = 1'b1;
    end
  end

  assign _zz_238_ = (CsrPlugin_privilege == (2'b00));
  assign _zz_239_ = writeBack_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusCachedPlugin_redoBranch_valid = 1'b0;
    DBusCachedPlugin_exceptionBus_valid = 1'b0;
    DBusCachedPlugin_exceptionBus_payload_code = (4'bxxxx);
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      if(dataCache_1__io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_315_};
      end
      if(dataCache_1__io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_316_};
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

  assign DBusCachedPlugin_redoBranch_payload = writeBack_PC;
  assign DBusCachedPlugin_exceptionBus_payload_badAddr = writeBack_REGFILE_WRITE_DATA;
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

  assign _zz_144_ = (writeBack_DBusCachedPlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_145_[31] = _zz_144_;
    _zz_145_[30] = _zz_144_;
    _zz_145_[29] = _zz_144_;
    _zz_145_[28] = _zz_144_;
    _zz_145_[27] = _zz_144_;
    _zz_145_[26] = _zz_144_;
    _zz_145_[25] = _zz_144_;
    _zz_145_[24] = _zz_144_;
    _zz_145_[23] = _zz_144_;
    _zz_145_[22] = _zz_144_;
    _zz_145_[21] = _zz_144_;
    _zz_145_[20] = _zz_144_;
    _zz_145_[19] = _zz_144_;
    _zz_145_[18] = _zz_144_;
    _zz_145_[17] = _zz_144_;
    _zz_145_[16] = _zz_144_;
    _zz_145_[15] = _zz_144_;
    _zz_145_[14] = _zz_144_;
    _zz_145_[13] = _zz_144_;
    _zz_145_[12] = _zz_144_;
    _zz_145_[11] = _zz_144_;
    _zz_145_[10] = _zz_144_;
    _zz_145_[9] = _zz_144_;
    _zz_145_[8] = _zz_144_;
    _zz_145_[7 : 0] = writeBack_DBusCachedPlugin_rspShifted[7 : 0];
  end

  assign _zz_146_ = (writeBack_DBusCachedPlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_147_[31] = _zz_146_;
    _zz_147_[30] = _zz_146_;
    _zz_147_[29] = _zz_146_;
    _zz_147_[28] = _zz_146_;
    _zz_147_[27] = _zz_146_;
    _zz_147_[26] = _zz_146_;
    _zz_147_[25] = _zz_146_;
    _zz_147_[24] = _zz_146_;
    _zz_147_[23] = _zz_146_;
    _zz_147_[22] = _zz_146_;
    _zz_147_[21] = _zz_146_;
    _zz_147_[20] = _zz_146_;
    _zz_147_[19] = _zz_146_;
    _zz_147_[18] = _zz_146_;
    _zz_147_[17] = _zz_146_;
    _zz_147_[16] = _zz_146_;
    _zz_147_[15 : 0] = writeBack_DBusCachedPlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_294_)
      2'b00 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_145_;
      end
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_147_;
      end
      default : begin
        writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspShifted;
      end
    endcase
  end

  assign _zz_91_ = (MmuPlugin_dBusAccess_cmd_valid && MmuPlugin_dBusAccess_cmd_ready);
  assign MmuPlugin_dBusAccess_rsp_valid = ((writeBack_IS_DBUS_SHARING && (! dataCache_1__io_cpu_writeBack_isWrite)) && (dataCache_1__io_cpu_redo || (! dataCache_1__io_cpu_writeBack_haltIt)));
  assign MmuPlugin_dBusAccess_rsp_payload_data = dataCache_1__io_cpu_writeBack_data;
  assign MmuPlugin_dBusAccess_rsp_payload_error = (dataCache_1__io_cpu_writeBack_unalignedAccess || dataCache_1__io_cpu_writeBack_accessError);
  assign MmuPlugin_dBusAccess_rsp_payload_redo = dataCache_1__io_cpu_redo;
  assign _zz_149_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001010000)) == (32'b00000000000000000100000001010000));
  assign _zz_150_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001001000)) == (32'b00000000000000000000000001001000));
  assign _zz_151_ = ((decode_INSTRUCTION & (32'b00000000000000000010000001010000)) == (32'b00000000000000000010000000000000));
  assign _zz_152_ = ((decode_INSTRUCTION & (32'b00000000000000000001000000000000)) == (32'b00000000000000000000000000000000));
  assign _zz_153_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000001100)) == (32'b00000000000000000000000000000100));
  assign _zz_154_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_148_ = {(((decode_INSTRUCTION & _zz_447_) == (32'b00000000000000000100000000001000)) != (1'b0)),{({_zz_448_,{_zz_449_,_zz_450_}} != (3'b000)),{({_zz_451_,_zz_452_} != (5'b00000)),{(_zz_453_ != _zz_454_),{_zz_455_,{_zz_456_,_zz_457_}}}}}};
  assign _zz_90_ = ({((decode_INSTRUCTION & (32'b00000000000000000000000001011111)) == (32'b00000000000000000000000000010111)),{((decode_INSTRUCTION & (32'b00000000000000000000000001111111)) == (32'b00000000000000000000000001101111)),{((decode_INSTRUCTION & (32'b00000000000000000001000001101111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & _zz_651_) == (32'b00000000000000000001000001110011)),{(_zz_652_ == _zz_653_),{_zz_654_,{_zz_655_,_zz_656_}}}}}}} != (25'b0000000000000000000000000));
  assign _zz_89_ = _zz_317_[0];
  assign _zz_155_ = _zz_148_[2 : 1];
  assign _zz_88_ = _zz_155_;
  assign _zz_87_ = _zz_318_[0];
  assign _zz_156_ = _zz_148_[5 : 4];
  assign _zz_86_ = _zz_156_;
  assign _zz_85_ = _zz_319_[0];
  assign _zz_84_ = _zz_320_[0];
  assign _zz_83_ = _zz_321_[0];
  assign _zz_82_ = _zz_322_[0];
  assign _zz_81_ = _zz_323_[0];
  assign _zz_80_ = _zz_324_[0];
  assign _zz_79_ = _zz_325_[0];
  assign _zz_78_ = _zz_326_[0];
  assign _zz_77_ = _zz_327_[0];
  assign _zz_157_ = _zz_148_[17 : 16];
  assign _zz_76_ = _zz_157_;
  assign _zz_75_ = _zz_328_[0];
  assign _zz_74_ = _zz_329_[0];
  assign _zz_73_ = _zz_330_[0];
  assign _zz_72_ = _zz_331_[0];
  assign _zz_71_ = _zz_332_[0];
  assign _zz_158_ = _zz_148_[24 : 23];
  assign _zz_70_ = _zz_158_;
  assign _zz_69_ = _zz_333_[0];
  assign _zz_159_ = _zz_148_[27 : 26];
  assign _zz_68_ = _zz_159_;
  assign _zz_160_ = _zz_148_[29 : 28];
  assign _zz_67_ = _zz_160_;
  assign _zz_66_ = _zz_334_[0];
  assign _zz_161_ = _zz_148_[32 : 31];
  assign _zz_65_ = _zz_161_;
  assign _zz_64_ = _zz_335_[0];
  assign _zz_63_ = _zz_336_[0];
  assign _zz_62_ = _zz_337_[0];
  assign decodeExceptionPort_valid = ((decode_arbitration_isValid && decode_INSTRUCTION_READY) && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = (4'b0010);
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_243_;
  assign decode_RegFilePlugin_rs2Data = _zz_244_;
  assign _zz_61_ = decode_RegFilePlugin_rs1Data;
  assign _zz_60_ = decode_RegFilePlugin_rs2Data;
  always @ (*) begin
    writeBack_RegFilePlugin_regFileWrite_valid = (_zz_58_ && writeBack_arbitration_isFiring);
    if(_zz_162_)begin
      writeBack_RegFilePlugin_regFileWrite_valid = 1'b1;
    end
  end

  assign writeBack_RegFilePlugin_regFileWrite_payload_address = _zz_57_[11 : 7];
  assign writeBack_RegFilePlugin_regFileWrite_payload_data = _zz_92_;
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
        _zz_163_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_163_ = {31'd0, _zz_338_};
      end
      default : begin
        _zz_163_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign _zz_55_ = _zz_163_;
  assign _zz_53_ = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  always @ (*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_164_ = _zz_50_;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_164_ = {29'd0, _zz_339_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_164_ = {decode_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
      default : begin
        _zz_164_ = {27'd0, _zz_340_};
      end
    endcase
  end

  assign _zz_52_ = _zz_164_;
  assign _zz_165_ = _zz_341_[11];
  always @ (*) begin
    _zz_166_[19] = _zz_165_;
    _zz_166_[18] = _zz_165_;
    _zz_166_[17] = _zz_165_;
    _zz_166_[16] = _zz_165_;
    _zz_166_[15] = _zz_165_;
    _zz_166_[14] = _zz_165_;
    _zz_166_[13] = _zz_165_;
    _zz_166_[12] = _zz_165_;
    _zz_166_[11] = _zz_165_;
    _zz_166_[10] = _zz_165_;
    _zz_166_[9] = _zz_165_;
    _zz_166_[8] = _zz_165_;
    _zz_166_[7] = _zz_165_;
    _zz_166_[6] = _zz_165_;
    _zz_166_[5] = _zz_165_;
    _zz_166_[4] = _zz_165_;
    _zz_166_[3] = _zz_165_;
    _zz_166_[2] = _zz_165_;
    _zz_166_[1] = _zz_165_;
    _zz_166_[0] = _zz_165_;
  end

  assign _zz_167_ = _zz_342_[11];
  always @ (*) begin
    _zz_168_[19] = _zz_167_;
    _zz_168_[18] = _zz_167_;
    _zz_168_[17] = _zz_167_;
    _zz_168_[16] = _zz_167_;
    _zz_168_[15] = _zz_167_;
    _zz_168_[14] = _zz_167_;
    _zz_168_[13] = _zz_167_;
    _zz_168_[12] = _zz_167_;
    _zz_168_[11] = _zz_167_;
    _zz_168_[10] = _zz_167_;
    _zz_168_[9] = _zz_167_;
    _zz_168_[8] = _zz_167_;
    _zz_168_[7] = _zz_167_;
    _zz_168_[6] = _zz_167_;
    _zz_168_[5] = _zz_167_;
    _zz_168_[4] = _zz_167_;
    _zz_168_[3] = _zz_167_;
    _zz_168_[2] = _zz_167_;
    _zz_168_[1] = _zz_167_;
    _zz_168_[0] = _zz_167_;
  end

  always @ (*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_169_ = _zz_47_;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_169_ = {_zz_166_,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_169_ = {_zz_168_,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_169_ = _zz_46_;
      end
    endcase
  end

  assign _zz_49_ = _zz_169_;
  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_343_;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign _zz_45_ = execute_SrcPlugin_addSub;
  assign _zz_44_ = execute_SrcPlugin_addSub;
  assign _zz_43_ = execute_SrcPlugin_less;
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_170_[0] = execute_SRC1[31];
    _zz_170_[1] = execute_SRC1[30];
    _zz_170_[2] = execute_SRC1[29];
    _zz_170_[3] = execute_SRC1[28];
    _zz_170_[4] = execute_SRC1[27];
    _zz_170_[5] = execute_SRC1[26];
    _zz_170_[6] = execute_SRC1[25];
    _zz_170_[7] = execute_SRC1[24];
    _zz_170_[8] = execute_SRC1[23];
    _zz_170_[9] = execute_SRC1[22];
    _zz_170_[10] = execute_SRC1[21];
    _zz_170_[11] = execute_SRC1[20];
    _zz_170_[12] = execute_SRC1[19];
    _zz_170_[13] = execute_SRC1[18];
    _zz_170_[14] = execute_SRC1[17];
    _zz_170_[15] = execute_SRC1[16];
    _zz_170_[16] = execute_SRC1[15];
    _zz_170_[17] = execute_SRC1[14];
    _zz_170_[18] = execute_SRC1[13];
    _zz_170_[19] = execute_SRC1[12];
    _zz_170_[20] = execute_SRC1[11];
    _zz_170_[21] = execute_SRC1[10];
    _zz_170_[22] = execute_SRC1[9];
    _zz_170_[23] = execute_SRC1[8];
    _zz_170_[24] = execute_SRC1[7];
    _zz_170_[25] = execute_SRC1[6];
    _zz_170_[26] = execute_SRC1[5];
    _zz_170_[27] = execute_SRC1[4];
    _zz_170_[28] = execute_SRC1[3];
    _zz_170_[29] = execute_SRC1[2];
    _zz_170_[30] = execute_SRC1[1];
    _zz_170_[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_170_ : execute_SRC1);
  assign _zz_41_ = _zz_351_;
  always @ (*) begin
    _zz_171_[0] = memory_SHIFT_RIGHT[31];
    _zz_171_[1] = memory_SHIFT_RIGHT[30];
    _zz_171_[2] = memory_SHIFT_RIGHT[29];
    _zz_171_[3] = memory_SHIFT_RIGHT[28];
    _zz_171_[4] = memory_SHIFT_RIGHT[27];
    _zz_171_[5] = memory_SHIFT_RIGHT[26];
    _zz_171_[6] = memory_SHIFT_RIGHT[25];
    _zz_171_[7] = memory_SHIFT_RIGHT[24];
    _zz_171_[8] = memory_SHIFT_RIGHT[23];
    _zz_171_[9] = memory_SHIFT_RIGHT[22];
    _zz_171_[10] = memory_SHIFT_RIGHT[21];
    _zz_171_[11] = memory_SHIFT_RIGHT[20];
    _zz_171_[12] = memory_SHIFT_RIGHT[19];
    _zz_171_[13] = memory_SHIFT_RIGHT[18];
    _zz_171_[14] = memory_SHIFT_RIGHT[17];
    _zz_171_[15] = memory_SHIFT_RIGHT[16];
    _zz_171_[16] = memory_SHIFT_RIGHT[15];
    _zz_171_[17] = memory_SHIFT_RIGHT[14];
    _zz_171_[18] = memory_SHIFT_RIGHT[13];
    _zz_171_[19] = memory_SHIFT_RIGHT[12];
    _zz_171_[20] = memory_SHIFT_RIGHT[11];
    _zz_171_[21] = memory_SHIFT_RIGHT[10];
    _zz_171_[22] = memory_SHIFT_RIGHT[9];
    _zz_171_[23] = memory_SHIFT_RIGHT[8];
    _zz_171_[24] = memory_SHIFT_RIGHT[7];
    _zz_171_[25] = memory_SHIFT_RIGHT[6];
    _zz_171_[26] = memory_SHIFT_RIGHT[5];
    _zz_171_[27] = memory_SHIFT_RIGHT[4];
    _zz_171_[28] = memory_SHIFT_RIGHT[3];
    _zz_171_[29] = memory_SHIFT_RIGHT[2];
    _zz_171_[30] = memory_SHIFT_RIGHT[1];
    _zz_171_[31] = memory_SHIFT_RIGHT[0];
  end

  always @ (*) begin
    _zz_172_ = 1'b0;
    _zz_173_ = 1'b0;
    if((writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID))begin
      if((1'b0 || (! 1'b1)))begin
        if(_zz_178_)begin
          _zz_172_ = 1'b1;
        end
        if(_zz_179_)begin
          _zz_173_ = 1'b1;
        end
      end
    end
    if((memory_arbitration_isValid && memory_REGFILE_WRITE_VALID))begin
      if((1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE)))begin
        if(_zz_180_)begin
          _zz_172_ = 1'b1;
        end
        if(_zz_181_)begin
          _zz_173_ = 1'b1;
        end
      end
    end
    if((execute_arbitration_isValid && execute_REGFILE_WRITE_VALID))begin
      if((1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE)))begin
        if(_zz_182_)begin
          _zz_172_ = 1'b1;
        end
        if(_zz_183_)begin
          _zz_173_ = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_172_ = 1'b0;
    end
    if((! decode_RS2_USE))begin
      _zz_173_ = 1'b0;
    end
  end

  assign _zz_174_ = (_zz_58_ && writeBack_arbitration_isFiring);
  assign _zz_178_ = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_179_ = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_180_ = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_181_ = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_182_ = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_183_ = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_MulPlugin_a = execute_SRC1;
  assign execute_MulPlugin_b = execute_SRC2;
  always @ (*) begin
    case(_zz_295_)
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
  assign _zz_37_ = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign _zz_36_ = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign _zz_35_ = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign _zz_34_ = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign _zz_33_ = ($signed(_zz_353_) + $signed(_zz_361_));
  assign writeBack_MulPlugin_result = ($signed(_zz_362_) + $signed(_zz_363_));
  always @ (*) begin
    memory_MulDivIterativePlugin_div_counter_willClear = 1'b0;
    if(_zz_278_)begin
      memory_MulDivIterativePlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_div_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_div_counter_value == (6'b100001));
  assign memory_MulDivIterativePlugin_div_counter_willOverflow = (memory_MulDivIterativePlugin_div_counter_willOverflowIfInc && memory_MulDivIterativePlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_MulDivIterativePlugin_div_counter_willOverflow)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (6'b000000);
    end else begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (memory_MulDivIterativePlugin_div_counter_value + _zz_367_);
    end
    if(memory_MulDivIterativePlugin_div_counter_willClear)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (6'b000000);
    end
  end

  assign _zz_184_ = memory_MulDivIterativePlugin_rs1[31 : 0];
  assign _zz_185_ = {memory_MulDivIterativePlugin_accumulator[31 : 0],_zz_184_[31]};
  assign _zz_186_ = (_zz_185_ - _zz_368_);
  assign _zz_187_ = (memory_INSTRUCTION[13] ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_rs1[31 : 0]);
  assign _zz_188_ = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_189_ = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_190_[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_190_[31 : 0] = execute_RS1;
  end

  always @ (*) begin
    CsrPlugin_privilege = _zz_191_;
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = (2'b11);
    end
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = (26'b00000000000000000000000000);
  assign CsrPlugin_sip_SEIP_OR = (CsrPlugin_sip_SEIP_SOFT || CsrPlugin_sip_SEIP_INPUT);
  assign _zz_192_ = (CsrPlugin_sip_STIP && CsrPlugin_sie_STIE);
  assign _zz_193_ = (CsrPlugin_sip_SSIP && CsrPlugin_sie_SSIE);
  assign _zz_194_ = (CsrPlugin_sip_SEIP_OR && CsrPlugin_sie_SEIE);
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
  assign _zz_195_ = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign _zz_196_ = _zz_381_[0];
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_270_)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(BranchPlugin_branchExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_interrupt = 1'b0;
    CsrPlugin_interruptCode = (4'bxxxx);
    CsrPlugin_interruptTargetPrivilege = (2'bxx);
    if(((CsrPlugin_sstatus_SIE && (CsrPlugin_privilege == (2'b01))) || (CsrPlugin_privilege < (2'b01))))begin
      if(((_zz_192_ && (1'b1 && CsrPlugin_mideleg_ST)) && (! 1'b0)))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b0101);
        CsrPlugin_interruptTargetPrivilege = (2'b01);
      end
      if(((_zz_193_ && (1'b1 && CsrPlugin_mideleg_SS)) && (! 1'b0)))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b0001);
        CsrPlugin_interruptTargetPrivilege = (2'b01);
      end
      if(((_zz_194_ && (1'b1 && CsrPlugin_mideleg_SE)) && (! 1'b0)))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b1001);
        CsrPlugin_interruptTargetPrivilege = (2'b01);
      end
    end
    if((CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < (2'b11))))begin
      if(((_zz_192_ && 1'b1) && (! (CsrPlugin_mideleg_ST != (1'b0)))))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b0101);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
      if(((_zz_193_ && 1'b1) && (! (CsrPlugin_mideleg_SS != (1'b0)))))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b0001);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
      if(((_zz_194_ && 1'b1) && (! (CsrPlugin_mideleg_SE != (1'b0)))))begin
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
  assign _zz_31_ = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign _zz_30_ = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
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
        if(execute_CSR_WRITE_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b000101000010 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 31] = CsrPlugin_scause_interrupt;
        execute_CsrPlugin_readData[3 : 0] = CsrPlugin_scause_exceptionCode;
      end
      12'b111100010001 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[0 : 0] = (1'b1);
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
      12'b001101000001 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mepc;
      end
      12'b001100000010 : begin
        if(execute_CSR_WRITE_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
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
        if(execute_CSR_WRITE_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
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
      12'b111100010011 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[1 : 0] = (2'b11);
      end
      12'b000100000101 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 2] = CsrPlugin_stvec_base;
        execute_CsrPlugin_readData[1 : 0] = CsrPlugin_stvec_mode;
      end
      12'b000101000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[5 : 5] = CsrPlugin_sip_STIP;
        execute_CsrPlugin_readData[1 : 1] = CsrPlugin_sip_SSIP;
        execute_CsrPlugin_readData[9 : 9] = CsrPlugin_sip_SEIP_OR;
      end
      12'b001101000011 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mtval;
      end
      12'b001101000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mscratch;
      end
      12'b111100010010 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[1 : 0] = (2'b10);
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
      12'b000101000011 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_stval;
      end
      12'b000101000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_sscratch;
      end
      12'b000100000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[9 : 9] = CsrPlugin_sie_SEIE;
        execute_CsrPlugin_readData[5 : 5] = CsrPlugin_sie_STIE;
        execute_CsrPlugin_readData[1 : 1] = CsrPlugin_sie_SSIE;
      end
      12'b001101000010 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[31 : 31] = CsrPlugin_mcause_interrupt;
        execute_CsrPlugin_readData[3 : 0] = CsrPlugin_mcause_exceptionCode;
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
    case(_zz_297_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  always @ (*) begin
    debug_bus_cmd_ready = 1'b1;
    IBusCachedPlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(_zz_279_)
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
    if((! _zz_197_))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign IBusCachedPlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign _zz_27_ = ((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0));
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_198_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_198_ == (3'b000))) begin
        _zz_199_ = execute_BranchPlugin_eq;
    end else if((_zz_198_ == (3'b001))) begin
        _zz_199_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_198_ & (3'b101)) == (3'b101)))) begin
        _zz_199_ = (! execute_SRC_LESS);
    end else begin
        _zz_199_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_200_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_200_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_200_ = 1'b1;
      end
      default : begin
        _zz_200_ = _zz_199_;
      end
    endcase
  end

  assign _zz_26_ = _zz_200_;
  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign _zz_201_ = _zz_383_[19];
  always @ (*) begin
    _zz_202_[10] = _zz_201_;
    _zz_202_[9] = _zz_201_;
    _zz_202_[8] = _zz_201_;
    _zz_202_[7] = _zz_201_;
    _zz_202_[6] = _zz_201_;
    _zz_202_[5] = _zz_201_;
    _zz_202_[4] = _zz_201_;
    _zz_202_[3] = _zz_201_;
    _zz_202_[2] = _zz_201_;
    _zz_202_[1] = _zz_201_;
    _zz_202_[0] = _zz_201_;
  end

  assign _zz_203_ = _zz_384_[11];
  always @ (*) begin
    _zz_204_[19] = _zz_203_;
    _zz_204_[18] = _zz_203_;
    _zz_204_[17] = _zz_203_;
    _zz_204_[16] = _zz_203_;
    _zz_204_[15] = _zz_203_;
    _zz_204_[14] = _zz_203_;
    _zz_204_[13] = _zz_203_;
    _zz_204_[12] = _zz_203_;
    _zz_204_[11] = _zz_203_;
    _zz_204_[10] = _zz_203_;
    _zz_204_[9] = _zz_203_;
    _zz_204_[8] = _zz_203_;
    _zz_204_[7] = _zz_203_;
    _zz_204_[6] = _zz_203_;
    _zz_204_[5] = _zz_203_;
    _zz_204_[4] = _zz_203_;
    _zz_204_[3] = _zz_203_;
    _zz_204_[2] = _zz_203_;
    _zz_204_[1] = _zz_203_;
    _zz_204_[0] = _zz_203_;
  end

  assign _zz_205_ = _zz_385_[11];
  always @ (*) begin
    _zz_206_[18] = _zz_205_;
    _zz_206_[17] = _zz_205_;
    _zz_206_[16] = _zz_205_;
    _zz_206_[15] = _zz_205_;
    _zz_206_[14] = _zz_205_;
    _zz_206_[13] = _zz_205_;
    _zz_206_[12] = _zz_205_;
    _zz_206_[11] = _zz_205_;
    _zz_206_[10] = _zz_205_;
    _zz_206_[9] = _zz_205_;
    _zz_206_[8] = _zz_205_;
    _zz_206_[7] = _zz_205_;
    _zz_206_[6] = _zz_205_;
    _zz_206_[5] = _zz_205_;
    _zz_206_[4] = _zz_205_;
    _zz_206_[3] = _zz_205_;
    _zz_206_[2] = _zz_205_;
    _zz_206_[1] = _zz_205_;
    _zz_206_[0] = _zz_205_;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_207_ = {{_zz_202_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_207_ = {_zz_204_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_207_ = {{_zz_206_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_207_;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _zz_24_ = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign _zz_23_ = (execute_PC + (32'b00000000000000000000000000000100));
  assign _zz_22_ = (decode_PC != execute_BRANCH_CALC);
  assign memory_BranchPlugin_predictionMissmatch = ((IBusCachedPlugin_fetchPrediction_cmd_hadBranch != memory_BRANCH_DO) || (memory_BRANCH_DO && memory_TARGET_MISSMATCH2));
  assign IBusCachedPlugin_fetchPrediction_rsp_wasRight = (! memory_BranchPlugin_predictionMissmatch);
  assign IBusCachedPlugin_fetchPrediction_rsp_finalPc = memory_BRANCH_CALC;
  assign IBusCachedPlugin_fetchPrediction_rsp_sourceLastWord = memory_PC;
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && (! memory_arbitration_isStuckByOthers)) && memory_BranchPlugin_predictionMissmatch);
  assign BranchPlugin_jumpInterface_payload = (memory_BRANCH_DO ? memory_BRANCH_CALC : memory_NEXT_PC2);
  assign BranchPlugin_branchExceptionPort_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && memory_BRANCH_CALC[1]);
  assign BranchPlugin_branchExceptionPort_payload_code = (4'b0000);
  assign BranchPlugin_branchExceptionPort_payload_badAddr = memory_BRANCH_CALC;
  assign MmuPlugin_ports_0_cacheHits_0 = ((MmuPlugin_ports_0_cache_0_valid && (MmuPlugin_ports_0_cache_0_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_0_superPage || (MmuPlugin_ports_0_cache_0_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12])));
  assign MmuPlugin_ports_0_cacheHits_1 = ((MmuPlugin_ports_0_cache_1_valid && (MmuPlugin_ports_0_cache_1_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_1_superPage || (MmuPlugin_ports_0_cache_1_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12])));
  assign MmuPlugin_ports_0_cacheHits_2 = ((MmuPlugin_ports_0_cache_2_valid && (MmuPlugin_ports_0_cache_2_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_2_superPage || (MmuPlugin_ports_0_cache_2_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12])));
  assign MmuPlugin_ports_0_cacheHits_3 = ((MmuPlugin_ports_0_cache_3_valid && (MmuPlugin_ports_0_cache_3_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_3_superPage || (MmuPlugin_ports_0_cache_3_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12])));
  assign MmuPlugin_ports_0_cacheHit = ({MmuPlugin_ports_0_cacheHits_3,{MmuPlugin_ports_0_cacheHits_2,{MmuPlugin_ports_0_cacheHits_1,MmuPlugin_ports_0_cacheHits_0}}} != (4'b0000));
  assign _zz_208_ = (MmuPlugin_ports_0_cacheHits_1 || MmuPlugin_ports_0_cacheHits_3);
  assign _zz_209_ = (MmuPlugin_ports_0_cacheHits_2 || MmuPlugin_ports_0_cacheHits_3);
  assign _zz_210_ = {_zz_209_,_zz_208_};
  assign MmuPlugin_ports_0_cacheLine_valid = _zz_246_;
  assign MmuPlugin_ports_0_cacheLine_exception = _zz_247_;
  assign MmuPlugin_ports_0_cacheLine_superPage = _zz_248_;
  assign MmuPlugin_ports_0_cacheLine_virtualAddress_0 = _zz_249_;
  assign MmuPlugin_ports_0_cacheLine_virtualAddress_1 = _zz_250_;
  assign MmuPlugin_ports_0_cacheLine_physicalAddress_0 = _zz_251_;
  assign MmuPlugin_ports_0_cacheLine_physicalAddress_1 = _zz_252_;
  assign MmuPlugin_ports_0_cacheLine_allowRead = _zz_253_;
  assign MmuPlugin_ports_0_cacheLine_allowWrite = _zz_254_;
  assign MmuPlugin_ports_0_cacheLine_allowExecute = _zz_255_;
  assign MmuPlugin_ports_0_cacheLine_allowUser = _zz_256_;
  always @ (*) begin
    MmuPlugin_ports_0_entryToReplace_willIncrement = 1'b0;
    MmuPlugin_ports_1_entryToReplace_willIncrement = 1'b0;
    if(_zz_280_)begin
      if(_zz_281_)begin
        MmuPlugin_ports_0_entryToReplace_willIncrement = 1'b1;
      end
      if(_zz_282_)begin
        MmuPlugin_ports_1_entryToReplace_willIncrement = 1'b1;
      end
    end
  end

  assign MmuPlugin_ports_0_entryToReplace_willClear = 1'b0;
  assign MmuPlugin_ports_0_entryToReplace_willOverflowIfInc = (MmuPlugin_ports_0_entryToReplace_value == (2'b11));
  assign MmuPlugin_ports_0_entryToReplace_willOverflow = (MmuPlugin_ports_0_entryToReplace_willOverflowIfInc && MmuPlugin_ports_0_entryToReplace_willIncrement);
  always @ (*) begin
    MmuPlugin_ports_0_entryToReplace_valueNext = (MmuPlugin_ports_0_entryToReplace_value + _zz_387_);
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
  assign _zz_211_ = (MmuPlugin_ports_1_cacheHits_1 || MmuPlugin_ports_1_cacheHits_3);
  assign _zz_212_ = (MmuPlugin_ports_1_cacheHits_2 || MmuPlugin_ports_1_cacheHits_3);
  assign _zz_213_ = {_zz_212_,_zz_211_};
  assign MmuPlugin_ports_1_cacheLine_valid = _zz_257_;
  assign MmuPlugin_ports_1_cacheLine_exception = _zz_258_;
  assign MmuPlugin_ports_1_cacheLine_superPage = _zz_259_;
  assign MmuPlugin_ports_1_cacheLine_virtualAddress_0 = _zz_260_;
  assign MmuPlugin_ports_1_cacheLine_virtualAddress_1 = _zz_261_;
  assign MmuPlugin_ports_1_cacheLine_physicalAddress_0 = _zz_262_;
  assign MmuPlugin_ports_1_cacheLine_physicalAddress_1 = _zz_263_;
  assign MmuPlugin_ports_1_cacheLine_allowRead = _zz_264_;
  assign MmuPlugin_ports_1_cacheLine_allowWrite = _zz_265_;
  assign MmuPlugin_ports_1_cacheLine_allowExecute = _zz_266_;
  assign MmuPlugin_ports_1_cacheLine_allowUser = _zz_267_;
  assign MmuPlugin_ports_1_entryToReplace_willClear = 1'b0;
  assign MmuPlugin_ports_1_entryToReplace_willOverflowIfInc = (MmuPlugin_ports_1_entryToReplace_value == (2'b11));
  assign MmuPlugin_ports_1_entryToReplace_willOverflow = (MmuPlugin_ports_1_entryToReplace_willOverflowIfInc && MmuPlugin_ports_1_entryToReplace_willIncrement);
  always @ (*) begin
    MmuPlugin_ports_1_entryToReplace_valueNext = (MmuPlugin_ports_1_entryToReplace_value + _zz_389_);
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
  assign MmuPlugin_shared_dBusRsp_pte_V = _zz_390_[0];
  assign MmuPlugin_shared_dBusRsp_pte_R = _zz_391_[0];
  assign MmuPlugin_shared_dBusRsp_pte_W = _zz_392_[0];
  assign MmuPlugin_shared_dBusRsp_pte_X = _zz_393_[0];
  assign MmuPlugin_shared_dBusRsp_pte_U = _zz_394_[0];
  assign MmuPlugin_shared_dBusRsp_pte_G = _zz_395_[0];
  assign MmuPlugin_shared_dBusRsp_pte_A = _zz_396_[0];
  assign MmuPlugin_shared_dBusRsp_pte_D = _zz_397_[0];
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
  assign DBusCachedPlugin_mmuBus_busy = ((MmuPlugin_shared_state_1_ != `MmuPlugin_shared_State_defaultEncoding_IDLE) && (MmuPlugin_shared_portId == (1'b1)));
  assign IBusCachedPlugin_mmuBus_busy = ((MmuPlugin_shared_state_1_ != `MmuPlugin_shared_State_defaultEncoding_IDLE) && (MmuPlugin_shared_portId == (1'b0)));
  assign _zz_21_ = decode_ENV_CTRL;
  assign _zz_18_ = execute_ENV_CTRL;
  assign _zz_16_ = memory_ENV_CTRL;
  assign _zz_19_ = _zz_86_;
  assign _zz_29_ = decode_to_execute_ENV_CTRL;
  assign _zz_28_ = execute_to_memory_ENV_CTRL;
  assign _zz_32_ = memory_to_writeBack_ENV_CTRL;
  assign _zz_14_ = decode_ALU_BITWISE_CTRL;
  assign _zz_12_ = _zz_76_;
  assign _zz_56_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_51_ = _zz_88_;
  assign _zz_11_ = decode_BRANCH_CTRL;
  assign _zz_9_ = _zz_65_;
  assign _zz_25_ = decode_to_execute_BRANCH_CTRL;
  assign _zz_48_ = _zz_70_;
  assign _zz_8_ = decode_ALU_CTRL;
  assign _zz_6_ = _zz_68_;
  assign _zz_54_ = decode_to_execute_ALU_CTRL;
  assign _zz_5_ = decode_SHIFT_CTRL;
  assign _zz_2_ = execute_SHIFT_CTRL;
  assign _zz_3_ = _zz_67_;
  assign _zz_42_ = decode_to_execute_SHIFT_CTRL;
  assign _zz_40_ = execute_to_memory_SHIFT_CTRL;
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
      IBusCachedPlugin_fetchPc_pcReg <= (32'b10000000000000000000000000000000);
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_116_ <= 1'b0;
      _zz_122_ <= 1'b0;
      _zz_124_ <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusCachedPlugin_injector_decodeRemoved <= 1'b0;
      _zz_129_ <= 1'b0;
      _zz_136_ <= 1'b0;
      dBus_rsp_m2sPipe_valid <= 1'b0;
      _zz_162_ <= 1'b1;
      _zz_175_ <= 1'b0;
      memory_MulDivIterativePlugin_div_counter_value <= (6'b000000);
      _zz_191_ <= (2'b11);
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
      _zz_214_ <= (3'b000);
      execute_to_memory_IS_DBUS_SHARING <= 1'b0;
      memory_to_writeBack_IS_DBUS_SHARING <= 1'b0;
      memory_to_writeBack_REGFILE_WRITE_DATA <= (32'b00000000000000000000000000000000);
      memory_to_writeBack_INSTRUCTION <= (32'b00000000000000000000000000000000);
    end else begin
      if(IBusCachedPlugin_fetchPc_propagatePc)begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_predictionPcLoad_valid)begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusCachedPlugin_jump_pcLoad_valid)begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(_zz_277_)begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_samplePcNext)begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      _zz_116_ <= 1'b1;
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        _zz_122_ <= 1'b0;
      end
      if(_zz_120_)begin
        _zz_122_ <= IBusCachedPlugin_iBusRsp_stages_0_output_valid;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
        _zz_124_ <= IBusCachedPlugin_iBusRsp_stages_1_output_valid;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        _zz_124_ <= 1'b0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_stages_1_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= IBusCachedPlugin_injector_nextPcCalc_valids_3;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        IBusCachedPlugin_injector_decodeRemoved <= 1'b1;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || IBusCachedPlugin_fetcherflushIt))begin
        IBusCachedPlugin_injector_decodeRemoved <= 1'b0;
      end
      if(dataCache_1__io_mem_cmd_s2mPipe_ready)begin
        _zz_129_ <= 1'b0;
      end
      if(_zz_283_)begin
        _zz_129_ <= dataCache_1__io_mem_cmd_valid;
      end
      if(dataCache_1__io_mem_cmd_s2mPipe_ready)begin
        _zz_136_ <= dataCache_1__io_mem_cmd_s2mPipe_valid;
      end
      dBus_rsp_m2sPipe_valid <= dBus_rsp_valid;
      _zz_162_ <= 1'b0;
      _zz_175_ <= _zz_174_;
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
      if(_zz_271_)begin
        _zz_191_ <= CsrPlugin_targetPrivilege;
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
      if(_zz_272_)begin
        case(_zz_273_)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= (2'b00);
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
            _zz_191_ <= CsrPlugin_mstatus_MPP;
          end
          2'b01 : begin
            CsrPlugin_sstatus_SPP <= (1'b0);
            CsrPlugin_sstatus_SIE <= CsrPlugin_sstatus_SPIE;
            CsrPlugin_sstatus_SPIE <= 1'b1;
            _zz_191_ <= {(1'b0),CsrPlugin_sstatus_SPP};
          end
          default : begin
          end
        endcase
      end
      MmuPlugin_ports_0_entryToReplace_value <= MmuPlugin_ports_0_entryToReplace_valueNext;
      if(contextSwitching)begin
        if(MmuPlugin_ports_0_cache_0_exception)begin
          MmuPlugin_ports_0_cache_0_valid <= 1'b0;
        end
        if(MmuPlugin_ports_0_cache_1_exception)begin
          MmuPlugin_ports_0_cache_1_valid <= 1'b0;
        end
        if(MmuPlugin_ports_0_cache_2_exception)begin
          MmuPlugin_ports_0_cache_2_valid <= 1'b0;
        end
        if(MmuPlugin_ports_0_cache_3_exception)begin
          MmuPlugin_ports_0_cache_3_valid <= 1'b0;
        end
      end
      MmuPlugin_ports_1_entryToReplace_value <= MmuPlugin_ports_1_entryToReplace_valueNext;
      if(contextSwitching)begin
        if(MmuPlugin_ports_1_cache_0_exception)begin
          MmuPlugin_ports_1_cache_0_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_1_exception)begin
          MmuPlugin_ports_1_cache_1_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_2_exception)begin
          MmuPlugin_ports_1_cache_2_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_3_exception)begin
          MmuPlugin_ports_1_cache_3_valid <= 1'b0;
        end
      end
      case(MmuPlugin_shared_state_1_)
        `MmuPlugin_shared_State_defaultEncoding_IDLE : begin
          if(_zz_284_)begin
            MmuPlugin_shared_busy <= 1'b1;
            MmuPlugin_shared_state_1_ <= `MmuPlugin_shared_State_defaultEncoding_L1_CMD;
          end
          if(_zz_285_)begin
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
      if(_zz_280_)begin
        if(_zz_281_)begin
          if(_zz_286_)begin
            MmuPlugin_ports_0_cache_0_valid <= 1'b1;
          end
          if(_zz_287_)begin
            MmuPlugin_ports_0_cache_1_valid <= 1'b1;
          end
          if(_zz_288_)begin
            MmuPlugin_ports_0_cache_2_valid <= 1'b1;
          end
          if(_zz_289_)begin
            MmuPlugin_ports_0_cache_3_valid <= 1'b1;
          end
        end
        if(_zz_282_)begin
          if(_zz_290_)begin
            MmuPlugin_ports_1_cache_0_valid <= 1'b1;
          end
          if(_zz_291_)begin
            MmuPlugin_ports_1_cache_1_valid <= 1'b1;
          end
          if(_zz_292_)begin
            MmuPlugin_ports_1_cache_2_valid <= 1'b1;
          end
          if(_zz_293_)begin
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
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
      end
      if((! memory_arbitration_isStuck))begin
        execute_to_memory_IS_DBUS_SHARING <= execute_IS_DBUS_SHARING;
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_IS_DBUS_SHARING <= memory_IS_DBUS_SHARING;
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_39_;
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
      case(_zz_214_)
        3'b000 : begin
          if(IBusCachedPlugin_injectionPort_valid)begin
            _zz_214_ <= (3'b001);
          end
        end
        3'b001 : begin
          _zz_214_ <= (3'b010);
        end
        3'b010 : begin
          _zz_214_ <= (3'b011);
        end
        3'b011 : begin
          if((! decode_arbitration_isStuck))begin
            _zz_214_ <= (3'b100);
          end
        end
        3'b100 : begin
          _zz_214_ <= (3'b000);
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
            CsrPlugin_mstatus_MPIE <= _zz_398_[0];
            CsrPlugin_mstatus_MIE <= _zz_399_[0];
            CsrPlugin_sstatus_SPP <= execute_CsrPlugin_writeData[8 : 8];
            CsrPlugin_sstatus_SPIE <= _zz_400_[0];
            CsrPlugin_sstatus_SIE <= _zz_401_[0];
            MmuPlugin_status_mxr <= _zz_402_[0];
            MmuPlugin_status_sum <= _zz_403_[0];
            MmuPlugin_status_mprv <= _zz_404_[0];
          end
        end
        12'b001100000011 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mideleg_SE <= _zz_405_[0];
            CsrPlugin_mideleg_ST <= _zz_406_[0];
            CsrPlugin_mideleg_SS <= _zz_407_[0];
          end
        end
        12'b000101000010 : begin
        end
        12'b111100010001 : begin
        end
        12'b111100010100 : begin
        end
        12'b000100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_sstatus_SPP <= execute_CsrPlugin_writeData[8 : 8];
            CsrPlugin_sstatus_SPIE <= _zz_409_[0];
            CsrPlugin_sstatus_SIE <= _zz_410_[0];
            MmuPlugin_status_mxr <= _zz_411_[0];
            MmuPlugin_status_sum <= _zz_412_[0];
            MmuPlugin_status_mprv <= _zz_413_[0];
          end
        end
        12'b001101000001 : begin
        end
        12'b001100000010 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_medeleg_EU <= _zz_414_[0];
            CsrPlugin_medeleg_II <= _zz_415_[0];
            CsrPlugin_medeleg_LAF <= _zz_416_[0];
            CsrPlugin_medeleg_LPF <= _zz_417_[0];
            CsrPlugin_medeleg_LAM <= _zz_418_[0];
            CsrPlugin_medeleg_SAF <= _zz_419_[0];
            CsrPlugin_medeleg_IAF <= _zz_420_[0];
            CsrPlugin_medeleg_ES <= _zz_421_[0];
            CsrPlugin_medeleg_IPF <= _zz_422_[0];
            CsrPlugin_medeleg_SPF <= _zz_423_[0];
            CsrPlugin_medeleg_SAM <= _zz_424_[0];
            CsrPlugin_medeleg_IAM <= _zz_425_[0];
          end
        end
        12'b001101000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_sip_STIP <= _zz_427_[0];
            CsrPlugin_sip_SSIP <= _zz_428_[0];
            CsrPlugin_sip_SEIP_SOFT <= _zz_429_[0];
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
            MmuPlugin_satp_mode <= _zz_430_[0];
          end
        end
        12'b000101000001 : begin
        end
        12'b111100010011 : begin
        end
        12'b000100000101 : begin
        end
        12'b000101000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_sip_STIP <= _zz_431_[0];
            CsrPlugin_sip_SSIP <= _zz_432_[0];
            CsrPlugin_sip_SEIP_SOFT <= _zz_433_[0];
          end
        end
        12'b001101000011 : begin
        end
        12'b001101000000 : begin
        end
        12'b111100010010 : begin
        end
        12'b001100000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mie_MEIE <= _zz_434_[0];
            CsrPlugin_mie_MTIE <= _zz_435_[0];
            CsrPlugin_mie_MSIE <= _zz_436_[0];
            CsrPlugin_sie_SEIE <= _zz_437_[0];
            CsrPlugin_sie_STIE <= _zz_438_[0];
            CsrPlugin_sie_SSIE <= _zz_439_[0];
          end
        end
        12'b000101000011 : begin
        end
        12'b000101000000 : begin
        end
        12'b000100000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_sie_SEIE <= _zz_440_[0];
            CsrPlugin_sie_STIE <= _zz_441_[0];
            CsrPlugin_sie_SSIE <= _zz_442_[0];
          end
        end
        12'b001101000010 : begin
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
      _zz_125_ <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_0_output_ready)begin
      IBusCachedPlugin_predictor_historyWriteLast_valid <= IBusCachedPlugin_predictor_historyWrite_valid;
      IBusCachedPlugin_predictor_historyWriteLast_payload_address <= IBusCachedPlugin_predictor_historyWrite_payload_address;
      IBusCachedPlugin_predictor_historyWriteLast_payload_data_source <= IBusCachedPlugin_predictor_historyWrite_payload_data_source;
      IBusCachedPlugin_predictor_historyWriteLast_payload_data_branchWish <= IBusCachedPlugin_predictor_historyWrite_payload_data_branchWish;
      IBusCachedPlugin_predictor_historyWriteLast_payload_data_target <= IBusCachedPlugin_predictor_historyWrite_payload_data_target;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
      IBusCachedPlugin_predictor_fetchContext_regNextWhen_hazard <= IBusCachedPlugin_predictor_fetchContext_hazard;
      IBusCachedPlugin_predictor_fetchContext_regNextWhen_hit <= IBusCachedPlugin_predictor_fetchContext_hit;
      IBusCachedPlugin_predictor_fetchContext_regNextWhen_line_source <= IBusCachedPlugin_predictor_fetchContext_line_source;
      IBusCachedPlugin_predictor_fetchContext_regNextWhen_line_branchWish <= IBusCachedPlugin_predictor_fetchContext_line_branchWish;
      IBusCachedPlugin_predictor_fetchContext_regNextWhen_line_target <= IBusCachedPlugin_predictor_fetchContext_line_target;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready)begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    if(_zz_283_)begin
      _zz_130_ <= dataCache_1__io_mem_cmd_payload_wr;
      _zz_131_ <= dataCache_1__io_mem_cmd_payload_address;
      _zz_132_ <= dataCache_1__io_mem_cmd_payload_data;
      _zz_133_ <= dataCache_1__io_mem_cmd_payload_mask;
      _zz_134_ <= dataCache_1__io_mem_cmd_payload_length;
      _zz_135_ <= dataCache_1__io_mem_cmd_payload_last;
    end
    if(dataCache_1__io_mem_cmd_s2mPipe_ready)begin
      _zz_137_ <= dataCache_1__io_mem_cmd_s2mPipe_payload_wr;
      _zz_138_ <= dataCache_1__io_mem_cmd_s2mPipe_payload_address;
      _zz_139_ <= dataCache_1__io_mem_cmd_s2mPipe_payload_data;
      _zz_140_ <= dataCache_1__io_mem_cmd_s2mPipe_payload_mask;
      _zz_141_ <= dataCache_1__io_mem_cmd_s2mPipe_payload_length;
      _zz_142_ <= dataCache_1__io_mem_cmd_s2mPipe_payload_last;
    end
    if(dBus_rsp_valid)begin
      dBus_rsp_m2sPipe_payload_data <= dBus_rsp_payload_data;
      dBus_rsp_m2sPipe_payload_error <= dBus_rsp_payload_error;
    end
    if(_zz_174_)begin
      _zz_176_ <= _zz_57_[11 : 7];
      _zz_177_ <= _zz_92_;
    end
    if((memory_MulDivIterativePlugin_div_counter_value == (6'b100000)))begin
      memory_MulDivIterativePlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_MulDivIterativePlugin_div_done <= 1'b0;
    end
    if(_zz_268_)begin
      if(_zz_269_)begin
        memory_MulDivIterativePlugin_rs1[31 : 0] <= _zz_369_[31:0];
        memory_MulDivIterativePlugin_accumulator[31 : 0] <= ((! _zz_186_[32]) ? _zz_370_ : _zz_371_);
        if((memory_MulDivIterativePlugin_div_counter_value == (6'b100000)))begin
          memory_MulDivIterativePlugin_div_result <= _zz_372_[31:0];
        end
      end
    end
    if(_zz_278_)begin
      memory_MulDivIterativePlugin_accumulator <= (65'b00000000000000000000000000000000000000000000000000000000000000000);
      memory_MulDivIterativePlugin_rs1 <= ((_zz_189_ ? (~ _zz_190_) : _zz_190_) + _zz_378_);
      memory_MulDivIterativePlugin_rs2 <= ((_zz_188_ ? (~ execute_RS2) : execute_RS2) + _zz_380_);
      memory_MulDivIterativePlugin_div_needRevert <= ((_zz_189_ ^ (_zz_188_ && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == (32'b00000000000000000000000000000000)) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_sip_SEIP_INPUT <= externalInterruptS;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    end
    if(_zz_270_)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_196_ ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_196_ ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(CsrPlugin_selfException_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= CsrPlugin_selfException_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= CsrPlugin_selfException_payload_badAddr;
    end
    if(BranchPlugin_branchExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= BranchPlugin_branchExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= BranchPlugin_branchExceptionPort_payload_badAddr;
    end
    if(DBusCachedPlugin_exceptionBus_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= DBusCachedPlugin_exceptionBus_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusCachedPlugin_exceptionBus_payload_badAddr;
    end
    if(_zz_271_)begin
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
        if(_zz_284_)begin
          MmuPlugin_shared_vpn_1 <= IBusCachedPlugin_mmuBus_cmd_virtualAddress[31 : 22];
          MmuPlugin_shared_vpn_0 <= IBusCachedPlugin_mmuBus_cmd_virtualAddress[21 : 12];
          MmuPlugin_shared_portId <= (1'b0);
        end
        if(_zz_285_)begin
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
    if(_zz_280_)begin
      if(_zz_281_)begin
        if(_zz_286_)begin
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
        if(_zz_287_)begin
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
        if(_zz_288_)begin
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
        if(_zz_289_)begin
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
      if(_zz_282_)begin
        if(_zz_290_)begin
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
        if(_zz_291_)begin
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
        if(_zz_292_)begin
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
        if(_zz_293_)begin
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
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_105_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_104_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= _zz_47_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_20_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_17_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_15_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= _zz_50_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_SFENCE_VMA <= decode_IS_SFENCE_VMA;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_13_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
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
      decode_to_execute_MEMORY_LRSC <= decode_MEMORY_LRSC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= _zz_46_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= execute_PC;
    end
    if(((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack)))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_TARGET_MISSMATCH2 <= execute_TARGET_MISSMATCH2;
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
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_NEXT_PC2 <= execute_NEXT_PC2;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_MANAGMENT <= decode_MEMORY_MANAGMENT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
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
      decode_to_execute_PREDICTION_CONTEXT_hazard <= decode_PREDICTION_CONTEXT_hazard;
      decode_to_execute_PREDICTION_CONTEXT_hit <= decode_PREDICTION_CONTEXT_hit;
      decode_to_execute_PREDICTION_CONTEXT_line_source <= decode_PREDICTION_CONTEXT_line_source;
      decode_to_execute_PREDICTION_CONTEXT_line_branchWish <= decode_PREDICTION_CONTEXT_line_branchWish;
      decode_to_execute_PREDICTION_CONTEXT_line_target <= decode_PREDICTION_CONTEXT_line_target;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PREDICTION_CONTEXT_hazard <= execute_PREDICTION_CONTEXT_hazard;
      execute_to_memory_PREDICTION_CONTEXT_hit <= execute_PREDICTION_CONTEXT_hit;
      execute_to_memory_PREDICTION_CONTEXT_line_source <= execute_PREDICTION_CONTEXT_line_source;
      execute_to_memory_PREDICTION_CONTEXT_line_branchWish <= execute_PREDICTION_CONTEXT_line_branchWish;
      execute_to_memory_PREDICTION_CONTEXT_line_target <= execute_PREDICTION_CONTEXT_line_target;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_10_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_AMO <= decode_MEMORY_AMO;
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
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_7_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_4_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_1_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_38_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    case(execute_CsrPlugin_csrAddress)
      12'b001100000000 : begin
      end
      12'b001100000011 : begin
      end
      12'b000101000010 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_scause_interrupt <= _zz_408_[0];
          CsrPlugin_scause_exceptionCode <= execute_CsrPlugin_writeData[3 : 0];
        end
      end
      12'b111100010001 : begin
      end
      12'b111100010100 : begin
      end
      12'b000100000000 : begin
      end
      12'b001101000001 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mepc <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b001100000010 : begin
      end
      12'b001101000100 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mip_MSIP <= _zz_426_[0];
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
      12'b111100010011 : begin
      end
      12'b000100000101 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_stvec_base <= execute_CsrPlugin_writeData[31 : 2];
          CsrPlugin_stvec_mode <= execute_CsrPlugin_writeData[1 : 0];
        end
      end
      12'b000101000100 : begin
      end
      12'b001101000011 : begin
      end
      12'b001101000000 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mscratch <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b111100010010 : begin
      end
      12'b001100000100 : begin
      end
      12'b000101000011 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_stval <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b000101000000 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_sscratch <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b000100000100 : begin
      end
      12'b001101000010 : begin
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
    DebugPlugin_isPipBusy <= (({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != (4'b0000)) || IBusCachedPlugin_incomingInstruction);
    if(writeBack_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= _zz_92_;
    end
    _zz_197_ <= debug_bus_cmd_payload_address[2];
    if(_zz_274_)begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @ (posedge clk or posedge debugReset) begin
    if (debugReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
    end else begin
      if((DebugPlugin_haltIt && (! DebugPlugin_isPipBusy)))begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid)begin
        case(_zz_279_)
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
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_godmode <= 1'b0;
              end
            end
          end
          6'b000001 : begin
          end
          default : begin
          end
        endcase
      end
      if(_zz_274_)begin
        if(_zz_275_)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(_zz_276_)begin
        if(decode_arbitration_isValid)begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
    end
  end

endmodule

