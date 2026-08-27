Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7645524E4C6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787865409; cv=none; b=bNWhlEuEbRFaDf3MCzaGn07XZ9atN8rwYUof8A0volwv15OPFYzQC16VGCWuiM2BbCLYmyI4qtIjv/zZvsDrMSMNAzphKTzmzouN0duSCb7O/4enJj7oexw2pf1yVnpAEyjv1Q5r4P38hOxZS/ODeXv4m/GFhubrcBeBCdV5NBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787865409; c=relaxed/simple;
	bh=OStuMbIJRGR13QguPPMS5Cujr1HI19Kyd2Ubu5FBRLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=at2d6zF7WCfeloDzJSr7YNtz5/UTWA6seDy8lqxshcVggLe6A1bcuT068pAfWJfWWJp7WCowpDviFl5BKlnpXCIUepnhgkiIB6fanJksZIc90y88aj8yps16VrYJS/Yw9LMAzSxkHg/NIT7f2Rw+zpR7rHFvQkk0jSRFtC5Y/Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=d/ervt//; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="d/ervt//"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so69887f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787865405; x=1788470205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+A4DiEskWi8Pmb6CKBEIUqGXSf7tGcrNLyl+aIITkDY=;
        b=d/ervt//lXz+rtvbC5jX3kBLuQKmScpYnNLa+6IyU4W5wON4rqxVqKdy69Uh1K4FGE
         uERL04wsggr4P8zYwy4SFNfrdJmOyaKkTuvb5w2NQgJ3gqpcGZkuSd31HjYyl50WODZx
         P2+4rCNog60zOtlYSXHhsbPE6eq8gBm50H9teafKWGCPN2z7tIrduLdv9y1+TrnhLPAv
         lKu3gZ++NVoh6cJgd/AJgaE+utl/td9ixZOE77hHh6iDQiBTvHxkLanKxGcgpCPVwC8e
         Ixm9E8kzV0gqgQCmYATu2SrWpCKyDyWsOlrM+aRboGwTeto3+xGqhvzYdSK6+1gvRS7C
         gdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787865405; x=1788470205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+A4DiEskWi8Pmb6CKBEIUqGXSf7tGcrNLyl+aIITkDY=;
        b=MibSzk2MnhdBy1Lcz3//g6q+d4q0AOcnwJYGNSnWFcIxkB9dfVk4+dkZmzbuqxt1Cb
         ycz11Bmo4XvT++kFMYr++QhYO6Mev+J85qq8b88ztil882RqTtg7JM4I07Q5jXpn/App
         VCOsD8Hja3L9MY1IIlPDm+OgnXCzekH9wsnZ0MI09CPp6nIhUYfgW8Jz1g3bjU2/rBEM
         2kN0xYEj/Tfb7801fCq2geu5jYPGuvBgQXqCd0eRjuu1iCtqiOpcW/+jZ5GJBW6zEy4+
         4bCN6aMLP7sQ3WwSkTz9vHHPn4NaKfcfL6tbuHuPu5j8dBU/AlbEah2ncC8PxP6KKtsk
         AJ+A==
X-Forwarded-Encrypted: i=1; AHgh+RqdQXOea0MtrtbqRJ0HeWR4Ca0h+LyIGvmenrHCQ3d/Y50wUXhl8ypFLhXGCXupOJvq0lb1Az+3IbgGYYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m2dVTx1Bkztj5VTcskSmHcrLpONaNASOItOD7XF/NCVgy5X39X
	4aGURBjQBHJ/sj4McRG5sXAxx6gGKiMcE5MAqDcBDpudtrN/JoosbaVTLCYaj7SZ+ls=
X-Gm-Gg: AR+sD13jg4IFl3Pa9H0IaQy12RmG4RXKRioU9Y6tSYcEPL1UpvyYV9y670vDX9hoVnv
	FBK7ozmCmNISGIIiJaRvHwp4sn0NDi+vqU02dIVLh8Dd0UEK4oekQqDY8iLsbTpWeAwAQzcinCi
	+TGZV8oLKh1NDxj6/pbdMrmtejVzzbWDRmWMjp6Uu7uZL+1yEiPDC9evow75IJjNKdnQvONhpCp
	WTTYcFq3BZ0meWOb56owB7+LWlsUcYYNhRynWSQ6iW4ipf/mMYE9XwZIJOU9wItzrlp9g7sLe9l
	1+fyOzzLptutTRNyVAHkvAmcfFo9P+eTNysQPPSF8UPxuXdqK5wttMDxTCCYMWLKB4U5Ag+UK5U
	1bi81j1KxyFJUzwZ4XJ7vrJx43oPpU81adMhB3nHUt4WROQfjN908lI4IxvqL18P636rJY8x4Nb
	8ICVxwSuolRHGF5wSy7wgJ99dl+lx858l3VyiNLm7ObWAx/KUMXDvX0Ok=
