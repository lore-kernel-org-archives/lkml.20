Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140321;
	b=uqX0+xV6mcJlWNfMyx5dPcKTqCFul25DmDw9+ba3HG8qdOdgJlNg2v0kKCKIZCEhZZN2
	 I/t87EqdjXVrP6OXgfQ/LUdjFpiQWo+QZBRmVZ9/TnnxebA5iegR+R54YwZAT3GNyFJeQ
	 R0gUxXFI7b2mrbzLdQ3zUqmDetC/CETao+PtUv2uHxw6KaPh90BzHtBh1yPeb7WqroUKE
	 PfaHQjtOxIOXLMZJqf7AvFes7fbjVEd1xXy75S0Y3L4cc/nCI2tuehhUE4NdpQJGd1zoM
	 dPGRJdXk4NtVCn1ehaCCHO56EegR452SQjzFejVR2kNzp/wLC3NVFmiF/jMrNRp/Gng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qlkjggDKZvzL1qBD/gss+oMOAIYMRyrKeyJr/EKm3oQ=;
	b=oBVFE/tF1jm2mdj1oQoxMPlKzAhSa2rJNtd5asMe9ATUH7FTC8LvggeFovE1EI6E0Gtg
	 TmKvH4sMbSvgBGfzvAU9WpO4GSX5mMJ0B++DzSkR8xGlddWx0kweQGKXmgd3bvwYhsqeC
	 hfZ64XufJjQ0Y1kyJQe3Xied5zgZuGyKsIqGIX9gG2rLHfZD24IC7O4+ZMn0lmpYppU9u
	 4DcFlZd4jsYf4eKYW12Kc9NnbdR8lklOUesk8yIiAJQSfNRzszjpTxSeZ+QhZVYHgvoOy
	 4xxTwiltkiihPuHsPGiItj1o0IxtK3JI1sqfGZ5XqnBKyoZ6rm3D/72f4+KqW60MphA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVYcG2rx;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC1360A2601
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBC1360A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVYcG2rx
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so563410c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140320; x=1793745120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qlkjggDKZvzL1qBD/gss+oMOAIYMRyrKeyJr/EKm3oQ=;
        b=IVYcG2rxhrnCuASVXg+H//hFJKkhpKHU1XWiw241uzglYBgilD5wbBYmLdCnDVIU4H
         xgTq8U+1g+IDgfqhJEZ6Qlm1gJk0CAZ5ETZ49899z8PSxxf7mkH/1GFmNx6/H9ol3IED
         qLmLwMjuG7Bui+mR/QcZ+HwVq7DTmaBnlubP5AF/F2tlY5M70pcapwn7mI0AK0Myhgz8
         oVfAoi5xVvguR2TdbodDWQeFA89HGLckBI6kkqEQVocmWzywA0wFdV0TMVwFRp6U/H5w
         RypEeIDSvkQT/aMDlIKwlpV7YO5oy433BkrDufRotzghOTBWctDMUIRLrv9uoLCwqq1q
         OZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140320; x=1793745120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qlkjggDKZvzL1qBD/gss+oMOAIYMRyrKeyJr/EKm3oQ=;
        b=Icc1jeoXZ4MnmuUfaxHQVssmJhyBvFv4+CTdlAEmq5anwl+F/eOXD4r995sDeeNGv8
         Akh7eNfK9q80RnHk469TH9zPgVsT+D1I+kW/7smbkFhBWjrpoamq5fCLT0cUp0ZH6bEr
         Jn9yHV1h9az0w7eKvu4bbJYT/UCq64jtTLY47gGPBOGKlqGxpcNQ5Fj4h2Uo5YJ8P24u
         CxeM+0NFUrKdn8T38xsOadivSJkf7s8uf3R7mWtsgXjMnAJ6MBnkUPfxIX5cpOO+DJM9
         Zn++8jkjVLtG+wp+4qdfyo0aAb3NZl03FFCGc5e5oaU6NEy5GlHLzh07fghZPux3fw9F
         lPGw==
X-Forwarded-Encrypted: i=1; AKwUvBwV1q0JXKOysJhYTRstjcA7v2xfXFG1p5dCBC8zgm3Od65lVYk/w73koHQ35NSCvMW9pkNi1isFz2/yTvw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEnEVQ3t1eIwSj9kbimOLZTVr1HhfU4XXYbWyayF3T69Hth5L0
	Pd7r7eknjwGKosxeca1CfqZvEXzX4cHs282yKTjJgfOtUojTj5DpugQZ
