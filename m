Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8178B2E8B83;
	Mon, 28 Sep 2026 12:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600011; cv=none; b=KWmN3v/74sUj8RkbnF1DT/Rzco+YvcmqnP03e+3P20XKhaEQ9yP3xA3NsDeDYkat7DbsSstE7WeY2w6ujBVx2J+jEd0HJ0KwfSruBS6zf9nWKrZAtXbpJas9p9JiTuT4Yau66zoq8WbzoZiR9rKtMa1KgV+UDuiCsz68HKlFKPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600011; c=relaxed/simple;
	bh=OaLl6/R26OMCN3hIAAf9WaFgey9vUQNOvh+GQuADG/A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BIfEG/e5lyvhZS6a3YH6o0l48wQxAz/owwwP511HeL2sYNTZv3j9TML3E3vU6SDxv/SHISuyqz9ZfRMTdoGTyr1lzi24OaE11LV6ZqOEsIwsqT+U7gvBIHUVGAqqNoq/wOsfXfvJG2XG7dbX3P1JE0gj5iHtUnYDJFS5p8UWwOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DNClsMg7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNClsMg7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAMTL2294766;
	Mon, 28 Sep 2026 12:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h+Ryh7rfk2rLI8QjWY7tUJ
	dQFoe8mMTa0pVFeh4Vcpw=; b=DNClsMg7OOcITptXxgXW7oY1GmyJiZKyhsdrvR
	nQGDES8j6beBZn05aUWI951tKEaiRKmftgGXb70QUL4D4Ux4AumYpYre7vj4tHUt
	lM1LaZCqf2IgMaQF7WEw4I5+5vJe0WVp7+2js5/Jf1NjFGO/SviuIlOASC4Whifn
	r3BtaIaCrKzHO2IQhrTwyxK2iMy1SCcPoMILZDHJkwt0CWzI3nqnK2T0mC0AMdAk
	eoTeehqjehQ++VUbDJAJcLMfRIpjtLchOu0kAZyFwsZcHIOklNmm0wY+vCPgzpC5
	t+vbmgadpe0kC5TSVSqxipHeP89KR7dwPjQzjUd7ufbxbytg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubhkep-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 12:53:00 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68SCqvXt2080424;
	Mon, 28 Sep 2026 12:52:57 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 68SCqvKv2080411;
	Mon, 28 Sep 2026 12:52:57 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: [PATCH v8 00/10] ASoC: qcom: Add QAIF driver for Shikra audio
 platform
Date: Mon, 28 Sep 2026 18:22:50 +0530
Message-Id: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACJjumoC/22NwQ6CMBBEf8X07JKmSgue/A/DocBWVoVKF4iG8
 O8W9OhlkpfMzJsFYyBkcdrNIuBETL6LkO13ompsd0WgOrJQUmmZSwPlEXpLDrihe7Bgx5o8GJV
 LaSp0zigRp8+Ajl7b7aX4Mo/lDath/VobDfHgw3vzTtna+ynU4b9iMiChTkvtZKpTneHZMyf9a
 B+Vb9skhiiWZfkAozVSHdEAAAA=
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
X-Proofpoint-GUID: 5yKbEAA23VFeiAKQYwVplHDV81XqPwnX
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba632d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=iox4zFpeAAAA:8 a=yC-0_ovQAAAA:8
 a=JE3TOTnJsNoHUQ7QA90A:9 a=w_-MtpLiKefHUdzT:21 a=QEXdDO2ut3YA:10
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: 5yKbEAA23VFeiAKQYwVplHDV81XqPwnX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfXyzaO3epqKP86
 7mEVYuqvlBihxsGgDnOO1VmJOdZhZ8qAy3YzLtLsmCJTOAdmjJdX6vEmtE0YbXzKkQDbPCAiCd5
 nKIcCO7ub5kPG7PlDZjiecNoTse/7M1f6n5nffGEFuIdKUKlohqomw2/VtWz7wi/mWOQ9zbUS7C
 v+AQIqoTyvU9O+L0YA/YXsn6ob/fMLkxRLdV7VYTiTq2J3Eu81YYEI6buWlIxPGlle8cQLawCcj
 bwpXRtEA8E3By/nkcv2FA8UjsvvdYDYo6geWMUABAbArLWbiNvvCc7q9w8YjJ7y7Fn+7Ptn6iw3
 tcjZtu7kxeJSUlGZFRtmOcJOr307xDSVg7P9EXDpXqZSi1IVhOzEDt5X7rD3ICKCkjT1MYjqgR/
 vshGhPUx91thCcaVu2uHCnHYM/tO1d3yzine9UGMJ/Chqo1aeiIylHsHblX0jN0idQt6lluNzd4
 3kUvyLjChypTwqqfxow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfXzueCTQilb6ff
 PXTBkr3p8E3wfw0+X2o+MlSDoT31vZZxBMOpHwaMDxthdEA3RMpE65u2D1WtSh+QIpfZK7GMUXW
 A/AHHuWY6pxLztZrQSJ0GaVuKbre+aE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280051

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
  (startup/shutdown/hw_params/trigger) for both AIF and CIF
  paths using direct regmap_update_bits() calls with address macros from
  qaif-reg.h, registers an of_xlate_dai_name callback so that sound-dai
  references using non-sequential DAI IDs resolve correctly, parses
  per-interface AIF configuration from DT child nodes, and provides
  runtime PM suspend/resume via pm_runtime_force_suspend/resume for
  power collapse. AIF child nodes use standard properties (dai-format,
  dai-tdm-slot-*, qcom,qaif-aif-lane-map) without a compatible string;
  the protocol is identified by dai-format and set_fmt() is called by
  the machine driver.

  qaif-platform.c: PCM platform component. Handles DMA buffer allocation
  (dma_alloc_pages()), PCM ops (open/close/hw_params/hw_free/prepare/trigger/
  pointer/mmap/copy), and table-driven two-level IRQ dispatch with
  period-elapsed notification.

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

