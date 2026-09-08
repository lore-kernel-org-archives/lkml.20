Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B43491590
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895551; cv=none; b=Ciw2QoReZixNGapqMjjXLRVcNlji+EeGsbavcw1a4zdy9xKqVOfPT8PwdCDgRNftpZnbCyHOp8wXTBE5QuGbjrGI2PyKE3ZoaKtQDnNkNULAB63NeFrN7kEp2vPCsUPfejNHGsiNZSMKPJmnAW4Cdv62quom65SCBp5jwd+JM9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895551; c=relaxed/simple;
	bh=f/QI6fQPpYfaZdPpU8xWGiSPyzZLkdoD/NBWjln+Vyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zw48jB3GeLmLYxgZYv+FYIbMxn7fGslJlPnl2DF4BpUmUdz/OIrm/tcMxtZ5eCatPab5x/LuTX0U4dj+TrbEYXQkeF35Mn5kaNqpuRk3jXUu5NHKuiCP+Q8bom2jIWAm+GQ8mhAIIIjcEmT2URYCIQPPRQtokZZLLmlNndhhrCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1pzB0Vw; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1pzB0Vw"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e023so613691e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895548; x=1789500348; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qs8C9B+WUBDgq8aRTUIEYiHOvCr2S97eqgKrz0PamYA=;
        b=Z1pzB0VwBxRVIccOWm645xf4t9yfWkvoSMe7uf5wj1A+a8UkN8ni/iQ+LpCAdwoAw8
         YgnYT2E78ZUEPZAhrndyxO1BhJjiguPlOMxECi8t83BqAroWRNYC2WNPFNM7+E73O2+L
         FHt3+VURZT/vP9pYCtrWrNSLyd8t27SHT2fMvLiDSymNd1zsPwqYx97c6HvLn9dbolYQ
         ywHUtt4E2o6aIEXZwkGwkJJd+EVp1n2f5ypP8x7CqgHu0XVbiqCPld/jrlXow1ntfMhu
         CcaCfPkKwJuK7FkGpxy1t3zI1Fx7sFNQezuUiDJ2wVtqlhqYXmxKGJQ8UNNVCo5AOxne
         XmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895548; x=1789500348;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qs8C9B+WUBDgq8aRTUIEYiHOvCr2S97eqgKrz0PamYA=;
        b=ZvAwDPl8YxDRD7y/rTVsj6c3I3so2tWAhln6RmKdLiRABMV/f3Glc9BuCLoGtA5RSW
         zh8/IB6P2I7U6HnOZ7BMzLsueJxlAFwi4U2OzSQaPT7+2pTiTa1Y+Dl1EGaGShj8AUTu
         fZepK6E1coOXJNLByBRdpDROzlWtM346mbwI7GK7z2aXnEQj3obXW2e/qc06zxdgUjBl
         z4s6XP225Xd19BjsrrIYLzWFCKmVK157jI6wJo0PU+dvzBqVr1oc1dEHD7E6rSVw1nI9
         kzUGPvj57pkavOdcrIzlrxob/UFOAnhWH3lVNT7MK8hf12ook1X0HQsNSA8QffBRufxD
         ZdZA==
X-Forwarded-Encrypted: i=1; AKwUvBxFRB0d58mcu8WG02m6macx+Gn+bygaGXGZANmbMMu6ej85nPSe+3g93Su/5hTTUgooBs16XvXYhPbSl3M=@vger.kernel.org
X-Gm-Message-State: AFuF++mSeRWztjhL1CbYKriPPOnpF44o7MTkHw/a7zNqE+Que85dcJXV
	ChiYmWVra2dqicAs03gTDlSHIf6Mrx8EiaYR/jjDIQ13Xw07LMsYIOC5
X-Gm-Gg: AYBFou0+hEBbYPxK26jeKjmRfmgMwMIonoOKRfibCR/Z7eOFDJaDybrxYtPoXYKOYVL
	Om9a30YyXKAa5sgTNVFPQQ+YzRtTsxJ+JxyFmHUqEDCfB6qPiNe3DoqHdq0drJomYiPHwKRxm5/
	aq9qhCapkhmnbmKgjvETMj16zyxC1OO4Zxp+EFq8Eu8kS1lZPvXcz9tFq3uSn55vHtZc9LCVlti
	qmpjIOZgNKSQHcncyIqr/ijp0WQYG8j7TQLkXUprwVlH7AQ1aoAfPcvKbsGo18jfOUDMMzLZHz2
	CUJWgwxYuiT0fSGzUzIP3sNTH0GSGHJVr9YmucXlDh1s+HSv38PNKi9Yf5eoN1iaTnMsBFNkWl0
	34Wpxi/Uz9lyIgDP4++mnjGcTdy/Xq9Mtheujdt5fQM44r2eNZFerArzdeypD6Lfr+TsaWEyk2L
	AzSwES0Y2BIs5Z5WS4YmqXzk1C4mZHzbI1p2b+DEB7zs3I4r6KX4mXXw9k0X2fW+4sV6EFpbgic
	xY=
