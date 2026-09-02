Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96241372EC1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366190; cv=none; b=DZY4c6OqAlK3sObBAGJuGveS/SgkC1VzicEyjHEdUlYOYAcsuDtBiKbOyxA/1oUkv8tmJnpTRCJUxV9MVT7xKCErIRwoRyIyVUZ+o9S3JQTr4QaIAs2uwd5NeWMkVV6OKGadGwgXTYKvbSXLnPnzwRqJAUG0vLAktlgz4rvjtPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366190; c=relaxed/simple;
	bh=xAJ3jchtl98ZkzCwIOxaDX3nENS8nbEBPJaMMlgBMHs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BrH3DOs1TI6EtXjjVe39TFWWOFRe4T1FNTJwQhkEWlQWtg8Hgd9wlO9u62oxnrAZRLj4DVoXTr+1jO8SMRVrvQz01dZiSzUePJ7hN6dCXg16any0WaAMBrwVlMm+M4csU7Xxd9JLYa3J3f3wd7KIGrcgmN96i8qYEe3FsH74vY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QGK4p7SU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QGK4p7SU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788366186;
	bh=xAJ3jchtl98ZkzCwIOxaDX3nENS8nbEBPJaMMlgBMHs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QGK4p7SULk8OIFMXPGFdNhVT9PJdgsthD/+stps+EE+0rTEjhj5FZwSBCEJr/thV0
	 AaG+XXKhtVhOlYFNtniV11BNWK4rB6uBCKCTUNmZTXiEdNvMNubctmBKsq7RxsNAjC
	 odwVA1XfkN5fpPwmhcHWkOIQ30xTehKnFRA8bZv0ACy8elZ72uDV4i10ZgeZctz2xg
	 yYbW0PysSR8HpYanvfF/SXh/HZq7VBHn2dUae7YPgp9466P3VwOHrRB3vJobXeshm9
	 FsdIl4z3tSYAKXpNvYjp3JEKV4mpfTVrqR5fss5/vT0o+fhzK2IYvgmHCnrOX1eJ/Q
	 Fh2pYbIxvFk0A==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 062C317E0EB0;
	Wed, 02 Sep 2026 18:23:05 +0200 (CEST)
Date: Wed, 2 Sep 2026 18:23:00 +0200
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
Subject: Re: [PATCH v7 11/17] drm/panfrost: Add debugfs knob for manually
 triggering a GPU reset
Message-ID: <20260902182300.3d4ee154@fedora-21.home>
In-Reply-To: <aphD4_tNK6w9yc9j@sobremesa>
References: <20260828-claude-fixes-v7-0-72a13b2c125d@collabora.com>
	<20260828-claude-fixes-v7-11-72a13b2c125d@collabora.com>
	<20260901152726.280f57e0@fedora-21.home>
	<aphD4_tNK6w9yc9j@sobremesa>
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

On Wed, 2 Sep 2026 16:42:53 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> On 01.09.2026 15:27, Boris Brezillon wrote:
> > On Fri, 28 Aug 2026 21:56:51 +0100
> > Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
> >  =20
> > > This will be of great help when testing potential races between the G=
PU
> > > reset sequence and other parts of the code accessing HW registers.
> > >=20
> > > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > > ---
> > >  drivers/gpu/drm/panfrost/panfrost_device.c | 35 ++++++++++++++++++++=
++++++++++
> > >  1 file changed, 35 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu=
/drm/panfrost/panfrost_device.c
> > > index d8acae9b8cfa..b6a48ae0d3a6 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> > > @@ -2,6 +2,7 @@
> > >  /* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
> > >  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> > > =20
> > > +#include <linux/debugfs.h>
> > >  #include <linux/clk.h>
> > >  #include <linux/reset.h>
> > >  #include <linux/platform_device.h>
> > > @@ -600,9 +601,43 @@ EXPORT_GPL_DEV_PM_OPS(panfrost_pm_ops) =3D {
> > >  };
> > > =20
> > >  #ifdef CONFIG_DEBUG_FS
> > > +static int reset_get(void *data, u64 *val)
> > > +{
> > > +	struct panfrost_device *pfdev =3D
> > > +		container_of(data, struct panfrost_device, base);
> > > +
> > > +	*val =3D atomic_read(&pfdev->reset.pending);
> > > +	return 0;
> > > +}
> > > +
> > > +static int reset_set(void *data, u64 val)
> > > +{
> > > +	struct panfrost_device *pfdev =3D
> > > +		container_of(data, struct panfrost_device, base);
> > > +
> > > +	if (pm_runtime_get_if_in_use(pfdev->base.dev)) { =20
> >=20
> > Are you sure it's not pm_runtime_get_if_active() we want here? If use
> > the _if_in_use() variant and autosuspend is enabled, we might skip a
> > reset on a device that's active. =20
>=20
> Do you mean if a driver has brought the RPM count down to 0 and scheduled=
 a deferred suspend?
> Couldn't manually triggering a reset then somehow race with whatever is b=
eing done in
> panfrost_device_runtime_suspend() ?

If a concurrent suspend is happening, _get_if_active() would wait for
the transition to happen, and return false when the suspend is
effective. If a suspend was scheduled (rpm ref was zero), it will be
cancelled, and you'll end up with an RPM ref preventing any suspend from
happening until you call pm_runtime_put(). So I think we're good.