Link to v7:
  https://lore.kernel.org/all/20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com/
Link to v6:
  https://lore.kernel.org/lkml/20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com/
Link to v5:
  https://lore.kernel.org/lkml/20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com/
Link to v4:
  https://lore.kernel.org/lkml/20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com/
Link to v3:
  https://lore.kernel.org/lkml/20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com/
Link to v2:
  https://lore.kernel.org/lkml/20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com/
Link to v1:
  https://lore.kernel.org/lkml/20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com/

Changes in v8 (all Mark Brown):
  - qaif.h: drop unused rd_len/wr_len from struct qaif_variant
  - qaif-cpu.c: set_fmt() sets invert_sync=true for I2S; INV_MASK switch
    limited to DSP_A/DSP_B
  - qaif-cpu.c: reword shared-register comment (both directions program
    identical values from aif_intf_cfg[]; concurrent hw_params idempotent)
  - qaif-platform.c: use snd_pcm_set_fixed_buffer_all() in .pcm_new instead
    of manual dma_alloc_coherent(); drop qaif_dma_mem_info and heap arrays
  - qaif-platform.c: drop redundant copy() (buffer is coherent/mmap-able)
  - qaif-shikra.c: drop unused .rd_len/.wr_len initialisers
  - Rafi prerequisite series now merged; no external dependency

Changes in v7:
  - binding + shared data: drop AIF DAI ID additions; now provided by
    prerequisite series (Mohammad Rafi Shaik)
  - soc-core.c: use snd_soc_dai_name() instead of snd_soc_dai_name_get();
    the latter was removed when the function was renamed and moved to
    soc-dai.c (Kuninori Morimoto)

Changes in v6:
  - binding: make all per-AIF bit clocks required (Krzysztof Kozlowski)
  - qaif-cpu.c: skip duplicate devm_clk_get() for shared DMA index
  - qaif-platform.c: clear dma_buffer pointers in close() after free
  - qaif-platform.c: use of_parse_phandle_with_args() for iommus
  - cover letter: fix Software Design description (Mark Brown)

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
      ASoC: qcom: Add QAIF IRQ handling and platform register
      ASoC: qcom: Add Shikra QAIF support
      MAINTAINERS: Add Qualcomm QAIF driver entry

 .../bindings/sound/qcom,shikra-qaif-cpu.yaml       | 305 +++++++
 MAINTAINERS                                        |   9 +
 include/sound/soc.h                                |   3 +
 sound/soc/qcom/Kconfig                             |  10 +
 sound/soc/qcom/Makefile                            |   3 +
 sound/soc/qcom/lpass-cpu.c                         |  23 +-
 sound/soc/qcom/qaif-cpu.c                          | 887 +++++++++++++++++++++
 sound/soc/qcom/qaif-platform.c                     | 856 ++++++++++++++++++++
 sound/soc/qcom/qaif-reg.h                          | 458 +++++++++++
 sound/soc/qcom/qaif-shikra.c                       | 445 +++++++++++
 sound/soc/qcom/qaif.h                              | 292 +++++++
 sound/soc/soc-core.c                               |  33 +
 12 files changed, 3302 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
 create mode 100644 sound/soc/qcom/qaif-cpu.c
 create mode 100644 sound/soc/qcom/qaif-platform.c
 create mode 100644 sound/soc/qcom/qaif-reg.h
 create mode 100644 sound/soc/qcom/qaif-shikra.c
 create mode 100644 sound/soc/qcom/qaif.h
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260907-b4-qaif-shikra-audio-729007ceff72

Best regards,
--  
Harendra Gautam <harendra.gautam@oss.qualcomm.com>

