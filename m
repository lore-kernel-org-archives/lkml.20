Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794166181;
	b=K6/R37q6szI+rmss9c+KCZ835IEAv8yVQkR7JNHS0R/cRzkd9E5ppzn5h+/1UFi0PU/y
	 BhqH7OA/KicVkZArg25iWXXS50pJbwCtlY/HLVbo879Ji9IWGkwKFvoPLnFQIGVSn3NuP
	 cOkgD7UTBp3ayg81fjuzjL9stBl3DwY9WMCD/vxnskg0d+dmdq/98EmpnItHipAODuUp0
	 EI/hUi6/b9uQzj898Q+2oizGwxJ4rJi3DoBALjaJzTmHPCfTbF6qZf5LEiQjal/6QuIKz
	 tJIyqLsmMwR59G5cWWaFGjmIsnJPc0/U8OxFYAHaFi4ICnSRsr43vi6/ob1WzJSl0nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166181;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=lCDxPZTEu1aBLcrMc+NyYSEE+fukHLmARoE4t3v2YSU=;
	b=uy03uk/uYfK967Jpi+ViF4n6kiIYUmoCxzbH0O2R/1rBMMwQBmzfq9yxkGQ0y63MWGVV
	 JPKHu1Rwxo40f+oaFmJDf6/6jzUHmimN726XbESJHZzyw/OO18TliduH2JwzjzG8/lEUr
	 QdGn/PUkBHTZoFXLA3tB7WTeRfrn5B7nnxrt82cSQ+Lce8EPpcQR26bg8h6Y2vvKREFIZ
	 +Z3T1FaNkp7rErgC/Bc0JnE6+bFCMT7HKl2/5XG+xfwjY+Z8MLlwb0mQHhejoNJ4dbY20
	 +RFe7wDxO0Kh9pqUVNyZCZC2X31v2B24jmiKuYWStM2ngQBmREDj4KToR8rvNKWFkcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=hvROlOR1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35493606A33A;
	Sun,  8 Nov 2026 19:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35493606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=hvROlOR1
ARC-Seal: i=1; a=rsa-sha256; t=1794166162; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V8FGTqUAcI/+f+ZmpjgeoHQv9yS5Gd4q/pSD/sOyZ99hZ4wNBW2y8FI5nqqCo7Y8f6QXFdga58O+nkYF78A+s97QN2PTeVsLsG/HBDke0EWkitmHsn6nQYJVzVGK2FbsB+lBgu4p8kRkAbbz1WZ8f8u71vxfAypGtLnmfRIYZnw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794166162; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lCDxPZTEu1aBLcrMc+NyYSEE+fukHLmARoE4t3v2YSU=; 
	b=jWa89DpvHtLWuGTJcczwDrGgyYga51fkr/pHFnhh+SDRlXPGAQ6mwiLl6MD48+9GDclCN6lu1lkMDrEGgFVWWCrJJggrtzo4IAyVYIn+X1mfkCPqv29cACZTDLqyN9hNBBrGTxmRjY9jnr2hijkX8zJPziFJdXmqbLRR9996+B0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=hvROlOR13AqEOLRkERFPuGYm0ivXmPtRN4WyJmYNo49Suz3E44kyeuaYKoIMFPeUdHmoiM+6qmdGCzA1fKPYNrCCsL+mE49jCnUfEWRn6tj4JMHxpAf6qU/UGs2gc2n0TTCEYrrON+ASiLp39ikdGbqpmC1QNakZl7pgYdyT7/A=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=lCDxPZTEu1aBLcrMc+NyYSEE+fukHLmARoE4t3v2YSU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794166160289388.0259815442704;
	Sun, 8 Nov 2026 11:29:20 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 87D37180269; Sun, 08 Nov 2026 20:29:15 +0100 (CET)
Date: Sun, 8 Nov 2026 20:29:15 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 2/5] arm64: dts: rockchip: Enable NPU on RK3588 EVB1
Message-ID: <avDLdgR6gXOrEmNN@venus>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
 <20261106-rk3588-evb1-dt-updates-v1-2-bdbe16223589@collabora.com>
 <f5edf258-4b6d-416a-9b27-efa47be8d91a@rock-chips.com>
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
	protocol="application/pgp-signature"; boundary="ltpqvdvrdd3b7xzx"
Content-Disposition: inline
In-Reply-To: <f5edf258-4b6d-416a-9b27-efa47be8d91a@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.158.93
X-ZohoMailClient: External


