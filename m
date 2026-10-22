Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708221;
	b=Eh4fOlko78IPOORlLoqx9FJiWwnzTafzwuV95N+92ROykDuQTveDXPRQvutB9N7fbJax
	 1vccXaPEGQqqxB/jZqacrhOW4BzXNBTrkDKLvdi1KB95lapYH7fzcZOzNEeSnGhKtP05M
	 R8/Vp5DHRo7D722G80iq2Q5vJyOaUvhdDrFM0NSTFf6RU2pS6fdRpe2kc/zvaklIG0NIx
	 Sb5KOtSySPoivWY3CnrS2uqCwC+3V4baILkqzUMLoq4olh4rLl5u1AzenYYGGJW3M2P/G
	 EWEq8HnaOMat9FmMHaoca2ZNsLB3qc92DOZaVHjvLA80o1QcjTF/pY29YJl/nWnpDGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P+nwbsIvAz9hhS3P5b7t6hwq5Xj7R9U3WHLPFL/+GvY=;
	b=HHoVNnPvOCeA4MVH7J9aHXU7aiiPP+CxJd+6GrJoaMsA/lzUhDKpADdLs3Xkm6+V11NP
	 Su6A7l00N+je7Hl+ziiaf2wcm5gjoAqdxmzqeIWEnIuGxpWIuxPI+4o5SGHZlP2MTlkG5
	 WO5ICPlueoiOVJNd9jN1rfDD+P7aTjxgNSxVGAx9fI803bOVhOpozdLtsFiTV0IIG/dcl
	 mBnxkon7heK6gR+LMbwy6U52NnaN7yCv180gqwzY4TlvzIKIeK+YRiItQNexTyMT12uZX
	 nev7373fT8+XIY6/q+zQGqeLNeNY2dC648FAtM2JrBFADK6esu7FOUfIA3DK7V19TKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=escYtTYE;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7996A606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7996A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=escYtTYE
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so1406405e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792708220; x=1793313020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P+nwbsIvAz9hhS3P5b7t6hwq5Xj7R9U3WHLPFL/+GvY=;
        b=escYtTYE6k1GGegiq/09qM0KPEzrPvF6/Z1D/RYSkMgHwpO8lMHHCOc9Mi8nxgxR17
         YNqOzw347quJIQwna+P2nkLKwpKC1rwQOQIi9fde9zo26SdHnZaayHcqzUbo3GHgllJY
         hVngi6B502lYAq/UYs24zQD/3TebtWpEJgMfPC+u1cm7nDYK8BiV6K9w5CHZy4J2F0XH
         L/n/sEHGBt99v31/ntmQMhVjIWL65MnB/5BhmWTcTudQDRfmjuDirDCvaHI9Yr7REJ1H
         zdZxYqwLj287NPTSQSMcqqrzUyznilUJPoBd6++pFPM+QBEQdM0PNpb8TNYH6wC/NB/9
         va5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792708220; x=1793313020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=P+nwbsIvAz9hhS3P5b7t6hwq5Xj7R9U3WHLPFL/+GvY=;
        b=gC7H8llpHZBWqeaQRZzyOlMiKMFgYSMOAyXWh5eN+hCo1l0A2B+fL0Ls13NT7lvtm/
         vzc9Lnh4muTpzZ+DPsNoFWjRVzMqIGpnj4dqrnwvydOpT4YL8lst2GSQsRnKbF1pAMJu
         A2oRgNPT8aNWu/947rRhkxZC1sko/V3xZN3p09ICeITAnLFrUiRhUT3kV7uMXeafo/Ku
         e4przY2+/gP6t0F0WNaqo2dilT4oO8y8a+W3IA8XreXvAbg3l0v2dp9rNlpW/kHIZ0eY
         uzsTCGG1rxExKcshq34h/JpJ2e4pvz2puiSRTplgeC65qeHEIVEwnk14bEc/1u6kY9Ll
         eaZw==
X-Forwarded-Encrypted: i=1; AKwUvBzYMtFfwB+8YscbrI+Yqo4Ye9B+bBQyF0lZu3908qF4F0tioyG0jC1bAl9F2BPWkG7cnl0ef1NRL4Iv3gQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgyZRoQvRfCSYpN9VbSg6w9qFcZ/7g4p8V6kh5NnqUiTbd0pWn
	zCX43Snt7B3Pshwxb95NHPX5Sgs1KwtADkLEQJLLrlqVhTrWdkxXfJj21EOwtg==
