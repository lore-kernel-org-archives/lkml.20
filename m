Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D27E55C324
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894585; cv=none; b=cMgXb6tj69E3B1ETNvFqN7rgPYYpUtGbob3d91z3a9upa9jfnNG9F8b8axdd5M6ehay6FMG4OWB9oNklZjeQcuZFd9zaPNIWMZZXS4Q7WpK7Jz4t9o3PAxlbNbpfv2dKT4XT1u2UibbwgeON7y4fooWv/2pG4pNlil1xuMl9Mys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894585; c=relaxed/simple;
	bh=IcAawRnObFPysnJmjNwytmKHCHwqA3DD3ILgLIKfS0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8Rm4lVTk2zIHq/3uoOqze+KRTreuturdBjYZ2Wh/2QpK9fefrn+VjdVh4QFRi0FTvc4qvPdRbkooWrLdTdhXdwcmPNo5467Op1C3xU+6V+ziRIqxUhNZMx2Se/R7WJaUnEhgKJKQ8SlqohZ4RrWE6GpgCckIhEyHnt3OY3+8rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTEf092u; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTEf092u"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b4ab40d839so4734873e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788894582; x=1789499382; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JzCxaqYiEeBDnH0h79ydYlAnHFlqut2ERcxebrbyVOA=;
        b=OTEf092uMsYIJV0Zso0FXSpDMWYZg63a6f8i2200U+haujy7iKqxrLPUfbJ4MKnotj
         3oCXokY5TG+d9XEwDpbgrXNFT6Eg38VCORRP5dRcnwcTiZRO6c/trgg2QJ53B10W6qEU
         AjMV7bRrrs2tiwqnBp9xsf26eCO4DWEF3AGy/tVqwSzOQNqIhSRiXcHhuyNLZEOWM1Oj
         tN9i+8fYi6UA42cvfQQ/56Oc0Z2pRxuPrNFJglg37YtoHFPA2go387LTxFDFKuidShSz
         YS95UEXtDYrsWxtXRbxRhJCMiFHSGYe7IyNNe18Mf7LlPFdIo0tf6DtKJNN+mlyTIOAP
         rGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894582; x=1789499382;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JzCxaqYiEeBDnH0h79ydYlAnHFlqut2ERcxebrbyVOA=;
        b=FD4SZujuHiRclgArG7QCFm0VZyVNbJXOQXm3+FrRFBqjR6p+XguLXSMnfv2ULgah3m
         ihRfvHAOACsQJFuMpZklCaQtTN9SrXV+9aTJcxVyF6LFGBMg6tmXxId6zLFjuviudeHF
         EZyTLoZ4UuKnCWwqVEwx9MjHEWyuLujrd/445lb8gN01kSeuMJ89DYlBl14TgCeWhOkk
         A8KevFwn2RzVedT3d9OS4jY8ekr7ZmmKb3fwe9oZTtOdkxG427LdKJ6UF8TuR1a3VVbR
         HOHgBAA3d9Q4ly5f8cVbvIwB9MyeFs5Cwvjh2bLLuvvK4GOgvZVAF11AFErMpsI8LbK+
         Iajg==
X-Forwarded-Encrypted: i=1; AKwUvBx4BqmJFu1LpDAkSODxyOamsdDaeANgVG8k+rY8OqA6ta4aTLDNzsuqTGevV1JWTgXvSBw3pH6GCDwSl14=@vger.kernel.org
X-Gm-Message-State: AFuF++nGwPKJq0h0E47jgnEXGDjmsWht+swUsTmSnd4Uqqr3ER9woUaK
	mXNR10B6u8YXFoTi3ZO2LCzrRVjK3jbl6IcDUEbeHtZO2Qmh6sMES+d+LnC/m3J/
X-Gm-Gg: AYBFou12vDXdMQG90PmLiDGs7OKOXI7oGNMUHW6WYlwIkDv9LW6gdbNO4o3OKfsLn3/
	eoPZ9cNt98OmNIsvs161E4qAsI5P4i0PukCjHaGkhUCd76QP5e61sbE6PuW1LBrxpahMpJW20Px
	hNQKXFwskfc+yESPvSl7ExfXZeBgfkpluThBNG7AcbR9+XpNvsNQ5wbhDzrduFgfJKfuCqCLfon
	OQLMLq2IchI2wy2gwGfWnFkFHaEWNcTaJsy9YsA7nPqihHzY218NooKZCKIN/gB57PpcTnJlWe3
	xDLQ6sQVPFX5ITQNlp49UJUaviEuUDhRvyportTtYWRmGesF12iKxATxYKfWTC3jxky9iRRSuE+
	OI/kBxR1QQxrVhdpzcBbrJoHbSkxddhMrUth0SZBGBmTkOMsAE36N93Aql464qTc1sPeVNqZmT8
	vpuTqrlgw+mWLN6d4yDN/FeHdtGRh7RPRFQ/24iZctv1GVDaWFjIewmEzh/v1gsndLBbcdXk+wK
	G9R