--ltpqvdvrdd3b7xzx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] arm64: dts: rockchip: Enable NPU on RK3588 EVB1
MIME-Version: 1.0

Hi,

On Sun, Nov 08, 2026 at 10:03:05AM +0800, Chaoyi Chen wrote:
> On 11/7/2026 5:57 AM, Sebastian Reichel wrote:
> > Also enable the NPU on the RK3588 EVB1, which is very similar to
> > the QuartzPro64.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
>=20
> I remember there was already a similar patch before?
> Maybe I got something wrong.

TBH I haven't checked before sending this, but did now and there
doesn't seem to be anything:

https://lore.kernel.org/all/?q=3Dfile=3Darch%2Farm64%2Fboot%2Fdts%2Frockchi=
p%2Frk3588-evb1-v10.dts

Greetings,

-- Sebastian

>=20
> Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> >  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 34 ++++++++++++++++=
++++++++
> >  1 file changed, 34 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/ar=
m64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > index 87e624d1e094..6476d9e3be6f 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > @@ -578,6 +578,10 @@ &pd_gpu {
> >  	domain-supply =3D <&vdd_gpu_s0>;
> >  };
> > =20
> > +&pd_npu {
> > +	domain-supply =3D <&vdd_npu_s0>;
> > +};
> > +
> >  &pd_rkvdec0 {
> >  	domain-supply =3D <&vdd_vdenc_s0>;
> >  };
> > @@ -703,6 +707,36 @@ &pwm2 {
> >  	status =3D "okay";
> >  };
> > =20
> > +&rknn_core_0 {
> > +	npu-supply =3D <&vdd_npu_s0>;
> > +	sram-supply =3D <&vdd_npu_mem_s0>;
> > +	status =3D "okay";
> > +};
> > +
> > +&rknn_core_1 {
> > +	npu-supply =3D <&vdd_npu_s0>;
> > +	sram-supply =3D <&vdd_npu_mem_s0>;
> > +	status =3D "okay";
> > +};
> > +
> > +&rknn_core_2 {
> > +	npu-supply =3D <&vdd_npu_s0>;
> > +	sram-supply =3D <&vdd_npu_mem_s0>;
> > +	status =3D "okay";
> > +};
> > +
> > +&rknn_mmu_0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&rknn_mmu_1 {
> > +	status =3D "okay";
> > +};
> > +
> > +&rknn_mmu_2 {
> > +	status =3D "okay";
> > +};
> > +
> >  &saradc {
> >  	vref-supply =3D <&vcc_1v8_s0>;
> >  	status =3D "okay";
> >=20
>=20
> --=20
> Best,=20
> Chaoyi
>=20
>=20

--ltpqvdvrdd3b7xzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrwzYUACgkQ2O7X88g7
+pp04g//fKTIvlVT+DlDCI7Qr2N7lNt+yTY4h8ufwxQQBKfUj1u0tZ29xqVnqf3C
iFACZfowhn3mTHk7TtdLAqMRsWfBcVP+8mJ9qzPhMlhF346DlJXRoWaZ6HBytAj/
7g8iSfjOU/4ZmOLS8Zvp7ynHWQcHz8znZo5kPJ+kjE+iy0cgVzmMNtIH4RotqElZ
D4GN7E64WWgcFDNHaUvJOoh6nvdSSQ7Y9izzkt/BgmpLRyKjZw2evdbZAUcEhHjP
0Jyf5kx4m5Ao4JuyOpP+qut1xMenr9HU2lv4Ghvk7XcBJzmTTWJTpdb0NR0RjyaN
nfLiww+5tXTH0vBq7yrXm4uHtUaEm0BkrWPTPmjx00sXGenFXQot/oNZy6UtsjLa
7w4rg92AFQeZaP5Ucv0Ky2wAAN3DOI4fVZbvLs1DNA9DDrBTy5OEEIPMRC9nXN6d
nVEbdWILwRgOkpneagUH5bxd81Kcanur6Uj4Y12DlQvmty1XV1KZ9yfEMi4VSDYh
f+KqVISO8PzkLtewOnaynu0O00zHN2qlWSCq37r7apJWGKmvYiKz609jpVdF/eGU
CAesKz42tx6MNUUE6EDyY63e/8PUTQa+MIf/0Gb3xUIgTljdviyQhr9XUWRV2j60
Zn6pKaZAMFMtBdUgx5ffPstxyCuuucs4qgQ5t5nnttTQHEcNzFM=
=EWuj
-----END PGP SIGNATURE-----

--ltpqvdvrdd3b7xzx--
