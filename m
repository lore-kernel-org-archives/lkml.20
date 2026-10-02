Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0E04156C5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975065; cv=none; b=UNiWqYlU3Eoq42tf2/BgWC9+qCR5uEGYaV6YoY9HmBijH9VPpUrG8It1f/9OxsS+67HAvVRMoKjXcdGcEOXWA+UO7R3AzFeRP8Ku2iTk5Tk0gdZ2TIRcWZD3wRBlndpaewqcrq5hImEJr1NxfzfA5998LkThLSc/Ue8+dd4C6LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975065; c=relaxed/simple;
	bh=aS/zgMKKQa0mwd5rsVFA0VpbxW5kttdKhN4mjr0av5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kfVkRtS0rymfswzauUH03uqKUbuwv/esQUsIqwaUKxBx+UEIqPKgzMN0LjNWhCbwH6I13ZfJ9mqEo1eAYTn3XYuGfc/8twPp4TyGzFAh7In+kwhYifeFyP4Z+A7Tpj708oov3ylBs2154QZyl+qrDBk82i1LPOkaaunUDFK7Q+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9Pstm0L; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9Pstm0L"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso26491366b.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790975061; x=1791579861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3LZSuLJPTreHs1MJsGo83hNGHNavYJO/wgNdWggT30=;
        b=r9Pstm0LGqDYLFZra5NbGcTMTgqxJb2Q4y9Vv3c5Cy9pYnhIHI9Xojmt/0cz1+eOi1
         KgLONgkuaqIT0YX5VcxEpW3pRdZvcY8PfUFLJ3ZIlWyqihpV6Sck71nVB7nSXNG4HQjm
         fo9RodtOkoT4D5a1eL9qrTHEl5qVXFvcDSd5ZzfOCsQZR9GpS/eLMX+ucuOGQw2OvtmQ
         8Qyusyp/x4F75chV8h2B+ZCHDOF76rzI9BL3Ba/hQQhnV0QRZff76DMjwESu2JLv8rrM
         TJKSbMLwvgVoG2+IdXrixwVR330muPDogNOl3glU7VLnVp2IW2QdYZhBxMhAdiCVmj3k
         1OJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975061; x=1791579861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3LZSuLJPTreHs1MJsGo83hNGHNavYJO/wgNdWggT30=;
        b=Aohk+oDHHbLh1SequRNrqpRX0hDFstU2MAPxvfMijkBTJh49d727GmQBRwMJZes9wK
         FjeDQoRRfsV43+RJg8E/25xM1A5yg5DFNj/zwcesB+Bf7b/8Vw5bci4jTfpisLomBeHW
         JK0BXRApk0uwHekVlaxDgsdT8bdbH5hwmN8G5BrrlbnkxFZk2a/IRfI8x1sdZ8+rtrcg
         l1ux9gGjnfx0n3QlTbfCw0AO9fgMxGCbgqLdnSRnhF3TfeYgEM3ofmDyVzv89xiNGshj
         04/OsyQGTIcTOH8jkmcZeGZoTmxxzPjyu46XPKP2WKz/FrBa5bbCa4zMzG0Vg+VuaC+j
         BRJw==
X-Forwarded-Encrypted: i=1; AKwUvBxUpEOrwOXCfNzgP9o3ASZzpNycmB1UzuHIU8KuGGt3O4iVSsS/FP1sHGpQTRFrWzyb9oeuarMkakmZMis=@vger.kernel.org
X-Gm-Message-State: AFuF++mxY5B0HJ+74i09s3fcOuFY3wn54b3YXZOAuhJpvFZiHO6j8Fav
	8yoWoqjwngn2h4t1YLysCDdfT3f9Ui8RxxccCSPFJMPJvwp5gGv7sjUw
X-Gm-Gg: AYBFou1JmencvbVw6SuQDV2OQpQrV4gkAkOibexs/FeItLVoTCF88VUImDy3Oni5QS5
	rp3yZ5vBRHiABtzTDncByKH3o8y/NGFvZQ9c0llGjfFoJa/3SjlfYVipm+dcmflhdVr8Qs+XHzS
	MjWhjZkVPefFu6TxQZvOm/37XowqFj2thhv+syTHfLDLsP5dZzD8wFcVwPhlsKRkhQvhtdVTp/8
	+TYGJZvQ5MdJ7uBDuSYaINDzCU9WK6Ova5HtSbFwICoAmnByi7WhpnptLY2i4b7THhTHUJO/aVw
	4ZNFGTrTOQZ4c0vdGL4WhgQ6xzINKs+xtZqjNOVt0ccKMXTrORphgIV4snuMCt7UFgalY1blHyq
	QZhAQbqcM7Qs1nIrpsUyGsOP3IOO0BuyQ3WfllmfKStjIeIVOUlGtin2AoW9Mz9KDsTgvkr8SGw
	yf9augtAlP1t6RHqfCKjUCz+pPaT9Hxfekw2FKlrbwUQfmLJ6ULNd3MGHi3a3PG4jI/KG4XXMw8
	Hv2knbWO9CuY/B+ka7ICH5FRNR6Mc4WC6GfhJX0Pp+VJ7aWEcdTW/Iifd9UBevtuP9WwIWrPVD6
	LCeBLuXjq6kv5uoDZsWUZAY=
