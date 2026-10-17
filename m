Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644353C0A03
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260182; cv=none; b=gOh9uJBmtAJgbmMowx9R5Ds9IG6Nah6rFTRs+OSYgSdDaBU+x6bt4BHzDsyEnkibE7VsARESxr2yJ5N6y08ZvgNZJNGJllK4+1S6Ts5jA/WQJd8HWof7iLi180fkEEUJhpIu2zuV2bd+TCpB757gRJzfho57Zq/wT2rpacDgy8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260182; c=relaxed/simple;
	bh=fyhQNcY+O5G7vl1NEGv7JxiXP00rXza799Ipl+fms1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qdVPGZjGL229ICFFEUz18P28YiFRujBzq5tCj6R/GjSbOiQHV9j20zGysoJ4vcxzjrOSBrpE/7J0BuOJn9l/2JqCmoNCDh/yjoLFyr7TftKrEcqhNExZhR1snjgMX2EmpANC0Eox96MUDeoARIXlBcTb/Ucdmn5Sflo5I/w+e5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=SeG8D7GI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="SeG8D7GI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so5964665e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1792260178; x=1792864978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rcAJPEIniOgY+Qw2nx+rUdjJyX0yTJI9L3h+ey6Xf+I=;
        b=SeG8D7GI3+6Jz5c5RrmJ55RYi//ggM210y37PnV2P/6gV5EWOnNGYjrSkmgA2ZRG9q
         SbaOZGTsm2UG/nc+fpIR6QKvsABeWzqp2x1N0A4msVB7aJoWCXxh8XDveGxBFW4DZ0CU
         bPMpgSbWXGdad62OF0qZePmzqgYUpKr2nnmr5eCizkSe2DfQpcn6PvkAW/z5H2a4eAsp
         Tg3D9Scp57BztAKDkffsFFVhjZKF2+7u/77tQ4WjWBrrgDrmiHVK+CEjX+6KuXsjCkFu
         Ee38bs5VEg61ZBkKUB99HwhQNv5ooPriDcySh78iOcR8qKVCj9pGmlX/TZzvDsXsm2wB
         WKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260178; x=1792864978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcAJPEIniOgY+Qw2nx+rUdjJyX0yTJI9L3h+ey6Xf+I=;
        b=1LKqLty1tPv8FV5PPOdjY/oEk6Pn4R+9M4NnwXVL8HqUpXdBjdsXKooe92aDXAJUdn
         s5eac/L+hAVdL89u2M9EDCHsXyrbAxlQCJ5LmbPQQc4S4b/j55fD8iOx5uLpVANKlyxq
         Mj2c2Aw/TTpHI4O/1OXmscDrWgzUWRlgLuTAZqi5sVlyZ+I4KFm5ehmM8bjbNwJSjG3l
         STtLp5g1YMKNGjzgdXHQ3HxOB+5+Undn399C8gEDlzfpKMSpHHLeBel9KuS02iY/8d4u
         nnQ7acRbY6VNQLy1fP9Ud0+sVuNNqcs1JbThMRsH4tSv99FF3Iqr35pPm7PJZ++KaYYC
         avUA==
X-Forwarded-Encrypted: i=1; AKwUvBwrwM1aYyqaeEhke9Q1U5d+kX3TiQzsdPhWVokN2NnCTTU4dxu9F2QpNcbsWpmGItlccm7ie1wn2gtNmjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMYBF8a/YxYPd6To69M/B5zsYfZrvKqiDVzD4vPpcB3n6fPFTU
	xhoRyXViaXsZN8EJfRuYgZw+yd54xWEafsGHP89rihc45yGruyOCgbnuO5YG75Vw5Qw=
X-Gm-Gg: AYBFou3pDl+Tn8Hhe10dsihwCGfa62jLTeB5NiyxfVty5K6hwJe1eF4I4Gzvb+KxaMC
	CULSnbMoRnhnlpIcbYUHo+ecBFoaF3kcd/A6PlpZzMjB5f1In153rHGiR6dUeOcHJQ5m+K2M3Zv
	JTtYlgAU+qvAsGoWSU/UnrKOgT5eTrCochlatyd6w6BiBtan7/sSmsQBUykrlN+tezcpNMniz8Y
	1c6N7SUAJZi0L3bBu6gQIAbUHBh0vhY3q70PFQv3D+rRgOWwbZlGq4iFGvAcSNkeUwQsrhoEKAA
	Xu/nfk9jvmx96qNf9s+ckTULiEMp86OMRqBrzGCRCb/yr+tA53Aq9E3stzCjEX+o3os++75YKfx
	n3QhIkzAJKF6tFslAvZ8gP90lI+8A5vy00q+zc0yW24LN8Rsaaz0w3bvGGmPMLuNYmFN+vBaM5Z
	5cYhcPA0YcPmEygGlkJBnwDOEf8nU2ir7qCQFeHyHNI4WUQZ7pew==
