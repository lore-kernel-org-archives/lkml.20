Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217D54028D6;
	Thu,  3 Sep 2026 07:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420576; cv=none; b=MPMmULYCR6HT+8wCCre788w8ksJ6KohgzmSVXNl9goftEkNhsR1hZEz9cMCalRuUUzqqPAsMPxWypc/w8XXsgv27iHaua2z8RVSaGLNBxoZfl05Ux/pyNUEhG7r0JAukQ8GnAUjtBTc1f72cqfxX+yx577240JtWDHCJuCJ5gww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420576; c=relaxed/simple;
	bh=R9R5MCwZJy/u/oY96CBkKCl7P5zHrgeHv0ntwtDXEp4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RzKaO2nDlmrcCCS7VIJllRPhGvcTax8AeigXlx3Xz/TtMumiSDkc6uStOuwBLfDolekVpYV11OMgC1HeV2kqL9n5QQ7jFtzTOm7+HYmQc0eLMI2Jhy3LWW46YtzAi7FjmnanyZpyr7FxIU2K0vNnOmfbTblZyT4AJo3M0/O4kIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iccvx+sl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iccvx+sl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lZGr4023530;
	Thu, 3 Sep 2026 07:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3TB3sXwqH8g
	CYakbGwV0wIS4p6OVjuM+MoS98Np51rQ=; b=iccvx+slymmqmGN//xuGMoOhoSI
	1FuZNEWD1uBIKqbB1CLIxHItcmirRSvf5CBRuK2dlKIAGX0P6OkyQBwnfkjX0pwA
	hZ01LSKb19PGwkFIRgRv9CEL3TqHiO5RHRM4PKk5cIsHCgPZlgLFXXvivVutGayL
	zJodj8IuDQgI+JsbOwqtO3v2Bp84eqG3iMM+gkys2tRfqmEo6D88cdP7kt3PakWs
	iabjEDaBKFylxJJixrUzZeH41yjUUPxAwu5tT0xb7B7BB85s2N/UbkxIAhAahnZ6
	HXP1/eRTRWmxdsi65tFZOggDgxI2xG+1BLsxxvVwIVjE7TDdJ/xhXxw0xWw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhbyq8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 07:29:09 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6837T65r4174406;
	Thu, 3 Sep 2026 07:29:06 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 6837T4OO4174384;
	Thu, 03 Sep 2026 07:29:06 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
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
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v4 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
Date: Thu,  3 Sep 2026 12:58:52 +0530
Message-Id: <20260903072902.3870009-2-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: YailvTxlMESyp1jsIlS1tpHNJnWL8mKM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NSBTYWx0ZWRfXwXVMtXEbARA6
 O+gfhCAMGjqiJ2xLIKRu2opxE8KDFfyfPFgNwVIG3Mxw31yYxG8pb8oKfigJR5upFSEJ2+L80vi
 3CgJuwIHfBWyv/ppxidZClMlru/N199jpJfcoigXP5xci8JZV+m61Fl32Bzf5EbtIuSf8SxXENV
 trcuSVb1cYAeMJtNLbKkUdbFVtCzWBpUd4WtzJJHcMzQKnyBjRkZXM4KvwNIaNjdoqBDpYsO+J/
 jfNs8G4bhQtyyCVrjiov/gWUiohUsVNuj/clrInPqUlfGWziz1XQkaX8Wd1qzA+oibOOza6pRtJ
 eZVIOAFUpUOFnqzzHgNMEz8oh4TuG8/Q7W3yIHTdLnxJBaCXsCHAc8QjNzCnBWxFlq5MSVqWQNI
 bp6Ae3B549jRNJhJGD3ObLVUqD1Mg8g7zBMlGwEKyw46TqtvwOZz8MItguSSRgTY44py3C+Ah85
 WEoj3z4yH1ze1+Le5Bw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NSBTYWx0ZWRfXwQOjGDhYxvz9
 gu7Q4sgKZiYgSeS/YGk+x4PPuO76xBfEYkOYtehUn+uN7LzuB2tY+LIeYEXdREOP5tcjqc3Gkqj
 EIgVFRPxOStpPTD/6nUuL7DryUOTjJo=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a9921c5 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=IKi4BxqlJaGqyTN3KKsA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: YailvTxlMESyp1jsIlS1tpHNJnWL8mKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030065


Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
controller used on the Shikra audio platform, together with a dt-bindings
header for QAIF DAI and AIF interface IDs.