X-Received: by 2002:a17:906:d553:b0:c29:65ef:b907 with SMTP id a640c23a62f3a-c2e6edf32c4mr27814966b.26.1790975061417;
        Fri, 02 Oct 2026 14:04:21 -0700 (PDT)
Received: from localhost.localdomain (83-233-130-206.cust.bredband2.com. [83.233.130.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4da9dfc2sm130029966b.5.2026.10.02.14.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:04:21 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	George Moussalem <george.moussalem@outlook.com>,
	Ziyang Huang <hzyitc@outlook.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] net: phy: qcom: at803x: Apply IPQ5018 analog settings at probe
Date: Fri,  2 Oct 2026 23:04:08 +0200
Message-ID: <20261002210408.730-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipq5018_probe() pulses the PHY reset, after which the IPQ5018 internal
GE PHY starts autonegotiating with its reset-default analog settings.
ipq5018_config_init() writes the analog settings only when the MAC
attaches the PHY, usually when the interface is opened. On a board
where the PHY connects to a QCA8337 PHY without a cable, 1000BASE-T
does not come up in the meantime, SmartSpeed downshifts both PHYs, and
only the IPQ5018 side restores its 1000BASE-T advertisement at attach,
so the link stays down.

Apply the analog settings in probe right after the reset and restart
autonegotiation. Move the settings into a helper shared with
config_init() and return MDIO errors from it instead of ignoring them.
The values written do not change, only the time of the write.

Fixes: d46502279a11 ("net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support")
Signed-off-by: Yongzhao Chen <yongzhao.derek@gmail.com>
Assisted-by: LLM
---
Changes since v2 [1]:
- Dropped the DAC value fix (v2 1/2), now in net as commit
  20f3599d85b4 ("net: phy: qcom: at803x: Fix IPQ5018 short-cable DAC
  values").
- Shortened the commit message as Andrew suggested [2]. No code change.

Tested on a Redmi AX5400, where the IPQ5018 PHY connects to PHY4 of a
QCA8337, with OpenWrt's Linux 6.18.52. config_init() ran about 39 s
after the reset. With the probe-time writes, 1 Gb/s came up in 3/3 warm
boots, against 0/3 without. With the backport and SmartSpeed enabled,
the link was verified to recover to 1 Gb/s after a power-off cold boot,
reboots, interface down/up cycles and renegotiations. Splitting the
settings over 26 warm boots showed that the early DAC write decides
the outcome on this board; the patch still applies the whole set, as
config_init() does.

George, probe accesses the PHY right after reset_control_reset()
pulses GCC_GEPHY_MISC_ARES for about 1 us, with no delay. The vendor
SDK waits 200 ms after every Ethernet reset. Does the GE PHY need a
minimum delay or a readiness check after ARES is deasserted?

[1] https://lore.kernel.org/netdev/20260928220717.939-1-yongzhao.derek@gmail.com/
[2] https://lore.kernel.org/netdev/f8e1f642-8250-4c1f-be1c-713a0026282e@lunn.ch/

 drivers/net/phy/qcom/at803x.c | 98 +++++++++++++++++++++++++----------
 1 file changed, 70 insertions(+), 28 deletions(-)

diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index cacbadf1f48..09105f1e373 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -1019,10 +1019,10 @@ static int ipq5018_cable_test_start(struct phy_device *phydev)
 	return 0;
 }
 
-static int ipq5018_config_init(struct phy_device *phydev)
+static int ipq5018_analog_init(struct phy_device *phydev)
 {
 	struct ipq5018_priv *priv = phydev->priv;
-	u16 val;
+	int val, ret;
 
 	/*
 	 * set LDO efuse: first temporarily store ANA_DAC_FILTER value from
@@ -1030,39 +1030,66 @@ static int ipq5018_config_init(struct phy_device *phydev)
 	 * is written to
 	 */
 	val = at803x_debug_reg_read(phydev, IPQ5018_PHY_DEBUG_ANA_DAC_FILTER);
-	at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE,
-			      IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_MASK,
-			      IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_DEFAULT);
-	at803x_debug_reg_write(phydev, IPQ5018_PHY_DEBUG_ANA_DAC_FILTER, val);
+	if (val < 0)
+		return val;
+
+	ret = at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE,
+				    IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_MASK,
+				    IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_DEFAULT);
+	if (ret)
+		return ret;
+
+	ret = at803x_debug_reg_write(phydev, IPQ5018_PHY_DEBUG_ANA_DAC_FILTER,
+				     val);
+	if (ret)
+		return ret;
 
 	/* set 8023AZ EEE TX and RX timer values */
