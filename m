Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459222;
	b=N/tJWYrAzNfcOgqVY8oPeUmECdIrQEwz3vYxYgfz6wjAK2sH2PqLOYeXXdjKg1dztlJp
	 hEUDXL+OKZVrJRyQIGdHlLq3zMUo+ErSYklkFhp4B7hNAWk/CN3XgjHYzvhtD/DZYVLrY
	 fTfejMoPBBivitGY/vFfg6dHskwPIBMm+Iov94/zho36PhuEcaYYQkE9V72UekM/047Je
	 TFQmpbeU/MMIE31DreNxhyA5eRePlit3wEjkEafXiLgGD+KdP+hAOdUrlTmWp6unajiNa
	 lEi1hEvmDw7mv8FeZAwkP+VztV7QXAZYwE9hGNKU8haqOS/bzd4xB7h/ZJWNIEofEGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O8eFfbSG5vJmh+PRh1YD9XBTnKbqGfFwPb/6vx+9vU4=;
	b=dC5e8SQypGUBkolAe8l7lq+a3yk5RN8gEFN+VkI8mb7iBLGbCMxDeSkpr4DKBp4kDCG7
	 ZL4Wez+zCSr6nSJ7qq3zL12bHpzy2hVbaqOdrU3Xaod8LgV2bpulOKbdqky3C6irOFMrl
	 xd/kJoZISljHzPnUmGTZPAHa8r6Hd4irbMwWyeZFAlcIiv9PCo1usORSQORVWrg1OIXyu
	 QzHwywM6+ZCFed8eYeaXqbpRff/l486yIhM18531lsX0Zk7inCUyh+vVz7UZjbtdNForJ
	 DsKzx7l4W1owvtN+KLUqfzIjfpoD6xcq9ex1F7fZNh9mVm/GwCyCHXQIvKd4vwMQFyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NN7eytIU;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD781606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD781606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NN7eytIU
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36e795af1d4so420763eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459221; x=1795064021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8eFfbSG5vJmh+PRh1YD9XBTnKbqGfFwPb/6vx+9vU4=;
        b=NN7eytIUilnZEYZS7gynUWECf0M2MjFXYFQhvcRVtEP4HW9EiNpXJxHIKdLxZ3xVCE
         pVRvJV5Bh+WjrFHUyVpiZbA9bMW9+IoWIZcpunlUz/sjJUFVtUWn5FJCFfn8I8e10hs5
         S77eg5yDcu9yVmDUhMVdicVA/VCteI6ugiVM9EI9vqWxYvttoDKZ2EePcjXitnZwLisN
         wBZstSX84CRM6go61KvtvrVN9GjVDpdRRLLPZV0nlYCIY8x5cqpesfq6aU97/7G/pP5B
         tuPb4XcUDiL45k8HkspRMVnU94wKzsWED7P5ETntsuVRc1KYdBmO5kBzZ3re4JiwEF/A
         2p6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459221; x=1795064021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8eFfbSG5vJmh+PRh1YD9XBTnKbqGfFwPb/6vx+9vU4=;
        b=ofYVt+X+Shs1XhAYc1XwElF7llSwmDrAaQJS2DQK0ihlGolUecL7oL0o2Pqy011qph
         A2/66tyRio6jRDr/QQBxD8K/t6tjrsqcXaX9uy+D6z7DeF0IoPRSuBAG4IhHYSx07O4z
         P3iXRwrnpxgs9RdJ4u27ZZ8XY85HAKhXtal1LHFYehH5y5s93yNd9VgbvChFnQSjWyu1
         IgEtYkvAUaeAFDcut19rNlfk5xPUMpSO6F/Jl34BfirnKWko+q4kE9ax7GWhJdi+2WLE
         dYDMkiS5iA2JAfCnnAQflVvLHDcAJ8W4A0EcUsRGquz0fjrC/QLI6oVx0qnJ6Ni1TNAm
         hqZg==
X-Forwarded-Encrypted: i=1; AL+hErGJqW9nisWem0G26gST+k/RRT/be5qQ8fkmVc8fg4Ag0VS3YmGmILFAvov5XoeranbBGliekYgUX1xJ9Yw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wkI+Gioog8f9nH92g21UDE2yxozAlqiu9m9r7GbshO0+YlXHg
	XPP0OgJW4jYU58XHF8ACqDGY40TsDANwVMxEaXr+W2N9WbRiEZyyT+To
