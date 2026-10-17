Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B8B3C4B8D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792261359; cv=none; b=RTr8ffzn0y7hyvDIRjGICu0YRMcdtUfHptODqGkXBIUO1uc3rdm8Y21Bhy5nb9BQJOqPxCGhTLV2cxBachlqHWtrz97VeDLUAxopvDDjRS+GRIAtuHyioJWxtnBXcj9GQuKJP7u76vGynXUpJIGTNqiG4U68AjJMXjV9McRXS6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792261359; c=relaxed/simple;
	bh=pSHGp8EXL2VWTgqxVtbb1srpNASE94++qjfipyPc07U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJLIre5B8EgeY3KgAEN9PgkHIWT8tLUN3wyiCG5plz8W2eAF7WNKoqnw6TqzfpHa8lKmt4nahMI4RuPBuq7c0Vr2BhBRP+MDv3R6C8ZEzE8TdnGOvwX84AA7FsoQ5mFeqxCTLXEXuaCEbCgTc9whFZoiQloO+m21s5qPCANg1M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUQ5Cpmc; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUQ5Cpmc"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4be28b82so700788f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792261356; x=1792866156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lKYjKyTf4RjyhjQEohsiFNaGW/B8AaSxNStHaviaITQ=;
        b=gUQ5Cpmc+cekn9zZ4jhX4PUFZgG3JxNDRWdxywOc6s6Ha05Pcpa5Uc/vomv9/Wnzti
         y/ZjYvGqBd9GQImK2HVzAJPOVZzZTx0iWpEsK1NDopyMkPBZosflfH1I0F+aMAE+TBC2
         Bc6wmiuhZE9/kBE5Q1M4QfRGwG+vkHKOMzFNFCL80Je4MmcP6opl6c0uBIiUVxHPlMRg
         cd8mY0w1v11ldzEq8GH4RzwwY2P6i00do9Ukj5kSr4uGhFXUOrQMu8nMzOwwV3vycLLA
         8qFko5+MU/FRbD2g68vNMH9NCu8nd8Xb2ENf7QPwWPg0iAlHiV9Tg8xJeX/7KLefLZ+g
         KyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792261356; x=1792866156;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKYjKyTf4RjyhjQEohsiFNaGW/B8AaSxNStHaviaITQ=;
        b=RBJOSZh/789ZjNeiBnosP5F3t2ZrqAAbhreFt+AS5zb230bJd84lHfnYnutk60/2kP
         ihT2+BCtrsQ3Ox0drcya93qICQLy3L3Yi6Tg6jJ+yhohTihqg/hpJjOTYsNnqoI9uIPw
         iqB8hMzPemfi+CSQ3yKrdjx4XfUpmPP1oPSnvQI/ommoB8f9AwlVN9XQwspxD6+DTrWk
         FiENylkAu8+N8FJsgSfvt93pe/x17hM6aHU70jel4DK9YgW8TsOCXZRCfMyToStwEQCD
         V3lM29qliyc2A/um6nOvumwLtONr8keLX7Q2MdTzVUGfPYmor9DHnPGeJQWprT5ksjWX
         vNyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH5uYyFkPKIgQdj+OYY1DDx/uFoDa0x+OaoHaqzDXJ2iv8hPKkQEoFju5qyCi01Ti2RI+sGsqp5Uteot8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ+xRKqZuayYYvZk1DdPKFXS+1Wm57ZO07cBTVLPhkYP3y8iho
	tOSoEiIAAf1DP/IyK2RcFFifUgcgJZCXBMpj/1ZXTcNbSloTt94hiZk=
