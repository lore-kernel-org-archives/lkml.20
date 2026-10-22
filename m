Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708217;
	b=2sY6Z+vP6++YogBV+pPyXieLSQOQyRIrDelmzUQwa43fOkfaFiAE3gHTD996zG4KO0Sc
	 qXKrRC/rC1wQE1DZnMYDUTbahQdRk3NjQ+9yWbe3ea8riXs1D+5sTAayWGDQYcAta8Wo1
	 L41nOhfrsyZL65U00HKQvfMmxA7uyY/16+8tl5tW+h/LbPdCqnRaQuSE0ZPpto7J0ls7G
	 Ms2K7TIhZp7LwwPasDAOCnVayo9jcxvX0nGMEEJb9Yekyxv+HZFYiv21sYvEBqzLP8OMb
	 6V8pOlRNcLg6f19ym4OmFPltayPD3FYNQmDi4glp3u6aDFqkieFCtxV2RVwmz5U8XGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PqB/6E/5/WwmK748GvQIiLyjCpg5Y/KdOrCD+xl7ktQ=;
	b=D7r49FZ+5XcqHAt1KwctR8AmGagSJCNgPKh+lBVKMyxr6cmuhsazCgmWMu4TiZkUEPeo
	 tI2Qlju0XR0vL2eL1nJCtIKksF7jiee+IBpTn4iE6+81+BRqEwB0v2sc9E/yarotJ05Fe
	 9cQeHWfW1WOKMCa/qVB/oOXKtKDJAwbLGrClU/NrIJsSiRw8WXX8P+hwIoGEc7YBdrV8V
	 MNenvVRrHfxKeWvHzFVDNyIkDd+z0mqb/5RsOZ0u4DYgXDyZIwt8+22QnofFNf6G68ksl
	 GIXPvvLO2sriagM13UTxVExa23ncP+i45O5MfoaSzGJrJTl6qoy2hlY8DCWufIxGWEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZxfvVGpK;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7205E606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7205E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZxfvVGpK
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so3095405e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792708215; x=1793313015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PqB/6E/5/WwmK748GvQIiLyjCpg5Y/KdOrCD+xl7ktQ=;
        b=ZxfvVGpKm0bZAaxQV0k7eQuJ3ONllKHqRxv/O249uMAyg5DJHkOL8mtV5CFUjpVv6i
         tIpszVDQjL2Ikkf+hKFKn2oay3UItm3Ht9TXYH0XP485pQZ4Mp3TSg1YX7stOd06+IBM
         5ghzwq6920oa1gLn7NmxElu1NxsSEtIFlVQZcjWKyWed5KIehA7ei90cedIHnP0Vi5E4
         5zrUGEtwjakSol8TJti9QiaaiUzbNGfRxxLtgyEtdDP5D84wbfMTEzhtgIcgLcg2r/mn
         5UPJuC0WYbOYfcf5U+2SxA/f3HULY0v8n1/n501XCBbcZthA/EVCdF6/so+UVIHqYO+V
         pTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792708215; x=1793313015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PqB/6E/5/WwmK748GvQIiLyjCpg5Y/KdOrCD+xl7ktQ=;
        b=hmyEFttJ+1Y6Svl01AKQEavxN9+K23V9h7GTekgQXFc96eBnD8M78k5dCnRv+H33FF
         49hVSMrqi6dUkP/x2uL4PfjL098o97BfXDd4QfL2b3jq5ZzfqMViXTbZgimbbZVZVb/Y
         0J3y1lEIaZa3eARs51jD9QGsbz4QrxFadG6XoEexOcoqV14DtiEzAB83Q/1T4H8371Yq
         svLyXqaYmv7RurdUTiRF+th95f2S/reePXKXoIo/cANcTgj6Fx1GESywrLAyb8sITb1J
         8aCjA7bdK3G09Kh/Y9ahRJf+wQS58uIHqGMaiY/q38IKGZQxozCryFvL8s8fcY1IXFDT
         2HEQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1GScSW6yIj3y61+PPhHRvKILTfH4XsUHK38Rf82w7xJHCI1khAEF7GyqpxTRUGWfs46ECC2A5ekWROmc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnDlCRAT78mANm3dZFcGwTsctYbTdtpE+T8ZPlURj/Lq+GaX3n
	qlSi+SUgoMxVMMmnMaCTaYouL02CK9CDRBI6pPGJhburKVODcooFuTy1
