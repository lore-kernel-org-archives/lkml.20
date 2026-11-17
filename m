Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915282;
	b=WKOh5kKSCSy+dpIwB86XY/lKr0fa/pbVaswrpBUZO/92y8M/7Ly9wbauvJjcg30zaOkn
	 J+6w74AbX1cnDPDH0VGQDYqKIcuPnts7hIdbAYWcqX/NcSX5qCwHJPi3OTL2+Eo7xE5ut
	 jnmL8arATox9SAmdsa+Qr30xPxoj74Bd9FXxcPHQ8cObnzKqoqkqFj5tt6iT4u7tUEJ+5
	 TV/0AkFxSpUyICHYiY2Y4UUjrZfL4LtptG7Qy+iLNq0VawgmHL8mnmQhUn9qaGhrbDGL1
	 7VaLbFDG1fesxTBH3mx7Vucx4nG82TMLENjrnHI5jviVUBcGQwc231bTexKQ23TRFlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915282;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=dU6AYxqGJ8lH/GhgPco4xoKYsGMuZyQ09Hz+IUgud/Q=;
	b=biEieq6F3Vr3gwU4zwKewT2f3HAVQlNCHUpgaI7id0WNaxZUPXLtb6cXhGT3AnG1/Xzb
	 6l66/e1qINMR8L+Jn+RZYDrgZ2vFcbTfK8QoPbcbhQMUd9HRFqeGN9cFpyd8Ww/Vp3pLo
	 xj3D8P5qYAFtj3q/oQLE08VJnIvbrKM/7qB931qh4RPvnE96H3HZ0gxJ05C1b3wlDPzGu
	 A04lUl1suI5J+w9Y1Wfgh7fjH0M7EbMjP0OmrR83a63zvCX7rANOD7U1mugAWCPi5yIgy
	 XvQCkhDgPvwIh75eKpX0R25DPHUi5MqFDXlOgTx6hYh4LFzXFaoR3rTQiNyuGXm6P7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UchQ8asQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDD5606A31C;
	Tue, 17 Nov 2026 11:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UchQ8asQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B938A1F000C5;
	Tue, 17 Nov 2026 11:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794915281;
	bh=dU6AYxqGJ8lH/GhgPco4xoKYsGMuZyQ09Hz+IUgud/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UchQ8asQuCKu7vHV1U/v7QKUgWH76UF2rxPpZWw3tVH2cgImhghMsfT7iSRmfuEMw
	 abwx+YQ4oHoDFlp+dcYw2+aw4cKA3YYb8TqQBsvU/74GjJmhpTJENGcM58HwM36NWL
	 s09enbqIoJf9KPIxV69Sq8BFFOeMIe3cs/zHr4i8+fp4uJNYlNzvJdxshXWR15CiLJ
	 SEP0QxRkQi8RQnfZrAa0aS0Hd8PTYHnBa+a3thtaEdbzTJv8dX8zY1PYZ+ak345bDb
	 CM7bQ/A6Gk8+n9lRVMVF1eJgBKPR3Fhn8DENnnv6oTEtSrTH0Bm+jfi2afybXCivop
	 U4/j6SoufOM7Q==
Date: Tue, 17 Nov 2026 11:34:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Karthik S <karthik.s@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] ASoC: qcom: Add talos-lyra-evk audio support
Message-ID: <51d0c10e-a5f5-44b3-9dbd-90d5727e4751@sirena.org.uk>
References: <20261117110848.465407-1-karthik.s@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h1ZWgSPvCeY8xSxp"
Content-Disposition: inline
In-Reply-To: <20261117110848.465407-1-karthik.s@oss.qualcomm.com>
X-Cookie: Marriage, n.:


--h1ZWgSPvCeY8xSxp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 17, 2026 at 04:38:45PM +0530, Karthik S wrote:
> This series adds audio support for the talos-lyra-evk platform, which
> uses the MAX98091 codec over the Secondary MI2S interface for both
> playback and capture.

This doesn't apply against current code, please check and resend.

--h1ZWgSPvCeY8xSxp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr8O8kACgkQJNaLcl1U
h9Cawwf9Fzu5gxI/WvW79DbC+rMMDZ86M+3i1kMDA8rOGQlfBqF5+kNdB28NxtNA
eAPdZra2egkT6CiGAxVQv4A8iriJ+Kr4kGHsnyFymGKSR3BGO5GIPWnB5PzF/5Tq
ivtXSQpbFPMlWKGTqWbvx8QPTmz+I1RZRrRY9jXrhe0V+/zXmKmvNctlKhjp0ghM
Gt1oN0bpg4uB+CWrro4Pgg/XJJHN8D/KHM9cchJxOJdbU0JD53s7LGFu8Vc1UPSk
YYHup5DO2ln/sjbTNzzJMzBUyNMDmZiinbdyF2ilSOSnX5DFVHo5TKra/OUc9hIM
vQeuEDiT5qzSJai/mqgSqe+NyVNuZg==
=VTnW
-----END PGP SIGNATURE-----

--h1ZWgSPvCeY8xSxp--
