Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5354A8A39
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820562; cv=pass; b=s5KYAl8qdvuGjSG12DsedS7jSqssdRmu+vy1CYn+t4idqLHFplm+vhQ/G04U4mGfRpSZ43RWm6bhiJuVGNJdgKcgzENU+SrCBmlFeaPVT2VzZqEp6m+iDLvyptTJuUXI+LVzYX5nUuM/2zBFr7CYKSkrE5J0wQNNlxWpS0vqtOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820562; c=relaxed/simple;
	bh=papDQ2BK9Hgi09DMMx3zK/DXGTb14uUZYc2cvSTwJIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdkPLYHSek9DXLB+/2NIYXhwYFT9ViOW56Vhz58RFzdCOZtTgj0ZGVR0YZtCB4MZntomxgSM8cHZBoVnh9PAup5ubnzMbb7Pbz6IpNPFZxgNPHh02Ou6WukbOL9Ltug2lSgQyEKA/ape1H4+cbwJC2tDmRZnDwX1fSDPLepeSq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=Mrw+GB2U; arc=pass smtp.client-ip=165.173.182.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="Mrw+GB2U"
ARC-Seal: i=1; a=rsa-sha256; t=1791820540; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e0m4+dphawrCJYI1PzvnAu3soR1RDDHOm+spJ1Gb3fFA/SZI4mExPjEQiQB0BJH3UjLe4iLHh75NjYayK5PkRpRCoOGXmEK0GJy5AC4TP3BtHucQrEa1qsJpVKrejYAXOGUnmj5U4ssLwjo6tL7tkw7go1a10OHr45KYAPpSu3Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791820540; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jm4TT1SDEo47VcBxb5lbPFVvIhs7zf4LP41tfx+zFRg=; 
	b=EKwdnLfqqxFrexpLuftxmRBJxWECPoM2NfvyFkOkq2vjB4tn/drqLFuir1r7FfOckZKt0296pD/eCK3M2XgDdXTJvien9FKMFwqwmERGMl1Zdt7oNmrt6+iC+Di7lPfMDjmoo1PYXdo3KYw77FVScF1TqjTznyFxzboLeelBzx0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791820540;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=jm4TT1SDEo47VcBxb5lbPFVvIhs7zf4LP41tfx+zFRg=;
	b=Mrw+GB2Uck3M6+56WAUV7aa17/WvYPw0JrSsyl0sgll8QClwRutdMCXEW0HOj0Jc
	sxVewap4LoAovmyc4Ao+8AHQte6Ggj/ZZg47hbxqG6KleVarRU25acgKKH6E3lSqB20
	XuCW3i0UAqFaBLiuU68jE5Mmg4mdTmtnq5HXTuzk=
Received: by smtp.zohomail.com with SMTPS id 179182053891231.867492227349658;
	Mon, 12 Oct 2026 08:55:38 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 9E8DC181C18; Mon, 12 Oct 2026 17:55:22 +0200 (CEST)
Date: Mon, 12 Oct 2026 17:55:22 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update my email address
Message-ID: <as0B960-TP8i3IYM@venus>
References: <20261010134705.2131-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p6rznh6fkmmlu3s7"
Content-Disposition: inline
In-Reply-To: <20261010134705.2131-1-andyshrk@163.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/291.809.33
X-ZohoMailClient: External


--p6rznh6fkmmlu3s7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MAINTAINERS: update my email address
MIME-Version: 1.0

Hi,

sending this to LKML without any extra receivers is almost the same
as sending it to /dev/null . I believe this should go through the
drm-misc tree ; so +cc Heiko, Cristian

On Sat, Oct 10, 2026 at 09:46:48PM +0800, Andy Yan wrote:
> Switch my contact address to andyshrk@163.com
>=20
> Signed-off-by: Andy Yan <andyshrk@163.com>
> ---

FWIW:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>=20
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f53047aa8d3c..17410260baa0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8575,7 +8575,7 @@ F:	Documentation/devicetree/bindings/display/panel/=
synaptics,r63353.yaml
>  F:	drivers/gpu/drm/panel/panel-synaptics-r63353.c
> =20
>  DRM DRIVER FOR SYNOPSYS DESIGNWARE DISPLAYPORT BRIDGE
> -M:	Andy Yan <andy.yan@rock-chips.com>
> +M:	Andy Yan <andyshrk@163.com>
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> @@ -8928,7 +8928,7 @@ F:	include/linux/platform_data/shmob_drm.h
>  DRM DRIVERS FOR ROCKCHIP
>  M:	Sandy Huang <hjc@rock-chips.com>
>  M:	Heiko St=FCbner <heiko@sntech.de>
> -M:	Andy Yan <andy.yan@rock-chips.com>
> +M:	Andy Yan <andyshrk@163.com>
>  L:	dri-devel@lists.freedesktop.org
>  L:	linux-rockchip@lists.infradead.org
>  S:	Maintained
> @@ -12883,7 +12883,7 @@ S:	Maintained
>  F:	drivers/power/supply/ip5xxx_power.c
> =20
>  INNOSILICON HDMI BRIDGE DRIVER
> -M:	Andy Yan <andy.yan@rock-chips.com>
> +M:	Andy Yan <andyshrk@163.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> ---
> base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
> branch: master
>=20
> --=20
> 2.43.0
>=20
>=20

--p6rznh6fkmmlu3s7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrNAuYACgkQ2O7X88g7
+ppp0A/+LJw+KoDf4/fyKhcO5ZFjEcr/nRYn2qZU+FYAl2BjMusqp2ICAzYhmxf8
YzW3oypMWCNGyKryTPF1mv41untbEVUTqNBFvTg7/Vf3LzQYLDTrz32ulyICUN8S
XM2OQbw0r0a6+CmjGIjzrb1CBDmPhs7A56V829r35dGdAln4+auRnrojOcgzN428
vpbao+7V6fYNWsj8MBScWnibX6Z7aGVe4si8KZ5I/x3CFDEjL7LNCMkuxHHYGUIt
2OJ+icDa9n4f29QrJ8EgHLK13FtlRbfhpun9MqsHwsZY4pd1MJ5jO4J8/JpSm1KT
i6AANe/sdRkMX3ZaaP0Y0qlo0qnGgD+Zp0ltZZB2Pz0RQOFaXueJ6bvN5jluwLX7
PSzd2a3Y1vKn+axm9isz/6MiKfJx8HItJqit11rssvpyIhBm8uNTE6jhnjooKZet
qRO9GViBvfUabiGVYydBPXN0msn+Cif3rJ0pP4qGOLL6O3qlSMbCjgv/gwvlsJou
qg8SlFprXWycUrGk6WWDAayINJHJVvM3UFenm/9dikowKVPKMJrBsz1NOfGVaebd
wuDQfbC9j9Bw1K1jvGmP/9kOOsn9S+xm/YobuvX+QRqvGcXZ3gcxvLmS4cKlwctY
ij75UU8h+969/Ckj2x/+BaD1wZN4Fg7wPkbgLllARctAqxGNJwY=
=+hHF
-----END PGP SIGNATURE-----

--p6rznh6fkmmlu3s7--
