Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75960470135;
	Tue, 13 Oct 2026 09:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884910; cv=none; b=S0z1h6uVxoD5obeuis7M1dI/pYx+NiRxzMojpOQvTa7l4K+EiaJotEMxiii2vZbWsP45OqDq6bfvHa+Ji2wFjWS7W7sAiOUaeqvQRopa2hDgJQb6bs0kUErbZ4ZqTWQAuj3DDK6GC7XIHTmfq5uexs0bpCTqsw2iN3VmiidX4AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884910; c=relaxed/simple;
	bh=ZMzYql+eTPhwIaprwxe8Tk0FIQNw2DXddI0uo8tIaXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OYKaZRKM7fh6BlXgTtNKLyfHbJFaaneyc5s6RjYO5DBHM6RGJLG5qxesssjMW7T97YOGczOoEzyUUT/LpEtxue0iuD15++TP7BS0J+If+dvWg0HdL5UHcLXCOXUdVFqBTdbF4kna3HJNGYgCgtMgy3Y2TKzzcxCqMAZPzrvQOTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbfDqsif; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbfDqsif"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xvO7790919;
	Tue, 13 Oct 2026 09:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hAR58t+8Ey2kwl+lOWw66wIhet7Ku2N5Gq9T6/zQkJg=; b=BbfDqsifNMHWE4YD
	hX+BwI+YQTKZZOguoznl+ecrGo1rjeSHOcQaw5pgweUy5ALfJGhl/nJyQ1CzARe9
	H42/G8oNsRgWP6a/X0xFdhZeLFJtVZsMa9ZnIDKBPNcH+Cl0rr0MzPjbFhWgr/7w
	zanQUEeNp7LMZLjKpMptmZoLteUJlTVvb3wp3cliNmOv3pdBGFzBHc0WbBt3i5fA
	sREUU5jjnpEF+JNpw5V161ScG7MQkvROyqeAxFx9/e1t9v1doo7b1oAv3RUmYLZC
	ITsTjoIQWRcp+bky0btN/0e6YzFs1K71IlHC26kqebf8lawssS5bkDH2roZ0sa10
	OBECTQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjr6w8-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 09:48:12 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69D5pmoQ651504;
	Tue, 13 Oct 2026 05:51:48 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 69D5plAR651483;
	Tue, 13 Oct 2026 05:51:47 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:21:24 +0530
