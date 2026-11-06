Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793954578;
	b=PiZNvukOTtg/JqNtP5NNsILOBtMZ3ZKdrgR2ddBMeaqUN45dJtRMJJXF2fERRkYm32LC
	 qCaXm/CbUnRiIaKcX8F0lal+4/dkYpvC4baIbNT8zB806sMrJSERPOhj1iK5PV+6qCCXS
	 LJezoVXRx3iJWBIWQebWRSFSCb2QWAkWR2A+DFbE2mVd3nndGsfzm8Cb3pqASZC/1Pw+J
	 ZiHAalqbh/8Ydk+to26d8U+i2ED+ltfXV58CdDPlJssrUEqFfyLrUObnrDkgTptp3ZWQ4
	 KAwzOzNmOzcyCVw/M1UClLUWk2oiZFv/n3qzRUbDPoSZKZ67gacdEK8YR7CcnPAjgTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954578;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=//BhGWhocoXqTGm5cl7oYST4gdbyKm1YGtkrcPDoUdg=;
	b=xlMtKfvqC++Flf+zV8PpG9Q2mzRCb5hCWlznV0BORsOIIoBNAkHyKZMr/8Ag4dc6JaGx
	 c55xWXdUYikvtDu9HXOmHmtxaxpMzunAHQBetRrbubesyd1JoJLHFNJg1xDsBHtMZ/VOI
	 2DI25qe8ayIjLz/lOV+sllzwt0iwgotWGyYinBx9UKpu+5RIRDFURo7aPLIiRV/qcnZw4
	 Yay4PhqyIb/ywHB5ms4Ms9Dr70hTeJhgor7hQptNMOWld1XHtZQepnX+aOp6VInmeX0DT
	 0Qly9apDs8vqbtfVpyOGL69HHX24xJRsNedofxcJy41YMPMjvE/g0b4RYcxHGgF3RhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XwTvp2Hj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D476606A328;
	Fri,  6 Nov 2026 08:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D476606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XwTvp2Hj
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E78F3200681;
	Fri, 06 Nov 2026 09:42:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793954574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//BhGWhocoXqTGm5cl7oYST4gdbyKm1YGtkrcPDoUdg=;
	b=XwTvp2HjcxbbKHLX+rAlFM0I48XMYXfdG9kKIqRRNsNo5AS8gbBGidEzchpwjMWNqcJTkV
	QwYnUyFICNvgRV3HVlpOGwP9cnnCUFVHks4t3e5xbI89WX+72Rqow6er/5Dup5qY1TRNUH
	o05lnjD1V9Aucc/cAWPNg882EajYDC+03IMs4UfVZrqfeerofvftrPLahw5/JZxJmrKZnU
	8veaBx4PWjlckXZNzoBopagLeAfiQcoeHEbVzTRbwZNjeRY+RWpyPmBSMYVsfT/+u85eUZ
	VCCR7N2Nc5LxyfcjpK5jaz6V7DUNM4ABewpW42XxjRrmx4rMAgetSfWjBV8kDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793954574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//BhGWhocoXqTGm5cl7oYST4gdbyKm1YGtkrcPDoUdg=;
	b=eDb6HCn7SjdnhBJx3QsJ8qPZy9CkatDumvnznQbh8RtAFxfB+S5FtgmLMpEKOpt2A3VMea
	xXP1at0nh1FjsEMcCkzOjS1SEo9opHXg3iYD71L89pgyKC5BIH2OU+Ellr9yoe9Ctg7S+o
	JKaN0kIHRzGQW/ZWIo+Jb2W0KwbgXU5uzB4+2wLZxRa75r3HwpnvudTfuuIcnWXsoJXFS7
	DeggLSxyDHwelLTGE8Eoj/KnsFRhP9vNs33UJtCxJFmpWPRrv/w0MYCgQCRncBe4ZrBGfD
	OpkGcbrXSzJ1CZxyshNw+gkVHWNIUZzDSMOKYwqTB7JsDvOpIueHqcmh6TjWQg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793954574; a=rsa-sha256;
	cv=none;
	b=ImQ8CWpS/K1U4zYKJOUdfiVGehkW1YFe17FPfwrUkqTWPYEB8Q2/mlZQUeylEICiT+uIzt
	FM6SBZDclWm/qvYWPGl73CQn0DcEw4ftLXjGAJS9t9SdL7tRps6wiEl9ZdxJ8DSW32cSx5
	LAJbh3zRvpUhcp2Sl3Aeje6iJdgQ3R3gwlZKwWpGAOoukszU+PQDZu+uPsG3n7LrLqeauW
	+/Lzubr4yBPaFbZpwLwMY9BPyQSBFL6f23UTV3uNTiKHV6jEeCcNcNmmSY1va/P/FnfeZa
	sgsP8gIDDqHUEPpOhaAZ3BtUxjFLCcm+9li1UO4eQhKZ9ceNg9TROL2jb5sMzA==
Message-ID: <d3c3dc464510db5b603e578a976ffde4364cae70.camel@pengutronix.de>
Subject: Re: [PATCH] phy: ath79-usb: support the analog reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Rosen Penev <rosenp@gmail.com>, linux-phy@lists.infradead.org
Cc: Alban Bedel <albeu@free.fr>, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Manivannan Sadhasivam
 <mani@kernel.org>, "open list:ARM/QUALCOMM MAILING LIST"	
 <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Date: Fri, 06 Nov 2026 09:42:54 +0100
In-Reply-To: <20261106014254.544923-1-rosenp@gmail.com>
References: <20261106014254.544923-1-rosenp@gmail.com>
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

On Do, 2026-11-05 at 17:42 -0800, Rosen Penev wrote:
> From AR934x on, the analog part of the USB PHY has its own reset. The
> old platform code released it after the PHY reset on AR934x, and left
> it to the bootloader on QCA955x.
>=20
> Take it as an optional "phy-analog" reset, release it after the PHY one
> when powering on, and assert it first when powering off. This is the
> reset handling OpenWrt has used on its AR934x, QCA955x and QCA956x
> boards.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/phy/qualcomm/phy-ath79-usb.c | 33 +++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/phy/qualcomm/phy-ath79-usb.c b/drivers/phy/qualcomm/=
phy-ath79-usb.c
> index 8e9565846b2f..1e7868fc0b5f 100644
> --- a/drivers/phy/qualcomm/phy-ath79-usb.c
> +++ b/drivers/phy/qualcomm/phy-ath79-usb.c
[...]
> @@ -78,6 +99,12 @@ static int ath79_usb_phy_probe(struct platform_device =
*pdev)
>  	if (IS_ERR(priv->no_suspend_override))
>  		return PTR_ERR(priv->no_suspend_override);
> =20
> +	/* AR934x and later also hold the analog part in reset */
> +	priv->analog_reset =3D devm_reset_control_get_optional(&pdev->dev,
> +							     "phy-analog");

Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml only
specifies "phy" and "suspend-override".

regards
Philipp
