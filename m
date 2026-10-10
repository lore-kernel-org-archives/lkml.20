Received: from mail-lr2-f1.google.com (mail-lr2-f1.google.com [74.125.230.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB863BBFCD
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600954; cv=pass; b=gHSn2tyy0qnBsyq3UaHX/85LGdgtEcvFDXQYXzpAM4q6Je3BSFLkZM3gwSJ50APHxBOFmr+DGsIRoC0eP4PS1+3P7u9oFWijI5tvUFZFY8J5tfzb44V3lv1nytQXmXjW8HnQ9urbBdLQljrwp8T+oPNh2pHw2UduNqpQWtNCopo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600954; c=relaxed/simple;
	bh=EG9nG2BtRF4hLX8TcskxUvpuLvSWxqDYOY5xSWx8x1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dun33LCU2Dhgqf905V212OE8xPizjbBsuEb+Y7rIKr+s+wAmSrxy3nfTSn1A/lVkegzy4/MliMxNXFyOvQI/HupJE6/kkEUlbDoZx14oM44rLizLQjxDUOT6NhoE9auafJ/wzRJPDJt7P9ZN7vyANnnpzGX8BrVgd1P98FCTTzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DA8wJeVA; arc=pass smtp.client-ip=74.125.230.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DA8wJeVA"
Received: by mail-lr2-f1.google.com with SMTP id 38308e7fff4ca-3a772511049so3008711fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 19:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791600951; cv=none;
        d=google.com; s=arc-20260327;
        b=X1aLZStYNrNXRz7qzT/gTdBNOCLWUm6NGTp4Ct3FWzc4cUKwl8y9++xv8Y+iE4LYSB
         R1ZKKKTXytAEc4501G0eisC677UXEqAkyC5TDT9frEMLTO6dLLyxNicVp32jPYD+V1v1
         Oe8AztrEh7EhBV7yTGi7UlkzX0LoC2BncCak1M38SHQzbQfd2DltqM+DWW6ugJpIwMOn
         PzFsTJrZmRZub3fcL6gWU4kYU4RK9SODeNSu/elJRPy5bbFv/MwYvWznPrkr6VW3TsiI
         EMb/4NLlYnJiWnkgBD81Xo4WX1geP5Aw+scw4MUTHE71/A6+nlPRh/NEL5IF8snKUEKO
         3qMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Ed07fuWkE9fwos4AUZ3ykff2cVsq6dA1pVFJ9uVlwM=;
        fh=JYtijFeF7APZinlETiRkCMyjlikDB1+KVwE+QIUJ+5A=;
        b=pATm3jhVzx0zZ2U5ebgM7n20HgXkznU82oHUSdm65BifvOaGJWAwhjZTngKhzDvNFD
         DUqR0gpdpIcyJDIaG6QwNVvah+53t1Xg6IiXL/nKDQ5PNWUK3fyUYdkUxWbWidExkgBL
         Xr9hT3tFkcPQQFhuSbht9EcWQVWEOxx3XAvZx7iiFVkplSOpdueaeqTRSyWs9urnTYLV
         k1tChkE2i1MB5Pcizn7JTp9NYc9pqikSlqGrE/YhnolXRG1nDit1IStJRwTn0ZadYYCC
         ohZ8V5X8A6qXkNJHbm1Jy3QK3yD0k5BUemu9I3X8pAxXTLyzCb1x7aVBQbUc5s+G/EIN
         tvJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791600951; x=1792205751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Ed07fuWkE9fwos4AUZ3ykff2cVsq6dA1pVFJ9uVlwM=;
        b=DA8wJeVANY57w6z35LS6VABLRoNnVqfEacXj5sNw1jZl43/LzGKx8T+AWAnKGlAQIV
         7Yu8ksgHvjOja7DQSKLIJnhwd7hfpOEc5zLont6hCLOrEtqatIEnMmZn1RDmtaiN1DuH
         iDoA2uOa1WYeWHAz2wG8Q3TERNijexYY+DNYUH6VhqUta6P+ztrfUpIrriNukecdU+Uq
         CoQ30F0yBQNPiP9/t40OBzeT1uINBfgo75vbaCC+a3cxOgZTseEq4vHC8xElJFLe4TvI
         RwDjVIFuQR/DPXfUeTolgb/9eU0ik6GTsLIJRcePCwPNL3DUEuaDC6fSVL5Zl/VP8llk
         X2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791600951; x=1792205751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Ed07fuWkE9fwos4AUZ3ykff2cVsq6dA1pVFJ9uVlwM=;
        b=HXTu+GH2RiVk/GmrJSKFxYfz/FqYCgE5+OMglfOGL1VM0t9xiv1Fm1A48tmHj45DTE
         lp5uUAoPRkcYndJF/SgeyYtcu/6Ho4CIUFVg7sgWowY8bdGVMIuTphTxY+idmCXcEML3
         v4QUDY9lg0Yr0a8C6Ado5IGJ+wjExPyhQ1vbievJ2FGixjZcwPPecWZXMowIaAUNfczn
         uXh/Q3Xf8rJjyWam6GVbHLalVZtVYrmIJhNaI1xEX/bV5tC+Dlc8fqQSiwIF7/tKIOOq
         0adGexq8NmeU3EukcV4k9aAM6C/Or/slUsXZLsWubDlzIAsS3HZuHX6JUD8hKDqyNo2w
         XAIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQ53fe97hZa+9iMRWQY0zrTcBEtb+eUxbfDhLNhLuNpaEU32gf3qGX6ZWi6Roe9Ia+1cPFVz0wTHAqJqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCfwdSzUHOQF/OO5DQARtAZ/lV9LerSqjNinndI4igOzgORB21
	0Y7qoN1zfB827Qixh4B5K2gpI+3E6xoOrCz3nMy2qdSFRB8Z21kDG/CWkDtxBAbGGbiiXdGtw+F
	mroXx+b8j1RXbAMpLo+Gu2IJ/GCx/55Q=
X-Gm-Gg: AYBFou2GlHJQeCgLyLP4QBBInUA9YKv8GE20D6Sg/xvqJAUYZaC9XSd1p7NqrnsaNs/
	LDiAv6ael9N5JOgl7ZYa/Ieb1FCDoif/YbZcVMAD4K10ZPUJUuVJvH9jUoCTJK3f//y9SHp2+Cc
	IFQVpOpjdVlkRUYraMVMeH7THDW0CplNV3DRjraK67Xc+5GeCkKFIbkBLoUgKi4gGlvpi7tZmGo
	t3GvC6CGbFkaZfNXsvQUS2+LxJTRuAD++8jDgvxeoYGVie+EYhNauqvOCU5O+XogY85YqkiqRYK
	4tHsJMRQndq6OJirbaw11Pit67Fzsf0FTtKeQOROCwWUrqApllHTgt7N
X-Received: by 2002:a05:651c:198f:b0:3a9:7993:14d9 with SMTP id
 38308e7fff4ca-3a9c55db6demr8033451fa.8.1791600950465; Fri, 09 Oct 2026
 19:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009101842.3294707-1-bsdhenrymartin@gmail.com>
 <2bbea75d-2e3f-4a57-a291-5f5d9ca698c5@amd.com> <9e519955-e63b-469d-8acf-268b9802e0b6@amd.com>
In-Reply-To: <9e519955-e63b-469d-8acf-268b9802e0b6@amd.com>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Sat, 10 Oct 2026 10:55:38 +0800
X-Gm-Features: AclHuK8jQu2OuoKyhFajMg-wI8QX3TxzpO-LWoyEF9m9UL71Uox_eNc24B_fdJ4
Message-ID: <CAEnQdOrvD+uju5FBcew7TPWvfcfuSOHHyxuwF3T91yHOG5GYDQ@mail.gmail.com>
Subject: Re: [PATCH] amdkfd: fix doorbell allocation race creating duplicate allocations
To: "Kuehling, Felix" <felix.kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Felix,

You're right on both counts, thanks for the careful look.

v2 drops kfd->doorbell_mutex entirely and adds a per-process-device
mutex in struct kfd_process_device (initialized in
kfd_create_process_device_data()).  The device-global mutex is no
longer held across the sleeping allocations, so the existing
dqm->lock -> doorbell_mutex order on the start_cpsch() -> pm_init()
-> kq_initialize() path cannot invert, and unrelated processes no
longer serialize against each other for per-process doorbell setup.

The Fixes tag is corrected to 2105a15a2046 ("drm/amdgpu: use
doorbell mgr for kfd process doorbells").

Regards,
Henry

Kuehling, Felix <felix.kuehling@amd.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=889=
=E6=97=A5=E5=91=A8=E4=BA=94 23:33=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2026-10-09 11:00, Kuehling, Felix wrote:
> > On 2026-10-09 06:18, Henry Martin wrote:
> >> The check-and-allocate sequence on pdd->qpd.proc_doorbells is
> >> lockless at every call site of kfd_alloc_process_doorbells():
> >> kfd_get_process_doorbells() (mmap of /dev/kfd), kfd_ioctl_create_queue=
()
> >> and the CRIU restore path each test the pointer under different
> >> locking (or none), so two racing threads can both observe NULL and
> >> each allocate a doorbell BO and bitmap, orphaning one allocation and
> >> handing the two mappings different backing pages.
> >>
> >> Move the serialization into kfd_alloc_process_doorbells() itself:
> >> take kfd->doorbell_mutex and re-check under it, so all three call
> >> sites are covered regardless of their own locking.  The existing
> >> doorbell_mutex users (kfd_get_kernel_doorbell() /
> >> kfd_release_kernel_doorbell()) only guard the device-global
> >> kfd->doorbell_bitmap in short non-sleeping sections and never call
> >> into this path, so there is no nesting.
> >>
> >> This vulnerability was discovered by Tencent CodeBuddy Security.
> >>
> >> Fixes: 428542d91772 ("drm/amd/display: Setup for
> >> mmhubbub3_warmup_mcif with big buffer")
> >> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> >
> > Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
> >
> > I'm applying the patch to amd-staging-drm-next.
>
> An automatic Claude review pointed out two problems with the patch. I
> agree with both:
>
> The Fixes: tag points at an unrelated drm/amd/display commit
> (428542d91772). It must be corrected =E2=80=94 2105a15a2046 ("drm/amdgpu:=
 use
> doorbell mgr for kfd process doorbells") is the commit that introduced
> the allocation being fixed.
>
> The patch holds the device-global kfd->doorbell_mutex across
> bitmap_zalloc(GFP_KERNEL) and amdgpu_bo_create_kernel(), while that same
> mutex is already acquired under dqm_lock via start_cpsch -> pm_init ->
> kq_initialize -> kfd_get_kernel_doorbell(). That is a plausible ABBA
> inversion once reclaim/TTM eviction runs the KFD eviction fence back
> into dqm_lock. Please either post lockdep (CONFIG_PROVE_LOCKING) results
> for a boot + queue-create cycle, or switch to a per-process-device lock,
> which also avoids serialising unrelated processes behind a device-wide
> mutex for per-process state.
>
> Regards,
>    Felix
>
>
> >
> > Thanks,
> >   Felix
> >
> >
> >> ---
> >>   drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c | 15 ++++++++++++++-
> >>   1 file changed, 14 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
> >> b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
> >> index fdcf7f2d1b5b4..07f881573837e 100644
> >> --- a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
> >> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
> >> @@ -257,12 +257,21 @@ int kfd_alloc_process_doorbells(struct kfd_dev
> >> *kfd, struct kfd_process_device *
> >>       int r;
> >>       struct qcm_process_device *qpd =3D &pdd->qpd;
> >>
> >> +    mutex_lock(&kfd->doorbell_mutex);
> >> +
> >> +    /* Another thread may have won the check-and-allocate race */
> >> +    if (qpd->proc_doorbells) {
> >> +        mutex_unlock(&kfd->doorbell_mutex);
> >> +        return 0;
> >> +    }
> >> +
> >>       /* Allocate bitmap for dynamic doorbell allocation */
> >>       qpd->doorbell_bitmap =3D
> >> bitmap_zalloc(KFD_MAX_NUM_OF_QUEUES_PER_PROCESS,
> >>                            GFP_KERNEL);
> >>       if (!qpd->doorbell_bitmap) {
> >>           DRM_ERROR("Failed to allocate process doorbell bitmap\n");
> >> -        return -ENOMEM;
> >> +        r =3D -ENOMEM;
> >> +        goto unlock;
> >>       }
> >>
> >>       r =3D init_doorbell_bitmap(&pdd->qpd, kfd);
> >> @@ -284,11 +293,15 @@ int kfd_alloc_process_doorbells(struct kfd_dev
> >> *kfd, struct kfd_process_device *
> >>           DRM_ERROR("Failed to allocate process doorbells\n");
> >>           goto err;
> >>       }
> >> +
> >> +    mutex_unlock(&kfd->doorbell_mutex);
> >>       return 0;
> >>
> >>   err:
> >>       bitmap_free(qpd->doorbell_bitmap);
> >>       qpd->doorbell_bitmap =3D NULL;
> >> +unlock:
> >> +    mutex_unlock(&kfd->doorbell_mutex);
> >>       return r;
> >>   }
> >>
> >> --
> >> 2.43.7