Subject: [PATCH v9 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add
 binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-b4-qaif-shikra-audio-v9-1-f3022e28f2fd@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfX1sP3aKK20La/
 CKThpItedhm/7pZt7gtU5Uzeaz86CDhbKuDBC/rYjswhv/mv2db5fJ6/9qtg9pwgcJ2kSBCP2ty
 WEEYTqT9fs+agrREmekn1DGYsBn5lXg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfXxgqZg+Cee1MI
 J4jt1bgfozpMzQWqzW/IQ/7kfO/GPPMkbedfELDV86CcBVZd5uWismDu2QbbDJVos4tF1ndOvCS
 ejMkV13wcX7glQs82gw6KJN6duTga6LqkygZylWyrFSaBZjnk7rSaDeZ4M5qREe3FdFf7U1NeiJ
 WEAScmU78PRnK8KO8/r/37oury6Aej9FZytZaS5PNzIGIKC6+OozAKpknZDoT6BweKVN/EX801q
 fg/fe4QXWySXgDf1aRAF9a3y81V+BChomz+E1qvtxTolLETzoXbSpaaeZ5c5E1SWhAHbZ549zYC
 TI01PL4xQUSEsJsR1EBxuOHPiZnrHgPl1PZxXx6XrOD7QGC3IqY7PhLoqLfeLjA7Sul3RlTMrkZ
 sstn7pq/MITyBacyigvdZ0yPFiSZoOpTkQATuGr7r5LsZ/tBs23qaKHAwyTu5jJ/LRYQp/JiMhI
 xRgafxTB2v8udHgIrVQ==
X-Proofpoint-ORIG-GUID: GNbqad-jRU3ZSnjVcOGHPSKDmlcLO_Nj
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6acdfe5c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=zGZ061LBWJILYB03ySQA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: GNbqad-jRU3ZSnjVcOGHPSKDmlcLO_Nj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130038

Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
controller used on the Shikra audio platform.

QAIF routes audio between system memory, external PCM/TDM/MI2S serial
interfaces and the internal Bolero/WCD codec. Platform Devicetree files
need a binding to describe the controller resources, DAI cells and per-
interface AIF configuration, and named constants to avoid raw numeric IDs
in sound-dai references and child-node reg values.

Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
aif-interface child nodes required by the controller.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 .../bindings/sound/qcom,shikra-qaif-cpu.yaml       | 290 +++++++++++++++++++++
 1 file changed, 290 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
new file mode 100644
index 000000000000..acca6f617751
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
@@ -0,0 +1,290 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,shikra-qaif-cpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Audio Interface (QAIF) CPU DAI Controller
+
+maintainers:
+  - Harendra Gautam <harendra.gautam@oss.qualcomm.com>
+
+description: |
+  The Qualcomm Audio Interface (QAIF) is a fully configurable DMA-based
+  audio subsystem controller. It serialises and deserialises PCM audio
+  between system memory and external serial audio peripherals (PCM, TDM,
+  I2S, MI2S) through the AIF path, and transfers parallel audio between
+  memory and an internal WCD codec through the CIF path.
+
+  AIF (Audio Interface): up to 13 multi-lane Unified Audio Interfaces,
+  each supporting up to 8 independent data lanes. Each lane is individually
+  configurable as TX (output/speaker) or RX (input/mic). All lanes of an
+  interface share a single bit clock and frame sync. Supported modes are
+  PCM (short/long sync), TDM, and MI2S (stereo/mono). Per-interface
+  configuration includes sync source (master/slave), sync mode, sync delay,
+  sync inversion, slot width (8/16/24/32-bit), sample width, active slot
+  masks (up to 32 slots), bits-per-lane frame size, lane enable/direction
+  masks, loopback, output-enable control, and full-cycle path support for
+  long chip-to-chip connections.
+
+  CIF (Codec Interface): up to 10 RDDMA (playback) and 10 WRDMA (capture)
+  channels connecting to an internal codec over a parallel bus. Each channel
+  supports active-channel enable mask (up to 16 channels), frame-sync
+  selection, frame-sync delay, frame-sync output gating, dynamic clock
+  gating, and 16-bit packing/unpacking.
+
+  Note on RX/TX naming convention: in QAIF, TX refers to the output
+  (speaker/playback) direction and RX refers to the input (mic/capture)
+  direction. This applies to both AIF lane directions and CIF slot/mask
+  properties.
+
+  DMA engine: RDDMA fetches audio from DDR/TCM/LPM into a shared SRAM
+  latency buffer (SHRAM) and drains it to the interface. WRDMA collects
+  data from the interface into SHRAM and writes it to memory. Each DMA
+  owns a private SHRAM region defined by start address and length registers.
+  Burst sizes of 1/2/4/8/16 beats (64-bit) are supported with up to 4
+  outstanding transactions per DMA. Two QSB master ports (QXM0 for TCM,
+  QXM1 for DDR/LPM) provide the memory interface.
+
+  Resources are partitioned among up to 5 Execution Engines (EEs) via
+  EE map registers. Each EE owns a set of DMAs, audio interfaces, and
+  interface groups, and receives its own independent interrupt output.
+  The interrupt hierarchy has a two-level structure: a summary register
+  identifies the event class (DMA period, underflow/overflow, error
+  response, audio interface underflow/overflow, group done, rate detector,
+  VFR), and per-resource status registers identify the specific channel.
+
+  Interface grouping (bonding) allows up to 6 groups of audio and codec
+  interfaces to start synchronously and align their DMA period interrupts
+  within half a frame duration using the RDDMA padding feature.
+
+  Two rate detector blocks measure the frequency of incoming frame sync or
+  word select signals and generate interrupts on rate change, undetected
+  rate, or sync timeout.
+
+  Block diagram::
+
+    System Memory (DDR / LPM / TCM)
+    +---------------------------------+
+    |  Circular Buffers (ping-pong)   |
+    +----------+----------+-----------+
+               |          ^
+         64-bit AXI  64-bit AXI
+               |          |
+    +----------v----------+-----------+
+    |        QSB Master Ports         |
+    |  +----------+  +----------+     |
+    |  |   QXM0   |  |   QXM1   |     |
+    |  +----+-----+  +-----+----+     |
+    +-------|--------------|----------+
+            |              |
+    +-------v--------------v----------+
+    |         Shared RAM (SHRAM)       |
+    |  +------------+  +------------+ |
+    |  | QXM0 Read  |  | QXM0 Write | |
+    |  | SHRAM      |  | SHRAM      | |
+    |  +------------+  +------------+ |
+    |  +------------+  +------------+ |
+    |  | QXM1 Read  |  | QXM1 Write | |
+    |  | SHRAM      |  | SHRAM      | |
+    |  +------------+  +------------+ |
+    +---+--------+--------+-------+---+
+        |        |        |       |
+    +---v--+  +--v---+ +--v---+ +-v----+
+    |RDDMA |  |RDDMA | |WRDMA | |WRDMA |
+    | AIF  |  | CIF  | | AIF  | | CIF  |
+    |[0..n]|  |[0..n]| |[0..n]| |[0..n]|
+    +--+---+  +--+---+ +--+---+ +-+----+
+       |         |       ^          ^
+       | TX      | TX    | RX       | RX
+       v         v       |          |
+    +--+--------------------+  +----+----------+
+    |  Unified Audio Intf   |  | Codec DMA     |
+    |  (AIF 0..12)          |  | Interface     |
+    |                       |  | (CIF)         |
+    |  AUD_INTFa block:     |  |               |
+    |  - Serializer (TX)    |  | RDDMA: DDR -> |
+    |  - De-serializer (RX) |  |   internal    |
+    |  - Sync gen/detect    |  |   codec       |
+    |  - Up to 8 data lanes |  | WRDMA: codec  |
+    |  - PCM / TDM / MI2S   |  |   -> DDR      |
+    |  - Near Pad Logic     |  | Up to 16 ch   |
+    +--+--------------------+  +----+----------+
+       |  Lane 0..7 (TX/RX)       |  Parallel bus
+       |  Bit clk + Frame sync    |  + Frame sync
+       v                          v
+    +--+--------+          +------+------+
+    | External  |          | Internal    |
+    | Serial    |          | Digital     |
+    | Peripherals|         | Codec       |
+    | (PCM/TDM/ |          | (Bolero/    |
+    |  MI2S)    |          |  WCD)       |
+    +-----------+          +-------------+
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,shikra-qaif-cpu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      QAIF summary interrupt for this Execution Engine.
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+  clocks:
+    maxItems: 9
+
+  clock-names:
+    description:
+      Core clocks for register access and DMA, followed by one bit
+      clock per AIF interface.
+    items:
+      - const: lpass_config
+      - const: lpass_core_axim
+      - const: aud_dma
+      - const: aud_dma_mem
+      - const: bus
+      - const: aif_if0_ibit
+      - const: aif_if1_ibit
+      - const: aif_if2_ibit
+      - const: aif_if3_ibit
+
+  '#sound-dai-cells':
+    const: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^aif@[0-9a-f]+$':
+    type: object
+    description:
+      QAIF AIF interface child node for PCM, TDM or MI2S configuration.
+
+    allOf:
+      - $ref: /schemas/sound/tdm-slot.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          DAI ID of the AIF interface (QAIF_MI2S_AIF* or QAIF_TDM_AIF*).
+
+      dai-format:
+        description: Serial audio interface format (MI2S, TDM or PCM).
+        enum: [i2s, dsp_a, dsp_b]
+
+      dai-tdm-slot-width:
+        enum: [8, 16, 24, 32]
+
+      dai-tdm-slot-num:
+        minimum: 1
+        maximum: 32
+
+      dai-tdm-slot-rx-mask:
+        minItems: 1
+        maxItems: 32
+
+      dai-tdm-slot-tx-mask:
+        minItems: 1
+        maxItems: 32
+
+      qcom,qaif-aif-lane-map:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Per-lane direction map, one entry per lane starting from lane 0.
+          Use 0 for TX (output/speaker) and 1 for RX (input/mic).
+        minItems: 1
+        maxItems: 8
+        items:
+          enum: [0, 1]
+
+    required:
+      - reg
+      - dai-format
+      - qcom,qaif-aif-lane-map
+
+    if:
+      properties:
+        dai-format:
+          enum: [dsp_a, dsp_b]
+    then:
+      required:
+        - dai-tdm-slot-width
+        - dai-tdm-slot-num
+        - dai-tdm-slot-rx-mask
+        - dai-tdm-slot-tx-mask
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - iommus
+  - clocks
+  - clock-names
+  - '#sound-dai-cells'
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        qaif_cpu: audio-controller@a000000 {
+            compatible = "qcom,shikra-qaif-cpu";
+            reg = <0x0 0x0a000000 0x0 0x20000>;
+            interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
+            iommus = <&apps_smmu 0x1c0 0x0>;
+            clocks = <&gcc 213>,
+                     <&gcc 214>,
+                     <&audiocorecc 15>,
+                     <&audiocorecc 17>,
+                     <&audiocorecc 18>,
+                     <&audiocorecc 5>,
+                     <&audiocorecc 8>,
+                     <&audiocorecc 11>,
+                     <&audiocorecc 14>;
+            clock-names = "lpass_config",
+                          "lpass_core_axim",
+                          "aud_dma",
+                          "aud_dma_mem",
+                          "bus",
+                          "aif_if0_ibit",
+                          "aif_if1_ibit",
+                          "aif_if2_ibit",
+                          "aif_if3_ibit";
+            #sound-dai-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            aif@b5 {
+                reg = <181>;
+                dai-format = "dsp_a";
+                dai-tdm-slot-width = <32>;
+                dai-tdm-slot-num = <2>;
+                dai-tdm-slot-rx-mask = <1 1>;
+                dai-tdm-slot-tx-mask = <1 1>;
+                qcom,qaif-aif-lane-map = <1 0>;
+            };
+        };
+    };

-- 
2.34.1

