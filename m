Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F09583AA2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883040; cv=none; b=XPJ8IO2iqOF+dmdX+2s/ucgG3XTYddTpKfESkGx3i8qQRLR6KyuvXkZrrXf/EqzExK2MCzWrXl3lqegX+zMw0t0I0WuF0K4oOxN7P8drNySWsSPyOTeAQxcNjY425ZxUpqdXdtJ/sgaPyoRT3riT3d6hwESow66vAq/37vI3B5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883040; c=relaxed/simple;
	bh=mzH/5XaUhv6NQCYgufBy5oWC9jpITM+/znfPg5sAlv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPw+YFU3EPj1I33b9q9leUggCjCygDjLHwnklAEbIV5jr/XehcJS1HbLgOCxAvpcnXfyyuvvqG199AvFF/MuoLrs+CSEA1HsvE/IF2G8aUKb8uyZ9sXHP78Rnq7/ovqZn86oRXli/7GT97QMrw5XVzkpYD2yucri+Gh4d2AT9wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=ZZJ4jIUn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="ZZJ4jIUn"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48589798dbbso3980957f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788883035; x=1789487835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfiP06w66PJnEqo2UKKQtS6GK/rrfhVqIhL6B6Ho9XA=;
        b=ZZJ4jIUnWChO1HRnNr8uRBBkq/7Tg98Mdj17P3zP0jkQ5oh5OikoapoNFvURgfMAq9
         7gXKACengPgKiK6PHw+e/WLkv/vLn+WIjmV/uEShjNdc99Qro2EsPoIwypcPEGi9z/ej
         N+9SvWC/148IEVQWUVMz/qBe/ckSyuqxAciPR5N9//2j3bkp341EoeNWcwT5LhTZL/re
         9oqqQVDB2DsK1Uq/OTocvGKitFQoJcBH8cd7l3iMLqFapiAtzvTdofKu6atB3Dlk4TW3
         YxFhbnYjI0fbVP+/xHh0i1vLEUtU5jab2oFYpjrA8kZ/tZ2ezaopMwEoRYIqKLx5T5GL
         x6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883035; x=1789487835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YfiP06w66PJnEqo2UKKQtS6GK/rrfhVqIhL6B6Ho9XA=;
        b=OI2tJoSQWbFvgXV4HfRV5CFAMHx1I5j/w+I6ZhOuRfjBMN5Yqtl+kHf1RB2gSY4PKd
         jea9Fh2IIgiDExdbUP7ZKGUC/7j3UZmYX1KIP7edY3v3LXWPTVCFTriSs8othj/P06fy
         SbjuRfsnIUeAyvrzPRgGDpCKpgZb8EHU5I8uzyEH9RNOedzfbAvahwnzaNJpRTbl0Dqk
         xrrwqAnrnfTW2ZBpPm7p7y4EBrjShLsSvhrLdaz4IyNfmyrchSDKbc+ZhVtmtmICbV7o
         YC8CflCv694xMtYhS1gv3lTO9dffZdFzqvOUaw0mYmEVcFTCDLNdkYycTVfnJjLyJUY9
         e9xA==
X-Forwarded-Encrypted: i=1; AKwUvByc5ksJxXZTAHdpZjmzHbpyOZVgZhTOsA/UV0fkC8/+VKs5Xpmpd8WF8QD4NqxN/ooIfim+bkcd6RSSOQU=@vger.kernel.org
X-Gm-Message-State: AFuF++li1y23OL1YsaRdArzlUJixhOWEs1kkNeFLhEc6ytjjAxOwZYPn
	8AGNt0vuxc4e+FRuIYYeIWNWkmNLkKyLEyc5vYHXIjqbGSaaOFXgScU2D5P+8SL5noU=
X-Gm-Gg: AYBFou3n+4FTfGFgkz+1RRBq92W6KhKahICFQscbnMAUqdAB8Nn5ceF+ebPMRzAobD3
	3mWVVnNqC1qWUucdLiovwQ9C4UZIsPM5csOgmQXF/vhFZ8Uk+cHFG8TMjoHow3idVRQ1lrM3M3A
	O+TgH0rTc2dpKfNpm/PXmXuevgXRamip3fe0lZrVY+KPbSR4G7FlgnmWvB/70M7+S4yjDiMP5tw
	IR+D0vRRaWf7K8HkiDIbpcXg6p2koI33UeMCwomGoA2B9bz1I8iIH7eovSv8qgT071gb0NF1Cpw
	aTeL7d+YyoxyxEf7TF9SLM+cAt0tBs4gvR4fqhyQwz4ue9QzLZk1f+cyUdCSBGJDcs5N4xeUC0o
	mT3SfXEdQ4pJVJwpsSHzAAQtsDyrYqdy8tU1PTzeLGgGkX6JNX6P1w1myXf78w8WOeKWGQsUnVc
	JmyX+Q6NmfT+FZhhxT+27qVNBP2reeMk2xB5znooqkisOtetj1CA==
X-Received: by 2002:a05:6000:2209:b0:485:8a46:7057 with SMTP id ffacd0b85a97d-4858a46719cmr30096870f8f.41.1788883034530;
        Tue, 08 Sep 2026 08:57:14 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm37345704f8f.21.2026.09.08.08.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:57:14 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ericwouds@gmail.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next v2 3/7] net: phy: air: type the buckpbus core on the mdio device
