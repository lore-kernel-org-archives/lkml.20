Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AFE4E8DEF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790287205; cv=none; b=b1ukIK2krdMrpuSzhsaQboyQjmXSzxTe+JGUqS/8jNHuPK+XBJxdhL/a7tspMSn2h52vdZ2rMeWr0XvoraC1ZCgsZrsk06BhF1T9lMj6TbSbOS+gt8Ut6kffpem75bzKEIt8qsq1Xdyj7NsAWPSjRv+7Vz6KTIDrzT7k6bSwZfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790287205; c=relaxed/simple;
	bh=/ePXXN5MQW9Z3zBHwxTeKmLmS0QpVCVYJ2Ax0Aq9r/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZoXEGh0X4LnGUzY7b5kHctAATF5k+l2hz3cuZx3LZQQNtpiLIgTHOkmI6YnZ2258a6tTjSZ284llpfgvixc83TYFvBTiPAQXo9PleIovPIlsHioFOrD0jegarciAoakkJjHn7qKN4SJ3b0KSs53OLfIlFEU0EZlmIDWir5C6zmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=cSGwoJLu; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="cSGwoJLu"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so140453f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790287199; x=1790891999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWbtZH5BbM/fWleDkcM4oWj+mYV1VwVR9KA+u/4iSts=;
        b=cSGwoJLuHVzdieG/xtj0a//7mjN/6HYiI5OMbubUnU+brMRVgX+ryMfcNxUMr/7PYo
         F2svD7Mv1M0H/BAnyheA7eAJHhNCCnzM5OiUf0T1SKEb9cOnAM8xDVI6JaPZsxYXyipU
         u3C58smgfKKE7hJsdi1N0WYqgCl8XaqVvPyMlUAsdR5MPc7ozQ6cDyo0CFsolL8iX6rx
         mtP/PGqc+TJbCjVG6Q53nZYWkQ//T93J6nwX5elFWth3kOqHiCvWTS8/NloGRmO/G5fs
         0RlXUYDuw5h9XqOh2riPS7fS00/6IrebYWN5wRKf89VeZOp0ALWZzCfUSFB+D5oW+VpG
         ooWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790287199; x=1790891999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QWbtZH5BbM/fWleDkcM4oWj+mYV1VwVR9KA+u/4iSts=;
        b=x4mOwUoFOWzyLyC+3fOPNIiVzuOL1HCQajwKS7PX6ziIYYls4B0hlxfo6sXBf2vNKv
         V/KcFcHYJZtyR5qOpkc1AcZhXlIddgKgPfcLXIHZaXveAMPZLxlCACbkN/2TnSZ4XDxj
         825hahmw8W5ZNHIBlybb5MxpLeWcco3FXVGN4W60LjpTwDyjdEOMhhbsivz4aepzhA+D
         +CCRk8IY77aLWcCjIUyclVDtkNKJPsOYh0KNSfgnGA2K+A6eA8Guqmr8NZ3tAtZDKT2Z
         p4b5BStdd3Ya9Kg3HnB6xtMinSm9/s+iUNxyZbhpDKqojzsjLHm69Gfnw2FD9Iu8cpDf
         QS8Q==
X-Forwarded-Encrypted: i=1; AKwUvBy8tA0o7LoQ0mVzT8GkHecmN7CsK+n+WZSKZZ0q9IvXo5cd/+ZGGAo0DzOJplbV4L0QV+Mq4iVG/76kI5I=@vger.kernel.org
X-Gm-Message-State: AFuF++kdXURqgKdoxoO3t0kDKeRxZlnFx/V7dvZYyp0DIFg0ax/xIGuc
	5OL7vfFmQJ4RZJkfCzY/SdePMcR9+APX4dM94jUHTc3mCfKEKlfg3zl4Ye2cI4epovc=
