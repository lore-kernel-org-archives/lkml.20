Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91819267B89
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265907; cv=none; b=jS9/rgmFVPubkPHVF6anvntUZo+cjUTt3ycJ7kz6/Ul97JRuPKEBhaXMe41c/MlcElMbizvu1zCLiQb6pq9d9a4bab9mOQojVv7RlZxjfUCzvheSyvljqbf7vi2/9UGjDrJkYWqpqPYc0PHbKGj1rFJ0dmfyiFr9UKwBHZ+Ce1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265907; c=relaxed/simple;
	bh=/Wb6SqiUPoyaZWp0PGQZ8gTdNyjVlU7i/WGEMdK8aCo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m90pkUKnnIV6NbR+s9JwrBLK4cRVTB0PmDdwySwXbjFm3HOH3yGa/RfJZU6CxMjeV6NJsS4lLje5AAg/wjPidLYHlcAoPv/1EBpB7HsYstUTZHHgovrHtSHVvOxat9vyOP4KnK9hLuj6VbuOywiWIDe1q04CS0GViTmp1Gx5C8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z8ehe+g7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z8ehe+g7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788265904;
	bh=/Wb6SqiUPoyaZWp0PGQZ8gTdNyjVlU7i/WGEMdK8aCo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z8ehe+g7pNu/dCR8w/jiV30Us9iXbBUUTuhjM8LaHdHHrY0O6I5eN02G6vZ29jKPY
	 FlSP5c2pL7AUFiggWf8FLml5l5E+/eBTH0gsRjRMsJKhH6BAPnvRpST0eYbMRu3IWt
	 5Dzb63vuwacT+efnN7xQgdQIyLZUOfTRkCusxIucZgKDUIIfb0wDZzW573muzkwgjS
	 n2L9u2qdJ61msE4bA48mloT4zh7cphIBmZcdkRxjYaOV+Ap339sK2cCMeTkJEgitkc
	 4FQJe/2BtE8R0XtKCFdYlqHhYl9NHrvaeFtaYGD3JiFlt73MKyGb0Dk1enKFE3cilo
	 B8JPiFfO2sFCg==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1146517E063E;
	Tue, 01 Sep 2026 14:31:44 +0200 (CEST)
Date: Tue, 1 Sep 2026 14:31:37 +0200
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
Subject: Re: [PATCH v7 05/17] drm/panfrost: Skip NULL checks for clock
 enable/disabling
Message-ID: <20260901143137.054dfe79@fedora-21.home>
In-Reply-To: <20260828-claude-fixes-v7-5-72a13b2c125d@collabora.com>
References: <20260828-claude-fixes-v7-0-72a13b2c125d@collabora.com>
	<20260828-claude-fixes-v7-5-72a13b2c125d@collabora.com>
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

On Fri, 28 Aug 2026 21:56:45 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> The clk_* API can deal with NULL clock objects, so we can do away with NU=
LL
> checks in client code.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm=
/panfrost/panfrost_device.c
> index 6e3fcd53b690..a9d9669912e0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -540,11 +540,9 @@ static int panfrost_device_resume(struct device *dev)
>  		if (ret)
>  			goto err_clk;
> =20
> -		if (pfdev->bus_clock) {
> -			ret =3D clk_enable(pfdev->bus_clock);
> -			if (ret)
> -				goto err_bus_clk;
> -		}
> +		ret =3D clk_enable(pfdev->bus_clock);
> +		if (ret)
> +			goto err_bus_clk;
>  	}
> =20
>  	ret =3D pm_runtime_force_resume(dev);
> @@ -554,7 +552,7 @@ static int panfrost_device_resume(struct device *dev)
>  	return 0;
> =20
>  err_resume:
> -	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS) && pfdev->bus_clock)
> +	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
>  		clk_disable(pfdev->bus_clock);
>  err_bus_clk:
>  	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
> @@ -575,9 +573,7 @@ static int panfrost_device_suspend(struct device *dev)
>  		return ret;
> =20
>  	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
> -		if (pfdev->bus_clock)
> -			clk_disable(pfdev->bus_clock);
> -
> +		clk_disable(pfdev->bus_clock);
>  		clk_disable(pfdev->clock);
>  	}
> =20
>=20

