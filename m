Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5503444781F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146732; cv=none; b=CsA1rCtOobG83ePdooLradvy/F2CxAEY539wafFZehSsxZcPxTeQnw1Iqej2TLohGlsa5/nc2lGoPXIKtBL/BrCCmm/corrREQkt6TZhcow5xAjGbVgujJ69gnL8ZuIVcSVR/NYNNqsSCN0Y+z1u8h1xEp4PgHwVERJxJufi00U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146732; c=relaxed/simple;
	bh=a2NtTBakK0HpDmrLfulXCfgzfoYb8F4272oQHZWZOTk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nL/w24cojk3BDxcRH7OC8A/hGBT5zUCpTYoUCdRtnzBrXWC47yo5BX9Spocn/5gsbybvNt2EL6/j/XBaAChJ29aSQ14kE7FkuuDCPWuCGsj72GpN/S3uu5IWyuQIl8DMnVCAXA2BujY8PE25sDrdhK0dtgR3UGVvSm4QQs1T2yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lWm0hN26; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lWm0hN26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790146722;
	bh=a2NtTBakK0HpDmrLfulXCfgzfoYb8F4272oQHZWZOTk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lWm0hN26BVbgIR9ugmfpiVMphZWepL08U7Cv7rXQxXIJ0IgUZLSFpG/ksx0Lke1vy
	 Og0B/ChtC26wQMcjE236nuoK3GaOAP9FfIK3S8EwIAXZ1hQ+iA4uWKqMv/uQL/xETG
	 uddLg7WxuNWUUcW83rpmGef3t44moyV94CnUd/b0XgAKwxJGwa52vO6J1hBl+DRlPd
	 d+PPOOTGwenZLbRqQ0BJTbh6h/A1FuHv8hFbtgtVL6cQsP10zqwNRyr/QifLGZT6WL
	 HQHJA28TmBD65VXY90SUBOt/EC0rkXDwQXkxb3h4LuduDGxCf0dcoF4jhxYpdT+fEN
	 S4cFhELwJLUpg==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 882D017E0371;
	Wed, 23 Sep 2026 08:58:41 +0200 (CEST)
Date: Wed, 23 Sep 2026 08:58:37 +0200
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
Subject: Re: [PATCH v9 01/16] drm/panfrost: Move shrinker initialization and
 unplug one level down
Message-ID: <20260923085837.5e92198c@fedora-21.home>
In-Reply-To: <arFQG1AYMXlRgmJS@sobremesa>
References: <20260912-claude-fixes-v9-0-e588feaa61ef@collabora.com>
	<20260912-claude-fixes-v9-1-e588feaa61ef@collabora.com>
	<20260914103646.6f1b7246@fedora-21.home>
	<arFQG1AYMXlRgmJS@sobremesa>
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

On Tue, 22 Sep 2026 20:48:49 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> On 14.09.2026 10:36, Boris Brezillon wrote:
> > On Sat, 12 Sep 2026 00:28:02 +0100
> > Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
> >  =20
> > > Since the moment we call drm_dev_register() the device should be in a
> > > position to accept jobs, so it's best if the shrinker is already
> > > initialized by then.
> > >=20
> > > On top of that, make shrinker functions take an panfrost_device point=
er
> > > like other functions in the same sequence and rename them accordingly.
> > >=20
> > > Essentially mimic the init/fini behaviour in Panthor.
> > >=20
> > > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> =20
> >=20
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> >=20
> > One remark below.
> >  =20
> > > ---
> > >  drivers/gpu/drm/panfrost/panfrost_device.c       |  8 +++++++-
> > >  drivers/gpu/drm/panfrost/panfrost_drv.c          |  6 ------
> > >  drivers/gpu/drm/panfrost/panfrost_gem.c          | 26 ++++++++++++++=
----------
> > >  drivers/gpu/drm/panfrost/panfrost_gem.h          |  7 ++++---
> > >  drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c |  8 ++------
> > >  5 files changed, 28 insertions(+), 27 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu=
/drm/panfrost/panfrost_device.c
> > > index 485349faf251..05c40d5a20b5 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> > > @@ -280,9 +280,14 @@ int panfrost_device_init(struct panfrost_device =
*pfdev)
> > >  	if (err)
> > >  		goto out_job;
> > > =20
> > > -	panfrost_gem_init(pfdev);
> > > +	err =3D panfrost_gem_init(pfdev); =20
> >=20
> > It feels weird to have the GEM subsystem initialized last when you
> > consider the fact other subsystems might want to allocate GEMs in their
> > _init() function. I know it's where the panfrost_gem_init() is right
> > now, and that ultimately it doesn't prevent anyone from allocating
> > GEMs, but I think it would make sense have this called before any of
> > the other subsystem init functions, still. =20
>=20
> I think we discussed having panfrost_gem_init() be called before the other
> subsystem init functions, but then I checked panthor and saw it's also be=
ing
> called right after all the others there too. I think you're right that it=
's
> best to initialise gem first, because I wonder whether other subsystem in=
it
> functions creating GEMs when the mount point for huge page-backed objects
> hasn't been created yet could lead to some sort of trouble.
>=20
> However, given how much this patch series has already grown, I believe it=
'd
> be best to leave this change for a later one.

Sounds good to me.
