Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3AE524AE3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788553697; cv=none; b=PmvlOyVTd3x8d/kbg2l+pJ4v+fQ13IfDJ/L0fZjflmqKYXwuGDApIdd2ieTBSz2jBegdhrjriwdDREHWOzfvb2/3R5O+RCTUqnlelS+tQo1ezHOsBs1Tf7r+QgOcWS0k3KGpwVswolHYf0FS4tafyGzchegSMvmHQvxQCVYbd5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788553697; c=relaxed/simple;
	bh=zSDuYRz2m3SJMlrT8Lw4ThkmL4/X3hYMhkQwUJ2m4zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yz1q0vG8drlcRMOUr3KPrNEVzFpoPHguiFqFEGHWX9sOpfAKWkd7nlr0A+BzXMwakuwo/r0LggRE91clpvAC2ZuCcfEAfV0FWrZ//S07XaxZMe3x60KgWEjDtDgFKc2Vuno9UG9Qm0Ek5wc24Uw4EZH8jc1zTVOu2fIDG7Pd8Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFGJDDPn; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFGJDDPn"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a1a3bb6c5dso12810561fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 13:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788553686; x=1789158486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVdNxRn8VX1xv7coC4B1x70wb/kGKPtSJ0jnUzAdilQ=;
        b=DFGJDDPnzUra4FzYC4wYRoZu1UNVBG0vty9uc9ASFCZDLIpPD78IU/DRVV3jsoSB9X
         e+fZXZoxHoTO8Yfd0QsWF4eaQPeF50S3bEM2lUiK153ecW99USOfVZPtBHAs5X3pAOMH
         61Qe1XMhW60dyf2GclNV/DMcXwR+1l7Qbr0AWI/gdHmAsotFWT4+HJ61rfAnv2gDoojz
         d3fHe921SPfrweVl9xZPTY9sY70MZEpaUaPaOiZVi0SP6GMQIFU/lxBRbg6+Mt5w282j
         qeZCiTOZ500RP6RqO4c3NBHjhiC3m7bekss9Hmsik2aKMiOdeZOPGNzkC8ick+MlrFpa
         4aIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788553686; x=1789158486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVdNxRn8VX1xv7coC4B1x70wb/kGKPtSJ0jnUzAdilQ=;
        b=gIpKIEpdkk/ugJeysF/Qtquhp6YHDH99S83f7loXLHN06pjjOwvNweEAn0hYjpZWNZ
         qOCWb2M+3/Mw/o03z7d4SGS2UbUZhFDWtHp20fCjzQETxcvXyvQ8ctPSJ3rr/k7rvqdg
         L+m6V1Sa6Xo0z/np7EZYd3Eokm0yk3Vr7PhbXqeSdAZbNg7uxYcT+TYbAha891eXHQPI
         T0fMqzGUWKuzugPyN4TzbKksigyyOncXaiBmVF2QAqJObebh148rFHiZU3Xocr0q7XZP
         y0EORcONOq5Qi0VeZxDjNT3g6XY2bCAREsaL6YRXIZue5Mj8mJb3EQtYHGOGDHo/1p/G
         UjMg==
X-Forwarded-Encrypted: i=1; AKwUvByaP+qOUbsJ0TKAI7OvsLp2wBdD9BIiTTv0/CKWiPsm/V1oP1H1L0FiPx9JUBCCy9GAqVrwG/5jGJ5nP2E=@vger.kernel.org
X-Gm-Message-State: AFuF++lmcQfgMMKcUg7xAiv+/w/9Vfue9KAvS2aWcgQ2aGHVidAGCxMW
	AKyIamWCMhczBafbNtFczUBcZIXSPPZw7ckRSjBt5d0xf3LJt1zavv8=
X-Gm-Gg: AYBFou1ujufviY2NFAfg6lBWRzWA/pYpjl4d8G34g4Sy4tcbo4Aj6MnpzAEe683IbqW
	G4bIYB/Bb1/0+9dRBBK+6ykVX4EPYSFbWhl+sqRihMRjeAeJkL65eyr9sjqgs3AFciA9TyiYXcT
	OI89JAaKqZ25aw1gb1rTc/P1+0LLQSHatobeBMnqYPe8HJ2tE4NMCnR3Kb1CU9oSqUxFJw/Z+sl
	hwA1GgBq81dAriuFbqz/2n9SLMBXx6ybbpShzdU9MomC09g4kPwy92xU8GgtSHcVTbSi2swrwsD
	qFyiFa6H7hBw0amB7FzZ5CcbM1mOYuuLSu375lWWvSZpl3O4l4l8j5xl3XMa65wF74Zx2EKXLs+
	XkGkfaG7Ym36pOzTZVNgfbJ++u1hvechO3WL+H91ue9CdDiBjlQ5HyePLumfz0BLdrkLJVDwqi4
	xUkVhAWt+VwDJ/iCeK/l523kFdJfNrPXyH2/P9PV7RjFPQEUKWpjQEX/oxNUNbUyWkguS5uHrZ7
	rM6AFQfMIiG
