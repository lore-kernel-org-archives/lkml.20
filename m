Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405168;
	b=IrJRGEDRIun6eHMNr13Xop5FgqH3Hzne1AemXPXY05ikHaaKzMr7+MPsafa+kBn1kBr+
	 hCRgdl346/L3/l+8dGTKorOJ/BHhiOMdtFkqt1acduWmp56xW9OSuY4x4uV3q/6siyUXE
	 zGKtCIjD67lvVYiHVGi20Y0EiMyohCjS9wQ2m7FYB/nklheH0p+uVCS2wEFnW89g56mwB
	 kUt0hhy4JE2OZAHNgGzjtW/qGS3CadEuOyZmYNHOTIEKaKESzufoaXpCBQsalg48CnbLs
	 Y9ilB5kNgrrcSHsTWo1bzBmU9VchKv6gAccpkvyjuRxHPMZTdcRwqCsVLrKc7AHxLQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405168;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Blt9yNW1MFXUEH0MeVDn3VPp8fShQ0ttpzP5GIAFKEc=;
	b=HjpQ1xg2B035zjIfaKpI8xqNJsxjxRIaDkNVWA8V9lidWBpMnj4lQBdZ1gxIZhL6UODB
	 EOStA/nm8BxJ5HdWvNxNtj2iEms0qP7mYnsrsgmd3RQI2+1D5EG+cMjN3Z6+YIUoQ5E9D
	 3KOcIV6TaBMoQvWv3AeHAmV+kblfyQmzDuhjgtGq2XnK8n0AyraRDZ3oggKwi/PGVQrPU
	 FnAcC3KQDz9VJaPk8TMwY5Sn1FA3+eAkFZk83MwVzT422hPcjdfDZiBrF63xYNMP5vRb7
	 zywGT2uSBjuQSJkjFM07PzGzqDAnfz8dLmJohIa+o0xxnIoaoXy4zsxL416nLcp2l0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i1E0aG/y";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3FE606A32A;
	Wed, 11 Nov 2026 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i1E0aG/y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFD51F00A05;
	Wed, 11 Nov 2026 13:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794405168;
	bh=Blt9yNW1MFXUEH0MeVDn3VPp8fShQ0ttpzP5GIAFKEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i1E0aG/yXS+Yre90djm/xfu6deIrhhWsRW6EDdauoqTVoYa9MD/lpQ2XE5vBFK+L0
	 qqLl2j+9a0tM4teP6QllVKjb6QosBYrDQqHk9GoPL3Tj1a0oCzidwmh7HLIO00tY+j
	 NH9Y/pjBKSjLngBcM/XvzGQiQ/wYxftQ20GYqA2k2eMuynPw4CLX4Qp0ydf6VpJ9xw
	 Fzjnpdh7A23qrBRSLJOC6QJvDAprF7PUO0v1Jm1CtrQeCstLFYTtZ5KJcygXNTNoOb
	 a4+E1qYsoWxsQ9bqCeHSdKLCyy0e8LvaIC3AAFrq9mFmgCODVt774hvAgHxhVzn8pb
	 tiRgvKQuDN88A==
Date: Wed, 11 Nov 2026 14:52:44 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Selvaraj <jo@jsfamily.in>, Jagan Teki <jagan@amarulasolutions.com>, 
	Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
	Michael Trimarchi <michael@amarulasolutions.com>, Michael Tretter <m.tretter@pengutronix.de>, 
	Cristian Cozzolino <cristian_ci@protonmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Ryan Brue <ryanbrue.dev@gmail.com>, Nickolay Goppen <setotau@mainlining.org>, 
	Robert Chiras <robert.chiras@nxp.com>, Alexander Koskovich <akoskovich@pm.me>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chris Morgan <macromorgan@hotmail.com>, 
	Barnabas Czeman <barnabas.czeman@mainlining.org>, Heiko Stuebner <heiko@sntech.de>, 
	Luca Weiss <luca.weiss@fairphone.com>, Arpit Saini <arpit.saini@oss.qualcomm.com>, 
	Michael Walle <mwalle@kernel.org>, Ritesh Kumar <quic_riteshk@quicinc.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Danila Tikhonov <danila@mainlining.org>, 
	Jens Reidel <adrian@travitia.xyz>, Michael Srba <Michael.Srba@seznam.cz>, 
	Shawn Guo <shawn.guo@linaro.org>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Alexander Baransky <sanyapilot496@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Romain TISSERAND <romain.tisserand@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: panel: Make DSI panels port
 optional
Message-ID: <avRy_D6MTK5u01_9@houat>
References: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
 <avRM_GhtR8vMdTO4@houat>
 <c8dea6ad-ce41-44d2-96ab-233b0a4b1340@oss.qualcomm.com>
 <43373a9e-9ff3-4641-b961-b63f4de21cb9@oss.qualcomm.com>
 <oubzclitudtqiv64wvg5lvxvbhuffxmc5bgbsdz4ou24pfhbb4@decarhvjzl2a>
 <0f2c0eae-ed05-41a2-8688-e4b6fe1b7ff3@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vfw5phq7urvxeasr"
Content-Disposition: inline
In-Reply-To: <0f2c0eae-ed05-41a2-8688-e4b6fe1b7ff3@oss.qualcomm.com>


--vfw5phq7urvxeasr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: display: panel: Make DSI panels port
 optional
MIME-Version: 1.0

On Wed, Nov 11, 2026 at 01:44:23PM +0100, Krzysztof Kozlowski wrote:
> On 11/11/2026 13:37, Dmitry Baryshkov wrote:
> > On Wed, Nov 11, 2026 at 01:31:39PM +0100, Krzysztof Kozlowski wrote:
> >> On 11/11/2026 13:30, Krzysztof Kozlowski wrote:
> >>> On 11/11/2026 12:13, Maxime Ripard wrote:
> >>>> On Wed, Nov 11, 2026 at 12:03:39PM +0100, Krzysztof Kozlowski wrote:
> >>>>> DSI panels can be placed under DSI bus directly and many Linux DRM
> >>>>> drivers will work fine with it: mipi_dsi_host_register() adds devic=
e for
> >>>>> such panel and DRM driver does not use OF graph to configure lanes.
> >>>>
> >>>> That's not true. We do use the endpoints to configure the lanes thro=
ugh
> >>>> the data-lanes property. See drm_of_get_data_lanes*
> >>>
> >>> Some drivers use endpoints, some not. As discussed on other thread,
> >>> there are more than which do not.
> >>
> >> "there are more than one which do not."
> >=20
> > Which means that those should be fixed. We have legacy cases where the
> > drivers assumed that, but we should not target legacy.
>=20
> These legacy drivers work fine for 10 or 15 years, like Exynos.
>=20
> You can improve them, for sure, but if no one does that then requiring a
> graph is a mistake there, from the panel point of view.

At the very least the commit log needs some work then, because the
situation you describe in it is simply wrong, and quite different to the
situation you then described.

Maxime

--vfw5phq7urvxeasr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCavRzKwAKCRAnX84Zoj2+
dppGAYDBq9uzCUjYevWaoABwgg1vPS6RvR6MgBFPzqMt86afKSz717Y8gDDqn5LY
mogZv+0BfRhlUc2h51JLsTs4GPaHhFpPMS3R3s00m+vZywIZKsACimScoRxHNQiU
7P13L2+NYA==
=M8WP
-----END PGP SIGNATURE-----

--vfw5phq7urvxeasr--
