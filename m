Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D5E47CA68
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859698; cv=none; b=rQvZZSSOhrNzKZOg6afAf3naegvqNYIvRrrTDJMLFH3siNknyIepzJgZDQWMZVyf8qg/NfU9+bmkZBQrwqK14FTZ1yXjsq4IAwqh1fQAmFH1KaoGrDbw7PfDEu7XH05ZaT8/WNPXu5JtcgJDwEfy6MLoLSbtDucgwkZa6zURPeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859698; c=relaxed/simple;
	bh=gyVGlu8Jf8QhJW2PMFIyAhrC++GF2gHnVFwo/EL1zLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3Cbsn7R9Zm4Y6m6QDyOY/0v2LwgRjs1ICJr6DWL9BClGkrIDVBwzpzJXe+g0thLNsVy9o9diJpUWq3CZ+O3Y25eYeBeG67XI3ur9c+jTuCFDESxxB+IPKE4ZSFKh22t+gTwCZgfKkk8NUXVChFYziHSgvI5M5x3ccpTkoFZ+V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=TSG6ij2o; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="TSG6ij2o"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so48860675e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859694; x=1791464494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjEyiExzhKMBD+elRAgzYRSA0CsvhxO6ACS8LfxUaG4=;
        b=TSG6ij2oaYn7M37URWjJjEGYR4Leuq+uyLYt/8xvXDYVfqlLdRVrwwIGKZwCdux7Px
         5jl12GoN9Hx18xYAaLEOuWmVGOyTifUnWrcyYx04ksIFKVDq1U8EQqL3qBDSPuIoqNqx
         GKo8nHgzm6kE8ENSFW73zt6kAFT2zTuFePurnVPoZiBi71MBunlPbV4ORyoJ03i+5s+R
         QpkBS2m13DSHT5KagU0UppdPyPMKMh5NyCZn7jjOELPMeZ8HenUyjtAAfjEOATHZkXuI
         lg06jSbIdm8a0kzUOcAKzh1mxIb8TNKTQOB4TH0DgzL/YFAWWvuatYHCItYvp5ugjiAx
         MkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859694; x=1791464494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CjEyiExzhKMBD+elRAgzYRSA0CsvhxO6ACS8LfxUaG4=;
        b=CGZZR7X2eJVC+cQ5+6+jL7p/cEoVUCbqdf8jg7vp8HC1YIhRO7lBiNgpWN21Rjkxmv
         B2uPh6cdxHEPPRtTGNQi3LSm7GI6B69QiISBxz4DP+zhkGz/Kr6BVmKth2L74zAI2kXE
         6SP86OumUTilaGaQYUNeA0RfrDWCJdiLQ/c4s0a9F/MSUd1u3HDNOshOYa96SHEmxnlH
         DBlzYIgVaa+l3y4W2fatYVLeM2WNS6i4mnFarjP8ha98EBa22B7WnLGYelkaYRRcuy96
         Z1LXCncz4JmcZCtEyfnQrbcYM4yJThwk0hPf9eX8VUPEBifT6f3oB5oxg/S/xiaahckM
         iynA==
X-Forwarded-Encrypted: i=1; AKwUvBx1P9lboQ/ck3XnKMcMn7PNgynhgQGtDZuNyhMEcECwcuwHtbtyBeqlQTtFUlfSWym+erZiMXZeMGuXBYw=@vger.kernel.org
X-Gm-Message-State: AFuF++mhT06lXaZwPW5fC591UDxW3q35CAj3jthm83yDvIl0u4NOavZi
	uhK/j4yXQM8lIuwB8u4lNEEnWrGtWCU9eGHyIA6BTuiHx3VUswjJmxAPOuslg/BJ54A=