X-Gm-Gg: AYBFou3hLFQJu6roCke7yTaU7NqTRP4iV27pI34A9sQyrfZIACwqoLeoKDbKFXJ6AqZ
	2vljl1xRgCZZWdR+3K4V7KbBbENvTXbg5O+se+xpKJ5+mNzMAPcsoGHEySx7uL93rYcrEi22vpv
	9O4Sd7chqwrZKLU6K0mdoV+Oy+M6rkCizi/9R5vNleQjwUKXleHca5e7IzQ4CMK2OngH+aosxd7
	dY809QcW9WMXrcgcHnxZxrRk8AcvUWEeozcdqIWTmEwKbm7s70kgJaSGvWnDHtZbzGkFJ4DpCy9
	wMySb5gBRD7vxRiwgm18qXRbOuRZSM9U6bTZZ8GvDSCwxJwV8/emP+Mn1Ymekh5auCXllnEnFkT
	TBAsO95Ekpl13DgUuhKOcGlxebVCYqERNFwdWYDZcf/39ohH7PTxyg/dUCk2Gfit2hy3dAAxtzc
	AClESEh2JSgJGPnVa0Vzki+omRAp58hbd1GE3BWVGUgnaGADfyvPyd0DwAyZ96tOShjr8p1tmEy
	C0z0ZgI8t0zz/6HuaLwXAsVjvkcdSpXpd1S/NKhNwljVumKpU7d9pNyIVXISVnu9SBUabs4KEtl
	BD08rwwTaccyhUDcnVx6vZQzn2uBM/lku5bjmTj75AXe20FbOK8TjWkEjHBW
X-Received: by 2002:a05:600c:4fd4:b0:4a2:1cc:6551 with SMTP id 5b1f17b1804b1-4a211f3a5f5mr4752595e9.35.1792708214561;
        Thu, 22 Oct 2026 15:30:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a211be8f79sm11958795e9.14.2026.10.22.15.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:30:10 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/4] net: phy: as21xxx: fix read_status speed handling
Date: Fri, 23 Oct 2026 00:29:52 +0200
Message-ID: <20261022222955.698722-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022222955.698722-1-ansuelsmth@gmail.com>
References: <20261022222955.698722-1-ansuelsmth@gmail.com>
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

With further test with 2.5G NIC it was discovered that
phy_resolve_aneg_linkmode is not enough to detect speed higher that 1G
when autoneg is enabled.

Also in the switch case there is a typo where the speed mask is AND with
VEND1_SPEED_STATUS instead of the correct mask VEND1_SPEED_MASK.

Rework the read_status code to always read the speed from the vendor
register and parse the generic bit only for the pause frame.

Fixes: 830877d89edc ("net: phy: Add support for Aeonsemi AS21xxx PHYs")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Handle half duplex on 10 and 100mbps
- Handle >1G advertise

 drivers/net/phy/as21xxx.c | 104 +++++++++++++++++++++++---------------
 1 file changed, 64 insertions(+), 40 deletions(-)

