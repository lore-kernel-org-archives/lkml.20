Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794046581;
	b=4nilw58ELMbVYznX7Xytst1Npt7TJ/PtmdJTDtRr4f+P305bab/SRI6j8EVLgh72Gz6r
	 M5KOaDB0QhiolP7AxE5L4Q14iXGbwJJGaBsJs9c6VtV2G0QhErX6x/BqJLaLaA1inGmBi
	 VPSnOHoleruk8zURFIw8lqM6+girN4R+f2rju3Y7w2KIHvUQunLlh58M7UFIOqJUQZmRw
	 2QIoLkZxs+QORIzyCt8Ugichj5MBsx7ic3v1btAxpltDhyU0jyRCDcrd/xouVcgBHHX/n
	 o2aAa7TgC7IoJ+HxJ1daMId8dK/NrMRXO+fuG1TsON5h4fxlhDJD61MDcKzXFDdkX+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Txc3E1PcXQlFNp7c7FiKp/5yHJpupSAoBNaMzkRlDf0=;
	b=VFRPdrax9K90EUHZyvpAqDZF7FYDKCPcmRBLL6KNoukYU6ndgmdqPgNEUZBJ0dl8AISD
	 EaR/v7aW1nCjXQdTZiYSjAbDRZaWQEOrCvMd6U7EL24VyH3yeRmLcxxqr8KDSDyuh+68v
	 0I1UHb08m4DZY04EROlsH4ylMA+O1+cdrhHYjEfOtaylHmzGCZa1nLYsL0CnrjTSKxluU
	 WfFuzFkwih15exrkJbeCnKqrQCulrHkj7IMukT3MeQM/92vwPJpNj5KXRbD+Ih20ONJfD
	 KhugwssM4PtFcBsJThXzc5fdkpOZca2lYLkkSu+Or5NuO3v4HjdPhxQhTFZLLYiFcUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e/rgyOv7";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE83606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFE83606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e/rgyOv7
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b306bbff8eso10976697b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:16:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794046580; cv=none;
        d=google.com; s=arc-20260327;
        b=XPha87VVJS5oWBzBVv10mMzQeW9YTw8PwO0a0rsLypL9r/+kMzQd3snVV1ibkT0G1E
         y7XZLG8RGX40NRBRKdRwHrEh9aL5Ddh639vxFqiAJIRqw9eXxyHkYNG7cH8OtRWo47zK
         Cgwl82hZ8myCZwtWENYB7twyIVlOTEE5QLNjoFjWwL69ALFJL6qGCcZUrwmhl+5bCYuR
         ivakmyeTDFsn5sFu2x4KxZS50CwjliLmFtFhDZUkIsjTC3UWp/2s8fZ5O3hu7LBTfy7H
         Wmr0FmCYGMDBskRYvsVow+goyMgoW6gDi3GbUOdL36926yic5GQ85CyUV9ABISC4L4jM
         Ym/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Txc3E1PcXQlFNp7c7FiKp/5yHJpupSAoBNaMzkRlDf0=;
        fh=5MgHpXbUiTIaUKdf7N+qrlGSNlo8ux2QpAXfu/antlo=;
        b=ZbniOcUZU6R4Fc9tNnUJ/L8mGLtjnhmsb+XKVE4VbsUHypREp54aE0FFP4V9Hd7bw2
         VVck7Jnd0MbBKy6M3Qr/NDjqC05XQb4RSUCTj82y8T8xc+fJuOe/0IFzroQaAq/04c+s
         xYxsepf42mZ83mXBXcXihPnQjVTREbnefPp8XM9VuD7cNEGjNmRLats4Q8F8GSIw8lGF
         XStFdG4DwQQjixKMnkQOEk3snShvjOt13XXnHBVq+HHMJM+EeQ5tvK2rktFaHPziksyl
         Q2dKxZLbzIZSiUUvExCzV0eA+WcpUOH9JoD7flgP/696weIxSe5trjnaniTRm4nv91Gd
         nM7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046580; x=1794651380; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Txc3E1PcXQlFNp7c7FiKp/5yHJpupSAoBNaMzkRlDf0=;
        b=e/rgyOv7rFiYubkj7ia7wUAH1Z/153ARimvVm4yKP14CRR4nDhDwUiuERCKRbOd4zE
         ZDmWtn+b+vAz4ylq9BL86ZLvtJsnHGFYTKqbzvRwLr0u0CT45W5JVwBVAtlY8SvjI6Sj
         ZCt2mKMEFw8eApyfRFoYGDQAkuIq2Kvt/qzHBVOUmAN0+FYUYKcMY+Xs6rfib1+avwqF
         NHBlDuncErFAUgaR+ncJJ+BqJ2kAo+yXSNTWwWp9MxbZqF/jai/m0mxDrXcvvgiK9i0H
         7iMyc8db+tR1Eph9yeb3ysIu0bxF7SPlvDmWEyZTq+oW7BSb6UeAdurq756pHTKp2KKY
         Xpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046580; x=1794651380;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Txc3E1PcXQlFNp7c7FiKp/5yHJpupSAoBNaMzkRlDf0=;
        b=WGFyvSgMHwV0axPdWo4F5mIZg4C+H79fvxasNFxsbaQxBQ3JK/97nz/41W1T6mSSY1
         eX9nCWc5TVAfNiT6ToHKL2Us2CMhVBydu/tvXfT6C3EB5i/D2kExJ38VzePM88hdyEDc
         owfVIkqFrkrZHfLC0vfrFehVgfgm+yTCEbVyiJFQLMpJuDs0QP1FykDzegDIbfbkntl9
         GOoaYkEoGkMr9039va56B7RNhDcn/IUwKvo/ekTFDoEI7D/IkB1YtPT/W11PjqXuipUO
         jcyr088Bt7Q42iHvSEw/6pndzAO0g4gWQ0mhoZny5/vwebSg8R/mqc1trjcfPeelrp2o
         8XNA==
