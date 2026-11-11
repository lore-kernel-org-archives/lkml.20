Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794415790;
	b=gsWL2oKjL8atLQQnocQKkDrELMP5lO0vLHg+Ot0SCIz81GgzDZGdBve8K+wJBcruob9i
	 Qxwh7q6IAPYZeV/ZgdvNVNoE/ukrNdDDlQgvY27/2afT3dxKncWbEbe9w2ZR594Y0Iy3s
	 tWcSOBG8jdosxVZnzZA1Lp52kZS0sPSd88HRBy1z7nd5iUq3IWZWyF6GE/FTnuux5nB48
	 g5PqTL1OeDpkC9kXFdNxnWEfqL1T86SaGKK9lKTFMvr8QdJyamcBkmsPRq2eM4Zvfnx5l
	 PKyBySH3EYIxe5exzBB0Ql4kW3bGNAmCf+AOezccv4kwANAeBA5n0MA66ZWN/Nypvhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3KSf5oiA7fw5PXAhjW9yvUP7uWd8t/r+AFUdm9OF7lQ=;
	b=PadoOaFVNeUJHsVL5xsulgtxxcKNJoQt/8j8p3f31UAd+GZ+/coNFnj2CrdlZTo0K0WJ
	 U3iyWRZPdRKyeEFEcaVayhc2UGdkh9nfJDt+kK8jgjnZqObWpq1cp8lXAp/27mZNnQOoX
	 +eKigWa8SM9eCbUusB5I/4zGVNJeVfkHKis7T8xAXLRoN8aUG668ayIjzk7xTKVqoBPrG
	 aCt0h4cKLcqwGX4JwniKwD1FtC+G+rmWBqsvYCkaWbUWpUZj+vQNVGxOGcW1unsS2cEpl
	 ipa1Brwax8N5ypII7wEloXS1nza0DVhcjlF09ONr2t+M9d58Rz6dD/mKaqR5VKjkBZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynR3ANX4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD86606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD86606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynR3ANX4
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e90071735so121545eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:49:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794415789; cv=none;
        d=google.com; s=arc-20260327;
        b=a979fgAZqf8zIvHyk4N+bB1frJGdKPRb8CKRMFoTc8lHK/EBkSamEDnuy87vokizdI
         CNxe1jERQ1mWW5S+ZzkVBxhCny6ZFLnvEyOcrncBUYv68yDB32RvgYgS9HCCXXXRqHeq
         5H6wanqdkmNrN/8JCHevikN04opwiZTTGEI62XmVZzTfPFO38+fka8SsScLG75ra90Wd
         Bt/w3061e6O1vqPFYKWMpN5Eum98u24eAdN/tTn6+FS6suWxH+cgCol0HDx63tamnHhp
         77O6cWM/O8vXLBEy+ROH7lRQtHeiV8RrSu5JCeIx9XRaZ7x0b8tA6uRI60u4fLkj2mvk
         Ey4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3KSf5oiA7fw5PXAhjW9yvUP7uWd8t/r+AFUdm9OF7lQ=;
        fh=jqjqkc88GXVavbZR3JIgFWDTfoncIbkgsVJVJPhyidI=;
        b=PTU2TeQAAp5sW672ysQYOSBs/pvvqdikG9fGvqwltaNCUvUkj0fBdh8TfDvDIH9Nc0
         pUum8ouv/221ieZFi1hJ933GF2egxdC/su4Z93o4QZD+exa6+b3xJqLIl2VPKnMRBcFm
         z5skgsf9/4ajSd7rUTplTq6fkTgM+MmODdp6Aq74YjbQ0DgogUQfx1TmHVBrNhPhsm2d
         fWQKBIAKbibK2+x0ID0bTvLCnz/DJFt/5ymqPF3JRmq3F41igxqPItcTWK7qxL8rA0V+
         xbrsZ7cESVdyDnxaH/f4kONJiCf8S5jEVAzPXO2lTZusmUUCiOslb6//Jshgwk72hAZZ
         6a0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415789; x=1795020589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3KSf5oiA7fw5PXAhjW9yvUP7uWd8t/r+AFUdm9OF7lQ=;
        b=ynR3ANX4KAATib8gXP7/ACCaWwPvuWLclY25XddEnYXMgOXXOtG5vV2kGAuX1xfuS0
         fziHA5YRs6B6LmVmoxi2GB3hV8WWx3KzR5OZSGH6c7mJXR/GFcJdLbdFzizGceYTr7Uw
         aZInUxsb1+3Km4bFxCiXdgBgcCDUe3u9fE0MziFI9+bBL/jG4AcpPBkYGdDtB7WFD9tZ
         fEhUsrxeMHUjlECnXvVgp++sRODKOdMksdS4xM5+cYZvDQ8wEk5tC5jS8xhQCs0AP2wa
         euPZosRral9zczR3zO9UilKZUzxOkUwpEbc4qrUczIA2PxlzfWhpyecgxERrAPMGO5Cf
         EcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415789; x=1795020589;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KSf5oiA7fw5PXAhjW9yvUP7uWd8t/r+AFUdm9OF7lQ=;
        b=WDFkjIS9pV90mIcqS1Zx/mHoGL/SPY+WLCzR4/slqHYo281KdgOEaF/fLs2TGz8SWK
         Sx7r/4xuAFBhs+f2XkqJq532prvC00TXzVgYctoEGZUpbhj/KYo+RrwnS95S6KqUZAMD
         ZIT31yu2/wRGQw/pNE05McI/styh+5XDatQmenJMpRIgwW+gXvkgPZwEVINS9cpEJ5ZU
         cLaBAqQJ7IxB5Y00YcW+VPr9IkSuKMLVcfL5jhgSymJQjPPpE5WxltdZBvo5jRTSLk1z
         J+QSVRX9hTF5iuiy+wK5YcjO4t5TI34/UEoVoqHe75BEqKl0l3Kf29L6/8EzQf29ca1X
         oU3w==
