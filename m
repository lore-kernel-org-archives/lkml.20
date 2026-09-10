Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7DC3803C7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046164; cv=pass; b=HoWsW2B/ezfUx1M0siDTFIElibkIU7BMX/HXP2AX5di/PFmdmxEbFz1jdoKMqg/MqA2Bxd6f5rNfSL26D4UG0pB1F0a7F54133lcYZnD0CdHMCMtufzgEqnpN1yBS+XZWaK6OR7E8CthToaHE8Mzz+OBHecGaG0TeBrEu7RalLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046164; c=relaxed/simple;
	bh=r9p+KqcSZBzwlNv4UIOkluYxZzxF3C9CkP39r42NlUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WUySdfL1xIk4YroJhO/vsnZGwALO/ANGYwDC71zkkyB6EB03j8HGZQkZPCL9/t5r6i9MIhbbTOUS7/gQis8QNJcb2iDm9XsVIwTrYUPy/PM76lxMGXwlT+Pmb1fR9x15WiFLDM8wBhGJv5S8DEbU/ximW9aYgmTfFi+dPG4A4Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b66tnTQ8; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b66tnTQ8"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-791391ddb18so28293137.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789046162; cv=none;
        d=google.com; s=arc-20260327;
        b=rV5SKhTvTCO95s8zEeW5xYhm/zUjQaulnfsJtIVGNeiYHXGFHj9+qcEqnOHpIB5FEv
         tO+Tsv6q7lAJKLZ7ashyjkLQUawGRPsaApr+b80OEH5QjzrqAy/g+1U3z0Y1SWm0bo4/
         gqmXJTrI3tvYMO1CX3REhxiMwc+CxzFX/7cBIjmeYMVjZKjtgZEUjcB4l+wXArVUslda
         zsklr1zWOphLG/p/9t01IAu+NzOl50g+kelpEQyeni1EQgoZ8U5IbYMz1uOBuxph0osH
         Cu1b7lvNT6D3q2viwwS0jQ77YCV9vE7sgCuiiOS4gpyeB9AWxKiM7g3e5YP/PxKPVez8
         9ybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=moA5jUO3uVa6D/ugtSObUrS5bANjOYs5c5g0mj7H5a0=;
        fh=NP2tubvknPrFnQrSsOmcSrTHgVY7sQb2L5R3bIXwF1w=;
        b=c5Y3b3pvtCyG32+96yZ8jyndzdF0bj0J6yn04B6mE5LuHh5amaBrnEwl3xZ1Lw7Xlk
         DZOhi30z4xxuFM1wzehplgNqcFrHsPeZCXNQqqFkMWpOSQg9hrN5sWOy4rUJXixkY+3s
         4mpgxAu6bVuD1i8rlTd1AVp7oNphJE2BgAhkGaOkBLlD9spI7LAFgRKFqfP520/jOfgI
         FZNnwsT4QJqZ8gLFxZp8Wne6k3N4Fcmjy7UYFtf1ryxL3LzsMAvP3HUjs84m9IGJB3zK
         AsA2TVtHIOP+GGjkOJZV0Yf5AwnL4U8HPf/oDP14SAVN7SYm47Cc6p70ZPU4c1QlZhPt
         vnww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789046162; x=1789650962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=moA5jUO3uVa6D/ugtSObUrS5bANjOYs5c5g0mj7H5a0=;
        b=b66tnTQ84Smqti3gL2sPo+HpSbXYjnKsqMTwwxQtewG+Os+PQYomsDy8Ia41zmBATc
         B0HM3lXvJ9bi08YezVh7B8GUrU8LJn7d4q4SWeeCGDtdAZxuT5Hb8oJk8kWFnFa2G7zD
         Brq9uDxXnFVz9j6pHt/EL8txXU/OS1xRIBgzV5NzpR7fHpfF2v1zPM0H2RKXi9z31Lsa
         iF4xlIdM6AflRERNgUpnrnuTkOgFi2abagtSvyJkf4EKxFyJ5fCQUmMKEI9LpMAhHoYQ
         DJGnwQkOXSuGZDvSMAwLYKvpL0Y0PJQNAjhHua748I0UZ3i21RIIxeOHlMrlKCU/4vKB
         NiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046162; x=1789650962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=moA5jUO3uVa6D/ugtSObUrS5bANjOYs5c5g0mj7H5a0=;
        b=AQw67fFJ9RHl5S8NNjDn2C875I53Oi4KXryBNhxjJsHox2/vUqeXh6B+j58ePxGw89
         0fsQZUf5YBDUY9Jc1Hga/wXZbLyLYwJX5haKs+tE6WSjjwuTIbMigUDCQgWWS79YECe8
         k/WEtl3vciZJ5qlvU3XGMef9Mc8fYBs5iSg+PphSRUU8VCI2hh+kkJUSe6aWdnQQG4v4
         ReC7ktdKa7N5TKoBSrwwpmpTHEdItxqS8x8SLTxjW6M2hpBrSvuN8u1AxeXvPD027ASh
         D+esxgGCqBuF5xcA8BZnlQSVJMTiERDNJg5Y0eFhYhfZyZfVRfPwMmNq/67WKYYURjT8
         Ryng==
X-Forwarded-Encrypted: i=1; AKwUvBzuqeTqWPqxLLj/wGIJyJ9fOWnnFelEmyaYJ2moQgnNKVNnrvYZww7yVO0w4yW2oHXy4dNUlDFCRnLCNMM=@vger.kernel.org
X-Gm-Message-State: AFuF++n2GbHj/b3VrI65jMd4tp/JfeeqrGTEI5MpkDqCmMdUQMlwOW34
	NgonAwkfihFGhC/P8pBlD2HQBsH3HSVsdYY9NCAsLfN5QFLCuQcJtaylfz4v/RlgNfm4EgU8enF
	/4SO74vet1zq8GEv6puoqhCLZrrdJW30=
