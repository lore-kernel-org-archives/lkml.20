Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496E138886B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788893831; cv=none; b=u1FqmylQM7kbIs2cZ4jayUi0qkwAF8wkYYlRZb8Kp9dHArdqKYu9ElrJk04+TAT0+/+kK9bUV6mMYs3Aef2c3Hv174CfeyTv4swN5Hg4uoPkaP96DFi0txtc/nqBoktzzHYrI36r7nz4jHTgm40VrxHuQ8lU1+iTqkQe9eSbC/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788893831; c=relaxed/simple;
	bh=soEfeC9qUxvkfN6UEt9aQdcQ/wR4lPrN68Y2ziKQ2M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqY4hOe5YB9bOUjdAe0wsWFkaH2rusv73SEMyVj3CgzVx7zI5tqQXAjGTXFzVWPy3sok7JcLwMzw9kPYPhB5qqZJ4IJu3ZjY28Y0pBOUN6XM45TGjXgfN73GA91Alo+cUX3HzqRFUMJkhEi7MR2gbl2F5GlzsWDxIqsbiXpTaYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2otlSG5; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2otlSG5"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b457a0b4e5so4803533e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788893827; x=1789498627; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dPAv9/DNHgYvkBswgfcYE+/SWcKiJRn1AWqpJM/JUGk=;
        b=j2otlSG5w1rEojOG9m30ruTyrsAqJMnini+MRsuDUOLH92t8rap9DH+YzTqGESCfy0
         XhjXNEeyDgIqnXEI+Wu6pzLWhzbhEQgOpg0LCz6IXepg1ra/4QCdf3S+QKLzdJP39cBT
         Kv6BszN3fhsUEAX/ySi96RvL1wi3xPdWD28+xA7CUa9Zu7FCpO82s4z3EK4cFyckM9Pn
         hL7c0uvx4nzl6gRAZmva0MxElV1NWgKx2b2SmzKsPO35RtTqIXRclr4oPpWmhktQ/DGB
         NoI0vP871+J+5Vbn/IbzjV3bpPEQg+ap42yaTUZy7fsNUsML7927dURT786o2iBmPBy5
         NAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788893827; x=1789498627;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dPAv9/DNHgYvkBswgfcYE+/SWcKiJRn1AWqpJM/JUGk=;
        b=X720ZwZGD7sMBIITdWLAScjvHLoqgG6Zlb4wMAX2BosGqsbQNdYEI3WcU8/8VvWv3T
         ChhpzN7L0Lm/CeRCsblUDpODIz8uKsvl1xRyjAEdt9xj+hi89beakwgrnVU/AN4KuNjM
         8l5GAY4EA1JOBF1RNtg3rp5jhLQPb8QMv5jauy0AH0WQmeA0snU/5I7GjgC46ZEvMKtA
         5Nx09X+cvF7ZvFStLqSbGXyuqnYZ6aFUyBP8NaMNDPiPlnBjFqiUyelJ7dMGp2Duh5mk
         YStDcKdexqITOmjNtlRGc6xnmobo7uPT//CPdMflWFu8RUTm+zWBh+mosJr4EADxwuBW
         BkPQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3rO1LQO45y+i3il9BhUEMRFZPH9bqfHBvULXwPpNUapjaDMUEdBg0M6X0seq0mTyzw7Hs5ThhtSgcI9E=@vger.kernel.org
X-Gm-Message-State: AFuF++n2ahFC2tX8bn5BELJB/gFP4YcMMoIs8wwzV9UFyevR5mXO7O0/
	OGhLWiVXIFlii7wACUC+KiMyS+HK8wHp9h7KMoBRBg7qdPMpXiVwYQXghFQDVR1L
X-Gm-Gg: AYBFou0jp7OaEPdNOet8dATAQpfc4mRur1WU8futjIsyG1/NTRvjCn2ht312Gv4lQgY
	VmnSvdd+xQfCLY4cziV1pJMoj27eh7oCbMwYPAlyvwRdq9pYP9tcfXH1Ug8iXp/yZvyt2cvc01c
	d0IsJdKvx93IiPFami4hXqMsoBV8xU18hKHQ9W74uR3qhfI6KAj7lHLBM6pNB7/uhYwJWHZDKUN
	BusFYNkX3H0xJ/NkTXKLDON34/8lZe3eh7rhU2kNSkIP0ij9WFHlkOvPalk4oo+vrph5DVeEbND
	L5yRBjP9s2m89puBbWcgVNe594rPPvBDyBoSSPzjvx8oOS7n4pLelUAXs7Z0fzZXvFWeDcON2iW
	8jL490Kh2kMkJmoA1li49QZDeE8RdWuzjaE8+lCPNMJNdAJSnYBDFJW/8epgbrAtMBYt95KCfqz
	ZHqDr/tVB/S0n3hHN8ZgjBh8TnBbjp1EFyKtq+wAadqvaUZ6GazVWOmbgNGDnRlKHoT1w5A4/Uf
	S88UWJwdLWiLQ==
