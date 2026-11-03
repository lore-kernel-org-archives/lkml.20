Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793703090;
	b=rS+ua1y6kYWlsR3Y6xVd1i84lgZbs7O1BYIvTjkX3FrRQEUxj8CBU4mUXG3GzQk1PyS6
	 76+GMJLSW/mjOcYGHBoDtcToSYWnGCjreXSIXp2h4oT/r67Dw2FeVWFkBeXIrrZtl9ElL
	 ATBym/C2TZSpPxWshReHquY/Mwmd8+HOe4U3QSC/CgoYi3fnGsPCefvP9bdHIAx8fZvUG
	 qunVk1n8oSonnaFn8QzVLuLFDgYesWep/SAAIkNtynE2jnrj6pt/DHlG9kFqRoISeJgqX
	 6+Zceeu/5H2V1nq2E3foVoVi1SuWV+d7wzIGAjyQXXKWwpOGGdy3YqzhTw6rHKXMSXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=imAw8ZIdSV8OvmuW0pEH39O2GWMZ5lvM009/jM+c93A=;
	b=sEg4INzQkylmozus8s+vzPnpoQjyefNuO2RIkaPJ2K2DAhsPeg7bRJv8giykEWqfZO/g
	 5UJYcX0GlYoWFNtVtxM/073Cn4Msb5Oum2ukpwrOduD7t7fU+hMT4z5IWmlKZh0UxMLQb
	 sM+OdzzBFiaBgerDTo9aNphW2IAdK6IOm0XFPXxyyr+NaX8rTSzPApfDwnQmUlGKMUtUk
	 sz0cHCjWHE8bci1xJC/zArtpIOYXZ3PIxDDk9ux3BQlFTyOqH4sUpw+0DKOHrk9HvfUWw
	 aBsrDIhbTL7yiZPv/VHQvGlKI4NWL57jl+YDOU692HrDiqXxrh8RRRx51VhnbQ6je4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AJfDV6hN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AED606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20AED606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AJfDV6hN
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f20c3aaa5so427978785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:51:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793703088; cv=none;
        d=google.com; s=arc-20260327;
        b=sDdRQAOwTGs5GHWMSnRSEIYERGSOkjPIN4vZr7rruyXzwNCXYnS+CL9RaHT/VuJ1ES
         G7EWL4fdzk5MuP7UaiiL3ZHsgzbZXSCQJ6eE3+SiYayt3zIEL0hwfKys38WunU6kl7CN
         YyT+dU148HXCbzpRyg5QzAvKrtwouJtMNC1lEIb7uE8zoMIZcTwL8iYFLYJskGh7LOpi
         Mi6mimWKqNp/G6+BPM3JtaXLQ9+WZE6o0iYSrQFaGoeGECkyguLDVLyCVkEXmc5FgLQi
         VtoSv4DS4eBPzT4SiQlmkcA9ooXDQP6qUa0S8DFitMCs5TFeCRqV7JUYeifCV0rX//x0
         +UsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=imAw8ZIdSV8OvmuW0pEH39O2GWMZ5lvM009/jM+c93A=;
        fh=IU9L4kHseKY0gkcsL/KIjsvBsFBghS9zzhlEZET5Nac=;
        b=Wwsjv1xeFkgh5/PVlMPEDsVyl4tDGN2SrZ906wpkAlf18qmrlXQkK01pWgE/OQbU7V
         +SFYDeBaoOmAbYr02OY+cCQFxd4xqmOB9ahM3teahqDGuVfuW8uLWtAJxJtpUOYhO3vK
         solSJ6f2LHUu0aCsBIdjxD9Nj+wWa2YqIx4Z9ARZ7VhX9WckAgnVEE9Ginjq36MK7EUp
         ge0it1uU9n6s1dmI3/NPzc3SEwroTWVv5ybl9cRWtx5sHgmG/Kixbf29QwkNTALga4jd
         HrMmtoP1zi6WgF7fAUyRKXRPKIeAFcu+IVGHOfmZdtt07aj4LGyhcQC4CAndbYXYOg6O
         amOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1793703088; x=1794307888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=imAw8ZIdSV8OvmuW0pEH39O2GWMZ5lvM009/jM+c93A=;
        b=AJfDV6hN1yk7aUWKOiCJ4S3Yl1V/SBov3/+ROel0WlMguUaGrA979bwtCtX2aCShLy
         xLOLRH9NaDJFnNn2IjF0nW/xk7GSTyNAGJgRgg/8ON2adKbcYX2rout3ZUcQsMVFkZAJ
         nbf9ftLXWzrznuvEeUPbQPYUQ27Z0XYz0TkBmnSlvReCi8beaEdZNoFUeddyPyZPwF1Y
         n6H14M+V0A2gbQIRV5nFLq9TODQxxG5RqBRHhqOLWJf2Mze0bV71JzVXIm9ZKYuceCrD
         pveX/WcgH/XZjJDy7vYJIWN5C4cAjCQ129an7xwQa0NRMMbRl8D0MwN3KBf4z8Xv1A2E
         DAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703088; x=1794307888;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imAw8ZIdSV8OvmuW0pEH39O2GWMZ5lvM009/jM+c93A=;
        b=VVQytPwdP2BKm0QSRveWStnz/C5gc31SJAQWF86z79OrfFKh51d6pOqBIggYook/kk
         CPW15mzCl0x6xPQtPYOaHVFCFE8JN6XVaZcR1y7/TD40/V8paSbpH+bexGggH/UkCvOs
         MheIwuIQh70X7q2vYTZ5fHeqHafUtOElzhQL1LNFeNfXZIG0sVnqFhY+mxPo3zHVVu56
         1E/xujRF7PHAfEEUiFk3+oPnDXhqV2JT+oY/SYkfVva2wrlWm57Hg+n4+1x+s41t2HWY
         69QNC7qcwIflGxsg+Qze+ePeV2U19+DxA4xoGyrUSdk2H86xHaao2VQbXRLD50XfMMAE
         0f0w==
