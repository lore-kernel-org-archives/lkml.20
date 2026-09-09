Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2D23AEB26
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980766; cv=none; b=fdkOQOzbUZ5/GSaq5e3nFtjc0/PIN/QREe4Ytc4Wko3omiW5bWniqN05BU6XN9kNjaJ5rTSEdDvjLPGhVFt3H0+lUt5ItiN+94C0jHaOgoDtYRC/7wwRZnmS3dEIVur3c1bbohOCXmiCivKipG/FLM1fG2zSY/+nzMDB+kLNnnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980766; c=relaxed/simple;
	bh=PrCuKQUu2VDRHJu+oaiMa73L6JdPJjLtIWK+FO6vlls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FP0oVHd6nJN5qhPDo0LOWJLrFe6DOzznSI0k0Wd6HXsxn029pCQfAENeeRwKom2rsFz+JbZ41LGeOtTBf7jI34d631Xd+J0PBjzBnRPxRq+HcPUUkZLrDHIzhD3fSPzuuNAngY4vAGuQVa3qkgmotRSPhNqdHJUZExQby6dTK3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJ0opQYU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJ0opQYU"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso55301855ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788980763; x=1789585563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gkHhS8aThLlQeC5rFidveAGqpgcQbvxDn2Wylr5Mluc=;
        b=cJ0opQYUuLqzogOSrGT8CotBhyhAidGEgJ7CSb7Rwf7eYBMTsshAgo2P2AneE7u5/L
         BP3FmtCTkGL2M6rF20f3ocBjHjy4f2SvVxkzXwFfYW9ixDNtcOfDMoEJiW+Hq+aoGYzT
         fLAU9BXj2nV9fNx0EGPF2o/1/PcQ5BHyKn58W3+BC3W57/kszzspvSTFn5AO2xTMi/UN
         Iq3th4AZZyBp4TsK5OX8liL4akbOsPlSlzEuDPb02pFZRrCHkEUZ5uBuj0kUucbbJjp0
         RpPXqBjIcLbqYW/mAd50Tk6VK3o7vA8WXIZXKSvW+V4JogwzV7sQgklJ0czDg0swzaeN
         +hRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980763; x=1789585563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gkHhS8aThLlQeC5rFidveAGqpgcQbvxDn2Wylr5Mluc=;
        b=fsHCQWG073kKYiE39WhVUNvilS7uI2dOtL3NW4t8rAnXeqylq/ij1aaMMEsLFX1Dea
         0jzIksq7XdfiH7UCq70qgmfG36bl9ypYHoLDoFNieShDWSAo0SfKT6dYkTIKxhFTD6IR
         YSsiDsJdY8BuSlpWFMMDZjzMhadq8/P1Phi2TS4rk5hDm0Ot2bKRCQd50ow+zAdEFtyA
         V6GCtkuqQYaulHA8jw8BPlyJ35m5eq1O/ogqGYqIXlfDsS8meHR99bG9Ck9JEXVBOi1w
         4jQqrrpLxs8ldhjmfdRIHT247MY+7ijGov9vB4KRVsExGbHO6i3hfnu7OKY0N524O0iK
         SNcg==
X-Forwarded-Encrypted: i=1; AKwUvBzfihNMo+Osa9bxmxQZAlAT4ql5jfB+eLjGIlRwGge009jJKy86F6wkqJZwhCoxh5v1viUvGxm5jZSPU3g=@vger.kernel.org
X-Gm-Message-State: AFuF++kgwJhjev5RmBTEsCAEl2h1Q7qyWYKQNsHG1j/sc/1B4uAVAiZY
	vPRgYdtqcesmuiL+R3xxxAFheYc/GTXH4Aec1YzYidLP3n/IsbTyOL8D
X-Gm-Gg: AYBFou2ar9nX4LbDoa+XxdPl9pOVUOb8Ggd1jVPhcgc8tgupq1fZy4wMfPAks7XmvGN
	pU11HLZg5BMcEAuyZCHp2ULS+r3bv3iCvvkr87v5ydGCt2kSXieYscekCP/tDKpg9379nNt58v/
	oxhM/24ZSt7vu3v8ZrI+FrcGXv2w9AKfzQUI70vG5PFbf6yUClGGbJrWJfwQixGQ2buMSDnEuYi
	0q1o09r4PkEc3nf+lCGUi4HLpHv/W10fYeNJ/cpXtI/YwByt2rEfNf4kyl5UBNjgdPxUhdT0oTV
	Bey78XjqmToNaMqjdcW16VRz8wyAwmYnbQDk2sKecPZYzyBHh6TGCFK5gFaip4aZS7W/enUEi26
	uI4U/DRou91AWm+PWVn+7A9MnPC1trqdjv6al4cSOghsB1+5MjH8gVbEv7PF+Mwk7ADAsdfhdsq
	z0I549sLqHBcF6LKLUr2CvHotlZU/3Dy/eq1pooO9liSKCij+8cgvgBx5edd+2xK4U7uPtkmzQC
	hV5LQK5s1dzGTtYFqZITRcQ
X-Received: by 2002:a17:902:db07:b0:2db:5ea1:8b04 with SMTP id d9443c01a7336-2db5ea18e2amr268532465ad.5.1788980762972;
        Wed, 09 Sep 2026 12:06:02 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:d30::4d0:7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dcffa9827dsm13988515ad.66.2026.09.09.12.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:06:02 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/7] net: dsa: motorcomm: Split xMII and SERDES port masks
