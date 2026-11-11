Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367419;
	b=PZUScLtWBll5sGEOsEOxyUy+/0TvLY5SfXNqYRo2EhXW2Wrq2/aQpWPKlTBGp5stWKkK
	 rZ0AgqTfuVpJM3CT/5r4xLTw3ehKm5a7wA6KvEYRWuhjzxmEgJwNWMEO23SADM1/8vbuC
	 enAi4ZgwhzRBCe6g03KFrIJQ2D0GYBFHgesEln6C/6YLxNy8AEkpkM90evzAN9i9rQTKt
	 Fqjqja3MYqlkeQfu/y+/cHmz5vJTG3bNgnDjp5cmBX59pHR/um/0EcKhSBLUXJv52OcEI
	 59PM7orxhm11dM3xws+DgkG70ZxaUPloMT0YRZTmX7okP71fLQT0c2maNHOBeEdTEjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367419;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=8D935cCybZcKPmLSQDzuIWE83ffg1Yvgg9sYd3csxZM=;
	b=0q8Wi48ap5s8xQCRqcGCOmZHFypIUlF7k6rjSOHqzxh16zdHfQiKnatxGzm7rkiD+knU
	 4e7yrpFWGdr1SCW1UYZBFadI3KrRlkXG71Ix+9JpZiEIdvKA/m9thtWejGltN4B3ZLfnr
	 y5fOAZA3et/+zlTQtfyMTiZtNToJ4u9LmsonMkPRGPF/VJfmZYKgoo2ehWDWUwPXmdMO9
	 vzK3lctqgmM3oY7huJMxn6lhtzeMZPVr/RO+0YavJtWMyW42ngVlui0ifVdx8PrvnW5HD
	 y+WZxDqkAeFJ8zHBLIs9q1aC+W+TcniQiQSlZF8cUtvrgYY1OvhC/YVi70MFncycpGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=XeJtmV8N;
	arc=none smtp.remote-ip=185.70.43.100
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535C4606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 535C4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=XeJtmV8N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794367417; x=1794626617;
	bh=8D935cCybZcKPmLSQDzuIWE83ffg1Yvgg9sYd3csxZM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XeJtmV8NBp5ph4zvL+nrMi8n1dx3ilMrS03XQWrw5GAZ4XtnNeC4jNsFgV5p7yuBW
	 iu54L3mnAUm0FBC7OeCp69xEELIDnF9QYWtpO40u57URraEUrGewOhPurUSrA8ea9f
	 IlBjqIPJponT+zVOpJB/sXOMK9f1vkJhQMTLSkldUVYcTlPiTXW/fMj2zTzTUZem9t
	 DmacdZhvtgsNULlCc5RBCnHoKwMq4twO2f4o56gKkhseBobtcR+tW6V+el4U6g+RD2
	 2bnLz56TMhtN0pTMKNvabFhElGTeGMAqSTERB9R21eYOmCLsi6R1ns34/LLGidMmYf
	 Zalk9RZIJn9DA==
Date: Wed, 11 Nov 2026 03:23:34 +0000
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
From: Soheyb <soheyb_boulaa@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Soheyb <soheyb_boulaa@proton.me>, stable@vger.kernel.org
Subject: [PATCH v2 1/3] phy: exynos5-usbdrd: power the Exynos2200 phy down when its init fails
Message-ID: <20261111032309.3365794-2-soheyb_boulaa@proton.me>
In-Reply-To: <20261111032309.3365794-1-soheyb_boulaa@proton.me>
References: <20261111032309.3365794-1-soheyb_boulaa@proton.me>
Feedback-ID: 140697376:user:proton
X-Pm-Message-ID: a639c261283024b524429f862b345c132fd67912
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

exynos2200_usbdrd_phy_init() enables the regulators of the UTMI phy and
takes the phy out of isolation in the PMU before it enables the clocks.
When clk_bulk_prepare_enable() fails, it returns without undoing
either. The phy core does not count a failed init, so no exit undoes
them later: the phy stays out of isolation, and its supplies stay
enabled, until an init and an exit succeed.

Isolate the phy again and disable the UTMI regulators when the clocks
or the phy-specific init fail. The phy-specific init does not fail yet;
the next patch makes the UTMI init return the result of the init of the
high-speed phy.

Fixes: cc52a697f87e ("phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm co=
ntroller")
Cc: stable@vger.kernel.org
Signed-off-by: Soheyb <soheyb_boulaa@proton.me>
---
v2: new patch.

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung=
/phy-exynos5-usbdrd.c
index 087d552..a6fe779 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1462,7 +1462,7 @@ static int exynos2200_usbdrd_phy_init(struct phy *phy=
)
=20
 =09ret =3D clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clk=
s);
 =09if (ret)
-=09=09return ret;
+=09=09goto power_down;
=20
 =09/* Set up the link controller */
 =09exynos2200_usbdrd_link_init(phy_drd);
@@ -1475,6 +1475,17 @@ static int exynos2200_usbdrd_phy_init(struct phy *ph=
y)
=20
 =09clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
=20
+=09if (ret)
+=09=09goto power_down;
+
+=09return 0;
+
+power_down:
+=09exynos5_usbdrd_phy_isol(inst, true);
+=09if (inst->phy_cfg->id =3D=3D EXYNOS5_DRDPHY_UTMI)
+=09=09regulator_bulk_disable(phy_drd->drv_data->n_regulators,
+=09=09=09=09       phy_drd->regulators);
+
 =09return ret;
 }
=20
--=20
2.56.0


