Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB6851CF4E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078827; cv=none; b=RPA3Y3KdbI6pHJWXMbHq6XkPf9djTQ/y69KhGLAAaMGsZVTKdV2uzYpybfNM6DZQS97uZOwO88gOlhNRM/g1Lkjo5gGaLZ/A1TdP+tKdyatz5lc27+xqEJrSTsEgdfmJIT3E1Ao4GMEsjXWYUAnHqrZFLy+rKth+QyW2mvlVeSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078827; c=relaxed/simple;
	bh=7waXuublmZajWUNbYinRB2ryKPGa7T3b3CCFNbrGd80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ic5b4CN1bbtHaXGuQOB29FPP5z1uENW1PzR1YggkrQNXh2yOc/RTyDgCmcZ4IVJLqXteJ5MZE/3G24DCDWbJAv69tYM/qyjb1GTPNUF/IvKm4E0SZMNw/evNqHhGP8t4q2lUEmNgMaZnF6kGaJ/kLVvo4ZuuCB2q3sDCgOhM01s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PODb2EZL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fsH6yIID; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PODb2EZL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fsH6yIID"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FFZvZP2999154
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cqdRJU05uzH+XiuWI55mrxFR
	oovj01QpFE8EN6FfoOo=; b=PODb2EZLY4lYyT1bdPySNowRhS8dvzAZF25lYEPy
	pxO50TWHJYP0+MuIsClLDdWET/6alPQ8eBsSu8o1K344ZQzn93U8176X9su4HWYf
	6Q6/U4olyI/EDyPUpEkbHj7qNsE0JWzWhhmsYSRnGhNO8J0bAX29zRKeS81C9IgA
	kvNixOgHivAsiohznxDw62JZtKSnU+xuOV/qk+ISHzNiEIr2CzmP+ycABRZ8PQjc
	TXwjvV/aS/0VKhygZyzHywoavy3Ywui8/TYzhBGCNcskZa+hVIxbFJ8mi9W8NpJB
	8HZOldGZEe+chwzC9Ui6NwJqXcIHxYV4rR7ZNOy9ZDTIyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm1qj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:40:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc359d9easo898223985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792078814; x=1792683614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cqdRJU05uzH+XiuWI55mrxFRoovj01QpFE8EN6FfoOo=;
        b=fsH6yIIDIRRk0IwmfcKKzj0QSxmw8nGiPbIibj5tRd/yp3sqCnxj0SGzAC3CZ0UzLX
         GdifymAZz6qIEyM9OM6zGhjqjrwZdUZD7LkU2SaaiHxSrOwc2V0Fud7o8+NudY4r3eco
         29ZXBAGyCPogkq8Ub1Noo3q6LrIErN586/ZbkQtwY6Me+zAvNE0ZPdrelzDIKOXu+Sju
         FcxQD0/bXSusotPDmkLpkvcgCpRWSNNtCeaKIo5m2KSdBokGkFr9KOvuXAArREyFT8jw
         rUnV2kDJ2oe1aDUfm42lHf8vK//C7Qh4I5QrC4xIDMCVMPOI5YrWW2Yj+Lio2ApgC2Au
         LRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078814; x=1792683614;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqdRJU05uzH+XiuWI55mrxFRoovj01QpFE8EN6FfoOo=;
        b=D/QF8LDF+j6sIsZyDwSrlRt2xUkaJzTTsHunwNXjITw3FEW3fZL8wYnIc2PkpMmVwD
         Lz+T2FjSE0CjE0DERIQam7fWXXMOv7BYe9kgm+hRXmgJ1eyFzTC5oyXwTof0PuafW4mE
         sI4UvAId9mU39YFhHzfDHSvoXXutpSkUsOQ08MbMe5ebDP3Ttntzar70338IUj59mVQG
         UX5t+yHlsg+H8K5cUvCzChQzLb49olxJO7tS+26Ya2bpRkn4Q2IUgrBVMKxezjsOViZ1
         IgRcFbR62geT1hol/o+GB1yCB+AI+Q4iLAmMqc3nuVi7jiRDeUhuNBqoubTSobB3AJQn
         QJuQ==