X-Gm-Gg: AYBFou3gvl4qw7pinMLMoO4QIC/ksx+X0re98VMj8rp3xuO1HBmxYP9zpL1xMWdR+2d
	f2ZQjQv8u+ovwc+BE04W//Tk7b4SKCA5+eTjIGbxqZs4MTm1kmtcf3mCKML5VQQ2jxOENpwjyet
	aLjF1S0DZ6t/smSxi4bkktNU4pMtBLEtyXidieJ3Bvdbeg0/LCz2gNaXSlwa+Nug/h6L1+Qpfbm
	BM/Anw8fRtMRU2modwPiWn4hk95EIfFk6Dh8By4crgS3NPIYsiRNRsB1ZJFUis3bjZVv5tc4zw1
	MWkuRxMwXMI0VxIGeoanGhLlefUnl1o+adOHVM2Am+VbCCfDgI86tgsbFsXruZ0SsVOXqoXOnaB
	Lo+AxhWVXvEFbblHNCL9chuYtaOdNtx1Iggb5GD1Aep43CkUyc3cv7mQs7bST2sntMB2iMkeWJy
	IITFQaY+12HUrKi+pofoD2TjEpFnH+dm+Ss1Iy8jMe9SObViO9R3vd5z5uZlFfHP2t8+Y0DltLk
	wrYNbYveNUEepjMYgwPOBXNsz839LwT3pyl8Q8hsLclf2TU1cX2+UWt0x1cp74/MefNjIDIWwi5
	1oB3IuyuSyhSo4+NzWNjzCpTWhuga+Ch8dY1aihryw2Mh+xO82TJstX1zX4W
X-Received: by 2002:a05:600c:3b9f:b0:4a1:90d7:88a8 with SMTP id 5b1f17b1804b1-4a211f1a48dmr6838995e9.25.1792708219662;
        Thu, 22 Oct 2026 15:30:19 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a211be8f79sm11958795e9.14.2026.10.22.15.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:30:15 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 3/4] net: phy: as21xxx: force C45 OPs for AUTONEG
Date: Fri, 23 Oct 2026 00:29:53 +0200
Message-ID: <20261022222955.698722-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022222955.698722-1-ansuelsmth@gmail.com>
References: <20261022222955.698722-1-ansuelsmth@gmail.com>
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

With further testing with 2.5G NIC, it was discovered that the PHY
require the C45 OPs to configure and restart ANEG or speed higher than
1G doesn't function correctly.

To force C45 OPs with generic PHY function, clear the C22 bit from
devices_in_package bitmask and implement a custom .config_aneg.

Fixes: 830877d89edc ("net: phy: Add support for Aeonsemi AS21xxx PHYs")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Implement custom config_aneg

 drivers/net/phy/as21xxx.c | 43 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/net/phy/as21xxx.c b/drivers/net/phy/as21xxx.c
index 519b78d3579d..e2988cb10c04 100644
--- a/drivers/net/phy/as21xxx.c
+++ b/drivers/net/phy/as21xxx.c
@@ -616,6 +616,13 @@ static int as21xxx_probe(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
+	/* Even if PHY declare support for Clause 22 register,
+	 * Clause 45 register should be used for ANEG configuration
+	 * and restart. Clear the C22 bit for devices_in_package to
+	 * force C45 generic OPs in generic PHY ANGE OPs.
+	 */
+	phydev->c45_ids.devices_in_package &= ~BIT(0);
+
 	ret = aeon_ipc_sync_parity(phydev, priv);
 	if (ret)
 		return ret;
@@ -633,6 +640,32 @@ static int as21xxx_probe(struct phy_device *phydev)
 	return aeon_dpc_ra_enable(phydev);
 }
 
