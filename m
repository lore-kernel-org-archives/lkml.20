Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107A0423E9E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135508; cv=none; b=Rz2DWaJx0w935L6dUWGtmLzKiByr9118mADHZGNJSCpLcp+VgnMFAhdSe8+0KbVnAh8NNcSWcPIyI4HHo996baZ2J049QcClceBlvR1Ubbs9mMaKDTwIIGGqoxarZBPguCzgIGXfJqf5nWD+FDieI1+HFodTKyMTLGzUT1JxB5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135508; c=relaxed/simple;
	bh=RLFeYH6tiafptPHlhc/Kq2wkFuyMv8vV0mF6GAfPeIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bfr7GogvSb6n5WYtbQu+tv936Qm4GtrvVt4LQ1vC5AFN9enZSkv+mDnlpXdhKKv39XbudvJm6sK6zmnpJclLvDZTM7r0g6RLd2DPZXJyw0tIPJszb6jttNKKn56lKCBWouJRvg2UyAIsg3nxsoVCaYhNKn2EmFvgAFTk7FRjIj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Hv3VMIHz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Hv3VMIHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792135502;
	bh=RLFeYH6tiafptPHlhc/Kq2wkFuyMv8vV0mF6GAfPeIQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Hv3VMIHz94+4/zxpjOq/ykV8tyC0q9YrDWdThZTMWtWKWf+JS5iTw93t2A3H+Pkad
	 sfeJ16cHg2cRsWgxnIfB9Zxbl8zUyyGPAnvSFdgEij63AgeDNid+Wj2w3ljxKC4ijd
	 pVpR5VKKvSb7h5ARCbLlt8ayIleQuTfZc2EtJj1f9vA7TXXItrV+anSuaG3Y+eTtKW
	 gRzYKCg5KruuowU4lVyvWowxp0kMf/EhYrv71G/S4QSUKws+Z/AwiDm+uI92gckwKP
	 1zfYGu6x27BpQwk272NxyXnwiAUS6I3e07xHXnvpDe9aDzxkt8Tcx0EKOVkC49cBql
	 BVitZS4elOVyQ==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6712F17E0036;
	Fri, 16 Oct 2026 09:25:02 +0200 (CEST)
Date: Fri, 16 Oct 2026 09:24:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/panfrost: Fix race when restoring reset state
 in perfcnt
Message-ID: <20261016092457.610adb7c@fedora-21.home>
In-Reply-To: <20261015-panfrost-reset-races-fixes-v1-2-bb74c1786a0b@collabora.com>
References: <20261015-panfrost-reset-races-fixes-v1-0-bb74c1786a0b@collabora.com>
	<20261015-panfrost-reset-races-fixes-v1-2-bb74c1786a0b@collabora.com>
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

On Thu, 15 Oct 2026 19:22:32 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> struct panfrost_perfcnt::state should always be updated atomically, both
> in the dump ioctl and the reset sequence.
>=20
> Fixes: 9944dd07f3cf ("drm/panfrost: Fix races between perfcnt and reset s=
equence")
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/dr=
m/panfrost/panfrost_perfcnt.c
> index b26da057a1a0..d50b6cc2ecfa 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -148,18 +148,17 @@ static int panfrost_perfcnt_dump_locked(struct panf=
rost_device *pfdev, u32 *stat
>  	 */
>  	ret =3D wait_for_completion_interruptible_timeout(&pfdev->perfcnt->dump=
_comp,
>  							msecs_to_jiffies(1000));
> -
>  	if (!ret)
>  		ret =3D -ETIMEDOUT;
> =20
> -	/* We need to restore perfcnt state so the next successful dump can rel=
ay it to UM */
> -	if (ret < 0) {
> -		perfcnt->state |=3D *state;
> -		*state =3D 0;
> -		return ret;
> -	}
> -
>  	scoped_guard(rwsem_read, &pfdev->reset.lock) {
> +		/* Restore perfcnt state so the next successful dump can relay it to U=
M */
> +		if (ret < 0) {
> +			perfcnt->state |=3D *state;
> +			*state =3D 0;
> +			return ret;
> +		}
> +
>  		*state |=3D perfcnt->state;
> =20
>  		/* UM must re-enable their session before requesting new dumps. */
>=20