X-Gm-Gg: AYBFou1KAh1YAAy43PqByYSS2dXs7m/kZXumws6os3bZFdz1eRP6ZrAGMC0nOI9LtFi
	vsJtbeR+8pqpgZtQ0MSWeNtrlTBhwGk3XGhVg+wc3d+p0fmQW/25nFrALxgSTAjPw677xERD0OU
	BsIY4mITqZn2/Dg3GJ5iMvjICVT0Th+S0Y0KMV/A3FeVR7+lZl5MbWHXNaRoqo4EWnDrz4hkGuv
	hYKzDjg6Dm98zHQXmY3kZhyZi0bdA7FLVsiaec++Q8PFqEbbEMSl+rAO+DUREfgR1YaqqTGNvlc
	J0coPWyffHM2FZQVLaXZeTpTeS+dJHFNmGQ4PQqA8OcieDSiOy3+XLrCbgfx5+8iI19WP05Divb
	fpYMOZxJWCwSCM/mmkekUcDzyA72LehicffUB9B5TSg==
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id
 ada2fe7eead31-79005639f22mr1869415137.0.1789046161658; Thu, 10 Sep 2026
 06:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909173103.73656-1-klarasmodin@gmail.com>
In-Reply-To: <20260909173103.73656-1-klarasmodin@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Sep 2026 09:15:48 -0400
X-Gm-Features: AcwNN1XHoZUcFvWmvZ91jrJEiVXoE4O9xNxPdZc5AmfqfU3fK8LxM3IuZyCmVsY
Message-ID: <CADnq5_MCChZJ3vFmAeMPhq1xHLC5Ba+=g+v4+OUKZ8ciLbKY3A@mail.gmail.com>
Subject: Re: [PATCH v2] rust/drm/gem: initialize callbacks with ..pin_init::zeroed()
To: Klara Modin <klarasmodin@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Deucher <alexander.deucher@amd.com>, Mukul Joshi <mukul.joshi@amd.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Manuel Ebner <manuelebner@mailbox.org>, 
	Gary Guo <gary@garyguo.net>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks.

Alex

On Thu, Sep 10, 2026 at 6:08=E2=80=AFAM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> When the commit b67d2d039f64 ("drm/gem: Add callback for when handle
> count goes to 0") added the handle_free callback, it did not update the
> rust abstraction, which will cause a build failure when that is enabled.
> Rather than just adding another None initializer, use
> ..pin_init::zeroed() to make all unlisted callbacks None, and remove the
> existing zero-initializations.
>
> Fixes: b67d2d039f64 ("drm/gem: Add callback for when handle count goes to=
 0")
> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> Closes: https://lore.kernel.org/all/aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@=
leemhuis.info
> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> Closes: https://lore.kernel.org/all/4da62a4b-c4ef-492a-9a27-b56bd4784acf@=
suse.de
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Klara Modin <klarasmodin@gmail.com>
> ---
> v2:
> - also remove initialization of vm_ops, which is also handled by
>   ..pin_init::zeroed() (thanks Gary)
> - fix the same issue in the shmem helper (thanks Thomas, also reported
>   by Sashiko)
> - v1: https://lore.kernel.org/lkml/20260908175427.47207-1-klarasmodin@gma=
il.com
> ---
>  rust/kernel/drm/gem/mod.rs   | 13 +------------
>  rust/kernel/drm/gem/shmem.rs |  5 +----
>  2 files changed, 2 insertions(+), 16 deletions(-)
>
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 80d8f524f9d5..9d4280002765 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -266,18 +266,7 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, =
Ctx> {
>          free: Some(Self::free_callback),
>          open: Some(open_callback::<T>),
>          close: Some(close_callback::<T>),
> -        print_info: None,
> -        export: None,
> -        pin: None,
> -        unpin: None,
> -        get_sg_table: None,
> -        vmap: None,
> -        vunmap: None,
> -        mmap: None,
> -        status: None,
> -        vm_ops: core::ptr::null_mut(),
> -        evict: None,
> -        rss: None,
> +        ..pin_init::zeroed()
>      };
>
>      /// Returns the `Device` that owns this GEM object.
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index a687d46d170d..24cb5343e0db 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -132,19 +132,16 @@ impl<T: DriverObject> Object<T> {
>          open: Some(super::open_callback::<T>),
>          close: Some(super::close_callback::<T>),
>          print_info: Some(bindings::drm_gem_shmem_object_print_info),
> -        export: None,
>          pin: Some(bindings::drm_gem_shmem_object_pin),
>          unpin: Some(bindings::drm_gem_shmem_object_unpin),
>          get_sg_table: Some(bindings::drm_gem_shmem_object_get_sg_table),
>          vmap: Some(bindings::drm_gem_shmem_object_vmap),
>          vunmap: Some(bindings::drm_gem_shmem_object_vunmap),
>          mmap: Some(bindings::drm_gem_shmem_object_mmap),
> -        status: None,
> -        rss: None,
>          #[allow(unused_unsafe, reason =3D "Safe since Rust 1.82.0")]
>          // SAFETY: `drm_gem_shmem_vm_ops` is a valid, static const on th=
e C side.
>          vm_ops: unsafe { &raw const bindings::drm_gem_shmem_vm_ops },
> -        evict: None,
> +        ..pin_init::zeroed()
>      };
>
>      /// Return a raw pointer to the embedded drm_gem_shmem_object.
> --
> 2.55.0
>
