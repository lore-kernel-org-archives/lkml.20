Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85572F6586
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 13:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788614722; cv=none; b=nEiTtuyTTNcAZRsA+E7VkHkECloHko9GqeFWTd5TuBmXmfsRnx/W2EjHGO0nd5+mEXj3rYMhlyvkWEl3zhznUnglRUOeMTtItdFpODpUlYV8GcFC+pc/Wt74ourJ+Io9zGKMMoLaLj7lfG6ld8hQzRyFsKmzXKWMmmgv1jMpbOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788614722; c=relaxed/simple;
	bh=zwVZk6yADPSWAfQ0owoqV2RSMh6J55ZPFqsn5iAD2Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bc5CYBTZh0K8PTY4v6HzYluiwbGrACiWSwy/QKG1LAbPhbZ5RMqqFCZxH+Q8SETORnS9m8ieady13HZqX/5R+EUGI0scw7wvFYPkNJAQuZUqtTm22+l1phiILPXS+IFtl+SjJqCGd8U6NbbqkOm8Hd1F7H1pEIuGG019ZQGGcm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=jMybVybU; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="jMybVybU"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-855d2bfae95so3550451b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 06:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1788614718; x=1789219518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UCPQY2s7Li9KbXRAy98AdJWgLwoyUR6+yD7sEQfOnDg=;
        b=jMybVybULhqNeGPNgWLhZ4vNSTYIJKNUPn+15yLTtSvNYVrq49nXpbPiw8JZR5Js9K
         v4MzhfODNktfAxYz4yaqHbZ9hG4UM9Btd7uqh9dmOVwIs2XVvFdZMbPJPobEmfw5kZMJ
         NH8yeQgHJsbqltgksXYCrfs6cH/F5MVUuyu1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788614718; x=1789219518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCPQY2s7Li9KbXRAy98AdJWgLwoyUR6+yD7sEQfOnDg=;
        b=h5839f031I+c3BIb+1/tjl5MQguQdkKOI4nNtrAFvnYaK082xnuhn/UxlGni1gjusQ
         TTy61X3zkqE2e2lNlTo2ZrMRffWQBQjPoozoOvxuAP0pPHGnlgSLNrqF1oc7Hs/Gvgv9
         /u4oXZElePn7WCBQqOW2/CSXbWV9YtztcjgneWZdezGXj7sU9To5fGdNypjK4G3SZX37
         GNiIzejG4XEvayoeJhkBAtugafsg1U57p7KpRylBKP1ASN6Uo6N8OgT/9qfR9v5MhaQq
         /vPMwTv0YG0/FUOHyE3lZ2C/Ix1GkmF7jhDfRF/O3dIbShGAPZKpncWjbeGJ+CYZMvsd
         KdQw==
X-Forwarded-Encrypted: i=1; AKwUvBzKPiGq1OTrn0jBwlVkdnq+G6UyjwH8Fs9mozpvEW8SKH926wDpmMMdiK7q6ZDjB6jF1ROm5zvJgFdXhew=@vger.kernel.org
X-Gm-Message-State: AFuF++mmqzDJmuJebMVlmJJ7vKR6Fa2Akr6j6SBa6U1bsq3qiatGzv9d
	yCFEj69WA3qu13jUSj2gSaI+4wLQdDkgwLMi02XG1LIDEoSI2KfV7zQhqJNWQviXtdo=
X-Gm-Gg: AYBFou3zHYcuMm7xa+4PVBOmwwSRSTXDUIEA/IGD+0fPJpfOxIlTji2fxIO6SM4YkOy
	AXWW3HuasyT1cg5Ck8+JMbY+lE9R/ztlG7AqacaTW1PigqLA37ijFO88mgfCSPdr1Od8Xsp/R9B
	+Uz5dQH1UFP93tRLI1uDIwzmS8iLumYJLfxrRKqBQmy6osG36MLwXLAEUciG+nCR+V8IfyapEBx
	p/CSlLJsy2YpV4CycDrMrzsO296ik6EbbTXMEfMM8uBQaB4/H9z0gSw3xewBt5jZhzJqcRmxRh9
	gex6KfdMdfJMd3vFOiDhKmOaoN9foJcT0E2cEuYI4wFotovhqRXPdzYL2UrrDNdR+eIF6Vw6nMy
	tqMTmfr2GN/OFP5vA/HnKel0XpumrgjTO/+BxXfylD2lGEJZJbNrKIvhnaP6Ln/Xe/zfkcnQwmg
	7GckjYY0l35Odg0H+CAxliRipYAYL7PLTZRT/GSVAlqK/yDOpK+gnwtXLV9v2svZPT
X-Received: by 2002:a05:6a21:a395:b0:3d3:aed2:6f28 with SMTP id adf61e73a8af0-3da2168b2c9mr18634503637.28.1788614718057;
        Sat, 05 Sep 2026 06:25:18 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc465376831sm903641a12.9.2026.09.05.06.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:25:17 -0700 (PDT)
