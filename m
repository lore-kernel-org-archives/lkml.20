Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3803147B43F;
	Mon, 21 Sep 2026 10:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987785; cv=none; b=c9uPbDGvkL6PeMBcR2PtXEeV1mxvi4MBIhphOdaci+oLM4HAjBARkU32n6qhpErk7LsWuAy0YecJyLEm+ngGYwSRFnYC3CNxRy6Vf9WaTWbLBogo7UpTanbbVSmIHE1mNbhoTJgUtHssqGMxQcrJOE2a/89qk+yz/O+2mHH9y38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987785; c=relaxed/simple;
	bh=jcQ0uXCTQN6WFOE+Jcx1zQyWym5Bv44C6LobbdOSxxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJHjYa1ydwak6cMiwoWyeP5F7ig0/eoNx4+oghKl3LoLnVvL+sHrYaSkjYaNxKP6RTaDGXi5FMe82ydu2os7794Fls7kHOpWgvK+lkCMzWevFBhmj488tTpoZ2t+8+zPFlNFab786I9Hr8da5JSKm6uOeYJCPL3BLAGqnl9zrek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=f6Y+EDzE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="f6Y+EDzE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789987782;
	bh=jcQ0uXCTQN6WFOE+Jcx1zQyWym5Bv44C6LobbdOSxxE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f6Y+EDzEKTe5O68Ni67Q2wB9Fs0lexT5YJDL9btkq5KPtqIwQQPVrf0QZKaSWEtSV
	 8RKuOF2gk0eGIXr6coKQZuVjfPZvnt3RW7HhcLxyu870oHSepRmhJVolVTXRPMQcP6
	 aVvmE9o4r7cU6i+A+x0NbcoYCcMYmxSUlt2HyCLZ7c90XDXBD4Vw4w02gEkH4b3/L3
	 11xxy3asNsHFhz2ksOm3CfTRS4Ihuu1T8bJL4LvNASKDvx2IQeYS/wuPNrphQVYyp5
	 8UF/W6a223fSoHKLIPS5wuP7q/gHsHSPk3klzsRTcKvAn1y3tD1VDvCkyM8oJom796
	 gXPFyPkTn1Bcw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8750017E020C;
	Mon, 21 Sep 2026 12:49:41 +0200 (CEST)
Message-ID: <ba4fe17c-ee29-4739-a14e-87b39e5efcc5@collabora.com>
Date: Mon, 21 Sep 2026 12:49:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drivers: gpu: drm: panel: Add BOE NT51021 driver
To: Nickolay Goppen <setotau@mainlining.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>,
 Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260917-qcom-novatek-nt51021-panels-v4-0-30afbc35d70c@mainlining.org>
 <20260917-qcom-novatek-nt51021-panels-v4-2-30afbc35d70c@mainlining.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260917-qcom-novatek-nt51021-panels-v4-2-30afbc35d70c@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 14:51, Nickolay Goppen wrote:
