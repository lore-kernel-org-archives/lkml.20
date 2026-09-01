Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA42D7398
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269562; cv=none; b=fLorsTyoVhgaDBTsHK01PwRbqb7gPw5zvokD/1nS/v4xRcwY+/eSOiCJmmCyaeXdtRu2b7x6s0cwYbyNyTSzxWqz9oq/cGR4PJZkEumVOb4efnsoaPu5A/EZznsZH0aOyPrgc671S0pVpjYgaBy7+Kz7jsXKR2WuEqEUDxbtXSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269562; c=relaxed/simple;
	bh=+UsGWBfUQqD+kTny8fiO/EQrBge1ZduXjNsXoQ4oelU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=twXhRTaCNCUlr1xwppeSqEKtkVnT2BVTjiW+PTse1XIs3YGBBRsKFM7nUEIxnK/mKtxzwJ4CeyGrSlUzZfnYNeJIQYE3qvUl8XeaKU7D+7yYNBvhXjOmLI55b4560POynUsFASzqx7M/mKd9QLcyZyVwGOF4BwFMNzHWZY/y6Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fgy3i5Hv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fgy3i5Hv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788269558;
	bh=+UsGWBfUQqD+kTny8fiO/EQrBge1ZduXjNsXoQ4oelU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fgy3i5HvfVXf2knWBXOAKqp0mJC5mRmcEBwpd9A7aTXeRpprLbTGR3cnrZrAlouS7
	 wky/I0YR6uxviKiYb1NShk2K2WJs/cRRqVUVfvCWYB18NaoBLWR0EYLuOzHOJjc/ob
	 rP2auC4Qrjsz+1N0B9Yg/BmLvnLkuWbCWJcAxax1RfB2WDzv7ZssicSoF+sgo0P216
	 mDFrnAVmePRjD4CqyBC50WrXQi5QKL2sa+tZXD98wnPcvnPO5V+5CxG4do0J/Sv9G9
	 HJIpTrxUEiO33J8F0HtSEtAPnEB9aRKi/JwcSh0KndSpOk1nD+GBMBVS7iLt/+XvSR
	 jjUUo4Uk0AMgw==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0491C17E0260;
	Tue, 01 Sep 2026 15:32:37 +0200 (CEST)
Date: Tue, 1 Sep 2026 15:32:33 +0200
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
Subject: Re: [PATCH v7 13/17] drm/panfrost: Skip cache flush/invalidate when
 enabling perfcnt
Message-ID: <20260901153233.261fb14d@fedora-21.home>
In-Reply-To: <20260828-claude-fixes-v7-13-72a13b2c125d@collabora.com>
References: <20260828-claude-fixes-v7-0-72a13b2c125d@collabora.com>
	<20260828-claude-fixes-v7-13-72a13b2c125d@collabora.com>
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

On Fri, 28 Aug 2026 21:56:53 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> The GPU cache flush/invalidate operation is unnecessary, because at prese=
nt
> all counters are always enabled for all sessions, and there are no plans =
to
> expand the uAPI so as to let UM select specific counter groups.
>=20
> If the above was ever implemented, then different counter groups being
> selected between sessions might leave stale data in the GPU caches, so
> the flush/invalidate would have to be reintroduced.

This explanation confuses me. To me, the reason we don't need a
cache-flush has nothing to do with the fact we always enable all
counters, it's just that, either the perfcnt buffer has been freshly
allocated/mapped and the cache has no entry pointing to it, or it's
been written already, and the flush should have happened after the
dump. For the case where the enable happens after a RESET (which you
introduce in one of the remaining commits, I guess), there's no flush
needed either, because the RESET clears all the caches.

>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/dr=
m/panfrost/panfrost_perfcnt.c
> index f71534e741b6..ffc77121070e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -124,21 +124,10 @@ static int panfrost_perfcnt_enable_locked(struct pa=
nfrost_device *pfdev,
>  	panfrost_gem_internal_set_label(&bo->base, "Perfcnt sample buffer");
> =20
>  	/*
> -	 * Invalidate the cache and clear the counters to start from a fresh
> -	 * state.
> +	 * Clear the counters to start from a fresh state.
>  	 */
> -	reinit_completion(&pfdev->perfcnt->dump_comp);
> -	gpu_write(pfdev, GPU_INT_CLEAR,
> -		  GPU_IRQ_CLEAN_CACHES_COMPLETED |
> -		  GPU_IRQ_PERFCNT_SAMPLE_COMPLETED);
> +	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_PERFCNT_SAMPLE_COMPLETED);
>  	gpu_write(pfdev, GPU_CMD, GPU_CMD_PERFCNT_CLEAR);
> -	gpu_write(pfdev, GPU_CMD, GPU_CMD_CLEAN_INV_CACHES);
> -	ret =3D wait_for_completion_timeout(&pfdev->perfcnt->dump_comp,
> -					  msecs_to_jiffies(1000));
> -	if (!ret) {
> -		ret =3D -ETIMEDOUT;
> -		goto err_vunmap;
> -	}
> =20
>  	ret =3D panfrost_mmu_as_get(pfdev, perfcnt->mapping->mmu);
>  	if (ret < 0)
>=20

