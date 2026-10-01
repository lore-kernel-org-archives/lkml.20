Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3A844F562
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859697; cv=none; b=o6R1Gnliygp+Rl+7E1u7FVnFu/L+yuyMLWb4HJ4Wjx8wXyI2/3cKXtpQ3sjuvOeLWSq3n+hzw6BKn7EkGsIDp7+d7ykpzGF58+jt3Nt3iHVb+LKsmShkMOQGFCPMXesAc5LpnLehj7l2R3B0mVpfXqBSFSdxp8rM9jAynIaf1dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859697; c=relaxed/simple;
	bh=kS5sNTOVPCEIW//wHCyvsh8Kl8aNoh9xlRFm7RxnvPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OeaW34sAx/mSBqWotnKkFV3R5dKcTmktKRvn/Ea58CT4J56YMvS1lLsCbYYPOw2qYKhRD9xl8jcxKK6p8QT9JdORRb9tlUH9H7cjDAW1eptE6GEhgNJvYVENcrHEVfu9RaLKnJu5GZ9fYgDoTpNyNo4/UBJNN4FT2zYXx4FBOR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=hs2XKL4o; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="hs2XKL4o"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so38959055e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859694; x=1791464494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9QJsD98pvpHVb1fRmUkOtQE2jmx7Va3tzYeOYDpiNPs=;
        b=hs2XKL4oq37kisLMsCZgE+5m/V0sLN5z+G/SjuEgWZl3BxK/K/TquCf7bqrggJFFpv
         cyatmsgsXy66v6GCnOacRvJ13yweBpagQCbEa3gTNkL3hVzdDKdrnFXdcEpbrF5NaZw5
         M0kEAQpBXteQ5iIAvvvK3Abmhyxmy+5br8ne2p4MNn7Pc4MzFI9SpnsOsX8+66BsyNeR
         UEiIGaQq6N9GMePMHBLHS2S2LkQUgdo+m2zQO7Ft3U2SfV41us3gBR7hfPD71suiQYP5
         pYaWrXw8lGSB+ycxNh49d9Y5I1Z7pS/jwefEGBK031v0LXK0hVdWLXx9EICEhliQanTD
         OtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859694; x=1791464494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9QJsD98pvpHVb1fRmUkOtQE2jmx7Va3tzYeOYDpiNPs=;
        b=a0AZ1NSXlw975a8b72uYJ4Wy7aFqexu4hQemPQcYdAv1GrrCO0YUKm5VTjLP/FTFXI
         eFasGEd38LlImZzobqU+/+DLkEERxby6bXzeiqEgpyLAj6EBNWqd30U5KC3YzeVc/f7j
         mFSszWYpg+88m92ByCrtTjwH7sMoEqYmaIHsIRF9Rg6WoIRr/fGuV6PnWqlEbuuPF09r
         QaIyyf525MSpLSYKbNFNWYM4QiF9fbuOy+qQhF8SPtPYaKvdU2rJhlhZItRCOZavjdDj
         mFzY0SqujCAT2kdnfWmVzwMJLx2Ctkf7aTpGxRZ4x5weJOXe6Uzw9/tKzYuOgHorFLoc
         LmqA==
X-Forwarded-Encrypted: i=1; AKwUvBzoopmjS7gwuX7TudEw6P6GlgKy1fClb/NEZ3EX7m4Qg3NJHXDtBSOLFzgS7CAPLhvPjKn8dtT1Dx9rOLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kEokaAuveLMoER7gpZiPUPz2z3o08RGBx65YjcqWp7AG4143KD
	09TUpn145M+mGZXHvn1DAMbvM2lxL1WUfeB++e6tW92ENk7YP28VRQwT5HLRhvqXNqA=
X-Gm-Gg: AYBFou0BmTQ0bG5D5JqlAfEokQm71sxm/IEws5KF7QBYAzxX/cd/13qj1kRrFTHffYr
	4u3D9PCS0q28FE6XwfgTfi1Nc0apD4hWlU3XF1h7d+q2TlJnE5T3UDi3IwVSJ/MRK3MVyHm8m6L
	iUBrTy9BMSvbFtpynvTNqy5Cw1wpEK5vv/haw8d7X0V38wJi4x7jhhGSfnB3gjBVwf28le1Ixxh
	RuDF0nsmc+NkRYq4HMsCgR1mIHdY5v0whHOmO1i1G7LsQM0/IueBtz3slXMAoncfVIFZyNhrai8
	4ZQMYdI8bfKhlFnttsN5wxI5NFvzoi1ofpnaqB6lLq0oVF9N/od1gm0yhw07OyPKMfL6tgeTHEG
	BfSogrg/NIOlauUEQ8O2WRlem0xxpltsBiwrQWBPf1VdT8C3UP+yVavgV53FdBNeRnCz4gxZDgr
	WZWFQ5px+W9TMQTeKX97RzkrEj4vkkqKxwbmABLsRKZEM4UZt0Lg==
X-Received: by 2002:a05:600c:3145:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-4a01b0072cfmr77273135e9.34.1790859692123;
        Thu, 01 Oct 2026 06:01:32 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f99b113sm77732245e9.14.2026.10.01.06.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:01:31 -0700 (PDT)
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
	Woojung Huh <woojung.huh@microchip.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v4 2/4] net: phy: put the driver module the attach took
Date: Thu,  1 Oct 2026 16:01:18 +0300
Message-ID: <20261001130120.104628-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001130120.104628-1-f@lex.la>
References: <20261001130120.104628-1-f@lex.la>
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
Changes in v4:
- Rebased on net-next. The put is now in phy_detach_internal().

 drivers/net/phy/phy_device.c | 8 +++++---
 include/linux/phy.h          | 2 ++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 0bdd2dc84d81..b5074599c988 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1728,8 +1728,8 @@ static void phy_detach_internal(struct phy_device *phydev, bool notify_bus)
 	phydev->phy_link_change = NULL;
 	phydev->phylink = NULL;
 
-	if (phydev->mdio.dev.driver)
-		module_put(phydev->mdio.dev.driver->owner);
+	module_put(phydev->drv_owner);
+	phydev->drv_owner = NULL;
 
 	/* If the device had no specific driver before (i.e. - it
 	 * was using the generic driver), we unbind the device
@@ -1831,6 +1831,7 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 		err = -EIO;
 		goto error_put_device;
 	}
+	phydev->drv_owner = d->driver->owner;
 
 	if (phydev->is_genphy_driven) {
 		err = d->driver->probe(d);
@@ -1938,7 +1939,8 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 	return err;
 
 error_module_put:
-	module_put(d->driver->owner);
+	module_put(phydev->drv_owner);
+	phydev->drv_owner = NULL;
 	phydev->is_genphy_driven = 0;
 	d->driver = NULL;
 error_put_device:
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 7c5098a0dd6c..a5a419bc400e 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -578,6 +578,7 @@ struct phy_oatc14_sqi_capability {
  *
  * @mdio: MDIO bus this PHY is on
  * @drv: Pointer to the driver for this PHY instance
+ * @drv_owner: Driver module phy_attach_direct() took a reference on
  * @devlink: Create a link between phy dev and mac dev, if the external phy
  *           used by current mac interface is managed by another mac interface.
  * @phyindex: Unique id across the phy's parent tree of phys to address the PHY
@@ -689,6 +690,7 @@ struct phy_device {
 	/* Information about the PHY type */
 	/* And management functions */
 	const struct phy_driver *drv;
+	struct module *drv_owner;
 
 	struct device_link *devlink;
 
-- 
2.53.0

