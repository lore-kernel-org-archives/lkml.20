Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626162;
	b=cifsj6DG0SmUALdF3JDGw2Jbv9pJy8+nK5VrMN4JxB6F0gSVdv5bDfxA98MlyQWkUFo7
	 PqGcqdLCDWiucQywmJGjDrirzk7qRuwGLIaWcCSpr/9Qj0vn4PR6BaP44qkWVJ4WbYvhx
	 ZLRapFAXmdj1YnPYbvyGqIo8LG6W0v49VdEI/gBe0TjkRqANY7KV79Inz5/wNBcmJSMls
	 8AozyBM9hIgSWQDwxuvOxvazZh8eS/lVXzli7IApge2rmJiO1urq8zad1KAeke0do1as4
	 uDS15FE2lvnEimNGep+zGAi0N3SgN+mU3BVsPyIEpRzFjdi8NfxrxNUGFoW36FOc2Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ty31UixZMR0FOPCqD5p7Tp42Nj5uvmQqWeSDdyuvVR8=;
	b=axTb5UfFD4XUJ67EBmKQkE4DYRrBAmo7+p8aKcpk/ly5lDg7pH6qETV3XjI3CsTaodkl
	 MIGhBzeVngPEaU0zWXsuoUZxzRoIr4COMIr68+PHaS6MK2B130MyWC2TnqGTWQVhTxt+q
	 qrqiNwdkg3CzfkGTwm/Kk2ISG+NIxd9a6qnnLERkDtB7CVJ+0LDLJmvqx9FDO5UogBm/l
	 VIhWGV/w4Q3AqTobEFLgEfXJpNlWgGuqxlmfEjoHXevqpFOiqGC7oZBB5m7Xg8Vn1M1m5
	 s/mpSPX+85n6SPRp8a61wvemMH833SUEKSThBdLZW5hcsahvKmZuGqSrzOUfgA9oJqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndpEhwdB;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6B7606A336
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF6B7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndpEhwdB
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535a54bed9so4523209eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793626161; x=1794230961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ty31UixZMR0FOPCqD5p7Tp42Nj5uvmQqWeSDdyuvVR8=;
        b=ndpEhwdBXmtUGjuQLkcC3iwaf4xRR1PCLTmUssQjyIcMFCSIIvC3wmWF+y0P0TRAl9
         zTgMqhoqo3vzNcDTbpdWS9nu+wCxLecI/ouwzpv1aAX1W5qZ07sYUi/C8udcSTgdpgRb
         kWkoCPtSKa3/kqXmUaeqe1Jq9S/WQn/S99+9+LJGZWaCf48C0K9qPGhXFCnAH2Is4qrL
         jsOrQt0OVuyN3jyciRqpLFrebfqYVnN/fdOIBSpurBBWa2MjwNJJZw8V0XxRkYnGOo/F
         WLNol46b8fcaWjo4dgbRUH7VDcUGPz/bnHJK4ee4ne/B3D0ijcZcSTUYOAvKsVXBhr4O
         JP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626161; x=1794230961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ty31UixZMR0FOPCqD5p7Tp42Nj5uvmQqWeSDdyuvVR8=;
        b=yA2hTZ1+/M/s/HVDprtyyjZXBkynfak4khgfCBmrKIQFeDLHwiZ8KupJwY1lJNoTqX
         hmxwZ22SaYIVEoirAlrTMH7aRAvTGGUosm4nb+2JnTi+rpZpkG848zGYnBtaQLtvPt0r
         j29Z1HJ/YpN9LIIYW2ZqawaqKj7MMgAhxt9sfgS3B+6JJAsiqm6p6EYAznZHeIT2/GCU
         oUoOHr+R3y/8IgLgUtuqBnOeU0TmcEv31dOCOt4IyvLfa/2AdKKiZFLtms87wRZajGmM
         QTpeRS+d+fkLQ32z2e1jF9YVNrmgvjowRaLwBPA8lrjZ5mIpnkrWhyOKvmSNoS5prI19
         m9cw==
X-Forwarded-Encrypted: i=1; AKwUvBx45ajmVt/MWNPkE5G5CZRuijPLdWOvH0VFxao+Njj1CEWsfeXP1sTnHllQFsKuRU9LcdiFSEmcfejsoc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl82HewglEAbwuw09oVqkJl41hpYAJT5Z3/o013PkS2bYQwlNt
	WKFQxXHSGWCldECf27tQvlTf5B3KNgL+nEqjBbRmvnuT0HIVu/aHxByu