Date: Thu, 10 Sep 2026 03:05:29 +0800
Message-ID: <20260909190541.466476-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909190541.466476-1-mmyangfl@gmail.com>
References: <20260909190541.466476-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace external_mask with xmii_mask and serdes_mask, and advertise the
interface modes it actually supports.

Also move struct yt921x_info into chip.h for future use.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 39 ++++++++++++--------------------
 drivers/net/dsa/motorcomm/chip.h | 18 +++++++++++++++
 2 files changed, 32 insertions(+), 25 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index d663af010f43..64fdc5109cc6 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -96,18 +96,6 @@ static const struct yt921x_mib_desc yt921x_mib_descs[] = {
 	MIB_DESC(1, YT921X_MIB_DATA_TX_OAM, "TxOAM"),
 };
 
-struct yt921x_info {
-	const char *name;
-	u16 major;
-	/* Unknown, seems to be plain enumeration */
-	u8 mode;
-	u8 extmode;
-	/* Ports with integral GbE PHYs, not including MCU Port 10 */
-	u16 internal_mask;
-	/* TODO: see comments in yt921x_dsa_phylink_get_caps() */
-	u16 external_mask;
-};
-
 #define YT921X_PORT_MASK_INTn(port)	BIT(port)
 #define YT921X_PORT_MASK_INT0_n(n)	GENMASK((n) - 1, 0)
 #define YT921X_PORT_MASK_EXT0		BIT(8)
@@ -117,37 +105,44 @@ static const struct yt921x_info yt921x_infos[] = {
 	{
 		"YT9215SC", YT9215_MAJOR, 1, 0,
 		YT921X_PORT_MASK_INT0_n(5),
+		YT921X_PORT_MASK_EXT1,
 		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
 	},
 	{
 		"YT9215S", YT9215_MAJOR, 2, 0,
 		YT921X_PORT_MASK_INT0_n(5),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		YT921X_PORT_MASK_EXT1,
+		YT921X_PORT_MASK_EXT0,
 	},
 	{
 		"YT9215RB", YT9215_MAJOR, 3, 0,
 		YT921X_PORT_MASK_INT0_n(5),
 		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		0,
 	},
 	{
 		"YT9214NB", YT9215_MAJOR, 3, 2,
 		YT921X_PORT_MASK_INTn(1) | YT921X_PORT_MASK_INTn(3),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		YT921X_PORT_MASK_EXT1,
+		YT921X_PORT_MASK_EXT0,
 	},
 	{
 		"YT9213NB", YT9215_MAJOR, 3, 3,
 		YT921X_PORT_MASK_INTn(1) | YT921X_PORT_MASK_INTn(3),
 		YT921X_PORT_MASK_EXT1,
+		YT921X_PORT_MASK_EXT1,
 	},
 	{
 		"YT9218N", YT9218_MAJOR, 0, 0,
 		YT921X_PORT_MASK_INT0_n(8),
 		0,
+		0,
 	},
 	{
 		"YT9218MB", YT9218_MAJOR, 1, 0,
 		YT921X_PORT_MASK_INT0_n(8),
 		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
 	},
 	{}
 };
@@ -4026,15 +4021,10 @@ yt921x_dsa_phylink_get_caps(struct dsa_switch *ds, int port,
 		 */
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  config->supported_interfaces);
-	} else if (info->external_mask & BIT(port)) {
-		/* TODO: external ports may support SERDES only, XMII only, or
-		 * SERDES + XMII depending on the chip. However, we can't get
-		 * the accurate config table due to lack of document, thus
-		 * we simply declare SERDES + XMII and rely on the correctness
-		 * of devicetree for now.
-		 */
+		return;
+	}
 
-		/* SERDES */
+	if (BIT(port) & info->serdes_mask) {
 		__set_bit(PHY_INTERFACE_MODE_SGMII,
 			  config->supported_interfaces);
 		/* REVSGMII (SGMII in PHY role) should go here, once
@@ -4047,9 +4037,8 @@ yt921x_dsa_phylink_get_caps(struct dsa_switch *ds, int port,
 		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
 			  config->supported_interfaces);
 		config->mac_capabilities |= MAC_2500FD;
-
-		/* XMII */
-
+	}
+	if (BIT(port) & info->xmii_mask) {
 		/* Not tested. To add support for XMII:
 		 *   - Add proper interface modes below
 		 *   - Handle them in yt921x_port_config()
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index 83cd454955dd..bc2641ded101 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -960,6 +960,24 @@ struct yt921x_reg_ops {
 	int (*write)(void *context, u32 reg, u32 val);
 };
 
+struct yt921x_info {
+	const char *name;
+	u16 major;
+	/* Unknown, seems to be plain enumeration */
+	u8 mode;
+	u8 extmode;
+	/* Ports with integral GbE PHYs, not including MCU Port 10 */
+	u16 internal_mask;
+	/* Note: xmii_mask and serdes_mask may overlap */
+	u16 xmii_mask;
+	u16 serdes_mask;
+};
+
+static inline u16 yt921x_info_ports_mask(const struct yt921x_info *info)
+{
+	return info->internal_mask | info->xmii_mask | info->serdes_mask;
+}
+
 struct yt921x_priv {
 	struct dsa_switch ds;
 
-- 
2.53.0

