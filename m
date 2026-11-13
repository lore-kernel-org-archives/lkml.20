Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794536670;
	b=ojEZET5k678Qb0EuUY9YlLpkvQqob47uNu1o3Cxtky0DdW30smlwQL8PdGM0eWkM20ly
	 fE6dP7xXPxkY2zYOq5NpHXppKd0iNii7MwPvgQC7m7Vo2tPCdikwfustngau37VJA8ve9
	 QOfCjtIPOuyJuW4imm32S8SKEPDCLLgnkxTI1xH8J+Zolos0mOdgf6iT+6pmpwGg5c4zD
	 5BAIQ3n0OcX1zAODwPCkVv/WdegXmNSjrtW0eS4NtbVufg5fqUqI5a7Px6bzJrrYQrJ8w
	 PjkTA80KUKlcHFEQ/mzEwTcTdk3tH+spArjEbwX1HOZ3ZJTRUjqJzLxvORFpc19C+yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oWzMkP8XjVIWFgDnL4ZI/gXC/s+5pEfVFpM+tbO5lhY=;
	b=XH4zZnWCN+EUPbQQAQw9gFiapRe29kAZIS3+yb07flVM9ewlDgoHTDp+nXQymM9sdkXA
	 4xXOM8/FAxumtFmUiSFmvm+Y7e/BZXlnSoQdccLz+ew4ZxtcYwdYQVUtEFQplEAO5zwNa
	 6wXXKrV7ip1a1jjngU94vaQA9bb2ZGyv7auYg2FtU/xISMht+atp5MJZgAwGW6jyFUPR4
	 CH/AogBmZ5j3F4hCx/8GHjoooziz/DVleoYMhLsp23dqNcdl94qRi9NL9Khx4ukO03Xx4
	 UsGNFN5tkbhbMqYXJLsv24m4Cus7dav5p7gY/tZFLJnVxTHTmQMkSCj/7Jo/Vbbgb8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d5D1vjs7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EDC606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58EDC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d5D1vjs7
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67be9601f31so414292d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:24:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794536669; cv=none;
        d=google.com; s=arc-20260327;
        b=BJcTlNtoBcb3UC7GqdknFDGx0BOHH/fMI4Cu29HejQg8nJElYRO73+U7e4uGW9sNew
         aWGRqLKL96jsZ1/qk3vccn7Ggscv0eqqzNN95Wf3t7peJpOVtogOFtRIxQFdRq7r/itu
         sM8rq5YmyqYnfpcjqO6graF2bG+doNoaTHCXIpmMJQqVpfIkDitkItL/bJLFAQ7UPkt+
         pvwzX4f6l/a9Qoz/4YXL4ipE7NhHDPkMlwNSon/BNTaEm7eDzj8OrqXzvcvwuvaJqAot
         Jm+tYOSaXTSBp1zqyIgGimIqa1W6s+KTEFoy1nty62sLqmyjvqqko+RcV28YoiSl/7WV
         1v/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oWzMkP8XjVIWFgDnL4ZI/gXC/s+5pEfVFpM+tbO5lhY=;
        fh=d+GefXgxa0VRBxYcxtm9uGApWZsdj/kg7JCsCSPgJIU=;
        b=gho7NtJkRHionaW8dCYDESYwjf1b1Cu87EycohMvnsHrDexl921ZSkpEtCl4C9/G8Y
         R0vQqrT51XGihUDVGQJa6GSUwyJ6dzaW/xC87HKT+9yRVehk8iFPSEVK69WZoF77Vu1z
         WWqH1ydBf8iQEXW5III/q9W5GmNA+EuKIgFITP7QUPSdXBw3lgIRp37RJ4TAAQgmWylT
         N1pqzj/cj7dgMn/ZZNWB2tyWjP0sdAfmA+pEGY0aJvr10qa5bLqAz0TcZaDdVHY4/y+A
         y+m+JCnP9iFZG8p9C9ZbvawFmczEFwCt3H74oQ966C86vvSw9KTNQ9fkZBzwp0Y6t3TS
         bSew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794536669; x=1795141469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oWzMkP8XjVIWFgDnL4ZI/gXC/s+5pEfVFpM+tbO5lhY=;
        b=d5D1vjs7Jz8QdYNqBjMzEWSxJ06A9SMH4V+GFb5Co2dhBfIskOV1IHerPJfHGsDDKN
         etKdZ92jEz0EEaKtG+aUg49jERiZCPJFsVUSfLjdNo1Mx3dJyY9nlxUo3tLg9ly2LL7k
         W8MWa2zHsdTc19Q299GW2y2TyN9Pjj4wLiaIvc2mo4Suzqc0Vi6EvW3eHfCH66BEoyBF
         oSHsc2OlVns0wXKRP3acZV9go7Knzju4Kg5UpcPYz/yHWpI5ONW/CInSiquGtCzr0SQd
         kNrydTPYRtIFVdozwUjsSI67bKE+SIgyi7OU8QVgMXbmZYZ4pZLt3A8vMZDYVKnFmSfP
         hqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536669; x=1795141469;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oWzMkP8XjVIWFgDnL4ZI/gXC/s+5pEfVFpM+tbO5lhY=;
        b=GgqJ7ut8IYCIx+3uALFLIyCYXdVgG6+5H4hHngUBXBQW+LuOd2zWHt3GysJg8tznZU
         zlG1dUyio4xD86aPbtL91s7/4dC2oQ2K1/yNOW2ZqgM5pxGJKnGMkYawfJ7oW3YXuVTt
         gbwZeR7v6jANuHxsaGcJTYCUTOI22wMDYS7Ka6ce8lW5aEqQL0LX1HZ9z6414Rh7PHdZ
         mQ4erc6gxpQ25GzBmex3Fi3V4N7fImr4F4qxRaUWHNHoGSjicnYZ5DbvIfpBkDpPwYLz
         NWsfyCARhYJMa0H97bAwMD+L03UAZ0sqInhsChbdr/uwccgF/wcJFlpOlkx5KW92g4yo
         t74g==