X-Received: by 2002:a05:6512:ac2:b0:5b6:4b2:de82 with SMTP id 2adb3069b0e04-5b6170596d8mr4800979e87.32.1788893826465;
        Tue, 08 Sep 2026 11:57:06 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fe6d9sm3239335e87.56.2026.09.08.11.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:57:06 -0700 (PDT)
Date: Tue, 8 Sep 2026 20:57:05 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust/drm/gem: initialize callbacks with
 ..pin_init::zeroed()
Message-ID: <aqBX1siwtKuBTXBE@soda.int.kasm.eu>
References: <20260908175427.47207-1-klarasmodin@gmail.com>
 <20260908180555.0830E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908180555.0830E1F00A3A@smtp.kernel.org>

On 2026-09-08 18:05:54 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incomplete fix: missing `handle_free` field in conditionally compiled `shmem.rs`.
> --
> 
> commit b5b83bb373847c99ca6d286c268d2e0ffab299f0
> Author: Klara Modin <klarasmodin@gmail.com>
> 
> rust/drm/gem: initialize callbacks with ..pin_init::zeroed()
> 
> This commit updates the drm_gem_object_funcs struct initialization in the DRM
> GEM module to use pin_init::zeroed() instead of explicitly assigning None to
> unused callbacks. This fixes a build failure caused by a newly added callback
> field in the C structure.
> 
> Closes: https://lore.kernel.org/all/aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info
> 
> > diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> > index e1ebad77ebe2a..c63b0fe5a15e1 100644
> > --- a/rust/kernel/drm/gem/mod.rs
> > +++ b/rust/kernel/drm/gem/mod.rs
> > @@ -266,18 +266,8 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
> >          free: Some(Self::free_callback),
> >          open: Some(open_callback::<T>),
> >          close: Some(close_callback::<T>),
> > -        print_info: None,
> > -        export: None,
> > -        pin: None,
> > -        unpin: None,
> > -        get_sg_table: None,
> > -        vmap: None,
> > -        vunmap: None,
> > -        mmap: None,
> > -        status: None,
> >          vm_ops: core::ptr::null_mut(),
> > -        evict: None,
> > -        rss: None,
> > +        ..pin_init::zeroed()
> >      };
> 
> [Severity: Medium]-
> Does this commit miss a similar update in rust/kernel/drm/gem/shmem.rs?
> 
> The VTABLE initialization in shmem.rs explicitly lists fields without
> using pin_init::zeroed(), similar to what was fixed here. When compiling
> with CONFIG_RUST_DRM_GEM_SHMEM_HELPER=y, won't this cause a missing
> field error for the newly added handle_free callback?

Sure, but it should probably be a different patch in that case. The
current patch fixes an issue to a currently existing build failure,
while the issue mentioned here has not manifested yet.

Regards,
Klara Modin

> 
> rust/kernel/drm/gem/shmem.rs:
>     const VTABLE: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
>         free: Some(Self::free_callback),
>         open: Some(super::open_callback::<T>),
>         close: Some(super::close_callback::<T>),
>         print_info: Some(bindings::drm_gem_shmem_object_print_info),
>         export: None,
>         pin: Some(bindings::drm_gem_shmem_object_pin),
>         unpin: Some(bindings::drm_gem_shmem_object_unpin),
>         get_sg_table: Some(bindings::drm_gem_shmem_object_get_sg_table),
>         vmap: Some(bindings::drm_gem_shmem_object_vmap),
>         vunmap: Some(bindings::drm_gem_shmem_object_vunmap),
>         mmap: Some(bindings::drm_gem_shmem_object_mmap),
>         status: None,
>         rss: None,
>         #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")]
>         // SAFETY: drm_gem_shmem_vm_ops is a valid, static const on the C side.
>         vm_ops: unsafe { &raw const bindings::drm_gem_shmem_vm_ops },
>         evict: None,
>     };
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908175427.47207-1-klarasmodin@gmail.com?part=1
