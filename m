Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708212;
	b=iyqwitC6M9fu88n+u6U0woOA7/M86x7ZvDLYrA2LQ4X6gh/JZbMMAyGL/nUT0Ex/Q95u
	 TYWuKoG0lOsyrZHiuOyl/eNza+jnnBi5YQWPmVJwMKkaueAGzksC/KUwPW523cETvwEhJ
	 bNLvA6GVdZ6hMfbdTTc5tL4i9CTjYD873EavadjJEy6j7Iol27keoXoe5nqPMQlqgCpNZ
	 N5udNhOYY50OM5DUjwWgtuUfrlfmspWh9FOJxH55claMdz6bLADz9zwJ+Q/3VyjuPeDcl
	 eTCXX1238Abm4k+cAJ8II9TZV0oGbJBtO8Gzx3ctcxEC8T896hSu+yrPANY3shpG4cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pJNO182l6e+8BfE6OvTk4EQHBvr1+MR3R8s/7W0jVHc=;
	b=xeAjSzptlsq0v5fst4kdmQSl0WzGWbv3KMyihrgqQJ8DsZlybdrPMIq9XyKtxk6yjJec
	 ZCUIUEVDDPH6hZWj8jbdRL5zBgx0+jkHDedNh4M2QURqqQ8LGDc4IViamoHIQfdsXfEgM
	 1jgB07Ug3Ppan6u4oXuKwdl3alpqlS31wTyk2/qeZ6vnn/pY61gO+9rGVdGTcXFNgLxRi
	 IaUvo1G8CditH0AfeFY3hGEZdsxkuJTTBD/wmQy1uKQKLcyXqHksJ36uxv4H8DTBRGH2n
	 fT+sPRJpb4xrtjGfI3r7B3Onsr6slOlWcb+RPlET/1cY4DTJCh+27ohfNabFW2YeXPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XH24dlhs;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14A0606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A14A0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XH24dlhs
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so1676875e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792708210; x=1793313010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJNO182l6e+8BfE6OvTk4EQHBvr1+MR3R8s/7W0jVHc=;
        b=XH24dlhsl0rGpsdUho5fD+KZ9Y2ksuLmods8dMH9niSGUi9bPiH0J2UPXGfHg2gLa1
         cWApmr10wl6W9xiWLUoJrn6nCJsJ4dEn9Mm47LjAv0W4wTiAyfJBdmTUnO9cAzkrk4om
         v6BSwtvEJNmdyTBJUsZuFIwUsldeARfg9cA42gYhGXz7rNCByTtNgG8ISn/ljLOlGleQ
         s0W7bMgFI0TUdVJc58bV6mK0fAdJ+neZSSuFV20r2vjbLudWgt5R8n5C3FpDVGHGS6oZ
         17UQ+Kzv3HUa2X8T5Hfca8NjE8zhRk2rGa4/vDJ6kTo9a5YGzXdonKMKq1HrdvI425zw
         +JXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792708210; x=1793313010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJNO182l6e+8BfE6OvTk4EQHBvr1+MR3R8s/7W0jVHc=;
        b=pE48HSqzqycGwnnkRwpHMAHesX8eHEzeJvEb0EM/Dr11MiOmoN+Z7zjMimapi1qOKX
         t0lBre25GrDKeqtBjsalYpZG76+UN8rvTpug68XP3wRQkKa/AToo6hVkVQRs+oeJyZbd
         eAPGy4x5+uEwiBbmZctOxBkUbWmS4ICH0ffZaoOruCjtC9Y62GMRqiOJuaib630Y7sy7
         +WxPgdinwcjfAxHTQwaF2Gjl+tiN1uZV7MKgIbbu566DqimF68kqn776T2zc8RjjV7cN
         fFQmVhI/ZFxpxc2LQ6FRxwsmDnoUOzdCrU5HCbso7teRkLPikfh8bKP43bRT07iYMLs+
         UOjg==
X-Forwarded-Encrypted: i=1; AKwUvBx7kEc39KXyUKDmZZorxgMRf28OqaGYiSUYYqrpVcq2Mv95jca6ea6Lqfs9Fvln1XUyI5EOcLpci4Eh1nU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP+NKCPaiMKhO7TrMHgDPMl1ObQ/Ls7lULDsxKqoXi23R3hW52
	vok9eQ+qtgMIpMgFX+4VfL996jN3rstnbi2uQGnyve0v4uREXh72+MRP
X-Gm-Gg: AYBFou1h2KERv8e/u/h2alzvYR4PbXAS4x1HBykZ4QP4jIH1B8X8f4R3Ht3UAHX/SxS
	pE/Xz1UceaXbmDk7M+2hTZ/I2raamFIgLsX6LTcNarFA0yPYT+CUlVskymrGeBqhl400Bhym7JD
	Esaid5xnSxzb5FOU5Vbnevc5ryE4/fOwdhCQov438m67v39XJDiOETA7Kxr1wfxr6dN6xNDPa90
	9ANFm2v6H4hiXM/1JBH3AhDhUgegbIi0SCE62BRBI4TvJwHPRX5B3sg0mwIwjlugFsm+CJ2wj0Q
	TKEBzAvNf/jdHbV0E0Vb34KzsuQaNZ8nmSA8I1iitPW5pblJRvPQ7zzWvbg/NACOYrCqbsT3aCG
	0Gm9klcwppxl/9Gt7XAAocdfJAREifPRnxmTYBVKdjZ3++7lhZuY/JZSOGtB5ybrIwhOsPjjMpz
	rsyKGNSdGKIsTe9+8sZLy4YQ5M5PN4XP0hAVkq5+yNuau80nFV3nk5i7OeKChRG1UDRnP6NvanF
	ah969y0m564X5AcVAAEYDkhBORZy1ClBMdlLaEGliloAmLZdzmqGI+o2vP17qcO06wHEWG66Qg6
	yCUZXoG88zgZbVInfQU/980suvenSNXBssT6fRqircx92MTC2GAHxpoGlraS
X-Received: by 2002:a05:600c:1911:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4a211caf95cmr6181475e9.11.1792708209901;
        Thu, 22 Oct 2026 15:30:09 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a211be8f79sm11958795e9.14.2026.10.22.15.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:30:08 -0700 (PDT)
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
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net v2 1/4] net: phy: as21xxx: handle corner case with link and autoneg complete
Date: Fri, 23 Oct 2026 00:29:51 +0200
Message-ID: <20261022222955.698722-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Add missing case in custom read_link, when autoneg is started, autoneg
complete bit is reset but link is still not up.

Fixes: 830877d89edc ("net: phy: Add support for Aeonsemi AS21xxx PHYs")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
Changes v2:
- Add Review tag

 drivers/net/phy/as21xxx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/phy/as21xxx.c b/drivers/net/phy/as21xxx.c
index d5738117eca6..0db82da8dbdf 100644
--- a/drivers/net/phy/as21xxx.c
+++ b/drivers/net/phy/as21xxx.c
@@ -658,6 +658,13 @@ static int as21xxx_read_link(struct phy_device *phydev, int *bmcr)
 		return status;
 
 	phydev->link = !!(status & MDIO_STAT1_LSTATUS);
+	phydev->autoneg_complete = !!(status & MDIO_AN_STAT1_COMPLETE);
+
+	/* Consider the case that autoneg was started and "aneg complete"
+	 * bit has been reset, but "link up" bit not yet.
+	 */
+	if (phydev->autoneg == AUTONEG_ENABLE && !phydev->autoneg_complete)
+		phydev->link = 0;
 
 	return 0;
 }
-- 
2.55.0

