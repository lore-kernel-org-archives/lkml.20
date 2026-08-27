Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5826F3CAA41
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787865424; cv=none; b=W9LPQxdIGCx08cVzEOhXPdACj1rQCX7EHkjiFSRXPODhrpE94uT6DXOo7f6EbiCQSw+cc8Thgc23KFXmX9lm7njXC01EM4l7/zfEJ19mERafy1b7+HP8R/wuWkV/bricWl/HxqUbZuyUZWHzOutbKcEXb9dt7hnnYCIScsu3Ht0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787865424; c=relaxed/simple;
	bh=WiaV9fXe3l3lNMJh2b7umMqJAXLmEQjqMKdqgSl3Rb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbEPXLnI+7vSjtzDRrKNCC1owAHhkjEGx+JvPauN+8I4CrIbt4WrPmrGqZPKA1WMEMgyLSBG8heAJ+Lrh2M+PqRE8Jx/xs6Ik8UsUA0whC73I9dgRCUhPanqBrdoJmKCiUEpLpiZ2pase/vN5PprobY4lnyDzfzBznNlxWKwsGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=FtOHPkEK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="FtOHPkEK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so2103655e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787865421; x=1788470221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GS22c8zF3DbRecTzHL3Ci77nNp6+M/LCW83Org4yN4M=;
        b=FtOHPkEKf8AtFNHLLvCZyBIa8tCkJkPQC2/XDo5v7r8Cgk5N4B9LygJ5chikXvkWQ0
         /xFuk04pLXa2gMIDqExEjuDVGg/dINRYBjTq/yOPNuI3oWpstF6dbIsIY9jiZRbnO32I
         /rq2MDpA+5k0RfAQPVDZcPkml9YMVVxtAsclT8Br1mrf+LX84M6uz9U/0/DAP202T/E2
         7SReJXvDbmM8Ns6XUJscC8dRY8yqkqiSzHDT762FTUUJ/x5op0rGlYddDWwyHp7eD3zL
         4uyCm8CIFNenAZj19caI2BlMQvmdmLIDL9eWTqtnp+5UYIiY03W0QDfc4zFAELNeuLg6
         ivJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787865421; x=1788470221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GS22c8zF3DbRecTzHL3Ci77nNp6+M/LCW83Org4yN4M=;
        b=nh5miNFKOK4HfaW4Hs+Zd9Ffoxf9SN+uAFVOPYmsmViklRoRtBDp53mRAxCP9ZUQbH
         zWpDmZhCa2JOL5kRwvLW1Duhtym6KV0OJHSTDQDD003TBJRzE0LOX0ifpSuTuOetACxe
         HpcrX3NePslAwjwfQkSnw3AczB2CU//hen9lzZjw5o92gMzthfEc6mN+zQLUX82omFHP
         3phdOr5SwXokxXqPWNv7J3pRBd2qNaxhbfR8dv+jZOxFXh7XPphqJMiXJuq8iIrEd/f5
         HSbkXD2OLubQXnKQENDsZdDE4Kj84//tkd7EfhGjJvotJaCAI73TPM/DScQW+0PJ9GL0
         pASQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqjy7MS8ljkg0LZ2JdWtsrr42dH+1YTOqqWjmDSHOnmHTWhPejMOKB7EXfipg5sGIt2m3yHaeXnfpqrcvA=@vger.kernel.org
X-Gm-Message-State: AFuF++n9k1WUJVN9w6skBjlADGUc5vsgBPeaNEoaFLWtYRyp5bQSW7Ai
	v+KApcZAFL7cDlsMxSAcE6KmHi7oooJ0EKvAc7tDMeX+dCAEW2ukj+UPEtZ7BNNZVnh5kzP/8Jm
	Vvh48r5IzeA==
X-Gm-Gg: AR+sD127qfY7gBY+uwVKDFyUDLF+cobjwJ+wxsufBi5uOaN6/EgI9yGwtjvdShcTnrj
	CWGu0BfYth7lWo88aCzrsk+w2k04OxkSyRxZpsJzVhdkQZLHt/s5E8JOgWrM/M2WdchqGy6f2Af
	dzryOl56ii1KSep8CiVyWnMHWsnoq98Nn9xhvJkMLLEOTVU6strD+22xe+ENVE9mxjA6oNTOmAe
	kvqtp1jDRhLaK9QwmC0LZPd5uSySrLXH4IWSrSRDTM4e9NoB7ERJh5AjSlIvo/zxYShAHQhtqk5
	xqOaFeGqs7Yu8eUOZ++f7OAMNeoXQnFpJE6BRu9qPAmHh0tVt01P+1ASJg/4tUAc7fgbO9TYmiH
	wliwEaY1wv1VG6iFCPZoD7EUXhNcMSNxz0vksCChTDD4bIvszwhnFQloXTRF3BCslPXQerVZEiN
	xyYr/e2VTFXRU1UPDsgJEowYmM5kdCsYzJlG8MzsDc2HDa8QiAE5Zs+ZyJ
