Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB149440A36
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180065; cv=none; b=qWKccCKxDzto8rO+ER0fj0CVL9q9cmQsipwZ0oYjFRZ8G8kXUzlqHHKeWborF/FNbfq78jKqio7k/6aqbU1wx6bHE/Iga0LCakLIlnys6PNaVLIQXXE34F9565DFaEL/RD8401rwjzZE4Nj93Fv6WhuHzuouam1Dw60pFfghtfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180065; c=relaxed/simple;
	bh=L/b2jUvu3nyJItJXs++LiWX2UT3PipvpsFGnQT5Mh0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EnIH2gSxv0ids57PRwVF6q7yr8NZTRUtRd7aNwi880/YbZcmi+r5WmW1bCxd68sxc9GPXcldWaaxgkee2FlgGefVvciCXBGMy4vtLX2fYl0e6mEUq8rEZLi3rcCay4/nXuDoX1Fzv0/7qEluw1KF1beWoqepoJu0ZOsMAbK7QeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpx1pAkM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpx1pAkM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so7139185e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790180060; x=1790784860; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=efnlzqyH+VWj0/XwKt35H9M/38xQkQx7A0H59qH5Vko=;
        b=mpx1pAkMSfeXLb+utWNZZ/vUPD9/PtUOOxcVDkbaP9f+CavtEOIYQ/3AYdtI+aT2jD
         WDvPnNvd6czy6f0zFA9VnWVWnhLAVajz/FEBwyfKWRJooRHdyl28Udm+XX7Vo4vuC9oQ
         yW5cX/eKArz84WSBgq4EvrpcNGl5n4NM8fgyTngwN0eqDxFeykgWiyjRAAh/TPY9WcFb
         9mH3pTCkK63GwH4MyBrO5MkAMbXUJYYpYHEr4IJA+Xl8TfrVZNpNg5IEl42JQv3/dIhU
         uLEGUETMlXQd9D8ztCl77o+4qrJ449RnbyiZHOPA/hc7RZSgIcDoiiWUl5vloAje2ycJ
         iy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790180060; x=1790784860;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=efnlzqyH+VWj0/XwKt35H9M/38xQkQx7A0H59qH5Vko=;
        b=K951XtEP4rmNn8Jdcxunr7gU6Vd5AGYai71gID/xt6gt9oiIy4wKiRXk7bOVgxeIEO
         ENj5hB0GRHYGyq4+8hkkFi3Daud1mqvZrwFoiLtjtsQJ7Gp3yP7XK8Zgyu+Zc4kWaZ8y
         HGtAvQgIx/yAPVVyXYVpX3pRZZwGLpZ0Ej9tSusO/HPmlieZZcbPFRjp+ztjenRQYpOQ
         T5wcaFNlyvXHLo5wZc4qs8F4vfkRgZaLmcyepgVI+t1GHxcYStIA89WUuxRG5qK5EoQk
         ND7zFgDGGaqQYeigHrg6edYfBiQuON+WteOyxRpK7a8B64shDqaNzQeXlHoNXEXszrOX
         rp8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxek958P2Ezx/AoGJUvMvp8D6+bwqhWXjp7zVces8P/IIP5bTQ8DGlOSUQmM/eP+5GzIJaYNvl2dmdw7cQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nmzXckEWIVToxvnvfBoSozjtza0RAKgHXCLNGrdxSeoyZel6to
	jk8TDy+dzxWAdfjs2zb/r0Y08yjciD7GcsyCgKOjFFpXnPyilETvclvI
