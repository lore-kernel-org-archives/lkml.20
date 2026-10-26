Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793038801;
	b=V4m1gJCi32JbJlyui9g5vuX/+1c6lsI2ew8YxA5Zz4idw2FVnRbH8xN0v5Z7zQpCPFGo
	 uKSBjJ0KowQc72aWwHIfq+zUmWFEB0h7oU3SLtk1BucT5QL++Px4pk4JWMwFqrrqJEE96
	 EToubgTKsuaojnfW8frsE1ce8sjEnmi5nDF+b4ZpyZD+mXpxZAdhewfS8UH//k1/Me27X
	 Kim0+R4nj33Um+slazlVzVrpxa+NL6QXMeAvy6qUNX2moKxS1Hi6NMMjfXCHPsO6Pc3XP
	 ly+q1nN1+W/EZEr1KZpMOPa1IEKAUBapHllYKVvkRtzCl37/GNhI0eMzVi7PZMgH8ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WA5AxzH89R1SOTsw3YYXHEoBQlAVi2xqh5J2QmPmhV8=;
	b=xfGS/VYixo0b3Jku+/PtvisZjvxiae1OkjnIcfxG6jr/v06SrCagMZjCyZSvyhhLKgBk
	 igo6I9UVd6m+YHA4dh4+yqw40Rdcff7jw8VBjuRBafiKVeBUAzHtHomB0bkFxWatYS/CM
	 klVjzJ6tu6vehtGXucljiCUsm3GPSNa9o10CJxqfo+7bqWybeUKx0M0/IakFx5N8l9nro
	 wNI7QKmM29UJNdziea77Mtfha/Z1cjz0GjYVPB0VVWNZi53h6nCsNgbmBB3pky9gHyZML
	 ibXUQxrP5jhCUF8emExC43POKQcnCGUfyf95xmNhYXm48+BvINbPM3pKGoodWAyUq8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Mb6V2eoO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD74606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFD74606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Mb6V2eoO
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-490d838b425so1636193fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793038800; cv=none;
        d=google.com; s=arc-20260327;
        b=gfqhhQGodw5wlt5tNDZXh/Px2PqkzV+XRKG6R4WGQ7IA/3w83rPq8nrSuvs0B4IF09
         g3yX2pVbdQhA4d3W2GMBYOFt66+fWGUOCaauryPaqHZNf6osqUbIO/DOeaVK37doKwi5
         56aBfCINz6GQUx4rzXjnhIkWJjcXrq67RrdrX23o3MBe5v1qxiMtGR6FTbcu10EYmWjv
         yjICJ8GJog7fqWr6ihnhJUEFZYw1bEmZ5APtxYMRQEmWbQ/6vi6L1z3HUbyeUVdU8eJO
         Hx5/4tAOl3xklYw2GFk5ahIiR8NoghZqnf/xSvJjn/S5TyqRpXQIrB22mwxaHnzKfyZr
         8LHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WA5AxzH89R1SOTsw3YYXHEoBQlAVi2xqh5J2QmPmhV8=;
        fh=UpN7zgf8vtkPfgWIYehP6hstZENP29pptVC7vL6Snws=;
        b=sFYxOW2gcv12MfcYCe7nbDNFARTGZ5JLfmfusdn3fbPoLDpsfixBqpPapTaFGoWC4d
         APHazyjccyR8XaRnzsXskcZtVMTkO/lHpPI2z24YkH1EWllImwFaSPscSSXlQemiGNMP
         WcntVkS3BNODiuOQpF3qfaEz/CdcRLRM+a21yhjGAPIwzmYqS1LhpoKuJGFUXC9ZAeb6
         eyqpQUCiXtMzyU6AYoeKZrx+UG3bdfx+Gozpfh5nLRwkmUR21MdaQvY8vRwpRxL7KlBm
         du55AuBLmNwPWSpfYMoXL/47ue9NeK0rLCHaz9P20NaglmzYDcJqREy3OVmL7CcfV6IK
         ffSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793038800; x=1793643600; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WA5AxzH89R1SOTsw3YYXHEoBQlAVi2xqh5J2QmPmhV8=;
        b=Mb6V2eoOWavEVv+MXTwqgbRxrNOlLO4KfXmGottrVsWG0niDFM6UKXFlXfakohM8MZ
         iDmoJgXHrwoXhoZdAjgKZs6KNIxygaE+bdPDh2IzN88Fa74xRiS6893GLeqmWr6SRWHu
         /iz74fwbywsJh/L5fUPBDm1S1VMSVJFjrBmQjuZpA6FteP6i2H7c8pe8JtlLEtBnv/CH
         EQTSVcS/iVVCxvrfqkfrXeFunfr8FfMKmN2l5XcCJ9ncV3idXP9t442k3r/RA+xqqoKa
         dgrH/mI4XRIt4HpKNgZLggFe+BRYlWEPefFOpsK60FOTzBEV0j4OGNEJM8jdF8oR09db
         9gnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038800; x=1793643600;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WA5AxzH89R1SOTsw3YYXHEoBQlAVi2xqh5J2QmPmhV8=;
        b=CKSSAI3islU9ousieuOj3zqqmtOqBvUVdL3uxa5kMuwPzl2rPzp2R484dYSlIQz4lH
         +to8IwEnLt6G7AkofbQp63ntDYwEhO1tJk6Y6aVJ6yhfstoFcPah+UZN1xVLCCRRWvps
         fT72hzoc3FFg0zB9HHjXBoCVFr8gkmNlVF/EM5CAFB696E7LlELFPUaMkw0IrLrFWhs9
         o2e3vN0oenS5ypGADmEpv1bfCmsEmmtfvi+Jxsj/AICzuY3CyPRsxr9zMkrMNVDK6kNG
         J6UunLuj4grifE7waaQpWywtji+cOkg1dBlBxFYB54EnpmbWGNb+fnk3SmIl8QowQfyZ
         /tlQ==
