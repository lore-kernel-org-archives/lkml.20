Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E2348AE24;
	Mon,  7 Sep 2026 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782998; cv=none; b=RBfMWJAw3JeiKTHKRNrASmc6lk46L+xS/YFZtL21itv6nhkHQhyVWVGTmFwLX1kMTJvy9Nkb5jWNmIDhlsIg6lhyy0oaRGFthKQWVcpzERS/rntL+kNWAdnw7wWZKOBhRIvTvCij7PB32zh0syIMNWJ/DczqOZ4Kp9SBUCWQpXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782998; c=relaxed/simple;
	bh=lufrxgkT6MbkucCfs23fJuDo93Yz4BjbeOGxMCFz8qU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QDcmjaJpuwGrTr4LG3rRyIw1IoDXpPDU7p58MwYxKUbkz8lisbzIEsB+0gzwFbGZQrEf3h/GHvUwmxrsOYI+2uQnASMf1qXUhPXIbufzbR4ne+p7ZjU4NOgiQxbfyKSCofysCzpK6BVaKQq7OWjuDQYeqZepst6zBap9DJrHmis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFQPBYM3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFQPBYM3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmtVH809944;
	Mon, 7 Sep 2026 12:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VOCVOJeRZJFs1q+Z2+4zRq
	5BPkeEmWmYqh+Rt7zigUU=; b=FFQPBYM3BSsSIkzBYMKqqnaOIl5Hvd31J07fbR
	tc/eQ5zLEL87Qm/EtcUdykT3sT6oF6m8B4BYu8xs/8pwGnT1gIq+Ir2efKEj18OC
	0LoYh1SvXCnwZfLliN5+NWY5ZRkUjfFCTm8SvK2w9fp6/oeJRiRsJWFj0bV1yYu5
	SOj9bGJFar02SeU8svjh64CcWYBUOkvLbjtTkbkpOvl1LdUppyJ+j51Il0xRWjGv
	RJKYfAo7zJ2wHWZDQXLJA+cV6gJUU8jIvQGAO1jXRL0uFqxr1b2+lqo1Ilo7n5Hv
	CyrgKNRjTZQg85P/Os1tWx3r9VKpEE2pgCsD0N9MyEDViAlg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua9a96-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 12:09:37 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 687C9Yu13932865;
	Mon, 7 Sep 2026 12:09:34 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 687C9XQR3932854;
	Mon, 07 Sep 2026 12:09:34 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: [PATCH v5 00/10] ASoC: qcom: Add QAIF driver for Shikra audio
 platform
Date: Mon, 07 Sep 2026 17:39:25 +0530
Message-Id: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHapnmoC/yXMTQqDMBBA4avIrB0YgjboVcRFEid1KviT0VIQ7
 27aLr/FeycoJ2GFtjgh8VtUljmjLgsIo5ufjDJkgyHzoIYs+go3JxF1lCk5dMcgC1rTENnAMVo
 DOV0TR/n8tl3/tx7+xWH/vuC6bvYEjYd4AAAA
X-Change-ID: 20260907-b4-qaif-shikra-audio-729007ceff72
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
X-Proofpoint-ORIG-GUID: e5eoKve815ggxuT_6dtNihHG_ef98hCl
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9ea982 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=iox4zFpeAAAA:8 a=yC-0_ovQAAAA:8
 a=JE3TOTnJsNoHUQ7QA90A:9 a=Yg1l9mNGiYgSnojN:21 a=QEXdDO2ut3YA:10
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: e5eoKve815ggxuT_6dtNihHG_ef98hCl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfXzztg6OBxdIEg
 wQVy6PctL/0xAJb/UTqKfxXtlIbxjyiC/nD7+Iz+Qvgqrx7hzvWN2yTgvmI3eZ1X5xY1zPVfvoo
 4ADb/PPCry7wL3gLvf1AwhCGRiNz0Po=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfXzjvxgxxD4JeS
 R83wJSj+B5SPrcBBdgGKq/EJZv4TmhapwlhhIbuTjxFFIigj2LPZPW1Zz5Ta/PmoScf4jjxyLV7
 +mwtsNrHsNAeKbHST0c49SgqyKKIzMddDkps9/IH5eufcYtDFsds4rA+Gb4DmC+JlyiwCI3YxbO
 qjFPxP/Uw0wVg+kC4BRUHEZPU24z7x03V7pqYCjkEc+2TjI8NhOGY3hseT6wEA2Ff/XOKDYdwPr
 nvARxmQ2Jk8tn803/yAekxMhcH41LmE0rG3PcM5JSarR7aIhdPkcW3hrc0x5eSSMHJhfIwmXTa7
 hZfNFka4b/6iiphKxfks+iFchl0DPwJKjJzQ5K+w+/x1tTifkjkMLicpXGLBCidebTmWrgXY2z0
 dH4a1RT/dI8i6R2f+TRwcj6DlF+WuTZWbPUB48zuaZ6LbQI48Ey/RyZvOYQB2K/QvccZZrEeNrY
 SzGAnMIbUXJxWavP9gQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070134

