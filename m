Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E423A6EF1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264643; cv=none; b=PrhSt0P3w3w9CfG46grHa+oj3+dwyAXQlsWHc4Y918BePcn1hV2qgsLxFR5b4i1hMd2h2a6PdKsr2P0NTUiPb/zXibal2cqYpG0BxXjZYiRdT27T51kLsdqm2fbFdAmdDMWoBGw78vDpZ7gkUClqMGrwjgxFay929dcFFS11hSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264643; c=relaxed/simple;
	bh=taMfC/9JYWrQ3KY+WcFyZyTpGxZrggOfQV71kp6IMqA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T+EznHKMqSHFHGwCCixeCdJLYM3Js61yR0mIHEdBq0mAFGyTHpDbOW7dsYV3MRIoWc+/V+KYX3mN9wZQxpWvLQAnf3PFrsbgRhxK9jqS/ImlQ3cEZVvOSDaGm61jG0Gjtvj4oNKIPynl6xEdOMXtyHLnOow24oTeQS8r61fKb9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=d93X6zqT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d93X6zqT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788264639;
	bh=taMfC/9JYWrQ3KY+WcFyZyTpGxZrggOfQV71kp6IMqA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d93X6zqT1Le2ZWfD65NkY89al4GXaS3q/nttcYMfSPOpT14ILPVh/8co/5zAnSj9t
	 depeBihHbhR0MNv5N2CY2paH/UpgZWM4ajenFbAiU5YOchVuzp1zn49PRnIRHID4m2
	 CCZU60M9NtVVGB5BNqUg5Bc7MNVrLiRhFKH0uTh74oxsIeeUdnlQmxoYsU/TK+7ggx
	 d3qkJ7jBtUIEZmcxc527EMOwIe+r1ve4ZOq1ZlvHfB70bosQHsWxFDi1el99FQze/z
	 rfhEa2DbIBk7n425FmgRl7SOLxis16Yfvf3tdkDzSGrbSbyftqfcz3Ffcg6zUrkEj5
	 OHC+VL+bn0Eiw==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2CB0017E0180;
	Tue, 01 Sep 2026 14:10:39 +0200 (CEST)
Date: Tue, 1 Sep 2026 14:10:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, "Marty E. Plummer"
 <hanetzer@startmail.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt
 <eric@anholt.net>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Collabora Kernel Team <kernel@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 03/17] drm/panfrost: Move lock and modparam
 initialisations into their subsystems
Message-ID: <20260901141035.69b3ec92@fedora-21.home>
In-Reply-To: <20260828-claude-fixes-v7-3-72a13b2c125d@collabora.com>
References: <20260828-claude-fixes-v7-0-72a13b2c125d@collabora.com>
	<20260828-claude-fixes-v7-3-72a13b2c125d@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Aug 2026 21:56:43 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> The device init function feels a bit cluttered with things that should be
> done in the specific subsystems where those locks and lists are being
> used. Same goes for module parameters, it's best to limit them to the
> subsystems where they're relevant.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

