# Memory Units

## Regfile
The full OpenLane flow is performed. According to reports/signoff/25-rcx_sta.rpt file:

### No Violations


25-rcx_sta.rpt file shows there is no max slew or max cap violation :

```shell
===========================================================================
 report_check_types -max_slew -max_cap -max_fanout -violators
============================================================================
max fanout

Pin                                   Limit Fanout  Slack
---------------------------------------------------------
_5957_/X                                 10     24    -14 (VIOLATED)
input40/X                                10     24    -14 (VIOLATED)
_5167_/X                                 10     19     -9 (VIOLATED)
_4690_/X                                 10     17     -7 (VIOLATED)
_5627_/X                                 10     17     -7 (VIOLATED)
_5681_/X                                 10     17     -7 (VIOLATED)
_5762_/X                                 10     17     -7 (VIOLATED)
_4466_/X                                 10     16     -6 (VIOLATED)
clkbuf_0_clk/X                           10     16     -6 (VIOLATED)
_4671_/X                                 10     15     -5 (VIOLATED)
_5396_/X                                 10     15     -5 (VIOLATED)
clkbuf_leaf_61_clk/X                     10     15     -5 (VIOLATED)
_4669_/X                                 10     14     -4 (VIOLATED)
_4723_/X                                 10     14     -4 (VIOLATED)
clkbuf_leaf_114_clk/X                    10     14     -4 (VIOLATED)
clkbuf_leaf_22_clk/X                     10     14     -4 (VIOLATED)
clkbuf_leaf_5_clk/X                      10     14     -4 (VIOLATED)
_4558_/X                                 10     13     -3 (VIOLATED)
_4654_/X                                 10     13     -3 (VIOLATED)
_4672_/X                                 10     13     -3 (VIOLATED)
_4708_/X                                 10     13     -3 (VIOLATED)
_4750_/X                                 10     13     -3 (VIOLATED)
_4926_/X                                 10     13     -3 (VIOLATED)
_5788_/X                                 10     13     -3 (VIOLATED)
_6277_/X                                 10     13     -3 (VIOLATED)
clkbuf_leaf_31_clk/X                     10     13     -3 (VIOLATED)
clkbuf_leaf_39_clk/X                     10     13     -3 (VIOLATED)
clkbuf_leaf_45_clk/X                     10     13     -3 (VIOLATED)
clkbuf_leaf_49_clk/X                     10     13     -3 (VIOLATED)
_4402_/X                                 10     12     -2 (VIOLATED)
_4704_/X                                 10     12     -2 (VIOLATED)
_4707_/X                                 10     12     -2 (VIOLATED)
_4756_/X                                 10     12     -2 (VIOLATED)
_4759_/X                                 10     12     -2 (VIOLATED)
_4792_/X                                 10     12     -2 (VIOLATED)
_5251_/X                                 10     12     -2 (VIOLATED)
_6221_/X                                 10     12     -2 (VIOLATED)
_6445_/X                                 10     12     -2 (VIOLATED)
clkbuf_leaf_11_clk/X                     10     12     -2 (VIOLATED)
clkbuf_leaf_17_clk/X                     10     12     -2 (VIOLATED)
clkbuf_leaf_93_clk/X                     10     12     -2 (VIOLATED)
_4326_/X                                 10     11        (VIOLATED)
_4329_/X                                 10     11        (VIOLATED)
_4364_/X                                 10     11        (VIOLATED)
_4371_/X                                 10     11        (VIOLATED)
_4380_/X                                 10     11        (VIOLATED)
_4392_/X                                 10     11        (VIOLATED)
_4408_/X                                 10     11        (VIOLATED)
_4420_/X                                 10     11        (VIOLATED)
_4436_/X                                 10     11        (VIOLATED)
_4565_/X                                 10     11        (VIOLATED)
_4591_/X                                 10     11        (VIOLATED)
_4606_/X                                 10     11        (VIOLATED)
_4652_/X                                 10     11        (VIOLATED)
_4659_/X                                 10     11        (VIOLATED)
_4712_/X                                 10     11        (VIOLATED)
_4717_/X                                 10     11        (VIOLATED)
_4747_/X                                 10     11        (VIOLATED)
_4748_/X                                 10     11        (VIOLATED)
_4752_/X                                 10     11        (VIOLATED)
_4853_/X                                 10     11        (VIOLATED)
_4881_/X                                 10     11        (VIOLATED)
_4996_/X                                 10     11        (VIOLATED)
_5185_/X                                 10     11        (VIOLATED)
_5252_/X                                 10     11        (VIOLATED)
_5266_/X                                 10     11        (VIOLATED)
_5307_/X                                 10     11        (VIOLATED)
_5310_/X                                 10     11        (VIOLATED)
_6095_/X                                 10     11        (VIOLATED)
_6517_/X                                 10     11        (VIOLATED)
_6843_/X                                 10     11        (VIOLATED)
_7236_/X                                 10     11        (VIOLATED)
_8516_/X                                 10     11        (VIOLATED)
clkbuf_leaf_101_clk/X                    10     11        (VIOLATED)
clkbuf_leaf_18_clk/X                     10     11        (VIOLATED)
clkbuf_leaf_34_clk/X                     10     11        (VIOLATED)
clkbuf_leaf_37_clk/X                     10     11        (VIOLATED)
clkbuf_leaf_56_clk/X                     10     11        (VIOLATED)
clkbuf_leaf_81_clk/X                     10     11        (VIOLATED)
clkbuf_leaf_87_clk/X                     10     11        (VIOLATED)
clkbuf_leaf_94_clk/X                     10     11        (VIOLATED)


===========================================================================
max slew violation count 0
max fanout violation count 81
max cap violation count 0
============================================================================
```

