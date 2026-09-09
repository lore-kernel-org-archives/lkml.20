Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423D444A3FC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942147; cv=none; b=faoz+kuDQipP4NrJr1F++0NZufLsoaEztJ+WVT3iv6JubXXXLndIUWeN7BS74FR7aMz+bebmCRlG6UA37C49iX1upx1IbdHSBJXMr6xZoFUol5p+cMPNUBmoVE9ZOKOS+HuWAYoHPB+ANuuJuvkoIdrv9ac/t6xqwtBSBF4KRkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942147; c=relaxed/simple;
	bh=QViobpJ4Kli8Q35Dq+uuf93hk2ll3if4mS6RjmB5JOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7LehqDQ0iPmgowV5acaVi8/iGgng8kJ/WGrKwPlOfrNA6MpdI5vq7KOH+0j3aShddGWhb9k1ChJ1GpMDgxHdlpmt8mbVMvK9MxC3kAxUuM9z7mE3fbUUMmh4ShzBlBJa/9RrTOENgP5E+rXJ7S3e55npYJwno5c/HI90bdt4QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jsr3OMp0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jsr3OMp0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76EA41F00A3A;
	Wed,  9 Sep 2026 08:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788942146;
	bh=IZJZkwuzP9bCUn9cbZ6GATDpFjjOakgDLWy9LKF4FFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jsr3OMp0oPWmNLnLn97/cGca4WY6c+Jjl9PmreoUPwVfel7+lDFyQeNDlUsRZekrr
	 fGWCJBQhK2gpTSuyGOM07sEyQAH9OBcqYB95BmC2AW+0dFvPE7lHjq7qlCcObRCN5g
	 3UhTgDRpWLIdAQ8V1HftQs4ArLScLNEyj80ve7DOf8jkL3H5RJfbsDic1ftdutnmP5
	 1nl8DFX3nDyRB6k+AXXsmbYETHKroST7TjEhcNxU6+mdcPQd7cbWvc8aySZSGTqjd7
	 hZDIEuukZumncGfsPGPveSs9GX+F445AeYYsg0dHelq8nomo5J7+1+n/CoVbipdNFt
	 xC0RBivZ2KWMw==
Date: Wed, 9 Sep 2026 10:22:22 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Stone <daniels@collabora.com>, Harry Wentland <harry.wentland@amd.com>, 
	Jocelyn Falempe <jfalempe@redhat.com>, Jonas =?utf-8?B?w4VkYWhs?= <jadahl@redhat.com>, 
	Michel =?utf-8?Q?D=C3=A4nzer?= <mdaenzer@redhat.com>, Pekka Paalanen <pekka.paalanen@collabora.com>, 
	Sebastian Wick <sebastian.wick@redhat.com>, Simon Ser <contact@emersion.fr>, 
	Victoria Brekenfeld <victoria@system76.com>, Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/11] drm/atomic-uapi: Add DRM_MODE_ATOMIC_RESET flag
Message-ID: <aqEMMpTN26hCs2dB@houat>
References: <20260908-drm-reset-state-flag-v3-0-905570f387a4@kernel.org>
 <20260908-drm-reset-state-flag-v3-9-905570f387a4@kernel.org>
 <3c77a62c-13e2-44bd-a7e8-c2ea29dcf352@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="mop3s4wzh3xzpd4v"
Content-Disposition: inline
In-Reply-To: <3c77a62c-13e2-44bd-a7e8-c2ea29dcf352@suse.de>


--mop3s4wzh3xzpd4v
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 09/11] drm/atomic-uapi: Add DRM_MODE_ATOMIC_RESET flag
MIME-Version: 1.0

Hi Thomas,

Thanks for the review

On Wed, Sep 09, 2026 at 09:24:41AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 08.09.26 um 16:35 schrieb Maxime Ripard:
> [...]
> > diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> > index 0dbf04d4aa9e..f13bb7c490c4 100644
> > --- a/drivers/gpu/drm/drm_ioctl.c
> > +++ b/drivers/gpu/drm/drm_ioctl.c
> > @@ -303,10 +303,13 @@ static int drm_getcap(struct drm_device *dev, voi=
d *data, struct drm_file *file_
> >   		break;
> >   	case DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP:
> >   		req->value =3D drm_core_check_feature(dev, DRIVER_ATOMIC) &&
> >   			     dev->mode_config.async_page_flip;
> >   		break;
> > +	case DRM_CAP_ATOMIC_RESET:
> > +		req->value =3D drm_atomic_can_create_state(dev);
> > +		break;
>=20
> Looking at this and the other places where _can_create_state is being use=
d,
> I'd like to present a different design.
>=20
> Scratch the helper entirely and introduce a dedicated callback in
> drm_mode_config_funcs that sets up the default state.=A0 Your current hel=
per
> drm_atomic_commit_fill_with_defaults would be the common implementation. =
The
> DRM core could test for the existence of this callback to see if
> default-reset is available. Sure, we'd have to modify all drivers, but it
> would be architecturally cleaner IMHO and give full control to the driver=
s.

There's also an interaction with the other big series relying on
atomic_create_state: state read-out.

If you're doing state read-out, you want to if possible create a blank
state, and make the hardware fill it. If not possible, then reset the
hardware and allocate a blank state. Either way, all objects are
affected, and that's what drm_mode_config_create_state() will do there.

In the DRM_MODE_ATOMIC_RESET case, we don't want to create a blank state
for *everything* but only to what's exposed to userspace (ie, everything
but drm_private_obj). In a way, it's more akin to
drm_mode_config_reset(), but without the hardware reset part.

I still feel like two functions are easier to reason about for this, and
I don't think a helper would help: we haven't needed it so far for
drm_mode_config_reset() / drm_atomic_commit_alloc(), so it's not clear
to me what the extra modularity would bring to the table.

Maxime

--mop3s4wzh3xzpd4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaqEXOQAKCRAnX84Zoj2+
djkXAX4keCkaWpWy7OcyT8B3SL9jGkEc4NEWQdchk+KxSflN4+7nuX9AGeKKvGJh
JHrpRyIBgJGvkzzhqFrt/VaOEk0kLyYR+spIfMLF5BWoHIjCTZk/XFLd73oHnONo
sgzTzKJBSQ==
=bT3e
-----END PGP SIGNATURE-----

--mop3s4wzh3xzpd4v--