This series introduces the Qualcomm Audio Interface (QAIF) driver for
the Shikra audio platform.

Hardware IP Overview
====================
QAIF (Qualcomm Audio Interface) is a fully configurable DMA-based audio
subsystem used to transmit and receive audio data over serial audio
interfaces (PCM, TDM, MI2S) and to provide a DMA interface for internal
codec connections. It manages two independent data paths:

  AIF (Audio Interface): multiple multi-lane Unified Audio Interfaces,
  each supporting up to 8 independent data lanes. Each lane is individually
  configurable as TX (output/speaker) or RX (input/mic). All lanes of an
  interface share a single bit clock and frame sync. Supported modes are
  PCM (short/long sync), TDM, and MI2S (stereo/mono). Per-interface
  configuration includes sync source (master/slave), sync mode, sync delay,
  sync inversion, slot width (8/16/24/32-bit), sample width, active slot
  masks (up to 32 slots), bits-per-lane frame size, lane enable/direction
  masks, loopback, output-enable control, and full-cycle path support for
  long chip-to-chip connections.

  CIF (Codec Interface): multiple RDDMA (playback) and WRDMA (capture)
  channels connecting to an internal codec over a parallel bus. Each channel
  supports active-channel enable mask (up to 16 channels), frame-sync
  selection, frame-sync delay, frame-sync output gating, dynamic clock
  gating, and 16-bit packing/unpacking.

  Note on RX/TX naming convention: in QAIF, TX refers to the output
  (speaker/playback) direction and RX refers to the input (mic/capture)
  direction. This applies to both AIF lane directions and CIF slot/mask
  properties.

  DMA Engine: RDDMA fetches audio from DDR/TCM/LPM into a shared SRAM
  latency buffer (SHRAM) and drains it to the interface. WRDMA collects
  data from the interface into SHRAM and writes it to memory. Each DMA
  owns a private SHRAM region defined by start address and length registers.
  Burst sizes of 1/2/4/8/16 beats (64-bit) are supported with up to 4
  outstanding transactions per DMA. Two QSB master ports (QXM0 for TCM,
  QXM1 for DDR/LPM) provide the memory interface.

  Execution Environments (EE): Resources (DMAs, audio interfaces,
  interface groups) are partitioned among up to 5 EEs via map registers.
  Each EE owns a set of DMAs, audio interfaces, and interface groups, and
  receives its own independent interrupt output. The interrupt hierarchy
  has a two-level structure: a summary register identifies the event class
  (DMA period, underflow/overflow, error response, audio interface
  underflow/overflow, group done, rate detector, VFR), and per-resource
  status registers identify the specific channel.

  Interface Grouping (Bonding): Multiple AIF and CIF interfaces can be
  bonded into a group to start synchronously and align their DMA period
  interrupts within half a frame duration using the RDDMA padding feature.
  Up to 6 groups are supported.

  Rate Detector: Two rate detector blocks measure the frequency of
  incoming frame sync or word select signals and generate interrupts on
  rate change, undetected rate, or sync timeout.

