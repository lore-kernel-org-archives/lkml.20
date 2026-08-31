Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C5A337699
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180460; cv=none; b=t3uDjk2RffbZze+54CQzcEzaHPvFajtseJ3wRbQ2ES0FLa4ep98zGIF2zb0uIxI8Amb9DzWPDPcM3kmzdUS7Hq0sGrta4jtHZ6HIXmonu1To6xCbnAKiYZsexisD4byiECF7CnJ1PuEXmIlgtXaDQsGGFlTYoYLnwHoV41f9LzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180460; c=relaxed/simple;
	bh=wh/usU8PfMdv8Q0zcva5WvxQQI9WUSSFSzU9ey8jYxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2DVtAeprTtO1Pv9nnqVM4xAeHHg+81Odpe1zxn/IR0NcrZw/GORFNkEXl1fnhrrrMe7E4IKssDXEzvYfaOHY2ekSSl/lpF/ItmboWONUAvkeHM8H+E2gMNC5SUmpGRQfpdiWOOTpAM9KPEOtja+cw7wZJQ/nJVjqyJO3zHVjRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aW4FYJdH; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aW4FYJdH"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3964e480f76so4150750a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180455; x=1788785255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wgm3ZGfYPmE/vTxPbnTRUSBVqhRpYYPYKdu/n7NN0+A=;
        b=aW4FYJdHMvAHmv43bxg7/qcAGOr31VqhPy/9bev0g84ZCZQEEb+Gxt9ZmtSpgF/Ol6
         65TkabUFwCw6yAUaIkeVpV7vKkqAFDeVYnUYeMw/OQhFmsteWE2QDzNaPFFnf3gY6fF/
         lbZJHUjhYxQFY9db4d9DgWhE+5LGoNidK8eGf8o2EzQPzDqaZfTKG2kujBo0lXBp7lVE
         C7TbscmlSA91LWQFHoPfIrYkxF2o17RLMj+eqi2IxB3vbE2bCDb/8Ujl9KeZJjEeoLOc
         HkuxyCQM5g8S4dtESlHuiY5yeSiNoVU1RglVWjt95EXBZ3nzQBjzKbXy8zZN7we3J3Oo
         +4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180455; x=1788785255;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wgm3ZGfYPmE/vTxPbnTRUSBVqhRpYYPYKdu/n7NN0+A=;
        b=hBrMOGgs2xTp4XoNq2h0yNBa3v73MkCbolDMHicFJLhlfov/jXk0PCuPpBq/QWkBVl
         phBRecljLwNBTl3gVlT4jHx7H3xYmT4v6G7pZcVH6iGLYcIvUxzo+A+Pc9Cr1rnP9SlW
         yHBZVgh/eyamqJCHhr0S9dMgtxC5u7sCwgzFFiEwYMD0dUNcfd8ETan4d25V+peVtr/W
         UmsMCWTBaJCx/7lmx56Ybmu25M/pAZMVGangzZ8yohwLmIuEjJ5EbCNScyTCCVKkkevr
         q2LQT8OWnen3B5hrHvnR5cAxW6slKl9/xZnkSdf7unFOA8n4TGs13b8nThjNZ1uDT5fw
         s0Zg==
X-Forwarded-Encrypted: i=1; AKwUvBzQkSj/YmmJ9i6VjjfcwXWjfhoRfXE0J+3Eg8DI2zSkMkp5WDOr4EFuSiddF4Q39ehFfko1VHiOuYC0W24=@vger.kernel.org
X-Gm-Message-State: AFuF++mdqfyIRgN2irO33g7ZId/p90DsVhoup4exqNpzHZCImnEubS43
	cPr1G2QBMslZmXztdMjiUxIhM0HKGEepDqIdeKX4K8dUPkIQ5vKPx1OC
