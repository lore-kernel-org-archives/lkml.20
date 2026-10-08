Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F68F3B3C0F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481977; cv=none; b=p2nlUE/GFIZb7jVoudm83gt0hjOFt5HOhHbNZM6F11Hh9HsX4c4i++/IAGDgONBF2tFkwqGbHgw97YL8HG53NzGLD1CEfh9LJ/ch/EqR6R5D4NfJ4B5u1G9QvUFRu8FUjE/KwcI0SPF9j38RPCoX2V377+pZvPYqCWQvQrpptVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481977; c=relaxed/simple;
	bh=K8sJtTy8arsyLPVQc9/n8NVgxkq77Tb09oquQ0e8WBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BlzGpX/gJluN/Q5r1K+Muh/Zo7RfXp7fW0he48d750gAhkCAEkRNs9tN1D88aOTt850A+Rx4yeauGg8fJuc3/97qqDPFpNFfPeUySm8JelY6Yp0QwHOKsnB+9afZ1ZNqWQVSTTQ8yi446VfOUnqEb38+BO4UkmCKCX7AbXvLhYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhtZxjBa; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhtZxjBa"
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3a7adbf1b3fso1264097a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791481976; x=1792086776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2jHQ5uSsWE1tJZ2r8Ki7n0PjxWkIoR+7RH2XBS7AsA=;
        b=LhtZxjBaU4oJSXufZoFjbkB60eFAcBiy5nTQMmxEPlSKKwZfZpgnhAlB2DHvem50gA
         yAugAwuESHCtmXf6LsKv0O6JYEuncbre8Eu5OZsFl03UAHfbukijFHxjlKMlR+JUUByg
         rl6Tj5glR/hzE7ipFiOBJgDjvcpt3XuPvPZ/QRalY0k20T72oCx14w01KKmbDd+zxiBP
         HjIYGCLTRpS8/u+p/OIoqUdy4ja2Rqo097CX3RO7RUpNRcmbp+fKUyQ+98TXV0aVpXeA
         EUccjZLcE1G0+PlCWGUabfOIUGU2tMA/yrosSjc33K6K1s4cxAKk/9WRB/hMJS8VcyRX
         4Wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791481976; x=1792086776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2jHQ5uSsWE1tJZ2r8Ki7n0PjxWkIoR+7RH2XBS7AsA=;
        b=pKjWtypWg4RQT5q+/cnnAHaTEXHBIoDzqwfcIQ4akhmKLEDqUbsERfRnJToyZcmCoW
         atX4+MWk3tT37HYCVfF8S8Mwo93Amr0sVp3JCqhpZdccNcxXEfUZ9gh8jur5OYZG8rsv
         nnFDYrx5Tc9rNtieN5k8ot7FXLiZa4ntugosxuIM7T3FjUyMONL06u6WBnsRBDvOK3Q0
         /Vse0/Nf4eGBEAhtEeKALiFEzRrVyu+DURhhXD53ZzQVK4ly7Si2RX0DdZho2vH2yzmF
         Hr/8pumbbnOISlWy1Wyzcl5YEThKdyilo+hBO+ZxbqhlZuW2PXO9p1cVvTltiJbyICKZ
         /Zug==
X-Forwarded-Encrypted: i=1; AKwUvByxloF03MwDrT+h9T0iIGVxGnvRQj7H7rs31ammFy+BhTyyojQ73VYQa6Twd1n/zz5112HtaK/ZyWlSlsU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKH/gqsJ9CCsBmfhqJDcxhcrxMui+3+i1tRcBrEy39ROlJTB0vI
	NddY/++tkd0wgpQPK3vDDYgguq/CiAQmyuh7BdNE8uO6NT9+oDFLG33D
X-Gm-Gg: AYBFou2pixpMVy9oEByuG4FdRowWOJAAjR2DspZUs2BCg3QkLbrKoCKIuhI8iG4mHWE
	pDOYzptw2j2grt5kkkUcGUJIV+8laNu4yWSOrEoa78dUsEJKRirrrspvvB5+FLUHlwG0dLnZS8y
	PFbSwBJCtc/4Hxn7rJneZlJJwRJAmsAAPIa+GnzGbQQwtPMMcQFrTBmPQtZT1nfyYvSxluCDjbB
	/93M+UDlK8l5tWhLVXIU+pXlKNepZNTE12XrSvAiR5NHZnTUTDGrKaiL0i8d76X4kz38IxQiz7s
	cvEo1OaXJWEh8XT1EdKm58x72dYZx8H8ygtH5vRdb8PHGDjg5SQ3wO3fyQHHa86UBMq4tLTNEq5
	RxqFwTh7z57aYHeLr6gIMtU0i0Y2TjxVIY9Lwkd3r6d1h+KRpfFRGUTX1AGVKNPycjGzGpf7FZ6
	YvvgiKuUnE170j+9YW3arIxevl/PZb0a9m/uUZ7aIxHVZ/8ysR2dbeEYIzRD0lOMWdGOZA
X-Received: by 2002:a17:90b:28d0:b0:3a8:768d:70e4 with SMTP id 98e67ed59e1d1-3a8a1b59a17mr5454105a91.17.1791481975880;
        Thu, 08 Oct 2026 10:52:55 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm144332a91.16.2026.10.08.10.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:52:55 -0700 (PDT)
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
Subject: [PATCH net-next v11 1/6] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Fri,  9 Oct 2026 01:51:55 +0800
Message-ID: <20261008175225.3375274-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008175225.3375274-1-coiaprant@gmail.com>
References: <20261008175225.3375274-1-coiaprant@gmail.com>
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