X-Gm-Gg: AYBFou2tIF1Pqfv6Y177pA4QxmJfa7MXneKUpDG94qnKzZpelWHRVd6LMTAJsrgpH8N
	b4WWLCsBQlmkKwXODccFB/XuX8aSrADdv5RqOynbLFl2K0D2087LIZh0UmQvRleDgZBYVobtOWg
	gr8Q+m0IVRU75gx7QZQx7mGZrb0C5uwGnZgvwRZh23HGGYDPCi9TYuAJ5STGBxlEW8kTNovE37U
	HVzT3HoD4QSB/VrndQTi1Wlh6k1oWq/zcdfXgsT4a6uUYG4YfbHCvF6aCmnNQBCGnQ9JCLDWjrW
	8Pv3WK527EmzFSxQJr1jgicmfg67bp+i7HrEmMVRj9g0PjIfJSVgs9dmK6kIalGo3OGfDTYmvzf
	vCtsvFaP5zNzvC2KQ8uGJ2i5y5lq4t1A0UI+XEt+PyY1yU0L95brndQKbyYIwVteMIBM/73QT16
	Iwf1TO5xUeB2DhWSccHd6kv+IVQs4YQ3YyO86lO5vwZlJjDi5c/5evOD7ElRReU8FJbCV5aYyAP
	aAg6J8UeRJTamderQl/LjcVCTCIFuJS6+SLieI6BwnYuemSMVnWtF+MFDemTVp+VCrXlIf50vAB
	r53yJi1nNlZheH21sNPdWisAafYt5AI=
X-Received: by 2002:a05:693c:80cd:b0:377:82e:2d79 with SMTP id 5a478bee46e88-377e093ecaamr1595631eec.9.1794459220160;
        Wed, 11 Nov 2026 20:53:40 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm23921585eec.17.2026.11.11.20.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:53:35 -0800 (PST)
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
Subject: [PATCH net v2 04/12] net: au1000: report MDIO transaction timeouts
Date: Wed, 11 Nov 2026 20:52:46 -0800
Message-ID: <20261112045301.3669532-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112045301.3669532-1-f.fainelli@gmail.com>
References: <20261112045301.3669532-1-f.fainelli@gmail.com>
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

Use readl_poll_timeout() for write completion with a 20 microsecond sleep
interval and a 20 millisecond timeout. The MDIO callback runs in sleepable
context, so avoid adding millisecond busy-waits for completion.

Fixes: 0638dec01e89 ("[PATCH] net: au1000_eth: PHY framework conversion")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 7063f9e5bc7c..6b2e216a8361 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -41,6 +41,7 @@
 #include <linux/platform_device.h>
 #include <linux/cpu.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 
 #include <asm/mipsregs.h>
 #include <asm/irq.h>
@@ -278,7 +279,7 @@ static int au1000_mdio_read(struct net_device *dev, int phy_addr, int reg)
 		mdelay(1);
 		if (--timedout == 0) {
 			netdev_err(dev, "read_MII busy timeout!!\n");
-			return -1;
+			return -ETIMEDOUT;
 		}
 	}
 
@@ -292,26 +293,27 @@ static int au1000_mdio_read(struct net_device *dev, int phy_addr, int reg)
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
 	u32 *const mii_data_reg = &aup->mac->mii_data;
 	u32 timedout = 20;
 	u32 mii_control;
+	int ret;
 
 	while (readl(mii_control_reg) & MAC_MII_BUSY) {
 		mdelay(1);
 		if (--timedout == 0) {
 			netdev_err(dev, "mdio_write busy timeout!!\n");
-			return;
+			return -ETIMEDOUT;
 		}
 	}
 
@@ -320,6 +322,13 @@ static void au1000_mdio_write(struct net_device *dev, int phy_addr,
 
 	writel(value, mii_data_reg);
 	writel(mii_control, mii_control_reg);
+
+	ret = readl_poll_timeout(mii_control_reg, mii_control,
+				 !(mii_control & MAC_MII_BUSY), 20, 20000);
+	if (ret)
+		netdev_err(dev, "mdio_write busy timeout!!\n");
+
+	return ret;
 }
 
 static int au1000_mdiobus_read(struct mii_bus *bus, int phy_addr, int regnum)
@@ -344,8 +353,7 @@ static int au1000_mdiobus_write(struct mii_bus *bus, int phy_addr, int regnum,
 	 */
 	au1000_enable_mac(dev, 0);
 
-	au1000_mdio_write(dev, phy_addr, regnum, value);
-	return 0;
+	return au1000_mdio_write(dev, phy_addr, regnum, value);
 }
 
 static int au1000_mdiobus_reset(struct mii_bus *bus)
-- 
2.53.0

