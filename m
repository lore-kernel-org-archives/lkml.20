Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98065013CA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633258; cv=none; b=oyFHP36oGgAOZVyAVrVfO1CM53aLXo3JIYgV235mbWL1gLMDKshHFFxHAs4wjF6cpS2cic1ZP5vVcZB2nBnok3v2B2Yv6X28GUj1HEcD2+c7EqCGTWb20y+i/204k3KEI6Jc1I+FjNZK4vBIEZo6llG85oD/doaZQUPMPLYqpUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633258; c=relaxed/simple;
	bh=zD3M3CBCJdpPC7S8m351jeyj/gsPNWVUtdStjI+MALw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3weaX/lANs70hWWrXFwsREdkrJtRQjyW78SOw/LsL0AmdgvD6CzRYEFDHkXGa1X3fyZBIqwCcMZNUiqV9errdEGvNVnDM+a5miaNzA8O2V8/sPfY+Ieobcv4ZXzmpjFEckMwT4+pzimU3hw8uvs3W44JGjM/toOW3YupbB3MDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbilFBnk; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbilFBnk"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af7721e4aso472353066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790633253; x=1791238053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mlKmUSED6Ws/3pkdZYMZVn9BgxD5dhN9L6Sjup7zJgM=;
        b=BbilFBnkB+HcuiqFUT1o9qVSgiWJbqJ5T4ALaqmLdnZuFvEnr+C72ZRagkGnxMaAnW
         px66yYaA1P6Yfo39mDKNfmxWJHNwNoOunvfD4jRUI6Ct5iLfMDmjPYQ27Fq8l4L9yCJH
         NOOffrDzdVSDlTCoVJbRk448ohl93CNt2OnC9mXWJmy+cCIzpe1ioiqlx76Vnl6YLv0I
         vtqumiFsXz8XEk/7cFAgW2EM8Kfsf3Tqs2w6pPFfX/C4xyUCCL8IhZaPcb56NFcX+4Oi
         0Ktr86HiYQOkKljZEKTk9/9d+MffGocn56lgFeP9nroBratcH85d0Y1jXgk9Q0l0jzYg
         IfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790633253; x=1791238053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mlKmUSED6Ws/3pkdZYMZVn9BgxD5dhN9L6Sjup7zJgM=;
        b=DPwKaX5zbwhtA+1URatvQZUQZK23S+WZwjCrBuiR82Wqg8inZ74sberZNRM4ZZVXML
         5AkN0k2dsITlqXCugVTD4EHjDlLaPo25BHav/Xl0iVdHduVfk6L35nszNtNAMDbBW6aR
         grs9cF+u9WxExwxwsiWPmlltHIDBhPiN1Vq64t/vdRzFRx/Ze41Mhix2JkF91wKyTKW7
         i0djzfcOUk6ReybPndmbIqUbwCMF87t8nMgbKgCaKVmomfuVd1RuY/4FWiWYt8hpdfsH
         d8kZbbgfyacmZrhMbEvHgJKeqQjoduJmnKLGvdTcMZ+CxTyT69RBtPVDXdjEaVowDEvD
         C1UA==
X-Forwarded-Encrypted: i=1; AKwUvByBmBZiJRRxl3pam0Z1YmF4efRyPP4fdueLt94TtL0NVfD14p3P8cpWfwmYTnYaLOZDanZRwmcVJT4AkiY=@vger.kernel.org
X-Gm-Message-State: AFuF++kSxrSRFgf5SOiJj+/bDyN7MWyYFpg1sEcsoFEfR4d5ci8pm0M1
	UCGyeyQ9+o4G0WyJPmFNhEUbUEZkJICUhkkpwWNkCPyTMVm2gC1CIoP9