X-Received: by 2002:a05:6000:2388:b0:47f:9283:1fb3 with SMTP id ffacd0b85a97d-482f7828315mr2228378f8f.0.1787865404806;
        Thu, 27 Aug 2026 14:16:44 -0700 (PDT)
Received: from ownbook ([31.146.92.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e4f0c8f7sm11423442f8f.27.2026.08.27.14.16.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Aug 2026 14:16:44 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Aleksei Sviridkin <f@lex.la>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 2/2] net: phy: restore the interrupt after a generic-driver bind cycle
Date: Fri, 28 Aug 2026 00:16:38 +0300
Message-ID: <20260827211638.63395-3-f@lex.la>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827211638.63395-1-f@lex.la>
References: <20260827211638.63395-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PHY with no specific driver available at attach time gets the generic
one, and phy_probe() sets phydev->irq to PHY_POLL because that driver
has no interrupt callbacks. Neither end of that bind cycle puts the
value back: phy_detach() releases the generic driver so a real one can
bind later, and a generic probe that fails never reaches phy_detach()
at all.

The specific driver that binds afterwards therefore starts with
irq == PHY_POLL, and the PHY is polled for the rest of the uptime with
no warning on that path. A DSA switch that connects its user ports
before the rootfs holding the PHY driver module is mounted hits this on
every boot.

mdiobus_alloc() fills bus->irq[] with PHY_POLL for every address, and
the bind cycle never writes to that table, so the entry still holds
whatever the bus registered there. Restore phydev->irq from it on both
exits, and only where the cycle left PHY_POLL. That guard preserves an
interrupt mode a MAC installed on the attached PHY after connect, and
it keeps a restored interrupt number out of the
phy_connect_direct()/phy_disconnect() asymmetry, where such a MAC would
have the interrupt requested and never freed.

Fixes: 00db8189d984 ("This patch adds a PHY Abstraction Layer to the Linux Kernel, enabling ethernet drivers to remain as ignorant as is reasonable of the connected PHY's design and operation details.")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Both exits matter: phy_detach() for a generic driver that bound and is
being released, and phy_attach_direct()'s error_module_put label for a
generic probe that failed, which never calls phy_detach().

Which buses and MAC drivers the bus interrupt table covers, which other
paths to PHY_POLL the guard also restores and why none of them is
harmed, and the sysfs unbind case this does not cover, are worked
through under v2:
https://lore.kernel.org/netdev/20260824024029.41310-3-f@lex.la/
 drivers/net/phy/phy_device.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 94b2e85e00a3..be4c35db8de9 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1734,6 +1734,18 @@ static bool phy_drv_supports_irq(const struct phy_driver *phydrv)
 	return phydrv->config_intr && phydrv->handle_interrupt;
 }
 
+/* Give back the interrupt phy_probe() parked when a driver with no interrupt
+ * callbacks bound. mdiobus_alloc() defaults bus->irq[] to PHY_POLL and the
+ * bind cycle does not touch the table, so whatever the bus recorded there
+ * still stands. Only the parking is undone: any other value the PHY carries
+ * was put there by someone else.
+ */
+static void phy_restore_genphy_irq(struct phy_device *phydev)
+{
+	if (phydev->irq == PHY_POLL)
+		phydev->irq = phydev->mdio.bus->irq[phydev->mdio.addr];
+}
+
 /**
  * phy_attach_direct - attach a network device to a given PHY device pointer
  * @dev: network device to attach
@@ -1896,6 +1908,7 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 
 error_module_put:
 	module_put(d->driver->owner);
+	phy_restore_genphy_irq(phydev);
 	phydev->is_genphy_driven = 0;
 	d->driver = NULL;
 error_put_device:
@@ -1965,6 +1978,7 @@ void phy_detach(struct phy_device *phydev)
 	 * real driver could be loaded
 	 */
 	if (phydev->is_genphy_driven) {
+		phy_restore_genphy_irq(phydev);
 		device_release_driver(&phydev->mdio.dev);
 		phydev->is_genphy_driven = 0;
 	}
-- 
2.55.0