X-Gm-Gg: AYBFou2dG2iFhBeBS/yS2xsKb8cWeMfg4oCxx8ZYltvB26zpkx/RNsjtRc0BT+XqhJc
	frcJ5GrnPwk8u1Ssi0cEfEnCtrrZ++0rWca8Jq98zTbSNboFkTWZoqFUzXp7CuhLljh3xNOVP3T
	d1ahZlfLCInCQ4kM7vL4aEJa2/fk95UULm1cCA8X8XIa5e/zhQ/NfH113Jt2QBooDlSin7NysbU
	CbVDokveSLH7btYyD8D8nbOMbXucKgR5bMYWI2Hvl/PrnMOj5uCT6PV/YsV0LBFBEftNV+UzKY6
	pWmaPFAbgHNwGOp0wRSzz4e2rWx/OhTv0LfNQoSzx5JJrJmWyxhWGfs3Zj1gFX4w9jwaKRpQw/O
	QDgeuhOMFEjsZiibKZ2AygPQ3b0XVtIEOdg4VZVIqPbK0oyd+M3jQB2o17mkSmhl3iwe+gPnfM+
	meRml8YsZnc7Q1UJSAb5uVlfBd59JDj2QrDyaD94PBNwvmYSn1ILkrtMlY/y8MOw==
X-Received: by 2002:a05:600c:45d3:b0:4a0:98c:e082 with SMTP id 5b1f17b1804b1-4a01affdf1emr76075315e9.13.1790859693626;
        Thu, 01 Oct 2026 06:01:33 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f99b113sm77732245e9.14.2026.10.01.06.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:01:33 -0700 (PDT)
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
Subject: [PATCH net-next v4 3/4] net: phy: serialise attach and detach with PHY driver bind and unbind
Date: Thu,  1 Oct 2026 16:01:19 +0300
Message-ID: <20261001130120.104628-4-f@lex.la>
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

phy_attach_direct() reads phydev->drv and d->driver with nothing held
against the driver core, then calls into the driver through
phy_init_hw() and phy_resume(). An unbind that runs during an attach
can remove the driver under it, and an attach that runs while a driver
is still probing can call config_init before the driver's probe has
finished.

Found on a Keenetic KN-1012 (MT7981) while testing how a port copes
with its PHY driver coming and going, on an OpenWrt 6.18 kernel.
Unbinding the wan PHY driver through sysfs while "ip link set wan up"
ran oopsed on the first attempt, with nothing added to widen the
window, inside the driver's own calibration code:

  Unable to handle kernel access to user memory outside uaccess
  routines at virtual address 0000000000000098
  Comm: ip
  Call trace:
   tx_amp_fill_result.isra.0+0x90/0x3a0 (P)
   mt798x_phy_calibration+0x164/0x520
   mt798x_phy_config_init+0x470/0x6f8
   phy_init_hw+0x64/0xa0
   phy_attach_direct+0x184/0x380
   phylink_fwnode_phy_connect+0x198/0x27c
   phylink_of_phy_connect+0x18/0x20
   mtk_open+0x38/0xb70
   __dev_open+0xf8/0x1e0

phy_remove() had cleared phydev->drv while config_init was running,
and the driver read phydev->drv->phy_id. No NULL test in phylib reaches
that dereference.

The device lock cannot be taken here: attach may run under rtnl, while
phy_probe() and phy_remove() take rtnl under the device lock, through
the SFP bus of a PHY with a cage and through the netdev LED trigger.
Add a per-PHY mutex and a flag saying that a driver has finished
probing and is not being removed. The driver-core callbacks take the
mutex only to flip the flag; attach and detach hold it while they call
into the driver. An attach that finds a driver bound but the flag clear
refuses with -EAGAIN.

phy_remove() clears the flag before any teardown, so the rest of it can
run without the mutex: an attach that loses the race is refused, and
one that wins holds the mutex until it is done with the driver. The
unbind then goes on to remove the driver from the PHY that attach just
attached; what the consumer does with it after that is not changed
here.