X-Received: by 2002:a05:6512:3b96:b0:5b6:10bc:b867 with SMTP id 2adb3069b0e04-5b75c926908mr1490072e87.21.1788895547733;
        Tue, 08 Sep 2026 12:25:47 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166f6ca3sm3289156e87.32.2026.09.08.12.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:25:47 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:25:46 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alice Ryhl <aliceryhl@google.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Mukul Joshi <mukul.joshi@amd.com>, Felix Kuehling <felix.kuehling@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Manuel Ebner <manuelebner@mailbox.org>, Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH] rust/drm/gem: initialize callbacks with
 ..pin_init::zeroed()
Message-ID: <aqBf1UYNR-Q3T-cs@soda.int.kasm.eu>
References: <20260908175427.47207-1-klarasmodin@gmail.com>
 <20260908180555.0830E1F00A3A@smtp.kernel.org>
 <aqBX1siwtKuBTXBE@soda.int.kasm.eu>
 <aqBdJY43QlnN5wnx@soda.int.kasm.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqBdJY43QlnN5wnx@soda.int.kasm.eu>

On 2026-09-08 21:09:40 +0200, Klara Modin wrote:
> On 2026-09-08 20:57:05 +0200, Klara Modin wrote:
> > On 2026-09-08 18:05:54 +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Medium] Incomplete fix: missing `handle_free` field in conditionally compiled `shmem.rs`.
> > > --
> > > 
> > > commit b5b83bb373847c99ca6d286c268d2e0ffab299f0
> > > Author: Klara Modin <klarasmodin@gmail.com>
> > > 
> > > rust/drm/gem: initialize callbacks with ..pin_init::zeroed()
> > > 
> > > This commit updates the drm_gem_object_funcs struct initialization in the DRM
> > > GEM module to use pin_init::zeroed() instead of explicitly assigning None to
> > > unused callbacks. This fixes a build failure caused by a newly added callback
> > > field in the C structure.
> > > 
> > > Closes: https://lore.kernel.org/all/aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info
> > > 
> > > > diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> > > > index e1ebad77ebe2a..c63b0fe5a15e1 100644
> > > > --- a/rust/kernel/drm/gem/mod.rs
> > > > +++ b/rust/kernel/drm/gem/mod.rs
> > > > @@ -266,18 +266,8 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
> > > >          free: Some(Self::free_callback),
> > > >          open: Some(open_callback::<T>),
> > > >          close: Some(close_callback::<T>),
> > > > -        print_info: None,
> > > > -        export: None,
> > > > -        pin: None,
> > > > -        unpin: None,
> > > > -        get_sg_table: None,
> > > > -        vmap: None,
> > > > -        vunmap: None,
> > > > -        mmap: None,
> > > > -        status: None,
> > > >          vm_ops: core::ptr::null_mut(),
> > > > -        evict: None,
> > > > -        rss: None,
> > > > +        ..pin_init::zeroed()
> > > >      };
> > > 
> > > [Severity: Medium]-
> > > Does this commit miss a similar update in rust/kernel/drm/gem/shmem.rs?
> > > 
> > > The VTABLE initialization in shmem.rs explicitly lists fields without
> > > using pin_init::zeroed(), similar to what was fixed here. When compiling
> > > with CONFIG_RUST_DRM_GEM_SHMEM_HELPER=y, won't this cause a missing
> > > field error for the newly added handle_free callback?
> > 
> > Sure, but it should probably be a different patch in that case. The
> > current patch fixes an issue to a currently existing build failure,
> > while the issue mentioned here has not manifested yet.
> 
> On second thought, this is seems to be using the same binding so this
> might be accurate.

Confirmed, on an arm64 build with the Tyr driver enabled:

 error[E0063]: missing field `handle_free` in initializer of `drm_gem_object_funcs`
    --> /home/klara/git/linux/trees/next-local/rust/kernel/drm/gem/shmem.rs:130:52
     |
 130 |     const VTABLE: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
     |                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `handle_free`
 
 error: aborting due to 1 previous error
 
 For more information about this error, try `rustc --explain E0063`.

I'll wait a while for other thoughts and otherwise respin with this
included.

> 
> > 
> > Regards,
> > Klara Modin
> > 
> > > 
> > > rust/kernel/drm/gem/shmem.rs:
> > >     const VTABLE: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
> > >         free: Some(Self::free_callback),
> > >         open: Some(super::open_callback::<T>),
> > >         close: Some(super::close_callback::<T>),
> > >         print_info: Some(bindings::drm_gem_shmem_object_print_info),
> > >         export: None,
> > >         pin: Some(bindings::drm_gem_shmem_object_pin),
> > >         unpin: Some(bindings::drm_gem_shmem_object_unpin),
> > >         get_sg_table: Some(bindings::drm_gem_shmem_object_get_sg_table),
> > >         vmap: Some(bindings::drm_gem_shmem_object_vmap),
> > >         vunmap: Some(bindings::drm_gem_shmem_object_vunmap),
> > >         mmap: Some(bindings::drm_gem_shmem_object_mmap),
> > >         status: None,
> > >         rss: None,
> > >         #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")]
> > >         // SAFETY: drm_gem_shmem_vm_ops is a valid, static const on the C side.
> > >         vm_ops: unsafe { &raw const bindings::drm_gem_shmem_vm_ops },
> > >         evict: None,
> > >     };
> > > 
> > > -- 
> > > Sashiko AI review · https://sashiko.dev/#/patchset/20260908175427.47207-1-klarasmodin@gmail.com?part=1