X-Gm-Gg: AYBFou14iMdZ+m++7VQSJdHHyIPoHWFV/kHuvrgy1i0NTWwZqayoPutAxbJ6k2oVlAl
	78BPnw9x6fG6L4i+i0YyiL6FQQ3t4FoY1FaarV7u2W0FfakVEx/Skm87HIephCF1qzHab9Mx2W1
	//bLvqn1G35/oNoLBXtoAAD99gr/C66Dy2EqSgCaEsLd1trwcMC8Bh2V6YcoQ9ghKLcjqVyC00K
	kmxxOy4wtXLcqjXXgklfXjFudmq4AygPLPvPf+E562+RWhvy8Ppq05Ad4ZWd1rgkoH3BDDKCPBI
	RsEEHIvQOVsIgB7phFALZchjWBcoQFg+ib6PbhUupFZm+L9EzIlzobe2XukO6W2dEqWOp5vDUOT
	TXhZByWQLK+SHbOYi7TfeDQ2LmqkhJG9IoHM1TR3tbbY2GoaGI3g/KSh718Kb8Jv+P4nPeNqeNG
	mEXqjhN9Hosnu/1hxG5NAJzHhatF7sNqV15AFtzTahB/5OjrYOqCy+wrCGXYqNvXASEoGyjEicw
	pG5VJzfuNvExdgez8V5mT2/+oLg5iAWgkI5VA5Ufflto19lLqx1iODIxliWOYUBN77CcX1arpKv
	+zrokLTPUzKQUVkwn/6Efffu4psn2aDrl7kyqjpmjRgffoStz257ecGQK+qDt3AZ6bdwWgb+/+S
	8+0u4THfXZ+3bXPwvLpyIZP2m
X-Received: by 2002:a05:701b:4502:10b0:163:fd28:5658 with SMTP id a92af1059eb24-1ac5b02289fmr15049596c88.22.1793626160847;
        Mon, 02 Nov 2026 05:29:20 -0800 (PST)