X-Gm-Gg: AYBFou1QR+sxHUHYzN/TpBEWJa1BMBnE13UlZBVC8ScbCGUkUp5NSPHvAz2DzJEGuKS
	0zqkQsBw9+SeB5YCBVxFxEO8rNl0vnnsLZrOrmGBRz6g4ywvdbr2gVF4nY21OqtossPuBaBqfhh
	jzQM169atnQPzVG2GEiUXBbclH8ZTKWZ74GckoT6tVL7oqPM++AIDfyg+EH/rvM3Hz9L1iuFHKK
	dVBRVeDbb86D5clYFRsBH1XLhWhyyRncDjAxbekntFp756H3TzzDMIOzfviuBsgrINCrGapUHiN
	5mDhQjbX+BvZ+aen2hgaIHm8rP8jDGOQZ9RtUp/EFHqhJGFYSx6aZAT679x7nxqc6kuwylFWfoa
	xfzBGwDy3NemLfyuNAILZ7seepo765RJow4dXmUY2vUp3zAlwSerKZwnPBgB1+PhzNGbnd0jpwK
	Va35B3GeknJyEBlw+WM96ZOTSYix/8V7/vtkP6rlyNChgXGgFCwHyR2OGzjiZcTJ9EGbuCDfi9B
	KHHcQWQLbOhlMH5HIT9NEI8CDlyKQ==
X-Received: by 2002:a17:90b:590f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-3989be5b4bdmr27613593a91.18.1788180455457;
        Mon, 31 Aug 2026 05:47:35 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:15e9:e9f4:23e3:4f32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa400c8sm34340875eec.30.2026.08.31.05.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:47:30 -0700 (PDT)
Date: Mon, 31 Aug 2026 05:47:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] platform/x86: x86-android-tablets: fix Arizona and
 Crystal Cove GPIO lookups
Message-ID: <apV3jbqWfNRa8zN2@google.com>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
 <eadd7091-c61e-4fb7-b1a4-cf307108b199@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eadd7091-c61e-4fb7-b1a4-cf307108b199@kernel.org>

On Mon, Aug 31, 2026 at 11:42:06AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 30-Aug-26 1:15 PM, Dmitry Torokhov wrote:
> > When gpiolib dropped name-against-label matching in favor of firmware node
> > identity mapping, lookups referencing unattached software nodes (such as
> > arizona and gpio_crystalcove in x86-android-tablets) stopped working.
> > 
> > This series fixes the lookups and cleans up redundant software node
> > registrations on Lenovo tablets:
> > - Point Arizona GPIO property entries directly to the codec device software
> >   node, which is attached to the parent device.
> > - Hold a device reference in gpio_secondary_fwnode_init() to ensure safety
> >   during devres action teardown.
> > - Generalize gpio_secondary_fwnode_init() to accept a node group argument
> >   and use it to attach crystalcove_gpiochip_node as a secondary firmware
> >   node to INT33FD:00 on Lenovo Yoga Tab 2 models.
> > - Drop redundant swnode group registrations on Lenovo Yoga Tab 3 and
> >   Yoga Tab 2 models where codec software nodes are already registered when
> >   attached to their respective devices.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> So I've given this a test on a Yoga Tablet 3 (yt3) tablet yesterday and
> there everything works.
> 
> Then I also tested this on a Lenovo Yoga Tablet 2 1380 since the YT3 does
> not cover the crystal_cove GPIO case and there things do not work.
> 
> It seems that trying to get the crystal_cove GPIOs indefinetely returns
> -EPROBE_DEFER. I'll try to debug thus further this evening.

I wonder if the patch below will help.

Thanks.

-- 
Dmitry

From 9376af2b6a9c91cd6a05969b583f40d451050988 Mon Sep 17 00:00:00 2001
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 31 Aug 2026 04:59:24 -0700
Subject: [PATCH] gpio: crystalcove: add missing MODULE_ALIAS()

The crystalcove GPIO driver lacks a MODULE_ALIAS() to allow it to be
auto-loaded. This results in consumers indefinitely deferring their
probe with -EPROBE_DEFER (waiting for the GPIO controller to appear)
when it's compiled as a module, as it will never be loaded.

Fix this by adding the missing platform alias.

Fixes: 104fb1d5153c ("gpio: Add support for Intel Crystal Cove PMIC")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpio-crystalcove.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 0fb5c06d0886..ab7fab5b9754 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -396,3 +396,4 @@ module_platform_driver(crystalcove_gpio_driver);
 MODULE_AUTHOR("Yang, Bin <bin.yang@intel.com>");
 MODULE_DESCRIPTION("Intel Crystal Cove GPIO Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:crystal_cove_gpio");
-- 
2.55.0.897.gb25b4bd76c-goog




