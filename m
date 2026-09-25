Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5293502A7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322382; cv=none; b=cFIX+bKq/nazF4sVjfXpReC8OfcblFoBZuS3eD37nMpSY3f1HlFp/qPiEqAppbVI5VaJiMcr9cY3bTCM4LJlrdYJTh0Nu9K/C1fEJFv/fumfLGxDsHyHXuQdiyY3dUob6mPT61E9A/JZn3E22WLW9Rut0AgOZXJLbORmmhnA8P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322382; c=relaxed/simple;
	bh=zCTuDqlNX3/6/wVssV35Ayu2kyDqNktIb5z2fDgv8vY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zb3G8YsRyDnUqwwl2u46T0OuUgHRwpTYE3Qz6lJlJUnCRMBVHWl9SgrK9mrD+9c8Ejzlrv67WenJ9dKwPJBCd6G2UjVWLVuG/7MCytP/BtOlwhJznnTrhp2sfoEuSFoxJLo9kX5SWNK+fabcKDazbvdv7Qqc2q1Gvy4DqKyqFg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Zczmql+L; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Zczmql+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790322373;
	bh=zCTuDqlNX3/6/wVssV35Ayu2kyDqNktIb5z2fDgv8vY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zczmql+LBk8L5sTxZ+0n4Mko5ek9KJIptOVerW6Dp2cZNp4mLAiGUazkxAE+E6vhy
	 s0c9GkMpXPXmzYv2YNlG5F4/1IOyljDrz0xJDJcsQYo+XVpSav5Lh/bVZYyWSrWlRX
	 lo8T18WU0Nrg2DIe1hcohncmzDwm7tZTilVqIRn0BcUYDOebhrVjghgm1Vt5rdEg00
	 LdofasBVP6zw1vPnpRamByMoJwCNL8AY5IsC66YBDHDhSxDlbQ9dziOL26LL0wmnsg
	 +dfeFjYoSV23TKvPV5gc3VXuHAZr9fCPK+tooJXNijOKshGEGXz8F2P5YreMP4EVll
	 9mARIY8uNouzg==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 679F317E006F;
	Fri, 25 Sep 2026 09:46:12 +0200 (CEST)
Date: Fri, 25 Sep 2026 09:46:06 +0200
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
Subject: Re: [PATCH v10 06/15] drm/panfrost: Fix PM refcnt and autosuspend
 issues at device probe/remove
Message-ID: <20260925094606.4bb127dc@fedora-32.home>
In-Reply-To: <20260924-claude-fixes-v10-6-755929b3cc19@collabora.com>
References: <20260924-claude-fixes-v10-0-755929b3cc19@collabora.com>
	<20260924-claude-fixes-v10-6-755929b3cc19@collabora.com>
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

On Thu, 24 Sep 2026 19:09:23 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> During device probe(), failure to do a PM get() will leave the usage_count
> set to 0, which is the value assigned at device creation time. That means
> when the autosuspend delay expires, runtime suspend callback won't be
> invoked, so the device will remain powered on forever.
>=20
> On top of that, failure to call PM put() during device unplug means
> Panfrost device's PM usage_count increases monotonically for every new
> module reload.
>=20
> The outcome of both of the above meant that:
>=20
> - Devfreq OPP transition notifications would be printed all the time,
>   even when no jobs are being submitted. This quickly fills the kernel
>   ring buffer with junk.
> - Because MMU interrupts are only enabled when the device is reset,
>   the very first job targeting the tiler heap BO after device probe()
>   would always time out, since the driver's PM runtime resume callback
>   would not be invoked.
>=20
> To fix the above:
> - Manually adjust the PM refcnt at device probe and removal time.
> - Ensure pm_runtime_dont_use_autosuspend is called in the wind-down path.
> - Call pm_runtime_put_autosuspend() when device is ready to accept jobs
> - Move pm_runtime_set_suspended() before panfrost_device_fini() so that
>   resource unwinding happens in the opposite order as initialisation.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Fixes: 635430797d3f ("drm/panfrost: Rework runtime PM initialization")
> Fixes: 876b15d2c88d ("drm/panfrost: Fix module unload")
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 55fc22e8d4d4..02ddd391231c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -852,8 +852,13 @@ static int panfrost_probe(struct platform_device *pd=
ev)
>  		goto err_out0;
>  	}
> =20
> +	/* The reason we must manually set the PM status and usage counter is
> +	 * we have just powered the device up but did not go through the PM
> +	 * runtime resume callback, so we need to update these ourselves.
> +	 */
>  	pm_runtime_set_active(pfdev->base.dev);
>  	pm_runtime_mark_last_busy(pfdev->base.dev);
> +	pm_runtime_get_noresume(pfdev->base.dev);
>  	pm_runtime_enable(pfdev->base.dev);
>  	pm_runtime_set_autosuspend_delay(pfdev->base.dev, 50); /* ~3 frames */
>  	pm_runtime_use_autosuspend(pfdev->base.dev);
> @@ -866,13 +871,16 @@ static int panfrost_probe(struct platform_device *p=
dev)
>  	if (err < 0)
>  		goto err_out1;
> =20
> +	pm_runtime_put_autosuspend(pfdev->base.dev);
> =20
>  	return 0;
> =20
>  err_out1:
> +	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
>  	pm_runtime_disable(pfdev->base.dev);
> -	panfrost_device_fini(pfdev);
> +	pm_runtime_put_noidle(pfdev->base.dev);
>  	pm_runtime_set_suspended(pfdev->base.dev);
> +	panfrost_device_fini(pfdev);
>  err_out0:
>  	return err;
>  }
> @@ -884,9 +892,11 @@ static void panfrost_remove(struct platform_device *=
pdev)
>  	drm_dev_unregister(&pfdev->base);
> =20
>  	pm_runtime_get_sync(pfdev->base.dev);
> +	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
> +	pm_runtime_put_noidle(pfdev->base.dev);
>  	pm_runtime_disable(pfdev->base.dev);

You really want put_noidle() after pm_runtime_disable(), otherwise if
the ref you put is not the last one, and another entity puts its ref
without no_idle() before you call pm_runtime_disable(), it will
schedule and potentially execute the suspend hook, which might mess up
with the state the _fini() helpers expect the device to be in.

> -	panfrost_device_fini(pfdev);
>  	pm_runtime_set_suspended(pfdev->base.dev);
> +	panfrost_device_fini(pfdev);

With:

	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
	pm_runtime_disable(pfdev->base.dev);
	pm_runtime_put_noidle(pfdev->base.dev);
	pm_runtime_set_suspended(pfdev->base.dev);
	panfrost_device_fini(pfdev);

This patch is

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>  }
> =20
>  static ssize_t profiling_show(struct device *dev,
>=20

