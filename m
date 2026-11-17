Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902096;
	b=U+z5BnuB4Ei3SVDEC/yaVBwlli3WiJOlkaiT43hqpwhSWqoTlPsRc4dK+ULwOqGt2/0+
	 5sqLhYwmvLgmxNGTbVO4e+fQaInLaIsdzhJpUL+0Ht5R5HywFuSXYXPo7yx6JA7vMc4eV
	 z8tHLHnPIsPVeGYs6+GrvgpiPkY4ZKj38Vuaiv1J9GnFpHMLdS1GhYWk3jr6/1rZyMWOQ
	 +kRFWbPOM2XyMiaFcncsoqUBkF6C0npIYOv2+0bwKaZdnqsMOBhmUNPpOVtivQ0L/vksI
	 MpEgi2z4jUOOOaH3I6oUecGsf6TdUKJPvMRYnSPZsR3NWluNf4BpL2j/U5/L5UlQdWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902096;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=eLAQP0umCUNV9SDro5xHJpGm9BPwiX/kosczXjIBD2w=;
	b=LavIFRc9tKvOwFoSLVVvTG421qATMvm7jNkVNvlTV4tglkqDxcoJzqGAb9mqSIwXk6aj
	 V+nfKiuvL7Wb0uOu54jWrHwPI635820DJqgzHNIE1d9Krm5tl5tIVr7l88BQXVm4XlUp3
	 xLUAmRZ1BXxnzMOFJCyHPC3Ejt7PgBZtTy/WvsCgbE+/jdolUaODSACFJ7kl2KA4Tdylo
	 KJySzGFX8r8ihb0aKz+NZ7YNBjUNzT3282O2wOOZyB4XIRVMw6akkM6Wx8prgSv9pPo1G
	 1y5ABHk5UnV8F0LwXL2B+sgjDZI6SniK0y+XZ74vWQ6tQwyyEeQwREJQr5stz9AKaZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=YRFQs9Vc;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA159606A31C;
	Tue, 17 Nov 2026 07:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA159606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=YRFQs9Vc
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37C2D177;
	Tue, 17 Nov 2026 08:52:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794901939;
	bh=Rs2TZRDYMtfEO5dZ9Ed294/LGxR/gQNKjwq+FdxuUqY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YRFQs9VcmKm2vUqPqdHinkvhqFfhMK1skDzco9OpBxUGc9aO6y+RSj4tgwtU8en3s
	 tGqWeGMSOAPTuZ4hysCFFqeYwC7DzIdXmERcGlCQCDj+3t+lipZfhZMnVRLTGsXla5
	 JJw/yvLKh1dbb9IJfbWdsm9M+U6jwvy2YEgYCFaM=
