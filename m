Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876112;
	b=IjFt7qoSNo/p9rMm0rYpIZ6smBY+6Kv2tmTpl2f7eIay1xgArLUcoFqHRfyJqFQohVQz
	 mc9c+GjKXrDfQZn0UOh1ROAU9TmEFGapysoLBOMsm6ACvzjuZIvDvoQBff/XkgPlptPoV
	 9pCYjExtvvM6uWLv05IsRZsziJks8KNu+R/InScpDg/BNs54bshv0SuRljBIxmMP7EUcU
	 fFWqowH9dW6gCJ+1Pp4HACzI2jV1u0hAtLE4HDYMXLUFxaNaeqwK56ylXQeHWPmUkZbvt
	 ynixToqYSyEqQwhvpQBpWt53IwPl1yJua3PFeI+huxrotYoCPVTEPBkK9/pk7dVGS3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kHN/2mSyJLVzMG4IiCrQSn1f2cnCCP3IrwJXrvsgJlc=;
	b=z95ChEqvuZ9pzqQqnnFKA4nP3uc9UK4ufiQ27c0QTlGRqWZxk9UpAlT0SZTivTl2oaC8
	 Nc5tRhOWqYiZJo+gO2FP8rle1/RXMX3w34zZP9PHYmpt9G04AMVB/b0iM7V8W/Dk1kLu4
	 TdiEOzRGeOTLivQ/LsriDOoOAC5C1RS4lAMUMkOaMgE6IrW04qqNpnlAA3Z7EhHiNVNEC
	 1i1BjLDcvjDHglNlGTGR/paINN3RHhUf4XRGLeg80PXIgTPq5aaSFltHwJO4Zpd2VGYrk
	 W8IS+ePYtZa65LLW2qZvH6EC5LxZxGkasKeWSG7Bfvkehm+hS4Hu3G2fuTLs5JttNJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynkSZpH0;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F287606EEA1
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F287606EEA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynkSZpH0
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so15429695e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876110; x=1794480910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kHN/2mSyJLVzMG4IiCrQSn1f2cnCCP3IrwJXrvsgJlc=;
        b=ynkSZpH0dHIEc/UKqrcYGoJ+M2xHHobP19pevRIehKmaqm4RtjAPpP9VywMj4oTHXb
         DmS9HNZi+YOZMsdeTmphTKgiqGVYD4c0Bjmg1kD6mzg9yKT3W4gfexMYRgSoWnZcjKul
         CL7Gwh9kHnUKrspc99N9tIh2q5kNV2Q7/Qn12T2qFVgmpLyw0qHkJX+2c/aCfVE0C8Mi
         myp3LbBbWoShXg4BO/bDGQUrwKUlrphrrfBkHADbA71rugnVZ1Diovvyupc25+0GeAzK
         MIJMYfOi0NZvxv9tcAb7oidOP6zGGsq194YgB03v+kAuQbxSr26VQjwC8lLvs3OthI5T
         DXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876110; x=1794480910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kHN/2mSyJLVzMG4IiCrQSn1f2cnCCP3IrwJXrvsgJlc=;
        b=nxztk9gt/514MUbW2lXpG5HPdVKfOHZ0EnYMZZJLNBlpqvHA4+mYPggMWZE8DK5a3x
         Em1g2mBIUin+35o1A/Ok/u77/5nJZT2zUm3Foc/06pEFXYlTePS/VTu6T5ZaYoCDi3zd
         06eKmmmzTOgv6nnUwvgabUe5BauiaYX3mrNOslhcG+9QOO4JBr8RIr4lGlVHR14ztT4r
         GffD6qH8vIS4uaQ2b6aUfTBjDPDNovSSjsMkj9doBzrRAtLdBPfpEcsx7vaqEpnR4jr6
         1VS8G29UzDmRiCsNqiOVZnjwfLIv6aDA1aBaClA9ZzWREaKW98Q48B9Gs2nxsxX3DGyA
         YZew==