X-Forwarded-Encrypted: i=1; AL+hErFZkEbeR88EIcEpW4vP41DPC0C42k67G/BQUIQ3Qmn6euK9RHGonHR0qskofXry0gVPfkbdUa7RZx4Lm3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GSB49irSEcQOnLQQ3r9+HT7FTYxQYRTpqBi4xviDb5C46ne91
	dY0+Z+PjbeCvPUgAj2FXWEKjdl5MBjKaJybodjlSw1L2al3hw+B0bag9CZSu4pTRozlJ2XU/5Bs
	whPguQxMJBA/cwSkwWSbf+SUtjdp7iok=
X-Gm-Gg: AYBFou36t4Ag346KRGbY8xBqCItTFqna7or/HzHm/0nKkkXXcjkVxzF9FRD6zD8/5hK
	Z0LPYPZVGYp2/g4s00Wy42xCHQuT4i8PXNbFEl0tEzsPXq+Tp7PrSxM2KcGtNU56b9buy89kW+2
	xMkDxHApsNa79ib3QcYuK6RYb2gYM4v8cvV5ZtY6IuLGDWPZfiFzk6/qsjkoGpHS76j3kqLz7Q8
	x2PJbimecfGUu+E7W/+DkTgCUj4HTHniJdfgTIoR07tjY8qCVYM7bpcHrhIv8LypvXBEs3x1a2c
	Z11L4cJ0DkkReskQ/a6kJSIdoniUewNObsyHmMwP7fIOuhzP6FQqJgMP3YlryFb05iASxfRht+L
	Op+c4B2/gtEHZkyKsTH7ajRG8bT4u33SFR5B2d5lWcI1KsB0/IajEuhy/HYU=
