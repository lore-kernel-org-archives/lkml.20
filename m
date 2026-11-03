Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793695494;
	b=L5auJ2pz/RxAdRRt7fBNt70ecrdb0thP6eGtVlUjz+DJLw0Hv9nj3XozW4XQomz4fuJN
	 m+RkrvZI2bDItX5ejCS7Tj74wZnwcw8A+h+TT3VbkPbe24Yy7L4qVHxrIGoX/dPBPWEsM
	 lqF0RuFsuvcSHTKRMym+HLcTXjehRGGEG2F9w9DRWNmA4x0irVVhMQHVQuvcCg6fYFqXH
	 IsDPMm1u2mr8aB0iX3xzcvEckMZ9FJbDmnSBZVzrp5esjm1dxF2oylvcskJ1vRa1WGJVm
	 C6uncpejlDf8MBBUUYna+zF+elp3L/DgF4BPGm0oethkuezm+JC98Z9tmNI409ZfovQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695494;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=H52bp3lerhcgmKry5JkDwar65iC1VQWKyNAm6iD1jYM=;
	b=AbA39ErJJrU4esr5C8UNTvig2NubT6/ENbxDeISXGEiEL1BbzCRJegB0ETJdYdQ3btfr
	 qAiuNOxioiRb58UfCKFdgcLHdru2LizB3b0s+1cpzc1lHZn3rWtae57RV2MUNOndM652O
	 XciZTdIEjfPCpCf4cRg3ocjbm3R9uD/h4+K/bKaNbvOiqGCjL1ak9dlHeggxeQazOnb61
	 HPHvVKIgYlo3QsFPUg5SW/tS0Dt8tM7uk86ZnpUN2rND64ibnLUILK1nqDDCGMExhjYFa
	 uXdR6n3jWEYirfL5kxJjl8yYvemrbZUU9OK1Eh/2izHH5MeSUZwFVWs1TxspeD4y3+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=IeyDigUw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198F3606A941;
	Tue,  3 Nov 2026 08:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 198F3606A941
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=IeyDigUw
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 66535200B28;
	Tue, 03 Nov 2026 09:44:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793695491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H52bp3lerhcgmKry5JkDwar65iC1VQWKyNAm6iD1jYM=;
	b=IeyDigUw+OpEeGuVX9BAYSzDf0nsf4CKe+Uzm4kQFKJdY/FRuNVY4lkeGZ7SqtZkcZDWMk
	KpvsB1xCLnWskb8e1izG/fzXkTQbxMKXKFbpeit0HjL+4+d9jjFWO4haXsZ7DifpH8K0f/
	0iio1wp+T0txV6YJXb0Iktlf6NdFOhc64KExJrBIKBf9H7ildaNGJnn6SGzdqYiRr6khrX
	CQFV8z/XOy0bnxBpv40PhMhuCicBq50NQI59jxqKi8GM6IPIweejJR2xSwygnfZWwNtFP7
	zLkWxRqd8nGGDezYOBeXkXIPwA+lb+aaMPfqJO2zme611gq4rRs9LoYZg5Pgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793695491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H52bp3lerhcgmKry5JkDwar65iC1VQWKyNAm6iD1jYM=;
	b=gPlTYWalJABj2uWFLM6kpbtwrkuKl3Wo5ySrON2oPuqNqEDxBS36qNvXjaZDdLajwfkYEY
	FcThQ/LbiI6Ma2uZuMgx4xbrkRrRjXXUsD+FiGyE2C2wkHj8p0ubuvzQNlRldVeHMABNqM
	WDwl4usYl4276taDuXEyMjvtIN7/Ox7Vh1fASZ0gB4+8LEWL9e2l4FKzlWctNk2kTTLezo
	xwdhOcYUV6RALiGQXWS5Qib5XK674nEhUPQRm9OSzVCH2XNDZylXBwusCO0f6BvwAxPYvn
	RLXuX0bpS6oqEuCNP/oCI6Oztx3jHv/Qx/mf9eq58pdTtShlpNzt3+CPy2JwjA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793695491; a=rsa-sha256;
	cv=none;
	b=PrgKr2unShSy60Wj6xn3w8Y4aMsywKH7l8tBosj4ihtl3H8o6Kfhdw/x/N3durWcSUa9L/
	ePVQQYP/fsa+eC0gHefhfYJdUjgm22P00NdVqnmi9U4Loh7JUXUIsNLeX2axbJBREP0SCA
	GQxVriFIvplCOTGeMW9B0m9K/izd3KfrC2dPBoaLCN/4gpD/cosAOjIny+HJ49cmfrfXoi
	hva6X55xraS3aBuM1QCF4v+skuNf9cOIQJdAvea14ZC7ID6ZH3k5BpvTF0iRVKJ79mhcKA
	GMzTOKAaeca6nobQn3Q9xHBCoaD0EUIfobwB7IkmbU1nSMNMOaJOTblMKF49hw==
