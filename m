Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36AD3AAF60
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336323; cv=none; b=Cbhxd39SgYTR8V12lUCc0P9W+AJqCseMWDaHOodoTZMELnIwb/i7TCWjP4ZS+b+djFoJ3rG6KehxkCFu1SA3yC7FlivirA7KGE8aN6eVGX08UZaJR2RRZ++fIR9NnVfuUgpqXgsp4MHn6DmaA8gumA49lOqBBqlZcsrzNtI5oo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336323; c=relaxed/simple;
	bh=DSw3fF8JCXJsrODnA5Sf7B/l1fiB4DL8P+nRczSYmBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJWGFzC79RfYjNUwaER52vGxT9AWkez5Cv+UGf6L+nlsKRmmvMwKYuSiN98HMEDm4koyfP8yKbhPiO76/UKXGamjXa7jYavxeK/6Cq8OhjbOpAcfeY7Xfq/LEjpfvB9HcaMVG9B+EwI5TRhUxCmFh9f1eD7pOyMx4ZO6NQg20o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=XahpOPH5; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="XahpOPH5"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a65e66555cso987448a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788336320; x=1788941120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZ3n+xsQFOMjsGDSR8smrMMtR28URII33oxO3DV0Sgs=;
        b=XahpOPH58dgUjxtM5Q+GvnBHRfTi4k/j89Z42Tbyb6mZm4bHmyY0J08adXp1NbjtTI
         RwFELbSuOHMMiupN0kGe4pjg+6J7Gb7KvumpU/5Bt18whlE+pdze4s1PON+CQn6WiBRn
         He1LMk3P9S1dUfSnyn0zChWY4sT82gUOhvrn1kQ4IDAT9ShWurvH63C26T/t3jLUC8dl
         jVjCL5XgXYxdMggcys5XgpLJdPP3szEhcI9zvUSzcPnCcZWDt8l3ujLnEnQEeAu6mLgc
         Oye7i6fj4tzspSNxMjB+zSIP2ZkKQHICF2d2HK52JoCB+dGLRLvgcvOCjOyPZrlzD4U5
         Bb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336320; x=1788941120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZ3n+xsQFOMjsGDSR8smrMMtR28URII33oxO3DV0Sgs=;
        b=ffpXhZS73ngLyJraAYNdVHQtGenh+8IJAOLqsbJNKZ6zqUDH1BwNjOXvWIzJgWptxw
         4W+9mgJ29ldU5BSOhdZ7EY287jsB1e04CLQEYL3YTRKle+yaoUf7twqf6OfjHq8TqMQ5
         hN3rQuyOiAlTvJmsdauI40bjdKc1FSRmQiAHbjilfCcad03uvn/SdjClwqMqiRSSjFDr
         khkutoXeuDTCCwInuYuaKdWvQnGFeWl4i/CUwV9TEtPicoD3eivtL4n4rmIHL20E/0WZ
         65dENXaw/qJwbhy6H+G3cPe08pFs6WQQAgE0NhymmQpUNSvMXvoAHNpdQZ8YIiHO+1RN
         j6oA==
X-Forwarded-Encrypted: i=1; AKwUvByZjdFGONk/hJ9cfySj/Xlz+AFsLhu15z+FVG9g6j3QoyEjmosrJqwYDMySvc3/4uFogFn3KTWUuCo04Gk=@vger.kernel.org
X-Gm-Message-State: AFuF++kNlfgQ02PQY9bJQ4ZApjcrAaGJ7U5rS1YoxSgX9+xjlWBb+YJI
	gEew7yxEs3QloQDorCLHUppVaI4n1vhA9q2/sfJlb1qTDLLW3H+pmLseDi6Z3QUUtqA=
X-Gm-Gg: AYBFou3A41+MfSsX3dyHkymqkT7KZgOl7FNTfwSDaT+pp5vBtpim3mfkiQ1i4C7epiQ
	syR1f68EhRIKt6ml6FssehfUR6t3VucKMA8vC/0nTXLzHII/gkesaBuJU0bGnQhRCfB5RXMH2ca
	hYPrFBwrj9uwFC5XvU/keXPQN9+rLwp03RIdQk7Ew4/cs4oR+xmQE+jFgDDk2/HU8wr9C6/jhvy
	SsvZLaB2NDyrrsmRwF0zelD4URVWp5shMZB0AGvG8tXmbn70fphvb7XLWc/pqdLqnOrNrmQ1U7s
	tP62vTJxLOaFDlYh3Nq4TzgJjGjTYkchJXUvjPz65sD14/bGajyoari8HQEisdNJYFOO6uY3X+V
	YXbA5MlftT6DeSbCXKswJo84jcYPGgJfS+k/XToUO16jTT4xsGRoeFg0uGOnGxrSnGdPHs6jKV8
	UZLIcz1dqkLvQaDbKbzOIx/FcSWjTB7nw3UIxk3btgEeLR3d9Zew==
X-Received: by 2002:a05:6402:4382:b0:6a5:d7e0:626f with SMTP id 4fb4d7f45d1cf-6a68257aec8mr2037574a12.6.1788336319421;
        Wed, 02 Sep 2026 01:05:19 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72df2sm5089494f8f.1.2026.09.02.01.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:05:19 -0700 (PDT)
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
Subject: [PATCH net v4 2/2] net: phy: restore the interrupt after a generic-driver bind cycle
Date: Wed,  2 Sep 2026 08:05:11 +0000
Message-ID: <20260902080511.2211261-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902080511.2211261-1-f@lex.la>
References: <20260902080511.2211261-1-f@lex.la>
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

v4: reword the phy_restore_genphy_irq() comment; no code change.

 drivers/net/phy/phy_device.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 94b2e85e00a3..20fc29355f60 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1734,6 +1734,17 @@ static bool phy_drv_supports_irq(const struct phy_driver *phydrv)
 	return phydrv->config_intr && phydrv->handle_interrupt;
 }
 
+/* Undo the PHY_POLL that phy_probe() sets when a driver without
+ * interrupt callbacks binds. The bind cycle never writes bus->irq[],
+ * so the table still holds the pre-bind value; anything else the PHY
+ * carries did not come from the bind and must stand.
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
@@ -1896,6 +1907,7 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 
 error_module_put:
 	module_put(d->driver->owner);
+	phy_restore_genphy_irq(phydev);
 	phydev->is_genphy_driven = 0;
 	d->driver = NULL;
 error_put_device:
@@ -1965,6 +1977,7 @@ void phy_detach(struct phy_device *phydev)
 	 * real driver could be loaded
 	 */
 	if (phydev->is_genphy_driven) {
+		phy_restore_genphy_irq(phydev);
 		device_release_driver(&phydev->mdio.dev);
 		phydev->is_genphy_driven = 0;
 	}
-- 
2.53.0