X-Received: by 2002:a05:690c:289:b0:8b0:a252:77c6 with SMTP id
 00721157ae682-8b3418dfee1mr22332297b3.19.1794046579785; Sat, 07 Nov 2026
 02:16:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-hantro-remove-v1-1-d0a4678886d7@gmail.com> <0597b71f39fd945d531d3e996d982d5d3a3b9a28.camel@collabora.com>
In-Reply-To: <0597b71f39fd945d531d3e996d982d5d3a3b9a28.camel@collabora.com>
From: Sergei Khomenkov <shomenkow@gmail.com>
Date: Sat, 7 Nov 2026 12:16:08 +0200
X-Gm-Features: AclHuK8U4hp329_sClLRJdwqt0M9udYoGIyX3Gq2TqxXtvVHZa2zNAR132StXO0
Message-ID: <CADxDoMSrwDQfFD-VejUvh3shpo6BKjFWMzXUtsoK=t7=AhPATg@mail.gmail.com>
Subject: Re: [PATCH] media: verisilicon: suspend the device before
 unregistering it on remove
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Frank Li <Frank.Li@nxp.com>, 
	Tharit Tangkijwanichakul <tharitt97@gmail.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nicolas,

> To be verified, but its not entirely logical here. My impression was that you
> want to unregister the dev entry sooner, so that it prevent newly open, and turn
> existing fh into a mode where all ioctl will fail.

That part stays first. media_device_unregister() and
hantro_remove_{dec,enc}_func() still run at the top of hantro_remove().
The patch only moves v4l2_device_unregister() and clk_bulk_unprepare()
below the runtime PM calls. v4l2_device_unregister() touches no node
here: it clears the driver data, which equals &vpu->v4l2_dev (the first
member of struct hantro_dev), and drops the device reference.

> Can you do some extra code inspection and report why you strictly need to modify
> the clock states before you unregister the device?

hantro_runtime_suspend() reads the driver data, and with power/control
at "auto" and the default 100 ms autosuspend delay remove() calls it.
The driver core resumes the device before remove(), and its put only
arms the autosuspend timer. So pm_runtime_dont_use_autosuspend()
suspends the device synchronously, the path in the 8e26d4c20ed2 trace.
With the current order the driver data is NULL by then: an unbind or
module unload oopses, after clk_bulk_unprepare() has warned
"Unpreparing enabled". (My reading of the code: with autosuspend_delay_ms
at 0 the device is already suspended when remove() runs; I did not test
that case.)

So two things are strict: runtime PM stopped before
v4l2_device_unregister(), and the clocks disabled before
clk_bulk_unprepare(). The new clk_bulk_disable() does not use the driver
data, so it only has to come before the unprepare.

I suspend through the PM core, not by hand, so that the runtime suspend,
with any genpd power-off, still runs before reset_control_assert(), as
8e26d4c20ed2 wants. I could only test on RK3026, whose VPU has no power
domain, resets or IOMMU. A run on RK3588 or i.MX8M would help.

> p.s. are you sure outside of test build, that PM can be disabled on any of the
> platform hantro driver runs ?

If you mean CONFIG_PM=n: not on Rockchip or i.MX8M, which select PM. On
sunxi, AT91 and STM32 PM is only a default (SUSPEND=y selects PM_SLEEP),
so it can be turned off, but then the driver never enables its clocks:
only hantro_runtime_resume() does. The IS_ENABLED(CONFIG_PM) test is for
such builds and COMPILE_TEST. There pm_runtime_status_suspended()
returns false, so unbind would disable clocks that were never enabled
and hit the "already disabled" WARN. I can drop it if you prefer.

The block itself is for runtime PM forbidden through sysfs
(power/control set to "on"), which root or a udev rule can do on any
platform. Then nothing suspends the device, and it is still active after
pm_runtime_disable(). I tested that case on the board. cedrus and
mali-c55 (2c9b9bcc2569) power off by hand in remove() the same way.

Thanks,
Sergei
