Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EF8437467
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553467; cv=none; b=a9tIFYPQ2+MyJzAcvgEHslNXTdZFzvUuBgygbr+t5e69cxstH9EY3KqRd7UU9l5yuSlbny3JhW9p7tTxTKXg5dMeF5UvfSP2cu3ZfLfuC77S1TeJEBMUydtJUbezZHBL1qIhAH3sWWT1Q2H71pxcxww6YzHAKNakMr1xVcn7F0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553467; c=relaxed/simple;
	bh=sbmklAVHibtrHK+aKwm3e6Jyo1t6iyYb4SwjQprbp88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgfd5B0dZx72oKWNtrhgIFHz15zCvLHgN9PiKWu298fVSHlBZiX6usIAwYNi8AyDCe66omAwM0uqZDi5TYAJWUkwKek5Ly+fNpZdHu3fMtnL+oQWi28H+OKz/5U2sswIk3RbB5xDFVejW5Xrxecy2hHiujLAt5pHfClWbjYors0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=NZzP0fDP; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="NZzP0fDP"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffe817151so5562515e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790553462; x=1791158262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZSYVYi3gtff7QUtLESbvRwDDV82KQPV1j3mmqyZYLs=;
        b=NZzP0fDPjMHt2ckwlkrI5NF/+4sNo1YiYacExM6Y4Pr/0rggIZ0LImmzKgFy2Vpdp/
         kCJmpe8C4GXDNtBDtqfTYBFuXv40J8GfDp59KlRh25DZVTdmkGurDqMI1oT6m2wT+V9e
         nM/kiw3jczyvikiGOWClI+OAjFIPpl2u7PWMa+jfdGHIe5LkqOaQVpkWg8hPl0FeO1r1
         wwYZZxB2i6F/DaIst7ZJ1Z02d1xuXwsROXWjA7LFPddbCvOKJYZgRDHMQ4jRalBehQEc
         67Ro8O7gJxUCQ2WRTHg/BNtCAIS14KVWrkb1YGHHhK5O+GIV4o9gUz+dZYOirW2NC8LZ
         MXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553462; x=1791158262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZSYVYi3gtff7QUtLESbvRwDDV82KQPV1j3mmqyZYLs=;
        b=fVnhv/GYMzU5EUqVcv9RrCe3XHuaBGEGOzlP5xczxVlJyRlNy91tRz2OpBqHfFFbBS
         bB4wEGkf/vECaNm1+At4PP0R/MctZqhGKQs1IgKy++IhvvVockVf3n97rRjYD0Wjy9hp
         1M3rOVLCGLTN5sHTncPGwy9ERgVYUFZgrqIwPlrIlWuc3f/MAz7LMVRzyMcQCSdlEW6t
         A6SwR+DwO26CUAUNkEppOJINwqDhQDV5Cfqo9bVs8uTt17TxYgkfGvO4hVM4W9fqbbEu
         6EVnD/mW9POALvOo9Bs59jYnNEVIgNNZ9KpKfJm5MZLwB2CS0Ytxes2swkepjlrdCTIi
         RTag==
X-Forwarded-Encrypted: i=1; AKwUvBzIJJeqrMUSAg7Rm7PlhVuDuyeLLFZTxdLUmsG4IEiqXZR7A9ZCXWxcZ2DhjdZwLpaCuZ2qYVGrG+/3cTM=@vger.kernel.org
X-Gm-Message-State: AFuF++lVKlXz7z68BffEAnyU1xQ7kITKdMbvmxFdbJ5pDUQ2dG6q5kXG
	d+8xeP/O/eopJJCHbW0+XL5mK5VhwsPhkXAOkPyCSSsLqr7WT6tFpKWCNmXGwdBn68U=
