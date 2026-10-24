Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829855;
	b=wNSQaciaUMd7hQwSK6st/1ipDWQY+wi9Xg3RFqSOZ4eNOYO0slso/uGLm1HIAE2KVK6T
	 DzbsMyn0+p2gNqYHRIqGdEkE+Xma/mdGEDTQQqjIDEweUYmrylT3kWfVLDosnt8g2Jb5k
	 VS3T0EAp8rqCaabPEKx4df8vrPPHj8Bj27bz7/8wehlSSe5BBDBVFsE99iGNzbycGMw4e
	 CJAGoIJ8nXs9odLNaAnbq6ey5M/sYYKVQl4CyP6jJvkcPnNaf2Bf8s0VexZIPuKn8WSIA
	 CJqfAIektGS7aVwUILmj+0tzVzamxju0Kh3+eZBcbpoyNi6moNM1sZxKW+rGfhPl3Fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
	b=S4HN9TwN6QsR2vrmEtHepD0V1WsS2OGvzEl0n9uF62W0EgjQhbXaM+Cs/p+qA8oAY4y4
	 rMs61+1dyWE8Nj9/+LpNzjVywKSPr9MQbN8AQ/LMVyB9PBKi2TwmT+pZwhEMn3tPbrVx5
	 eV/JRINN/UrM4LxGdhNA3qudIHwqDHXIJk9amiaPM/BOe5qoYLdnd5/oLWL9FZYXMgZ6c
	 hVu8AGAUP4U0FnNvmcY3cSIo0+xrT0DD3Kk775Cb6R5OaECIgErBTaizpzCvKwO+83m1c
	 sWjfI4hBbrn80BZSwgr9e7eI5ITqOJxWvEN+VTw0mBlMiFwGNZO0BeTiy4MSHVDpiZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k059ccS5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272B4606A321
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 272B4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k059ccS5
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso1271089a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829854; cv=none;
        d=google.com; s=arc-20260327;
        b=bpr2r9s4qsmPEGeR4Fs6jXmTtvP1hPvt+SFEZ2iaWNr7sUS8dJHa7DVEfh4ziDm/Iu
         If4abXIogkufJf43w0uZ4e1laUM1X69xeRD7cAKTocfXVXjt3QPzi/rrDjd3VWUKP+l4
         40yiQeuAy7zESWoo4Z9Rr1XTJLUvdsh+NDSzjF96XNciTy5oBndC43rN8CZELh86Q9md
         3duKyHLxYy9+VzP+pQCn3hKyn49VQEx9OF+rcu0AFQTlcpvsf+fXlSuwwLmhdUZKjR/N
         jV+4oIRggdXOBWr3jRpHQgnWiMsV6OR1a7axEeSQ4rSVpLDtCKZ4jTh0yqS8mc0W29f3
         nYPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        fh=8tnLbf2g3XbOa6M1LR4eOSikNBKcdbwCVCYrpxZ1weQ=;
        b=BjBxuS6FcwUjYwoukGqmg6lsBQW0zexI4s4EvftO5ZP2zCf7WGdc95rLTO+loKUWp5
         GfEP0q0Lwmcbxk50+nxEDyQk93QjlWzmExOKM0Z9tfxfhRocs6LSjDlRejs1wNRJ+iMS
         TWxIgPbturGFCwYkAap96GV5XilY+mjOP8h/p+3yX3Zqy5/SNW59HsbZ0/4XS/MviWci
         hwsI9MGUcj0VgrUfwGaAE8VPURCA5KmFydFL343+YotQTHx3PM69PsjwNHxdy8EW5ggw
         LKOm0TAGkvwcQfEnCBqj6rsT78UAbnzlew7mmBvGhfK3iCIgUqf2bURwIO8PmWir1JcL
         eMuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829854; x=1793434654; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        b=k059ccS55T1YaNzStugk5ne3uFifaL4k2aSKrT12fShPJOVrNwIpZsTVvJguE9dBVX
         ygElTWkmgtdIXDyK+7PyNXPPrJ9Md9fuHPq/S6rSCxD0nkfAZFvNflsz/tXuQHDdBLHD
         xL65BHj8HVU1+f0FgiCizf5ZuSn5MRY7FWfjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829854; x=1793434654;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        b=sggBtjWN3exJbMceAGbCDqLDure/2rAwqphjJuATE38PcBNQDMgU648NqNtPIdwJav
         dXRFqQ6mJErWsrk6mOsPsj9ofpU/rlnNCeY/fDSihFZneVqdJHUfjEwxYizHwCwMK7j2
         RWB75GrcIOqqi/4KcCrRHRJwkIss/5XcV5IQq4I6+00a601EiND4roKKfgGOsht5Vgbl
         jFSYOLlWTns+6kvNGkzOezO7kc6pIToKpPnVnyirZ2gm6NhC3TJS2VKdi+dQ8CnQEWrz
         TjXdPdigJjmTfiEm9ltiXsVYNtMl2nPrg73qvAnxRTJEd+VSiHIX6Q32bb/nBEBNkh0p
         Veqw==