Block Diagram
=============

  System Memory (DDR / LPM / TCM)
  +---------------------------------+
  |  Circular Buffers (ping-pong)   |
  +----------+----------+-----------+
             |          ^
       64-bit AXI  64-bit AXI
             |          |
  +----------v----------+-----------+
  |        QSB Master Ports         |
  |  +----------+  +----------+     |
  |  |   QXM0   |  |   QXM1   |     |
  |  +----+-----+  +-----+----+     |
  +-------|--------------|----------+
          |              |
  +-------v--------------v----------+
  |         Shared RAM (SHRAM)       |
  |  +------------+  +------------+ |
  |  | QXM0 Read  |  | QXM0 Write | |
  |  | SHRAM      |  | SHRAM      | |
  |  +------------+  +------------+ |
  |  +------------+  +------------+ |
  |  | QXM1 Read  |  | QXM1 Write | |
  |  | SHRAM      |  | SHRAM      | |
  |  +------------+  +------------+ |
  +---+--------+--------+-------+---+
      |        |        |       |
  +---v--+  +--v---+ +--v---+ +-v----+
  |RDDMA |  |RDDMA | |WRDMA | |WRDMA |
  | AIF  |  | CIF  | | AIF  | | CIF  |
  |[0..n]|  |[0..n]| |[0..n]| |[0..n]|
  +--+---+  +--+---+ +--+---+ +-+----+
     |         |       ^          ^
     | TX      | TX    | RX       | RX
     v         v       |          |
  +--+--------------------+  +----+----------+
  |  Unified Audio Intf   |  | Codec DMA     |
  |  (AIF 0..12)          |  | Interface     |
  |                       |  | (CIF)         |
  |  AUD_INTFa block:     |  |               |
  |  - Serializer (TX)    |  | RDDMA: DDR -> |
  |  - De-serializer (RX) |  |   internal    |
  |  - Sync gen/detect    |  |   codec       |
  |  - Up to 8 data lanes |  | WRDMA: codec  |
  |  - PCM / TDM / MI2S   |  |   -> DDR      |
  |  - Near Pad Logic     |  | Up to 16 ch   |
  +--+--------------------+  +----+----------+
     |  Lane 0..7 (TX/RX)       |  Parallel bus
     |  Bit clk + Frame sync    |  + Frame sync
     v                          v
  +--+--------+          +------+------+
  | External  |          | Internal    |
  | Serial    |          | Digital     |
  | Peripherals|         | Codec       |
  | (PCM/TDM/ |          | (Bolero/    |
  |  MI2S)    |          |  WCD)       |
  +-----------+          +-------------+

Software Design
===============
The driver follows the standard ALSA SoC split:

  qaif-cpu.c: CPU DAI component. Manages clocks, implements DAI ops
  (startup/shutdown/hw_free/hw_params/trigger) for both AIF and CIF
  paths using direct regmap_update_bits() calls with address macros from
  qaif-reg.h, registers an of_xlate_dai_name callback so that sound-dai
  references using non-sequential DAI IDs resolve correctly, and parses
  per-interface AIF configuration from DT child nodes. AIF child nodes
  use standard properties (dai-format, dai-tdm-slot-*, qcom,qaif-aif-
  lane-map) without a compatible string; the protocol is identified by
  dai-format and set_fmt() is called by the machine driver.

  qaif-platform.c: PCM platform component. Handles DMA buffer allocation
  (dma_alloc_pages()), PCM ops (open/close/hw_params/prepare/trigger/
  pointer/mmap/copy), table-driven two-level IRQ dispatch with
  period-elapsed notification, and component suspend/resume across power
  collapse.

  qaif-shikra.c: Shikra SoC-specific variant descriptor. Provides
  register base addresses, DMA channel counts, SHRAM geometry, clock
  names and the DAI driver array. This abstraction keeps the core driver
  portable across future QAIF integrations.

  qaif.h / qaif-reg.h: Shared data structures, constants and the complete
  MMIO register address map consumed by both the CPU and platform drivers.

  soc-core.c: This series adds snd_soc_of_xlate_dai_name() as a generic
  ASoC helper that resolves a sound-dai phandle argument to a DAI name by
  searching the component DAI list by ID. Both lpass-cpu.c and qaif-cpu.c
  assign it directly as .of_xlate_dai_name, removing their private
  implementations.

The series is split by functionality to aid review -- register map and
data structures first, then CPU DAI ops with regmap and DT parsing, the
of_xlate helper, PCM ops, IRQ handling and finally the Shikra variant
glue.

Link to v4:
  https://lore.kernel.org/lkml/20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com/
Link to v3:
  https://lore.kernel.org/lkml/20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com/
Link to v2:
  https://lore.kernel.org/lkml/20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com/
Link to v1:
  https://lore.kernel.org/lkml/20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com/

Changes in v5:
  - All patches: remove leading blank line from commit body
    (Krzysztof Kozlowski)
  - qaif-platform.c: fix error path in open() -- goto err_free_dma
    instead of err_free_mem_info after alloc_stream_dma_idx failure,
    to correctly free the DMA allocation before the struct

