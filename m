Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B493C8705
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788716811; cv=none; b=R0qHKE+3KllV37HcWye1eyV2fsvvV3XU8QyQoAwoqjJQLDdGj2L/lNpkYvymOoeY8lvgtuDPprdPjFiDCgRvCITozBgBo+Bx9oLsPyjdXTdZ1Q2a6eN7vTJ18ZMNHJqK38Bivdbn9ZTnJoiQs+gA0NMgTidAaOqp0GdwxnZ6Cvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788716811; c=relaxed/simple;
	bh=cm8GBzEWrQcM0UpW1qsqrZohbkUjZPrRWNZmMaMmxBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ruAwUNPJvBUmRlTgUyIEFiBTr/DJ2so5OWkyDInfVriL5OY5nesa4gf3ssO5015uweV83HNR3jbzrq6SOTAHt9Bcm4LSm09xxdb6MvtSox2ALj5hbOyaL4a0TQvCNjV4abSXd6IuZy4YPQJmCBdxymq82VC+ixQIfkCWKvV3xpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=XHP7Jccm; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="XHP7Jccm"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4843f205a5bso1524677f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788716808; x=1789321608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0UTb9fdviQp4wmFCU+HNLXDp/77aN0mz1PV9u2Ao38=;
        b=XHP7Jccmk/tpEWLfGFgeWNYl6c/ajWyhHzN8yhF8ipHiI3VteA+fEfy+eV0W1AuWA7
         PfmWvb/+nSt9vwcCVfHSa1DTxPL/bivdEdJRxs/nayAJP4p4UnwNfOEXiFATucqYzywL
         A1ZuShMba/vn72W6OpZOKxmHJFkE/I4X3YHMuACM93ef30D3oIBCn23XWwJsD6pVx3O1
         yEwyhgYHmwWAnBzFbFrPzz4jI65MrigHXQdptQZIO+B6xQf4anZkDIC6LjDwNNNYRC0O
         ZPUNSRLokprUcdXsnFz5QkpTtvXlOL8ve8/yBwy8rP6EotuIEQ/rKgjwSkd93lkItxWN
         aDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788716808; x=1789321608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z0UTb9fdviQp4wmFCU+HNLXDp/77aN0mz1PV9u2Ao38=;
        b=a4dRCWVzxwLI+wQCaGEFS1kPqBwRPDQBnu5fBKdDjGCejCN5A8jstta2JqDMnC7xT9
         0VaJku0LLxRCrKHkb9pBL3DzTjKSzdz4T77SJlnh046z7C/HpM734S7XVeFftyG6remS
         DNY3wcVc1vHB0b/zP/obtbfpRggXDTQXKWH0+ZpuArHaqHffiWGwX2X9G/C4cXHfZ1Xa
         ZXK4bEpIWlZefULWnOSdZkKXVQCxDOo9Fn4VvijLIZW+VSoZE1y1qnxt7u6pkXxkRTM/
         eEWY4dgz5XEAGBWalJUuMbEwRoscmdjPcdpTuJgwO+J69JIDq9wSUCGP41kyHYRhazqM
         gIXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwoQuQF1/9EUl+0i99x8AE4s/9hjQJ6epWdWi9zQHZb6kDXvM6OcAF9Hg2o5P97/HHuhPq0RMIXtF7kwI=@vger.kernel.org
X-Gm-Message-State: AFuF++meyDyxiQ5TzV3lc/U7SVqVsm5OxNxw86OMEfGmCMcXI6mH7sMD
	wMlDWH9l5CzHZwJgaVVVK2WlU31l8CLssyA2iyD5yiVlLSYLTygHKj42LsTgagrh7Ec=
X-Gm-Gg: AYBFou2pkEwqZ2eEHu+6kGCIRuf36+MGCiS6o4sJrHxooBd2zf4LQt5b7/RFw4sI0pC
	lseZHu3Cg1OoTnpgGgBGFEOJgmljWrey14MKHbuDoUXdGdEdn8GCDyYc+u8PTk5WBk98tuOvoUN
	Q6uS/yPHQMcLkic1g7uG1XACt29bpDVtQFGCDePVqpxZeuaa19VKVdEooWF4zgH7fsMJDJ3B8Td
	yK2HxvFLizkNeMPMXigWNMpFHBoQVqB8sXlwnpJrcg0O1FBepdSErfncUVfOEd/dlM/2dhY145B
	tGKanOV9bRsscBUWpnbcDSQXF6Iv0pjDOBAp0mAZP/Uxi7+IPgPqWPzhl2Ot4LSnx56mH/36Y/F
	O5OV5MDRl1+L0RvhkSMRwmv5XDHM5AH5dA9BzSICh9zAJX0Vmfpe0gX7QzxEmN9D1MIz187tjPA
	myemu4FLwmxzTLoW67iyR9+DpwgeIEm3pJGCBrNKA=
X-Received: by 2002:a05:600c:a44:b0:49c:dcec:bd27 with SMTP id 5b1f17b1804b1-49cf821e7a5mr173337895e9.8.1788716807805;
        Sun, 06 Sep 2026 10:46:47 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6158e9sm331552855e9.12.2026.09.06.10.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:46:47 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 2/2] net: phy: restore the interrupt phy_probe() replaced with PHY_POLL
