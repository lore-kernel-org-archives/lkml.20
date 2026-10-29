Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793300810;
	b=aqftkLsYk/5VRAWFlUnTwb9LSeldfUaaGuNnHSglVZ62nzVfLTLwOYNusNqJTkWm/8Dh
	 2FOdCgifIL0kadHxLekKJTvB+ArEALkckwUpuS91AVoBR92KGOpbE8eBZm9dNFR49nrLq
	 vnHBCehDDA2A2rtuRzdvTNnN6e0B7k2GODt3P4CvEpfeFFrgyBrR9EOhggUwTwGU3s3zH
	 htPiS43I4TnIC6+ggW9ZaOzsTqk1eEGngL1Q1VuuKuQOjoGhe5Iy80MGnwXBj/I8Y4izG
	 p+WfuLPehDg0n4qaGTVbp/NrKt90AxQtrZatzBwWMpQ+vZD2U0dy7bfXGpiO/1x6rvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rWF5af6pEo6EMA5BmrOrM6NUXFElHsCaPEA1nqKLyVg=;
	b=NBioPdc42V4grT32FxuU2yNzXLIlS5CeShMSatCo8B1uESHsyLVvMXyK3xIUpbHdeql7
	 lFv1HiA837UFAS9zKJB5qN3rwuoxLuFAzfDaMDS3lk0HWb0c36HuOvuN4S4vxepHxKQMz
	 eiHNuXSCeUUSjWi1OaEGvnFE/TEnYiduQvZ15lHex1YaIOO37wK/JI0T3G3tboc6atsUz
	 eLtSk+to3HakQ898741axW5A3oO3HBkVWLwlwZj1aLx1MmeHDuqxbmidYeEfuboROCHEB
	 OkTvJ+ezuhMzkLWzZPBf4WjrDH4JzsW1AOuD9wQHHGi/COn71SyNi6BZiAjKMEqwqog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b="fq3P/m36";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C42606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C42606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=fq3P/m36
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9441591aa5cso97446385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793300808; cv=none;
        d=google.com; s=arc-20260327;
        b=XXi76n9bWtwTJ2cTR7F7nM51+DpSkMjOI4ufhai9pYs/XOFuR5wGm95EU+fPPk7dZ5
         DOosrnn3x1GmaMpatK8eJXAnRF05IBYtWXGEJroAwVMXDwls6ha8WgaduKEohoJoXgtS
         4+hLua5ngue1AhuHEOB7ITRYcYv0OnaPks5KgyZF27b7LrFzaYRllvrYbUWsPsQPUBdT
         1aWq8Ob7CHtqpEn5oejwjWemLUGWppexLa7mEkK7QKMZZQvg0j+EZkVyEG3GqWPRymQM
         VD0xbaNSaPvhAvBFlSRGdB0XmsqB9ZdtEywtO1A6eNMjTvZ95oBkBACq1Rd/jVgQc569
         X4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rWF5af6pEo6EMA5BmrOrM6NUXFElHsCaPEA1nqKLyVg=;
        fh=6p2vD8+1Gy7HYMbX7lYMOf21eM8kcAlpk2s+X0+r41M=;
        b=UiNKedSQFTsIbkS3Pi1vXNv5u8ofopQ5w8SNmpBoQ9UwV7jQJ0m/zJTWd23Ly3R3Lr
         dg8dCCxcSVIVxw1aYBrrXz4i42lXHIHzwGvNd4BDKKmD9CvZ32TR2wNkhh03Z0qH2tY7
         4crycjlEBdqXiOqjmUzxWTWLKBqzbmIpZhQOV4hTr13B/E0h2KIC71ogFHa0A3N5MnYq
         20jObFoQxioeOqha16asmA3hcFE6GuAIBEtNSCDxepCwv3Kf4c/bZhHrCtvJbdFyn4m3
         jZYN6+TR30m6dbXkVrJzzwILp01syZI2204FesBC/Zi9M32KwRmDFxteXmesDZtemhx3
         6dPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793300808; x=1793905608; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWF5af6pEo6EMA5BmrOrM6NUXFElHsCaPEA1nqKLyVg=;
        b=fq3P/m36lKgYONgkNlKcJ2n9q0rQ0cY5YBE2kgtoKPzSV52E2ZypteL0Z0QDoMPJDy
         MqKYMU7nlRPyMwaBc/K4f63oDt7/GI+zLotT2jdIqr/cn8LWVvuM5S3NB16IEWb50Pzx
         szMF1kAongd8ARPufQSofgIaIR9PWT/MTiHGTkaaQbRddlhNy7GlPdAGkm4RAWEycbhX
         QJhWQIf+HMbAuwyqCmZMQPYm89pOlKwV3HFOJ+XMI0+QJZfITDfaTys8G1Ibtw0xQq8s
         1vl7SKsV6+wyBk9JEIELtxaZyuCIfxnbr8H2iSAVdFHO7TBOnR78aXvzviLBRpQcjY8x
         RFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300808; x=1793905608;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rWF5af6pEo6EMA5BmrOrM6NUXFElHsCaPEA1nqKLyVg=;
        b=UIPnL2jHsYHQVZIh51pHUSHIcwncrTP6cwEDHyGh11XI/8I7q7RCt4RQc7jwHhIG64
         vaqHoij4gkJefhDqV+eOPiIJe5yGncurH0DgRgDJPgproHozc0f0TOqsjKNSQ3/NwS7k
         qZY/g3P/N/mtuOOlZXkssWpwy/BP9mUdy4pwHDO4wUqyAd10RIzqDNELclHEgcWmT4J5
         fke5TqYyC6NLdpXYVpGokSPWABtbH5Ym0KyxGLyepY2rgZjH1OvmLjWRTi1/ZzzqfqJo
         iL6O6bZ9RiKffSJmIGgzsSJBd27Yvspj3Y0dxpAKu3FN1t3a+6LBKSmSxfRacvIUzd+0
         S4qg==
