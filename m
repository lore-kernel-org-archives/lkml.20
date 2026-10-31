Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793465090;
	b=aEjiUoh93NYHXp6y6xvSNxQUKI8qOXPd7afj6DoQHrsm+2MXaj+3XxjxLz2S6/hgwKWy
	 iVdOfSfgqt8B1L0dt06jgdxrYxvrLCkCXyV8qlkQklm63yf7Oe9H5W4/NDJIHvvpolSWG
	 eU3nysgFiVPq09SL8CGUo37VnUBRm8WXiHvd8QGWEVNWN4GcjyWcEjsPdakpTrO4gLdlX
	 +A023ufhYQojxQFhDxpsyt3tQwjLJ1cP0GxW6VYt2w45DY1jzBxP6tW63Xvh2YE0xX2Oi
	 siIcGz3QAzbFhWfmDndy2n0M8a0WUPbQb+vx9FnBOnNDlt1MtBIh3WgrGsdQl5R2hhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FmRm6q9MEV9UKITnMhmLtqnLP8UqkbAMA4l+VFtEM/w=;
	b=2DFLssjJeDzAY4ha6a5mV9Sha0HKa1/bemffL/HuxPiOJiJGBbBK7ShUCCUgKKQfVVzt
	 5hINnUfyEvbLkjS9myiSAfsRq3DmbGgjnBUULF5x/ae9j1bx2gWV6e4CsmWrYVsGZkOQe
	 1IX+MTf01mwxmOw/3ql5b/QyVt/cvyymgGEgTHPxSiQo4wBwSYJht1OCjxQ5cHdrelMR6
	 3w0b7euykmea3rjeNJ68b6t+xCLkun2FapGc0hdO+FYK82Y83+4LxAhbHPvo0MBpI03y6
	 hUTMZSVPH4MJDx/OpTYYDJ3CApC9tRFDb3NBUFrmD/prPg+daBIYy1qtmMqlV0/jdFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjnCqPzt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A174B606A330
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A174B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjnCqPzt
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67a6cc9acbeso805953d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793465088; cv=none;
        d=google.com; s=arc-20260327;
        b=dYrkgZfxjZHLfo8t7RWOahbPpqvqgxYvqx0M3TIDOanuE6YhQ73vHBAP0HtGqfutHk
         znTCooxliSyeA2QDQUMqI+FF+/fLAzcAvz2AfF5aSl16GKUBDvrYkzDPjqUgfX7k/DB6
         OjdWZ6qHsbhv68s0uRS+wXfVNaq4wtzDLrqIZD1eRYfp8YWBULb8CgiIYllW1qj5egV5
         ysSa6cz0JTRfnmOumvvPZJqAHnofhZVGe3qXnSCaDScryYisA1Bz3N/Cn88z6m4+6xTV
         wPLMDP6JjirwxmI1cZvIgr+jcGD0Qfp0Bh2vV2oOYh3qV0fx0sOUzQKOoLQvaUM0CxRv
         IC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FmRm6q9MEV9UKITnMhmLtqnLP8UqkbAMA4l+VFtEM/w=;
        fh=gPVnhdjDC4HmtlvlCEaIf1rZO0lWnvxz3C5K5ZHGa+s=;
        b=GoguWmSF+VintVEDy3NTqmQ1Mj9Eb59zET4wBamF4jgC/hq8lndQdYnS8uuuRQ1t6A
         yYH4njif4eXHhEGBpPNJ9j2ZejoPZcCaDdBHVvkYMJTleI0hz+NO2CwR+a4Bidf4xUGm
         XEhZXx9LEVOF3aK9QW0qdaFZXxr/2bG7w8R6oWfzGsBVjkT1qvju74R7JLvOPaGTWxme
         XYPKjf1tKRgxOprM4U3EZElRLcl9sS+bWAG7HGbK3NE8cvOu8EjHQUf7CEr8IDRK+Z51
         9lXhMCZ99c5jSjmec6SFOA0DgPTrO0XalMMAK7OjEr7hm/Cz1lZUk/TnecQtGo485xLf
         CVAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793465088; x=1794069888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FmRm6q9MEV9UKITnMhmLtqnLP8UqkbAMA4l+VFtEM/w=;
        b=tjnCqPzth9FZNC4jTMnCKTt39b5h+8L+suP3AG2xPTtpZW0OB0lpTzJxSO6LZz/Abs
         nTfRd3BCvbxUIfptKwnPG1Sz3KSwHXekqezdWWW6SmowmQTSc5kdjQGk1ErWmsGXX41A
         7sbXyh5VSKvjsI2sdag1XOPDi130D3DXH65Rw37Y2HjN5jN1o/iDWQrHc+1OxMg6vD+L
         KDOY8WDYwynd6w90aBhgOUN9GM0EP8L+GMItpM4Wii1VRL1r5bJG+R+o83Sqh2KtiNlz
         X2QlmerGwl3BMJSSA6PiOaGKczmrvoffdvVksTU5LlRG6ATPXv9XEVj6PaTJu9jJ12g0
         GygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793465088; x=1794069888;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmRm6q9MEV9UKITnMhmLtqnLP8UqkbAMA4l+VFtEM/w=;
        b=XBbf3qCRWBgg90al7qynThlo1NceZ0j5MrfWsKr6lM6YL/VNU9bOEsLivSm+D8e/eg
         AGGX19XoPZWXnORbc/mT1BkdXtTRBbmNBAdMMkDkTbknueiDN3RVSnUgxxuN9okHxaUr
         wzG6VZfcxL5WWtyf5My+yjTwFXCRJSYIqxYh8Bn4A2gJ+LjzImrgrMKHzd4KSSY4RPWk
         epwqPaM2w4hGr1sSAIlkpxIEs7laQR1i8Aovfq9ABjlvpaxbTddGZ2ELX/XBntFbY9VN
         ekQ9bOdMB4VAR02Ih6vDs5I90xEAhjm/iMEoHMnAuakZ1/HLs7jq+pwebRBbkrYKOxpl
         hWzA==