Date: Sun,  6 Sep 2026 17:46:43 +0000
Message-ID: <20260906174643.4107607-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906174643.4107607-1-f@lex.la>
References: <20260906174643.4107607-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phy_probe() sets phydev->irq to PHY_POLL when the driver it is binding
has no interrupt callbacks, and nothing puts the number back. The
driver that binds afterwards therefore starts polled, and unless its
consumer installs the interrupt again the PHY stays that way for the
rest of the uptime, with no trace beyond an informational irq=POLL
beside that driver's name. A DSA switch that connects its user ports
before the rootfs holding the PHY driver module is mounted hits this on
every boot.

Save the number where it is taken away and put it back in phy_remove(),
in phy_probe()'s own error path, which the driver core does not follow
with a remove, and in phy_attach_direct()'s unwind of a generic bind
that failed after its probe succeeded. Only a probe that took a number
away arms the restore, and phy_link_change suppresses it when a
consumer holds the PHY, since that consumer skipped requesting an
interrupt on the value it saw. phy_detach() clears phy_link_change
before it releases the driver, so the case above still restores.

That last part arrived in commit e0d1c55501d3 ("net: phy: fix
phy_uses_state_machine()"). Without it the mark is never cleared once a
consumer has attached, so the restore this patch exists for never fires;
a backport needs that commit first.

Fixes: 00db8189d984 ("This patch adds a PHY Abstraction Layer to the Linux Kernel, enabling ethernet drivers to remain as ignorant as is reasonable of the connected PHY's design and operation details.")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/phy_device.c | 23 ++++++++++++++++++++++-
 include/linux/phy.h          |  3 +++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 94b2e85e00a3..ba117147721a 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -770,6 +770,7 @@ struct phy_device *phy_device_create(struct mii_bus *bus, int addr, u32 phy_id,
 	mdiodev->device_remove = phy_mdio_device_remove;
 	mdiodev->reset_state = -1;
 
+	dev->irq_saved = PHY_POLL;
 	dev->speed = SPEED_UNKNOWN;
 	dev->duplex = DUPLEX_UNKNOWN;
 	dev->pause = false;
@@ -1734,6 +1735,19 @@ static bool phy_drv_supports_irq(const struct phy_driver *phydrv)
 	return phydrv->config_intr && phydrv->handle_interrupt;
 }
 
+/* Give back what phy_probe() took, but not while phy_link_change marks a
+ * consumer: it skipped phy_request_interrupt() on the value it saw, so
+ * phy_disconnect() would free an interrupt nobody requested.
+ */
+static void phy_restore_probe_irq(struct phy_device *phydev)
+{
+	if (phydev->phy_link_change || phydev->irq_saved == PHY_POLL)
+		return;
+
+	phydev->irq = phydev->irq_saved;
+	phydev->irq_saved = PHY_POLL;
+}
+
 /**
  * phy_attach_direct - attach a network device to a given PHY device pointer
  * @dev: network device to attach
@@ -1896,6 +1910,7 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 
 error_module_put:
 	module_put(d->driver->owner);
+	phy_restore_probe_irq(phydev);
 	phydev->is_genphy_driven = 0;
 	d->driver = NULL;
 error_put_device:
@@ -3694,8 +3709,10 @@ static int phy_probe(struct device *dev)
 	/* Disable the interrupt if the PHY doesn't support it
 	 * but the interrupt is still a valid one
 	 */
-	if (!phy_drv_supports_irq(phydrv) && phy_interrupt_is_valid(phydev))
+	if (!phy_drv_supports_irq(phydrv) && phy_interrupt_is_valid(phydev)) {
+		phydev->irq_saved = phydev->irq;
 		phydev->irq = PHY_POLL;
+	}
 
 	if (phydrv->flags & PHY_IS_INTERNAL)
 		phydev->is_internal = true;
@@ -3820,6 +3837,8 @@ static int phy_probe(struct device *dev)
 	if (!phydev->is_on_sfp_module)
 		phy_led_triggers_unregister(phydev);
 
+	phy_restore_probe_irq(phydev);
+
 	/* Re-assert the reset signal on error */
 	phy_device_reset(phydev, 1);
 
@@ -3848,6 +3867,8 @@ static int phy_remove(struct device *dev)
 	if (phydev->drv && phydev->drv->remove)
 		phydev->drv->remove(phydev);
 
+	phy_restore_probe_irq(phydev);
+
 	/* Assert the reset signal */
 	phy_device_reset(phydev, 1);
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 5f8d65868e0f..d492417572a0 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -591,6 +591,8 @@ struct phy_oatc14_sqi_capability {
  *      - Bits [31:24] are reserved for defining generic
  *        PHY driver behavior.
  * @irq: IRQ number of the PHY's interrupt (-1 if none)
+ * @irq_saved: @irq as it was before phy_probe() replaced it with PHY_POLL,
+ *             or PHY_POLL when there is nothing to restore
  * @phylink: Pointer to phylink instance for this PHY
  * @sfp_bus_attached: Flag indicating whether the SFP bus has been attached
  * @sfp_bus: SFP bus attached to this PHY's fiber port
@@ -761,6 +763,7 @@ struct phy_device {
 	 * -1 means no interrupt
 	 */
 	int irq;
+	int irq_saved;
 
 	/* private data pointer */
 	/* For use by PHYs to maintain extra state */
-- 
2.53.0