X-Gm-Gg: AYBFou3J6+IDwdsI18w6SLPlo6l9EKbjKgsjYvZBp4+q1R7SqbGZ7hO0wGPOyrLlYyb
	yYZ1IAs/z1m+dIW3Dr/HN+fM25Iateneqo3kaz7y52P2se4lRqlRivLXr080pZ5PZEJ1T3cxE2R
	G+DOftNXv4wXUv2MxoFbYSL1j9u8+l1N7danscQ9nuZ7zVqoJxURstfhCNcYt4+XPmPKrz+ba/v
	zucmAqLBExAbqWBMBROQRJ/rDW+s2RUbCYg4p4Fa1hH0ldyNUBmesQxb1Ne7pU5mGoGwG5iIU+W
	33n2rXm2m9mlI17kM56rKbl4Quc2Ra3626RQsulyVxGrKxlJHf4OM7e5/s9V9SJ7K9CdS11o09v
	oTy2tWzA0x2sE2aQfo2cRsODz53m3/tWx+cW30lRSjVi1KyZuLpvwMSb1KvFk762Ue4zEiYGU+4
	mr/JePBltgrFhW6vVWQ3RvmO0ViBZvZlFFHHHQWv93lW7RZanI9KOjCmc4tpZKU9BAkTJ2mkzUb
	hNFvlACOU7kGo1/ZS7k64rvBwtvsHdu8Iigd4/Q3r1QOmOe9ZF8YkCV0Lh1hIWsngGB3UCIo2GN
	3vFcTVboojoODEdO/YzHwW4TI6Gnvxfy67aQKW5HQMNQNIuBTNAkoPesgQ8aeVthIhs+ODv2iQB
	F
X-Received: by 2002:a05:7022:fd04:b0:16c:eaf1:335d with SMTP id a92af1059eb24-1a6ce2fea82mr1069692c88.30.1793140319805;
        Tue, 27 Oct 2026 15:31:59 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d98c93d7sm1130735c88.13.2026.10.27.15.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:31:59 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Jeff Garzik <jeff@garzik.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net 04/11] net: au1000: report MDIO transaction timeouts
Date: Tue, 27 Oct 2026 15:31:33 -0700
Message-ID: <20261027223140.3774570-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027223140.3774570-1-f.fainelli@gmail.com>
References: <20261027223140.3774570-1-f.fainelli@gmail.com>
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

The MDIO write callback reports success even if the controller stays
busy and no write is issued. Propagate timeout errors and wait for write
completion so failure of the final transaction is reported to phylib as
well. Return ETIMEDOUT for read timeouts too.

Fixes: 0638dec01e89 ("[PATCH] net: au1000_eth: PHY framework conversion")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 70319b432182..a507a524370f 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -278,7 +278,7 @@ static int au1000_mdio_read(struct net_device *dev, int phy_addr, int reg)
 		mdelay(1);
 		if (--timedout == 0) {
 			netdev_err(dev, "read_MII busy timeout!!\n");
-			return -1;
+			return -ETIMEDOUT;
 		}
 	}
 
@@ -292,14 +292,14 @@ static int au1000_mdio_read(struct net_device *dev, int phy_addr, int reg)
 		mdelay(1);
 		if (--timedout == 0) {
 			netdev_err(dev, "mdio_read busy timeout!!\n");
-			return -1;
+			return -ETIMEDOUT;
 		}
 	}
 	return readl(mii_data_reg);
 }
 
-static void au1000_mdio_write(struct net_device *dev, int phy_addr,
-			      int reg, u16 value)
+static int au1000_mdio_write(struct net_device *dev, int phy_addr,
+			     int reg, u16 value)
 {
 	struct au1000_private *aup = netdev_priv(dev);
 	u32 *const mii_control_reg = &aup->mac->mii_control;
@@ -311,7 +311,7 @@ static void au1000_mdio_write(struct net_device *dev, int phy_addr,
 		mdelay(1);
 		if (--timedout == 0) {
 			netdev_err(dev, "mdio_write busy timeout!!\n");
-			return;
+			return -ETIMEDOUT;
 		}
 	}
 
@@ -320,6 +320,17 @@ static void au1000_mdio_write(struct net_device *dev, int phy_addr,
 
 	writel(value, mii_data_reg);
 	writel(mii_control, mii_control_reg);
+
+	timedout = 20;
+	while (readl(mii_control_reg) & MAC_MII_BUSY) {
+		mdelay(1);
+		if (--timedout == 0) {
+			netdev_err(dev, "mdio_write busy timeout!!\n");
+			return -ETIMEDOUT;
+		}
+	}
+
+	return 0;
 }
 
 static int au1000_mdiobus_read(struct mii_bus *bus, int phy_addr, int regnum)
@@ -344,8 +355,7 @@ static int au1000_mdiobus_write(struct mii_bus *bus, int phy_addr, int regnum,
 	 */
 	au1000_enable_mac(dev, 0);
 
-	au1000_mdio_write(dev, phy_addr, regnum, value);
-	return 0;
+	return au1000_mdio_write(dev, phy_addr, regnum, value);
 }
 
 static int au1000_mdiobus_reset(struct mii_bus *bus)
-- 
2.53.0