Fixes: 00db8189d984 ("This patch adds a PHY Abstraction Layer to the Linux Kernel, enabling ethernet drivers to remain as ignorant as is reasonable of the connected PHY's design and operation details.")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Changes in v4:
- A Return: section for __phy_probe().
- Rebased on net-next. The detach side of the lock is now in
  phy_detach_internal(), and the lock also covers the new
  notify_phy_attach() bus hook.
- The forward declaration of __phy_probe() stays. Dropping it means
  moving phy_attach_direct() (about 200 lines) below phy_probe(), or
  phy_probe() and the port and LED helpers it calls (over 500 lines)
  above it. The file already forward-declares genphy_driver for the
  same use in phy_attach_direct().
- The inline comment on bind_lock says what it protects instead of
  repeating its kernel-doc.

 drivers/net/phy/phy_device.c | 58 +++++++++++++++++++++++++++++++-----
 include/linux/phy.h          |  6 ++++
 2 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b5074599c988..544b2da6a1d9 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -711,6 +711,7 @@ struct phy_device *phy_device_create(struct mii_bus *bus, int addr, u32 phy_id,
 	dev->max_n_ports = 1;
 
 	mutex_init(&dev->lock);
+	mutex_init(&dev->bind_lock);
 	INIT_DELAYED_WORK(&dev->state_queue, phy_state_machine);
 
 	/* Request the appropriate module unconditionally; don't
@@ -1668,6 +1669,8 @@ static void phy_sfp_release(struct phy_device *phydev)
 	}
 }
 
+static int __phy_probe(struct device *dev);
+
 static bool phy_drv_supports_irq(const struct phy_driver *phydrv)
 {
 	return phydrv->config_intr && phydrv->handle_interrupt;
@@ -1702,7 +1705,10 @@ static void phy_detach_internal(struct phy_device *phydev, bool notify_bus)
 		sysfs_remove_file(&phydev->mdio.dev.kobj,
 				  &dev_attr_phy_standalone.attr);
 
-	phy_suspend(phydev);
+	mutex_lock(&phydev->bind_lock);
+	if (phydev->bound)
+		phy_suspend(phydev);
+	mutex_unlock(&phydev->bind_lock);
 
 	if (notify_bus && phydev->mdio.bus->notify_phy_detach)
 		phydev->mdio.bus->notify_phy_detach(phydev);
@@ -1780,11 +1786,15 @@ EXPORT_SYMBOL(phy_detach);
  *
  * Description: Called by drivers to attach to a particular PHY
  *     device. The phy_device is found, and properly hooked up
- *     to the phy_driver.  If no driver is attached, then a
+ *     to the phy_driver.  If no driver is bound, then a
  *     generic driver is used.  The phy_device is given a ptr to
  *     the attaching device, and given a callback for link status
  *     change.  The phy_device is returned to the attaching driver.
  *     This function takes a reference on the phy device.
+ *
+ * Return: 0 on success, -EAGAIN if a driver is being bound to or
+ * unbound from the PHY, -EBUSY if the PHY is already attached, or
+ * another negative error code.
  */
 int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 		      u32 flags, phy_interface_t interface)
@@ -1814,6 +1824,8 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 
 	get_device(d);
 
+	mutex_lock(&phydev->bind_lock);
+
 	/* Assume that if there is no driver, that it doesn't
 	 * exist, and we should use the genphy driver.
 	 */
@@ -1824,22 +1836,28 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 			d->driver = &genphy_driver.mdiodrv.driver;
 
 		phydev->is_genphy_driven = 1;
+	} else if (!phydev->bound) {
+		phydev_err(phydev, "driver is binding or unbinding\n");
+		err = -EAGAIN;
+		goto error_unlock;
 	}
 
 	if (!try_module_get(d->driver->owner)) {
 		phydev_err(phydev, "failed to get the device driver module\n");
 		err = -EIO;
-		goto error_put_device;
+		goto error_unlock;
 	}
 	phydev->drv_owner = d->driver->owner;
 
 	if (phydev->is_genphy_driven) {
-		err = d->driver->probe(d);
+		err = __phy_probe(d);
 		if (err >= 0)
 			err = device_bind_driver(d);
 
 		if (err)
 			goto error_module_put;
+
+		phydev->bound = true;
 	}
 
 	phydev->phy_link_change = phy_link_change;