X-Forwarded-Encrypted: i=1; AKwUvBzz01swWuuWqyZLzty/ANy1QaFCmy9zbMA3/CKfaZDOoO+B7Yo6AGqRcl9Rx0wdmaAqeFfKkC8JyjKkqXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ztvzx7TkDI5N8ZTq7ENmGU09xGP2cu1MJYyNyl4DndR2ZfLhQ
	S87vTa0wRN853h5u3khhsMtsdiqp8D4aoXhmnBCiZbEfoPp9bc27BBiGOSMNl38M5s+vdDWi24w
	sPiCdeh3t8JZ2NUFxIKyaZMy6K1nXzHRNO5k4yCvwwA==
X-Gm-Gg: AYBFou2eI0+ub5S67IAw5e7cuXQpHVoJgDhTWNl3uQitqGT0zsxsJsNxo7CI4Y99fmu
	01TODd8Mj8hND7Z21OULwbPrg5lC6aT+nTMr/4BZniyzqhSQQUvSxUxKPngq2u1Mk2WjblYpgtg
	QCItQxUg0RjQ11q3twIRgTbUAwufnfwRTG5lFqWfHyNAJH8pgfJ2bbPDFxFCyR+RlYSFqx9LA7U
	RWSARbNsdWVs5tz26ewYF5tvcXyQ/MimELaur4A43HKgKJcq3uru2XTlD2zyNn2xVCnt3RKWcPF
	BDz2VdR13i/g0F+PXrbioxpGRDqotNttAKIiylqDbObeViA47iv3qM2hPKbNouMfYbXwgmi95on
	QclmY7tQaD230qEPIiO9oK7isFORm64z9wnIDj4/BQfkhrOo49G1+/W/rSVb0kLuCKGkWB3bjHx
	Qp3Wh+bh2poPMEW6cqig4=
X-Received: by 2002:a05:620a:84c4:b0:93e:66e6:fa4 with SMTP id
 af79cd13be357-94421712a8dmr1989192685a.16.1793703087871; Tue, 03 Nov 2026
 02:51:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101152723.1430312-1-sidong.yang@furiosa.ai>