X-Forwarded-Encrypted: i=1; AL+hErF2tO7jPsf30KdlXBMei6dkI5bTOWnkBQ77FJk6mjZOvUryV9QeeEg6PMfSTuakk33b2OmW6HIFluznLk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E/vmxelaBsAD5hLvCQ9Jffvmzco8I1LnpHlglTd329jUnD3VH
	i+vxhE61ggGABuXAucZo97YlV+fa8ij7G4JQfPTLz7DOrkdmJ6vk3FlI2Jbc4oVSuhwSFAYmaMq
	s/bN/4Q1G+mLwZuygSSkJ+S/JfC/Wt40=
X-Gm-Gg: AYBFou0G7Ts/K/GpmNq+3qq4yV7biUxZ4y/zXyxjj8Sef9LYm7nm+PMDYCBvpoiX1Cf
	7zgSxTRFjtlQmifWCVLpW05oeizeqO4ShqpwfvqeizXxzDKBR1phzhO2hiVzZ4ntM2CPlhmyZ1R
	CsyvHSfNvFiehcVd3zj8gNzyMALB0i8zdGoS6/LB9jdjb5vjUi6Fdi1OVxUxs23qG+TagrTrngi
	+tPqlGY6e5GN5ZULQIfid5xGC0l4ogs1eDvqdDF3kYVIK0eTY2AzL6sVlpffFbMR8T/hT7gX60e
	3k4U4MwxPKsmDd2oU8NFGhPI8panWoA7l62V2PjduqE1gV6TRkMeQKVYoD9Bu6Vzwb4Z2HiB4LF
	iTdE4CDV635bpLH6C5H55TXBi/Wm/lE0+8vRclzbRxFixoP5Vj52bElYIEUtyN8mK5revC+Jyh6
	7XsEXxZ4T2FK9jIguLSCf+di0Ts5mfKwkoc9SUANyVbrWKmYdD7Ty/ilg0sc8=