diff --git a/drivers/net/phy/as21xxx.c b/drivers/net/phy/as21xxx.c
index 0db82da8dbdf..519b78d3579d 100644
--- a/drivers/net/phy/as21xxx.c
+++ b/drivers/net/phy/as21xxx.c
@@ -671,7 +671,7 @@ static int as21xxx_read_link(struct phy_device *phydev, int *bmcr)
 
 static int as21xxx_read_c22_lpa(struct phy_device *phydev)
 {
-	int lpagb;
+	int lpagb, lpa;
 
 	/* MII_STAT1000 are only filled in the mapped C22
 	 * in C45, use that to fill lpagb values and check.
@@ -698,13 +698,22 @@ static int as21xxx_read_c22_lpa(struct phy_device *phydev)
 	mii_stat1000_mod_linkmode_lpa_t(phydev->lp_advertising,
 					lpagb);
 
+	lpa = phy_read_mmd(phydev, MDIO_MMD_AN,
+			   AS21XXX_MDIO_AN_C22 + MII_LPA);
+	if (lpa < 0)
+		return lpa;
+
+	mii_lpa_mod_linkmode_lpa_t(phydev->lp_advertising, lpa);
+
 	return 0;
 }
 
 static int as21xxx_read_status(struct phy_device *phydev)
 {
 	int bmcr, old_link = phydev->link;
+	int speed;
 	int ret;
+	int val;
 
 	ret = as21xxx_read_link(phydev, &bmcr);
 	if (ret)
@@ -720,58 +729,73 @@ static int as21xxx_read_status(struct phy_device *phydev)
 	phydev->asym_pause = 0;
 
 	if (phydev->autoneg == AUTONEG_ENABLE) {
-		ret = genphy_c45_read_lpa(phydev);
-		if (ret)
-			return ret;
+		if (!phydev->autoneg_complete) {
+			mii_stat1000_mod_linkmode_lpa_t(phydev->lp_advertising,
+							0);
+			mii_lpa_mod_linkmode_lpa_t(phydev->lp_advertising, 0);
+			mii_10gbt_stat_mod_linkmode_lpa_t(phydev->lp_advertising, 0);
+			return 0;
+		}
 
 		ret = as21xxx_read_c22_lpa(phydev);
 		if (ret)
 			return ret;
 
-		phy_resolve_aneg_linkmode(phydev);
-	} else {
-		int speed;
+		val = phy_read_mmd(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_STAT);
+		if (val < 0)
+			return val;
 
+		mii_10gbt_stat_mod_linkmode_lpa_t(phydev->lp_advertising, val);
+	} else {
 		linkmode_zero(phydev->lp_advertising);
+	}
 
-		speed = phy_read_mmd(phydev, MDIO_MMD_VEND1,
-				     VEND1_SPEED_STATUS);
-		if (speed < 0)
-			return speed;
-
-		switch (speed & VEND1_SPEED_STATUS) {
-		case VEND1_SPEED_10000:
-			phydev->speed = SPEED_10000;
-			phydev->duplex = DUPLEX_FULL;
-			break;
-		case VEND1_SPEED_5000:
-			phydev->speed = SPEED_5000;
-			phydev->duplex = DUPLEX_FULL;
-			break;
-		case VEND1_SPEED_2500:
-			phydev->speed = SPEED_2500;
+	speed = phy_read_mmd(phydev, MDIO_MMD_VEND1,
+			     VEND1_SPEED_STATUS);
+	if (speed < 0)
+		return speed;
+
+	switch (speed & VEND1_SPEED_MASK) {
+	case VEND1_SPEED_10000:
+		phydev->speed = SPEED_10000;
+		phydev->duplex = DUPLEX_FULL;
+		break;
+	case VEND1_SPEED_5000:
+		phydev->speed = SPEED_5000;
+		phydev->duplex = DUPLEX_FULL;
+		break;
+	case VEND1_SPEED_2500:
+		phydev->speed = SPEED_2500;
+		phydev->duplex = DUPLEX_FULL;
+		break;
+	case VEND1_SPEED_1000:
+		phydev->speed = SPEED_1000;
+		if (bmcr & BMCR_FULLDPLX)
 			phydev->duplex = DUPLEX_FULL;
-			break;
-		case VEND1_SPEED_1000:
-			phydev->speed = SPEED_1000;
-			if (bmcr & BMCR_FULLDPLX)
-				phydev->duplex = DUPLEX_FULL;
-			else
-				phydev->duplex = DUPLEX_HALF;
-			break;
-		case VEND1_SPEED_100:
-			phydev->speed = SPEED_100;
+		else
+			phydev->duplex = DUPLEX_HALF;
+		break;
+	case VEND1_SPEED_100:
+		phydev->speed = SPEED_100;
+		if (bmcr & BMCR_FULLDPLX)
 			phydev->duplex = DUPLEX_FULL;
-			break;
-		case VEND1_SPEED_10:
-			phydev->speed = SPEED_10;
+		else
+			phydev->duplex = DUPLEX_HALF;
+		break;
+	case VEND1_SPEED_10:
+		phydev->speed = SPEED_10;
+		if (bmcr & BMCR_FULLDPLX)
 			phydev->duplex = DUPLEX_FULL;
-			break;
-		default:
-			return -EINVAL;
-		}
+		else
+			phydev->duplex = DUPLEX_HALF;
+		break;
+	default:
+		return -EINVAL;
 	}
 
+	if (phydev->autoneg == AUTONEG_ENABLE)
+		phy_resolve_aneg_pause(phydev);
+
 	return 0;
 }
 
-- 
2.55.0