X-Gm-Gg: AYBFou2w9GRabKmPyGrZhx1j2tAaq2EpTIxBMbvHRFs7/YoDqMC9IOWd9D5S7ocmWyd
	n4T84m88B3DBrNWGzjusD+k8QMaqNRo/Ny2m0pIzmunOdE0OteHyozBo5Fh/ssZGEHphkVLgurm
	Duld1VVhGSao1xI1OVBmZx/D6xazWcK19lTuPuX9vmg7GAddTSpgyisRHnzDp7pU8AGfd29t0Fa
	4LcGD0s0OPXP7yNg6Gxo1t4FkJdsu5y5csNQ9LGSRkMNfBLaD7svLLBx9f8h/x9oIC5eXw7PzPP
	rbqECoYrADXn9Ry8VOA/uGE9okC1ByY6YOi5EPTh08nv6SCwfzBVAEENzQyhQFJjDnBOhpyQYfj
	njPYdRDVumtHDEN2/InPPmGrS/htBwr/guJ7sgUZ7h67qkHE6pf2+UE3yO00Ard5ZX55/qsSbEO
	44rbu25TM7JO46X+z7Agv0+rl8qDLyyKBAcGk+mzKhd9DPYE5ZfGewc1Kg06U3arvOR0y1/9RC+
	5BKZEe+YfC2fwACYGmgLXmMrHFLQxGr8d2SPR8O5SaUAZekgDk=
X-Received: by 2002:a05:6000:4908:b0:48e:f10:ce31 with SMTP id ffacd0b85a97d-48e0f10cf4bmr1238644f8f.28.1792261356021;
        Sat, 17 Oct 2026 11:22:36 -0700 (PDT)
Received: from lithos ([2a02:810d:4a94:b300:4ac6:ff14:fe01:9da2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm12750208f8f.47.2026.10.17.11.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:22:35 -0700 (PDT)
Date: Sat, 17 Oct 2026 20:22:29 +0200
From: Florian Fuchs <fuchsfl@gmail.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH] sh: maple: use the matching IRQ cookie
Message-ID: <atO85d3tjAyPiPRF@lithos>
References: <20261009040248.1136356-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009040248.1136356-1-runyu.xiao@seu.edu.cn>

On 09 Oct 12:02, Runyu Xiao wrote:
> The Maple DMA and VBLANK handlers are registered with
> &maple_unsupported_device as their dev_id. Passing NULL to free_irq()
> cannot find either action, so the handlers remain registered and the
> IRQ core warns.
> 
> Use the same cookie when freeing both handlers on the error paths.
> 
> Fixes: 17be2d2b1c33 ("sh: Add maple bus support for the SEGA Dreamcast.")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
>  drivers/sh/maple/maple.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/sh/maple/maple.c b/drivers/sh/maple/maple.c
> index 5585f220e..7df88e00c 100644
> --- a/drivers/sh/maple/maple.c
> +++ b/drivers/sh/maple/maple.c
> @@ -863,10 +863,10 @@ static int __init maple_bus_init(void)
>  	kmem_cache_destroy(maple_queue_cache);
>  
>  cleanup_bothirqs:
> -	free_irq(HW_EVENT_VSYNC, 0);
> +	free_irq(HW_EVENT_VSYNC, &maple_unsupported_device);
>  
>  cleanup_irq:
> -	free_irq(HW_EVENT_MAPLE_DMA, 0);
> +	free_irq(HW_EVENT_MAPLE_DMA, &maple_unsupported_device);
>  
>  cleanup_dma:
>  	free_pages((unsigned long) maple_sendbuf, MAPLE_DMA_PAGES);
> -- 
> 2.34.1

The patch looks correct to me and works like intended, that it frees the
corresponding IRQ handler in the error path.

Reviewed-By: Florian Fuchs <fuchsfl@gmail.com>
Tested-by: Florian Fuchs <fuchsfl@gmail.com>
Fixes: b3c69e248176 ("maple: more robust device detection.")

Just a little addition, it looks like commit b3c69e248176
("maple: more robust device detection.") introduced the issue, where the
static irqaction with IRQF_SHARED, was replaced by a request_irq() with
a cookie, but the free_irq() wasn't updated.

I tested the patch with a forced failure of maple_bus_init(), which
gives the WARNs and keeps the handlers registered in /proc/interrupts:
Trying to free already-free IRQ 69
WARNING: kernel/irq/manage.c:1880 at 0x8c0522c4, CPU#0: swapper/0/1

After the patch, the IRQ handlers are unregistered in /proc/interrupts
and no kernel WARN is shown.

And tested if keyboard, mouse still work with the patch, which they do.

Thank you!
Regards
Florian