X-Forwarded-Encrypted: i=1; AKwUvBwrGyn3osQXvQ3PufOZ6FOLv0eTRqtJrD7ueY7/6qPhM+EogieOTSZZn7DA5O16CP9tOXY3u0MkC+k9BPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkBxR73EQpQydlEulixehgHHRekxI9L3YiZ9/K/p4FUu1iVoYz
	NUe4vaKHxWrnJ0/ioSJmjPbvly10W/DAo1VhPQsIco+DSR7+GgABEFtujVguiFcP3a5l4ADecDV
	QykeSat3AlJj/ClbTQJ+O5KB4bmAT1E0eE7HNYXGdTg==
X-Gm-Gg: AYBFou2BdesaIWIne3twqLI5xeptIRB/0z6FSwHmzukMYIsUgSuHcxeedPOYyUAoedY
	CYCx34FMouS7ZThCUhsakWM71LVYeSEAwMDn72o972cKt7Kcjy9xiBOWfWLKisey99UMw5FUZWo
	I/WaDCxuKpB4kCwjR50lj9v4/ahc/L0DqaibQVq0SZQHO3RM3POln+HN6uNbyE+8z9bi+1uON3x
	ojzXTF0UtZXU+BZalNWbTIU9rBjjBIANur/OwIHO8AlM/2OAXMJ3YNEnU8VML50PPqDSRTPBxgG
	jZrI4qWt0Iw1V6Zp8eS2AZNkn6EouVR3XF9BzkAt9b9e9VETLk1Cj7olhhdZtmQP0Rj/dXd9RsQ
	JTqs2dpomh9xYxoWJNiqqU+SZzk0eIzSDd9vI5mMXE2yRV8fenH9Mxu2UXj/vga7kh/z1g4VPo+
	CeK4qe0Wl5UpynpRRJlYEDL/8JwSzZ5ysTyJASfYPDtwOjloUYP+Kp7w==
X-Received: by 2002:a05:620a:2815:b0:944:6ad:1b7f with SMTP id
 af79cd13be357-944133c303emr496752985a.32.1793300808018; Thu, 29 Oct 2026
 12:06:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028112154.855185-1-antoine.pichot@gmail.com> <20261028112154.855185-2-antoine.pichot@gmail.com>