### Results

- Design area 82279 u^2 9% utilization.
According to worst_slack reports:

```shell
===========================================================================
 report_worst_slack -max (Setup)
============================================================================
worst slack 1.75

===========================================================================
 report_worst_slack -min (Hold)
============================================================================
worst slack 0.30
```

As the worst slack from hold can be 0.30 the minimum clock period can be 10.30 ns which makes 97MHz the maximum clock frequency.



```shell
===========================================================================
report_checks -unconstrained
============================================================================
Startpoint: rst (input port clocked by clk)
Endpoint: _9279_ (recovery check against rising-edge clock clk)
Path Group: **async_default**
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                          0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (propagated)
                          2.00    2.00 ^ input external delay
                  0.03    0.02    2.02 ^ rst (in)
     1    0.01                           rst (net)
                  0.03    0.00    2.02 ^ input11/A (sky130_fd_sc_hd__buf_6)
                  0.22    0.21    2.23 ^ input11/X (sky130_fd_sc_hd__buf_6)
     4    0.11                           net11 (net)
                  0.23    0.04    2.27 ^ fanout246/A (sky130_fd_sc_hd__clkbuf_4)
                  0.24    0.35    2.62 ^ fanout246/X (sky130_fd_sc_hd__clkbuf_4)
     5    0.08                           net246 (net)
                  0.25    0.01    2.64 ^ fanout193/A (sky130_fd_sc_hd__buf_2)
                  0.22    0.31    2.95 ^ fanout193/X (sky130_fd_sc_hd__buf_2)
     5    0.05                           net193 (net)
                  0.22    0.00    2.95 ^ fanout178/A (sky130_fd_sc_hd__buf_2)
                  0.25    0.33    3.28 ^ fanout178/X (sky130_fd_sc_hd__buf_2)
     7    0.05                           net178 (net)
                  0.25    0.00    3.28 ^ fanout177/A (sky130_fd_sc_hd__clkbuf_4)
                  0.18    0.32    3.60 ^ fanout177/X (sky130_fd_sc_hd__clkbuf_4)
    10    0.06                           net177 (net)
                  0.18    0.00    3.60 ^ fanout176/A (sky130_fd_sc_hd__clkbuf_4)
                  0.17    0.29    3.89 ^ fanout176/X (sky130_fd_sc_hd__clkbuf_4)
    10    0.05                           net176 (net)
                  0.17    0.00    3.89 ^ _9279_/RESET_B (sky130_fd_sc_hd__dfrtp_1)
                                  3.89   data arrival time

                         10.00   10.00   clock clk (rise edge)
                          0.00   10.00   clock source latency
                  0.32    0.22   10.22 ^ clk (in)
     2    0.07                           clk (net)
                  0.32    0.00   10.22 ^ clkbuf_0_clk/A (sky130_fd_sc_hd__clkbuf_16)
                  0.28    0.36   10.58 ^ clkbuf_0_clk/X (sky130_fd_sc_hd__clkbuf_16)
    16    0.27                           clknet_0_clk (net)
                  0.28    0.01   10.59 ^ clkbuf_4_8_0_clk/A (sky130_fd_sc_hd__clkbuf_8)
                  0.19    0.29   10.88 ^ clkbuf_4_8_0_clk/X (sky130_fd_sc_hd__clkbuf_8)
     8    0.11                           clknet_4_8_0_clk (net)
                  0.19    0.01   10.89 ^ clkbuf_leaf_16_clk/A (sky130_fd_sc_hd__clkbuf_16)
                  0.05    0.17   11.06 ^ clkbuf_leaf_16_clk/X (sky130_fd_sc_hd__clkbuf_16)
     8    0.03                           clknet_leaf_16_clk (net)
                  0.05    0.00   11.06 ^ _9279_/CLK (sky130_fd_sc_hd__dfrtp_1)
                         -0.25   10.81   clock uncertainty
                          0.00   10.81   clock reconvergence pessimism
                          0.20   11.01   library recovery time
                                 11.01   data required time
-----------------------------------------------------------------------------
                                 11.01   data required time
                                 -3.89   data arrival time
-----------------------------------------------------------------------------
                                  7.13   slack (MET)


Startpoint: rd_addr0[2] (input port clocked by clk)
Endpoint: rd_dout0[10] (output port clocked by clk)
Path Group: clk
Path Type: max

Fanout     Cap    Slew   Delay    Time   Description
-----------------------------------------------------------------------------
                          0.00    0.00   clock clk (rise edge)
                          0.00    0.00   clock network delay (propagated)
                          2.00    2.00 ^ input external delay
                  0.04    0.02    2.02 ^ rd_addr0[2] (in)
     1    0.01                           rd_addr0[2] (net)
                  0.04    0.00    2.02 ^ input3/A (sky130_fd_sc_hd__buf_6)
                  0.25    0.24    2.26 ^ input3/X (sky130_fd_sc_hd__buf_6)
     9    0.12                           net3 (net)
                  0.25    0.02    2.29 ^ _4854_/A (sky130_fd_sc_hd__buf_2)
                  0.23    0.32    2.60 ^ _4854_/X (sky130_fd_sc_hd__buf_2)
    10    0.05                           _1516_ (net)
                  0.23    0.00    2.60 ^ _4856_/A_N (sky130_fd_sc_hd__and2b_1)
                  0.15    0.33    2.94 v _4856_/X (sky130_fd_sc_hd__and2b_1)
     6    0.03                           _1518_ (net)
                  0.15    0.00    2.94 v _4936_/A (sky130_fd_sc_hd__and2_1)
                  0.14    0.29    3.23 v _4936_/X (sky130_fd_sc_hd__and2_1)
     4    0.03                           _1597_ (net)
                  0.14    0.00    3.23 v _4937_/A (sky130_fd_sc_hd__clkbuf_4)
                  0.15    0.29    3.52 v _4937_/X (sky130_fd_sc_hd__clkbuf_4)
    10    0.07                           _1598_ (net)
                  0.15    0.01    3.53 v _5241_/A2 (sky130_fd_sc_hd__a2111o_1)
                  0.08    0.48    4.01 v _5241_/X (sky130_fd_sc_hd__a2111o_1)
     1    0.01                           _1893_ (net)
                  0.08    0.00    4.01 v _5255_/B (sky130_fd_sc_hd__or4_1)
                  0.11    0.57    4.58 v _5255_/X (sky130_fd_sc_hd__or4_1)
     1    0.01                           _1907_ (net)
                  0.11    0.00    4.58 v _5269_/A (sky130_fd_sc_hd__or4_2)
                  0.21    0.89    5.47 v _5269_/X (sky130_fd_sc_hd__or4_2)
     1    0.04                           _1921_ (net)
                  0.21    0.00    5.47 v _5270_/A (sky130_fd_sc_hd__buf_4)
                  0.10    0.29    5.76 v _5270_/X (sky130_fd_sc_hd__buf_4)
     1    0.08                           net51 (net)
                  0.11    0.02    5.78 v output51/A (sky130_fd_sc_hd__buf_2)
                  0.09    0.22    6.00 v output51/X (sky130_fd_sc_hd__buf_2)
     1    0.03                           rd_dout0[10] (net)
                  0.09    0.00    6.00 v rd_dout0[10] (out)
                                  6.00   data arrival time

                         10.00   10.00   clock clk (rise edge)
                          0.00   10.00   clock network delay (propagated)
                         -0.25    9.75   clock uncertainty
                          0.00    9.75   clock reconvergence pessimism
                         -2.00    7.75   output external delay
                                  7.75   data required time
-----------------------------------------------------------------------------
                                  7.75   data required time
                                 -6.00   data arrival time
-----------------------------------------------------------------------------
                                  1.75   slack (MET)



===========================================================================
report_checks --slack_max -0.01
============================================================================
No paths found.
```

The critical path is caused by the reading of the memory. Reset takes less time, almost half of reading the memory. 
The reason for the critical path is high fan-in. Despite the synthesizer made use of buffers and used smaller input sized logic gates, to read 32 registers and direct it to the output requires high overall fan-in.


