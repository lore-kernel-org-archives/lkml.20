Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B993563FA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 15:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788708549; cv=none; b=JUi+BjIlwnDePgLdhXEvTolxRrs//dlfCesHLG1ivmSWrDJf2Clnqni7yhZTG7oaXK5+/gSHtxIabUM6KHgLPF1gt6062KWfKPpUni7UbEYscwWT6qGDXWEgsgXARbSviFHY0VO8hbUBqxu3kuiXE+Ezx5VzkXzWSYoGIbhMplQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788708549; c=relaxed/simple;
	bh=6a9PVxeFa4X7+g2+7hm8XIBPO0HMmiR+2HcmRobBeu4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ryd/nWkYQ6JyOLh1pkAmJ6OtrVjh6pVGYyg8O7vNSRATj36gwIyXnLhMlCY1MtH/EJyTRHfgvtKsBNRhl48Y/i4aM/evTz+OcrS6Sh0jhhH/KRadAdqcadHJizpNJDO0WE+ZIoM2KECyUaBT8u0t214QRvwumwevXpPUGntm/3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=AfwWAa/+; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="AfwWAa/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1788708538;
	bh=6a9PVxeFa4X7+g2+7hm8XIBPO0HMmiR+2HcmRobBeu4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AfwWAa/+Ahtj7VNsXIcqLyVfVvjM0+cFp0SZDHDuctAGkqxKEIa1QsdMA3IlRPLbV
	 1q4ntPsvpWyweR9K1NLcMcBXXlzhwelAuIS8nzNWldLPidcJ/TUYIR2D6M+nFBv+32
	 gnUh5s2r9oSLEcR6F/FKWPs7SXC2WOjKkBEIHLYQ=
Message-ID: <9985dcd7b614e0876b7052ed703d4c186632f877.camel@crapouillou.net>
Subject: Re: [PATCH] phy: ingenic: fix unbalanced regulator disable in exit
From: Paul Cercueil <paul@crapouillou.net>
To: Felix Gu <ustc.gu@gmail.com>, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Manivannan Sadhasivam
 <mani@kernel.org>,  =?UTF-8?Q?=E5=91=A8=E7=90=B0=E6=9D=B0?= "(Zhou Yanjie)"
	 <zhouyanjie@wanyeetech.com>, =?UTF-8?Q?=E6=BC=86=E9=B9=8F=E6=8C=AF?= "(Qi
 Pengzhen)" <aric.pzqi@ingenic.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun, 06 Sep 2026 17:28:54 +0200
In-Reply-To: <20260906-ingenic-v1-1-2311f3df8ddc@gmail.com>
References: <20260906-ingenic-v1-1-2311f3df8ddc@gmail.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Felix,

Le dimanche 06 septembre 2026 =C3=A0 21:30 +0800, Felix Gu a =C3=A9crit=C2=
=A0:
> exit() and power_off() both disable vcc_supply, so the regulator
> gets disabled twice for every power cycle, causing an unbalanced
> disable WARN.
>=20
> Drop the regulator_disable() call from the exit callback and leave
> the regulator to the power_on/power_off pair.
>=20
> Fixes: 31de313dfdcf ("PHY: Ingenic: Add USB PHY driver using generic
> PHY framework.")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Yes, the doc of phy_exit() does say that it must be called after
phy_power_off() so the fix makes sense.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/phy/ingenic/phy-ingenic-usb.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/phy/ingenic/phy-ingenic-usb.c
> b/drivers/phy/ingenic/phy-ingenic-usb.c
> index 7e62d46850fd..d8e5ef302b74 100644
> --- a/drivers/phy/ingenic/phy-ingenic-usb.c
> +++ b/drivers/phy/ingenic/phy-ingenic-usb.c
> @@ -124,7 +124,6 @@ static int ingenic_usb_phy_exit(struct phy *phy)
> =C2=A0	struct ingenic_usb_phy *priv =3D phy_get_drvdata(phy);
> =C2=A0
> =C2=A0	clk_disable_unprepare(priv->clk);
> -	regulator_disable(priv->vcc_supply);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
>=20
> ---
> base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
> change-id: 20260906-ingenic-e558363993bf
>=20
> Best regards,
> --=C2=A0=20
> Felix Gu <ustc.gu@gmail.com>