+static int as21xxx_config_aneg(struct phy_device *phydev)
+{
+	bool changed = false;
+	int ret;
+	u16 adv;
+
+	ret = genphy_c45_an_config_aneg(phydev);
+	if (ret < 0)
+		return ret;
+	if (ret > 0)
+		changed = true;
+
+	adv = linkmode_adv_to_mii_ctrl1000_t(phydev->advertising);
+
+	ret = phy_modify_mmd_changed(phydev, MDIO_MMD_AN,
+				     AS21XXX_MDIO_AN_C22 + MII_CTRL1000,
+				     ADVERTISE_1000FULL |
+				     ADVERTISE_1000HALF, adv);
+	if (ret < 0)
+		return ret;
+	if (ret > 0)
+		changed = true;
+
+	return genphy_c45_check_and_restart_aneg(phydev, changed);
+}
+
 static int as21xxx_read_link(struct phy_device *phydev, int *bmcr)
 {
 	int status;
@@ -990,6 +1023,7 @@ static struct phy_driver as21xxx_drivers[] = {
 		.name		= "Aeonsemi AS21011JB1",
 		.probe		= as21xxx_probe,
 		.match_phy_device = as21xxx_match_phy_device,
+		.config_aneg	= as21xxx_config_aneg,
 		.read_status	= as21xxx_read_status,
 		.led_brightness_set = as21xxx_led_brightness_set,
 		.led_hw_is_supported = as21xxx_led_hw_is_supported,
@@ -1002,6 +1036,7 @@ static struct phy_driver as21xxx_drivers[] = {
 		.name		= "Aeonsemi AS21011PB1",
 		.probe		= as21xxx_probe,
 		.match_phy_device = as21xxx_match_phy_device,
+		.config_aneg	= as21xxx_config_aneg,
 		.read_status	= as21xxx_read_status,
 		.led_brightness_set = as21xxx_led_brightness_set,
 		.led_hw_is_supported = as21xxx_led_hw_is_supported,
@@ -1014,6 +1049,7 @@ static struct phy_driver as21xxx_drivers[] = {
 		.name		= "Aeonsemi AS21010PB1",
 		.probe		= as21xxx_probe,
 		.match_phy_device = as21xxx_match_phy_device,
+		.config_aneg	= as21xxx_config_aneg,
 		.read_status	= as21xxx_read_status,
 		.led_brightness_set = as21xxx_led_brightness_set,
 		.led_hw_is_supported = as21xxx_led_hw_is_supported,
@@ -1026,6 +1062,7 @@ static struct phy_driver as21xxx_drivers[] = {
 		.name		= "Aeonsemi AS21010JB1",
 		.probe		= as21xxx_probe,
 		.match_phy_device = as21xxx_match_phy_device,
+		.config_aneg	= as21xxx_config_aneg,
 		.read_status	= as21xxx_read_status,
 		.led_brightness_set = as21xxx_led_brightness_set,
 		.led_hw_is_supported = as21xxx_led_hw_is_supported,
@@ -1038,6 +1075,7 @@ static struct phy_driver as21xxx_drivers[] = {
 		.name		= "Aeonsemi AS21210PB1",
 		.probe		= as21xxx_probe,
 		.match_phy_device = as21xxx_match_phy_device,
+		.config_aneg	= as21xxx_config_aneg,
 		.read_status	= as21xxx_read_status,
 		.led_brightness_set = as21xxx_led_brightness_set,
 		.led_hw_is_supported = as21xxx_led_hw_is_supported,
@@ -1050,6 +1088,7 @@ static struct phy_driver as21xxx_drivers[] = {
 		.name		= "Aeonsemi AS21510JB1",
 		.probe		= as21xxx_probe,
 		.match_phy_device = as21xxx_match_phy_device,
+		.config_aneg	= as21xxx_config_aneg,
 		.read_status	= as21xxx_read_status,
 		.led_brightness_set = as21xxx_led_brightness_set,
 		.led_hw_is_supported = as21xxx_led_hw_is_supported,
@@ -1062,6 +1101,7 @@ static struct phy_driver as21xxx_drivers[] = {
 		.name		= "Aeonsemi AS21510PB1",
 		.probe		= as21xxx_probe,
 		.match_phy_device = as21xxx_match_phy_device,
+		.config_aneg	= as21xxx_config_aneg,
 		.read_status	= as21xxx_read_status,
 		.led_brightness_set = as21xxx_led_brightness_set,
 		.led_hw_is_supported = as21xxx_led_hw_is_supported,
@@ -1074,6 +1114,7 @@ static struct phy_driver as21xxx_drivers[] = {
 		.name		= "Aeonsemi AS21511JB1",
 		.probe		= as21xxx_probe,
 		.match_phy_device = as21xxx_match_phy_device,
+		.config_aneg	= as21xxx_config_aneg,
 		.read_status	= as21xxx_read_status,
 		.led_brightness_set = as21xxx_led_brightness_set,
 		.led_hw_is_supported = as21xxx_led_hw_is_supported,
@@ -1086,6 +1127,7 @@ static struct phy_driver as21xxx_drivers[] = {
 		.name		= "Aeonsemi AS21210JB1",
 		.probe		= as21xxx_probe,
 		.match_phy_device = as21xxx_match_phy_device,
+		.config_aneg	= as21xxx_config_aneg,
 		.read_status	= as21xxx_read_status,
 		.led_brightness_set = as21xxx_led_brightness_set,
 		.led_hw_is_supported = as21xxx_led_hw_is_supported,
@@ -1098,6 +1140,7 @@ static struct phy_driver as21xxx_drivers[] = {
 		.name		= "Aeonsemi AS21511PB1",
 		.probe		= as21xxx_probe,
 		.match_phy_device = as21xxx_match_phy_device,
+		.config_aneg	= as21xxx_config_aneg,
 		.read_status	= as21xxx_read_status,
 		.led_brightness_set = as21xxx_led_brightness_set,
 		.led_hw_is_supported = as21xxx_led_hw_is_supported,
-- 
2.55.0

