Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145DA3914FA
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792215889; cv=none; b=HaIoQ4QIFvJ929MBmad0hLPzqKWcHOVosWtN37nOJG0YamGawT5oGSS7c6e4hqGJhCdPGbzzJP/LfN+itElHPguow4wMZWczCvoRU510FHrwphUVXY1FUIJJcU6WonQ0ruX7+EvRuWI3vPFi4QbDUF+UXac8uGcs6WdJjXOq+Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792215889; c=relaxed/simple;
	bh=K8sJtTy8arsyLPVQc9/n8NVgxkq77Tb09oquQ0e8WBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UL/OzAzBqfRiigA/xz1Lkl5Q8MPPLKdgG3Xwy9R2H5NZHZHrxUfch01WptuXFqsqd9KdK8qsU2fp0F9tlgUblu4KR+FNONcaSLr1/KdLlaSBw68VCUlRML18bchilHQOAcSpHxJYp4TrU4RwA4F3Iez2oxCEXBk8PoRfjw1/8hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+hMYpTg; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+hMYpTg"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cd63952c9f2so116910a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792215887; x=1792820687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2jHQ5uSsWE1tJZ2r8Ki7n0PjxWkIoR+7RH2XBS7AsA=;
        b=V+hMYpTgldr8cdbOIdfZNN5AytQ+MEjGnGlzez8CkjyRWXxo0ONlX3pvkk1fz7p/d3
         iW9L2WssRgblXBqgviIwyIXLnaelVPzUvcsaV1o8AROt9wWwm7YcKDALfeq3jge1YyAL
         YrhlZ5HUAkmuRXEhO294gmHSzrKPHdm4TEstSUk/wV1+PUyJg6wETYtn2+tnYbhOetmL
         +czRyNuJoH0olio5v6jJKe/xa4W5aFSDz/xjTIpJ9/uuRjlGK2/jVF7X4fjq+xMMj+d1
         SdMPiHmypc/PT3YnRlNG/o+PnroPuzRx6IjdJG35JWnOeqlMrtHqyf6QJuI98c2fLW6w
         arTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792215887; x=1792820687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2jHQ5uSsWE1tJZ2r8Ki7n0PjxWkIoR+7RH2XBS7AsA=;
        b=QbjkNjsXcf93rEN2xBg/c2eqopRXQXON16fOc9bNwZD2jj0DyPEaW58MSUo3PUAmNI
         9uZ2ReajifKMI/nm5U4I7JKwH+5qGPDMhNLh9RADlb0ITxtWBaIrsmLrlJuzaRzFHqKL
         JnIRWLdPAy73BykFmaA18s99xwn3zodiJ6c3rQkPL8Qqn0dTzln9+KWjCs8lAFAs4eKZ
         RMvJaSDcoX8QM9hAUap+U37zRZ0XiaHYtbKU0TymalGb4oqSORAvOsEtzAiJRaLhgSd4
         6dMoNmBF8+a3nCMbKwFHNlbcsYl1nHzNBBLsP4TKco4hl/Cx7fcrb8qI/x7osN1NIew8
         DyjA==
X-Forwarded-Encrypted: i=1; AKwUvByUdEO5XO2REkzjqSR+qWn+KEfEw/doBCi6kDXUxBjaLLolbMhnXLRVW/i37mLT3/Y2zuXmONUD91mSm7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSPaMNMFAYT93zGHdf6nYwIvNd16pZ2BwAt6L+KpmiUPeHk5Z4
	57WbHf9bOjS0VjhtFTkPxVl+6/b4H1Czx9zzu/Uf6kji2naTSfupICMi
X-Gm-Gg: AYBFou0lkJZOjl2rykJoKqTzC/nvOHpS8bT8lDSdBazO6L+yha0LI1SstZQ8kFlP28C
	903aYaBOnswrNBHO3WCEWG+jG2qXdFBQc0J8s9OQMUr0aFNplpK421DMtCc51g/S1z4+2CqmCyX
	0FyW8l3zdX1noWFlhGrCw3DPBdLimoY4iwKQEp+/WoDHS1sCQWh96Pt+iaOOt7/y9+timQmEmFn
	iuVNhaEjH40zf2Q9u0MlFN1BdH+OYiCypuVeFWh06kRVNn04ggZf1072+nKka+67zfNMnTSD2Rx
	AssxatfzjaAWd6jwa2Ib//kL7Bzv4puVDhBrmQad6K9E0vH/UNreq/MK1rTVw7S6KAdn8ln/zWd
	e00Ka2GXcrZ9JmoJfSgOKSUW+Un3qbmN5Uo5cWzcgTL+5PBUtc7a9h4pbFq9TO9iqOcZ8OQzUxH
	oRa1uXRK5FP0+x1lyMwR2yufnqvNSfM3NHEaEGIdLQJFo0pMmZpqfPTNDc+Z3OHtps7nTtVw==
X-Received: by 2002:a05:6a00:3386:b0:89e:fc56:a25e with SMTP id d2e1a72fcca58-8a04cd2efc9mr1245701b3a.41.1792215887340;
        Fri, 16 Oct 2026 22:44:47 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57269315sm1958225b3a.23.2026.10.16.22.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:44:46 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v12 1/6] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Sat, 17 Oct 2026 13:43:59 +0800
Message-ID: <20261017054406.1828061-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017054406.1828061-1-coiaprant@gmail.com>
References: <20261017054406.1828061-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some hardware using the DesignWare XPCS IP (e.g., RK3568 MAC side
SGMII), the PCS does not automatically restart auto-negotiation when the
link goes down and comes back up. Without an explicit ANRESTART, the link
stays down forever.

Add BMCR_ANRESTART in two places:
1. In xpcs_config_aneg_c37_sgmii(), when starting AN, set ANRESTART
   alongside ANENABLE to initiate a fresh negotiation.
2. In xpcs_get_state_c37_sgmii(), when link is down and AN completion is
   detected, clear the interrupt and trigger ANRESTART to restart the
   negotiation process. Propagate the return value of the restart so
   errors are not silently ignored.

The restart cannot go through the .pcs_an_restart op: phylink only
calls it for 802.3z interfaces, and SGMII is not one. Changing hardware
state from pcs_get_state() is already done elsewhere in this driver
(xpcs_get_state_c73() calls xpcs_soft_reset() and xpcs_do_config()),
so the same pattern is used here.

The latch is cleared before issuing the restart, not after: clearing it
afterwards would discard a freshly latched ANCMPLT from the new
negotiation. If an MDIO access fails at this point, it indicates an
unrecoverable hardware condition until reset.

Also clear DW_VR_MII_AN_INTR_STS in xpcs_config_aneg_c37_sgmii() before
starting AN, matching what xpcs_config_aneg_c37_1000basex() already does.
On the non-inband path the function now returns the result of that write
instead of the DIG_CTRL1 modify.

Update the comment in xpcs_config_aneg_c37_sgmii() to note that although
the DesignWare databook says AN restart is not needed for MAC side SGMII,
some implementations (e.g. Rockchip RK3568) require it to recover the
link after a disconnect.

This is not a fix for an existing mainline platform: the affected
platform (RK3568 XPCS) is introduced later in the same series.

Tested-by: Jiawen Wu <jiawenwu@trustnetic.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index b415b93d77c15..6466e0ff2a98b 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -761,7 +761,9 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	 *    DW xPCS used with DW EQoS MAC is always MAC side SGMII.
 	 * 4) VR_MII_DIG_CTRL1 Bit(9) [MAC_AUTO_SW] = 1b (Automatic
 	 *    speed/duplex mode change by HW after SGMII AN complete)
-	 * 5) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] = 1b (Enable SGMII AN)
+	 * 5) VR_MII_AN_INTR_STS = 0x0 (Clear CL37 AN complete status)
+	 * 6) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] = 1b (Enable SGMII AN)
+	 *    VR_MII_MMD_CTRL Bit(9) [AN_RESTART] = 1b (Restart SGMII AN)
 	 *
 	 * Note that VR_MII_MMD_CTRL is MII_BMCR.
 	 *
@@ -769,7 +771,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	 *	 SR_MII_AN_ADV. MAC side SGMII receives AN Tx Config from
 	 *	 PHY about the link state change after C28 AN is completed
 	 *	 between PHY and Link Partner. There is also no need to
-	 *	 trigger AN restart for MAC-side SGMII.
+	 *	 trigger AN restart for MAC-side SGMII on most devices.
+	 *
+	 * Note: While the DesignWare databook states that AN restart is
+	 *	 not needed for MAC side SGMII, some implementations (e.g.
+	 *	 Rockchip RK3568) exhibit a timing quirk when integrated with
+	 *	 phylink and do not restart AN automatically when the link
+	 *	 comes back up. An explicit AN restart is required on those
+	 *	 parts to recover the link after a disconnect.
 	 */
 	mdio_ctrl = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_BMCR);
 	if (mdio_ctrl < 0)
@@ -816,9 +825,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	if (ret < 0)
 		return ret;
 
+	/* Clear CL37 AN complete status */
+	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+	if (ret < 0)
+		return ret;
+
 	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
 		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
-				 mdio_ctrl | BMCR_ANENABLE);
+				 mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTART);
 
 	return ret;
 }
@@ -1093,9 +1107,18 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
 		return 0;
 	}
 
-	/* Clear AN complete status or interrupt */
-	if (state->an_complete)
-		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+	if (state->an_complete) {
+		/* Clear AN complete status or interrupt */
+		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+		if (ret < 0)
+			return ret;
+
+		/* Initiate the next round of AN */
+		ret = xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
+				  BMCR_ANRESTART);
+		if (ret < 0)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.47.3