X-Received: by 2002:a05:600c:8411:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-49b91c279e1mr27682655e9.8.1787865421583;
        Thu, 27 Aug 2026 14:17:01 -0700 (PDT)
Received: from ownbook ([31.146.92.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27aa050sm11004557f8f.12.2026.08.27.14.16.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Aug 2026 14:17:01 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: Aleksei Sviridkin <f@lex.la>,
	Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v3 2/2] net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support
Date: Fri, 28 Aug 2026 00:16:52 +0300
Message-ID: <20260827211652.63504-3-f@lex.la>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827211652.63504-1-f@lex.la>
References: <20260827211652.63504-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phylink_create() decides once and for all that a MAC supports managed
EEE, and it requires the tx_lpi ops plus non-empty lpi_capabilities and
lpi_interfaces. mtk_add_mac() leaves lpi_interfaces empty.

So ever since EEE support was added, ethtool has answered "Not
supported" on every MAC that uses mtk_phylink_ops, and
phy_disable_eee() has locked userspace out of turning EEE on. MT7628
is unaffected, as rt5350_phylink_ops has no tx_lpi methods.

Leave 2.5 Gbps out of both bitmaps. MAC_MCR folds SPEED_2500 onto
MAC_MCR_SPEED_1000, so MAC_MCR_EEE1G would govern LPI on such a link,
and that is unvalidated rather than known unsupported: MediaTek's SDK
driver sets the EEE force bits for 100 Mbps and 1 Gbps only, and the
unit of the wakeup timers is undocumented with the port clock at
2.5 times the rate.

LPI stays off until userspace enables it, but the EEE advertisement of
a PHY that advertises it out of reset comes back, since phylink stops
force-clearing it.

Fixes: 952d7325362f ("net: ethernet: mediatek: add EEE support")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

On the netsys v3 switch MAC the xGMII filter empties lpi_interfaces
outright, as PHY_INTERFACE_MODE_INTERNAL is the only interface it
supports. It is a fixed link port with no PHY, so phylink had no EEE to
manage there before this patch either.

Pre-existing and not addressed here: mtk_mac_enable_tx_lpi() programs
MT7531's reset wakeup times (17 for 1 Gbps, 36 for 100 Mbps) whenever
it runs, as its own comment says, so they now apply to every SoC driven
by mtk_phylink_ops once a user enables EEE on an eligible interface.
Those values do not appear to have been confirmed for MT7981, MT7986 or
MT7988.

v2, with the full argument for leaving 2.5 Gbps out:
https://lore.kernel.org/netdev/20260824024117.46154-3-f@lex.la/
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 22 ++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index be3bd025c41a..37a831f73da6 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4828,7 +4828,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	phy_interface_t phy_mode;
 	struct phylink *phylink;
 	struct mtk_mac *mac;
-	int id, err;
+	int id, err, i;
 	int txqs = 1;
 	u32 val;
 
@@ -4907,8 +4907,11 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	mac->phylink_config.type = PHYLINK_NETDEV;
 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
-	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD |
-		MAC_2500FD;
+	/* MAC_MCR folds SPEED_2500 onto MAC_MCR_SPEED_1000, so LPI above
+	 * 1 Gbps would be governed by MAC_MCR_EEE1G and is unvalidated
+	 * rather than unsupported.
+	 */
+	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD;
 	mac->phylink_config.lpi_timer_default = 1000;
 
 	/* MT7623 gmac0 is now missing its speed-specific PLL configuration
@@ -4966,6 +4969,19 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  mac->phylink_config.supported_interfaces);
 
+	phy_interface_copy(mac->phylink_config.lpi_interfaces,
+			   mac->phylink_config.supported_interfaces);
+
+	/* The MAC side of 2500BASE-X is never below 2.5 Gbps, not even when
+	 * a rate matching PHY drops the media to 1 Gbps, and
+	 * mtk_mac_enable_tx_lpi() refuses the xGMII modes outright.
+	 */
+	__clear_bit(PHY_INTERFACE_MODE_2500BASEX,
+		    mac->phylink_config.lpi_interfaces);
+	for (i = 0; i < PHY_INTERFACE_MODE_MAX; i++)
+		if (mtk_interface_mode_is_xgmii(eth, i))
+			__clear_bit(i, mac->phylink_config.lpi_interfaces);
+
 	phylink = phylink_create(&mac->phylink_config,
 				 of_fwnode_handle(mac->of_node),
 				 phy_mode, mac_ops);
-- 
2.55.0

