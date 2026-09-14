Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EBB33260B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367961; cv=none; b=QKrckWSPp9oCf0Jn2nchmPvTFuoeD917LVEiPXSXTIdZMEC7xhPZskxCX2GLY0nyM/W+503JzjQZN3qcoVzs2efwwN7tbWPVvFKBD5xxGX4ZlvT6YCH5rROTjb8zdF+o+2UvKt/TnB33WlKPhY//cMEXX+c+V9DYTA7jXTOVW5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367961; c=relaxed/simple;
	bh=VOkZzQnASceULlIHJmNILmMFsL5FLqoMtxt3SLlpOI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXF7xJ9TaZKUD4iHZzRpY3DsPfcWVPR6SrkHbut062L9ghkwKxVeNdTqga33yeiIRL7XmwQvoyxyWKgjoEJ6aD+c5X/pcDbg3kt7u68X6jMPCSjAdPjppcQRX5suG7Lg04TnTex/sxn55KrI3wK/IzmcaDZeDZyzKrUeMXDgR38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fvKx4Tdt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fvKx4Tdt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/cVM
	/IDDOzikhcJupTR3xSZvZ74pj/xcauelMyq7BK8=; b=fvKx4Tdt6wkypmlKv94g
	Xz+t3QekiiAyGbprOzHK7h/VG6xjY/y2ncyQtg6VHdRscDvFHqa9qOrfmUa+b5vp
	diD+A9/tctRGeLe7B5rz+58KJdaGZ+eyzMIwDpOozTeL61Zzu1HklHR6TPvVR3S6
	1/zhah2Qy97R61Z7068BMhrAAgRad74YKxTeX//N14/kdfi5n4O1uyyoZtAuUQYp
	4RphxIqMbrZLy0j1BTMOk/WeHyNXluLVSd/4af4FnUlGzJtpK4DQ15ZWUV7W2i0r
	2UuQp+8MgEPcQgSWx2rSsMfRFWmLrCeOtmBtmiYF24FkFllETVg1C2miMsog39Ne
	Iw==
Received: (qmail 624259 invoked from network); 14 Sep 2026 08:39:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Sep 2026 08:39:13 +0200
X-UD-Smtp-Session: l3s3148p1@g84/sWtbRt8ujnvr
Date: Mon, 14 Sep 2026 08:39:13 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 2/4] clocksource/drivers: Add support for the Renesas
 RZ/N1 timers
Message-ID: <aqeWkVB4SWuD4_tB@ninjato>
References: <20260911150456.893761-1-herve.codina@bootlin.com>
 <20260911150456.893761-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vg9j45dWTZVADX+/"
Content-Disposition: inline
In-Reply-To: <20260911150456.893761-3-herve.codina@bootlin.com>

--vg9j45dWTZVADX+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 05:04:53PM +0200, Herve Codina (Schneider Electric)=
 wrote:
> The Renesas RZ/N1 timer block controller is the controller in charge of
> timers available in the Renesas RZ/N1 SoCs family.
>=20
> This controller handles 8 timers:
>   - 6 16-bit timers
>   - 2 32-bit timers
>=20
> Each timer has its own interrupt, its own prescaler that can be used to
> divide the clock by 25 and all of them can work in either one-shot or
> periodic mode.
>=20
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

Still dunno how much this helps ;) But I successfully ran
'inconsistency-check', 'nanosleep', and 'clocksource-switch' from the
kernel selftest on my N1D board.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--vg9j45dWTZVADX+/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqnlpEACgkQFA3kzBSg
KbYmWA/+Iqdg4qP7EVRCDJZzz/wSJU8TVoeSBllxmjwRIqDBwSWBGtut18a1YdyK
IMGEb59ercftpj4zCobECG0dj2/SKHgQaJsoXIZzFK/UrkwHqWMhW0zWcnRfMvNQ
NZ9T4WQQeCngC5mxLWgLX5KElefwQ2qXu8pO/Wdo9F5YKmkli2NJ2yOpLdl9CxS1
p+0N5OCfG7bnM5d11cq7CJ6PdR+2UmW2/ublmEh7yexjvxhklVs+r1ILTpnmUrHL
2eR32D5r1C5p/9F+KPcDIjtgLigYG4DdcXGAsAMf0CzBJzGohWQaSe5we+g47eGy
+w81565pNwWQsfFi+mpFKp0nEOmzomFhZP9jWk9l9JuvHt60p4a7L5oI+i/FTQuY
OgHN5kQXz6zSyIY57l9lwU2rfF5/DPOwsLbPsKA2d7Zv1FSgHfEKwUTXsI19B/ve
npn0lL2iHuydkp/etNZDCHRfBpPTxBuzqAIO2kbmGnmmd+j1vFfHSBoSKyTO5A+K
X9zP4WV3VsBi80GhRduTHkgCOvHEoYDwF2uuHIUVpu+XVM6awj3uYJSmQZNJxgKl
/YjOKpX2Axip9dgY9izAwLrcCfff33jawLTBFD4Ld9SpYqDsgeNFtSjiOTJ47Pso
VmXVTgihYwciDzKZjhkEmkzYHEyJWuCxkZZiPGmWuALUv6EWPm8=
=9yXe
-----END PGP SIGNATURE-----

--vg9j45dWTZVADX+/--
