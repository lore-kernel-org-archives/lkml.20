Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0511348C52
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981163; cv=none; b=OpKVPK0bbu+alsDMn6ATeg7ZqgMI4OEUfLKuibxP5BV+FzPVIO/KbKtjIn6JPlUYi9EtNbjm5CaiKxyMULgaRfNTNvHA4p4IiUpEhJPEM7rknVmoWwTbmhAV+8scU0TnHnnN6aPnxBGfv7/LebGC9O+KDaQmqcu8/xdhN91ygLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981163; c=relaxed/simple;
	bh=4572s9xTVdwUzbQzLlssFdKtKIqWv8RdY2kJgP8ww1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GW0//neFG/mhD3Nwjf8YCv0oFZKll3Ad+nLlgW0/gOs4lWWhhXxhrkBvFmon3q38kijx6n8mKhqyViE254W81sMQgP+oQOWSWXexMedlbXoO1VfDn+dDnDS5LcMMNxQQsq6ihIKgjQ4zDu79R9kEVgCFIi89VSy5p6VeCrxF1q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=P4Wm1mTD; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="P4Wm1mTD"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c25099bb1fbso232150666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787981159; x=1788585959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztbe6Uhz7Z72lD3H/7iN0kwRmG9muPWYwtlM3Qzlp7I=;
        b=P4Wm1mTDlCpcdux95bv3Pgjge1uEm+jhDVhd+BG22NooAs/3cVb+C2zRnlAYQujmcC
         psHCLz3WAM/IcQKxe1l9sDTegfvSZ/D1j7wmAQE8nmq7zgQmkWItZCpxKp/an+ahO8I7
         lCc/dsCFuUl7YZF/0KW1K8I+MgWmAD2r+1/lGZJ6BsPRkU3cS9jaiiqufGHzDpDMdsLx
         p524Gsd+VZiHCwUSWQPiEciIg5ye839Yh3VPrtbyx4ap+tDIBW6jdjIP/i/T/kdGEdd/
         7M0+4AAN0jqUMDciYRFLggRzjURO5Q7ruW/A8hHmc8D8/fqFGDFkVuINICutiEAedl+Q
         EMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787981159; x=1788585959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ztbe6Uhz7Z72lD3H/7iN0kwRmG9muPWYwtlM3Qzlp7I=;
        b=E93J+jksYFaC3dqcDKy50elMTpzt2zJSH7mweZib4CkfVeBTqThSlk83VBR26DuJpz
         UcXr2rseeXSrafVAGRy+u1fa3wWc+QZfrpJ2gnMSADyxHb1RJufHFvPenrZ0TKB2MupH
         jroNYf/A5/x6/k+44RZXRo49ChjNnXHfsuORAhOte61/4+W60zje5HYSkR1uPb8Gxu50
         wWS2r+WPLdCX8W/ewsEmRrOKmsiSOpTnyzQcUPb3+MWZhN1g2F1m8x9ireomKESuurdm
         kFx3zxoKGqMWEw7/+ZgtGK1ch2P3hYlwAk+ZTB/vq9Nya3vBQt3FlFKXvoMiZPlz/OkS
         7kQA==
X-Forwarded-Encrypted: i=1; AKwUvBxKWPmnsXggQpi3QY0I8JCypzvHHXSXRTg995jiGeOGPW+XST2GQIl57ha0jtxVzMi8Paztq7RZwS/5ZRY=@vger.kernel.org
X-Gm-Message-State: AFuF++mxeoFJIP6JYXbJmHq8byQhjwv5XTin/VjGQOqJ/osEDbz+TPfQ
	UvDpJ5DwLO41HwkfVVqat1tNtBKFGMRkUO8OGPStHgn3x91gJ9QX3LSCmwKApEj4zZETGo74bQG
	CXvCRc4W46A==
X-Gm-Gg: AR+sD10QIvOXpe6jDbYuQYjUDBZcgcixhaZcxZbnAuVfQlHhL9zsm/+4rO+2KR3/Tr+
	rKwQZuEO+hbBavosRKYmwEYA5XWIekPIwfPrV0otG0vvQTDO9DtEGKN4xkpNcKNxvDzUraDq9Tu
	RdH5nPINXf6g7jXblwzx4Q/XOxaaL0Wop57jbDq/W/oHOGISyNyAZ4ACDnHKXTy5j5QoslnpYvp
	d727HvwNmynVc9yN/H9Eowg8hjLXf2aqfzUR7xhhWdN9zohF60Go/pLZtrGbrIP5jw2eIuQxMJU
	WM4RvKpUrgDGu7JwJg1M3Uzs7Ja01Ror5Jkg0u2S7AAfxT9DuA94lcufEyMKbpTywcaQQJEPS/R
	jAC6XxByvVsEoST2tfCkSHS8l0bpskKAfnO1GCqBpTSbneucq4Y+4EWKiIlEk47+x5BzkaoOlTH
	Xjhog5as/hdbxb6iaDZIkTiYPVmmadUbzV+735Gsa4QA==
X-Received: by 2002:a17:907:3e20:b0:c24:d914:6d64 with SMTP id a640c23a62f3a-c255720d399mr799327766b.23.1787981158722;
        Fri, 28 Aug 2026 22:25:58 -0700 (PDT)
