Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D2015E8B;
	Wed, 16 Sep 2026 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544829; cv=none; b=UgWZIkdRItH9FQ+XFQG0gbZlI4MWNdEST2VSMxtVfkCXsrOx8PnbWgK7Pf0YtfQrOmrDaU1gn6jUNt2Uax82uNFcjcxewTOnFO2/iOLr5Ra8qOdD9NZqwzVeWoGiKnkgRgOmOW/HZR2Xifj9DHwiud40INICI1ubyqsrvpqznAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544829; c=relaxed/simple;
	bh=i6gZnVU6XS2pTKeOGthsROLP0IVxxOCrVAaLkolh60A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAS9dYNubqL+tJ8DlgOGq6VNtvlbiWjgklM8vwzITVVjbET9j8mtf/IEoSTBU3hq7kKb3YAMUNp9WQfDCtCM5kQOk79YQDxD7w1usXgyLmp1bXTEkjC0+zFsrpn5oeti72C0TWxM9Rz8VN08j9GF7Ux5t+ryIVChRVYVSOEXMic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nc+M2tZw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nc+M2tZw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAF61F000FF;
	Wed, 16 Sep 2026 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789544821;
	bh=0joaZXkFzvHsMPXxvnQrk/bZSSnjHuyjzDW4e7lSU7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nc+M2tZwVJsixOM56NLEFYEzQkaMNDIiByci6H3lph5WSy/sEnP/SvbP6NTlniikG
	 Ewmocn8mbkhzZl9xv2kVMDBr9tzV6fTxVdxlVlUs7jGzcaKO2mFJVVhpduKi44oong
	 sHtZYmooyLnIcMDIU55vEXNcmGKmkaxT2821zwOmgb3Efs5H3NrjmHxgoHWATRdia5
	 KNsXvB16dSqeGTjIGJunLyXRJRAL3W18yGfPBId94h5QLA//ndBGRfh3HO0XR5ZLsF
	 ZZfrrn52BOrmvfzleaLFXxmfmxJIZnjEVpiunf5J+VIySiejvQLBNbUK5GOMjqX3Eh
	 +6UMsYsqAvK1w==
Date: Wed, 16 Sep 2026 09:46:56 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ze Huang <ze.huang@oss.qualcomm.com>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Marian Cichy <m.cichy@pengutronix.de>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
Message-ID: <aqpJKSSKunElnQ3o@houat>
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
 <20260727-drm-simple-kms-removal-v3-2-de36e534f7a1@oss.qualcomm.com>
 <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3s4tplx46ij6zcs2"
Content-Disposition: inline
In-Reply-To: <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de>


--3s4tplx46ij6zcs2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0

On Wed, Sep 16, 2026 at 08:50:21AM +0200, Thomas Zimmermann wrote:
> > +static const struct drm_plane_funcs imx_lcdc_plane_funcs = {
> > +	.update_plane		= drm_atomic_helper_update_plane,
> > +	.disable_plane		= drm_atomic_helper_disable_plane,
> > +	.destroy		= drm_plane_cleanup,
> > +	.reset			= drm_atomic_helper_plane_reset,

Also, this needs to be drm_atomic_helper_plane_create_state

> > +static const struct drm_crtc_funcs imx_lcdc_crtc_funcs = {
> > +	.reset			= drm_atomic_helper_crtc_reset,

 and drm_atomic_helper_crtc_create_state

Maxime

--3s4tplx46ij6zcs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaqpJcAAKCRAnX84Zoj2+
doCwAXoC9/rqP3SJq9eA3TmbsgUL1dNQBlXU005d6LFRuERn952eYKYsEdnw0oH7
sS3Ms8EBfiZnSTC8Whf1zsDguMj/m/bcSyfEzHV6wM8Ix8qPXjNRdKfvP1twZo2V
tHED8pYuFg==
=LKtN
-----END PGP SIGNATURE-----

--3s4tplx46ij6zcs2--