X-Forwarded-Encrypted: i=1; AL+hErHOcXs9PH99Bg8vcx842zqqN0HyIW/Xu+alkgJBeicagmyOJwYidcDZJ/xieK8Ke3sWZYGemWb5dvRanNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z//9dJ0l58zuQRmAkf9r8255DradZJco1UPoW2Zr+B47SCBrrdH
	iSxzgpT5lQHH9D1Rs0nEWTL3v2QwPcbHRaiUNcHeHWxmn587+z2B6Iethf/SzGhpfuK5E44/GL3
	XlAK8i4ShJZ813IDcT9XIJ9ZEaN/e3E8=
X-Gm-Gg: AYBFou0kg39WBNOR4N4lZOqQPC3qJQUzwlRH9tH6KxygJ9KiU8xwAtE+VEOAOCTTD8a
	sNmco81YN492f9Jhs8U+RGXRt/778A/pgHVuDdGE+qgx8GWgv6d45yuh9n+1jUqWXGaKSZbRN7R
	rKzpSWtr/oVFCmEptDvB6KDu7Jqn4Pcpps0RTUZH9E3DevX2qpFxfqea8tfcFhlAh/hdJN5Ze/Z
	MZS+nYa/IooNXckB5RjPoW55qZ2c4hdRDcQl8tKEX5nDwpfrNFI4gmx51QVL/3jFzZTrezlJ+F0
	vWA+FBcbhCSv/GDLQk8FGC0pc+D5OFR43IMsnS0+bb7bIa5rry/dAtfzmUOJkL8ceXxdaL3H496
	z+6YDaanEbG8U6CetnqTQHw/EXthi/MZCDvyO4Q==
X-Received: by 2002:a53:acd4:0:10b0:67b:fce3:45e8 with SMTP id
 956f58d0204a3-67d8978dbf7mr530380d50.94.1794536669230; Thu, 12 Nov 2026
 18:24:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101073700.1261966-1-gye976@gmail.com>