Received: from remote-01 ([45.85.105.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee75a36sm163750666b.28.2026.08.28.22.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 22:25:58 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next 3/9] net: phy: air: type the buckpbus core on the bus and address
Date: Sat, 29 Aug 2026 05:25:40 +0000
Message-ID: <20260829052546.1152446-4-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829052546.1152446-1-f@lex.la>
References: <20260829052546.1152446-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buckpbus accessors only need an MDIO bus and an address, but they
take a phy_device, which ties them to a probed PHY. An upcoming MDIO
device driver needs the same register access before any phy_device
exists, since it runs precisely to make the PHY presentable.

Retype the internal helpers onto (mii_bus, addr) and keep the exported
phy_device API as page-selecting wrappers around them. The file
already carries an mdio_device-typed accessor for the AN8811HB pbus,
so this follows an existing direction rather than opening a new one.

No functional change.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/air_phy_lib.c | 85 +++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 39 deletions(-)

diff --git a/drivers/net/phy/air_phy_lib.c b/drivers/net/phy/air_phy_lib.c
index 5141db19fa5e..e0fca5f285d2 100644
--- a/drivers/net/phy/air_phy_lib.c
+++ b/drivers/net/phy/air_phy_lib.c
@@ -14,31 +14,32 @@
 
 #include "air_phy_lib.h"
 
-static int __air_buckpbus_reg_read(struct phy_device *phydev,
+static int __air_buckpbus_reg_read(struct mii_bus *bus, int addr,
 				   u32 pbus_address, u32 *pbus_data)
 {
 	int pbus_data_low, pbus_data_high;
 	int ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_MODE,
+			      AIR_BPBUS_MODE_ADDR_FIXED);
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_RD_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_RD_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
+	pbus_data_high = __mdiobus_read(bus, addr, AIR_BPBUS_RD_DATA_HIGH);
 	if (pbus_data_high < 0)
 		return pbus_data_high;
 
-	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
+	pbus_data_low = __mdiobus_read(bus, addr, AIR_BPBUS_RD_DATA_LOW);
 	if (pbus_data_low < 0)
 		return pbus_data_low;
 
@@ -46,64 +47,66 @@ static int __air_buckpbus_reg_read(struct phy_device *phydev,
 	return 0;
 }
 
-static int __air_buckpbus_reg_write(struct phy_device *phydev,
+static int __air_buckpbus_reg_write(struct mii_bus *bus, int addr,
 				    u32 pbus_address, u32 pbus_data)
 {
 	int ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_MODE,
+			      AIR_BPBUS_MODE_ADDR_FIXED);
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
-			  upper_16_bits(pbus_data));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_DATA_HIGH,
+			      upper_16_bits(pbus_data));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
-			  lower_16_bits(pbus_data));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_DATA_LOW,
+			      lower_16_bits(pbus_data));
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static int __air_buckpbus_reg_modify(struct phy_device *phydev,
+static int __air_buckpbus_reg_modify(struct mii_bus *bus, int addr,
 				     u32 pbus_address, u32 mask, u32 set)
 {
 	int pbus_data_low, pbus_data_high;
 	u32 pbus_data_old, pbus_data_new;
 	int ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_MODE,
+			      AIR_BPBUS_MODE_ADDR_FIXED);
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_RD_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_RD_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
+	pbus_data_high = __mdiobus_read(bus, addr, AIR_BPBUS_RD_DATA_HIGH);
 	if (pbus_data_high < 0)
 		return pbus_data_high;
 
-	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
+	pbus_data_low = __mdiobus_read(bus, addr, AIR_BPBUS_RD_DATA_LOW);
 	if (pbus_data_low < 0)
 		return pbus_data_low;
 
@@ -112,23 +115,23 @@ static int __air_buckpbus_reg_modify(struct phy_device *phydev,
 	if (pbus_data_new == pbus_data_old)
 		return 0;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
-			  upper_16_bits(pbus_data_new));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_DATA_HIGH,
+			      upper_16_bits(pbus_data_new));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
-			  lower_16_bits(pbus_data_new));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_DATA_LOW,
+			      lower_16_bits(pbus_data_new));
 	if (ret < 0)
 		return ret;
 
@@ -144,7 +147,9 @@ int air_phy_buckpbus_reg_read(struct phy_device *phydev, u32 pbus_address,
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_read(phydev, pbus_address, pbus_data);
+		ret = __air_buckpbus_reg_read(phydev->mdio.bus,
+					      phydev->mdio.addr,
+					      pbus_address, pbus_data);
 		if (ret < 0)
 			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
 				   pbus_address, ret);
@@ -163,8 +168,9 @@ int air_phy_buckpbus_reg_write(struct phy_device *phydev, u32 pbus_address,
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_write(phydev, pbus_address,
-					       pbus_data);
+		ret = __air_buckpbus_reg_write(phydev->mdio.bus,
+					       phydev->mdio.addr,
+					       pbus_address, pbus_data);
 		if (ret < 0)
 			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
 				   pbus_address, ret);
@@ -183,8 +189,9 @@ int air_phy_buckpbus_reg_modify(struct phy_device *phydev, u32 pbus_address,
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_modify(phydev, pbus_address, mask,
-						set);
+		ret = __air_buckpbus_reg_modify(phydev->mdio.bus,
+						phydev->mdio.addr,
+						pbus_address, mask, set);
 		if (ret < 0)
 			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
 				   pbus_address, ret);
-- 
2.53.0

