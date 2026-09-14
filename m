Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7A3426D0A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377769; cv=none; b=rB7zyOAJilkMfj42UDdImBQLn5R30u5uI158mAAmxQSn8nGxyZc5YZ6rLP2M6zquI6sBQNsT9pRa0NzZN6nuWs4ua8XxweYGUjjyGQNi7imLww/FuZjmhsNIXnasvYKDMB40kWica/pM4tKhQNSgq70P223B0MOq5eVZvx37cCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377769; c=relaxed/simple;
	bh=73QlnaQCsgvzVtuZ6QGUlkNWbrbjwtABy1D5uYWfio0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RTT8YAVnpnYe8j0ouhm3Gzc+lBTX4Gwwc0tHEW6iXeF7E+YXlQ9LF3nbN+1jUSzPYOoQ7NoeLUIJb0/W1m12YMFZ601zY46g+6woCNm5fP8iZljgKCEFKrRJWOBXhuncoveneNRGJVq/sD7QLi//CysEbtzJhDeLGVW6FZTFlA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ff098847; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ff098847"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789377765;
	bh=73QlnaQCsgvzVtuZ6QGUlkNWbrbjwtABy1D5uYWfio0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ff098847j/8HbpgD0osP+HPAStE6yHiEhULC7sg5g3vg5GfaHoDsAwWNwjF1e2s5j
	 pdv+LDFs/wkcEtV+8n0EdYdFUWC3QxTVm9OErLgm8HRHxyD1mHpzY0Qd6LqtZxkXR+
	 f3SP8Dq9rlWufRWBEyRuWV/AMvVsA6uS5OJNZaZtGo7OxUXYCIfaVRJYD0Gg4x730t
	 e9Jp/A3JXk7wKXxBMQkloQnNpmYfIDhTQzfT01f29ycg9hpDOTz1FrC/1wPpxTgFU6
	 1pCxDe+a/AmVK1L41Rg6ELqYpMFDWmBApSPg8uuIPLthuFBn+UmA45UWICeOnI6Eb7
	 q5t/IJodMfn+g==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8248817E020C;
	Mon, 14 Sep 2026 11:22:44 +0200 (CEST)
Date: Mon, 14 Sep 2026 11:22:37 +0200
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
Subject: Re: [PATCH v9 06/16] drm/panfrost: Fix PM refcnt and autosuspend
 issues at device probe/remove
Message-ID: <20260914112237.70dedb9c@fedora-21.home>
In-Reply-To: <20260912-claude-fixes-v9-6-e588feaa61ef@collabora.com>
References: <20260912-claude-fixes-v9-0-e588feaa61ef@collabora.com>
	<20260912-claude-fixes-v9-6-e588feaa61ef@collabora.com>
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

On Sat, 12 Sep 2026 00:28:07 +0100
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
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 55fc22e8d4d4..a3eff77add55 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -854,6 +854,7 @@ static int panfrost_probe(struct platform_device *pde=
v)
> =20
>  	pm_runtime_set_active(pfdev->base.dev);
>  	pm_runtime_mark_last_busy(pfdev->base.dev);
> +	pm_runtime_get_noresume(pfdev->base.dev);
>  	pm_runtime_enable(pfdev->base.dev);
>  	pm_runtime_set_autosuspend_delay(pfdev->base.dev, 50); /* ~3 frames */
>  	pm_runtime_use_autosuspend(pfdev->base.dev);
> @@ -866,13 +867,16 @@ static int panfrost_probe(struct platform_device *p=
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

Not an issue per-se, because put_noidle() is a NOP, but I think it'd be
easier to reason about with this order:

	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
  	pm_runtime_disable(pfdev->base.dev);
	panfrost_device_fini(pfdev);
  	pm_runtime_set_suspended(pfdev->base.dev);
	pm_runtime_put_noidle(pfdev->base.dev);

This makes it clear that panfrost_device_fini() assumes the device is
resumed when it's called and suspended when it returns.

>  err_out0:
>  	return err;
>  }
> @@ -884,9 +888,11 @@ static void panfrost_remove(struct platform_device *=
pdev)
>  	drm_dev_unregister(&pfdev->base);
> =20
>  	pm_runtime_get_sync(pfdev->base.dev);
> +	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
> +	pm_runtime_put_noidle(pfdev->base.dev);
>  	pm_runtime_disable(pfdev->base.dev);

Let's keep the order consistent with the probe path:

	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
	pm_runtime_disable(pfdev->base.dev);
	panfrost_device_fini(pfdev);
	pm_runtime_set_suspended(pfdev->base.dev);
	pm_runtime_put_noidle(pfdev->base.dev);

I also think this deserves comments to explain the noresume/noidle
dance (device_init/fini take care of clks internally, and when they
return the device is resumed/suspended, so all we have to is update the
state, and acquire a ref).

> -	panfrost_device_fini(pfdev);
>  	pm_runtime_set_suspended(pfdev->base.dev);
> +	panfrost_device_fini(pfdev);
>  }
> =20
>  static ssize_t profiling_show(struct device *dev,
>=20

