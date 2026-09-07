Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D543845B0;
	Mon,  7 Sep 2026 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763347; cv=none; b=l+kY6SWKVOoL0OUMNdJ7Mzt6R3DQ9rF+r+O8w+5PA21F6xViqG0di2cLDp7Cx6nOKBdqj4ckQ4tGOq+MOboXd0l0GoIvfMam/Hci53tSoNi3SDJaSgBdufUpEXvGdzKKbk69jWEPUrdmzsyDGniRi6Tpkjzs9M49aBAdY5gWGZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763347; c=relaxed/simple;
	bh=BOt0JM0ykbgk6R0bIWLPdl/vbv2tYWoVuu2Rm7dfXng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s84sFCr7C+pBk5auCSISfi70F0tieM3VFipyvpDnpR4rwODb0z2y8qI3s96puehmTtLKjUdmVm6Un2msYT02QLX90M7iOb4mvu1kd0FEJjIIrKcXScGiDQGp993VR3xA0wFM57cY/XhhPCr+ZabW3gj+Cr8GhFNRQZa23F3Q1RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=TZTTF+4U; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=TVsmZmXr; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="TZTTF+4U";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="TVsmZmXr"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1788763321; bh=KtCwpxgTdgANQPuSDK+5DfN
	OWiP7yAIRc/nEIcBZHLg=; b=TZTTF+4Uk9Y/sJ3vdSisQUNfb27IZfQpAJU9NWdNlqa3LJ6pji
	Vt3aUtJIutlOLEaC3bIbvXTDUTcvx6krQ7fcmI5ViwrR7DIC3laA1TmzkT3luqgr3DrhKIATnFg
	8sOAy+afDxAzVVMQRaqsVHwsM2xH3ShX63L4stvNDWsjoa/MkML0naZGvEv4qMZQsu4EnS+vXs0
	nN5NSdTtMt9V4CKSVOnVdI7ijzPjv2v8ZltbRSLpmUoN6ZOkzX4FeRuMFvG9NXtN0L9hcHYXktH
	LX35Mg5rifs6Ti5WU9xDNXrzJTFIg0IOQaqyuzVne0Wgco20yl71pKmtNci8Y+DgvNg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1788763321; bh=KtCwpxgTdgANQPuSDK+5DfN
	OWiP7yAIRc/nEIcBZHLg=; b=TVsmZmXrhFTjLfjFGybvwCYmglUBGxcNVWMTCLsRVSWXxcbk/3
	yNl/U/jMmZ6pSiF0LkswmQQ8YzwZVblq3RCw==;
Message-ID: <54719b3e-d882-4b0c-b477-1e12dcf65133@mainlining.org>
Date: Mon, 7 Sep 2026 09:42:00 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] Novatek NT51021 DSI panel IC driver
To: Ryan Brue <ryanbrue.dev@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>
References: <20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org>
 <20260907060129.120497-1-ryanbrue.dev@gmail.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <20260907060129.120497-1-ryanbrue.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


07.09.2026 09:01, Ryan Brue wrote:
> Hi Nickolay,
>
> I sent a duplicate NT51021 driver on September 5th without finding
> yours from the 29th first. That was my mistake, and I have withdrawn
> mine. That's my bad, I'm new to kernel development :)
>
> Since I had the hardware set up, I tested your series on the device I
> am working on: the Amazon Fire HD 10 (2017), an MT8173 tablet with a BOE
> 1200x1920 NT51021 module, driven by mediatek-drm rather than msm. It
> works.
>
> Concretely, on that panel:
>
>    - your 10.1" register sequence, timings and mode_flags, unmodified,
>      bring the panel up correctly at your 60 Hz / 993.5 Mbps per lane
>    - it also works with my vendor's own sequence and timings under your
>      driver, at 62.5 Hz / 980 Mbps
>    - verified across a cold boot, display off and on cycles and a
>      suspend/resume, with the MIPI TX PLL reading back at the intended
>      rate each time
>
> So, for what it is worth on hardware you cannot test:
>
> Tested-by: Ryan Brue <ryanbrue.dev@gmail.com>
>
> Two things I checked that might save you answering them later:
>
>    - The generic writes are right. Xiaomi's own panel dtsi uses dtype
>      0x29, and this panel accepts both generic and DCS short writes, so
>      nothing depends on the choice.
>
>    - prepare() never sending a set_display_on looked like an omission to
>      me at first, but the 0x01 software reset at the head of the init
>      restores it, and repeated off and on cycles pass. It may be worth a
>      comment, since unprepare() does send set_display_off and the
>      asymmetry invites the question.
>
> One question on the binding, which is as much about my patch as yours.
> Where does "boe,tv101wum-nx0" come from? Xiaomi's panel dtsi
> (dsi-panel-nt51021-boe-10wu-video.dtsi) gives only
>
>      qcom,mdss-dsi-panel-name = "NT51021_BOE_BOE10";
>
> with no part number, and the register sequence in your driver matches
> that file byte for byte. TV101WUM-NX0 is a real BOE part, and its
> datasheet active area of 216.576 x 135.36 mm agrees nicely with the
> 135 x 216 in that dtsi, so the attribution looks reasonable. But if it
> is inferred rather than read off the panel or a BOM, it may be worth
> saying so in the commit message, or naming the compatible after the
> board the way panel-novatek-nt36523.c does for
> xiaomi,elish-boe-nt36523.
>
> I ask because my module has no identity I can establish at all. It
> answers no DSI read, DCS or generic, before or after sleep-out; the
> vendor kernel and bootloader name it only "BOE", chosen from two board
> ID straps; and its vendor-declared physical height is arithmetically
> impossible, since 1200/136 and 1920/221 disagree by 1.5%. So I am
> naming mine after the board, and would rather not accidentally imply it
> is or is not your part.

I've found these part numbers on the photos of a replacement panels from 
the AliExpress.

Also, for TV101WUM-NX0, I have a confirmation from Alexey Min, who 
disassembled
Xiaomi Mi Pad 4 Plus and took a photo of the panel's part number.

> If it is useful, I have the Fire HD 10 panel ready as a variant on top
> of your series: two patches, binding and driver, adding
> amazon,suez-boe-nt51021. The only change it needs in your code is
> making mode_flags per variant. My vendor asks for sync-event video mode
> with a continuously running HS clock rather than burst, and your two
> panels keep exactly the flags they have now. Burst worked on my panel
> too, so this is about matching what the module is characterised for,
> not a fix.
I will try to do that. Can I add you to the maintainers of this panel 
driver?
> I will hold that until your v2, since Neil's renaming will touch every
> identifier it adds. Happy to test v2 on this hardware when you post it.
>
> Thanks for doing this first.
>
> Ryan

-- 
Best regards,
Nickolay