@@ -1922,6 +1940,8 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 
 	phy_resume(phydev);
 
+	mutex_unlock(&phydev->bind_lock);
+
 	/**
 	 * If the external phy used by current mac interface is managed by
 	 * another mac interface, so we should create a device link between
@@ -1934,6 +1954,7 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 	return err;
 
 error:
+	mutex_unlock(&phydev->bind_lock);
 	/* phy_detach_internal() does all of the cleanup below */
 	phy_detach_internal(phydev, false);
 	return err;
@@ -1943,7 +1964,8 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 	phydev->drv_owner = NULL;
 	phydev->is_genphy_driven = 0;
 	d->driver = NULL;
-error_put_device:
+error_unlock:
+	mutex_unlock(&phydev->bind_lock);
 	put_device(d);
 	if (ndev_owner != bus->owner)
 		module_put(bus->owner);
@@ -3647,12 +3669,14 @@ struct fwnode_handle *fwnode_get_phy_node(const struct fwnode_handle *fwnode)
 EXPORT_SYMBOL_GPL(fwnode_get_phy_node);
 
 /**
- * phy_probe - probe and init a PHY device
+ * __phy_probe - probe and init a PHY device
  * @dev: device to probe and init
  *
  * Take care of setting up the phy_device structure, set the state to READY.
+ *
+ * Return: 0 on success or a negative error code.
  */
-static int phy_probe(struct device *dev)
+static int __phy_probe(struct device *dev)
 {
 	struct phy_device *phydev = to_phy_device(dev);
 	struct device_driver *drv = phydev->mdio.dev.driver;
@@ -3800,10 +3824,30 @@ static int phy_probe(struct device *dev)
 	return err;
 }
 
+static int phy_probe(struct device *dev)
+{
+	struct phy_device *phydev = to_phy_device(dev);
+	int err;
+
+	err = __phy_probe(dev);
+	if (err)
+		return err;
+
+	mutex_lock(&phydev->bind_lock);
+	phydev->bound = true;
+	mutex_unlock(&phydev->bind_lock);
+
+	return 0;
+}
+
 static int phy_remove(struct device *dev)
 {
 	struct phy_device *phydev = to_phy_device(dev);
 
+	mutex_lock(&phydev->bind_lock);
+	phydev->bound = false;
+	mutex_unlock(&phydev->bind_lock);
+
 	cancel_delayed_work_sync(&phydev->state_queue);
 
 	if (IS_ENABLED(CONFIG_PHYLIB_LEDS) && !phy_driver_is_genphy(phydev))
diff --git a/include/linux/phy.h b/include/linux/phy.h
index a5a419bc400e..3881a4651da0 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -671,6 +671,8 @@ struct phy_oatc14_sqi_capability {
  * @n_ports: Number of ports currently attached to the PHY
  * @max_n_ports: Max number of ports this PHY can expose
  * @lock:  Mutex for serialization access to PHY
+ * @bind_lock: Serialises attach and detach with driver bind and unbind
+ * @bound: A driver has finished probing and is not being removed
  * @state_queue: Work queue for state machine
  * @link_down_events: Number of times link was lost
  * @shared: Pointer to private data shared by phys in one package
@@ -802,6 +804,10 @@ struct phy_device {
 
 	struct mutex lock;
 
+	/* Protects bound */
+	struct mutex bind_lock;
+	bool bound;
+
 	/* This may be modified under the rtnl lock */
 	bool sfp_bus_attached;
 	struct sfp_bus *sfp_bus;
-- 
2.53.0