X-Forwarded-Encrypted: i=1; AKwUvByQ7vZWBcAgTfGCho0/0y5gbDoEaXxKhIUODm7aJDWnC97RKo7uALW5MtVUJxscFNr58pSc/3S2g+MThBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8bjz0s6gAzNIae8QtzK6tgM14ax6BKo/qiBGOdK3a8V5YXG1u
	DiMvRSuhQFH56lHDhp6ymLW1Uz4pC1zJgvRph0hNRHIcOc4QvKO/I2Vmu6Y9xwuQ/tT4H1KF4Fa
	u1sdHC94zSBqKBeWDQ6OceG2nSrfFDPm1PfclaOQefNrZDJun7pvX/Fc=
X-Gm-Gg: AYBFou3bSYd+OW/rCuFY3GmZWWTTdI2bpBb6WRdwVR8vdQgOiZdA7qG7h1MK/RB/t5r
	yJk5una1KroKrCYMLKU3OmQ2OKUF96a4E8ngMtjWPXf+Ylh7vSeFz3TDyIB6vVEyHeWplGECU9E
	04XuvOQEyFQvfmz23Ld4YtiGkLh+Etn5r/5hdgOXxvfWD7Ajqf3vx+24y8hQNoMMtWHfoIDYMUh
	6L97AU1hbH2Uy+35oCjCWakcKa35zOMLKAzDZH3yb60AZAFy5HsBNbHTlr59eZm3x/gQ+77EhZk
	wDv2QJEG6sx+bN5rAYf5sMWKo6mp6GoNYWWN3P3XV+qPxhSrqKZwwLRfJAG5HKWgOh4fbdwKjb4
	plwov6Snlzt19wdnbOJIqp8mdWHwDYVdml9OVpFVvpQJyy7qvCKfQAjKOLEyctEud7ppO7Ml+Ut
	hqsyZ0q/En5Upx0Lv1T2ShsV995pPWx4/2kS+pbVJJPHuA3MymtW/pyQ==
X-Received: by 2002:a05:6871:d3:b0:494:75ba:c6d2 with SMTP id
 586e51a60fabf-4a83f4a1680mr5146584fac.13.1793038799703; Mon, 26 Oct 2026
 11:19:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019174930.7237-1-henryzhang62@gmail.com> <20261019174930.7237-4-henryzhang62@gmail.com>
In-Reply-To: <20261019174930.7237-4-henryzhang62@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 26 Oct 2026 18:19:42 +0000
X-Gm-Features: AclHuK9tlTBZJu7ULazzmt-h2nMwB_CPhUkhsXOT5jfzH2rY1dSineF5A9oA7q0
Message-ID: <CAPY8ntAyrZO5Oi5hxDfSKHdSFpJTR29J8kUDCL7Au0QCXR0iLg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/vc4: dsi: Serialize host transfers
To: Henry Zhang <henryzhang62@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 18:55, Henry Zhang <henryzhang62@gmail.com> wrote:
>
> vc4_dsi_host_transfer() fills the command FIFOs and the TXPKT registers
> and waits on a single completion without any locking. Two callers
> sending at the same time, for example a panel driver and a backlight
> update, can overwrite each other's packets, and the timeout recovery
> added in the previous patch could reset the block under a transfer
> that is still in flight.
>
> Hold a mutex for the whole host transfer, including the recovery.
>
> Signed-off-by: Henry Zhang <henryzhang62@gmail.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>
> Notes:
>     New in v2 (Sashiko review).
>
>  drivers/gpu/drm/vc4/vc4_dsi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 2d985bc..627adf0 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -25,6 +25,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
>  #include <linux/io.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
> @@ -595,6 +596,8 @@ struct vc4_dsi {
>          */
>         struct clk *pixel_clock;
>
> +       /* Serializes host transfers, including the recovery after a timeout. */
> +       struct mutex transfer_lock;
>         struct completion xfer_completion;
>         int xfer_result;
>         int irq;
> @@ -1434,6 +1437,8 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
>         u32 disp0_ctrl;
>         ssize_t ret;
>
> +       guard(mutex)(&dsi->transfer_lock);
> +
>         ret = vc4_dsi_transfer(dsi, msg);
>         if (ret != -ETIMEDOUT)
>                 return ret;
> @@ -1911,6 +1916,7 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
>         struct vc4_dsi *dsi;
> +       int ret;
>
>         dsi = devm_drm_bridge_alloc(&pdev->dev, struct vc4_dsi, bridge, &vc4_dsi_bridge_funcs);
>         if (IS_ERR(dsi))
> @@ -1918,6 +1924,9 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
>         dev_set_drvdata(dev, dsi);
>
>         dsi->pdev = pdev;
> +       ret = devm_mutex_init(dev, &dsi->transfer_lock);
> +       if (ret)
> +               return ret;
>  #ifdef CONFIG_OF
>         dsi->bridge.of_node = dev->of_node;
>  #endif
> --
> 2.47.3
>