X-Gm-Gg: AYBFou1spurjc5bH2p5Z6WgOwOOjtDzk1ccOhBcBXLVdUeE9nq9qvLssMBUGEAF7ugy
	Gxr66Kj33AEP93l8qZpfpO7OI6jgUhBG5nCnetZ6AOUHnNBCN0d6JGvms/9heDlBPJd2hWf+H4w
	pQnE68a88CM98oB78Am02u0uO9SiwYVsM8/dw0UbwF+4OfHu+qA6HQ0s+sbSx+9YXYo2wsOJh3m
	jy2wkb40zvlc+sJI42tkBWM6da92pljxIXlBjJPUKq102TMJ+1bUG9Rz/ZRy+WpDXogX1A4vown
	kwrZq0Rxa2KdZDfZSIHAXleIcm+7pXYYEQ3BPKywOyCl/oZ6pjJ/7XJ1fiH/exPL8+QtRGT5d3k
	0OPZvCSey/NMlw4Ll10dAJDe7jHqEPYmG7RxgyXSXzRkmoOlXZlmYSDQKMX47YuYJIPlfkKfysg
	9cqeCrxe2qkiw0wtw/XF0gyhas4VSTA2g467Js1sSKrW8XxmxKKjkLexcKB5NUotHNlrsQjCIyN
	i7HzAXfGgR3uLwL6aHxyGP3irpdj+FLfiI9rfp1XjMs+Ox6A4iMFzH95Di1JtXrgVb6m02c2opP
	sh/bsWmG7IdK/bjddEcZCB9l7ZS8tbidvRUJorlb8GZBiw==
X-Received: by 2002:a05:600c:1c0d:b0:49e:8418:389d with SMTP id 5b1f17b1804b1-49fdeffee9cmr62804585e9.9.1790180060282;
        Wed, 23 Sep 2026 09:14:20 -0700 (PDT)
Received: from localhost (89-73-120-30.dynamic.play.pl. [89.73.120.30])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fde1acb91sm84831225e9.15.2026.09.23.09.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:14:19 -0700 (PDT)
From: Patryk Biel <pbiel7@gmail.com>
Date: Wed, 23 Sep 2026 18:14:12 +0200
Subject: [PATCH net-next v4] net: pcs: lynx: enable autonegotiation for
 10g-qxgmii and usxgmii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-b4-fix-pcs-lynx-an-v4-1-3f7927606d12@gmail.com>
X-B4-Tracking: v=1; b=H4sIANP6s2oC/33NTQqDMBAF4KtI1p1ifhqarnqP0kVMJhrQKImII
 t69wU2lSJePN++blSSMHhN5FCuJOPnk+5CDuBTENDrUCN7mTFjJZHlnJVQCnJ9hMAnaJcygA3B
 nqb2hEgYlycMhYj7Z0RcJOELAeSTv3DQ+jX1c9m8T3ft/8ESBgmRWSq4oaueedad9ezV9t3MTO
 xLilGCZUFVFLRolXVn9EvxLKMZOCZ4JazXXRqBQyhyJbds+cIn8bkQBAAA=
X-Change-ID: 20260820-b4-fix-pcs-lynx-an-3fd1d5e94ce6
To: Ioana Ciornei <ioana.ciornei@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Patryk Biel <pbiel7@gmail.com>
X-Mailer: b4 0.14.2

The Lynx PCS setup for 10g-qxgmii and usxgmii programs the
USXGMII replicator advertisement, but does not explicitly enable and
restart in-band autonegotiation or program the replicator link timers.

This leaves the PCS dependent on firmware or bootloader state. Systems
which do not get the USXGMII replicator preconfigured before Linux may
therefore fail to negotiate the link correctly.

After programming the USXGMII device ability, configure the replicator
BMCR with reset, autonegotiation enable and autonegotiation restart. Also
program the replicator link timer registers using the value returned by
phylink_get_link_timer_ns().

Co-developed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Patryk Biel <pbiel7@gmail.com>
---
Changes in v4:
- Fix commit message to reflect the code changes.
- Link to v3: https://lore.kernel.org/r/20260922-b4-fix-pcs-lynx-an-v3-1-dda3ac4e499c@gmail.com

Changes in v3:
- Add separate link timer macro for 10G-QXGMII (1/4 tick rate vs USXGMII).
- Select link timer macro based on interface mode.
- Link to v2: https://lore.kernel.org/r/20260824-b4-fix-pcs-lynx-an-v2-1-9bb1dec96f0b@gmail.com

Changes in v2:
- Reorder local variable declarations in lynx_pcs_config_usxgmii().
- Move USXGMII replicator link timer configuration before the autonegotiation restart.
- Use phylink_get_link_timer_ns() instead of hardcoded USXGMII 
  replicator link timer values, converting to 3.2 ns register step.
- Link to v1: https://lore.kernel.org/r/20260820-b4-fix-pcs-lynx-an-v1-1-62d66391eaff@gmail.com
---
 drivers/net/pcs/pcs-lynx.c | 53 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