X-Received: by 2002:a05:6512:15a1:b0:5b5:e3b9:2236 with SMTP id 2adb3069b0e04-5b616edef30mr4548116e87.1.1788894581868;
        Tue, 08 Sep 2026 12:09:41 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed4dcsm3212290e87.20.2026.09.08.12.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:09:41 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:09:40 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust/drm/gem: initialize callbacks with
 ..pin_init::zeroed()
Message-ID: <aqBdJY43QlnN5wnx@soda.int.kasm.eu>
References: <20260908175427.47207-1-klarasmodin@gmail.com>
 <20260908180555.0830E1F00A3A@smtp.kernel.org>
 <aqBX1siwtKuBTXBE@soda.int.kasm.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqBX1siwtKuBTXBE@soda.int.kasm.eu>

On 2026-09-08 20:57:05 +0200, Klara Modin wrote:
> On 2026-09-08 18:05:54 +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Incomplete fix: missing `handle_free` field in conditionally compiled `shmem.rs`.
> > --
> > 
> > commit b5b83bb373847c99ca6d286c268d2e0ffab299f0
> > Author: Klara Modin <klarasmodin@gmail.com>
> > 
> > rust/drm/gem: initialize callbacks with ..pin_init::zeroed()
> > 
> > This commit updates the drm_gem_object_funcs struct initialization in the DRM
> > GEM module to use pin_init::zeroed() instead of explicitly assigning None to
> > unused callbacks. This fixes a build failure caused by a newly added callback
> > field in the C structure.
> > 
> > Closes: https://lore.kernel.org/all/aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info
> > 
> > > diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> > > index e1ebad77ebe2a..c63b0fe5a15e1 100644
> > > --- a/rust/kernel/drm/gem/mod.rs
> > > +++ b/rust/kernel/drm/gem/mod.rs
> > > @@ -266,18 +266,8 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
> > >          free: Some(Self::free_callback),
> > >          open: Some(open_callback::<T>),
> > >          close: Some(close_callback::<T>),
> > > -        print_info: None,
> > > -        export: None,
> > > -        pin: None,
> > > -        unpin: None,
> > > -        get_sg_table: None,
> > > -        vmap: None,
> > > -        vunmap: None,
> > > -        mmap: None,
> > > -        status: None,
> > >          vm_ops: core::ptr::null_mut(),
> > > -        evict: None,
> > > -        rss: None,
> > > +        ..pin_init::zeroed()
> > >      };
> > 
> > [Severity: Medium]-
> > Does this commit miss a similar update in rust/kernel/drm/gem/shmem.rs?
> > 
> > The VTABLE initialization in shmem.rs explicitly lists fields without
> > using pin_init::zeroed(), similar to what was fixed here. When compiling
> > with CONFIG_RUST_DRM_GEM_SHMEM_HELPER=y, won't this cause a missing
> > field error for the newly added handle_free callback?
> 
> Sure, but it should probably be a different patch in that case. The
> current patch fixes an issue to a currently existing build failure,
> while the issue mentioned here has not manifested yet.

On second thought, this is seems to be using the same binding so this
might be accurate.

> 
> Regards,
> Klara Modin
> 
> > 
> > rust/kernel/drm/gem/shmem.rs:
> >     const VTABLE: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
> >         free: Some(Self::free_callback),
> >         open: Some(super::open_callback::<T>),
> >         close: Some(super::close_callback::<T>),
> >         print_info: Some(bindings::drm_gem_shmem_object_print_info),
> >         export: None,
> >         pin: Some(bindings::drm_gem_shmem_object_pin),
> >         unpin: Some(bindings::drm_gem_shmem_object_unpin),
> >         get_sg_table: Some(bindings::drm_gem_shmem_object_get_sg_table),
> >         vmap: Some(bindings::drm_gem_shmem_object_vmap),
> >         vunmap: Some(bindings::drm_gem_shmem_object_vunmap),
> >         mmap: Some(bindings::drm_gem_shmem_object_mmap),
> >         status: None,
> >         rss: None,
> >         #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")]
> >         // SAFETY: drm_gem_shmem_vm_ops is a valid, static const on the C side.
> >         vm_ops: unsafe { &raw const bindings::drm_gem_shmem_vm_ops },
> >         evict: None,
> >     };
> > 
> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260908175427.47207-1-klarasmodin@gmail.com?part=1