Message-ID: <b717872c0f75e16980675d17a5fbbca91b9c8a3a.camel@pengutronix.de>
Subject: Re: [PATCH v5 2/3] phy: cix: Add CIX Sky1 USB3 PHY driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Hongliang Yang =?UTF-8?Q?=28=E6=9D=A8=E5=AE=8F=E4=BA=AE=29?=	
 <hongliang.yang@cixtech.com>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Gary Yang
 =?UTF-8?Q?=28=E6=9D=A8=E6=96=B0=E4=BC=9F=29?=	 <Gary.Yang@cixtech.com>,
 Fugang Duan =?UTF-8?Q?=28=E6=AE=B5=E5=AF=8C=E5=88=9A=29?=	
 <fugang.duan@cixtech.com>
Cc: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
 "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, cix-kernel-upstream
	 <cix-kernel-upstream@cixtech.com>, Conor Dooley <conor@kernel.org>
Date: Tue, 03 Nov 2026 09:44:51 +0100
In-Reply-To: <20261103074913.1971025-3-hongliang.yang@cixtech.com>
References: <20261103074913.1971025-1-hongliang.yang@cixtech.com>
	 <20261103074913.1971025-3-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Di, 2026-11-03 at 07:49 +0000, Hongliang Yang (=E6=9D=A8=E5=AE=8F=E4=BA=
=AE) wrote:
> Add PHY driver for the USB3 PHY found on CIX Sky1 SoCs. The driver
> handles initialization, reset, and clock management for the
> multi-port USB3 PHY.
>=20
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
> Reviewed-by: Conor Dooley <conor@kernel.org>
> ---
> v4 -> v5:
> - Documented the origin of the PHY initialization sequence.
> - Return -ENODEV instead of -EINVAL when the OF match data is missing.
> - Use dev_err_probe() when creating the child PHYs.
> - Dropped the unused dev_set_drvdata() call.
> - Guarded against underflow in sky1_u3phy_exit().
>  drivers/phy/Kconfig             |   1 +
>  drivers/phy/Makefile            |   1 +
>  drivers/phy/cix/Kconfig         |  20 ++
>  drivers/phy/cix/Makefile        |   6 +
>  drivers/phy/cix/phy-cix-usb3.c  | 418 ++++++++++++++++++++++++++++++++
>  drivers/phy/cix/phy-cix-usbdp.h | 289 ++++++++++++++++++++++
>  6 files changed, 735 insertions(+)
>  create mode 100644 drivers/phy/cix/Kconfig
>  create mode 100644 drivers/phy/cix/Makefile
>  create mode 100644 drivers/phy/cix/phy-cix-usb3.c
>  create mode 100644 drivers/phy/cix/phy-cix-usbdp.h
>=20
[...]
> diff --git a/drivers/phy/cix/phy-cix-usb3.c b/drivers/phy/cix/phy-cix-usb=
3.c
> new file mode 100644
> index 000000000000..4417506d4f6c
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-usb3.c
> @@ -0,0 +1,418 @@
[...]
> +static int cix_u3phy_probe(struct platform_device *pdev)
> +{
> +       struct cix_u3phy *u3phy;
> +       struct device *dev =3D &pdev->dev;
> +       struct phy_provider *phy_provider;
> +       struct device_node *np =3D dev->of_node;
> +       struct device_node *child_np;
> +       struct phy *phy;
> +       int ret;
> +
> +       u3phy =3D devm_kzalloc(dev, sizeof(*u3phy), GFP_KERNEL);
> +       if (!u3phy)
> +               return -ENOMEM;
> +       u3phy->dev =3D dev;
> +       u3phy->cfg =3D device_get_match_data(dev);
> +       if (!u3phy->cfg) {
> +               dev_err(dev, "no OF data can be matched with %pOF node\n"=
, np);
> +               return -ENODEV;
> +       }
> +       u3phy->reset =3D devm_reset_control_get_exclusive(dev, "core");
> +       if (IS_ERR(u3phy->reset)) {
> +               dev_err(dev, "failed to get reset\n");
> +               return PTR_ERR(u3phy->reset);

		return dev_err_probe(dev, PTR_ERR(u3phy->reset), "...");

regards
Philipp