Message-ID: <16f237de-d223-470d-915b-0542c263bd52@ideasonboard.com>
Date: Tue, 17 Nov 2026 09:54:42 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] drm/tidss: Add BeagleY-AI display support (and
 some more)
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jayesh Choudhary <j-choudhary@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Andrew Davis <afd@ti.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Louis Chauvet <louis.chauvet@bootlin.com>
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/11/2026 13:34, Tomi Valkeinen wrote:
> This series aims to add display support for all display interfaces on
> BeagleY-AI board. More generally, it adds display support for TI AM62P,
> J722S, and related SoCs.
> 
> The main topics to highlight:
> 
> - The data and sync signal polarities require accessing a register
>    (DPI0_CLK_CTRL) in the CTRL_MMR block. This has already been discussed
>    e.g. in
>    https://lore.kernel.org/all/20250730-fix-edge-handling-v1-0-1bdfb3fe7922%40bootlin.com/.
>    This topic is still open, and it also touches already upstreamed SoCs
>    with DSS (AM625). In other words, with this series, we don't have full
>    polarity support, and DPI works exactly like upstream AM625's does.
> 
> - In the SoC, the two OLDI TX instances are shared between the two DSS
>    instances. This has been a bit tricky to solve neatly. In this series
>    the result is that in the DT we have three OLDI TX nodes, two under
>    DSS0, one under DSS1, representing the OLDIs that the DSS instance
>    can use.
> 
> - I'm no audio expert, but based on the original dts from Robert Nelson,
>    I did get HDMI audio working, but I see "davinci-mcasp
>    2b10000.audio-controller: Sample-rate is off by 400 PPM".
> 
> With this series one can use the HDMI output on BeagleY-AI. I have also
> tested the DSI output with Raspberry Pi's 7" DSI display, and OLDI
> output with an oscilloscope (I don't have a suitable OLDI panel) with
> extra DT overlays.
> 
>   Tomi
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v5:
> - Add Rb tags from Aradhya
> - New cleanup patch: "drm/tidss: Use the AM625 features for AM62A7"
> - Ensure tidss_oldi_create_pd_devs() is only called for primary OLDI
> - Add missing cbass ranges for DSS1 and DSI (DSS was already there) to k3-am62p.dtsi
> - Link to v4: https://patch.msgid.link/20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com
> 
> Changes in v4:
> - Based on today's drm-misc-next
> - Dropped the CTRL MMR related code. This means the DPI polarities are
>    not quite right (the same as AM625)
> - Dropped the commit to convert OLDI to an aux driver. This version uses
>    a new (unmerged) PM dev_pm_domain_attach_by_node() to manage the OLDI
>    power domains.
> - Dropped a bunch of commits which were merged via "[PATCH 00/10]
>    drm/tidss: Preparation for AM62P and BeagleY-AI display support"
>    series.
> - Dropped tested-by tags, as the series has changed quite a bit.
> - Includes new fixes and cleanup patches:
>    - vp_bus_type removal:
>      - "Add helper to identify the AM65x OLDI video port"
>      - "Stop using vp_bus_type for directly connected panels"
>      - "Drop the tied off video port check from mode validation"
>      - "Remove the unused vp_bus_type feat"
>    - OLDI:
>      - "Drop unnecessary forward declaration"
>      - "Fix wrong return value from tidss_oldi_mode_valid()"
>      - "Fix serial clock reference leak"
>      - "Fix cleanup on a failed init"
>      - "Move the setup of one OLDI TX to its own function"
>      - "Add power domain support"
> - Link to v3: https://patch.msgid.link/20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com
> 
> Changes in v3:
> - Base on "[PATCH 0/6] arm64: ti: Use syscon for the Control Module"
> - Drop quotation marks from Rb tags
> - Drop Tested-by tags for the bindings patches
> - "drm/tidss: Add external data and sync signal edge configuration": Fix
>    error handling
> - "drm/tidss: Add support for DPIENABLE bit": set/unset DPIENABLE in
>    prepare/unprepare
> - "drm/tidss: oldi: Convert OLDI to an aux driver": Improve cleanups
>    (of_node_put, clk_put, device_link_del)
> - Dropped "arm64: dts: ti: k3-am62p-j722s-common-main: Make main_conf a syscon"
> - "arm64: dts: ti: k3-am62p-j722s-common-main: Add support for DSS": Add
>    missing clocks and ti,oldi-io-ctrl for oldi1 node. Drop unused
>    main-gpio0-ioexp-intr-default-pins node. Fix MCASP1_AXR0 pin
>    direction. Fix DSS videoport numbering.
> - Link to v2: https://lore.kernel.org/r/20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com
> 
> Changes in v2:
> - Add Rb and Tb tags
> - Drop "dt-bindings: mfd: syscon: Add ti,am625-dss-dpi0-clk-ctrl
>    compatible", which is now implemented with the below changes.
> - New patch "dt-bindings: display: ti,am65x-dss: Add ti,dpi-io-ctrl"
> - Modify "drm/tidss: Add external data and sync signal edge
>    configuration" to use the 'ti,dpi-io-ctrl' with offset.
> - New patch "arm64: dts: ti: k3-am62p-j722s-common-main: Make main_conf
>    a syscon".
> - Modify "arm64: dts: ti: k3-am62p-j722s-common-main: Add support for
>    DSS" to set 'ti,dpi-io-ctrl' properties
> - Drop generic desc in DT bindings for power-domains property
> - Fix pm_runtime_get_sync() return value check
> - Link to v1: https://lore.kernel.org/r/20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com
> 
> ---
> Andrew Davis (1):
>        arm64: dts: ti: beagley-ai: Enable HDMI display and audio
> 
> Jayesh Choudhary (1):
>        arm64: dts: ti: k3-am62p-j722s-common-main: Add support for DSS
> 
> Swamil Jain (1):
>        drm/tidss: Add support for AM62P display subsystem
> 
> Tomi Valkeinen (12):
>        dt-bindings: display: ti,am65x-dss: Add AM62P DSS
>        drm/tidss: Add helper to identify the AM65x OLDI video port
>        drm/tidss: Stop using vp_bus_type for directly connected panels
>        drm/tidss: Drop the tied off video port check from mode validation
>        drm/tidss: Remove the unused vp_bus_type feat
>        drm/tidss: Use the AM625 features for AM62A7
>        drm/tidss: oldi: Drop unnecessary forward declaration
>        drm/tidss: oldi: Fix wrong return value from tidss_oldi_mode_valid()
>        drm/tidss: oldi: Fix serial clock reference leak
>        drm/tidss: oldi: Fix cleanup on a failed init
>        drm/tidss: oldi: Move the setup of one OLDI TX to its own function
>        drm/tidss: oldi: Add power domain support

I'll pick patches 2-11 (inclusive) to drm-misc-next. They stand alone 
and do not depend on the PD change we need for the oldi.

  Tomi

