Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292361;
	b=n69P6qwHOUBYzqDFVaRRK3jbmtm4rQsvAZ5bi6qoOkqvuqNT222byJBcIGcH8h1Tv7tr
	 pdGUTS81wdokXH2Ikf6kSes2ou9TeJUqOgRkUXTcYsLw2REGf7S+vZCLo3Xpfw+es0CtM
	 dMMaskU3/lXDVY3pjxnSIMepbRMaFYtKe4zLu22jyspBMJdQKDU/krudIcLeTfdA1QanA
	 s15D0PIbiOurAGvaxPCAvSL8JVGUA+CTj4i4rH3GZWtecHAj8FeWqnVIxgDd/wBy9eJyd
	 iPPiYmlRFs9bEnlWy8Hg8Bim+SW9N+dVlhLOrLp7qyA3Gr+FfH8++s2o9s9xs8fR3iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292361;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=nZobg63imVYIv+mdGLOiyJa1mctMNkupwiC5dcShlqg=;
	b=stfNUDjM2MJtF+crkr38hzyhM5t/83RGGFoy4x+unEucwdgReqCcORayTskkja2mHdvu
	 tl2VvIkmkwbociOfHXydQ933hGM1FWkF5F/dymxbwkkDTl1LHooCr3CrbQdoJJ8r4x/Au
	 CNEW0ltTZC3xIdoCAnCj7mIfsKGkIb3fYHxxbZCZP8SFK5ej1th8uHT0fX9iOiHNu/wT+
	 CbURE5mq8AQOnnED1pp+KA0Qbm0Cd9zaAqBHEs+4gvYprM06T6391pw0/ayX9O+r++x/l
	 ehavp1qdFPqLwtuwCmuEIIXBSZI/kBLCNLdCohFFlekhoUL04bIp6PsYd3BG3+eeBOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XB+cIuti;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19557606A31A;
	Thu, 29 Oct 2026 16:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XB+cIuti
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6827A1F01816;
	Thu, 29 Oct 2026 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793292360;
	bh=nZobg63imVYIv+mdGLOiyJa1mctMNkupwiC5dcShlqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XB+cIutiITO+BBlA/EjkQdBBp8dgQMzv2LMEQfAVnM7rd+OOJ/cHt6mL8ytggxO+w
	 m5pQZgRbjtpLWQePpTh2xIspS+LsjQRhzhLuWGDmZ9Zv+/WSkfi/UQa6FO0cturfIf
	 zmpV1uY5OvFT5qTVOJZ/8So0kb1eAettXkUmbhkDUCosCzSt7T8m4BiUmX2fGn1yJi
	 FKtlBZRJo/QM5rSx4/EIBXvzsOTwvHIERb01iabyQo9r8hyaapcsI57ZyY5ak/1xqw
	 4lqZEI7UbjHAyOy8xoa0hI3C3EpmwP8jxv/swgwi0GYjDitvjBxi61+GoCvjWBjpDc
	 JmAO95J5PWWEQ==
Date: Thu, 29 Oct 2026 16:45:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Kevin Wang <kevin.wang@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the amdgpu tree with the origin tree
Message-ID: <565f7ba0-613f-4957-9932-68462d3165c5@sirena.org.uk>
References: <auNVlhF6DGyFYx10@sirena.org.uk>
 <CADnq5_N=r+BDQbEo7EeX6oYMuBUe8QGNTz_QWSUHKZLZOC=GHg@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="eY+KrCp4X5mYoF9E"
Content-Disposition: inline
In-Reply-To: <CADnq5_N=r+BDQbEo7EeX6oYMuBUe8QGNTz_QWSUHKZLZOC=GHg@mail.gmail.com>
X-Cookie: I have a TINY BOWL in my HEAD


--eY+KrCp4X5mYoF9E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 10:24:43AM -0400, Alex Deucher wrote:
> On Thu, Oct 29, 2026 at 10:18=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:

> >         case PP_OD_EDIT_FAN_ZERO_RPM_STOP_TEMP:
> >                 od_table->OverDriveTable.FanZeroRpmStopTemp =3D
> >                                         boot_overdrive_table->OverDrive=
Table.FanZeroRpmStopTemp;
> >  +              od_table->OverDriveTable.FeatureCtrlMask |=3D BIT(PP_OD=
_FEATURE_ZERO_FAN_BIT);
>=20
> I believe this should be dropped.  The FeatureCtrlMask updates are
> handled in smu_v14_0_2_od_edit_dpm_table() now.

I guess it'll get dropped from your tree in that case?  With all this
cherry picking noise I tend to assume that the amdgpu tree has the
indended state...

--eY+KrCp4X5mYoF9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrjeEQACgkQJNaLcl1U
h9C3agf7BSqsmnjUqXlB9Ug0rsi/SdXz+GKLvIBRssVgQwQBaHwaS8aIKc26A7pQ
ET6odPRjCPKhYR8I9hNef26mFzM6sN03/ks0VmsRksOIBcjheAPcyzaRlx1ebBsS
jS0dqrHRF/teaplIBhdWitbRNnV4j5mcoBGb8wg/PwJk0ePuCiCg2rS56juR6tZw
6xic+ZOKzTpKCCeXgqbITKnzOnWQ9eespClD+l3KRoCbh2bOrG5PBtUBFjz0DPJA
ZiyXROWxA84DiU38lCPfFEHMaE7jP3QZhiCeeTBKIeb/7JEGf0T4FiVQ+3Zdu4nz
g78uNKymxBwXt/SvFSJEE2eNN1J7jQ==
=y9NQ
-----END PGP SIGNATURE-----

--eY+KrCp4X5mYoF9E--
