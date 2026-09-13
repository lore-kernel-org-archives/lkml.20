Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B835078C9C
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789333078; cv=none; b=KWyA3fxXUUQF/q5I5WgSWSvXFQaBXZCFqPScUhZ5MEhRtBsskDacEAof+HW71Q2CW/ZEYpf6DDWjaO9ZbI/2D9WJlcShkbedcj8zOoxB/WVIuA6x4ZC111H7S12PjPunbtCZHB2Otn2JRMdYv6ajph5tpeMM2S0v/Vu42x5SSGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789333078; c=relaxed/simple;
	bh=mf93YlN/XE96GK0N1kC2CPR39oh9Xn4J9PXaEedZizc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A4kiHtq7/3YvAdoAHozHW0imhm9YVweTCB4+bLz50LXO5EMEW8qLQo74Otj34++BKgxfB909UDxX44tQgWSK+m5WQc93YX43BAg/FNFOLJOSRzpwgUsTvW8RgK/p48Q69lt+bkmdQFMUN7QfDGk4f392YqRsXdNR+cRfRig/KPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tM7k4Upa; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tM7k4Upa"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1317981a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789333075; x=1789937875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X0tnZg4ciozzZFeiLauyInjWDuzOBWpSsbusg1RKLpM=;
        b=tM7k4Upag3JFaY5On56kJeVae4fznMoE87ES7ava7A0cB+TH0lZye4tBY6F7ftCrXy
         KTJH74fBbObMOt3wKYkPqdiraAwJGM5M2I8BnXuAb2bDdPyvIO3bu+KbgsgjJsbXog1i
         lIABeqOlL8nRMEqOFp9tYSzfwt5CKaqIcUo7c03nRD8OcS+ntuU7tXhlCunjw0cUpqgC
         BdoYSLz2zfXdrROhJhj1NC4oW0q7gCOoKLmNZ4REbwxyzxwiy/myGSZAFuvw/E3yfRVV
         xLGoh21uc5pKFou3ip5CwTjuCijv3HcVpLnBkepodVt0GqzVwgbH/PSk5epKvLM06csI
         UhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789333075; x=1789937875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0tnZg4ciozzZFeiLauyInjWDuzOBWpSsbusg1RKLpM=;
        b=Bz+ymfDuR88PoOUWSlrDVBgTHkhxDfcA/GDNMdSKevKyd8kE4F26egWa9MXiqyE2+e
         /hKwau23Koar+AnpefDisjPZBK6CYwmrs+cyqZYi8TWRak1NjvWYux7rQHAzBlEMOlip
         NyMYysvdPhUErzZJUHRqt6/2BAEe6jz8988rAMtKiIH691vsh5MAw6rA1ZuKdQq/1bh9
         +yRCvY1FSg+1d3M9MxzX0h/K+0JGZuYJMvYuJQXZMz66f1ZlAZFFDvPsLM2CtSF5ZMzT
         gN800uFQMHbC41U5euNUFJqShmX8xFMEADhlS0+cBZsLJPetS2s5YDP6G1FfjuzwIvdu
         8kVg==
X-Forwarded-Encrypted: i=1; AKwUvBwdhXZJu/i3R37Wp483SPhTc9tCMcX+xKNn8xuTo3Ucfr3EyUG+eJOT+NJkh4gI2QLBVWAh44rQul+8lmQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kcrstXa66fMJO9lMjUGQWiOXdvDonQwioeS5DVAeps4kEHJHKB
	SnsAgBTHxIQqENEOmFKHakgCJXpBE89YUe9B7pexnvQSem7cU/3R+1L2