Changes in v4:
  - binding: rename to qcom,shikra-qaif-cpu (Krzysztof Kozlowski)
  - qcom,q6dsp-lpass-ports.h: add AIF DAI IDs (153-204) after
    LPI_MI2S_TX_6 with RX/TX split per port; CIF DAIs reuse existing
    RX_CODEC_DMA_RX_* and VA_CODEC_DMA_TX_* IDs (Srinivas Kandagatla)
  - qcom,qaif.h: removed; DAI IDs now in qcom,q6dsp-lpass-ports.h
  - common.h: update LPASS_MAX_PORT to AIF_TDM_TX_12 + 1
  - qaif.h: rename helpers to qaif_is_aif_mi2s_port(),
    qaif_is_aif_tdm_port(), qaif_is_cif_port(); use unsigned int
  - qaif-cpu.c: remove qaif_cif_intf_reg(); use substream direction to
    select RDDMA/WRDMA register; move .of_xlate_dai_name to patch 6
  - qaif-shikra.c: split AIF DAI entries into separate RX/TX per port;
    use DAI-local stream_name values; merge cif_rx/va_dma_dai_map;
    update get_dma_idx() and alloc_stream_dma_idx() (Srinivas Kandagatla)
  - soc-core.c / lpass-cpu.c: split into two patches for easier
    backporting (Kuninori Morimoto)
  - qaif-platform.c: unlock stream_lock before stream_dma_idx check,
    eliminating goto err_unlock; move variant callback validation to
    platform_register(); remove free_stream_dma_idx null checks
  - All patches: fix missing blank line between Cc headers and commit
    body (caused commit message to appear missing on lore)

Changes in v3:
  - series restructured: replace regmap_field abstraction with direct
    regmap_update_bits(); merge CIF/AIF DAI ops and regmap/DT/init into
    single CPU DAI patch; move of_xlate_dai_name to soc-core.c (was
    qcom/common.c); split Shikra variant into qaif-shikra.c; add
    Kconfig/Makefile and MAINTAINERS entries
  - binding: rename aif-interface@N to aif@N; remove compatible from
    child nodes; replace custom qcom,qaif-aif-sync-*/qcom,qaif-aif-lane-*
    properties with standard dai-format and dai-tdm-slot-*; fix example
    to aif@d7/reg=<215>; allow hex unit addresses; fix CIF channel count
    to 10; clarify QAIF_CDC_DMA_* IDs are sound-dai references only
  - qcom,qaif.h: replace QAIF_MI2S_TDM_AIF0..12 with separate
    QAIF_MI2S_AIF* (200-212) and QAIF_TDM_AIF* (213-225); renumber CIF
    IDs to RX (226-235), TX (236-245), VA_TX (246-255)
  - qaif.h: add qaif_ prefix to is_cif_dma_port() and new is_mi2s_port(),
    is_tdm_port(), is_aif_port() helpers; add QAIF_MI2S_SLOTS; add
    comments on smmu_csid_bits and ee fields
  - qaif-reg.h: rename CODEC_ prefix to CDC_; rename UF/OF IRQ macros;
    add _REG suffix to CDC debug/status macros
  - qaif-cpu.c: fix MI2S sync config per HPG; replace custom sync/lane
    DT properties with set_fmt()/set_tdm_slot() DAI ops; replace
    clk_prepare/clk_enable pairs with clk_prepare_enable; remove codec
    DAI set_tdm_slot/set_sysclk from hw_params(); use devm unwind
  - qaif-shikra.c: new file; separate MI2S and TDM DMA maps; restrict
    MI2S formats to S16|S32; widen TDM AIF constraints; rename VA DAI
    names to "CDC DMA VA_TX*"
  - soc-core.c: move of_xlate_dai_name helper from qcom/common.c to
    soc-core.c as snd_soc_of_xlate_dai_name() generic ASoC helper
  - lpass-cpu.c: remove local xlate wrapper; use snd_soc_of_xlate_dai_name()
  - qaif-platform.c: move dma_set_mask_and_coherent() to probe; fix IRQ
    dispatch READ_ONCE() race; add synchronize_irq() via .sync_stop;
    always proceed to IRQ_DISABLE in trigger(STOP) if dynclk fails

Changes in v2:
  - Rename YAML file to qcom,qaif-cpu.yaml, add qcom,qaif-cpu compatible
  - Merge DAI ID header into binding patch, drop _clk suffix from
    clock-names, add enum constraints, remove status: true (Krzysztof)
  - Fix dt_binding_check failure in binding example (Rob)
  - Fix IRQ storm: client status register bitmask missing BIT(16)
  - Fix race: use test_and_set_bit for DMA bitmap allocation
  - Fix regmap_config: use non-const with dynamic max_register
  - Use dev_err_probe() in probe path, sizeof(*var) in kzalloc (Krzysztof)
  - Add kerneldoc for all EXPORT_SYMBOL_GPL functions (Krzysztof)
  - Use goto-based error cleanup in pcmops_open()
  - Move MAINTAINERS entry to last patch (Krzysztof)
  - Add shared asoc_qcom_of_xlate_dai_name() helper used by lpass-cpu
    and qaif-cpu
  - Fix checkpatch --strict warnings and alignment issues