In-Reply-To: <20261101073700.1261966-1-gye976@gmail.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Fri, 13 Nov 2026 11:24:18 +0900
X-Gm-Features: AclHuK-uyrlffIoFjYHTKCRH3SK4kkMQorZdRDw1Xbvlm4EKkbd7IoOWYybBtis
Message-ID: <CAKbEznsZ+rFG+U3Et8rovZUPmpLWnoiB5CQPNMHGmMD9C3J9Sw@mail.gmail.com>
Subject: Re: [PATCH v2] accel/rocket: Fix drm_mm UAF on close vs in-flight job
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sidong Yang <sidong.yang@furiosa.ai>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping.

This is hit frequently in testing whenever a process exits
with jobs still in flight.

On Sun, Nov 1, 2026 at 4:37=E2=80=AFPM Gyeyoung Baek <gye976@gmail.com> wro=
te:
>
> The drm_mm and its mutex live in rocket_file_priv, which
> rocket_postclose() frees on fd close.  But a BO held by an
> in-flight job is only freed after close, from the drm_sched
> free_job worker, and its destructor then accesses the already
> freed drm_mm and mutex.
>
>   BUG: KASAN: slab-use-after-free in __mutex_trylock_common+0x90/0x1e8
>   Workqueue: <NPU>.npu drm_sched_free_job_work [gpu_sched]
>   Call trace:
>     __mutex_lock
>     rocket_gem_bo_free
>     rocket_job_cleanup
>     rocket_job_free
>     drm_sched_free_job_work [gpu_sched]
>
> Move drm_mm and the mutex out of rocket_file_priv into the
> kref-managed rocket_iommu_domain (renamed to rocket_vm).  Their
> lifetime now matches the vm's: as long as a BO or job references
> the vm, the address-space state stays alive.
>
> Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
> ---
> Changes in v2:
> - Rebased on drm-misc-fixes and resent. No functional changes.
> - Link to v1: https://lore.kernel.org/r/20260426103758.1373137-1-gye976@g=
mail.com
>
>  drivers/accel/rocket/rocket_drv.c | 74 +++++++++++++++----------------
>  drivers/accel/rocket/rocket_drv.h | 13 +++---
>  drivers/accel/rocket/rocket_gem.c | 31 ++++++-------
>  drivers/accel/rocket/rocket_gem.h |  4 +-
>  drivers/accel/rocket/rocket_job.c |  6 +--
>  drivers/accel/rocket/rocket_job.h |  2 +-
>  6 files changed, 64 insertions(+), 66 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/roc=
ket_drv.c
> index 5d7805c41dc..f58c15131dc 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -26,46 +26,54 @@ static struct platform_device *drm_dev;
>  static struct rocket_device *rdev;
>
>  static void
> -rocket_iommu_domain_destroy(struct kref *kref)
> +rocket_vm_destroy(struct kref *kref)
>  {
> -       struct rocket_iommu_domain *domain =3D container_of(kref, struct =
rocket_iommu_domain, kref);
> +       struct rocket_vm *vm =3D container_of(kref, struct rocket_vm, kre=
f);
>
> -       iommu_domain_free(domain->domain);
> -       domain->domain =3D NULL;
> -       kfree(domain);
> +       drm_mm_takedown(&vm->mm);
> +       mutex_destroy(&vm->lock);
> +       iommu_domain_free(vm->domain);
> +       vm->domain =3D NULL;
> +       kfree(vm);
>  }
>
> -static struct rocket_iommu_domain*
> -rocket_iommu_domain_create(struct device *dev)
> +static struct rocket_vm *
> +rocket_vm_create(struct device *dev)
>  {
> -       struct rocket_iommu_domain *domain =3D kmalloc_obj(*domain);
> +       struct rocket_vm *vm =3D kmalloc_obj(*vm);
> +       u64 start, end;
>         void *err;
>
> -       if (!domain)
> +       if (!vm)
>                 return ERR_PTR(-ENOMEM);
>
> -       domain->domain =3D iommu_paging_domain_alloc(dev);
> -       if (IS_ERR(domain->domain)) {
> -               err =3D ERR_CAST(domain->domain);
> -               kfree(domain);
> +       vm->domain =3D iommu_paging_domain_alloc(dev);
> +       if (IS_ERR(vm->domain)) {
> +               err =3D ERR_CAST(vm->domain);
> +               kfree(vm);
>                 return err;
>         }
> -       kref_init(&domain->kref);
>
> -       return domain;
> +       start =3D vm->domain->geometry.aperture_start;
> +       end =3D vm->domain->geometry.aperture_end;
> +       drm_mm_init(&vm->mm, start, end - start + 1);
> +       mutex_init(&vm->lock);
> +       kref_init(&vm->kref);
> +
> +       return vm;
>  }
>
> -struct rocket_iommu_domain *
> -rocket_iommu_domain_get(struct rocket_file_priv *rocket_priv)
> +struct rocket_vm *
> +rocket_vm_get(struct rocket_file_priv *rocket_priv)
>  {
> -       kref_get(&rocket_priv->domain->kref);
> -       return rocket_priv->domain;
> +       kref_get(&rocket_priv->vm->kref);
> +       return rocket_priv->vm;
>  }
>
>  void
> -rocket_iommu_domain_put(struct rocket_iommu_domain *domain)
> +rocket_vm_put(struct rocket_vm *vm)
>  {
> -       kref_put(&domain->kref, rocket_iommu_domain_destroy);
> +       kref_put(&vm->kref, rocket_vm_destroy);
>  }
>
>  static int
> @@ -73,7 +81,6 @@ rocket_open(struct drm_device *dev, struct drm_file *fi=
le)
>  {
>         struct rocket_device *rdev =3D to_rocket_device(dev);
>         struct rocket_file_priv *rocket_priv;
> -       u64 start, end;
>         int ret;
>
>         if (!try_module_get(THIS_MODULE))
> @@ -86,29 +93,22 @@ rocket_open(struct drm_device *dev, struct drm_file *=
file)
>         }
>
>         rocket_priv->rdev =3D rdev;
> -       rocket_priv->domain =3D rocket_iommu_domain_create(rdev->cores[0]=
.dev);
> -       if (IS_ERR(rocket_priv->domain)) {
> -               ret =3D PTR_ERR(rocket_priv->domain);
> +       rocket_priv->vm =3D rocket_vm_create(rdev->cores[0].dev);
> +       if (IS_ERR(rocket_priv->vm)) {
> +               ret =3D PTR_ERR(rocket_priv->vm);
>                 goto err_free;
>         }
>
>         file->driver_priv =3D rocket_priv;
>
> -       start =3D rocket_priv->domain->domain->geometry.aperture_start;
> -       end =3D rocket_priv->domain->domain->geometry.aperture_end;
> -       drm_mm_init(&rocket_priv->mm, start, end - start + 1);
> -       mutex_init(&rocket_priv->mm_lock);
> -
>         ret =3D rocket_job_open(rocket_priv);
>         if (ret)
> -               goto err_mm_takedown;
> +               goto err_vm_put;
>
>         return 0;
>
> -err_mm_takedown:
> -       mutex_destroy(&rocket_priv->mm_lock);
> -       drm_mm_takedown(&rocket_priv->mm);
> -       rocket_iommu_domain_put(rocket_priv->domain);
> +err_vm_put:
> +       rocket_vm_put(rocket_priv->vm);
>  err_free:
>         kfree(rocket_priv);
>  err_put_mod:
> @@ -122,9 +122,7 @@ rocket_postclose(struct drm_device *dev, struct drm_f=
ile *file)
>         struct rocket_file_priv *rocket_priv =3D file->driver_priv;
>
>         rocket_job_close(rocket_priv);
> -       mutex_destroy(&rocket_priv->mm_lock);
> -       drm_mm_takedown(&rocket_priv->mm);
> -       rocket_iommu_domain_put(rocket_priv->domain);
> +       rocket_vm_put(rocket_priv->vm);
>         kfree(rocket_priv);
>         module_put(THIS_MODULE);
>  }
> diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/roc=
ket_drv.h
> index 2c673bb99cc..2754f46f174 100644
> --- a/drivers/accel/rocket/rocket_drv.h
> +++ b/drivers/accel/rocket/rocket_drv.h
> @@ -11,22 +11,23 @@
>
>  extern const struct dev_pm_ops rocket_pm_ops;
>
> -struct rocket_iommu_domain {
> +struct rocket_vm {
>         struct iommu_domain *domain;
> +       struct drm_mm mm;
> +       /* protects @mm */
> +       struct mutex lock;
>         struct kref kref;
>  };
>
>  struct rocket_file_priv {
>         struct rocket_device *rdev;
>
> -       struct rocket_iommu_domain *domain;
> -       struct drm_mm mm;
> -       struct mutex mm_lock;
> +       struct rocket_vm *vm;
>
>         struct drm_sched_entity sched_entity;
>  };
>
> -struct rocket_iommu_domain *rocket_iommu_domain_get(struct rocket_file_p=
riv *rocket_priv);
> -void rocket_iommu_domain_put(struct rocket_iommu_domain *domain);
> +struct rocket_vm *rocket_vm_get(struct rocket_file_priv *rocket_priv);
> +void rocket_vm_put(struct rocket_vm *vm);
>
>  #endif
> diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/roc=
ket_gem.c
> index a5fffa51ff3..057fd82e2a5 100644
> --- a/drivers/accel/rocket/rocket_gem.c
> +++ b/drivers/accel/rocket/rocket_gem.c
> @@ -14,20 +14,20 @@
>  static void rocket_gem_bo_free(struct drm_gem_object *obj)
>  {
>         struct rocket_gem_object *bo =3D to_rocket_bo(obj);
> -       struct rocket_file_priv *rocket_priv =3D bo->driver_priv;
> +       struct rocket_vm *vm =3D bo->vm;
>         size_t unmapped;
>
>         drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > =
1);
>
> -       unmapped =3D iommu_unmap(bo->domain->domain, bo->mm.start, bo->si=
ze);
> +       unmapped =3D iommu_unmap(vm->domain, bo->mm.start, bo->size);
>         drm_WARN_ON(obj->dev, unmapped !=3D bo->size);
>
> -       mutex_lock(&rocket_priv->mm_lock);
> +       mutex_lock(&vm->lock);
>         drm_mm_remove_node(&bo->mm);
> -       mutex_unlock(&rocket_priv->mm_lock);
> +       mutex_unlock(&vm->lock);
>
> -       rocket_iommu_domain_put(bo->domain);
> -       bo->domain =3D NULL;
> +       rocket_vm_put(vm);
> +       bo->vm =3D NULL;
>
>         drm_gem_shmem_free(&bo->base);
>  }
> @@ -64,6 +64,7 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void=
 *data, struct drm_file *
>         struct drm_gem_shmem_object *shmem_obj;
>         struct rocket_gem_object *rkt_obj;
>         struct drm_gem_object *gem_obj;
> +       struct rocket_vm *vm;
>         struct sg_table *sgt;
>         int ret;
>
> @@ -74,8 +75,8 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void=
 *data, struct drm_file *
>         gem_obj =3D &shmem_obj->base;
>         rkt_obj =3D to_rocket_bo(gem_obj);
>
> -       rkt_obj->driver_priv =3D rocket_priv;
> -       rkt_obj->domain =3D rocket_iommu_domain_get(rocket_priv);
> +       vm =3D rocket_vm_get(rocket_priv);
> +       rkt_obj->vm =3D vm;
>         rkt_obj->size =3D args->size;
>         rkt_obj->offset =3D 0;
>
> @@ -85,15 +86,15 @@ int rocket_ioctl_create_bo(struct drm_device *dev, vo=
id *data, struct drm_file *
>                 goto err;
>         }
>
> -       mutex_lock(&rocket_priv->mm_lock);
> -       ret =3D drm_mm_insert_node_generic(&rocket_priv->mm, &rkt_obj->mm=
,
> +       mutex_lock(&vm->lock);
> +       ret =3D drm_mm_insert_node_generic(&vm->mm, &rkt_obj->mm,
>                                          rkt_obj->size, PAGE_SIZE,
>                                          0, 0);
> -       mutex_unlock(&rocket_priv->mm_lock);
> +       mutex_unlock(&vm->lock);
>         if (ret)
>                 goto err;
>
> -       ret =3D iommu_map_sgtable(rocket_priv->domain->domain,
> +       ret =3D iommu_map_sgtable(vm->domain,
>                                 rkt_obj->mm.start,
>                                 shmem_obj->sgt,
>                                 IOMMU_READ | IOMMU_WRITE);
> @@ -118,13 +119,13 @@ int rocket_ioctl_create_bo(struct drm_device *dev, =
void *data, struct drm_file *
>         return 0;
>
>  err_unmap:
> -       iommu_unmap(rocket_priv->domain->domain,
> +       iommu_unmap(vm->domain,
>                     rkt_obj->mm.start, rkt_obj->size);
>
>  err_remove_node:
> -       mutex_lock(&rocket_priv->mm_lock);
> +       mutex_lock(&vm->lock);
>         drm_mm_remove_node(&rkt_obj->mm);
> -       mutex_unlock(&rocket_priv->mm_lock);
> +       mutex_unlock(&vm->lock);
>
>  err:
>         drm_gem_shmem_object_free(gem_obj);
> diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/roc=
ket_gem.h
> index 24043033450..e1fbbd8cf71 100644
> --- a/drivers/accel/rocket/rocket_gem.h
> +++ b/drivers/accel/rocket/rocket_gem.h
> @@ -9,9 +9,7 @@
>  struct rocket_gem_object {
>         struct drm_gem_shmem_object base;
>
> -       struct rocket_file_priv *driver_priv;
> -
> -       struct rocket_iommu_domain *domain;
> +       struct rocket_vm *vm;
>         struct drm_mm_node mm;
>         size_t size;
>         u32 offset;
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index 4bc4f9c8ee4..0de56bb84e3 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -240,7 +240,7 @@ static void rocket_job_cleanup(struct kref *ref)
>                                                 refcount);
>         unsigned int i;
>
> -       rocket_iommu_domain_put(job->domain);
> +       rocket_vm_put(job->vm);
>
>         dma_fence_put(job->done_fence);
>         dma_fence_put(job->inference_done_fence);
> @@ -321,7 +321,7 @@ static struct dma_fence *rocket_job_run(struct drm_sc=
hed_job *sched_job)
>         if (ret < 0)
>                 goto err_put_fences;
>
> -       ret =3D iommu_attach_group(job->domain->domain, core->iommu_group=
);
> +       ret =3D iommu_attach_group(job->vm->domain, core->iommu_group);
>         if (ret < 0)
>                 goto err_put_pm;
>
> @@ -564,7 +564,7 @@ static int rocket_ioctl_submit_job(struct drm_device =
*dev, struct drm_file *file
>         kref_init(&rjob->refcount);
>
>         rjob->rdev =3D rdev;
> -       rjob->domain =3D rocket_iommu_domain_get(file_priv);
> +       rjob->vm =3D rocket_vm_get(file_priv);
>
>         ret =3D drm_sched_job_init(&rjob->base,
>                                  &file_priv->sched_entity,
> diff --git a/drivers/accel/rocket/rocket_job.h b/drivers/accel/rocket/roc=
ket_job.h
> index 4ae00feec3b..9373c3d0273 100644
> --- a/drivers/accel/rocket/rocket_job.h
> +++ b/drivers/accel/rocket/rocket_job.h
> @@ -36,7 +36,7 @@ struct rocket_job {
>         /* Fence to be signaled by IRQ handler when the job is complete. =
*/
>         struct dma_fence *done_fence;
>
> -       struct rocket_iommu_domain *domain;
> +       struct rocket_vm *vm;
>
>         struct kref refcount;
>  };
>
> base-commit: f00d7a241f846b053e89c0bb2285ef5988d4cafc
> --
> 2.43.0
>


--=20
Thanks,
Gyeyoung