Date: Tue,  8 Sep 2026 15:57:03 +0000
Message-ID: <20260908155707.4164559-4-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908155707.4164559-1-f@lex.la>
References: <20260908155707.4164559-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buckpbus accessors only need an MDIO device, but they take a
phy_device, which ties them to a probed PHY. An upcoming MDIO device
driver needs the same register access before any phy_device exists,
since it runs precisely to make the PHY presentable.

Retype the internal helpers onto an mdio_device and keep the exported
phy_device API as page-selecting wrappers that pass &phydev->mdio. The
EN8811H driver already reaches the AN8811HB pbus through an
mdio_device, so this follows an existing direction rather than opening
a new one.

No functional change.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/air_phy_lib.c | 80 ++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/drivers/net/phy/air_phy_lib.c b/drivers/net/phy/air_phy_lib.c
index 5141db19fa5e..e314717843ae 100644
--- a/drivers/net/phy/air_phy_lib.c
+++ b/drivers/net/phy/air_phy_lib.c
@@ -14,31 +14,32 @@
 
 #include "air_phy_lib.h"
 
-static int __air_buckpbus_reg_read(struct phy_device *phydev,
+static int __air_buckpbus_reg_read(struct mdio_device *mdiodev,
 				   u32 pbus_address, u32 *pbus_data)
 {
 	int pbus_data_low, pbus_data_high;
 	int ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_MODE,
+			      AIR_BPBUS_MODE_ADDR_FIXED);
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_RD_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_RD_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
+	pbus_data_high = __mdiodev_read(mdiodev, AIR_BPBUS_RD_DATA_HIGH);
 	if (pbus_data_high < 0)
 		return pbus_data_high;
 
-	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
+	pbus_data_low = __mdiodev_read(mdiodev, AIR_BPBUS_RD_DATA_LOW);
 	if (pbus_data_low < 0)
 		return pbus_data_low;
 
@@ -46,64 +47,66 @@ static int __air_buckpbus_reg_read(struct phy_device *phydev,
 	return 0;
 }
 
-static int __air_buckpbus_reg_write(struct phy_device *phydev,
+static int __air_buckpbus_reg_write(struct mdio_device *mdiodev,
 				    u32 pbus_address, u32 pbus_data)
 {
 	int ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_MODE,
+			      AIR_BPBUS_MODE_ADDR_FIXED);
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
-			  upper_16_bits(pbus_data));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_DATA_HIGH,
+			      upper_16_bits(pbus_data));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
-			  lower_16_bits(pbus_data));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_DATA_LOW,
+			      lower_16_bits(pbus_data));
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static int __air_buckpbus_reg_modify(struct phy_device *phydev,
+static int __air_buckpbus_reg_modify(struct mdio_device *mdiodev,
 				     u32 pbus_address, u32 mask, u32 set)
 {
 	int pbus_data_low, pbus_data_high;
 	u32 pbus_data_old, pbus_data_new;
 	int ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_MODE,
+			      AIR_BPBUS_MODE_ADDR_FIXED);
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_RD_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_RD_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
+	pbus_data_high = __mdiodev_read(mdiodev, AIR_BPBUS_RD_DATA_HIGH);
 	if (pbus_data_high < 0)
 		return pbus_data_high;
 
-	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
+	pbus_data_low = __mdiodev_read(mdiodev, AIR_BPBUS_RD_DATA_LOW);
 	if (pbus_data_low < 0)
 		return pbus_data_low;
 
@@ -112,23 +115,23 @@ static int __air_buckpbus_reg_modify(struct phy_device *phydev,
 	if (pbus_data_new == pbus_data_old)
 		return 0;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
-			  upper_16_bits(pbus_data_new));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_DATA_HIGH,
+			      upper_16_bits(pbus_data_new));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
-			  lower_16_bits(pbus_data_new));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_DATA_LOW,
+			      lower_16_bits(pbus_data_new));
 	if (ret < 0)
 		return ret;
 
@@ -144,7 +147,8 @@ int air_phy_buckpbus_reg_read(struct phy_device *phydev, u32 pbus_address,
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_read(phydev, pbus_address, pbus_data);
+		ret = __air_buckpbus_reg_read(&phydev->mdio, pbus_address,
+					      pbus_data);
 		if (ret < 0)
 			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
 				   pbus_address, ret);
@@ -163,7 +167,7 @@ int air_phy_buckpbus_reg_write(struct phy_device *phydev, u32 pbus_address,
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_write(phydev, pbus_address,
+		ret = __air_buckpbus_reg_write(&phydev->mdio, pbus_address,
 					       pbus_data);
 		if (ret < 0)
 			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
@@ -183,8 +187,8 @@ int air_phy_buckpbus_reg_modify(struct phy_device *phydev, u32 pbus_address,
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_modify(phydev, pbus_address, mask,
-						set);
+		ret = __air_buckpbus_reg_modify(&phydev->mdio, pbus_address,
+						mask, set);
 		if (ret < 0)
 			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
 				   pbus_address, ret);
-- 
2.53.0