X-Forwarded-Encrypted: i=1; AKwUvBz/2F3+rBQz/d1LcpVRuOGM5wSRWHA5cyQWMaOB2elwNUcLtBcUs1syhGkApUxJ8wUkZ/rDZp2OTYOWxc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OH7sjZwR6GYlwdJX9Uu6SQSxvwLrwHpCg8+CbZo1XN5RjMaz5
	5qa3hW7tr6bE8c+q/k+o+BvNsRGBeHKDzJd15vG3fv7i7hNfhdS3totO
X-Gm-Gg: AYBFou0bXk1Ya4950sjNWQHd4CqH1bccfpLJdQp2vTd1MjdeeEV3PQZPriADFJO+3cH
	HVXYNPjnLa9k3FDortJFjND0RfOG+o3oJQGx72QJKyzsDvVjoEzn0OW0dKwT4UZX6gIDpPsuYqL
	2bwrqMHVioAB1kbwzbCB79PHuQ+4Eh2DYgPAefzmIDzifuAPYIg96zeyaJ1+7EnXNngKniPCEu3
	5H2EguO4iDBONvhnW50ELOJHNoIHZjo5Hoj4zO5El3OfJ33bP0uFmsAEo9syLfOwFsv3CwHwm0L
	jOumMz5jUxkkZ1WWPcASd80rDsVqtm0M7mqo/Xqwjo4gNcgp9ILPgBFplrnaG5ZzY+OJbVpEiJz
	3M5HzzzZ2N8dRkD4XlVj3TB/R3nlZZz6UpCGt3O3Pk496ZMBxfKqFefOoAhfzijFmSPFSlJmULz
	wUq694n3AaNgFyALwl2y5W6bY7XOIZ0g9OEkLAmV31WY4Nz6oIROninJZEXrVlxxhZxm0nfsL/f
	VOA6q55VQ+a+TgQY05h9YtsROUuOuV6Y7hV1QlAtTD5MOVDqS+pl6vzZuPEx2OcWS2+mZLEUkBH
	j1oW3lVuyNIxP6KvNa4hk4jCdEStPweofvpRi7nn7j1tA4HacUJLqBEfJ1O3j5k8XYay3rHmeFw
	e7XvLxkDHrlMTxUF13SbLLEBc
X-Received: by 2002:a05:600c:4f0f:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4ac17b2cde9mr476747035e9.7.1793876110240;
        Thu, 05 Nov 2026 02:55:10 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b57317cb8esm59576355e9.13.2026.11.05.02.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:55:09 -0800 (PST)
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
Subject: [PATCH net-next v5 1/6] net: phy: mediatek: export __mtk_tr_write
Date: Thu,  5 Nov 2026 11:54:57 +0100
Message-ID: <20261105105504.1024-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105105504.1024-1-ansuelsmth@gmail.com>
References: <20261105105504.1024-1-ansuelsmth@gmail.com>
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

Export __mtk_tr_write to directly write to debug register.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/mediatek/mtk-phy-lib.c | 5 +++--
 drivers/net/phy/mediatek/mtk.h         | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 4c4eca870bde..3e4fb899a85b 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -36,8 +36,8 @@ static void __mtk_tr_read(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		*tr_high, *tr_low);
 }
 
-static void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
-			   u8 data_addr, u32 tr_data)
+void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		    u8 data_addr, u32 tr_data)
 {
 	__phy_write(phydev, 0x11, tr_data & 0xffff);
 	__phy_write(phydev, 0x12, tr_data >> 16);
@@ -45,6 +45,7 @@ static void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		tr_data >> 16, tr_data & 0xffff);
 	__mtk_tr_access(phydev, false, ch_addr, node_addr, data_addr);
 }
+EXPORT_SYMBOL_GPL(__mtk_tr_write);
 
 void __mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		     u8 data_addr, u32 mask, u32 set)
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index 79e09727b81b..3565e39b96a8 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -72,6 +72,8 @@ struct mtk_socphy_priv {
 	unsigned long		led_state;
 };
 
+void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		    u8 data_addr, u32 tr_data);
 void __mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		     u8 data_addr, u32 mask, u32 set);
 void mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
-- 
2.55.0

