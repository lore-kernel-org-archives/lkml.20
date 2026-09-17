Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74024AA58F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789682053; cv=none; b=tx/hVJ2ACi1BdDB8qPpLfRE9HgZBqbh0kCiHsJ6Sx6+Rc4H6S0ej7XxNBvGvdyPgJBPIG4JNT5XHT5pyWpiqtEYeCjpq5Ynwn2vFFqvC0UOdfaghJsYyLz2X4GoW2mAcSylAXQsmPT6FYBiDYxNZXBqZOzvohw+zVRH/FCR9EeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789682053; c=relaxed/simple;
	bh=Z5E8ruKxQ4jkL5iseCaDFurRPhQDnTscuRXD9azwDtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3d3wqAwnGKkjV+QzdXReBn3f+NDyqDB0ULhky3RaRoULXH/FwAbPM0zn9N58z3Thdg89nok2JaLu8b4fBf06PDu5/L1i6VB705AYcsrfjW4G7t4PGoXGOaONXWh6xtwUPr9U09nX490Ce8fiSV9cVBbdMuX4adpQROlyPa9dbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gNJY8i2g; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gNJY8i2g"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5B1B11A094C;
	Thu, 17 Sep 2026 21:54:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D7205FF03;
	Thu, 17 Sep 2026 21:54:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C97B11C7B092;
	Thu, 17 Sep 2026 23:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789682048; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SP8JzxZkC9JCoDs+bzDeDTd3TbPD+u3Y7L9Dv9B3Q64=;
	b=gNJY8i2gTmgx1ufzB1Xbojx4kqnzAhdL9N9+aOLUNmBo0O5wRfKxSzVcDrQXmhB937JcmN
	6CqwVP2GLtuH56rplrv3DQ52Nqol6reRjqMrODiubElz6Vw/i7ii81i/x1UnREBBCh9gOL
	S4ursRp+LffN3woLsjSKbXynWzrmGV//agCGTZcDZwXm2VpoAv5fz0QvvrPvoq2DtoJXJY
	aazy0y5g8ruMEvnD2QHRLSXdYi94tpGLZdYFQ7br7CL96BQStXreuNiqwfFome4YsnAgc8
	/Y0ld0WsL/jouiNcGdqLnp3Y4rNg7Go2oQPhf7MzhOskyOuq8o9NMpPHMTouow==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Jose.Abreu@synopsys.com,
	Nicolai Buchwitz <nb@tipi-net.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	PKneuper@dspace.de,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH net v4 3/7] net: stmmac: selftests: Check the dev->features for S-TAG offload testing
Date: Thu, 17 Sep 2026 23:53:34 +0200
Message-ID: <20260917215339.2022523-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917215339.2022523-1-maxime.chevallier@bootlin.com>
References: <20260917215339.2022523-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The S-TAG offload insertion incorrectly checks the dvlan (double vlan)
DMA cap, which is different than S-TAG support. Use
NETIF_F_HW_VLAN_STAG_TX to check if the feature is supported instead.

Note that this flag isn't set in stmmac yet, but contrary to ARP
offload, this is a feature that has a chance to get there eventually so
let's leave the selftest here for now. It'll report -EOPNOTSUPP in the
meantime.

Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index 2f9f7746c40a..de02c0da56dc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -1415,7 +1415,7 @@ static int stmmac_test_vlanoff(struct stmmac_priv *priv)
 
 static int stmmac_test_svlanoff(struct stmmac_priv *priv)
 {
-	if (!priv->dma_cap.dvlan)
+	if (!(priv->dev->features & NETIF_F_HW_VLAN_STAG_TX))
 		return -EOPNOTSUPP;
 	return stmmac_test_vlanoff_common(priv, true);
 }
-- 
2.55.0

