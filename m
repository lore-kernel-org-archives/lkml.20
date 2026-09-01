Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558AA2E975E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269861; cv=none; b=Eg8X9SLTeYC/H9zIvb539pfqWknDtlXcaa8lzpp9kKd1XoxcaQ1RoZYi1/o2Qb3w5JEBqwoF5gMJT+UKePtI1w/Bha46WPftSfNgZ+02aVzWxo29OgHUhz8hRPUUcx+j66+lXGyXgZFiAjwYZc/RrdS/7HPyjF5vj7ohDlEPdKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269861; c=relaxed/simple;
	bh=zDlfCbDH5Ho3SI3QsSZnX/Jgy1GCPpw11VZy6Ij11kU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JFbKv3L4KxgabIEzCGD5WbSgxhVM0d9yxPBtjkLk+rcF5Y6fm0IgKJ0MI/FJIbYpsMF1Hw3afZaiCQ187sNnqpSbxTQHd4IFJYvZSY/Pe6MzNUxw0uSkMTHXODq4elUBGpj7og/9tPiVPmqROx5JNkNBllt+N2ejKOtdLLzmFUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XddVYdRY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XddVYdRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788269858;
	bh=zDlfCbDH5Ho3SI3QsSZnX/Jgy1GCPpw11VZy6Ij11kU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XddVYdRYJFykaXV1kzy0zskkljn/S2TIWbGpeDB9MDz9vQI51T7aVCbMRVOBxwwSL
	 VGVDE1qg/fM5Q6lhvbzPJJicorRPSo6VT6Dzj+snvZ0w5K7fKeWFieTx7kWkm8P6xS
	 NYH5EY0X5Iuon++Kdz1YwfQ4yaLWo/T9xB0q/m/5ExVvjwTfRklCf9TXmcOEhWRtuo
	 A6ZyRJ0OkRFrboem8IUzWQjvBeTE8TewmVLRdcju37OKDp/O5Fp2NhIVxmYDZNdvLE
	 MnsAf6JrHZdBBLtU0RcSQAtWAhiGi+SJUH1DWGBKggrMRICybaWcElo/ZZfkmoPCPZ
	 v1o+2eoZsphnw==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BBA1917E006A;
	Tue, 01 Sep 2026 15:37:37 +0200 (CEST)
Date: Tue, 1 Sep 2026 15:37:32 +0200
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
Subject: Re: [PATCH v7 14/17] drm/panfrost: Avoid cache flush after perfcnt
 sample in fully coherent systems
Message-ID: <20260901153732.7c4def61@fedora-21.home>
In-Reply-To: <20260828-claude-fixes-v7-14-72a13b2c125d@collabora.com>
References: <20260828-claude-fixes-v7-0-72a13b2c125d@collabora.com>
	<20260828-claude-fixes-v7-14-72a13b2c125d@collabora.com>
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

On Fri, 28 Aug 2026 21:56:54 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> If the GPU and CPU are fully coherent, then there's no need to flush the
> GPU caches after a perfcnt sample is made available.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/dr=
m/panfrost/panfrost_perfcnt.c
> index ffc77121070e..b3f71d7fd82a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -52,7 +52,10 @@ void panfrost_perfcnt_clean_cache_done(struct panfrost=
_device *pfdev)
> =20
>  void panfrost_perfcnt_sample_done(struct panfrost_device *pfdev)
>  {
> -	gpu_write(pfdev, GPU_CMD, GPU_CMD_CLEAN_CACHES);
> +	if (pfdev->features.selected_coherency !=3D COHERENCY_ACE)

I think ACE_LITE would allow us to skip the flush to, so

	if (pfdev->features.selected_coherency =3D=3D COHERENCY_NONE)

> +		gpu_write(pfdev, GPU_CMD, GPU_CMD_CLEAN_CACHES);
> +	else
> +		complete(&pfdev->perfcnt->dump_comp);
>  }
> =20
>  static int panfrost_perfcnt_dump_locked(struct panfrost_device *pfdev)
>=20

