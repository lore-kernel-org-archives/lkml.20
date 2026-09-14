Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07B6420463
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378884; cv=none; b=hOBi0DVsX6yyn0aSNIbYwWOWVjSe/ZhZjOhER2W0jp6X/bPsM5DaO/wgi9KGym1Obkn5uT1jRmXz8fLadTYbB4w897AkxM+B7l8DHHKQOrltxVaq+g+ZjBs7z/reO7w7E5DV40SA0uVwLKsJkf7FNwJ5lY9dghiW610qF/0zhp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378884; c=relaxed/simple;
	bh=Nb0MCwv9G8Ou4s2f90KiUjU5XAXR3XUiibGuWP+USzw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H8Biga2EOz4XTrlGoETdh7EDN1ZliqzEOjdqyzvavs5OifnPJaI3ghyhpLTLZZWX8bBiaxTFEIW/uqv2FbN6ZIpagpMiJfTIac53mJ4KGo3uRcLF37woQBnWU+4vIbXFMj71iw3TcwbmoBbB06UPkVg2Pl1Fc/YPutheg0j/UaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Zo7KQj/y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Zo7KQj/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789378881;
	bh=Nb0MCwv9G8Ou4s2f90KiUjU5XAXR3XUiibGuWP+USzw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zo7KQj/yyTcW6cTMkoOLLmCFl973SjxCNsUY/Lzo+oRhce+xOSRD4VtuLVzdrbsxr
	 ovgKKkFt8XgPncWB7DeX5JdE1cOr+p1x7bWx6hG0Somb7KEfJR/46fskrqidnVJOGT
	 zezn3kYLJVNtp1CaRcI5MGpCZSFvmVgMQclVKR4kpJoX078WUamHioroUoXKT321x1
	 Oa57d//Ze+WHbSMZL646Rd3rpW75WMJHbOvIMmAYx6vv2bMeBzANG0atP3PRZ+MC1i
	 kdiiZh5FAbCRiMwHE2Z50kKzIJXahdzP2jzgzqNLpHUf1an7+l4XMFeGbbPIh1De28
	 +dYyEwNVGBa0g==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5324E17E0894;
	Mon, 14 Sep 2026 11:41:20 +0200 (CEST)
Date: Mon, 14 Sep 2026 11:41:16 +0200
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
Subject: Re: [PATCH v9 12/16] drm/panfrost: Skip cache flush/invalidate when
 enabling perfcnt
Message-ID: <20260914114116.47bed578@fedora-21.home>
In-Reply-To: <20260912-claude-fixes-v9-12-e588feaa61ef@collabora.com>
References: <20260912-claude-fixes-v9-0-e588feaa61ef@collabora.com>
	<20260912-claude-fixes-v9-12-e588feaa61ef@collabora.com>
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

On Sat, 12 Sep 2026 00:28:13 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> The GPU cache flush/invalidate operation is unnecessary. First off, the
> GPU doesn't read off the perfcnt sample buffer, only writes into it, so
> an invalidate doesn't make a difference. Then flushing GPU caches after
> each sample has been written is enough for the CPU to see updated values.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

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

