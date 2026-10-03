Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BEA12B94
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 00:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791074410; cv=pass; b=fE96ZFc1TYuBL+dUaaqy/ht7ppdJXhKzbE3yQ7QVDeUT+JAv+naPmse/BlXkrJ7y5MPTmUp/G1yrNiis+v9kcMmlGvJlMiXkZLKF9NfjZqRlZXYlKZcPvXOkpDztDCJBfgJwCTCTPw5EcvijnmaVu+h/QPgPISGqv9YS1F56Gj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791074410; c=relaxed/simple;
	bh=Aq+EWoo54hhJrMF3BgGO21dIblZd7k8E8PMmngWgVXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SApy5kvo2US0aqh4O8vnDULDsFksmIeRS2qCeYuCCiNIoYQMZfVoO8HJ30Epu+DKomrvgjP6b7uHShBezTzFBpTMAjJIsAOjDnlRYDdwgXiTBWKKmEYoHp1W/SPMAo6YjJN47+qBo70Ker2ldkxi/enuCojxypih5S+0WIe1hb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=Ocb85Vbj; arc=pass smtp.client-ip=165.173.180.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="Ocb85Vbj"
ARC-Seal: i=1; a=rsa-sha256; t=1791074397; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JBqpN6LJfX6I9VBK8Te/0ahr2iuTMlgyNQByj3kVTc0d9r/xTSXzD/YOwKY9lSG0FP/0wTVPv8Y8qLL2w55AI4cx1nPQktY+CT9/V+zXInQ7RC3jCMP0vVaeoORKlFG5iciVYqtJJ+nI3oJ5fXFjXW/Jg5mJiWLsJsjECZGtpyc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791074397; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Aq+EWoo54hhJrMF3BgGO21dIblZd7k8E8PMmngWgVXs=; 
	b=RmBc7Bt6krpuhu5DFup+nMoiiJt0hDFIVrDzN1artjfhx3wkuOugUAJT4nRqWtmZic0AowtOSjcHPWGM1tE3uGzrdQUnHE0YhJ0zDWeTTqBEcH/dEq5wDHLy3Tc+0lKSw5hh121EgiD1ze/MIJ2arF9pz+iTbyMTbu/ogsOoxL4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791074397;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Aq+EWoo54hhJrMF3BgGO21dIblZd7k8E8PMmngWgVXs=;
	b=Ocb85Vbjw9OAhQgO9BMpb0UDPNsJBACgjmU6cxtPIQuxqm8uvyDneQjcZGaBgSd1
	yDjhV3vSPLTbqG1/FkyHv2pZIdIN1gF2YsUxxo6QcL8S07dgCleGu5xxRD5ldaLGBBM
	DuLTf4E39tPgdsAZaeVwGm7BJ3oqsctn2aGP91P0=
Received: by smtp.zohomail.com with SMTPS id 1791074397046702.41597560604;
	Sat, 3 Oct 2026 17:39:57 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 4F4EF180094; Sat, 03 Oct 2026 20:51:50 +0200 (CEST)
Date: Sat, 3 Oct 2026 20:51:50 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Shawn Lin <shawn.lin@rock-chips.com>, Andy Yan <andyshrk@163.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailmap: update entry for Andy Yan
Message-ID: <asFNukfzX4p0LKfJ@venus>
References: <20260924105052.768760-1-andyshrk@163.com>
 <0c542580-7da3-4cf8-ab0e-9e513842a556@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="krjpxdfdtl4jyak5"
Content-Disposition: inline
In-Reply-To: <0c542580-7da3-4cf8-ab0e-9e513842a556@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/291.65.46
X-ZohoMailClient: External


--krjpxdfdtl4jyak5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] mailmap: update entry for Andy Yan
MIME-Version: 1.0

Hello Shawn & Andy,

On Fri, Oct 02, 2026 at 06:09:11PM +0800, Shawn Lin wrote:
> =E5=9C=A8 2026/09/24 =E6=98=9F=E6=9C=9F=E5=9B=9B 18:50, Andy Yan =E5=86=
=99=E9=81=93:
> > I will use andyshrk@163.com for future review and discussion.
>=20
> Since your rockchip work email is not receiving emails properly, I would
> appreciate it if this patch could be merged as soon as possible.
>=20
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

You should also update MAINTAINERS to list the new address and/or
add some new Rockchip persons.

Greetings,

-- Sebastian

--krjpxdfdtl4jyak5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrBTsEACgkQ2O7X88g7
+poRhA//d9xG4wj1DYYc+fShTYjY2Ny8/eYh5ANBEjuxjKJn6RvWIVFuFOpxyb/g
Bxpb0zH7/1JR+J2PmL4erdD/p2J5EsG/JwJus1C3IeX0ZpSe8eJ6Hvg5w6AwdKjf
M/9TgdkoZRmQ2yAzOUG//cBAu20avhlkuXKTwQb5W8aH5Nfau4JDI18pUw/JOuDz
AzM7zFRD003f5S1TBFmMbJXyAijnZ+DL1xqgSlIIh2yxvF93CDbFWDx1iyFcBTSj
NSmLxbUZptXREvjiWGzA5DtZdvQmZUB69zGfKaqJT5BAcDGTd17KOnXmWfHZ6z99
YSJ482oUj2cqBoAykqokP9yvORYnNfcHuBPzbM21wo5ptnUinF7KOBc/MGGTR8qj
8ttg+LAJpGtW9cnml6NRRFvaifYUu3wHbHQAhWWmGijQHyLe5/aP7LO8C+5BqGbK
cGBhRERSAJLdfCbbTxhSmtdSOs8E6xu6YV9CPQyvps5w6eKeGkwbWehrid20xRq2
PTe4GexXCJ4rONbZiUUOAt/vapeMTkfd7G96rBufCTAMnaVVvjdxltCNP3298MDU
aWw0VVeTDSOKTiRp56kz0BMzIAG8SrhXmvj8B9/HtN4C+N7IKCkq/uql+PgMzFS6
TQ8xrMbsZAZ0QjCxdKS6xrQxQx3GmE43kLHg3/zIWVV7waVrVDQ=
=e6Dj
-----END PGP SIGNATURE-----

--krjpxdfdtl4jyak5--
