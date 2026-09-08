Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E527598C16;
	Tue,  8 Sep 2026 18:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890463; cv=none; b=a824j8NdsJwNfJ9A0lXD3GcszHFaz48IxAo1+y3yFbjOURyu2x1x6oPk3EXepvj9sCnK6PkLoT2vd31nToP/jlRzjyEyeM731FBvb5Jq9qks6aJxnZe1A3G5520fEHj85FALXXdVm0lO4HjdCm606ejB4kErCpN5UKinMFRn6Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890463; c=relaxed/simple;
	bh=iYO80B8I1+w6R8uwt1KzWcOb68xdO6xDg2rGoee6Wvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=piNingCa1Cs+z4uZtjnTmx8qC46jmgmpH4w7AoKv3ueFNy0s9qyIWSCg/Yele4uFitarb27O0/rkLOhzOcxBjwglptqL68lz1P5yhGuJ9kn4IPVYcIAlBK2rKWp/ZALzVYEZHVC5/oOgd71ExtcbAyOT+3CEE+D1Jmcm79ewdHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVJlAWto; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVJlAWto"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F391F00A3D;
	Tue,  8 Sep 2026 18:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890457;
	bh=iYO80B8I1+w6R8uwt1KzWcOb68xdO6xDg2rGoee6Wvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LVJlAWto+Ot4fi9SIelMgvzf2MC5fZEhyoOiXt6RxRXS3XHJdojlTHxbrBF8J8N6v
	 Ya2pwq6P5LmtPvHY6LbdSTP6SKUJygK9x3xUrluezkA4rfwyewfXJZcfCF48C8Hchs
	 1m7eCYAk6FM0PlV/uhZDdoiuIWW7es3tRJkyu3V6EMpCTr53TIAcaViocRjV5uPyJO
	 r5LHwr/WOViFrLTPJfOvqOB3FFuwNc8SlM6n7iPSppoBmjF5h0dKZHLwS63fhkQdnE
	 3f/01erVZYr9gvASHCbv5nY5PNsBdNI1y+d7UiQKELu4uJ+w+awHBBoUnI6PDKL0l0
	 pZ01Ntsoo9C4A==
Date: Tue, 8 Sep 2026 19:00:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Archit Taneja <architt@codeaurora.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 7/7] dt-bindings: display/msm: hdmi: Correct name of
 disallowed supplies
Message-ID: <20260908-very-rocker-799f0b4eb26b@spud>
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-7-dcf8956878ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vyaPzKmKVJe2FvgC"
Content-Disposition: inline
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-7-dcf8956878ca@oss.qualcomm.com>

--vyaPzKmKVJe2FvgC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 09:10:47AM +0200, Krzysztof Kozlowski wrote:
> There are no properties in DTS or Linux drivers called
> "core-vcc-supplies" or "hdmi-mux-supplies", so the binding probably
> wanted "-supply" properties instead.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--vyaPzKmKVJe2FvgC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBNUwAKCRB4tDGHoIJi
0oO7APsGmykE3+6RN+2pC/OzeWImWqXs3tPqdm85hWcBCC+MBAEAwQAtr/IdzR64
GIh/rMnDt4ifvpxhUSy7oCiAj3QRnwE=
=40c7
-----END PGP SIGNATURE-----

--vyaPzKmKVJe2FvgC--