X-Gm-Gg: AYBFou1ETRvEvJahrS9tFgazIqxlf1B6XkL4qPBa1hnf4IgOKSeBRmOcdnVu7KCCx1d
	8AzwDhROTgBECDLVIHobRYdFVqUrE7OsBQbAkqVyp8WKCfvyxn7IX90HuMs/JGorqfRnjt6CJ6E
	IWq9QqIgP/L3zCQwJCp2oNs2dd0cpMRsU8AdqJ8i1cL2lkWvEwIJikHtBURLjQr5Sruk8FN2Xqh
	bZdq7/mcH6yw09pu3bpM1xAZvRm58Z8cvL60T25W74l6aW8jNxx/1pGSmr/7JzqcVFPInCWBVP9
	QYT03xC+9eWboNyJFoRZntVA9BztMaD4KjQd4Jh6QaQ3uubY7WcZXMYw43H3VGY21o5PIN23Cu3
	D8k5SUzhCf6cVKSiQ9V20HSrYJG2pxA19+dewc98jWrrhGYgJON++VYZz92lVHb6b13ewcNhn0f
	CQGrTUAyBFOLU8mWUTP18VVG0LbfBO14MA307C9xUmQdXDtyXmfcy//Ct1Th33zrzpd9o3k76DX
	TQ77qZaMtf9eXUcOdwXomQNL4OwDGxqrwcwxrhnMi5BkdNaNw52QcKPpL8No5FouP37Y5Y1K+bv
	I/l5/+dIL8pIiSA+9lOAsG/hUDW5ssxM54suy4tE9pma7oBnybma4a7PH4Q=
X-Received: by 2002:a17:90b:560e:b0:39b:34ef:3b2b with SMTP id 98e67ed59e1d1-39d9c0ba635mr26460010a91.14.1789333075056;
        Sun, 13 Sep 2026 13:57:55 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d951d6b08sm17281800a91.8.2026.09.13.13.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:57:53 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] net: phy: marvell: undo WoL setup when Wake-on-LAN is disabled
Date: Sun, 13 Sep 2026 13:57:51 -0700
Message-ID: <20260913205751.81163-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fully disabling Wake-on-LAN on the 88E1318S/88E1510 used to leave
the WoL interrupt enable bit (CSIER.WOL_EIE) set and LED[2]
configured as the INTn pin. A magic packet arriving after "wol d"
would still assert INTn, and a later "wol g" re-enabled WoL from a
dirty register state.

Undo the WoL interrupt setup once all WoL options are cleared:
clear CSIER.WOL_EIE and restore LED[2] to its prior use - the INTn
output on interrupt-driven PHYs, the plain LED function otherwise.
Never set the FORCE_INT bit while disposing of the pin: it holds
the interrupt line asserted and turns the shared PHY interrupt into
a "nobody cared" IRQ storm when the PHY interrupt is in use.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/phy/marvell.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index f71cffa88406..6f7c190880f2 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -2074,6 +2074,35 @@ static int m88e1318_set_wol(struct phy_device *phydev,
 			goto error;
 	}
 
+	if (!(wol->wolopts & (WAKE_MAGIC | WAKE_PHY))) {
+		/* Fully disabled: undo the WoL interrupt setup done above,
+		 * so a later re-enable starts from a clean state.
+		 */
+		err = marvell_write_page(phydev, MII_MARVELL_COPPER_PAGE);
+		if (err < 0)
+			goto error;
+
+		err = __phy_clear_bits(phydev, MII_88E1318S_PHY_CSIER,
+				       MII_88E1318S_PHY_CSIER_WOL_EIE);
+		if (err < 0)
+			goto error;
+
+		err = marvell_write_page(phydev, MII_MARVELL_LED_PAGE);
+		if (err < 0)
+			goto error;
+
+		err = __phy_modify(phydev, MII_88E1318S_PHY_LED_TCR,
+				   MII_88E1318S_PHY_LED_TCR_FORCE_INT |
+				   MII_88E1318S_PHY_LED_TCR_INTn_ENABLE |
+				   MII_88E1318S_PHY_LED_TCR_INT_ACTIVE_LOW,
+				   phy_interrupt_is_valid(phydev) ?
+					MII_88E1318S_PHY_LED_TCR_INTn_ENABLE |
+					MII_88E1318S_PHY_LED_TCR_INT_ACTIVE_LOW :
+					0);
+		if (err < 0)
+			goto error;
+	}
+
 error:
 	return phy_restore_page(phydev, oldpage, err);
 }
-- 
2.55.0

