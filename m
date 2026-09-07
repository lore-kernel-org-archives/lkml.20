Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BE219E992;
	Mon,  7 Sep 2026 08:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769829; cv=none; b=MvgiZTBAQNih6O3JiP3PTNL4tGDrQ7A47CRoU/C/rzmG3egEQwUTHBPYMNF/WMIRUsl6u26TyW5vCfAjrgDCYlHP2fPjrsWf6eDdYDspjyoqXBh3rTocoIQPtjKQEnY5fzJQCwYMIotYrawIrca2lHvYurgPSguXteiANu+3Kf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769829; c=relaxed/simple;
	bh=MIy6oc+mmGeiTiEOnYbhdFCgaanSJS+rRZtaHrq098o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRySaRrGNa4EO17LB2bs9ZAkb773267Q1uAskiGvsulibTJIpnhlBURj5G7GP8WoNFMOkMyIJEvvLPNFfgB7xYnD1ZpaqspYJDV2Cb1VrCR/EgBYtymwjqvXxDCtMnWtILK77eyCMRQwm8aLBcs8niVSiYzDqOHTCzhK8WUtQvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUIxaQu0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUIxaQu0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD461F00A3A;
	Mon,  7 Sep 2026 08:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788769827;
	bh=/VLRSJhmb8ySGPzPHNCE4Cf5qZTkDz8ticvT8UR3XHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JUIxaQu0YH4H3IxvzP7wImXBVxSGhebJjTg/xR9Kq3MMz6mwu6alQ0zhI2EuCTHpY
	 m6R9N6VXl61q1SY6P9olXBeVl8i3AkRKJ0NgX1bclGnt8dQPrsVuLN2jnredm8lgVp
	 R4cGJYCt+z35XiXGua6QUyhgzhGpA0iSv4sUIzuSbgQsd5mgy8ynB0KpfdQhSDuncR
	 WZDOUFoCdlsM+5XvGt9eW9NFZnpyA0HR5fFOM5Bkp7k/8sXTOKWmc4lZcn9qyvIhEv
	 kRxZZH8PyAkHtGk4aAnxR5n5szcSjVqMF0Mm0gZtKkADXDexZQKMIVUGmG6+7rW9PT
	 GIARVabJiquiQ==
Date: Mon, 7 Sep 2026 10:30:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>, Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add
 binding
Message-ID: <20260907-arcane-sassy-fennec-afc02a@quoll>
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
 <20260903072902.3870009-2-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903072902.3870009-2-harendra.gautam@oss.qualcomm.com>

On Thu, Sep 03, 2026 at 12:58:52PM +0530, Harendra Gautam wrote:
> 
> Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI

Why do your commits have leading blank line? I mean, really, how is it
possible to create such commit?

Additionally, way you send your work is making this unnecessarily
difficult for us. Look, does this work?

	b4 diff '20260903072902.3870009-2-harendra.gautam@oss.qualcomm.com'

? No, it does not:

Looking up 20260903072902.3870009-2-harendra.gautam@oss.qualcomm.com
Checking for older revisions
Grabbing search results from lore.kernel.org
  Added from v3: 10 patches
---
Analyzing 112 messages in the thread
WARNING: duplicate messages found at index 1
   Subject 1: MAINTAINERS: Add Qualcomm QAIF driver entry
   Subject 2: ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 2
   Subject 1: ASoC: qcom: Add QAIF shared data structures and variant interface
   Subject 2: ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
  2 is not a reply... assume additional patch
Looking for additional code-review trailers on lore.kernel.org
Analyzing 0 code-review messages
Preparing fake-am for v3: ASoC: qcom: Add QAIF driver for Shikra audio platform
  range: d7fead291383..a37de53198ea
Preparing fake-am for v4: MAINTAINERS: Add Qualcomm QAIF driver entry
ERROR: v4 series incomplete; unable to create a fake-am range


You are sending big patchset, with big/complex new driver, so if the
process things are not done right, we are not going to spend time top
look at it. There are other patches waiting where we do not need to
struggle with such obstacles.


