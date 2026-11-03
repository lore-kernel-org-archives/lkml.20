Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744097;
	b=IF9wxztT2AvhBlxaj/o3AO7JWZmPSr7RjkzTlhYhgmsgTTPULssiiALhi+U6799K470R
	 A1I5PtWbE6DGQrDIk1zrSIMoBYWMbkmzl3UBsA8foQia7JVD43GMBdVmVld8WPmSukomu
	 EeulHU6l9RlH2ZCxpeuaRntEqdIlaryCj7LnPUQm+0w8Ztjvx8HcKr6QxcoHHXIll6xzz
	 UqvnjXZkxLglQ8nvCeHcwtMeg3dHNyNTYBKqqtHeQgeoiD65kETNEXtrlh2L4c+zwCHB6
	 qotU8ir/kCpAasXug0b7XD1GEMhHm2cHU6AR0dqyjhrJbLZkr0MhV2GgWaIKDhAktYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KVXvU2y3CWgDkb2iD40+8fhR4es61+R0ZnlRm3BwJkU=;
	b=Y7lnEEoCRRSt2jU55y/vt0zMMgWJg5WlCCdjTWkVLa4wUx57x3uarzPdQGs+gVfqLK15
	 oRZhNTHQENcJ3GdxWwBKbBwiqDdB1J5nPVsCZaefsgGgX8VAQ61LWTml+qv8VSFZmG8n1
	 OefLgWG0XRJiEQXPiHsIGQUSNcLrt8U80vMSzH9n4GyULTRVgVduNLo5/DGyYxwt0Hmpj
	 c3oRZdpH9qRidmeIvXx6k5izRrJiGT+e1vm6EtnKjxdKf96I08nOkhPQzyvoGXPieoNnI
	 qnY16Ij8+FOgSjbF06OTN79AhF9vCVsluOKugDVMMiJsxLsHkykIjQJ/XhXIMDvLSBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LZpAD42C;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A4D606D81F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A4D606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LZpAD42C
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48bbb06e746so34719f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744095; x=1794348895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KVXvU2y3CWgDkb2iD40+8fhR4es61+R0ZnlRm3BwJkU=;
        b=LZpAD42CUB1C5U9iACvZadkklT0O0/YuNtSKrGyU8gkLIrqf449RkB3acFR89+fZb7
         VmqTNzOvuCJe6oB+7ZPw+YgQNyC4JVvTnnMpARrCZCPn02/2KnUMuZTKDauitqvPgZeF
         95KrYJ11fELxC2PkYaknRcc369seU18LSjwsN9moleqDG1sG79/JaqfwsogLyMccaTrO
         7F0jitERdkD6VHoNfn/tZmI7jZ6mjFD/5IHTS7B6Mw7n+EKaF6Rt8CUiDlxLaZXpCqSK
         1beaN8pc5pd4AOTIG/+hjmoZ1aDtF5Q6QGTRDOaRvUs6PX8j4KdEH/2mySzdhz1M/HIK
         1WeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744095; x=1794348895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KVXvU2y3CWgDkb2iD40+8fhR4es61+R0ZnlRm3BwJkU=;
        b=pmLsMAVC3tCKIvHsV7R8AdyJgMW1NejrsnRHT8rSi+VlZyxYsbeZGaLVE0Pk7FO3C6
         lNID0ttjLpecxdVLDjYPGopS+xk2c1attT17lWiSSzNZUaLUOMRUhR3JuQpjUnIPEi0T
         qwnwsQMIzPG6KuVSho0JE9yatSGI7BAwAPKovn+GCv82KhidDpxTZILhf9SjmFEOmYEh
         1KE6dtl1aovetHrmmSbhou0KxD/c1bq09WuSprTMLDMg1t1SXKpZuF0Du050LHn+r1zd
         UzJjLCBG9TFg7i8gPoOQv4oDw1sc/7992Pq805DKOR7RA/QXNT9vp7jax6nv/E98EUgH
         ZsiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtUPilwH7YKraBiRz7jvTmY5e9ns/14KnY84d6uRv+WwouJ524/Z4aBvtWn2zXbYjzbcsO2J1Io5F4byc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kOb1nTBGZuwppKQVsDylGi/lQhY2uCCt6Cx9K7CD0eUG66BCt
	gF64YChy9xglaq35+iJvj+DD4brFUDR1yj0Q0F4y6Dd2mtO/S6xQwxbq