X-Received: by 2002:a05:600c:4f92:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a1d76120c4mr71119715e9.23.1792260178181;
        Sat, 17 Oct 2026 11:02:58 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a56233sm121884115e9.0.2026.10.17.11.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:02:57 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: phy: air_en8811h: use firmware loaded by the bootloader
Date: Sat, 17 Oct 2026 21:02:51 +0300
Message-ID: <20261017180251.3618606-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a Keenetic KN-1012 (MT7981) the EN8811H sits behind a port of an
MT7531 switch. The driver has to be built in there: as a module it loads
after DSA has validated the port against the generic PHY driver and
failed to set it up. Built in, it probes when the Ethernet MDIO bus is
registered, before the root filesystem is mounted, so
request_firmware_direct() fails with -ENOENT, the PHY stays without a
driver and the port never comes up, although the bootloader has already
loaded and started the MD32 firmware.

When the firmware files cannot be read and the MCU reports ready, keep
the running firmware and let the first .config_init() restart it, so the
PHY starts from a freshly started MCU as after a download rather than
from whatever state the bootloader left. Nothing changes when the files
are there. A board that relies on this must not give phylib a
reset-gpios line, as the pulse at registration stops the MCU. The
AN8811HB path is unchanged.

Tested on the KN-1012: with the bootloader load the PHY binds and links;
without it 0x8009 reads 0x0 and the probe fails as before; a rebind with
the files present downloads them as before.

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
This replaces "net: phylink: wait for a PHY that probes after the MAC"
https://lore.kernel.org/netdev/20261006124731.1528963-1-f@lex.la/
following Andrew's suggestion in
https://lore.kernel.org/netdev/b175c750-104a-4859-a137-09de78a6d8bb@lunn.ch/

 drivers/net/phy/air_en8811h.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index a03d63dd4ac9..efe4e64d213a 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -518,6 +518,17 @@ static int an8811hb_load_firmware(struct phy_device *phydev)
 	return en8811h_wait_mcu_ready(phydev);
 }
 
+/* No firmware files, but the bootloader may have started the MCU */
+static int en8811h_use_running_fw(struct phy_device *phydev, int err)
+{
+	if (phy_read_mmd(phydev, MDIO_MMD_VEND1, EN8811H_PHY_FW_STATUS) !=
+	    EN8811H_PHY_READY)
+		return err;
+
+	en8811h_print_fw_version(phydev);
+	return 1;
+}
+
 static int en8811h_load_firmware(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
@@ -526,11 +537,13 @@ static int en8811h_load_firmware(struct phy_device *phydev)
 
 	ret = request_firmware_direct(&fw1, EN8811H_MD32_DM, dev);
 	if (ret < 0)
-		return ret;
+		return en8811h_use_running_fw(phydev, ret);
 
 	ret = request_firmware_direct(&fw2, EN8811H_MD32_DSP, dev);
-	if (ret < 0)
+	if (ret < 0) {
+		ret = en8811h_use_running_fw(phydev, ret);
 		goto en8811h_load_firmware_rel1;
+	}
 
 	ret = air_phy_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
 					 EN8811H_FW_CTRL_1_START);
@@ -1214,8 +1227,8 @@ static int en8811h_probe(struct phy_device *phydev)
 	if (ret < 0)
 		return ret;
 
-	/* mcu has just restarted after firmware load */
-	priv->mcu_needs_restart = false;
+	/* drop whatever state the bootloader left in a running mcu */
+	priv->mcu_needs_restart = ret > 0;
 
 	/* MDIO_DEVS1/2 empty, so set mmds_present bits here */
 	phydev->c45_ids.mmds_present |= MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
-- 
2.53.0