QAIF routes audio between system memory, external PCM/TDM/MI2S serial
interfaces and the internal Bolero/WCD codec. Platform Devicetree files
need a binding to describe the controller resources, DAI cells and per-
interface AIF configuration, and named constants to avoid raw numeric IDs
in sound-dai references and child-node reg values.

Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
aif-interface child nodes required by the controller.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 .../bindings/sound/qcom,shikra-qaif-cpu.yaml  | 308 ++++++++++++++++++
 .../sound/qcom,q6dsp-lpass-ports.h            |  52 +++
 2 files changed, 360 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
new file mode 100644
index 000000000000..9d0616ac7554
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
@@ -0,0 +1,308 @@
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
+    description: QAIF core registers
+
+  interrupts:
+    maxItems: 1
+    description:
+      QAIF summary interrupt for this Execution Engine. Signals DMA period
+      completion, buffer underflow/overflow, error response, audio interface
+      underflow/overflow, interface-group done, rate detector and VFR events.
+
+  iommus:
+    maxItems: 1
+    description: Phandle to apps_smmu node with sid mask
+
+  dma-coherent: true
+
+  clocks:
+    minItems: 5
+    maxItems: 9
+
+  clock-names:
+    description:
+      The first five clocks are always required. Any further entries are the
+      per-AIF bit clocks (aif_if<N>_ibit), supplied in order starting from
+      AIF interface 0 for as many serial AIF interfaces as the board uses.
+    minItems: 5
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
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [8, 16, 24, 32]
+        description:
+          Slot width in bits.
+
+      dai-tdm-slot-num:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Number of slots per lane.
+        minimum: 1
+        maximum: 32
+
+      dai-tdm-slot-rx-mask:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Active RX slots, one entry per slot. A nonzero value marks the
+          slot as active.
+        minItems: 1
+        maxItems: 32
+
+      dai-tdm-slot-tx-mask:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Active TX slots, one entry per slot. A nonzero value marks the
+          slot as active.
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
+    additionalProperties: false
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
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 3a99703dbc4a..f08c20c84c60 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -156,6 +156,58 @@
 #define LPI_MI2S_TX_5		150
 #define LPI_MI2S_RX_6		151
 #define LPI_MI2S_TX_6		152
+#define AIF_MI2S_RX_0		153
+#define AIF_MI2S_RX_1		154
+#define AIF_MI2S_RX_2		155
+#define AIF_MI2S_RX_3		156
+#define AIF_MI2S_RX_4		157
+#define AIF_MI2S_RX_5		158
+#define AIF_MI2S_RX_6		159
+#define AIF_MI2S_RX_7		160
+#define AIF_MI2S_RX_8		161
+#define AIF_MI2S_RX_9		162
+#define AIF_MI2S_RX_10		163
+#define AIF_MI2S_RX_11		164
+#define AIF_MI2S_RX_12		165
+#define AIF_MI2S_TX_0		166
+#define AIF_MI2S_TX_1		167
+#define AIF_MI2S_TX_2		168
+#define AIF_MI2S_TX_3		169
+#define AIF_MI2S_TX_4		170
+#define AIF_MI2S_TX_5		171
+#define AIF_MI2S_TX_6		172
+#define AIF_MI2S_TX_7		173
+#define AIF_MI2S_TX_8		174
+#define AIF_MI2S_TX_9		175
+#define AIF_MI2S_TX_10		176
+#define AIF_MI2S_TX_11		177
+#define AIF_MI2S_TX_12		178
+#define AIF_TDM_RX_0		179
+#define AIF_TDM_RX_1		180
+#define AIF_TDM_RX_2		181
+#define AIF_TDM_RX_3		182
+#define AIF_TDM_RX_4		183
+#define AIF_TDM_RX_5		184
+#define AIF_TDM_RX_6		185
+#define AIF_TDM_RX_7		186
+#define AIF_TDM_RX_8		187
+#define AIF_TDM_RX_9		188
+#define AIF_TDM_RX_10		189
+#define AIF_TDM_RX_11		190
+#define AIF_TDM_RX_12		191
+#define AIF_TDM_TX_0		192
+#define AIF_TDM_TX_1		193
+#define AIF_TDM_TX_2		194
+#define AIF_TDM_TX_3		195
+#define AIF_TDM_TX_4		196
+#define AIF_TDM_TX_5		197
+#define AIF_TDM_TX_6		198
+#define AIF_TDM_TX_7		199
+#define AIF_TDM_TX_8		200
+#define AIF_TDM_TX_9		201
+#define AIF_TDM_TX_10		202
+#define AIF_TDM_TX_11		203
+#define AIF_TDM_TX_12		204
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.34.1