X-Gm-Gg: AYBFou24hEbT6C2FgZScoGSxiwQvZrmp7EgHO5wy6rzajptrKWS8rLUMKocPpeBOMDi
	4moPyxKmswBanAakYPhTNCI25F4bJe8Yu2kriLkbB5Y8TFEOtCtpcjNG9QOO/BIfu9yXhHFF+Ot
	wwqUndpLpkjixWFsVIXpMfDbi0JaS2nb4ViaxIWcjNUGNZo7EKQDy8T7lyvwgwd+r2tubS13MGg
	xSGo0n4+HPp47Wh8dzdBgmWyxx1p2H7gkGplMt7YRj21iU6HlP48FTQj02llayEjjnIF2JgACnh
	KRqfZY2fnJCGgua/O0gG6E0zvkG1bRsQON9g9oxO5hMKNyTGuSTU5ks2ZZp2aToomjKKhXBQDlz
	n/jGwni16jS86EYKkFtWb1pvW2SKpAT5qjONRDiPm962e3EZirNP2oGeakdoR/Wmc80hmvyqOUO
	zYSvDMznyWjcC5THkaj8YUL25sWdeO7Ep+KG0xGBee6HdaDJcQ8mzGgMb7QKLDCpnhLIuWiHOor
	ycBXOB0aeUO6kDKatPnL4FddHkS+r8OVLwQ3sek2Y6sDqFLw+SDrpVro4jooqYCpbM/1Vmsf7mx
	y2etd0h5FXrEBXeJ/b4h449fBsLYoccQujKpFc1cSqVbZ/hTfgi2qf5RUg2glxlQ9/ajp9lm10n
	V1SvyZ5b6dM8wo1IoL+synQ0kna5Wxgsckw==
X-Received: by 2002:adf:fc0d:0:b0:48d:f383:2356 with SMTP id ffacd0b85a97d-48e6e500514mr25493814f8f.53.1793744094732;
        Tue, 03 Nov 2026 14:14:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm328556f8f.14.2026.11.03.14.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:14:53 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v4 3/6] net: phy: mediatek: generalize cal_cycle function for GE SoC
Date: Tue,  3 Nov 2026 23:14:34 +0100
Message-ID: <20261103221439.30502-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103221439.30502-1-ansuelsmth@gmail.com>
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
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

In preparation for support of special Software Calibration for Airoha PHY,
it's needed to generalize the cal_cycle function as Airoha needs only
part of its logic (the wait logic) to complete a calibration cycle.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 32 ++++++++++++++++++---------
 drivers/net/phy/mediatek/mtk-ge-soc.h |  3 +++
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 2b1e9923db98..f3ce6e67eb38 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -39,20 +39,11 @@ struct mtk_socphy_shared {
 	struct mtk_socphy_priv	priv[4];
 };
 
-/* One calibration cycle consists of:
- * 1.Set DA_CALIN_FLAG high to start calibration. Keep it high
- *   until AD_CAL_COMP is ready to output calibration result.
- * 2.Wait until DA_CAL_CLK is available.
- * 3.Fetch AD_CAL_COMP_OUT.
- */
-static int cal_cycle(struct phy_device *phydev, int devad,
-		     u32 regnum, u16 mask, u16 cal_val)
+int mtk_cal_cycle_wait(struct phy_device *phydev)
 {
 	int reg_val;
 	int ret;
 
-	phy_modify_mmd(phydev, devad, regnum,
-		       mask, cal_val);
 	phy_set_bits_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CALIN,
 			 MTK_PHY_DA_CALIN_FLAG);
 
@@ -71,7 +62,26 @@ static int cal_cycle(struct phy_device *phydev, int devad,
 	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CAL_COMP);
 	if (ret < 0)
 		return ret;
-	ret = FIELD_GET(MTK_PHY_AD_CAL_COMP_OUT_MASK, ret);
+
+	return FIELD_GET(MTK_PHY_AD_CAL_COMP_OUT_MASK, ret);
+}
+EXPORT_SYMBOL_GPL(mtk_cal_cycle_wait);
+
+/* One calibration cycle consists of:
+ * 1.Set DA_CALIN_FLAG high to start calibration. Keep it high
+ *   until AD_CAL_COMP is ready to output calibration result.
+ * 2.Wait until DA_CAL_CLK is available.
+ * 3.Fetch AD_CAL_COMP_OUT.
+ */
+static int cal_cycle(struct phy_device *phydev, int devad,
+		     u32 regnum, u16 mask, u16 cal_val)
+{
+	int ret;
+
+	phy_modify_mmd(phydev, devad, regnum,
+		       mask, cal_val);
+
+	ret = mtk_cal_cycle_wait(phydev);
 	phydev_dbg(phydev, "cal_val: 0x%x, ret: %d\n", cal_val, ret);
 
 	return ret;
diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.h b/drivers/net/phy/mediatek/mtk-ge-soc.h
index 008efd148a2c..14370b5ce482 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.h
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.h
@@ -354,4 +354,7 @@ enum CAL_MODE {
 	SW_M
 };
 
+/* MTK GE SoC common functions */
+int mtk_cal_cycle_wait(struct phy_device *phydev);
+
 #endif /* _MTK_GE_SOC_H_ */
-- 
2.55.0