X-Received: by 2002:a05:651c:a185:b0:3a3:7680:67fa with SMTP id 38308e7fff4ca-3a376806991mr6184891fa.25.1788553685465;
        Fri, 04 Sep 2026 13:28:05 -0700 (PDT)
Received: from i-UX410UAR.lan ([2a02:2168:87cb:3900:a1e5:6a90:4021:407d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a370549917sm9910451fa.11.2026.09.04.13.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 13:28:03 -0700 (PDT)
From: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	daniel@makrotopia.org,
	dqfext@gmail.com,
	SkyLake.Huang@mediatek.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com,
	sean.wang@mediatek.com,
	olteanv@gmail.com,
	yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Subject: [PATCH net v3] net: phy: mediatek-ge: disable EEE on the MT7530 PHY
Date: Fri,  4 Sep 2026 23:28:00 +0300
Message-ID: <20260904202800.3410838-1-vladislav.karmanov.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT7530 internal GE PHY advertises EEE by hardware default, but its
EEE support is defective: with EEE advertised, some link partners fail
to establish a stable link. On a 2-pair (4-wire) cable where both ends
advertise gigabit, 1000BASE-T training cannot succeed, and instead of
falling back to 100 Mbps the port loops, so no link or DHCP lease is
ever obtained. MediaTek confirms the hardware is the root cause (Landen
Chao, 2021): "EEE of the 10-year-old MT7530 internal gephy has many IOT
problems, so it is recommended to disable its EEE."

mtk_gephy_config_init() used to clear the EEE advertisement early, but
commit af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE
advertisement") removed that on the rationale that the DSA subdriver
already performs an early disable. That holds for MT7531, whose
mt7531_setup() clears MDIO_AN_EEE_ADV on each switch PHY, but not for
the MT7530 PHY: neither the MT7621 integrated switch nor the dedicated
MT7530 IC ever had such a loop, so removing it left those boards
without any working early EEE disable and the link flapping came back.

Since the broken hardware is the PHY, fix it in the PHY driver so it
covers all users of this PHY, integrated in a switch or standalone:

  - clear MDIO_AN_EEE_ADV in probe(), before anything can negotiate
    EEE with the link partner;
  - call phy_disable_eee() so phylib does not write the advertisement
    back on later renegotiations and userspace cannot re-enable EEE.

Auto-negotiation then falls back to a stable 100 Mbps link instead of
looping at gigabit. Tested on ASUS RT-AX53U (MT7621): with a 2-pair
cable on the WAN port, a single clean 100 Mbps link comes up and a
DHCP lease is obtained, where the unpatched driver loops.

Fixes: af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE advertisement")
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
---
Changes in v3:
- Move the fix from the DSA driver to the MT7530 PHY driver: the
  broken hardware is the PHY, so the workaround belongs there and
  covers all users of the PHY, switch-integrated or standalone
  (Andrew Lunn).
- Clear MDIO_AN_EEE_ADV from probe() rather than config_init() so the
  advertisement is off before anything can negotiate EEE, and call
  phy_disable_eee() so neither phylib nor userspace can re-enable it
  (Andrew Lunn).
- Remove the eee-broken-* device tree properties discussion from the
  commit message; the properties are not needed once the PHY driver
  disables broken EEE itself (Andrew Lunn).

v1: https://lore.kernel.org/netdev/20260818182829.1580811-1-vladislav.karmanov.dev@gmail.com/
v2: https://lore.kernel.org/netdev/20260820202844.1821687-1-vladislav.karmanov.dev@gmail.com/

 drivers/net/phy/mediatek/mtk-ge.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 73d9b72..35600c7 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -62,6 +62,27 @@ static void mtk_gephy_config_init(struct phy_device *phydev)
 		       FIELD_PREP(MTK_MCC_NEARECHO_OFFSET_MASK, 0x3));
 }
 
+static int mt7530_phy_probe(struct phy_device *phydev)
+{
+	int ret;
+
+	/* The MT7530 internal GE PHY has broken EEE: with EEE advertised,
+	 * some link partners fail to establish a stable link (on a 2-pair
+	 * cable, 1000BASE-T training fails and the port loops instead of
+	 * falling back). MediaTek recommends disabling EEE on this PHY.
+	 * Clear the EEE advertisement early and mark EEE disabled, so
+	 * that neither phylib nor userspace can re-enable it.
+	 */
+
+	ret = phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
+	if (ret)
+		return ret;
+
+	phy_disable_eee(phydev);
+
+	return 0;
+}
+
 static int mt7530_phy_config_init(struct phy_device *phydev)
 {
 	mtk_gephy_config_init(phydev);
@@ -100,6 +121,7 @@ static struct phy_driver mtk_gephy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),
 		.name		= "MediaTek MT7530 PHY",
+		.probe		= mt7530_phy_probe,
 		.config_init	= mt7530_phy_config_init,
 		/* Interrupts are handled by the switch, not the PHY
 		 * itself.

-- 
2.43.0
