<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="IN_2" />
        <signal name="IN_1" />
        <signal name="IN_0" />
        <signal name="OUT_0" />
        <signal name="OUT_1" />
        <signal name="OUT_2" />
        <signal name="OUT_3" />
        <port polarity="Input" name="IN_2" />
        <port polarity="Input" name="IN_1" />
        <port polarity="Input" name="IN_0" />
        <port polarity="Output" name="OUT_0" />
        <port polarity="Output" name="OUT_1" />
        <port polarity="Output" name="OUT_2" />
        <port polarity="Output" name="OUT_3" />
        <blockdef name="lut3">
            <timestamp>2007-4-25T21:45:29</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <rect width="256" x="64" y="-384" height="320" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="and3b2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="40" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="52" cy="-128" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
        </blockdef>
        <block symbolname="lut3" name="XLXI_7">
            <attr value="23" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 8 h" />
            </attr>
            <blockpin signalname="IN_0" name="I0" />
            <blockpin signalname="IN_1" name="I1" />
            <blockpin signalname="IN_2" name="I2" />
            <blockpin signalname="OUT_0" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_8">
            <blockpin signalname="IN_2" name="I" />
            <blockpin signalname="OUT_1" name="O" />
        </block>
        <block symbolname="and3b2" name="XLXI_9">
            <blockpin signalname="IN_1" name="I0" />
            <blockpin signalname="IN_2" name="I1" />
            <blockpin signalname="IN_0" name="I2" />
            <blockpin signalname="OUT_2" name="O" />
        </block>
        <block symbolname="lut3" name="XLXI_12">
            <attr value="24" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 8 h" />
            </attr>
            <blockpin signalname="IN_0" name="I0" />
            <blockpin signalname="IN_1" name="I1" />
            <blockpin signalname="IN_2" name="I2" />
            <blockpin signalname="OUT_3" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="896" y="1088" name="XLXI_7" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-472" type="instance" />
        </instance>
        <instance x="896" y="1936" name="XLXI_12" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-472" type="instance" />
        </instance>
        <instance x="960" y="1456" name="XLXI_9" orien="R0" />
        <instance x="960" y="1184" name="XLXI_8" orien="R0" />
        <branch name="IN_2">
            <wire x2="752" y1="832" y2="832" x1="576" />
            <wire x2="800" y1="832" y2="832" x1="752" />
            <wire x2="832" y1="832" y2="832" x1="800" />
            <wire x2="896" y1="832" y2="832" x1="832" />
            <wire x2="832" y1="832" y2="1152" x1="832" />
            <wire x2="912" y1="1152" y2="1152" x1="832" />
            <wire x2="960" y1="1152" y2="1152" x1="912" />
            <wire x2="800" y1="832" y2="1328" x1="800" />
            <wire x2="960" y1="1328" y2="1328" x1="800" />
            <wire x2="752" y1="832" y2="1680" x1="752" />
            <wire x2="896" y1="1680" y2="1680" x1="752" />
        </branch>
        <branch name="IN_1">
            <wire x2="736" y1="896" y2="896" x1="576" />
            <wire x2="784" y1="896" y2="896" x1="736" />
            <wire x2="896" y1="896" y2="896" x1="784" />
            <wire x2="784" y1="896" y2="1392" x1="784" />
            <wire x2="960" y1="1392" y2="1392" x1="784" />
            <wire x2="736" y1="896" y2="1744" x1="736" />
            <wire x2="896" y1="1744" y2="1744" x1="736" />
        </branch>
        <branch name="IN_0">
            <wire x2="720" y1="960" y2="960" x1="576" />
            <wire x2="816" y1="960" y2="960" x1="720" />
            <wire x2="896" y1="960" y2="960" x1="816" />
            <wire x2="816" y1="960" y2="1264" x1="816" />
            <wire x2="960" y1="1264" y2="1264" x1="816" />
            <wire x2="720" y1="960" y2="1808" x1="720" />
            <wire x2="896" y1="1808" y2="1808" x1="720" />
        </branch>
        <iomarker fontsize="28" x="576" y="832" name="IN_2" orien="R180" />
        <iomarker fontsize="28" x="576" y="896" name="IN_1" orien="R180" />
        <iomarker fontsize="28" x="576" y="960" name="IN_0" orien="R180" />
        <branch name="OUT_0">
            <wire x2="1312" y1="896" y2="896" x1="1280" />
        </branch>
        <iomarker fontsize="28" x="1312" y="896" name="OUT_0" orien="R0" />
        <branch name="OUT_1">
            <wire x2="1200" y1="1152" y2="1152" x1="1184" />
            <wire x2="1312" y1="1152" y2="1152" x1="1200" />
        </branch>
        <branch name="OUT_2">
            <wire x2="1232" y1="1328" y2="1328" x1="1216" />
            <wire x2="1312" y1="1328" y2="1328" x1="1232" />
        </branch>
        <branch name="OUT_3">
            <wire x2="1296" y1="1744" y2="1744" x1="1280" />
            <wire x2="1312" y1="1744" y2="1744" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1312" y="1152" name="OUT_1" orien="R0" />
        <iomarker fontsize="28" x="1312" y="1328" name="OUT_2" orien="R0" />
        <iomarker fontsize="28" x="1312" y="1744" name="OUT_3" orien="R0" />
    </sheet>
</drawing>