X-Gm-Gg: AYBFou0T/Ifv1dGdkbSZ/aBoccpD8L/kJJ3DhP7Kf3b5H/+poaJlZy6tWpdHxLgZO7e
	cCDiuJf9Mf8UU/WSSa8a0IJHRhaoCqOopH2p3pj4RHg12PYHHrP/9BZA06AhI9OWsz4JRXrOZQ4
	pSB46YjVU/TIdwTboq8fJSQlwK+HknCGDxl4v5JWSeeTpOY3A3aHXIPVd0CPSv0bw5TR3RpMB0U
	wBq6Z/PtAgA7HqPkqOPIjqrmqV/QpO4vvTCSatJyaasg7d1NJNpSVWsG9nz86qkqqPItuLmSCoj
	JV203ng6DcDoLgNWZBmqkpYUdYLRQoJZy8z0o5/oNv1vvcQ6GVe3eFjEA7Dffmi+rKtRp2mebNn
	k74VWsFAtDRDDWkXZ1+V1kFpjvUDsZl0ELQRCJkt9VPRa6Qsqwud5tgqmH/ovNJRtEGsvb0cobu
	sap4PsvmgDatsYNRIAyTNRnpNLtQJm8M1gU91H5h0nNBQV0sR9BF8Mm6YvO28P
X-Received: by 2002:a5d:5e8d:0:b0:487:40d:af33 with SMTP id ffacd0b85a97d-4887da06e1dmr334977f8f.13.1790287199022;
        Thu, 24 Sep 2026 14:59:59 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm1922324f8f.9.2026.09.24.14.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:59:58 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Mao Wenan <maowenan@huawei.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net v3 2/4] net: phy: put the driver module the attach took
Date: Fri, 25 Sep 2026 00:59:48 +0300
Message-ID: <20260924215951.2127682-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924215951.2127682-1-f@lex.la>
References: <20260924215951.2127682-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phy_attach_direct() pins the PHY driver module through d->driver, and
phy_detach() releases it by reading d->driver again. Unbinding the PHY
driver while the PHY is attached clears that pointer, so a detach that
runs while the driver is still unbound skips the put and the module can
no longer be unloaded; if a different driver binds in between, the put
lands on a module that was never pinned. The NULL test added by
commit c2b727df7caa ("net: phy: Avoid NPD upon phy_detach() when driver
is unbound") avoids the oops but skips the put.

Found by reading phy_detach() while chasing a PHY driver unbind race on
a Keenetic KN-1012 (MT7981, air_en8811h built as a module). The leak
itself was not observed there: unbinding air_en8811h under the attached
lan4 DSA port and then unbinding the switch faults earlier on that
board, in phy_free_interrupt() or under phy_stop(), before
phy_detach() gets to the put.

Remember which module was pinned and release that one.

Fixes: cafe8df8b9bc ("net: phy: Fix lack of reference count on PHY driver")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/phy_device.c | 8 +++++---
 include/linux/phy.h          | 2 ++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 7046976c5b6a..29d65f6cfd59 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1793,6 +1793,7 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 		err = -EIO;
 		goto error_put_device;
 	}
+	phydev->drv_owner = d->driver->owner;
 
 	if (phydev->is_genphy_driven) {
 		err = d->driver->probe(d);
@@ -1894,7 +1895,8 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 	return err;
 
 error_module_put:
-	module_put(d->driver->owner);
+	module_put(phydev->drv_owner);
+	phydev->drv_owner = NULL;
 	phydev->is_genphy_driven = 0;
 	d->driver = NULL;
 error_put_device:
@@ -1955,8 +1957,8 @@ void phy_detach(struct phy_device *phydev)
 	phydev->phy_link_change = NULL;
 	phydev->phylink = NULL;
 
-	if (phydev->mdio.dev.driver)
-		module_put(phydev->mdio.dev.driver->owner);
+	module_put(phydev->drv_owner);
+	phydev->drv_owner = NULL;
 
 	/* If the device had no specific driver before (i.e. - it
 	 * was using the generic driver), we unbind the device
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 5f8d65868e0f..33a207ac5c30 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -560,6 +560,7 @@ struct phy_oatc14_sqi_capability {
  *
  * @mdio: MDIO bus this PHY is on
  * @drv: Pointer to the driver for this PHY instance
+ * @drv_owner: Driver module phy_attach_direct() took a reference on
  * @devlink: Create a link between phy dev and mac dev, if the external phy
  *           used by current mac interface is managed by another mac interface.
  * @phyindex: Unique id across the phy's parent tree of phys to address the PHY
@@ -671,6 +672,7 @@ struct phy_device {
 	/* Information about the PHY type */
 	/* And management functions */
 	const struct phy_driver *drv;
+	struct module *drv_owner;
 
 	struct device_link *devlink;
 
-- 
2.53.0

