Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1681950EC00
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904330; cv=none; b=Oew2Sa9n6l4AALGk2jTNZfO4nb8kKOpOjNXmAddWw/XCnK9Gu3+YT/9KVetXx/7+v1jy8/qQZQV4uz7tfyjVfRJftzrg7iShz6DzSGg8+Ev3peGL06VPocHmiR1mLsYvANJcJM0TKE/pslFVppwYGCtuDQsAdQI8VTx1bcwQf3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904330; c=relaxed/simple;
	bh=HQS59wOTTQmied92hS9hdk2IyhUJAviQM/zovQ04BcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sEBQSfuK+udzT/SUgKQneCL8YgIEb2Eaw+DqjvEB1uQgnkSiD/7Xkxm9bdqZHCgCgzFpHC+TrTmYjBfKxvRmFyucc7qYzkipCtN1g9stMetL3GhFr2ZZH2wWH13uKiXX4xPGicxUWYUUsDPhLomFaFXCQeo7hFROg9WqkeQQRRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=P79FcFOn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="P79FcFOn"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso35381185e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791904327; x=1792509127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkPw3TtgPXL2ChTDJzBuTEEa5gHOKEI9h8nu3hjCunQ=;
        b=P79FcFOnlBnL9JhUdCtOuYzfk0x0AHDl5iQx7aq2/a/GH6egjfWiBKJY3BGJluWqO1
         f3hayuU/RYrXyFoXu70TqoRtffakdAagb8681Q5VUv4TXn3vOIPRDpAq2R5inz8az4ju
         SjGMKLjs7MPmCHdaQei2AO3HEmVWneMnk1UjW9ePFE95i4+RoDAwnuLT/iXBpErmLNAK
         RqjmKK3hsRTVaLF3HguUG+iPLFl0OQwwjX1bmmgH+eVOsdsVrP7xsigKQgWY80k2ttTX
         FNGjj1zyXChoksJg2oPy8L9lZ6zjFtoNdl/1vjkFoRIRSURxTDruWy3HCxS5O8RLnlWk
         RGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904327; x=1792509127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IkPw3TtgPXL2ChTDJzBuTEEa5gHOKEI9h8nu3hjCunQ=;
        b=G8HDvCr5CRqNpCCTVbIVIXBo44QkiE3h8mJAZHvtpO/T9P8+LkrYhKrG3EVGiwFkl1
         AUz3SCDRv0YZ+mBpNlbo+/mtH/RCUId7A+d/VyvWVp+P3rteM/8chnN1erpt53TpIcgw
         PPMVZJaEKVYJ0pIvZu2fTKdMP4OSYHWCPM9djd7tYgynT29A8pV+ECgqlJQKBX8SWsfl
         jxyT1cunJp1+ns6H6k+yvcfboQKd7imm4Q7Dwkx3oge7FPzHUB3Ib7vaZ99+0Jqmfm6w
         u7CkR6qtxxiCxe4rcifJMi1W9/t3FmBPEXqm1cmN++rI0nbS2gFzBdwewLOvk/9OHB+f
         PFIA==
X-Forwarded-Encrypted: i=1; AKwUvBwO1R8vuSLuBvohAkB19705DYj15w7SWt1t41Pefw7WRpu6nms2px2IZ5LGZhIG/q7V+sWpYSEk31sDdXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDVEW+sgzng9VMFSoPrneJnlVsJgHp55ZP5ZZz+4B8bN8wcgFJ
	P9W4FQBBGqqaY/P1yNdDl0fTwXZmnYSZrT8qWD4/pGtMkiC04W9+gNeMxBJU/RaCxnU=
X-Gm-Gg: AYBFou14Xymj6siiD4G8KQGBvgLpEeQej8BVfpu23dDpTEqDpNQFWSzYJ18r5ye2V6j
	8WO+D7nKkrGY/l6wsGZwJh65X0Lr+WgFiai25MEPd+iCZ3Xu8YzNd97sPf/EHedel6J10g9E382
	MH4I9NHOVLVhbfdps0Mpui1oj6v/6FgwOqirJCz4QU5BSmRRNcd1eSeMwcT5A1zcR7l3EfGPWLF
	c98h+b307i3/XGea5Khc4SX5vH6wIhBzgPLqcFsEn46miX8dibfC/ZYBWM2cpK4/sRPowwkjjpP
	UZUqyR6S2PvYh79YtRSAtvUNop52JjswtHOExH8IWshqOeuURsWwUvY12Thd6MB+CaNCdhw+GE/
	dMedlT11wbRypvtKE5VA1s65xDa/7ePxzJ2dkqQR8wSy2G9E7GCbL8zAVe19kE0yZAUlVsgram4
	R3ZlrnsqYhyi230jHJDT3g9PoarIet30XYNBL/o4+Qhx6RSIWlFg==
X-Received: by 2002:a05:600c:820a:b0:4a0:98c:e082 with SMTP id 5b1f17b1804b1-4a18e4a3f0dmr244949875e9.13.1791904327145;
        Tue, 13 Oct 2026 08:12:07 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf31b83sm380812595e9.12.2026.10.13.08.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:12:06 -0700 (PDT)
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
Subject: [PATCH net-next v6 1/2] net: phy: refuse a second attach before touching the PHY
Date: Tue, 13 Oct 2026 18:11:59 +0300
Message-ID: <20261013151200.2473464-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013151200.2473464-1-f@lex.la>
References: <20261013151200.2473464-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phy_attach_direct() tests phydev->attached_dev only after it has taken
the driver module and, for a PHY with no driver, bound the generic one,
and then leaves through the error path that calls
phy_detach_internal(). That call works on the PHY's current attachment,
so a second attach of a PHY in use tears down the first consumer: it
clears that netdev's phydev pointer and the PHY's attached_dev, removes
the sysfs links and suspends the PHY, while the first consumer goes on
using it. A PHY on the generic driver never reaches the test: the
attach runs its probe again and, when the bind fails, clears d->driver
under the first consumer.

Found in review of a change that makes phy_detach() put only the
module the attach recorded: with it, this path leaves the first
consumer's reference pinned. On a Keenetic KN-1012, a test module
attaching a second netdev to the EN8811H that the lan4 DSA port holds
got -EBUSY and left lan4 with no PHY; with this change lan4 kept it.

Test whether the PHY is attached before the driver module is taken or
the generic driver bound, and refuse from there. A PHY attached without
a netdev, as DSA does for its CPU and link ports, has no attached_dev,
so test phy_link_change, which every attach sets and every detach
clears. A second attach of such a PHY used to succeed and share it;
with that change it would also leak a module reference.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
v6: dropped the Fixes tag.

 drivers/net/phy/phy_device.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index bfce8b893644..6bc9cdb7fa69 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1811,6 +1811,13 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 
 	get_device(d);
 
+	/* Set by every attach, with or without a netdev */
+	if (phydev->phy_link_change) {
+		phydev_err(phydev, "PHY already attached\n");
+		err = -EBUSY;
+		goto error_put_device;
+	}
+
 	/* Assume that if there is no driver, that it doesn't
 	 * exist, and we should use the genphy driver.
 	 */
@@ -1838,12 +1845,6 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 			goto error_module_put;
 	}
 
-	if (phydev->attached_dev) {
-		dev_err(&dev->dev, "PHY already attached\n");
-		err = -EBUSY;
-		goto error;
-	}
-
 	phydev->phy_link_change = phy_link_change;
 	if (dev) {
 		phydev->attached_dev = dev;
-- 
2.53.0

