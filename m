Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDCC41D64E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378310; cv=none; b=EahgbKOxE+eq9TUk6kTgKNJviqnEYqc1ZI3ndriqnN41bNdWuhmUJz3a3Mlqtq/Wwi8YsNPalXnwpZSKxROrn0lAzVj84QSRf0h0K0XFZVKiwAyIuGlnhcEnMAGof7VOV+iNgIiEW8IwvY1VzywqbQTwM90ne8HVC/qcI/Sv9Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378310; c=relaxed/simple;
	bh=A7mGEjdcqD3q0xpznb4BgSxNI2gUkNOYuI6Snejdmkc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GJOAyxpnAdCzrh5q68zc8zj8zqgmJVXPHsoY5lUhj+fcoHz7X4HA6bGmg0yxYQ5u94os9E/jlTHGPctNHHLOq+yctRm2B5JlDGONkepIPKOhvXaK/lwxNGXy6zmkcGP4dAcvysZy8T3ksT7k0IDI/AOMf1vq9Ectezg6GY2SgFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=V76AKnlb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V76AKnlb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789378306;
	bh=A7mGEjdcqD3q0xpznb4BgSxNI2gUkNOYuI6Snejdmkc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V76AKnlbuMCH78H1nS0hmndClVrHigfd8rkIKh3v8Lh0Tk3SQDXZYKD7BxojL1G9p
	 w2JChLY/XYm8SHV2X/TRDx75zNdLUJIvEsPhw8uM/Xkia3iitipPmCsSBnD0ApqRMX
	 fK5q3foeUuL09YRPZlN864v9UB+jxdGqqw3jRC7dngChU3b6sRGt2bOoKjxzKy4spT
	 KFKaynu9abo0280Ut9GAZc9sV3X9uIwiJ9Lt9UhBDsKW2ZeP8nsw/w1QCm3vhdasJT
	 gdKAYk5ldpzrJhAdzAuHHj4X2VYrIf/46CDLZdzCTanTzQzPfa8Rea9uoHNUuc2lAZ
	 3NfJfGcKwqVHQ==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C685F17E05D3;
	Mon, 14 Sep 2026 11:31:45 +0200 (CEST)
Date: Mon, 14 Sep 2026 11:31:41 +0200
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
Subject: Re: [PATCH v9 08/16] drm/panfrost: Move all DRM device
 initialisation into device_init()
Message-ID: <20260914113141.34527b1e@fedora-21.home>
In-Reply-To: <20260912-claude-fixes-v9-8-e588feaa61ef@collabora.com>
References: <20260912-claude-fixes-v9-0-e588feaa61ef@collabora.com>
	<20260912-claude-fixes-v9-8-e588feaa61ef@collabora.com>
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