X-Gm-Gg: AYBFou18xm/MgzepmAs7E+BJGQgY/GkFZpAkK4HhsTxNKZ9ias5bPvagWhCpVoJLnLc
	A9HjxuDNha7oRks06P7vF7xAZC5YT9h2zMPyQvVchqmeUWqPWW0RjJyNQZnI+E5v0Px6LQz7BZT
	yvbviwLGTC1UFKqSVxlSsDCW6dO7pf8ATaGVm2g8Jd0GViG/IWUGI/w0l5Ly/I5LoX9ajwdZBXc
	mHJPfFodvjGybaGFgFmC7FNcRR780UEGtXrvq6TlyWZRlqr4+LheKFWEPaNhQxxw4Uq83LsmdAJ
	1zGGTACFM992QN2epdCaBRHva/lPjtmuePYd0IUt7gC1VurA40RiZvVTeE0uy4ubG/F1QaECyrJ
	r/hwCWRY1s0lmPt3FOuKASliLsnjcYAoygxpBW8JIoc0UjHWMcazlOwGSaMOKi3uNzQrymcfpAi
	RqvFWZPDp9nZSjIF4XiYvxyOwsIBnuZY2EWhHcAJySmx44zW0F3wLnvWaTw9BXLv1Dh0xgEktzD
	zdLfkCU42D92X5XF301l2CMk/STlEMEbvFh3MncSIpD66xXmNxAj9Gv
X-Received: by 2002:a17:907:3c8d:b0:c2d:ccfb:25e7 with SMTP id a640c23a62f3a-c2dccfb345bmr429312066b.17.1790633253430;
        Mon, 28 Sep 2026 15:07:33 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:793:68fd:c07a:9093:1956:b4bf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm540308966b.33.2026.09.28.15.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 15:07:33 -0700 (PDT)
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
Subject: [PATCH net v2 2/2] net: phy: qcom: at803x: Apply IPQ5018 analog settings at probe
Date: Tue, 29 Sep 2026 00:07:17 +0200
Message-ID: <20260928220717.939-3-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <20260928220717.939-1-yongzhao.derek@gmail.com>
References: <20260928220717.939-1-yongzhao.derek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipq5018_probe() pulses the PHY reset, and the IPQ5018 internal GE PHY
then starts autonegotiation on its own with its reset-default analog
settings. The LDO, EEE timer, MSE threshold and optional short-cable
DAC values are only written by ipq5018_config_init(), which runs when
the MAC attaches the PHY, usually when the interface is opened.

On a Redmi AX5400 board, the IPQ5018 PHY is connected without a cable
to PHY4 of a QCA8337 switch, and "qcom,dac-preset-short-cable" is set.
Between probe and attach, about 39 s in these boots, both PHYs
resolved 1000BASE-T every 2.5 to 3 s, but the link did not come up.
After about five attempts, SmartSpeed downshifted on both sides at the
same time: the IPQ5018 PHY stopped advertising 1000BASE-T (CTRL1000
0x0200 -> 0x0000), and so did the QCA8337 PHY (0x0600 -> 0x0400). The
soft reset at attach restores the IPQ5018 advertisement, but nothing
restores the QCA8337 side, and the link stayed down, also after
taking the interface down and up again.

Apply the analog settings in probe right after the reset and restart
autonegotiation, so that negotiation runs with them from the start.
Factor the settings into a helper that is also used by
ipq5018_config_init(), and return MDIO errors from it instead of
ignoring them. Probe fails with the error; config_init() returns it.

genphy_restart_aneg() sets ANENABLE and ANRESTART and clears ISOLATE.
With the reset-default BMCR value of 0x1140 read on this board, this
is the same write that was tested (BMCR | BMCR_ANRESTART).

The same values are written on every board with this PHY; only the
time of the write changes. On boards without the DAC property, no
DAC register is written.

The same writes and the autonegotiation restart were tested in probe
on that board, in OpenWrt's Linux 6.18.52 kernel, over 3 warm boots
with and 3 without them. Without them, the link did not come up in
any boot, with both sides downshifted as described above. With them,
1000BASE-T came up in every boot less than 3 s after the QCA8337 PHY
was reset, before the interface was opened, and the QCA8337 PHY kept
advertising 1000BASE-T with SmartSpeed enabled. The DAC values written
in probe were still in place after the BMCR soft reset at attach.

This patch, backported to the same kernel without the downstream
SmartSpeed workaround, then kept the link at 1000BASE-T with SmartSpeed
enabled on that board over a first boot, a power cycle, three reboots,
three interface down/up cycles, three autonegotiation restarts, a
network restart and 10 minutes of operation.

Fixes: d46502279a11 ("net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support")
Signed-off-by: Yongzhao Chen <yongzhao.derek@gmail.com>
Assisted-by: LLM
---
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
 
-- 
2.43.0

