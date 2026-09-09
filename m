Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FA3498909
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947863; cv=none; b=NN/0CPwrqXKT/uhU+bfU8VoxvOUWJlLpyVD8lSc0eElqzJNGL1YNTJ13stIopHfeFq+ht3IiJgnprBmSAl/13TFsrQLGGyobFq7+KCEk4er8TSm1E4kXbaddjLtp6ylCgV+OTNDJoY1AjKQn4dtl3yesykoG+F0cHnevvRI+EmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947863; c=relaxed/simple;
	bh=3WDMZzHue5+Tw52yUUIBOp6U1vVvZKH08jbAvjGGpGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUtyZNvEXVJXwV/gnaU7hliX7c73N18MCpNvmrWqjeowNpe1jD5sfuKNHPreDhu/ao3MHIiYqlPVNYcd8UIQc0RxzhsoaZQz/M2NaXDDIAc+KqkVHwX53dD03VMp5oJLEdyaLt0ebiUMym6xUy0iaGHuev5E3P2vGMIC2VxjPuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A53tuRIi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A53tuRIi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9161F00A3A;
	Wed,  9 Sep 2026 09:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788947861;
	bh=ACS7vz8pGD479SlSiRi90udXcJvc5D6Uo+sv7aFEyS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A53tuRIiFTkeViWFyJKiOLB8Dku0djstP2HReCfBOtb4pEciOnCmgSMWlo5kpEFBl
	 pm6oD0twfYoZRhg0QE7e8fhPbb8RYCx15yWjfr/CD1DNq5wwtcf57MBFeSwFui/t3v
	 3j6l9fkDb+tgGXt0kSL1rFaeX7i0L1M7HWbz8KLlqMaiQZaTvwRt08ypgg0MIDpjxp
	 6wCKaFGeLTcj1qzx9njjILHVSXQXZZ0TEq8rLwrR1R1hYTYyrLjABW5WWhkGpluuN5
	 fV10mP+YKmwWZmPdkX/TBwp/ISduYkHNYsNjmGTdgXiI+x/UJDxElDwrvG36ZOn6ii
	 35IODZPcbGzvw==
Date: Wed, 9 Sep 2026 11:57:38 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Albert Esteve <aesteve@redhat.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH RFC v2 05/19] drm/panel: embed a drm_bridge into every
 drm_panel
Message-ID: <aqEqx0zBQgmUgwqL@houat>
References: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com>
 <20260903-drm-bridge-every-panel-v2-5-2ab8ee24538e@bootlin.com>
 <678ddef7e56703d9adffff5c490d4857af515343@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="k6dpjrdgn3b4kb6y"
Content-Disposition: inline
In-Reply-To: <678ddef7e56703d9adffff5c490d4857af515343@intel.com>


--k6dpjrdgn3b4kb6y
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC v2 05/19] drm/panel: embed a drm_bridge into every
 drm_panel
MIME-Version: 1.0

On Tue, Sep 08, 2026 at 07:18:53PM +0300, Jani Nikula wrote:
> On Thu, 03 Sep 2026, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > Adding a drm_panel does currently not add a panel_bridge wrapping
> > it. Usually the panel_bridge creation happens later, when some other dr=
iver
> > (e.g. the previous bridge or the encoder) calls *_of_get_bridge() and t=
he
> > following element in the pipeline is a panel.
> >
> > This has some drawbacks:
> >
> >  * the bridge API is currently the best practice to access various
> >    components of the pipeline, especially with complex cards where brid=
ges
> >    can be combined in different ways on different hardware
> >  * the panel_bridge is not created in the context of the driver of the
> >    underlying physical device (the panel driver), but of some other dri=
ver
> >  * that other driver is not aware of whether the returned drm_bridge
> >    pointer is a panel_bridge created on the fly, a pre-existing
> >    panel_bridge or a non-panel bridge
> >  * removal of a panel_bridge requires calling drm_panel_bridge_remove(),
> >    but that other driver doesn't know whether this is needed because it
> >    doesn't know whether it has created a panel_bridge or not
> >
> > Other drivers call [a variant of] drm_panel_bridge_add(), which also has
> > some of the above drawbacks.
> >
> > So far the current approach was working mostly because devm and drmm en=
sure
> > the panel bridge would be dealloacted at some later point. However with=
 the
> > upcoming implementation of bridge hotplug and dynamic bridge lifetime t=
his
> > will get more complicated.
> >
> > Switch to the new approach: embed a drm_bridge inside every drm_panel,
> > which behaves just like the current drm_panel_bridge.
>=20
> What does this mean for drivers like i915 that use drm_panel *only* for
> handling panel followers? We don't need the bridge for anything. It'll
> just be excess midlayer baggage.

If we're talking about this series alone and assuming no regression,
nothing. The drm_panel struct and lookup API is still there, you can use
it.

Long term though, there's talks already about panels needing a more
full-fledged API (with access to drm_atomic_commit for example), and
especially if this series land it might just make more sense to
deprecate panels entirely and implement them using bridges.

So, I'd keep an eye on these discussions.

> I'm also concerned about the embedded struct drm_connector being added,
> since that can't and will not be a drm_connector that we'll use. All of
> our drm_connector are embedded in intel_connector, and all of our
> codebase expects this, and we init them ourselves. Having additional
> drm_connector (not embedded in intel_connector) added by library code
> *will* oops in our driver.
>=20
> I haven't had the time for an in-depth look, but it feels like this
> assumes a certain driver model, instead of providing building blocks for
> drivers to use.

I really wish i915 was at least *trying* to fit within the larger model
basically everybody else uses. I understand that it's a large
undertaking and regression prone and everything, but I'm also concerned
about having the "we can't because of i915" or "supported by everybody
else but i915" on a regular basis now.

Anyway, I'm not sure it's a big concern because the connector is only
created when the bridge is attached, which you will never do if you
don't support bridges. Worst case scenario, I guess we can always put
that code under an ifdef?

Maxime

--k6dpjrdgn3b4kb6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaqEtiwAKCRAnX84Zoj2+
dvCsAX98+lv4KCDpQoNeGYrORnL7ssSVmSmd5PK2/X27rZn+qZdO1ibUqXmqfK2d
joTFsOwBegKScSARUzJyYICLfU99vwIy88TBzg82tumq6vC4MvzRMOYqDpRn0Rzn
ZNTO/DzvxA==
=P0/x
-----END PGP SIGNATURE-----

--k6dpjrdgn3b4kb6y--