-	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_EEE_TX_TIMER,
-		      IPQ5018_PHY_PCS_EEE_TX_TIMER_VAL);
-	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_EEE_RX_TIMER,
-		      IPQ5018_PHY_PCS_EEE_RX_TIMER_VAL);
+	ret = phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_EEE_TX_TIMER,
+			    IPQ5018_PHY_PCS_EEE_TX_TIMER_VAL);
+	if (ret)
+		return ret;
+
+	ret = phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_EEE_RX_TIMER,
+			    IPQ5018_PHY_PCS_EEE_RX_TIMER_VAL);
+	if (ret)
+		return ret;
 
 	/* set MSE threshold values */
-	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MSE_THRESH1,
-		      IPQ5018_PHY_MMD1_MSE_THRESH1_VAL);
-	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MSE_THRESH2,
-		      IPQ5018_PHY_MMD1_MSE_THRESH2_VAL);
+	ret = phy_write_mmd(phydev, MDIO_MMD_PMAPMD,
+			    IPQ5018_PHY_MMD1_MSE_THRESH1,
+			    IPQ5018_PHY_MMD1_MSE_THRESH1_VAL);
+	if (ret)
+		return ret;
+
+	ret = phy_write_mmd(phydev, MDIO_MMD_PMAPMD,
+			    IPQ5018_PHY_MMD1_MSE_THRESH2,
+			    IPQ5018_PHY_MMD1_MSE_THRESH2_VAL);
+	if (ret)
+		return ret;
 
 	/* PHY DAC values are optional and only set in a PHY to PHY link architecture */
-	if (priv->set_short_cable_dac) {
-		/* setting MDAC (Multi-level Digital-to-Analog Converter) in MMD1 */
-		phy_modify_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MDAC,
-			       IPQ5018_PHY_DAC_MASK,
-			       FIELD_PREP(IPQ5018_PHY_DAC_MASK,
-					  IPQ5018_PHY_MMD1_MDAC_VAL));
-
-		/* setting EDAC (Error-detection and Correction) in debug register */
-		at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_EDAC,
-				      IPQ5018_PHY_DAC_MASK,
-				      FIELD_PREP(IPQ5018_PHY_DAC_MASK,
-						 IPQ5018_PHY_DEBUG_EDAC_VAL));
-	}
+	if (!priv->set_short_cable_dac)
+		return 0;
 
-	return 0;
+	/* setting MDAC (Multi-level Digital-to-Analog Converter) in MMD1 */
+	ret = phy_modify_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MDAC,
+			     IPQ5018_PHY_DAC_MASK,
+			     FIELD_PREP(IPQ5018_PHY_DAC_MASK,
+					IPQ5018_PHY_MMD1_MDAC_VAL));
+	if (ret)
+		return ret;
+
+	/* setting EDAC (Error-detection and Correction) in debug register */
+	return at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_EDAC,
+				     IPQ5018_PHY_DAC_MASK,
+				     FIELD_PREP(IPQ5018_PHY_DAC_MASK,
+						IPQ5018_PHY_DEBUG_EDAC_VAL));
+}
+
+static int ipq5018_config_init(struct phy_device *phydev)
+{
+	return ipq5018_analog_init(phydev);
 }
 
 static void ipq5018_link_change_notify(struct phy_device *phydev)
@@ -1111,6 +1138,21 @@ static int ipq5018_probe(struct phy_device *phydev)
 
 	phydev->priv = priv;
 
+	/*
+	 * The PHY starts autonegotiation as soon as it leaves reset. Apply the
+	 * analog settings now instead of waiting for config_init() at attach
+	 * time, and restart autonegotiation so that it uses them.
+	 */
+	ret = ipq5018_analog_init(phydev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to apply analog settings\n");
+
+	ret = genphy_restart_aneg(phydev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to restart autonegotiation\n");
+
 	return 0;
 }
 

base-commit: 6dc989ea46b96ce170840174b4a38c4a387fb005
-- 
2.43.0