On Sat, 12 Sep 2026 00:28:09 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Ideally the probe() function will do as little as possible, and all device
> initialisation and registration should happen inside the panfrost device
> subsystem, just like it's done in Panthor. This also simplifies resource
> unwinding in the error path.
>=20
> Do the same thing for DRM driver remove, as in, sweep most of the action
> into panfrost_device_fini(), just like we did for device probe.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 37 +++++++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_drv.c    | 47 +-----------------------=
------
>  2 files changed, 38 insertions(+), 46 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm=
/panfrost/panfrost_device.c
> index 2fcbd223204c..ec2b1d29a26c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -8,6 +8,7 @@
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> +#include <drm/drm_drv.h>
> =20
>  #include "panfrost_device.h"
>  #include "panfrost_devfreq.h"
> @@ -230,6 +231,12 @@ int panfrost_device_init(struct panfrost_device *pfd=
ev)
>  {
>  	int err;
> =20
> +	pfdev->comp =3D of_device_get_match_data(pfdev->base.dev);
> +	if (!pfdev->comp)
> +		return -ENODEV;
> +
> +	pfdev->coherent =3D device_get_dma_attr(pfdev->base.dev) =3D=3D DEV_DMA=
_COHERENT;
> +
>  #ifdef CONFIG_DEBUG_FS
>  	mutex_init(&pfdev->debugfs.gems_lock);
>  	INIT_LIST_HEAD(&pfdev->debugfs.gems_list);
> @@ -291,8 +298,31 @@ int panfrost_device_init(struct panfrost_device *pfd=
ev)
>  	if (err)
>  		goto out_perfcnt;
> =20
> +	pm_runtime_set_active(pfdev->base.dev);
> +	pm_runtime_mark_last_busy(pfdev->base.dev);
> +	pm_runtime_get_noresume(pfdev->base.dev);
> +	pm_runtime_enable(pfdev->base.dev);
> +	pm_runtime_set_autosuspend_delay(pfdev->base.dev, 50); /* ~3 frames */
> +	pm_runtime_use_autosuspend(pfdev->base.dev);
> +
> +	/*
> +	 * Register the DRM device with the core and the connectors with
> +	 * sysfs
> +	 */
> +	err =3D drm_dev_register(&pfdev->base, 0);
> +	if (err < 0)
> +		goto err_disable_rpm;
> +
> +	pm_runtime_put_autosuspend(pfdev->base.dev);
> +
>  	return 0;
> =20
> +err_disable_rpm:
> +	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
> +	pm_runtime_disable(pfdev->base.dev);
> +	pm_runtime_put_noidle(pfdev->base.dev);
> +	pm_runtime_set_suspended(pfdev->base.dev);
> +	panfrost_gem_fini(pfdev);
>  out_perfcnt:
>  	panfrost_perfcnt_fini(pfdev);
>  out_job:
> @@ -316,6 +346,13 @@ int panfrost_device_init(struct panfrost_device *pfd=
ev)
> =20
>  void panfrost_device_fini(struct panfrost_device *pfdev)
>  {
> +	pm_runtime_get_sync(pfdev->base.dev);
> +
> +	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
> +	pm_runtime_disable(pfdev->base.dev);
> +	pm_runtime_put_noidle(pfdev->base.dev);
> +	pm_runtime_set_suspended(pfdev->base.dev);
> +
>  	panfrost_gem_fini(pfdev);
>  	panfrost_perfcnt_fini(pfdev);
>  	panfrost_jm_fini(pfdev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index a3eff77add55..f77780c72a1a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -830,7 +830,6 @@ static const struct drm_driver panfrost_drm_driver =
=3D {
>  static int panfrost_probe(struct platform_device *pdev)
>  {
>  	struct panfrost_device *pfdev;
> -	int err;
> =20
>  	pfdev =3D devm_drm_dev_alloc(&pdev->dev, &panfrost_drm_driver,
>  				   struct panfrost_device, base);
> @@ -839,46 +838,7 @@ static int panfrost_probe(struct platform_device *pd=
ev)
> =20
>  	platform_set_drvdata(pdev, pfdev);
> =20
> -	pfdev->comp =3D of_device_get_match_data(&pdev->dev);
> -	if (!pfdev->comp)
> -		return -ENODEV;
> -
> -	pfdev->coherent =3D device_get_dma_attr(&pdev->dev) =3D=3D DEV_DMA_COHE=
RENT;
> -
> -	err =3D panfrost_device_init(pfdev);
> -	if (err) {
> -		if (err !=3D -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Fatal error during GPU init\n");
> -		goto err_out0;
> -	}
> -
> -	pm_runtime_set_active(pfdev->base.dev);
> -	pm_runtime_mark_last_busy(pfdev->base.dev);
> -	pm_runtime_get_noresume(pfdev->base.dev);
> -	pm_runtime_enable(pfdev->base.dev);
> -	pm_runtime_set_autosuspend_delay(pfdev->base.dev, 50); /* ~3 frames */
> -	pm_runtime_use_autosuspend(pfdev->base.dev);
> -
> -	/*
> -	 * Register the DRM device with the core and the connectors with
> -	 * sysfs
> -	 */
> -	err =3D drm_dev_register(&pfdev->base, 0);
> -	if (err < 0)
> -		goto err_out1;
> -
> -	pm_runtime_put_autosuspend(pfdev->base.dev);
> -
> -	return 0;
> -
> -err_out1:
> -	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
> -	pm_runtime_disable(pfdev->base.dev);
> -	pm_runtime_put_noidle(pfdev->base.dev);
> -	pm_runtime_set_suspended(pfdev->base.dev);
> -	panfrost_device_fini(pfdev);
> -err_out0:
> -	return err;
> +	return panfrost_device_init(pfdev);
>  }
> =20
>  static void panfrost_remove(struct platform_device *pdev)
> @@ -887,11 +847,6 @@ static void panfrost_remove(struct platform_device *=
pdev)
> =20
>  	drm_dev_unregister(&pfdev->base);
> =20
> -	pm_runtime_get_sync(pfdev->base.dev);
> -	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
> -	pm_runtime_put_noidle(pfdev->base.dev);
> -	pm_runtime_disable(pfdev->base.dev);
> -	pm_runtime_set_suspended(pfdev->base.dev);
>  	panfrost_device_fini(pfdev);
>  }
> =20
>=20