index da4f99059eef7722a5c3bf32df490940cc1135f8..6d94f92a3332959bc4d39969a8ad781ac06951af 100644
--- a/drivers/net/pcs/pcs-lynx.c
+++ b/drivers/net/pcs/pcs-lynx.c
@@ -20,6 +20,12 @@
 #define IF_MODE_SPEED_MSK		GENMASK(3, 2)
 #define IF_MODE_HALF_DUPLEX		BIT(4)
 
+/* USXGMII replicator link timer step is 3.2 ns (312.5M XGMII columns per sec)
+ * for single port mode. For quad port mode, it is 1/4 of that.
+ */
+#define LINK_TIMER_VAL_USXGMII(ns)	((u32)((ns) * 10 / 32))
+#define LINK_TIMER_VAL_10G_QXGMII(ns)	((u32)((ns) * 10 / 128))
+
 struct lynx_pcs {
 	struct phylink_pcs pcs;
 	struct mdio_device *mdio;
@@ -158,6 +164,9 @@ static int lynx_pcs_config_usxgmii(struct mdio_device *pcs,
 {
 	struct mii_bus *bus = pcs->bus;
 	int addr = pcs->addr;
+	int link_timer_ns;
+	u32 link_timer;
+	int ret;
 
 	if (neg_mode != PHYLINK_PCS_NEG_INBAND_ENABLED) {
 		dev_err(&pcs->dev, "%s only supports in-band AN for now\n",
@@ -166,10 +175,46 @@ static int lynx_pcs_config_usxgmii(struct mdio_device *pcs,
 	}
 
 	/* Configure device ability for the USXGMII Replicator */
-	return mdiobus_c45_write(bus, addr, MDIO_MMD_VEND2, MII_ADVERTISE,
-				 MDIO_USXGMII_10G | MDIO_USXGMII_LINK |
-				 MDIO_USXGMII_FULL_DUPLEX |
-				 ADVERTISE_SGMII | ADVERTISE_LPACK);
+	ret = mdiobus_c45_write(bus, addr, MDIO_MMD_VEND2, MII_ADVERTISE,
+				MDIO_USXGMII_10G | MDIO_USXGMII_LINK |
+				MDIO_USXGMII_FULL_DUPLEX |
+				ADVERTISE_SGMII | ADVERTISE_LPACK);
+	if (ret < 0) {
+		dev_err(&pcs->dev, "could not set USXGMII replicator config\n");
+		return ret;
+	}
+
+	link_timer_ns = phylink_get_link_timer_ns(interface);
+	if (link_timer_ns > 0) {
+		if (interface == PHY_INTERFACE_MODE_10G_QXGMII)
+			link_timer = LINK_TIMER_VAL_10G_QXGMII(link_timer_ns);
+		else
+			link_timer = LINK_TIMER_VAL_USXGMII(link_timer_ns);
+
+		ret = mdiobus_c45_write(bus, addr, MDIO_MMD_VEND2,
+					LINK_TIMER_LO, link_timer & 0xffff);
+		if (ret < 0) {
+			dev_err(&pcs->dev, "could not set USXGMII Link Timer 1\n");
+			return ret;
+		}
+
+		ret = mdiobus_c45_write(bus, addr, MDIO_MMD_VEND2,
+					LINK_TIMER_HI, (link_timer >> 16) & 0x1f);
+		if (ret < 0) {
+			dev_err(&pcs->dev, "could not set USXGMII Link Timer 2\n");
+			return ret;
+		}
+	}
+
+	/* Configure autonegotiation */
+	ret = mdiobus_c45_write(bus, addr, MDIO_MMD_VEND2, MII_BMCR,
+				BMCR_RESET | BMCR_ANENABLE | BMCR_ANRESTART);
+	if (ret < 0) {
+		dev_err(&pcs->dev, "could not set USXGMII replicator control config\n");
+		return ret;
+	}
+
+	return ret;
 }
 
 static int lynx_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,

---
base-commit: 10cfa109c880092df32e396647b4afdca9be8350
change-id: 20260820-b4-fix-pcs-lynx-an-3fd1d5e94ce6

Best regards,
-- 
Patryk Biel <pbiel7@gmail.com>