X-Forwarded-Encrypted: i=1; AKwUvBz6eOdQv5McYhinsT+hBCgprqnqLITU6zjpq1al6AU1HdDdwd0LgfB0/pJLIDbVU9/BY4+B47OnqruInK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Kl/PmNd2Mv7qstnJfxlC7OU/c/AOwasXokmahMb3aFrkeKLaa
	hPYIE692AJCdghTZ1WINETAVU5l7gUyz9iVSu4kxrDV7sFvcnJZ5k0tXCQlGOavKJd06LpUzDvP
	xepiLEysXQ/XmPaxKGyHlapUZmxIFlLM=
X-Gm-Gg: AYBFou1MBhKI4p84oOyKHI/Ag/EfyNKfyA6t8Jfgup/TPVLqLj/6w3iiI2qzxdaFsm8
	+hu41oytf9Ac/uioexEY+0KbriIAMCnpV9C9fCoHAKhy5juTQFa3lJ1IfkY0iimZogQboLiwwSs
	YA6yCOtlxIDA60K0VFdbebMSqYsX1UO1KbEqk25JgPwxB3y9kaFeY1aGL55/r552iYsFQDn7qZN
	ZE5KXXIrdTz00ZZVGP0zpk8nCF0oY0EEJFPzbvCx3cx61gdTedav216wxdwoJP0EHBOQPaFdkQP
	qIgsJJC1qpmM2lSQwgcQsWOMIDyOKTeeRATdsYLyye4MGBHurm3A0T6ZDNUQWuZmVwVESiZGzhb
	vih1smHhz4y6oXUk5Yg/vD6n3UdClNEX/DfIDLmw=
X-Received: by 2002:a05:690e:440f:b0:676:8974:9788 with SMTP id
 956f58d0204a3-67ba50fc586mr2202215d50.96.1793465088303; Sat, 31 Oct 2026
 09:44:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011-pvr-gpuvm-immediate-v2-0-744ddc6644c3@gmail.com> <20261011-pvr-gpuvm-immediate-v2-1-744ddc6644c3@gmail.com>
In-Reply-To: <20261011-pvr-gpuvm-immediate-v2-1-744ddc6644c3@gmail.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 1 Nov 2026 01:44:37 +0900
X-Gm-Features: AclHuK9TWlU8P9Ml10d2T0OXF04K7g-lp1-r1t3qWFHqZqMDpRJwUYAW2fycKsA
Message-ID: <CAKbEznvSrJSN7_x22aWVzwM4otXMfgadurNp9arLcSzaQ9dsJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/imagination: Switch the GPUVM to immediate mode
To: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alexandru Dadu <alexandru.dadu@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>, 
	Frank Binns <frank.binns@imgtec.com>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The infinite loop issue in pvr_vm_unmap_all() reported by Sashiko is not
introduced by this patch; it has existed since commit a5c4c3ba95a5
("drm/imagination: Hold drm_gem_gpuva lock for unmap").

Fixed in a separate patch:
https://lore.kernel.org/r/20261015-pvr-unmap-all-loop-v1-1-54c676d41269@gma=
il.com/