X-Received: by 2002:a05:701b:2402:b0:1b3:a881:a67b with SMTP id
 a92af1059eb24-1b3c02dedc1mr4147363c88.1.1794415788453; Wed, 11 Nov 2026
 08:49:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-amdgpu-dumb-map-offset-v2-1-0abfb77a84b8@gmail.com>
In-Reply-To: <20261106-amdgpu-dumb-map-offset-v2-1-0abfb77a84b8@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Nov 2026 11:49:36 -0500
X-Gm-Features: AclHuK_GNVp6DqhleU8mNCij6RwE_xjeXa2cpadCyUXA99oBGwkzHbdnsMQTCJY
Message-ID: <CADnq5_OvGqVWG4BRi64EKO3_qEmS7VJiTuG158Og=XUPhYHJ_Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: use drm_gem_ttm_dumb_map_offset() for dumb_map_offset
To: saad <primecoder8@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed and applied.  Thanks!

Alex

On Fri, Nov 6, 2026 at 4:56=E2=80=AFAM saad <primecoder8@gmail.com> wrote:
>
> As part of the DRM TODO item "Remove custom dumb_map_offset
> implementations", switch amdgpu's &drm_driver.dumb_map_offset callback
> from the driver-specific amdgpu_mode_dumb_mmap() to the generic TTM
> helper drm_gem_ttm_dumb_map_offset(), for both amdgpu_kms_driver and
> amdgpu_partition_driver.
>
> amdgpu_mode_dumb_mmap() additionally rejected userptr BOs and BOs
> created with AMDGPU_GEM_CREATE_NO_CPU_ACCESS with -EPERM. Dropping
> those checks from the dumb path does not allow such BOs to be mapped:
> returning an offset does not create a mapping, and the actual mmap()
> goes through drm_gem_mmap() -> amdgpu_gem_object_mmap(), which performs
> the same two checks and still returns -EPERM. The only user-visible
> difference is that DRM_IOCTL_MODE_MAP_DUMB on such a handle now succeeds
> and the subsequent mmap() fails, instead of the ioctl failing. Dumb
> buffers created by amdgpu_mode_dumb_create() are never userptr BOs and
> always have AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED set, so they are not
> affected.
>
> With that, amdgpu_gem_mmap_ioctl() is the only remaining user of
> amdgpu_mode_dumb_mmap(), so fold it into the ioctl and drop its
> prototype from amdgpu_gem.h. DRM_IOCTL_AMDGPU_GEM_MMAP, used by
> libdrm_amdgpu and Mesa, keeps the userptr and NO_CPU_ACCESS checks
> and behaves as before.
>
> Build-tested with CONFIG_DRM_AMDGPU=3Dm (W=3D1 for amdgpu_drv.o and
> amdgpu_gem.o), no new warnings. Not runtime tested.
>
> The code change was written by hand and reviewed with the help of
> Claude (AI coding assistant); the commit message was written by Claude.
>
> Signed-off-by: saad <primecoder8@gmail.com>
> ---
> Changes in v2:
> - Fold amdgpu_mode_dumb_mmap() into amdgpu_gem_mmap_ioctl() and drop its
>   prototype, as it has no other users (Sashiko)
> - Link to v1: https://lore.kernel.org/r/20261105-amdgpu-dumb-map-offset-v=
1-1-7299d94ede11@gmail.com
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  5 +++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 23 +++++++++--------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h |  3 ---
>  3 files changed, 12 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 731fe8f9e..134d2fe4b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -27,6 +27,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_ttm.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_gem_ttm_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_pciids.h>
>  #include <drm/drm_probe_helper.h>
> @@ -3151,7 +3152,7 @@ static const struct drm_driver amdgpu_kms_driver =
=3D {
>         .ioctls =3D amdgpu_ioctls_kms,
>         .num_ioctls =3D ARRAY_SIZE(amdgpu_ioctls_kms),
>         .dumb_create =3D amdgpu_mode_dumb_create,
> -       .dumb_map_offset =3D amdgpu_mode_dumb_mmap,
> +       .dumb_map_offset =3D drm_gem_ttm_dumb_map_offset,
>         DRM_FBDEV_TTM_DRIVER_OPS,
>         .fops =3D &amdgpu_driver_kms_fops,
>         .release =3D &amdgpu_driver_release_kms,
> @@ -3177,7 +3178,7 @@ const struct drm_driver amdgpu_partition_driver =3D=
 {
>         .ioctls =3D amdgpu_ioctls_kms,
>         .num_ioctls =3D ARRAY_SIZE(amdgpu_ioctls_kms),
>         .dumb_create =3D amdgpu_mode_dumb_create,
> -       .dumb_map_offset =3D amdgpu_mode_dumb_mmap,
> +       .dumb_map_offset =3D drm_gem_ttm_dumb_map_offset,
>         DRM_FBDEV_TTM_DRIVER_OPS,
>         .fops =3D &amdgpu_driver_kms_fops,
>         .release =3D &amdgpu_driver_release_kms,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index 4ed1706d8..2a72bdf2d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -644,13 +644,16 @@ int amdgpu_gem_userptr_ioctl(struct drm_device *dev=
, void *data,
>         return r;
>  }
>
> -int amdgpu_mode_dumb_mmap(struct drm_file *filp,
> -                         struct drm_device *dev,
> -                         uint32_t handle, uint64_t *offset_p)
> +int amdgpu_gem_mmap_ioctl(struct drm_device *dev, void *data,
> +                         struct drm_file *filp)
>  {
> +       union drm_amdgpu_gem_mmap *args =3D data;
> +       uint32_t handle =3D args->in.handle;
>         struct drm_gem_object *gobj;
>         struct amdgpu_bo *robj;
>
> +       memset(args, 0, sizeof(*args));
> +
>         gobj =3D drm_gem_object_lookup(filp, handle);
>         if (!gobj)
>                 return -ENOENT;
> @@ -661,19 +664,11 @@ int amdgpu_mode_dumb_mmap(struct drm_file *filp,
>                 drm_gem_object_put(gobj);
>                 return -EPERM;
>         }
> -       *offset_p =3D amdgpu_bo_mmap_offset(robj);
> -       drm_gem_object_put(gobj);
> -       return 0;
> -}
>
> -int amdgpu_gem_mmap_ioctl(struct drm_device *dev, void *data,
> -                         struct drm_file *filp)
> -{
> -       union drm_amdgpu_gem_mmap *args =3D data;
> -       uint32_t handle =3D args->in.handle;
> +       args->out.addr_ptr =3D amdgpu_bo_mmap_offset(robj);
> +       drm_gem_object_put(gobj);
>
> -       memset(args, 0, sizeof(*args));
> -       return amdgpu_mode_dumb_mmap(filp, dev, handle, &args->out.addr_p=
tr);
> +       return 0;
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.h
> index b558336bc..718ffe229 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
> @@ -49,9 +49,6 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev=
, unsigned long size,
>  int amdgpu_mode_dumb_create(struct drm_file *file_priv,
>                             struct drm_device *dev,
>                             struct drm_mode_create_dumb *args);
> -int amdgpu_mode_dumb_mmap(struct drm_file *filp,
> -                         struct drm_device *dev,
> -                         uint32_t handle, uint64_t *offset_p);
>
>  int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
>                             struct drm_file *filp);
>
> ---
> base-commit: 279235273fc6c0a33df863b4a1cc52ec1e73aba5
> change-id: 20261105-amdgpu-dumb-map-offset-6fa41e8d3fb5
>
> Best regards,
> --
> saad <primecoder8@gmail.com>
>