X-Forwarded-Encrypted: i=1; AKwUvBzZSkn1WD+tOdkb7YsIKxuRACS0BUY1CVdrDiK5iG4QyT0djhZK/o3lCx8uuv0L0KbmNOYLv9+jD3QDM/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRkrVqNxjeGEtPSvCdFBqEbVGJjzMbvfeWUVfhOY/MG4FB+5Mi
	uu9Ja7HMZAWV2QVRhnoG7/dB8INM4hU2FLaCsTCLc4YsppF9FO14804f2HgA0v6GOUIrOwu0upf
	DS3qkVExv2jfZRkHTX7I5rXs1XQwFi3w+P9mict2E
X-Gm-Gg: AYBFou2DRgkSH3YfmEzE35jqsNXMiJY1Yk8RVBhLYyQfwhHW34PhemeX8xMGkxqZZQX
	YdyYVgP6PIB8wOokczl1Sy/dUb+1jEWaUqhQhjANoQZU51om00KaMwMV4OB8ZzT7UjALiSIgDPs
	72JGIq/l4PHCn/3Ck2zK6Faj3agWsN9OwJl4Nc/370sHRRfx6CLmvi6ArQoy15J7Rdu/WOIKoIt
	WxHIIvqfKLEFhetoufTmsfYe+9B6FT+SVL/QabiyB9Nb/XUf6J7k5CjgBgEtk1NUr0RaZ5D209Y
	+cPocxiGug0U/5OyfsV50G5hQlaORb6hSFrgtGUUWq70c8/Y4SyH1z/oDEQPn0Q9RCDwe2t4W9A
	H+7iOv2BVBlDOhcMtz4q2WMW1RHezkXLprahV
X-Received: by 2002:a17:90b:1fc8:b0:3ad:c14:35ce with SMTP id
 98e67ed59e1d1-3adeb0f4b03mr1215366a91.64.1792829854594; Sat, 24 Oct 2026
 01:17:34 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:32 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:15:41 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:31 -0700
X-Gm-Features: AclHuK_RH6hRiswn7VkHcSfsxk2rWaTJ0grpI4PKmWKFGktw6V3bTGvWs-_Kz3M
Message-ID: <CAFLszTgz66uz4gU6deR_go028R6MhwYuB=Jb5RJ8hqtzb5j80Q@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its
 FIT image script
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, cros-qcom-dts-watchers@chromium.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: dts: qcom: sc7180: Add sc7180-trogdor.its FIT image script
>
> Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
> image for SC7180 Trogdor family boards using `Image-framed.lz4` and
> LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
> to be built with:

This says what the file is but not why it is wanted. Please can you
move a short version of your notes below the --- into the commit
message (matching what the ChromeOS scripts produce, a model for
future Chromebooks, helping people who run upstream kernels on
trogdor)?

>
>   make FIT_ITS=qcom/sc7180-trogdor.its image.fit
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.its | 728 ++++++++++++++++++++++++++++
>  1 file changed, 728 insertions(+)

> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.its b/arch/arm64/boot/dts/qcom/sc7180-trogdor.its
> @@ -0,0 +1,728 @@
> +	configurations {
> +		conf-1 {
> +			description = "sc7180-trogdor-coachz-r1-lte";
> +			kernel = "kernel-1";
> +			fdt = "fdt-1";
> +		};

One thing I'd like to check. Patch 4 says the main reason for a
checked-in .its is to have a hand-written description per
configuration, but here each description is just the DTB filename, the
compatible is filled in automatically, and patch 5 adds fdtfactor to
cmd_fit too. So as far as I can tell, the only thing this file gives
over 'make FIT_COMPRESSION=lz4 image.fit' is limiting the FIT to the
trogdor DTBs. In exchange there are 47 entries which must be updated
by hand whenever a trogdor board is added to or removed from
qcom/Makefile, and nothing checks this. The list matches the Makefile
today, but the two are likely to drift apart. Would a way to filter
the dtbs-list passed to make_fit.py (e.g. by a pattern such as
sc7180-trogdor-*) get you the same result without the duplication?
What do you think?

Regards,
Simon
