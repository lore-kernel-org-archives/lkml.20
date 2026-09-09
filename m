Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1EE3AFAF1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980775; cv=none; b=GbYpGB0l2ag/3na3wziRSSG1L4fVnPGEh4B+FvlYckzfVzDXV0CrwxVhM2Vn4k358KR+W+A8Gs4LTT5dHoVjcCGw2lInHq29zN/pjVb353bnk4sl5cWfFFnpxOu3av7D1XmRvEvblK1bqXUl6TYiyjGoHXvwz3LbHeu5JKoUIRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980775; c=relaxed/simple;
	bh=fLDySpshRkuGFm1WodapEqEIoGCDqg3KQnzHh8vfc7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=korJpLPLO3uoU93ZNDQ+9COwj3FxxZUQ5zeKR5Vj+QGZlaF0Myew0xUg/4rbnCI/FCpoFMx/gLPSmVYCG6sdxOOtQWdysOPEybJD9nI86Lufbm/W9MZ+VYnPBxZIRYMnZnrRAQezKxqvNBEajtVpctd2myhM/7KAyE/HR0DR19w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oq7ysE+W; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oq7ysE+W"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d58efc7356so80558225ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788980773; x=1789585573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkW5gvjleV3pVc79+myA5Hog7ljScbn4RX3/5Aixz34=;
        b=Oq7ysE+W5CWTlzZYK2dH4E36uAww1e6f+xwKFM9EOCzbNuTSzfd//SUhAjdBaDx33e
         bdC0cSLurPjhFlAZYf23UePqyFE/7Q/7UUAQXJ5pGQlDNWeRnYQzlzM7FvDbMMSC3NKB
         Ra23nzDhhBgpEHRE9OaOL1PZ7VEx3QjmQVk87EoxEecQA9ZJmTYJZiKW/OmrfDWoNvKL
         BSktc+boNRWGrWbHR0adXyS4VBI0r0kT8r4dZ7s1ucn1CADU2omcrohASddB8qIbimMr
         dpGpovC9RizydTD3aOb2OjseuYZcJVGJL7775TCIhPUsuMERaPSnruIAD5dvndVHVS9C
         rGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980773; x=1789585573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IkW5gvjleV3pVc79+myA5Hog7ljScbn4RX3/5Aixz34=;
        b=ciVGu0nWUHwEMgEPxtnzVdW4nXPMHMjMiaeXHTNLIoN9Iw2TgEO6saPkHvuyVnG0yX
         xzLZPb7m5x90DQVaV+RauBCumlmBLfR7FVStrmAZZRUHY55CsK/m1opGUQ7baqE0jy/w
         auBMwgQAMcjQe5HrE8QfOPenK0jgaGn1Ca94a/QleQWz49J1ebdq1D/UAdjzAFv2q9xk
         gJo4TOt/Szp10SC0lodlwSOH+wzP8tG8snwpmaAcblYYR6BvgMUAIwmzBBgJURnSGoMM
         2Ie5XBgyD+IB1+t93TRMsSrOx1LUywzyrTmRokOLUoDOdN1dAroEfItL3pXYIy3bqIA5
         XHyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzE73OISUdBZc2lePnDCP59pNafdgLwQSsgspmMOZ9aKkpQN7x8r0HXxXIurEFt44w1aryCykTLmcQhzY4=@vger.kernel.org
X-Gm-Message-State: AFuF++krVsOBYpXNg2DhbfJu/b+6Fh13ZT6vAmjcFzPoQEVuRaXSNNqf
	6WI8QmOf2kkLmjmYtKIyMS+qOfqQG2Zs715P07w/QXj9t181JOZCxM5F
X-Gm-Gg: AYBFou1C8XySWwk6W8aVXan3qe2tr2S+thQmruEkEGhiGXJ5TDC0PDKSgLm1zv3CKlc
	3ehdkgjECXM9Mij3M8Yd0Z9WPKDhhrVAAhqO+gpl+jufoiGVK+XpXVWLzJxzACIZNnKw5egJDH+
	/wUxSJXGXlchVtZkjYU0mCcjHAQ8AmwWITCplf7B4DydYWLNCl1Ezq3DPYQcNG/GZO6hLmEpK8X
	UrKVQRsoI7/YNjXuzoUKqDV/Gphihul+T3GtiJ5FFOxQcHYNE8Qk7oyJPOl/YXhRA+eScaSeHjZ
	lOan+yuz7bCTDntyab7MMGEh3CnWpZxK4Vus6ZDPBcm8xxXEHK01vkdiDpIEdlLMnrC9KOT61Tf
	WCrQTSrXzjoQWkxCsb0W0OmREz/nFuNPrdiCu4PAltsk0f+fIU/5uXq3V8NfsqjQ2XpmO7jg+rT
	En/O3e2Y/VSWtSVDU7gXPEQNPN8kaN3X8FmX7Cvl02mOC4Y7Gd8u8bfbv+Dygi+wHnQLDNxOygd
	JH/pfbxrmClCXzGHOZZ1vN6