In-Reply-To: <20261028112154.855185-2-antoine.pichot@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 19:06:31 +0000
X-Gm-Features: AclHuK_Jd1_q7feVJfoLbgxqQ5EoRwMls_1DdxR9BDGkGVOV5XFZSQbDS8rlPb0
Message-ID: <CAPY8ntArdj338V8bcSxrmwKQecy-pAcCXMbkWy=qLckX=hawNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] media: i2c: ov7251: Use in-range PLL1 dividers for
 the 319.2 MHz link
To: Antoine Pichot <antoine.pichot@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	mchehab@kernel.org, hansg@kernel.org, andriy.shevchenko@linux.intel.com, 
	dan.scally@ideasonboard.com, djrscally@gmail.com, dmanresa@gmail.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Antoine

On Wed, 28 Oct 2026 at 11:22, Antoine Pichot <antoine.pichot@gmail.com> wrote:
>
> The 19.2 MHz PLL1 table for the 319.2 MHz link frequency puts a
> pre-divider of 1 before the multiplier of 133 and a divider of 4 after
> it, so the PLL1 multiplier output (the VCO) runs at 19.2 x 133 =
> 2553.6 MHz before being divided down to 638.4 MHz. The OV7750/OV7251
> datasheet (rev 2.12, table 2-11) limits it to 300 to 800 MHz.
>
> Use pre-divider 4 (register 0x30B4 = 0x04) and divider 1 (0x30B1 =
> 0x01). The multiplier output is then 4.8 x 133 = 638.4 MHz, inside the
> range, and the MIPI clock stays 638.4 Mbps, so the link frequency does
> not change. The Windows driver programs these values for the Surface
> Book 2's Windows Hello mode.
>
> On ACPI systems this table has been unreachable since it was added,
> because ov7251_check_hwcfg() selects the wrong index. The next patch
> fixes the index, so the two must go in together. With the index fix
> alone, a Surface Pro 7+ (IPU6) had CSI-2 errors in 7 of 10 150-frame
> runs, 3 of them stalls; with this change 0 of 13. A Surface Book 2
> (IPU3) streams clean with either table. Dave Stevenson measured on a
> 24 MHz Raspberry Pi board that the out-of-range tables miss their
> nominal frequency and proposed the same values. The 24 MHz tables are
> left alone because nobody in the thread can test a change to them.

I have a 24MHz module and had tested with it, which you'd acknowledged
in the previous sentence.

You've got me sidetracked into doing the cleanups, and that has
included validating the link frequencies on a 24MHz module.
I've pushed where I am to
https://github.com/6by9/linux/tree/rpi-7.3.y-ov7251. Patch "media:
ov7251: Add support for a 400MHz link freq" fixes up all the 24MHz PLL
settings. I've also done the conversion to use the V4L2 CCI library.

The cleanups do raise the question of what registers 0x3016-0x301c do,
and which of the 2 variants is preferable (60 and 90fps both use the
same values). The datasheet SC_CLKRSTx naming isn't exactly
descriptive. I don't suppose you have any information?
It would be lovely to ditch those tables / merge them into
global_init_settings, retaining ov7251_mode_info_data only to provide
backwards compatibility with those clients that use
set_frame_interval.

Feel free to pick up any or all of those patches, otherwise I'll come
along behind you and submit them.

  Dave

> Fixes: ed9566ce1946 ("media: i2c: Add support for new frequencies to ov7251")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/linux-media/6ae0e944.b6db0abd.16b13d.d261@mx.google.com/
> Link: https://lore.kernel.org/linux-media/CAPY8ntBFJJPg3y46gC=bNq_55QifC7mKmeq8+pAEDVN42fGUXw@mail.gmail.com/
> Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
> ---
>  drivers/media/i2c/ov7251.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
> index fce6344b5120..f429de5f1f7c 100644
> --- a/drivers/media/i2c/ov7251.c
> +++ b/drivers/media/i2c/ov7251.c
> @@ -174,9 +174,9 @@ static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_240_mhz = {
>  };
>
>  static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_319_2_mhz = {
> -       .pre_div = 0x01,
> +       .pre_div = 0x04,
>         .mult = 0x85,
> -       .div = 0x04,
> +       .div = 0x01,
>         .pix_div = 0x0a,
>         .mipi_div = 0x05,
>  };
> --
> 2.56.0
>