> Add driver for BOE NT51021-based 8-inch and 10-inch DSI video mode
> panels used in Xiaomi Mi Pad 4, Mi Pad 4 Plus (xiaomi-clover)
> and Amazon Fire HD 10 (2017) (amazon-suez) tablets.
> 
> NT51021-based panels also support content-adaptive brightness control by
> generating a PWM signal for backlight driver IC. Content adaptation
> means that content grey level scale can be increased while
> simultaneously decreasing brightness of the backlight to achieve
> same perceived brightness. This makes the power consumption of
> backlight be reduced with keeping acceptable display quality.
> 
> Both panels are very similar, differences are only in init sequence
> and resolution.
> 
> The register sequence of the TV101WUM-NM0 is the BOE branch of
> init_lcm_registers() in drivers/misc/mediatek/lcm/nt51021_wuxga_dsi_vdo/
> in the Fire OS 3.18 tree, command for command, with only a 120 ms wait
> after sleep-out added where the vendor waits its trailing 5 ms.
> The 0x8f 0xa5 and 0x8f 0x00 that bracket it are the vendor's command
> interface selection, sent on every board that is not an early proto or
> HVT unit.
> 
> It is much shorter than boe_tv101wum_nx0_init() because this module is
> left on its own factory trim. NT51021 R8CH selects whether V1/V14, gamma
> and HAOP come from the panel's OTP memory or from control registers, and
> the 0x8c 0x80 here leaves all three on OTP, where the NX0's 0x8e
> switches
> them to registers so that the three pages of gamma it then writes take
> effect. So the absent gamma is deliberate rather than an omission, and
> the differing 0x8c is its consequence. CABC is likewise untouched
> because
> the vendor drives it over I2C from the backlight path. What is left is
> 0xc0 and 0xc8, which the public NT51021 specification does not describe;
> everything else this sequence touches carries the same value as the
> other
> two panels, including the terminal resistor, TP_SYNC, the MIPI Rx drive
> strength and all three test modes.
> 
> The timings are the vendor's lcm_get_params(): hsync 1, hbp 32, hfp 110,
> vsync 1, vbp 14, vfp 11, so htotal 1343 and vtotal 1946. The pixel clock
> follows the vendor's PLL_CLOCK = 490, which after DDR is 980 Mbps per
> lane and over four lanes at 24bpp is 163.33 MHz, so 62.5 Hz. The
> bootloader leaves the MIPI TX PLL at that rate: read back before the
> kernel touches it, this board's PLL decodes to exactly 980 Mbps per
> lane, so the panel is already there when the kernel takes over.
> 
> The front porch is the vendor's declared 110 rather than the smaller
> value its own DSI driver ends up running. That driver also sets
> clk_lp_per_line_enable, which makes ddp_dsi_config() overwrite HFP_WC
> after the declared timing is programmed, shrinking it to leave just
> enough room to take the clock lane to LP and back. That is a
> controller-side workaround rather than a panel property, and it
> contradicts the cont_clock = 1 set beside it, which disables the very LP
> transition it makes room for. Mainline mtk_dsi handles the clock lane
> itself, so the panel's declared timing is the right thing to carry here.
> 
> The vendor asks for SYNC_EVENT_VDO_MODE with cont_clock = 1 rather than
> burst, so make mode_flags per variant instead of fixed in probe(). The
> two existing panels keep the flags they had. Burst was also tried on
> this hardware and worked, but the vendor configuration is the one the
> module is characterised for.
> 
> The physical size is the datasheet active area, 216.576 x 135.36 mm,
> which measures 216 x 135 on the glass. The vendor's declared a
> physical_width = 136 and physical_height = 221, which appears to be an
> error. The size of the test unit was physically measured. 1200/136 and
> 1920/221 disagree by 1.5%.
> 
> The vendor's bootloader and kernel both carry a second register sequence
> for the Innolux module this board second-sources against, selected from
> two board ID straps. No Innolux unit was available, so that sequence is
> left out rather than carried untested; however, the Innolux part number
> was identified as "P101KDA-AB0", should someone with that glass need to
> upstream support in the future.
> 
> Tested on the Amazon Fire HD 10 (2017) driven by mediatek-drm: 1200x1920
> at 62.5 Hz across a cold boot, display off and on cycles and a
> suspend/resume, with the MIPI TX PLL reading back at the intended rate
> every time.
> 
> Assisted-by: LLM
> Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # Amazon Fire HD 10 (2017), boe,tv101wum-nm0
> Co-developed-by: Ryan Brue <ryanbrue.dev@gmail.com>
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> Co-developed-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>

Though I would've preferred to see the commands put in arrays instead of
multiple function calls with all of those values, the only improvement
would be slightly lower code size... and I don't think it's worth it to
request a v5 for just that.

After all, it's anyway the same "mess" of unknown data going out to the
panel's DriverIC - be it in one form or the other, it's not changing much.

So

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo
