Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6F042E409
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 22:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791239450; cv=none; b=coKsk+wAchyvnJAqQh2lbfgKhlJNhf4jS7OguMKm9wvPyVLZHcaAo1F51rL7untFPhm9sne2fHCzUkI4CC9NQiqDRJJf/23byE2wyqCcum2C6buQWcuUcktzPCfmG0srOUMG59xhS4gJoZRg3lWFb2oKryuHGPjWsdNO2pjnjcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791239450; c=relaxed/simple;
	bh=K8sJtTy8arsyLPVQc9/n8NVgxkq77Tb09oquQ0e8WBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YP2iwI4EBG0lyhE76yWANkT5hjN7mEUfZKhhieq7cqm3ghgY7cz44oYsy/ebX11V44P8C7WLQsUYaVjoMvg9VT468IMIvMpge+Rjyalg5PnXyvoXCUM2izJGOefCX+hU8HGiCNp2rBx4RAnma0qbm6gXoRcO6FbOF6HmR89zxfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q855Aj5h; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q855Aj5h"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e2e52f7b01so14475675ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791239447; x=1791844247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2jHQ5uSsWE1tJZ2r8Ki7n0PjxWkIoR+7RH2XBS7AsA=;
        b=Q855Aj5hpNs7l5ymMFQ+af2hZ3OP/jIO9Zr8UU15mtMLGT9pma+EBuHVkEOmukPTT4
         OUtg8rhuYbsCnxEhWMlsB5wCSsapuTzJyKntUfFN/Z5F+zdevdfoKelVGKrU9/DmKeSK
         a4banucxLmnT6kVrZQh2lKODFwXG3apM7A6BTIPt+tif9peelB8rBgSKXIJ0wwLkZXr6
         H2rQNVYAJcm90qNEiIljRdb2t9HyzmOwEJk/AE34aro11tFgAweI9IlOcuvz6UvKQb3I
         I3C58268r5nZJrY95lITzSbMosRjRjUfHahS1k6xdJ+qxKv1siuu/GMN/U4YfUXwm1Yh
         z7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791239447; x=1791844247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2jHQ5uSsWE1tJZ2r8Ki7n0PjxWkIoR+7RH2XBS7AsA=;
        b=Z9a7MNePeK/qc6F+tvMkfLIoEbmP75IXxS5QXwdEG6ASUvc5OuVsQTSs6g+ePZyMPd
         zyl1OraH4d612QC+5TT96e1cB7qCWjF9YdpgbJFidZEoZVa9O6n5l0dn38jdmGSOdAc4
         sS1wJm8b8zBwCZbHejvK2niWPV73nyW2xBTup37i1BYmDjjagb2THU2Ad45siCLK1iUF
         QwqZ0efSvG7AVuo3mAdf2EBgJcCqN8f7+KdM/rn5lj4hrV03H4EqKW+Y+fCKxB8JX+dH
         rfd6HDhXIKrs/JsZ8AANsHctPetSOEeKVz3HrRYRY4xa/+B59WXP05Mhaw/Bj0wmsGVN
         dHlw==
X-Forwarded-Encrypted: i=1; AKwUvBz4tabxLOgU9sJNJZq1SSeAhkiPOtitY0mQ2HDBkFqF6FByMDivDyVWSUowXMiU36wflBcx6cvZA6Hps8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMJIgxjoy+H6jUX/rqwEvl23xRSqXHVnBzPnMpFaCaymIWU0WW
	/uiBTmCus3sNlNzVjfg/+fRfPR0PwKDUXPLvZ/ZYJQSfzn4hLKeuqIqD
X-Gm-Gg: AYBFou3666AhjhjUfJEciDj36BDskNZsb1AFX4bYfAk5DP9fkNDdIxr+7SFFT3xJDsd
	fgEPGFVJ9AMmu8KQXj8y9TOaD+DwYNSvPL43FLGL7QdrtGArTkVi51/J7muqXmxeeQ4tQmYiJyw
	FiUqK+ioXz3/os0MQ8t1QYs90VJTMum4pI7ihbRfdMLVejAPSnfZM0Ar8wTsx4eX3Ro72ydASav
	wT1QWYyEhpmVAwJZnFmk746zi08aIoQF/HNy0kkoeChoV/+KSYxcl0up3hS2j+dTJpEEVUDt7bA
	J1QCTXWxQIcdrT+I1NbDjnB+RKT9DGVFUX+KMVmY1RC1/8tmQL8l49gZI9t0pE3FI7ruISeddqU
	cpoAssBlyVpJu1D6A9nA0PBYQs4GJyEd+/JNJDCB7Sei8rub9Syd/uzxRRI0pSm58Dofm03DsdA
	a2e8hpi/pB5RCGCajVaQUw8DdTjnONsC4an9QCFr2YEiobpDq9tR5LgXB9BVtS2ZrkB4zi
X-Received: by 2002:a17:903:3846:b0:2df:9a29:aeb2 with SMTP id d9443c01a7336-2e4ea0e485bmr89825175ad.3.1791239447197;
        Mon, 05 Oct 2026 15:30:47 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5f05321sm13203705ad.78.2026.10.05.15.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:30:46 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v10 2/6] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Tue,  6 Oct 2026 06:30:04 +0800
Message-ID: <20261005223011.1124347-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005223011.1124347-1-coiaprant@gmail.com>
References: <20261005223011.1124347-1-coiaprant@gmail.com>
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