X-Forwarded-Encrypted: i=1; AKwUvByDPKy0rBPLKNjsZYVxyj5GotCukz9mUycMMWuDSIVoo9E7Ni8PIS7YENF8Mp9DupCpXK0biKk+/WXxekc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+cprHQvUvH8g0zAUZ39U8FxoylpI/IK9p9/Ajp8xmcki9fM3A
	f0jQenDDyZ57OYC5V6thR2zHr2Tq1iY/dYm5rOI8bZ1cjEBDMxcqUzM8pjcfDt6+15MasHD2vNU
	+r9MrP3kModvEXbbyDUrbHBnS6fQcvQuHVHFvkskTrGTa+PT5qx8vZfQ3bgGuKpbnYDw=
X-Gm-Gg: AYBFou3hF71bZk6PWeeAluOYu++tt0kUk40Hwa1L0tgIDbFUwllK8LIwY/fEjimtS+z
	/QPt1v31YrK0CGeQB/9DhhGrCAakIJIO+pVDrCBzwg6WUvy8dN0fofe8uLcyzh2X1wfs3Cg/d/X
	tPNSywY7WRiAraa/UTwHckYXxGSkGhCJ8StvKSS98JwmBI6h+xF76S8pY98HT3fJhCSxbhQCgyV
	NSHbj0s/hR7LiM91BTGwEC8A1XZU3nY3Cs5VoK7xIf53PseAjEmw7/Ck5vF3B9+Pj3JfyeMjBOR
	lu/zHIcnhtLBGW6ibkxRVTcRJABDm7jnVNVrMRwqqxds0KZ2KrAV0jVi77yYJg8x16h+AqX7EkK
	Jvqb3uTlWPLDv7g==
X-Received: by 2002:a05:620a:2996:b0:93e:fc4e:c48d with SMTP id af79cd13be357-93efc4ee847mr1283327485a.61.1792078812870;
        Thu, 15 Oct 2026 08:40:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2996:b0:93e:fc4e:c48d with SMTP id af79cd13be357-93efc4ee847mr1283320285a.61.1792078812212;
        Thu, 15 Oct 2026 08:40:12 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de72c7e36sm13446936f8f.37.2026.10.15.08.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:40:11 -0700 (PDT)
Date: Thu, 15 Oct 2026 17:40:10 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, hkallweit1@gmail.com,
        linux@armlinux.org.uk, Daniel Thompson <daniel@riscstar.com>,
        ansuelsmth@gmail.com, donggeunyoo.kernel@gmail.com,
        mohd.anwar@oss.qualcomm.com, devicetree@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: phy: qcom: qca808x: Add regulator
 management
Message-ID: <atDz2hJ6xpA3p5y7@lore-desk>
References: <20261015143849.483339-1-elder@riscstar.com>
 <20261015143849.483339-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c1VMVBPiTXwjJlRy"
