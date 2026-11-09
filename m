Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794246709;
	b=OyNFcXYFfw0h7+H9C1aC+EImYkbdYItT8IJyJJeI0f9wkDb3Hc+CIxZADn1Uo7Ynz9mq
	 v4qEwj6SCNiLukWcSEY42vvH2sltUXTYPjA9mQwHQVPwRRRPN/kDfjjIjTFbJR4I6s/iP
	 qna1nu6oiiALei6A1C5X4uMjGfLmGyYp4LjAzbAGez856YZZlUgcH1ujBYLByUx4j/2y9
	 a7e91ilgWJz03XcvlyM/pLTJclI1Ri/hFQU0UBAsVKHVWqQoQ9d+GwA5y4WR0GNgggBNz
	 wtoNCwu6mvyIk5PPfqObvxixUSCUBGo03xQpdoWFK3fFLFs9Xyeg657jstT4BGpwdQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246709;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=8wat53Psvud3JS3sFezrDUXTpsr4pX7AT/AN9ixBrd4=;
	b=O7JQW3mHGT1B+MtOAiaLl8uZXtJD9GSFHYBUqm8OraEUE4gOjKLP6JLrhv4x0YiZrx6l
	 +ENKvH7iDlhhaLhc4SiMkbqwaDjHMrsMhUPVgwJwzxORy8RhU/zPTm59i97CjKNR+Tlql
	 gP/pQWvtX+0lHop7h06zRN42dFpj/43Z3pajzi5kBioz4YahVe3keGp795dlFulgvLsUk
	 HPFoFbSVBzqnt+tt2Qsw+bl829Az+WKmMztB8Tf+LPbgc7ckAdrB4Lm6NMnT/D3mDOUnb
	 D7xyE54hLNl9sq2eNvsUHqO5knr+2ztwpUWKCRWOBMHvuSc1glC1wVKsERyKGTGPerw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=D8F6Efrj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA31606A325;
	Mon,  9 Nov 2026 17:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBA31606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=D8F6Efrj
ARC-Seal: i=1; a=rsa-sha256; t=1794246681; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h7kpuxT8pWirPQ54VgpQtE9xL1PwEjNh19a0fQgoOmrEw+y5epd2g0IqZLkAYS3imi+RdSNW3ShNJpQJVvqpnVT0demBs89VLn44yLXUYQiZcbsXwsDveyxuoQ1hEIaMqDhy3XL3wdMzDxE26/GMlLPHsDQpiOAB1ZKNUf+X2mA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794246681; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8wat53Psvud3JS3sFezrDUXTpsr4pX7AT/AN9ixBrd4=; 
	b=Caa/WXxF1mB84C+AdYTUbscN/OshEYs/cpfRgpaQsqszd27WN0eKrWx1AUj02Oq4njov9oCGy0WB8h+hZNUK7jp5QXwug326f6TFdup8UyPbhwuApNfNDkUYjSyUJX17E3YofTZlEpb6Y63paRYI56WPp/vq9F6t19Sk3TKGe88=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=D8F6EfrjZCeUbWQJ9nYIIWJD7EzO9OQvAvbISMLaODm5ONzFKux3VuB5vr6aPTuXjFpL7hqsjus7GWxIMxfpm+8IFQPsyKm3mLSRL/t16qfdki/31bVSBjXZ2Z7JHKi+zoaNQNtZaP/yVPK0dLMjGFRVca2e8APfmqk1Elhbtmw=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=8wat53Psvud3JS3sFezrDUXTpsr4pX7AT/AN9ixBrd4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794246680680202.33766214015657;
	Mon, 9 Nov 2026 09:51:20 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id EC6BC180317; Mon, 09 Nov 2026 18:51:15 +0100 (CET)
Date: Mon, 9 Nov 2026 18:51:15 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
Message-ID: <avIEPncVnojQBqpX@venus>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
 <avDN3pPY5Qwt9B1p@venus>
 <b60b7079-b7b6-4d83-8167-2e4fc6021aae@rock-chips.com>
 <5573124.44csPzL39Z@diego>
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
	protocol="application/pgp-signature"; boundary="e6zrp2dlq4xzmy2v"
Content-Disposition: inline
In-Reply-To: <5573124.44csPzL39Z@diego>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.236.36
X-ZohoMailClient: External


--e6zrp2dlq4xzmy2v
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
MIME-Version: 1.0

Hi,