X-Received: by 2002:a17:903:98d:b0:2d8:d4d0:792b with SMTP id d9443c01a7336-2db12831fddmr486539175ad.15.1788980772576;
        Wed, 09 Sep 2026 12:06:12 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:d30::4d0:7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dcffa9827dsm13988515ad.66.2026.09.09.12.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:06:11 -0700 (PDT)
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
Subject: [PATCH net-next 4/7] net: dsa: motorcomm: Introduce yt921x_speed
Date: Thu, 10 Sep 2026 03:05:32 +0800
Message-ID: <20260909190541.466476-5-mmyangfl@gmail.com>
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

FIELD_PREP values cannot be used as case labels. Introduce enum for
future use.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 62 ++++----------------------------
 drivers/net/dsa/motorcomm/chip.h | 61 +++++++++++++++++++++++--------
 2 files changed, 52 insertions(+), 71 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 53d0a85e9310..0635359787db 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -3776,29 +3776,15 @@ yt921x_port_up(struct yt921x_priv *priv, int port, unsigned int mode,
 {
 	const struct yt921x_info *info = priv->info;
 	struct yt921x_port *pp = &priv->ports[port];
+	int ps = ethtool_speed_to_yt921x(speed);
 	u32 mask;
 	u32 ctrl;
 	int res;
 
-	switch (speed) {
-	case SPEED_10:
-		ctrl = YT921X_PORT_SPEED_10;
-		break;
-	case SPEED_100:
-		ctrl = YT921X_PORT_SPEED_100;
-		break;
-	case SPEED_1000:
-		ctrl = YT921X_PORT_SPEED_1000;
-		break;
-	case SPEED_2500:
-		ctrl = YT921X_PORT_SPEED_2500;
-		break;
-	case SPEED_10000:
-		ctrl = YT921X_PORT_SPEED_10000;
-		break;
-	default:
+	if (ps == YT921X_SPEED_NUM)
 		return -EINVAL;
-	}
+
+	ctrl = YT921X_PORT_SPEED(ps);
 	if (duplex == DUPLEX_FULL)
 		ctrl |= YT921X_PORT_DUPLEX_FULL;
 	if (tx_pause)
@@ -3815,25 +3801,7 @@ yt921x_port_up(struct yt921x_priv *priv, int port, unsigned int mode,
 
 	if (pp->serdes) {
 		mask = YT921X_SERDES_SPEED_M;
-		switch (speed) {
-		case SPEED_10:
-			ctrl = YT921X_SERDES_SPEED_10;
-			break;
-		case SPEED_100:
-			ctrl = YT921X_SERDES_SPEED_100;
-			break;
-		case SPEED_1000:
-			ctrl = YT921X_SERDES_SPEED_1000;
-			break;
-		case SPEED_2500:
-			ctrl = YT921X_SERDES_SPEED_2500;
-			break;
-		case SPEED_10000:
-			ctrl = YT921X_SERDES_SPEED_10000;
-			break;
-		default:
-			return -EINVAL;
-		}
+		ctrl = YT921X_SERDES_SPEED(ps);
 		mask |= YT921X_SERDES_DUPLEX_FULL;
 		if (duplex == DUPLEX_FULL)
 			ctrl |= YT921X_SERDES_DUPLEX_FULL;
@@ -3855,25 +3823,7 @@ yt921x_port_up(struct yt921x_priv *priv, int port, unsigned int mode,
 		if (res)
 			return res;
 
-		switch (speed) {
-		case SPEED_10:
-			ctrl = YT921X_MDIO_POLLING_SPEED_10;
-			break;
-		case SPEED_100:
-			ctrl = YT921X_MDIO_POLLING_SPEED_100;
-			break;
-		case SPEED_1000:
-			ctrl = YT921X_MDIO_POLLING_SPEED_1000;
-			break;
-		case SPEED_2500:
-			ctrl = YT921X_MDIO_POLLING_SPEED_2500;
-			break;
-		case SPEED_10000:
-			ctrl = YT921X_MDIO_POLLING_SPEED_10000;
-			break;
-		default:
-			return -EINVAL;
-		}
+		ctrl = YT921X_MDIO_POLLING_SPEED(ps);
 		if (duplex == DUPLEX_FULL)
 			ctrl |= YT921X_MDIO_POLLING_DUPLEX_FULL;
 		ctrl |= YT921X_MDIO_POLLING_LINK;
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index e87daf8c650b..dd121ef2cbf5 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -89,11 +89,6 @@
 #define  YT921X_SERDES_DUPLEX_FULL		BIT(3)
 #define  YT921X_SERDES_SPEED_M			GENMASK(2, 0)
 #define   YT921X_SERDES_SPEED(x)			FIELD_PREP(YT921X_SERDES_SPEED_M, (x))
-#define   YT921X_SERDES_SPEED_10			YT921X_SERDES_SPEED(0)
-#define   YT921X_SERDES_SPEED_100			YT921X_SERDES_SPEED(1)
-#define   YT921X_SERDES_SPEED_1000			YT921X_SERDES_SPEED(2)
-#define   YT921X_SERDES_SPEED_10000			YT921X_SERDES_SPEED(3)
-#define   YT921X_SERDES_SPEED_2500			YT921X_SERDES_SPEED(4)
 #define YT921X_PORTn_CTRL(port)		(0x80100 + 4 * (port))  /* Bit 7-0 shared with PORT_STATUS */
 #define  YT921X_PORT_CTRL_PAUSE_AN		BIT(10)
 #define  YT921X_PORT_CTRL_LINK_AN		BIT(9)
@@ -107,11 +102,6 @@
 #define  YT921X_PORT_TX_MAC_EN			BIT(3)
 #define  YT921X_PORT_SPEED_M			GENMASK(2, 0)
 #define   YT921X_PORT_SPEED(x)				FIELD_PREP(YT921X_PORT_SPEED_M, (x))
-#define   YT921X_PORT_SPEED_10				YT921X_PORT_SPEED(0)
-#define   YT921X_PORT_SPEED_100				YT921X_PORT_SPEED(1)
-#define   YT921X_PORT_SPEED_1000			YT921X_PORT_SPEED(2)
-#define   YT921X_PORT_SPEED_10000			YT921X_PORT_SPEED(3)
-#define   YT921X_PORT_SPEED_2500			YT921X_PORT_SPEED(4)
 #define YT921X_PON_STRAP_FUNC		0x80320
 #define YT921X_PON_STRAP_VAL		0x80324
 #define YT921X_PON_STRAP_CAP		0x80328
@@ -122,11 +112,16 @@
 #define  YT921X_MDIO_POLLING_LINK		BIT(3)
 #define  YT921X_MDIO_POLLING_SPEED_M		GENMASK(2, 0)
 #define   YT921X_MDIO_POLLING_SPEED(x)			FIELD_PREP(YT921X_MDIO_POLLING_SPEED_M, (x))
-#define   YT921X_MDIO_POLLING_SPEED_10			YT921X_MDIO_POLLING_SPEED(0)
-#define   YT921X_MDIO_POLLING_SPEED_100			YT921X_MDIO_POLLING_SPEED(1)
-#define   YT921X_MDIO_POLLING_SPEED_1000		YT921X_MDIO_POLLING_SPEED(2)
-#define   YT921X_MDIO_POLLING_SPEED_10000		YT921X_MDIO_POLLING_SPEED(3)
-#define   YT921X_MDIO_POLLING_SPEED_2500		YT921X_MDIO_POLLING_SPEED(4)
+
+enum yt921x_speed {
+	YT921X_SPEED_10,
+	YT921X_SPEED_100,
+	YT921X_SPEED_1000,
+	YT921X_SPEED_10000,
+	YT921X_SPEED_2500,
+	YT921X_SPEED_NUM
+};
+
 #define YT921X_SENSOR			0x8036c
 #define  YT921X_SENSOR_TEMP			BIT(18)
 #define YT921X_TEMP			0x80374
@@ -1009,4 +1004,40 @@ struct yt921x_priv {
 	struct yt921x_acl_blk *acl_blks[YT921X_ACL_BLK_NUM];
 };
 
+static inline int ethtool_speed_to_yt921x(int speed)
+{
+	switch (speed) {
+	case SPEED_10:
+		return YT921X_SPEED_10;
+	case SPEED_100:
+		return YT921X_SPEED_100;
+	case SPEED_1000:
+		return YT921X_SPEED_1000;
+	case SPEED_2500:
+		return YT921X_SPEED_2500;
+	case SPEED_10000:
+		return YT921X_SPEED_10000;
+	default:
+		return YT921X_SPEED_NUM;
+	}
+}
+
+static inline int yt921x_speed_to_ethtool(int speed)
+{
+	switch (speed) {
+	case YT921X_SPEED_10:
+		return SPEED_10;
+	case YT921X_SPEED_100:
+		return SPEED_100;
+	case YT921X_SPEED_1000:
+		return SPEED_1000;
+	case YT921X_SPEED_2500:
+		return SPEED_2500;
+	case YT921X_SPEED_10000:
+		return SPEED_10000;
+	default:
+		return SPEED_UNKNOWN;
+	}
+}
+
 #endif
-- 
2.53.0