In-Reply-To: <20261101152723.1430312-1-sidong.yang@furiosa.ai>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 3 Nov 2026 11:51:16 +0100
X-Gm-Features: AclHuK-z6BmO2pZg0oIpH0qZUB9cGfGSi7vP1P71zNtjG5vZjK7jOSPibONtTLI
Message-ID: <CAPsqS2Q_U=ZJEnZ=hCztVW=_8iRvj4uy-3cGbOLNLJaYMjdQbQ@mail.gmail.com>
Subject: Re: [PATCH v2] accel/rocket: Report per-core engine usage through fdinfo
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Oded Gabbay <ogabbay@kernel.org>, Gyeyoung Baek <gye976@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sidong,

can you please check the drm usage stats spec at
Documentation/gpu/drm-usage-stats.rst ?

I think you need to conform to the key naming part of it, with a
single key with a capacity equal to the number of cores. We also need
an entry in Documentation/gpu/drm-usage-stats.rst like the other
drivers have.

Btw, with a perfmon ioctl, we could have Perfetto integration and
benefit from other work such as drm-sched tracepoint visualization.
Just saying in case it can help in your use cases.

Thanks,

Tomeu

On Sun, Nov 1, 2026 at 4:27=E2=80=AFPM Sidong Yang <sidong.yang@furiosa.ai>=
 wrote:
>
> There is no way to tell how much of the NPU a client uses, or whether its
> jobs reach more than one core. Implement the DRM usage stats: account the
> time each job occupies a core and report it per client as
> drm-engine-npu<n>, along with drm_show_memory_stats() for the BOs.
>
> Jobs can outlive the file that submitted them, so the counters are
> refcounted and each job holds a reference. The time covers the whole
> period a job owns a core, so it also includes handling the completion
> interrupt and the gaps between the tasks of a multi-task job.
>
> The array is sized by rdev->max_cores, the number of core slots, not by
> the number of cores bound when the file is opened. A core can still be
> probing while a client opens the device, and the IRQ handler indexes the
> array with core->index, which stays valid when a core is unbound. A slot
> with no core bound reads as zero.
>
> For example, teflon running a model two operations deep 3001 times gives:
>
>   drm-engine-npu0:      22719385 ns
>   drm-engine-npu1:      23345296 ns
>   drm-engine-npu2:      0 ns
>
> The NPU is busy 15.6% of the wall clock time and one core is never used.
>
> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> ---
> v2: Size the per-core counters by rdev->max_cores, the number of core
>     slots, instead of the number of cores bound when the file is opened.
>     Sashiko reported the out-of-bounds read and Gyeyoung Baek reproduced
>     it with KASAN.
>
>     This depends on commit 6eff1d69dae8 ("accel/rocket: search every core
>     slot when a core is removed"), which added rdev->max_cores. It is in
>     mainline through drm-misc-fixes but not yet in drm-misc-next.
>
> Link to v1: https://lore.kernel.org/all/20261031083642.1076356-1-sidong.y=
ang@furiosa.ai/
>
>  drivers/accel/rocket/rocket_drv.c | 60 +++++++++++++++++++++++++++++--
>  drivers/accel/rocket/rocket_drv.h | 14 ++++++++
>  drivers/accel/rocket/rocket_job.c |  7 ++++
>  drivers/accel/rocket/rocket_job.h |  4 +++
>  4 files changed, 83 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/roc=
ket_drv.c
> index 2bcfe4ab3c68..58a486206565 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -3,8 +3,10 @@
>
>  #include <drm/drm_accel.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_ioctl.h>
> +#include <drm/drm_print.h>
>  #include <drm/rocket_accel.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
> @@ -68,6 +70,25 @@ rocket_iommu_domain_put(struct rocket_iommu_domain *do=
main)
>         kref_put(&domain->kref, rocket_iommu_domain_destroy);
>  }
>
> +static void
> +rocket_engine_usage_destroy(struct kref *kref)
> +{
> +       kfree(container_of(kref, struct rocket_engine_usage, kref));
> +}
> +
> +struct rocket_engine_usage *
> +rocket_engine_usage_get(struct rocket_file_priv *rocket_priv)
> +{
> +       kref_get(&rocket_priv->engine_usage->kref);
> +       return rocket_priv->engine_usage;
> +}
> +
> +void
> +rocket_engine_usage_put(struct rocket_engine_usage *usage)
> +{
> +       kref_put(&usage->kref, rocket_engine_usage_destroy);
> +}
> +
>  static int
>  rocket_open(struct drm_device *dev, struct drm_file *file)
>  {
> @@ -86,10 +107,19 @@ rocket_open(struct drm_device *dev, struct drm_file =
*file)
>         }
>
>         rocket_priv->rdev =3D rdev;
> +
> +       rocket_priv->engine_usage =3D kzalloc_flex(*rocket_priv->engine_u=
sage,
> +                                                elapsed_ns, rdev->max_co=
res);
> +       if (!rocket_priv->engine_usage) {
> +               ret =3D -ENOMEM;
> +               goto err_free;
> +       }
> +       kref_init(&rocket_priv->engine_usage->kref);
> +
>         rocket_priv->domain =3D rocket_iommu_domain_create(rdev->cores[0]=
.dev);
>         if (IS_ERR(rocket_priv->domain)) {
>                 ret =3D PTR_ERR(rocket_priv->domain);
> -               goto err_free;
> +               goto err_put_engine_usage;
>         }
>
>         file->driver_priv =3D rocket_priv;
> @@ -109,6 +139,8 @@ rocket_open(struct drm_device *dev, struct drm_file *=
file)
>         mutex_destroy(&rocket_priv->mm_lock);
>         drm_mm_takedown(&rocket_priv->mm);
>         rocket_iommu_domain_put(rocket_priv->domain);
> +err_put_engine_usage:
> +       rocket_engine_usage_put(rocket_priv->engine_usage);
>  err_free:
>         kfree(rocket_priv);
>  err_put_mod:
> @@ -125,6 +157,7 @@ rocket_postclose(struct drm_device *dev, struct drm_f=
ile *file)
>         mutex_destroy(&rocket_priv->mm_lock);
>         drm_mm_takedown(&rocket_priv->mm);
>         rocket_iommu_domain_put(rocket_priv->domain);
> +       rocket_engine_usage_put(rocket_priv->engine_usage);
>         kfree(rocket_priv);
>         module_put(THIS_MODULE);
>  }
> @@ -139,7 +172,29 @@ static const struct drm_ioctl_desc rocket_drm_driver=
_ioctls[] =3D {
>         ROCKET_IOCTL(FINI_BO, fini_bo),
>  };
>
> -DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
> +static void rocket_show_fdinfo(struct drm_printer *p, struct drm_file *f=
ile)
> +{
> +       struct rocket_device *rdev =3D to_rocket_device(file->minor->dev)=
;
> +       struct rocket_file_priv *rocket_priv =3D file->driver_priv;
> +       unsigned int core;
> +
> +       /*
> +        * These are estimates: the time is taken around the whole period=
 a job
> +        * occupies a core, so it also covers handling the completion int=
errupt
> +        * and, for a job made of several tasks, the gaps between them.
> +        */
> +       for (core =3D 0; core < rdev->max_cores; core++)
> +               drm_printf(p, "drm-engine-npu%u:\t%llu ns\n", core,
> +                          rocket_priv->engine_usage->elapsed_ns[core]);
> +
> +       drm_show_memory_stats(p, file);
> +}
> +
> +static const struct file_operations rocket_accel_driver_fops =3D {
> +       .owner =3D THIS_MODULE,
> +       DRM_ACCEL_FOPS,
> +       .show_fdinfo =3D drm_show_fdinfo,
> +};
>
>  /*
>   * Rocket driver version:
> @@ -150,6 +205,7 @@ static const struct drm_driver rocket_drm_driver =3D =
{
>         .open                   =3D rocket_open,
>         .postclose              =3D rocket_postclose,
>         .gem_create_object      =3D rocket_gem_create_object,
> +       .show_fdinfo            =3D rocket_show_fdinfo,
>         .ioctls                 =3D rocket_drm_driver_ioctls,
>         .num_ioctls             =3D ARRAY_SIZE(rocket_drm_driver_ioctls),
>         .fops                   =3D &rocket_accel_driver_fops,
> diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/roc=
ket_drv.h
> index 2c673bb99ccc..eff5c2ac54d1 100644
> --- a/drivers/accel/rocket/rocket_drv.h
> +++ b/drivers/accel/rocket/rocket_drv.h
> @@ -16,6 +16,15 @@ struct rocket_iommu_domain {
>         struct kref kref;
>  };
>
> +/*
> + * Time each core has spent running a client's jobs, in nanoseconds, ind=
exed by
> + * core. Jobs hold a reference, as they can outlive the file that submit=
ted them.
> + */
> +struct rocket_engine_usage {
> +       struct kref kref;
> +       u64 elapsed_ns[];
> +};
> +
>  struct rocket_file_priv {
>         struct rocket_device *rdev;
>
> @@ -24,9 +33,14 @@ struct rocket_file_priv {
>         struct mutex mm_lock;
>
>         struct drm_sched_entity sched_entity;
> +
> +       struct rocket_engine_usage *engine_usage;
>  };
>
>  struct rocket_iommu_domain *rocket_iommu_domain_get(struct rocket_file_p=
riv *rocket_priv);
>  void rocket_iommu_domain_put(struct rocket_iommu_domain *domain);
>
> +struct rocket_engine_usage *rocket_engine_usage_get(struct rocket_file_p=
riv *rocket_priv);
> +void rocket_engine_usage_put(struct rocket_engine_usage *usage);
> +
>  #endif
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index ce994748dd5d..c0ffbccfb6cc 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -13,6 +13,7 @@
>  #include <linux/iommu.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/sched/clock.h>
>
>  #include "rocket_core.h"
>  #include "rocket_device.h"
> @@ -265,6 +266,7 @@ static void rocket_job_cleanup(struct kref *ref)
>         unsigned int i;
>
>         rocket_iommu_domain_put(job->domain);
> +       rocket_engine_usage_put(job->engine_usage);
>
>         dma_fence_put(job->done_fence);
>         dma_fence_put(job->inference_done_fence);
> @@ -351,6 +353,7 @@ static struct dma_fence *rocket_job_run(struct drm_sc=
hed_job *sched_job)
>
>         scoped_guard(mutex, &core->job_lock) {
>                 core->in_flight_job =3D job;
> +               job->start_ns =3D local_clock();
>                 rocket_job_hw_submit(core, job);
>         }
>
> @@ -379,6 +382,9 @@ static void rocket_job_handle_irq(struct rocket_core =
*core)
>                                 return;
>                         }
>
> +                       core->in_flight_job->engine_usage->elapsed_ns[cor=
e->index] +=3D
> +                               local_clock() - core->in_flight_job->star=
t_ns;
> +
>                         iommu_detach_group(NULL, iommu_group_get(core->de=
v));
>                         dma_fence_signal(core->in_flight_job->done_fence)=
;
>                         pm_runtime_put_autosuspend(core->dev);
> @@ -587,6 +593,7 @@ static int rocket_ioctl_submit_job(struct drm_device =
*dev, struct drm_file *file
>
>         rjob->rdev =3D rdev;
>         rjob->domain =3D rocket_iommu_domain_get(file_priv);
> +       rjob->engine_usage =3D rocket_engine_usage_get(file_priv);
>
>         ret =3D drm_sched_job_init(&rjob->base,
>                                  &file_priv->sched_entity,
> diff --git a/drivers/accel/rocket/rocket_job.h b/drivers/accel/rocket/roc=
ket_job.h
> index 4ae00feec3b9..14aa78aebc99 100644
> --- a/drivers/accel/rocket/rocket_job.h
> +++ b/drivers/accel/rocket/rocket_job.h
> @@ -38,6 +38,10 @@ struct rocket_job {
>
>         struct rocket_iommu_domain *domain;
>
> +       /* When the job was handed to a core, and where to account the ti=
me */
> +       u64 start_ns;
> +       struct rocket_engine_usage *engine_usage;
> +
>         struct kref refcount;
>  };
>
>
> base-commit: a1e63ab695ad76850ab9787b9eb6aab695dc2965
> prerequisite-patch-id: 519bcdfdde80d902309c8346f749ebc4bb6b29c0
> --
> 2.53.0
>
