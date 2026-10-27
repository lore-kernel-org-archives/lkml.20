Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793062425;
	b=jlFxkNii3jvmb8NNQFbxnYFoTCs4ikjUAVt2oB/Aa8dLGtI2WI9uGbA9/uksLvfCfO9q
	 oT+XcFkltQGQgvsi3gVkUoxHKM5fc285AMx77MmnnzKaR2cgqOza3h0u14giy6jEW00JR
	 4TJXp7efgw0rKP5AdYYza4sQkzEGHNkOC7rFKhGAudljbox6I/GqYDrJ3gCO6gpW5G1js
	 50SleV+oOhFEIWZqPKS2xlNOov5jDY+N+glfGr/hnFWHWWIAvONfAt0/yHHM0Bn0dppbo
	 4jYTosZ2lSRBTV3uSRyH6b7eHqyZTV7UzzPXUMtKG18ODVaSYYwz1i4x1vqmtd7k92g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793062425;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=LV3nvll6ocea2pGpXpqxwrvIE5cHIXvRNjAOQNo/YIg=;
	b=Xlen5tCRRD0ksNHwRFVW7Jt5s/HoRQYG/s/aGRKa1TIQNfgQTn9teTO/4+nGmaDgCcPi
	 7PfXZYpVwlkkbJaVUj96qvWDA9aXqZNq+Ht/RibxrKi/W5dNIjE7vfXQJXmi3hKlZamPO
	 yhYV0c3Bv8CSD5lFzIQmXDDpbuK6AO4uuKnlxEdA18ZmPclbaiuNuQJb2M+F9S3TXSEy9
	 T574wid1vlhJjdVi7XsMIqJI4x/BwA6+yRN6t1UFA6aJiuodnehPnXQqoD3Su09xkCHfB
	 txOOvLgN1BllffIre2mngjic0PI9FykzW5KCBeCUPcjR8Orb3Xc//kHekTLFd2rxIeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=sebastian.reichel@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=RDkvC6IQ;
	arc=fail smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F388D606A31D;
	Tue, 27 Oct 2026 00:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F388D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=RDkvC6IQ
ARC-Seal: i=1; a=rsa-sha256; t=1793062412; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dFuocb8ycShV2gsV34w7258uQ0k75T0RaMI6aAP4Tbd6IF1AJuYMCpeGE1dfXN4OHD9+o2ekNutwCEpk/1oIT4pLiVIMM6j2leMpsxsonhU5/1EZ2s7EXZsAfjQvX258MYkftXDcUrWv4jCKL3vZvOpaA9pumPd+fQExAk79Ves=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793062412; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LV3nvll6ocea2pGpXpqxwrvIE5cHIXvRNjAOQNo/YIg=; 
	b=DKod82D6tBqEcaTfeDeSwyoGDq35Ln6yZw2Sq3zOMtdPuQ/kvCPtQYTR0h5Ao/3XBbWE4D/58GcQHyZnTZxbCPrw6tC9oVAOLe8GcvN7YobVNQUI1jsKqRVe0WFeCPHVCZTtWq4U1j5cF15g0OBQ5uYos649kakx1b2A80Vuars=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1793062412;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=LV3nvll6ocea2pGpXpqxwrvIE5cHIXvRNjAOQNo/YIg=;
	b=RDkvC6IQ07UUiLpy6XnwY3M3znvIF9a8+hBlf+JMzHy5J6C6/h6ylG+cQKbjV6fA
	rpTL7v2LlSvfyeCXdng0Ev159CXq1EktSTOqKNBqhDgn8iVV7uG+/hy/F4ufRQ7EHWg
	cqewg9YJFdnwvqFx6vlsb73S0vn+M2OZ8dNY87ps=
Received: by smtp.zohomail.com with SMTPS id 1793062410582888.148462197187;
	Mon, 26 Oct 2026 17:53:30 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 2CDC71806C8; Tue, 27 Oct 2026 01:53:27 +0100 (CET)
Date: Tue, 27 Oct 2026 01:53:27 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] arm64: dts: rockchip: let TCPM own the USB-C VBUS
 on CM5-IO
Message-ID: <at_1n-ujVQIPUsMT@venus>
References: <20261024083942.148860-1-gahing@gahingwoo.com>
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
	protocol="application/pgp-signature"; boundary="sjwqdswbfmk7owwp"
Content-Disposition: inline
In-Reply-To: <20261024083942.148860-1-gahing@gahingwoo.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/293.40.76
X-ZohoMailClient: External


--sjwqdswbfmk7owwp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND] arm64: dts: rockchip: let TCPM own the USB-C VBUS
 on CM5-IO
MIME-Version: 1.0

Hi,

On Sat, Oct 24, 2026 at 09:39:42PM +1300, Jiaxing Hu wrote:
> vcc_5v0_typec0 is the switched VBUS of the USB-C port. It is the
> vbus-supply of the FUSB302, but also the phy-supply of u2phy0_otg.
> The PHY enables it at boot and keeps it on, so TCPM never sees
> vSafe0V and a sink partner stays in SRC_ATTACH_WAIT. A USB-C dock is
> not detected.
>=20
> Drop the phy-supply and leave VBUS to TCPM.
>=20
> Fixes: 44a48a23974b ("arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

> Resent with the lists on Cc. The first copy went to Heiko only.
>=20
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch=
/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
> index 5958b391e..72ca49ec3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
> @@ -306,7 +306,6 @@ &u2phy0 {
>  };
> =20
>  &u2phy0_otg {
> -	phy-supply =3D <&vcc_5v0_typec0>;
>  	status =3D "okay";
>  };
> =20
> --=20
> 2.43.0
>=20
>=20

--sjwqdswbfmk7owwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrf9f4ACgkQ2O7X88g7
+prMhg/8Cs9QKPoOyCygjstmCc2nf2HUBu1Gbm7UZAQpVYzVWe4PPR8YaBQsUUCP
GFHqoh1+1ODRX4cBXOzTa3ECuRYe7Ao05UnisBMTA2uvTF4eLDcjc1QG6MWJRDvy
B/etdI5+gc2IAcnGaOcHatcT9rA8zv4dSU5db++NptI+X6mAezeIUhFVZGqfPe2K
q59i2cK0kwUotfv7w2wzQXXqdZVfSqx18iLQnVzyB/CWnfynVpu9lmMk9o22ZVgd
05yGPj6F9pHdHeGLB+EsUr/qi7ddJVbOez3s0h6BRLqaUt8bjYjKcy9IXGOPtkYt
lWfL0z0f/e++u00ayMIYFpfvglX/fLuQygUqmJfwCF6fXXqnRi1kNbeH6QcuOVL0
3tbvCutae/GL1LbVzMq0Zqe83fAgHdC3IVYKwut+EGXHXkjT9jcy/OHFPttaXntj
NG041d99loG3M+xpPC11mZvGJQ7UfKXcSpHoTuJN4DBgceX0rzWXkFAv1yzo4f52
GJpRTQJ4388LqsNSW5g8yo29AYjrw/bT08vzNgZHwQC/xYvsStq8zsBiiVnPR+/t
TvXYzh4P+7JUjiGjT/EJulbd/gqzPzaqU7XlaarLutPjx55LQd6fgJYa2UJuM250
+c3Uw/63NhXLlUUog31hU4Vw2tRRjrjXBlW7RBZWMj6BavFAfvw=
=a9T6
-----END PGP SIGNATURE-----

--sjwqdswbfmk7owwp--
