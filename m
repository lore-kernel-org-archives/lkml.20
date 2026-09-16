Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56D44854E0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594742; cv=none; b=oBx9X0lpn7k23tA+BiEqFeXDHNVwRlUPfYn0qxvUid1BWxZoXFPL3HQqff2pl7+qxik9Qy627zYvNI4QwhqBmIqGqawt/bqvQvHACQ6vZ8P7JVhHLGfeKS93o4jUHUs5yKxNRKzx+zpplH6Ra30f1cwNSQFxX88bCXc46vMq4uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594742; c=relaxed/simple;
	bh=lSgduupR6xa7uySg1Aoh/spKXyRooDB/5G5lFuyd/5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNftNNc3N06aXbT1Mp5UHeEWObNpe/URsc0lwXcN5UrCGcdkDVFPL95EYUL5uVbqsIv+UauXJf1FAa6NqOqc4Y6aPUGKNCHF7CyMua4CC8e2IDBGJMxM7S7WiDJDW4L2Vlwz0bPoaULzClSggJjWD/YxeJMaWE3jAnHZRqXcfok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XT8j8HUD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XT8j8HUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lSgd
	uupR6xa7uySg1Aoh/spKXyRooDB/5G5lFuyd/5A=; b=XT8j8HUD5dK/uFG8uM5N
	V1y/2svavloSYZAwOdTDwJj8IpqmGXvg0vx6BdNGnXJ2wx76+M2NWifIEs94UZRf
	JV3/5TLZaa6vB5KG5PP39Mn/iz/gDz/CEPY/TX+YpvEqaO3wVl9IXdWg3J8BxZYZ
	S7hjTQrPtBfDXXPLni/r+OWzOx7cEirLgTPspBnr1VGmLkN4Ps8OHjTmohWZKPyr
	tdk7upLrSDD6g/YNUsN6Im+fuT63ow15BmFP2q1em6Pb2wQrGTKPCvUbtZ9p7PUq
	ydsN0ICWbLL4ZLwTer8OGXlKXDAwTjCuzT+f5Df7MoubSaNNVSf/w5KFegDOH44J
	ag==
Received: (qmail 1717033 invoked from network); 16 Sep 2026 23:38:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Sep 2026 23:38:35 +0200
X-UD-Smtp-Session: l3s3148p1@Nv1KfaBberQujnt4
Date: Wed, 16 Sep 2026 23:38:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
Message-ID: <aqsMWn11lSgnNuVR@shikoro>
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
 <CAMuHMdXcU3Eebhb3aS2PFoUdZsK=cmU6sjAFWhMRiPB9eczKhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="00Ky2tk3oEUg2z1H"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXcU3Eebhb3aS2PFoUdZsK=cmU6sjAFWhMRiPB9eczKhw@mail.gmail.com>

--00Ky2tk3oEUg2z1H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> I have been using this since quite a while on R-Car X5H Ironhide:
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

So, this applies for patch 1 as well then?


--00Ky2tk3oEUg2z1H
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqrDFoACgkQFA3kzBSg
KbZR+A/+KnbyiBw7MWtJxSGJ3vYKcOI8TCnHLcqEzQZOSgJFI4ScierzbwAePTib
x2eVWhSWxgyqaeoaJqcgq3H2DfID+B+n3cpsT3B2iLYw1A58w2KwoBLyrM9KLZCO
/98IreflAaPNWN2xIXJ4szs4TN0srJkU5N1o75sHGCQVWwIuDD2b7ROertV7wFpB
Kdchih1oR7jjaXkQ4iFQcj7s4/fKoaNwiTdXRkY7/NvHw/7laXyF20aRbtWoYBu9
ncCQoPyoPaabgDUsbSVn2KYlV3LreCI7LXDN0mcKaeAjabcVKlf9cRu4rnnllfWT
eMRMDEgiDWPfZN1O99CysVkCFj48h3khorUh4NEsODc8hBrd7K6vJhnR9NFP098V
LvbfPNs0bmBRkpo8/J/im5SHwHjem5/IfJfU0nXQMIjnoKOtVDelY3y8OviUZ/Iy
4IJIpJEvx7DvXcpMSk3VH1FN/RiOFQdNyZIIK0e5DQN1zAS+RJwzmWNuFufVNDHt
P4ZybsbbPM1Munn6ldzr1xNFe2jiiHGfll3Z8QXFm1Mw79e4plgSpPCNtoIgSW5U
eb3apzaTwQwdXRLcPrxouWvAmX+6vOhMylLfvWQ0pOk0PACBj68GLkt4u9OapfkR
ZRgzcgJbfO1/9RZYgnes3anXPgOiY86/HDZfx1WLUxKTBSCK8Zo=
=Tp4T
-----END PGP SIGNATURE-----

--00Ky2tk3oEUg2z1H--