Date: Sat, 5 Sep 2026 22:25:02 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jiaxing Hu <gahing@gahingwoo.com>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] accel/rocket: search every core slot when a core is
 removed
Message-ID: <apwUewaRnoTNXHCt@rock-5b-plus>
References: <20260904125936.26234-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904125936.26234-1-royalnet026@gmail.com>

On Fri, Sep 04, 2026 at 02:59:36PM +0200, Igor Paunovic wrote:
> rocket_remove() decrements rdev->num_cores for each core it removes,
> while find_core_for_dev() searches slots 0 to num_cores - 1. Unbinding
> the cores in the order they were bound therefore loses the last one: by
> the time it is removed the search range has already shrunk past its
> slot, so find_core_for_dev() returns -1 and rocket_remove() gives up
> without doing anything.
> 
> num_cores never reaches zero, rocket_device_fini() never runs, and the
> file-scoped rdev keeps pointing at a device that is going away. Binding
> the cores again starts from that stale count, because rocket_probe()
> takes rdev->num_cores as the slot to fill. On an RK3588, which describes
> three cores, the second round lands on slots 1, 2 and 3 while rdev->cores
> was allocated with room for three:
> 
>   rocket fdab0000.npu: Rockchip NPU core 1 version: 1179210309
>   rocket fdac0000.npu: Rockchip NPU core 2 version: 1179210309
>   rocket fdad0000.npu: Rockchip NPU core 3 version: 1179210309
> 
> The write to rdev->cores[3] is past the end of the array.
> 
> Nothing in tree reads the core array often enough to notice, so the
> overrun is silent today. It turned up while testing a devfreq series on
> top of this, where a worker walks every core a few times a second, and
> UBSAN caught the first bool it read out of the overrun entry:
> 
>   UBSAN: invalid-load in drivers/accel/rocket/rocket_devfreq.c:47:10
>   load of value 5 is not a valid value for type '_Bool'
>   Workqueue: devfreq_wq devfreq_monitor
> 
> Record how many slots were allocated and search all of them. Every core
> is then found on removal, num_cores reaches zero, the device is torn down
> and a later bind starts from a clean rdev.
> 
> This does not make unbinding a single core out of several work. probe
> still takes num_cores as the slot to fill, so rebinding one core while
> its siblings stay bound would write over a slot that is already in use,
> and rocket_open() still reaches for cores[0] whether or not anything is
> there. Both of those want more thought than a fix should carry.
> 
> Found by unbinding and rebinding all three cores on an Orange Pi 5 Plus.
> With this applied, 25 unbind/rebind rounds and 5 module unload/reload
> rounds run clean there: the cores land in slots 0, 1 and 2 every time,
> whichever order they are bound in, and the shared supply goes back to a
> single user after each round.
> 
> Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> Assisted-by: LLM sparse checkpatch
> ---
>  drivers/accel/rocket/rocket_device.c | 2 ++
>  drivers/accel/rocket/rocket_device.h | 1 +
>  drivers/accel/rocket/rocket_drv.c    | 2 +-
>  3 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
> index 46e6ee1e72c5f..efd004194c1af 100644
> --- a/drivers/accel/rocket/rocket_device.c
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -31,6 +31,8 @@ struct rocket_device *rocket_device_init(struct platform_device *pdev,
>  		if (of_device_is_available(core_node))
>  			num_cores++;
>  
> +	rdev->max_cores = num_cores;
> +
>  	rdev->cores = devm_kcalloc(dev, num_cores, sizeof(*rdev->cores), GFP_KERNEL);
>  	if (!rdev->cores)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
> index ce662abc01d3d..c62d567010696 100644
> --- a/drivers/accel/rocket/rocket_device.h
> +++ b/drivers/accel/rocket/rocket_device.h
> @@ -19,6 +19,7 @@ struct rocket_device {
>  
>  	struct rocket_core *cores;
>  	unsigned int num_cores;
> +	unsigned int max_cores;

Hi Igor,

I've tested this patch in Radxa Rock 5 B+ and it works. The test is that unbinding all
cores in sequence 0,1,2 and rebind all. It seems that there is other issue about num_core.
For example, sched_to_core() finds core for sched with num_core and it could make same
error like find_core_for_dev().

Tested-by: Sidong Yang <sidong.yang@furiosa.ai> # RK3588, 3 cores

Thanks,
Sidong

>  };
>  
>  struct rocket_device *rocket_device_init(struct platform_device *pdev,
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
> index 8bbbce594883e..2bcfe4ab3c68f 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -223,7 +223,7 @@ static int find_core_for_dev(struct device *dev)
>  {
>  	struct rocket_device *rdev = dev_get_drvdata(dev);
>  
> -	for (unsigned int core = 0; core < rdev->num_cores; core++) {
> +	for (unsigned int core = 0; core < rdev->max_cores; core++) {
>  		if (dev == rdev->cores[core].dev)
>  			return core;
>  	}
> -- 
> 2.43.0
> 