Harendra Gautam (10):
  ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
  ASoC: qcom: Add QAIF shared data structures and variant interface
  ASoC: qcom: Add QAIF hardware register map
  ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT parsing and platform init
  ASoC: soc-core: Add snd_soc_of_xlate_dai_name() generic helper
  ASoC: qcom: Switch lpass-cpu and qaif-cpu to
    snd_soc_of_xlate_dai_name()
  ASoC: qcom: Add QAIF PCM operations
  ASoC: qcom: Add QAIF IRQ handling, suspend/resume and platform
    register
  ASoC: qcom: Add Shikra QAIF support
  MAINTAINERS: Add Qualcomm QAIF driver entry

.../bindings/sound/qcom,shikra-qaif-cpu.yaml        | 308 ++++++++++++++++++
 MAINTAINERS                                         |   9 +++++++++
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h |  52 ++++++++++++++++++++
 include/sound/soc.h                                 |   3 +++
 sound/soc/qcom/Kconfig                              |  10 ++++++++++
 sound/soc/qcom/Makefile                             |   3 +++
 sound/soc/qcom/common.h                             |   3 ++-
 sound/soc/qcom/lpass-cpu.c                          |  23 +---------------------
 sound/soc/qcom/qaif-cpu.c                           | 875 ++++++++++++++++++++
 sound/soc/qcom/qaif-platform.c                      | 928 +++++++++++++++++++++++
 sound/soc/qcom/qaif-reg.h                           | 458 ++++++++++++++++++++++
 sound/soc/qcom/qaif-shikra.c                        | 447 ++++++++++++++++++++++
 sound/soc/qcom/qaif.h                               | 302 +++++++++++++++++++++
 sound/soc/soc-core.c                                |  33 ++++++++++++++++++++++
 14 files changed, 3431 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
 create mode 100644 sound/soc/qcom/qaif-cpu.c
 create mode 100644 sound/soc/qcom/qaif-platform.c
 create mode 100644 sound/soc/qcom/qaif-reg.h
 create mode 100644 sound/soc/qcom/qaif-shikra.c
 create mode 100644 sound/soc/qcom/qaif.h

---
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Cc: Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

---
Harendra Gautam (10):
      ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
      ASoC: qcom: Add QAIF shared data structures and variant interface
      ASoC: qcom: Add QAIF hardware register map
      ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT parsing and platform init
      ASoC: soc-core: Add snd_soc_of_xlate_dai_name() generic helper
      ASoC: qcom: Switch lpass-cpu and qaif-cpu to snd_soc_of_xlate_dai_name()
      ASoC: qcom: Add QAIF PCM operations
      ASoC: qcom: Add QAIF IRQ handling, suspend/resume and platform register
      ASoC: qcom: Add Shikra QAIF support
      MAINTAINERS: Add Qualcomm QAIF driver entry

 .../bindings/sound/qcom,shikra-qaif-cpu.yaml       | 308 +++++++
 MAINTAINERS                                        |   9 +
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h |  52 ++
 include/sound/soc.h                                |   3 +
 sound/soc/qcom/Kconfig                             |  10 +
 sound/soc/qcom/Makefile                            |   3 +
 sound/soc/qcom/common.h                            |   3 +-
 sound/soc/qcom/lpass-cpu.c                         |  23 +-
 sound/soc/qcom/qaif-cpu.c                          | 875 +++++++++++++++++++
 sound/soc/qcom/qaif-platform.c                     | 928 +++++++++++++++++++++
 sound/soc/qcom/qaif-reg.h                          | 458 ++++++++++
 sound/soc/qcom/qaif-shikra.c                       | 447 ++++++++++
 sound/soc/qcom/qaif.h                              | 302 +++++++
 sound/soc/soc-core.c                               |  33 +
 14 files changed, 3431 insertions(+), 23 deletions(-)
---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260907-b4-qaif-shikra-audio-729007ceff72

Best regards,
--  
Harendra Gautam <harendra.gautam@oss.qualcomm.com>