On Mon, Nov 09, 2026 at 02:26:44PM +0100, Heiko St=FCbner wrote:
> Am Montag, 9. November 2026, 02:31:35 Mitteleurop=E4ische Normalzeit schr=
ieb Chaoyi Chen:
> > Hi Sebastian,
> > On 11/9/2026 3:42 AM, Sebastian Reichel wrote:
> > > Hello Chaoyi,
> > >=20
> > > On Sun, Nov 08, 2026 at 11:15:09AM +0800, Chaoyi Chen wrote:
> > >> Hi Sebastian,
> > >>
> > >> On 11/7/2026 5:57 AM, Sebastian Reichel wrote:
> > >>> The RK3588 EVB1 comes with a W552793DBA-V10 Touchscreen/Display
> > >>> combination. It contains a Wanchanglong W552793BAA panel and a
> > >>> Goodix GT1158 touchscreen. This adds the DT description of it.
> > >>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > >>> ---
> > >>>  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 90 ++++++++++++=
++++++++++++
> > >>>  1 file changed, 90 insertions(+)
> > >>>
> > >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arc=
h/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > >>> index 6a95a8bb6fb8..327ca13b60f0 100644
> > >>> --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > >>> @@ -204,6 +204,15 @@ vcc12v_dcin: regulator-vcc12v-dcin {
> > >>>  		regulator-max-microvolt =3D <12000000>;
> > >>>  	};
> > >>> =20
> > >>
> > >> I seem unable to apply the patch to the latest linux-next tree.
> > >>
> > >> So I tried to resolve the conflict manually, but the actual
> > >> test screen did not display. I will look into this further.
> > >=20
> > > Strange. The base of this series was Heiko's for-next tree from
> > > Friday. No RK3588 EVB1 patches landed since then:
> > >=20
> > > https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.=
git/commit/?h=3Dfor-next&id=3Dcabb6811c38a46337d5f4252b4dc390f9296856c
> > >=20
> > > If your board uses the original Rockchip bootloader, which shows a
> > > Rockchip logo on the panel, you also need Cristian's latest YUV420
> > > patches that reset VOP2 at probe time avoiding some issues with the
> > > pre-initialized panel as a side effect. Those were recently applied
> > > by Heiko to the DRM tree, so testing on linux-next is indeed
> > > sensible.
> > >=20
> >=20
> > Hmm, the newest linux-next tag which I used is next-20261105, and Heiko=
's=20
> > tree last updated date is1106. I'll give it a try on Heiko's tree.
> >=20
> > And I'm using mainline U-Boot, which obtained from the latest nightly b=
uild:
> > https://gitlab.collabora.com/hardware-enablement/rockchip-3588/debian-i=
mage-recipes.
> >=20
> > The backlight working correctly, and the DCS command has been sent, but=
 nothing display.
> > Perhaps I should look elsewhere.
>=20
> I would assume it could be the SPLL (again).
>=20
> I.e. a recent u-boot change broke the SPL-based forced clock init and Jon=
as
> fixed that in [0]. Had the black display again recently too.
>=20
> And it seems it hasn't been merged yet.

Sounds reasonable. FWIW I only tested with the pre-flashed Rockchip
U-Boot (as described above). I intentionally keep that on my RK3588
EVB1, so that I can test RK3588 with vendor TF-A/U-Boot and upstream
or downstream kernel. All my other boards run upstream TF-A/U-Boot.

Greetings,

-- Sebastian

--e6zrp2dlq4xzmy2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmryCAwACgkQ2O7X88g7
+prfaRAAmlmXmWHu8bIULwz9sG0Yd8KbbbbewcRNaoeu3IOYhrlR5wn84GcoPcoO
cpdl+tlqxaQi3DMZf78qbZd1pn5Wf3rht7HJN8X6cYn2W17MKiTA1NDKZTM7Y10H
88ArpSU4xEFeXFKNabi8S6KQoatb1W3oPvswck4M6sIkq9JyR3bUXmwuf+9gOguA
pRQrsosvpKorzFJoxNiSvesfG27I3HlexIB532Xh8Rau1LZbor1d0qhBqbkLh7EJ
ivYC74fvrEtSXB3LX6ngAoWvaH4wvf2Ety9iJR2zZntB//NfpHNQR5E5ZWsD9Isf
pkmcSKFQwH8jPxZ0iECGdt2/HzccTz9/gCqGjxoxxMTqEqzZ667rlP6Du0yCJvjN
36UGVlxF36N017d/PZYhEqw1MivtkNZtCK3WrOibY8rQs8x7ddHkPq6H5lhcTHci
8jjlrKodpza3OjIXbiQmAhepZK4PMz5wX+bxpi9NUFvMgFo64zyGGr7cBUgtss9i
DPEt76MM4zOcwzjIMBA6Zl1lltrxpclppy6nD5v3FbKnfFUBlMUlT9jqz88By/al
NQJxK0RB2mCwyMUsZraj0sK1x/qaf1aHBuUtobIG0wwxIQp3Yx7M9jsiOjMt+QUZ
US31lSvdzuTP6GX3euj7gMUNihfoUt/P9H0+z9hkCNJS2ubvRoQ=
=gnl0
-----END PGP SIGNATURE-----

--e6zrp2dlq4xzmy2v--
