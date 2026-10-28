Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793172651;
	b=rF+za9hOUBi6VIHhruAtxgSDNiI2XMOQEhip0WM/6wpzjLX5yzltrSSc4XNqcgpG2963
	 wcBKdywofpJzC6ODwqWYqwWNEtNLpeKWwGARExklpn/sfFcTvE+JZkDbpyroC4DrT7Jjv
	 CA/+OrB7Uxh1HIkEQIU9viwX0hKVTUMoqky1ea2B4udbPsI0FSGrG+uypaOzXyiExJmG/
	 dyEoK98lZU7q9YbsXj/bfNI5TBv/7Ya1HWgc06c849iYYjmq/lpB1QUcOcYTdpnv5dGXF
	 Kc7eWzvApKpzRRV2LBaoH0t8y8f4kKERQ3ZYftc/CAv2IV/9bcnlFIWpCwxS1skmTzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OAGqs6jUlmv0p4hRztxaTJMgYX66siN4FoCA+yfUcJs=;
	b=TYSyfEVKN9lbGyOzFGikDnm75WvNjfEx1Go15i6pREe6o6ST8efcroBBukC4t9rXepAM
	 SI03eAWRVxYqIvY9t1bUAmdBDY0O1q7P/jcNfOpOC/vpT07tBPDTXomJ4nezd+lfCfLto
	 CkoZtPDbOTeYyfclpoSYp0KpgEimV0v/rAF5gDs5dwH0tre0KEfWdF0tHDXgBHm8FM7WE
	 xawjQq0mapVWR3pAZTNUJZGYPOXlC8LTLYYgwb91U5pdOpswYIJrb72ixfD/XyPWIX1sJ
	 nlRWyXJoxjXeQ50c08B6k2gAzc1/FVYMRsQKc4yrqVNGAvtjZeCbg+59ERkbZ4xJbTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cJ/5izAF";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D7B606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D7B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cJ/5izAF
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso350627f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793172649; x=1793777449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OAGqs6jUlmv0p4hRztxaTJMgYX66siN4FoCA+yfUcJs=;
        b=cJ/5izAF0PHl91urAMXo+UynlwE+xocDZpvUz+OvZz1d4+FePg+sIrjEH9PtOVcBqf
         jae7xQ2Zm2tYSGfhFLoc2JGWYJicQdFiPdFYhBSvjKzVzKCwycfJXp43nc1snnSFlD2n
         N5Ha2i3IMQcKAV+mjTbwNf4Z7qKlWSoBho9NNc7QSGMenJtUC+zcY0IoRhAS/W+A0zmc
         8hp3KGcI5w16NVTvkbnQLmDJZd6wqDDcBbrxbB2eoS2FplTAi/u0qiQhZeAuq51xaF7I
         X3T4hAaTMp6FAS7cQLnXEoR+D7Vz3Y0Fv2umMLwUrHr8imHWZHyZf8bYRs6YftowhhFv
         3XDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172649; x=1793777449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OAGqs6jUlmv0p4hRztxaTJMgYX66siN4FoCA+yfUcJs=;
        b=vPWF0gHr8YNxs3fOGqnORKo9C6x4j+xqUz71CJ3avSUUHyF/AiqocmnuTIroTtPyNH
         O6Bj2ZemVogonj1/D+pMQoXnZpluPmXCk1pKtWHUZGFOLXSROwuhxFZ2zGA1vdxJXNZ1
         D7dRt9I6hbl3y7DSpk+7HGDO0qWGUMWPM6xLMVdNovgYT7Q3drwRF3EZQzXrYs9tV9fx
         Z9WKNWf3rXANT6hq25EUhkAKqHZg8YjyVr1RvTcz0IUtFvg0zMeweiwUWLMzMtcOd6Vy
         yT6QfzRp1+fVwFn9W4s6Ssfj/xMJGiTt0TGcsGAuPGsjOL3b+wW+wN01TzSRfg2rjalZ
         nYkw==
X-Forwarded-Encrypted: i=1; AKwUvBx1y0DfE3ABQcd8MtJRfhXfrlQELnGr5VrxeECCj2VkhlYNLEtpda0+1JoV4ZZ/Zh4e48t4AeNuPfoCx7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTMxLol/UbibeTIVwbIF15DRd0lT+NsoIzdrOotTjRvDkTgjQa
	UR0m0zxVbxHQKvkgm7BSoUENbCwORJu1z15ViNj85mZR+6ZsSEN1tUwn