> controller used on the Shikra audio platform, together with a dt-bindings
> header for QAIF DAI and AIF interface IDs.
> 
> QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> interfaces and the internal Bolero/WCD codec. Platform Devicetree files
> need a binding to describe the controller resources, DAI cells and per-
> interface AIF configuration, and named constants to avoid raw numeric IDs
> in sound-dai references and child-node reg values.
> 
> Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
> aif-interface child nodes required by the controller.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,shikra-qaif-cpu.yaml  | 308 ++++++++++++++++++
>  .../sound/qcom,q6dsp-lpass-ports.h            |  52 +++
>  2 files changed, 360 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
> new file mode 100644
> index 000000000000..9d0616ac7554
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
> @@ -0,0 +1,308 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,shikra-qaif-cpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Audio Interface (QAIF) CPU DAI Controller
> +
> +maintainers:
> +  - Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> +
> +description: |
> +  The Qualcomm Audio Interface (QAIF) is a fully configurable DMA-based
> +  audio subsystem controller. It serialises and deserialises PCM audio
> +  between system memory and external serial audio peripherals (PCM, TDM,
> +  I2S, MI2S) through the AIF path, and transfers parallel audio between
> +  memory and an internal WCD codec through the CIF path.
> +
> +  AIF (Audio Interface): up to 13 multi-lane Unified Audio Interfaces,
> +  each supporting up to 8 independent data lanes. Each lane is individually
> +  configurable as TX (output/speaker) or RX (input/mic). All lanes of an
> +  interface share a single bit clock and frame sync. Supported modes are
> +  PCM (short/long sync), TDM, and MI2S (stereo/mono). Per-interface
> +  configuration includes sync source (master/slave), sync mode, sync delay,
> +  sync inversion, slot width (8/16/24/32-bit), sample width, active slot
> +  masks (up to 32 slots), bits-per-lane frame size, lane enable/direction
> +  masks, loopback, output-enable control, and full-cycle path support for
> +  long chip-to-chip connections.
> +
> +  CIF (Codec Interface): up to 10 RDDMA (playback) and 10 WRDMA (capture)
> +  channels connecting to an internal codec over a parallel bus. Each channel
> +  supports active-channel enable mask (up to 16 channels), frame-sync
> +  selection, frame-sync delay, frame-sync output gating, dynamic clock
> +  gating, and 16-bit packing/unpacking.
> +
> +  Note on RX/TX naming convention: in QAIF, TX refers to the output
> +  (speaker/playback) direction and RX refers to the input (mic/capture)
> +  direction. This applies to both AIF lane directions and CIF slot/mask
> +  properties.
> +
> +  DMA engine: RDDMA fetches audio from DDR/TCM/LPM into a shared SRAM
> +  latency buffer (SHRAM) and drains it to the interface. WRDMA collects
> +  data from the interface into SHRAM and writes it to memory. Each DMA
> +  owns a private SHRAM region defined by start address and length registers.
> +  Burst sizes of 1/2/4/8/16 beats (64-bit) are supported with up to 4
> +  outstanding transactions per DMA. Two QSB master ports (QXM0 for TCM,
> +  QXM1 for DDR/LPM) provide the memory interface.
> +
> +  Resources are partitioned among up to 5 Execution Engines (EEs) via
> +  EE map registers. Each EE owns a set of DMAs, audio interfaces, and
> +  interface groups, and receives its own independent interrupt output.
> +  The interrupt hierarchy has a two-level structure: a summary register
> +  identifies the event class (DMA period, underflow/overflow, error
> +  response, audio interface underflow/overflow, group done, rate detector,
> +  VFR), and per-resource status registers identify the specific channel.
> +
> +  Interface grouping (bonding) allows up to 6 groups of audio and codec
> +  interfaces to start synchronously and align their DMA period interrupts
> +  within half a frame duration using the RDDMA padding feature.
> +
> +  Two rate detector blocks measure the frequency of incoming frame sync or
> +  word select signals and generate interrupts on rate change, undetected
> +  rate, or sync timeout.
> +
> +  Block diagram::
> +
> +    System Memory (DDR / LPM / TCM)
> +    +---------------------------------+
> +    |  Circular Buffers (ping-pong)   |
> +    +----------+----------+-----------+
> +               |          ^
> +         64-bit AXI  64-bit AXI
> +               |          |
> +    +----------v----------+-----------+
> +    |        QSB Master Ports         |
> +    |  +----------+  +----------+     |
> +    |  |   QXM0   |  |   QXM1   |     |
> +    |  +----+-----+  +-----+----+     |
> +    +-------|--------------|----------+
> +            |              |
> +    +-------v--------------v----------+
> +    |         Shared RAM (SHRAM)       |
> +    |  +------------+  +------------+ |
> +    |  | QXM0 Read  |  | QXM0 Write | |
> +    |  | SHRAM      |  | SHRAM      | |
> +    |  +------------+  +------------+ |
> +    |  +------------+  +------------+ |
> +    |  | QXM1 Read  |  | QXM1 Write | |
> +    |  | SHRAM      |  | SHRAM      | |
> +    |  +------------+  +------------+ |
> +    +---+--------+--------+-------+---+
> +        |        |        |       |
> +    +---v--+  +--v---+ +--v---+ +-v----+
> +    |RDDMA |  |RDDMA | |WRDMA | |WRDMA |
> +    | AIF  |  | CIF  | | AIF  | | CIF  |
> +    |[0..n]|  |[0..n]| |[0..n]| |[0..n]|
> +    +--+---+  +--+---+ +--+---+ +-+----+
> +       |         |       ^          ^
> +       | TX      | TX    | RX       | RX
> +       v         v       |          |
> +    +--+--------------------+  +----+----------+
> +    |  Unified Audio Intf   |  | Codec DMA     |
> +    |  (AIF 0..12)          |  | Interface     |
> +    |                       |  | (CIF)         |
> +    |  AUD_INTFa block:     |  |               |
> +    |  - Serializer (TX)    |  | RDDMA: DDR -> |
> +    |  - De-serializer (RX) |  |   internal    |
> +    |  - Sync gen/detect    |  |   codec       |
> +    |  - Up to 8 data lanes |  | WRDMA: codec  |
> +    |  - PCM / TDM / MI2S   |  |   -> DDR      |
> +    |  - Near Pad Logic     |  | Up to 16 ch   |
> +    +--+--------------------+  +----+----------+
> +       |  Lane 0..7 (TX/RX)       |  Parallel bus
> +       |  Bit clk + Frame sync    |  + Frame sync
> +       v                          v
> +    +--+--------+          +------+------+
> +    | External  |          | Internal    |
> +    | Serial    |          | Digital     |
> +    | Peripherals|         | Codec       |
> +    | (PCM/TDM/ |          | (Bolero/    |
> +    |  MI2S)    |          |  WCD)       |
> +    +-----------+          +-------------+
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,shikra-qaif-cpu
> +
> +  reg:
> +    maxItems: 1
> +    description: QAIF core registers
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      QAIF summary interrupt for this Execution Engine. Signals DMA period
> +      completion, buffer underflow/overflow, error response, audio interface
> +      underflow/overflow, interface-group done, rate detector and VFR events.
> +
> +  iommus:
> +    maxItems: 1
> +    description: Phandle to apps_smmu node with sid mask
> +
> +  dma-coherent: true
> +
> +  clocks:
> +    minItems: 5
> +    maxItems: 9
> +
> +  clock-names:
> +    description:
> +      The first five clocks are always required. Any further entries are the
> +      per-AIF bit clocks (aif_if<N>_ibit), supplied in order starting from
> +      AIF interface 0 for as many serial AIF interfaces as the board uses.

Who provides these clocks? Your example DTS suggests that another SoC
block, so how these clocks could be optional? Either they are in the
hardware or they are not. Hardware is not really flexible.

I actually finished here, since b4 diff does not work, I have no time to
review it further. I might get back to it later.

Best regards,
Krzysztof