On Sun, Oct 11, 2026 at 6:45=E2=80=AFPM Gyeyoung Baek <gye976@gmail.com> wr=
ote:
>
> Use DRM_GPUVM_IMMEDIATE_MODE so that each GEM's GPUVA list is protected
> by its gpuva.lock instead of its dma_resv. This prepares for
> asynchronous VM_BIND, whose run_job() will update the GPUVA lists
> before signalling its fence. That section imposes three rules:
>
> 1. No dma_resv: another thread may hold it while waiting for the job's
>    fence, directly or through a dependency.
>    -> Protect the lists with gpuva.lock, and take it around
>       drm_gpuva_link().
>
> 2. No allocation under a lock run_job() takes: reclaim may wait for a
>    fence that depends on the job.
>    -> Allocate the vm_bo before taking gpuva.lock:
>       drm_gpuvm_bo_obtain_locked() becomes drm_gpuvm_bo_create() +
>       drm_gpuvm_bo_obtain_prealloc().
>
> 3. No freeing of GEM objects: that takes their dma_resv, and under
>    gpuva.lock would free the held lock too.
>    -> Defer it: drm_gpuva_unlink() and drm_gpuvm_bo_put() become
>       drm_gpuva_unlink_defer() and drm_gpuvm_bo_put_deferred(), and
>       drm_gpuvm_bo_deferred_cleanup() frees once the locks are dropped.
>
> This also fixes an unlocked GPUVA list update: when a map fails,
> pvr_vm_bind_op_fini() drops the last vm_bo reference without holding
> the object's dma_resv.
>
> Failing VM_MAP allocations with fail-nth shows
> it on a lockdep kernel (real allocation failures under memory pressure
> take the same path):
>
>   WARNING: drivers/gpu/drm/drm_gpuvm.c:1661 at drm_gpuvm_bo_put+0x2ec/0x6=
60 [drm_gpuvm]
>   Call trace:
>    drm_gpuvm_bo_put
>    pvr_vm_bind_op_fini
>    pvr_vm_map
>    pvr_ioctl_vm_map
>
> Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
> Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
> ---
>  drivers/gpu/drm/imagination/pvr_vm.c | 39 +++++++++++++++++++++++++++---=
------
>  1 file changed, 30 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagi=
nation/pvr_vm.c
> index cbdd15ed74f..807a01aab1d 100644
> --- a/drivers/gpu/drm/imagination/pvr_vm.c
> +++ b/drivers/gpu/drm/imagination/pvr_vm.c
> @@ -214,7 +214,7 @@ static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op =
*bind_op)
>
>  static void pvr_vm_bind_op_fini(struct pvr_vm_bind_op *bind_op)
>  {
> -       drm_gpuvm_bo_put(bind_op->gpuvm_bo);
> +       drm_gpuvm_bo_put_deferred(bind_op->gpuvm_bo);
>
>         kfree(bind_op->new_va);
>         kfree(bind_op->prev_va);
> @@ -255,11 +255,11 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind=
_op,
>
>         bind_op->type =3D PVR_VM_BIND_TYPE_MAP;
>
> -       dma_resv_lock(obj->resv, NULL);
> -       bind_op->gpuvm_bo =3D drm_gpuvm_bo_obtain_locked(&vm_ctx->gpuvm_m=
gr, obj);
> -       dma_resv_unlock(obj->resv);
> -       if (IS_ERR(bind_op->gpuvm_bo))
> -               return PTR_ERR(bind_op->gpuvm_bo);
> +       bind_op->gpuvm_bo =3D drm_gpuvm_bo_create(&vm_ctx->gpuvm_mgr, obj=
);
> +       if (!bind_op->gpuvm_bo)
> +               return -ENOMEM;
> +
> +       bind_op->gpuvm_bo =3D drm_gpuvm_bo_obtain_prealloc(bind_op->gpuvm=
_bo);
>
>         bind_op->new_va =3D kzalloc_obj(*bind_op->new_va);
>         bind_op->prev_va =3D kzalloc_obj(*bind_op->prev_va);
> @@ -293,6 +293,8 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_o=
p,
>
>  err_bind_op_fini:
>         pvr_vm_bind_op_fini(bind_op);
> +       /* Drain what fini() deferred. */
> +       drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
>
>         return err;
>  }
> @@ -366,7 +368,11 @@ pvr_vm_gpuva_map(struct drm_gpuva_op *op, void *op_c=
tx)
>                 return err;
>
>         drm_gpuva_map(&ctx->vm_ctx->gpuvm_mgr, &ctx->new_va->base, &op->m=
ap);
> +
> +       mutex_lock(&op->map.gem.obj->gpuva.lock);
>         drm_gpuva_link(&ctx->new_va->base, ctx->gpuvm_bo);
> +       mutex_unlock(&op->map.gem.obj->gpuva.lock);
> +
>         ctx->new_va =3D NULL;
>
>         return 0;
> @@ -396,7 +402,7 @@ pvr_vm_gpuva_unmap(struct drm_gpuva_op *op, void *op_=
ctx)
>                 return err;
>
>         drm_gpuva_unmap(&op->unmap);
> -       drm_gpuva_unlink(op->unmap.va);
> +       drm_gpuva_unlink_defer(op->unmap.va);
>         kfree(to_pvr_vm_gpuva(op->unmap.va));
>
>         return 0;
> @@ -418,6 +424,7 @@ pvr_vm_gpuva_unmap(struct drm_gpuva_op *op, void *op_=
ctx)
>  static int
>  pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *op_ctx)
>  {
> +       struct drm_gem_object *obj =3D op->remap.unmap->va->gem.obj;
>         /* The split parts belong to the object of the mapping being spli=
t. */
>         struct drm_gpuvm_bo *vm_bo =3D op->remap.unmap->va->vm_bo;
>         struct pvr_vm_bind_op *ctx =3D op_ctx;
> @@ -435,16 +442,20 @@ pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *o=
p_ctx)
>         drm_gpuva_remap(&ctx->prev_va->base, &ctx->next_va->base, &op->re=
map);
>
>         if (op->remap.prev) {
> +               mutex_lock(&obj->gpuva.lock);
>                 drm_gpuva_link(&ctx->prev_va->base, vm_bo);
> +               mutex_unlock(&obj->gpuva.lock);
>                 ctx->prev_va =3D NULL;
>         }
>
>         if (op->remap.next) {
> +               mutex_lock(&obj->gpuva.lock);
>                 drm_gpuva_link(&ctx->next_va->base, vm_bo);
> +               mutex_unlock(&obj->gpuva.lock);
>                 ctx->next_va =3D NULL;
>         }
>
> -       drm_gpuva_unlink(op->remap.unmap->va);
> +       drm_gpuva_unlink_defer(op->remap.unmap->va);
>         kfree(to_pvr_vm_gpuva(op->remap.unmap->va));
>
>         return 0;
> @@ -588,7 +599,8 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, boo=
l is_userspace_context)
>         drm_gem_private_object_init(&pvr_dev->base, &vm_ctx->dummy_gem, 0=
);
>         drm_gpuvm_init(&vm_ctx->gpuvm_mgr,
>                        is_userspace_context ? "PowerVR-user-VM" : "PowerV=
R-FW-VM",
> -                      0, &pvr_dev->base, &vm_ctx->dummy_gem,
> +                      DRM_GPUVM_IMMEDIATE_MODE, &pvr_dev->base,
> +                      &vm_ctx->dummy_gem,
>                        0, 1ULL << device_addr_bits, 0, 0, &pvr_vm_gpuva_o=
ps);
>
>         mutex_init(&vm_ctx->lock);
> @@ -622,6 +634,7 @@ pvr_vm_context_release(struct kref *ref_count)
>                 pvr_fw_object_destroy(vm_ctx->fw_mem_ctx_obj);
>
>         pvr_vm_unmap_all(vm_ctx);
> +       drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
>
>         pvr_mmu_context_destroy(vm_ctx->mmu_ctx);
>         drm_gem_private_object_fini(&vm_ctx->dummy_gem);
> @@ -758,7 +771,9 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_=
gem_object *pvr_obj,
>
>  err_cleanup:
>         mutex_unlock(&vm_ctx->lock);
> +
>         pvr_vm_bind_op_fini(&bind_op);
> +       drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
>
>         return err;
>  }
> @@ -840,6 +855,8 @@ pvr_vm_unmap_obj(struct pvr_vm_context *vm_ctx, struc=
t pvr_gem_object *pvr_obj,
>         err =3D pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj, device_addr, siz=
e);
>         mutex_unlock(&vm_ctx->lock);
>
> +       drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
> +
>         return err;
>  }
>
> @@ -874,6 +891,8 @@ pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 devic=
e_addr, u64 size)
>
>         mutex_unlock(&vm_ctx->lock);
>
> +       drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
> +
>         return err;
>  }
>
> @@ -906,6 +925,8 @@ pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx)
>         }
>
>         mutex_unlock(&vm_ctx->lock);
> +
> +       drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
>  }
>
>  /* Static data areas are determined by firmware. */
>
> --
> 2.43.0
>


--=20
Thanks,
Gyeyoung