It would also be good to have opaque structs for sub-components instead
stuffing everything in panthor_device, but that can wait.

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c       | 10 ----------
>  drivers/gpu/drm/panfrost/panfrost_drv.c          |  7 -------
>  drivers/gpu/drm/panfrost/panfrost_drv.h          | 13 -------------
>  drivers/gpu/drm/panfrost/panfrost_gem.c          |  9 ++++++++-
>  drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c |  3 +++
>  drivers/gpu/drm/panfrost/panfrost_gpu.c          |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_job.c          |  1 +
>  drivers/gpu/drm/panfrost/panfrost_mmu.c          |  3 +++
>  8 files changed, 17 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm=
/panfrost/panfrost_device.c
> index d2d2830f11a7..7daa2143f3c4 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -223,16 +223,6 @@ int panfrost_device_init(struct panfrost_device *pfd=
ev)
> =20
>  	pfdev->coherent =3D device_get_dma_attr(pfdev->base.dev) =3D=3D DEV_DMA=
_COHERENT;
> =20
> -	mutex_init(&pfdev->shrinker_lock);
> -	INIT_LIST_HEAD(&pfdev->shrinker_list);
> -
> -	mutex_init(&pfdev->sched_lock);
> -	INIT_LIST_HEAD(&pfdev->as_lru_list);
> -
> -	spin_lock_init(&pfdev->as_lock);
> -
> -	spin_lock_init(&pfdev->cycle_counter.lock);
> -
>  #ifdef CONFIG_DEBUG_FS
>  	mutex_init(&pfdev->debugfs.gems_lock);
>  	INIT_LIST_HEAD(&pfdev->debugfs.gems_list);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 80996e311a9d..ec8c1c08e147 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -21,7 +21,6 @@
>  #include <drm/drm_utils.h>
> =20
>  #include "panfrost_device.h"
> -#include "panfrost_drv.h"
>  #include "panfrost_gem.h"
>  #include "panfrost_mmu.h"
>  #include "panfrost_job.h"
> @@ -955,12 +954,6 @@ static const struct drm_driver panfrost_drm_driver =
=3D {
>  #endif
>  };
> =20
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -bool panfrost_transparent_hugepage =3D true;
> -module_param_named(transparent_hugepage, panfrost_transparent_hugepage, =
bool, 0400);
> -MODULE_PARM_DESC(transparent_hugepage, "Use a dedicated tmpfs mount poin=
t with Transparent Hugepage enabled (true =3D default)");
> -#endif
> -
>  static int panfrost_probe(struct platform_device *pdev)
>  {
>  	struct panfrost_device *pfdev;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.h b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.h
> deleted file mode 100644
> index bac0c415d4da..000000000000
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.h
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 or MIT */
> -/* Copyright 2025 Amazon.com, Inc. or its affiliates */
> -
> -#ifndef __PANFROST_DRV_H__
> -#define __PANFROST_DRV_H__
> -
> -#if IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)
> -extern bool panfrost_transparent_hugepage;
> -#else
> -#define panfrost_transparent_hugepage false
> -#endif
> -
> -#endif
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index 7b993a089af2..15105b7f954b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -11,10 +11,17 @@
>  #include <drm/panfrost_drm.h>
>  #include <drm/drm_print.h>
>  #include "panfrost_device.h"
> -#include "panfrost_drv.h"
>  #include "panfrost_gem.h"
>  #include "panfrost_mmu.h"
> =20
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +bool panfrost_transparent_hugepage =3D true;
> +module_param_named(transparent_hugepage, panfrost_transparent_hugepage, =
bool, 0400);
> +MODULE_PARM_DESC(transparent_hugepage, "Use a dedicated tmpfs mount poin=
t with Transparent Hugepage enabled (true =3D default)");
> +#else
> +#define panfrost_transparent_hugepage false
> +#endif
> +
>  int panfrost_gem_init(struct panfrost_device *pfdev)
>  {
>  	int err;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/g=
pu/drm/panfrost/panfrost_gem_shrinker.c
> index fefae87535d6..72cd7a165e6d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> @@ -97,6 +97,9 @@ panfrost_gem_shrinker_scan(struct shrinker *shrinker, s=
truct shrink_control *sc)
>   */
>  int panfrost_gem_shrinker_init(struct panfrost_device *pfdev)
>  {
> +	mutex_init(&pfdev->shrinker_lock);
> +	INIT_LIST_HEAD(&pfdev->shrinker_list);
> +
>  	pfdev->shrinker =3D shrinker_alloc(0, "drm-panfrost");
>  	if (!pfdev->shrinker)
>  		return -ENOMEM;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gpu.c
> index 7d555e63e21a..8a15ccce08e9 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -516,6 +516,8 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
>  {
>  	int err;
> =20
> +	spin_lock_init(&pfdev->cycle_counter.lock);
> +
>  	err =3D panfrost_gpu_soft_reset(pfdev);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index 2d12b83e900a..6f920fd0fc4e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -873,6 +873,7 @@ int panfrost_jm_init(struct panfrost_device *pfdev)
> =20
>  	INIT_WORK(&pfdev->reset.work, panfrost_reset_work);
>  	spin_lock_init(&js->job_lock);
> +	mutex_init(&pfdev->sched_lock);
> =20
>  	js->irq =3D platform_get_irq_byname(to_platform_device(pfdev->base.dev)=
, "job");
>  	if (js->irq < 0)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_mmu.c
> index 4a3162c3b659..5c393ed6e310 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -955,6 +955,9 @@ int panfrost_mmu_init(struct panfrost_device *pfdev)
>  {
>  	int err;
> =20
> +	INIT_LIST_HEAD(&pfdev->as_lru_list);
> +	spin_lock_init(&pfdev->as_lock);
> +
>  	pfdev->mmu_irq =3D platform_get_irq_byname(to_platform_device(pfdev->ba=
se.dev), "mmu");
>  	if (pfdev->mmu_irq < 0)
>  		return pfdev->mmu_irq;
>=20