Content-Disposition: inline
In-Reply-To: <20261015143849.483339-3-elder@riscstar.com>
X-Proofpoint-GUID: UaUp0jXiK00bMnZazGwGkDEdHt_cnefg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA2MiBTYWx0ZWRfX/SinFgR2zlbl
 kYi7aQifxHPHkfk9yxa/PehSkOlFdg006idGO8ISPDr6xvuq743e4oi3IcjXMl59jVPiZ1YZexP
 vgscLwU5znEYznXYWUTcoRGH/4ohew5ygZIqgJ5GiDV+tBWMVi6qydo8LVwirE4Y80btBGqHo17
 MvVWavCAV+ClOvZE3I30Rc1gRlKquxsP+qy/Z9CpJToE8+PxGaAZolIwNfW23sTLNhvIOXFZ/W2
 JluzrdkzrflLOxx78x7gqsJhFHtnszDH2wT9tf/0o6J5BX55RDsG5wREkkHgFf5TsCSmtNGGGTV
 b6h/uCoNgldAnsEJQaHwNNEdRqlOoniBHbybIWf1S6aC2X8y8eA16PNiNa9tiyM633AU1VaKQdN
 xelMfBRHDpsfqLBS5A68aTo4UMcu2TKQKWuCfDv8K0wL4qkKqXpqkMaRKQYkMiNErNFXMPK2ULy
 Zp3pMKhycJ6z9FZCTWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA2MiBTYWx0ZWRfXwMtOFGGd1W70
 HbwxB2Lr/l6C6SgSGnjB6i9jLINuPWXKOQRADW/v4ApSbbSIpI2LLj2488CCBfkWP6uMG3ZcOs4
 a+Ff4eqt3xlLiSAgEzwRPoG1FtbgoZY=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0f3df cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=ee_2aqc6AAAA:8
 a=npIIp4u2KQ0RR9fbO6MA:9 a=CjuIK1q_8ugA:10 a=GemZ_Bmu8yNwU_l5ZkMA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: UaUp0jXiK00bMnZazGwGkDEdHt_cnefg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150062

--c1VMVBPiTXwjJlRy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 15, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
>=20
> QCA8081 appears in embedded board designs paired with GPIO controlled
> regulators for its power rails. Add logic to allow these regulators to
> be turned on during a probe.
>=20
> In order to avoid the complexity of tracking state for suspend with and
> without WoL we take a tremendously simple "always-on" approach to
> regulator management, essentially relying on BMCR_PDOWN to conserve
> power when the phy device exists.
>=20
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Co-developed-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/net/phy/qcom/qca808x.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808=
x.c
> index bab26e4c61408..4aba513b9a512 100644
> --- a/drivers/net/phy/qcom/qca808x.c
> +++ b/drivers/net/phy/qcom/qca808x.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
> =20
>  #include <linux/phy.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/module.h>
> =20
>  #include "qcom.h"
> @@ -181,15 +182,43 @@ static void qca808x_fill_possible_interfaces(struct=
 phy_device *phydev)
>  		__set_bit(PHY_INTERFACE_MODE_2500BASEX, possible);
>  }
> =20
> +static int qca808x_power_on(struct phy_device *phydev)
> +{
> +	static const char * const regulator_names[] =3D {
> +		"avdd18", "vdd", "vdd18", "vdd125"
> +	};
> +	struct device *dev =3D &phydev->mdio.dev;
> +	u32 count =3D 0;
> +	int ret;
> +
> +	for (u32 i =3D 0; i < ARRAY_SIZE(regulator_names); i++) {
> +		ret =3D devm_regulator_get_enable_optional(dev, regulator_names[i]);
> +		if (!ret)
> +			count++;
> +		else if (ret !=3D -ENODEV)
> +			return ret;
> +	}
> +
> +	if (count)
> +		fsleep(phydev->mdio.reset_assert_delay);

nit: should we check reset_assert_delay field is actually set?

Regards,
Lorenzo

> +
> +	return 0;
> +}
> +
>  static int qca808x_probe(struct phy_device *phydev)
>  {
>  	struct device *dev =3D &phydev->mdio.dev;
>  	struct qca808x_priv *priv;
> +	int ret;
> =20
>  	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
> =20
> +	ret =3D qca808x_power_on(phydev);
> +	if (ret)
> +		return ret;
> +
>  	priv->led_polarity_mode =3D QCA808X_PHY_LED_UNSET;
> =20
>  	phydev->priv =3D priv;
> --=20
> 2.53.0
>=20

--c1VMVBPiTXwjJlRy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatDz2gAKCRA6cBh0uS2t
rMBrAP9e2j5pZwV3vEVm+CSoksFWsgFOQkKeWH9BCeqk59VLxQD+OrYhknLcVRGw
bj0XGtqkWwhCO/bVeB9VeozfislTtQc=
=upuH
-----END PGP SIGNATURE-----

--c1VMVBPiTXwjJlRy--
