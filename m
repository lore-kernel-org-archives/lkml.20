Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FF3190462
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887523; cv=none; b=JGTH/t1oGyHXmoqCvLvbIah6Kt4gMoUkDmtbR7454gZlS20E7vuU/RaAw84nAXcQxUfl2644esrFB3DNF0RLIruU3k7Zdv8ouBxn5fdNHU/DmOGCWeILjmtpejEby//pyHqmnOuLAXDN8BpUrNb/3l7qTrfa3xQIXG1ZSYtOt/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887523; c=relaxed/simple;
	bh=km1G/HHhK4mc4byWSgOHYVTFBTlTfLPGrUqU5+gvS1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0gpRv2Um5c2c3qmpi7HKUVeMtJOXBxW7GlHgMSoCT3NmCrh9vbM36jftN/zNO9jwfaOxIzW96brRyWSx6vVDzq3tkiV211I9e7m3u2NaKCMGWzi3t/SKf7VeA4PVEE9mFVzAk3YUEPdg9gQbOh5LGPC4m4y1w0TK9PUJrflF1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53506b44151so37876981cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887521; x=1792492321;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mGQ/GpRO6vnxq7fb84hh6aj2KXsZIXY1TgeovdND5Hc=;
        b=EO2VfAyCnKE9bvGwtyb9w/DoLfsXtwlgS2SGpUDbwzeZuO1ys/5SfKk3KoZK+kTmVY
         fY2kxj+58sCa72HPtyecxu/KVaWoTlM5CPOZyi2IDX2IpNZGuwYuiGx0dXeHDArWABln
         +oNVBJRaJRUikDxarRNMlX1w6PM13tqNKYeiOxWyWlNGsSc9q7uKx7xFhTG6P0t8Mac7
         e84TqYRCY7Q5lpRW4DeeKRURNfxTvTxfePZ/k99gfrh9AJA1dCDPFv2KK6t7jt6/xk1a
         4F56w8Dix88ybwYo5LWVgPkSGAoM3MmZp0ii3gS/S1Wpci2o0ukchd5Qx6yU82bazFzB
         JcsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjvKjLgZnt2F12+tTBkJuEM1LaWNesOZTLzqdWHClGKU6MPxa6w+czoQ9ycqN6Lda5n+buYCHRivFHIYk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUBHMc4XRCVptEMd4T6K0mpqjukMqKLxrmYwAc6QhbCBovLPTm
	jynA2P0fXq1s1pMSgStqyhfzfpb6D129+gKXzpriYRnTVMBUfyovdbZNU+0o+xE6
X-Gm-Gg: AYBFou2b/EexXVDkIcYxFhLQF5fECLtX2/SZv9rHsdYe2a5QAsj4V7QzjXTTWHx2nSP
	CJrazGfdROtj8yhvmREE9LUUiDXCV/Qo3aIogmg+NZ4C1RLvmRwdr6SlQmPLKvgUtE7lere018d
	0cptj4RQiVL4cyg6meVTAG9fZPQV93dm6TLhDwJKObP3nr3ctCvpv8j57JN5T2MOJ8a6xXZ+J88
	eQxfmtYgJjVZzxoSIILy89tJJMHcI7Yu3BdLWd/uExmUwCrsIfZ6iNPZZ7X9sDKWuJHuUbVmMAD
	+eyddQsjojkKGEH57sk9r4I3pKYN5m33anQQp0EYS7BmXFMVnw90UXDkHiXR9IThqJuxRIFLGQX
	4OcsZRH7Yy78HU7HkpYpwXl1ghXGhtYXnHc9yf7cVxI1SRAa61zR6gHEohL6/OTNrp0uRCOibkC
	MluBtOs932EDjSGTThannnTNa+EhMYPVPPRMH/D/Zf2aJ3P+CLbDV+wLvzTQrhzlrA+324EwEAv
	+26jK13xfQde3CkTvC9t449yLSeQGxC2Ch/B2oE
X-Received: by 2002:a05:622a:1f12:b0:535:1393:a82e with SMTP id d75a77b69052e-5359fac6076mr193743841cf.23.1791887521023;
        Tue, 13 Oct 2026 03:32:01 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b76eea2sm98528051cf.18.2026.10.13.03.31.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:32:00 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5339173489eso31023251cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:31:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy9rciEDIzXQNXZgqTem91FyRLOeCfCbrbg8DNxMhFuAEEogQ5UJyz5Xy9SYt43/r4sLpQjy13NOFVSo8s=@vger.kernel.org
X-Received: by 2002:a05:6102:149d:b0:7a7:ad9f:53e2 with SMTP id
 ada2fe7eead31-7cb36987a53mr4125862137.1.1791887065725; Tue, 13 Oct 2026
 03:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250718152500.2656391-1-demonsingur@gmail.com> <20250718152500.2656391-22-demonsingur@gmail.com>
In-Reply-To: <20250718152500.2656391-22-demonsingur@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Oct 2026 12:24:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXA83Dm=Mf9MFdGNH+-J6dPrZJGS0R_6hPNgC0x1suBHw@mail.gmail.com>
X-Gm-Features: AclHuK9EzHrMNGZ9VqEt7mZlsF4wljWQ4a5mjitwSzx9DSYBvOK99D8Xhx8xmLo
Message-ID: <CAMuHMdXA83Dm=Mf9MFdGNH+-J6dPrZJGS0R_6hPNgC0x1suBHw@mail.gmail.com>
Subject: Re: [PATCH v7 21/24] arm64: defconfig: disable deprecated MAX96712 driver
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Fri, 18 Jul 2025 at 17:33, Cosmin Tanislav <demonsingur@gmail.com> wrote:
> The staging MAX96712 driver will be removed as its functionality has
> been moved to the MAX96724 driver which makes use of the Maxim
> GMSL2/3 deserializer framework.
>
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>

Thanks for your patch, which is now commit e8d5a57e6d0ce827 ("arm64:
defconfig: disable deprecated MAX96712 driver") in media/master.

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
>  CONFIG_GREYBUS_BEAGLEPLAY=m
>  CONFIG_STAGING=y
>  CONFIG_STAGING_MEDIA=y
> -CONFIG_VIDEO_MAX96712=m

As Niklas has already pointed out in a reply to v5, you forgot to enable
the replacement CONFIG_VIDEO_MAX96724, thus breaking operation.

>  CONFIG_VIDEO_MESON_VDEC=m
>  CONFIG_SND_BCM2835=m
>  CONFIG_CHROME_PLATFORMS=y

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