X-Gm-Gg: AYBFou1tVhW9QxBhNq+Rwe3Jyc/98l5LdeokrU02uofFvS9SCut915tL/LBvSzrYfYF
	NZ53blN8bvOQIzC9KspQlgYgqysguBxBRiJQUMttHUeaEVC+XE+eHPHSh+smQR/Diy0+jahHRA6
	OtPaGA/SG932YPaJ42EfX7XV0RqqwoUqgUB0UPDoX1wk08YLPG62hJKiLYtfP/oPo+gT/6Y6HsT
	0n9ry3LlGa+lo8gXkCFDV24S0vn1Xv191qCLcaitFY0Qv139nfg4DcNuRYzJjIcyTtrsWj+Z+LX
	87Ms0wUCfFTv12OWmWTuNn0b9WO8RY5btQ/aiPSplQNO957T5obljDKDsV40PCGSiM8wKnuk6LJ
	D8O8PehEkgc/TJZnztlNASeRE8fAbay3r1IKVkGycX3CF7UNtT4Niyh7oXI+e5stq+ADOrnsY5s
	iEsE2Mn2RRWm0QQ5cVkn+GVEcrX89El3p64B+1mckXhHp2wEt8/DH0Sw8FrhEtJ0zuZt2M3cNqr
	dT9wC1XWY0o/9f9xXVoq0uEGycvR1WrCOfpGc5l1DQcgsMbhQvzwo0z3BJhd8fzpZDsfMckLqIH
	AngR+/8O0kTqdkyNxGRSiOgdlPOBPQ7C3xbbNPwVxqlcvsqca4yu33KsI5lZP3kSIkWkfpWLcT/
	6LBwcoauKbnTcw/eBeYQnXcu/keR7iXKpiA==
X-Received: by 2002:a05:6000:2207:b0:48e:5df2:fd24 with SMTP id ffacd0b85a97d-48e5df2feb5mr3037152f8f.32.1793172649305;
        Wed, 28 Oct 2026 00:30:49 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm12083088f8f.13.2026.10.28.00.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:30:48 -0700 (PDT)
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
Subject: [PATCH net v3 2/4] net: phy: as21xxx: fix read_status speed handling
Date: Wed, 28 Oct 2026 08:30:20 +0100
Message-ID: <20261028073024.25175-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028073024.25175-1-ansuelsmth@gmail.com>
References: <20261028073024.25175-1-ansuelsmth@gmail.com>
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

Rework the read_status code to use the vendor register to read speed >1G.

While at it also address a problem in read link where autoneg_complete
wasn't cleared when AN was restarted.

Fixes: 830877d89edc ("net: phy: Add support for Aeonsemi AS21xxx PHYs")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/as21xxx.c | 100 ++++++++++++++++++++++----------------
 1 file changed, 58 insertions(+), 42 deletions(-)

diff --git a/drivers/net/phy/as21xxx.c b/drivers/net/phy/as21xxx.c
index 0db82da8dbdf..f5968eec11c8 100644
--- a/drivers/net/phy/as21xxx.c
+++ b/drivers/net/phy/as21xxx.c
@@ -650,6 +650,7 @@ static int as21xxx_read_link(struct phy_device *phydev, int *bmcr)
 	 */
 	if (*bmcr & BMCR_ANRESTART) {
 		phydev->link = 0;
+		phydev->autoneg_complete = 0;
 		return 0;
 	}
 
@@ -671,7 +672,7 @@ static int as21xxx_read_link(struct phy_device *phydev, int *bmcr)
 
 static int as21xxx_read_c22_lpa(struct phy_device *phydev)
 {
-	int lpagb;
+	int lpagb, lpa;
 
 	/* MII_STAT1000 are only filled in the mapped C22
 	 * in C45, use that to fill lpagb values and check.
@@ -698,13 +699,22 @@ static int as21xxx_read_c22_lpa(struct phy_device *phydev)
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
@@ -719,57 +729,63 @@ static int as21xxx_read_status(struct phy_device *phydev)
 	phydev->pause = 0;
 	phydev->asym_pause = 0;
 
+	if (!phydev->link)
+		return 0;
+
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
+	if (phydev->autoneg == AUTONEG_ENABLE && phydev->autoneg_complete) {
+		phy_resolve_aneg_linkmode(phydev);
+	} else if (phydev->autoneg == AUTONEG_DISABLE) {
+		ret = genphy_read_status_fixed(phydev);
+		if (ret < 0)
+			return ret;
+	}
 
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
-			phydev->duplex = DUPLEX_FULL;
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
-			phydev->duplex = DUPLEX_FULL;
-			break;
-		case VEND1_SPEED_10:
-			phydev->speed = SPEED_10;
-			phydev->duplex = DUPLEX_FULL;
-			break;
-		default:
-			return -EINVAL;
-		}
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
+	case VEND1_SPEED_100:
+	case VEND1_SPEED_10:
+		break;
+	default:
+		return -EINVAL;
 	}
 
 	return 0;
-- 
2.55.0