Received: from ubuntu-22.. (36-229-14-41.dynamic-ip.hinet.net. [36.229.14.41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcf67csm34357844c88.21.2026.11.02.05.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:29:19 -0800 (PST)
From: Tommy Shih <tommy.shih92@gmail.com>
To: netdev@vger.kernel.org
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"Lucien . Jheng" <lucienzx159@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: phy: air_an8801: add WAKE_PHY Wake-on-LAN support
Date: Mon,  2 Nov 2026 21:29:03 +0800
Message-Id: <20261102132903.713908-1-tommy.shih92@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AN8801R can wake up the system on a link change, but the driver
only supports WAKE_MAGIC and always masks the link change event on
suspend. Supporting WAKE_PHY allows the system to be woken up when
the cable is plugged in or unplugged.

Add WAKE_PHY support:
- Keep the link change interrupt enabled, and only disable it on
  suspend when the PHY is set to wake up by magic packet only.
- Report a wakeup event when a link change interrupt is seen with
  WAKE_PHY enabled.
- Enable device wakeup when either WAKE_MAGIC or WAKE_PHY is set.

Signed-off-by: Tommy Shih <tommy.shih92@gmail.com>
---

 drivers/net/phy/air_an8801.c | 38 +++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/net/phy/air_an8801.c b/drivers/net/phy/air_an8801.c
index f97c78e43023..bf09c1fee398 100644
--- a/drivers/net/phy/air_an8801.c
+++ b/drivers/net/phy/air_an8801.c
@@ -560,7 +560,7 @@ static int an8801r_led_init(struct phy_device *phydev, u8 *led_cfg)
 	return ret;
 }
 
-static int an8801r_reset_wake(struct phy_device *phydev)
+static int an8801r_reset_wake(struct phy_device *phydev, bool suspend)
 {
 	struct an8801r_priv *priv = phydev->priv;
 	u32 reg_val = 0;
@@ -584,7 +584,10 @@ static int an8801r_reset_wake(struct phy_device *phydev)
 	if (priv->wake_magic_enabled)
 		reg_val |= AN8801_WOL_WAKE_MAGIC_EN;
 
-	if (priv->wake_lnkchg_enabled)
+	/* The link change event is needed for link state interrupts while
+	 * running, but must only wake the system up if WAKE_PHY is enabled.
+	 */
+	if (priv->wake_lnkchg_enabled || !suspend)
 		reg_val |= AN8801_WOL_WAKE_LNKCHG_EN;
 
 	ret = an8801_buckpbus_reg_write(phydev, AN8801_BPBUS_REG_WAKEUP_CTL1,
@@ -603,7 +606,7 @@ static int an8801r_ack_interrupt(struct phy_device *phydev)
 	int ret;
 
 	/* Reset wake status */
-	ret = an8801r_reset_wake(phydev);
+	ret = an8801r_reset_wake(phydev, phydev->suspended);
 	if (ret)
 		return ret;
 
@@ -651,6 +654,7 @@ static int an8801r_config_intr(struct phy_device *phydev)
 
 static irqreturn_t an8801r_handle_interrupt(struct phy_device *phydev)
 {
+	struct an8801r_priv *priv = phydev->priv;
 	u32 irq_status = 0;
 	bool irq_handled = false;
 	int ret;
@@ -670,6 +674,8 @@ static irqreturn_t an8801r_handle_interrupt(struct phy_device *phydev)
 	}
 
 	if (irq_status & AN8801_IRQ_WAKE_LNKCHG) {
+		if (priv->wake_lnkchg_enabled)
+			pm_wakeup_event(&phydev->mdio.dev, 0);
 		phy_trigger_machine(phydev);
 		irq_handled = true;
 	}
@@ -680,6 +686,7 @@ static irqreturn_t an8801r_handle_interrupt(struct phy_device *phydev)
 static void an8801r_get_wol(struct phy_device *phydev,
 			    struct ethtool_wolinfo *wol)
 {
+	struct an8801r_priv *priv = phydev->priv;
 	u32 reg_val;
 	int ret;
 
@@ -691,9 +698,12 @@ static void an8801r_get_wol(struct phy_device *phydev,
 		return;
 	}
 
-	wol->supported = WAKE_MAGIC;
+	wol->supported = WAKE_MAGIC | WAKE_PHY;
 	wol->wolopts = 0;
 
+	if (priv->wake_lnkchg_enabled)
+		wol->wolopts |= WAKE_PHY;
+
 	ret = an8801_buckpbus_reg_read(phydev, AN8801_BPBUS_REG_WAKEUP_CTL1,
 				       &reg_val);
 	if (ret)
@@ -717,7 +727,7 @@ static int an8801r_set_wol(struct phy_device *phydev,
 	if (!device_can_wakeup(&phydev->mdio.dev))
 		return -EOPNOTSUPP;
 
-	if (wol->wolopts & ~WAKE_MAGIC)
+	if (wol->wolopts & ~(WAKE_MAGIC | WAKE_PHY))
 		return -EINVAL;
 
 	if (wol->wolopts & WAKE_MAGIC) {
@@ -775,9 +785,11 @@ static int an8801r_set_wol(struct phy_device *phydev,
 	}
 
 	priv->wake_magic_enabled = !!(wol->wolopts & WAKE_MAGIC);
+	priv->wake_lnkchg_enabled = !!(wol->wolopts & WAKE_PHY);
 
 	return device_set_wakeup_enable(&phydev->mdio.dev,
-					priv->wake_magic_enabled);
+					priv->wake_magic_enabled ||
+					priv->wake_lnkchg_enabled);
 }
 
 static int an8801r_of_init_leds(struct phy_device *phydev, u8 *led_cfg)
@@ -1040,8 +1052,6 @@ static int an8801r_probe(struct phy_device *phydev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->wake_lnkchg_enabled = true;
-
 	phydev->priv = priv;
 
 	/* Mark this PHY as wakeup capable and register the interrupt as a
@@ -1063,12 +1073,11 @@ static int an8801r_suspend(struct phy_device *phydev)
 	int ret;
 
 	/* If the PHY may wake up by a Wake-on-LAN (WOL) event, disable the link
-	 * interrupt to only keep the WOL magic interrupt enabled
+	 * interrupt unless wake on link change (WAKE_PHY) is enabled
 	 */
 	if (device_may_wakeup(&phydev->mdio.dev)) {
-		priv->wake_lnkchg_enabled = false;
-
-		if (phydev->interrupts == PHY_INTERRUPT_ENABLED) {
+		if (!priv->wake_lnkchg_enabled &&
+		    phydev->interrupts == PHY_INTERRUPT_ENABLED) {
 			ret = an8801_buckpbus_reg_clear_bits(phydev,
 							     AN8801_BPBUS_REG_WAKE_IRQ_EN,
 							     AN8801_IRQ_WAKE_LNKCHG);
@@ -1077,7 +1086,7 @@ static int an8801r_suspend(struct phy_device *phydev)
 		}
 
 		/* Reset WOL status */
-		ret = an8801r_reset_wake(phydev);
+		ret = an8801r_reset_wake(phydev, true);
 		if (ret)
 			return ret;
 	}
@@ -1090,7 +1099,6 @@ static int an8801r_suspend(struct phy_device *phydev)
 
 static int an8801r_resume(struct phy_device *phydev)
 {
-	struct an8801r_priv *priv = phydev->priv;
 	int ret;
 
 	ret = genphy_resume(phydev);
@@ -1101,8 +1109,6 @@ static int an8801r_resume(struct phy_device *phydev)
 	 * state interrupts.
 	 */
 	if (device_may_wakeup(&phydev->mdio.dev)) {
-		priv->wake_lnkchg_enabled = true;
-
 		ret = an8801_buckpbus_reg_set_bits(phydev,
 						   AN8801_BPBUS_REG_WAKEUP_CTL1,
 						   AN8801_WOL_WAKE_LNKCHG_EN);
---
base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
branch: an8801-wake-phy

-- 
2.34.1