X-Gm-Gg: AYBFou1MdajdjwVsxu+RzBe/+XEBODbovbAMJKyWF1YITy/Edslld9qXxXagYhx898t
	pUAHgiX2liebhZcyyuL+12D7ExPIqtkPI7Mp/840tEXGKpyDEebiD1QtpEJz147zuGUa/pNTzeT
	mGKhklO+9+++/D/x71LUDQeHsydJLS4ywQ9BuNwtM4mkcHsuEhXoLgl04snmMQTLXJ1dx5phA9y
	B3F3K6ITlE1C82mXIhWPzaFi49tGhj/73WRJJtn5Nuc/t/c5dpwVhiHq18tAcuDI0G1Hem2TJAK
	PCcDLLhxENkN8zUU/5HWm/RfDFk9InepRD6ICavqsWFsc4qQJPV14htPBRoCSaKHK5iJPp3mkYI
	NPzC2QEM8j4M9nFK7IGlCkusBzmvDVgp1vyMiIv1LlszluRmOvRq9BaEm9cRpgPCxfg+PodYjjt
	9KBWFmUOMDC9eKhunNb84INHuSWmXTYFa113H/750obh3jRO0ASg==
X-Received: by 2002:a05:600c:1c21:b0:4a0:2dd:7573 with SMTP id 5b1f17b1804b1-4a002dd77demr41913855e9.33.1790553462406;
        Sun, 27 Sep 2026 16:57:42 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017998dbsm137971495e9.14.2026.09.27.16.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 16:57:42 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	olteanv@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	steve.glendinning@shawell.net,
	f.fainelli@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v12 2/4] net: usb: smsc95xx: register the PHY interrupt with the MDIO bus
Date: Mon, 28 Sep 2026 02:57:31 +0300
Message-ID: <20260927235733.2619081-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927235733.2619081-1-f@lex.la>
References: <20260927235733.2619081-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt this driver maps for its PHY is written only into
phydev->irq, while the bus table mdiobus->irq[] keeps reading PHY_POLL
for the same address. That table is where phylib records what the bus
described - phy_device_create() seeds phydev->irq from it - so the
number lives only as long as nothing else writes that one field.

The bus is the one this function is about to register, so put the number
in its table first and let the scan seed the PHY from there. The whole
table gets it: with an external PHY the address is not known until the
scan, and with the internal one phy_mask has already left a single
reachable entry, so a loop costs less than a branch on which case this
is.

Found going through the drivers that keep a PHY interrupt outside the
bus table, so that the restore on detach later in this series has a
number to hand back here as well.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    v12: no change.
    
    Compile-tested only; I have no LAN95xx device. No Fixes: tag, for the
    same reason as patch 1.

 drivers/net/usb/smsc95xx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 42e4048b574b..b629092b94c2 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -1147,8 +1147,8 @@ static void smsc95xx_handle_link_change(struct net_device *net)
 static int smsc95xx_bind(struct usbnet *dev, struct usb_interface *intf)
 {
 	struct smsc95xx_priv *pdata;
+	int ret, phy_irq, i;
 	char usb_path[64];
-	int ret, phy_irq;
 	u32 val;
 
 	ret = usbnet_get_endpoints(dev, intf);
@@ -1239,6 +1239,9 @@ static int smsc95xx_bind(struct usbnet *dev, struct usb_interface *intf)
 	snprintf(pdata->mdiobus->id, ARRAY_SIZE(pdata->mdiobus->id),
 		 "usb-%03d:%03d", dev->udev->bus->busnum, dev->udev->devnum);
 
+	for (i = 0; i < PHY_MAX_ADDR; i++)
+		pdata->mdiobus->irq[i] = phy_irq;
+
 	ret = mdiobus_register(pdata->mdiobus);
 	if (ret) {
 		netdev_err(dev->net, "Could not register MDIO bus\n");
@@ -1252,7 +1255,6 @@ static int smsc95xx_bind(struct usbnet *dev, struct usb_interface *intf)
 		goto unregister_mdio;
 	}
 
-	pdata->phydev->irq = phy_irq;
 	pdata->phydev->is_internal = pdata->is_internal_phy;
 
 	/* detect device revision as different features may be available */
-- 
2.53.0

