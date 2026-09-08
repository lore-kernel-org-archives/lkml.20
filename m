Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5FC582BAB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883038; cv=none; b=h7uWsX+E1vKCXFuubtY4BxRUdpK/BqP0IWwypbnlsQ/z62Xl5oHFNXRVGfBsjYfj7chM1A8NIfv5ONTIuzNbQWrNq6Bbu7cvQmQ+Ic7KRc7RDszCq9fBJis16ri7efwnY6EqThBVwdUJyqAFN+YTz04tDuZTqsMIfHwKFewz/ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883038; c=relaxed/simple;
	bh=K244GoaR/SBN1qTkqznMbdB/qRyg1uAQxHof7eZyYLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GYSC/kBTJD4WkMdHv0UJIh0nSz7Cp+PV822P0WnY7HKDajEDuxt1ppRaVtej9yTgEqfl3PThDtcPcko6M6Y7JhBt3xpDQRzBEfLhG1ihwfQOTu6bfXdJoXL8gNDUVU/mthuQGgpOTNZMNm7782LO9vLZjzrGNwihrIGlqwRaIDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=BP8nITiC; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="BP8nITiC"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4858303de5dso5860267f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788883033; x=1789487833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwJE/G6DLPhkatwmSaqyq8HEYQKnbZm9tru5auWihS0=;
        b=BP8nITiCIEsy0JEGklGDMKuWpAgorlXpkH2F6YRnmPqaFXdDadP5kPIJNyMvNluzlG
         aM539YAje5/MxDx7hzLBGUoaBuLKGfS9kPHLa+GT43rnS+S2dy3WxZ50e0V4RqrKO20z
         QrN5H7GtW4XojmW1rowEd73eYpdM3VpBh4Vsa+uNh+LzdLLPFz/SFLDOsg3QA7Lssb1i
         1/qSvlHJRXiEKXy0xHpte6oxGp8vk1XkJBYLpsA7QPMHyaknAlcGqVV3LBpWaU/2rmOp
         ngC8yS/WL9i4K3epRWdtH3OrAG0tWU7Dyv3j1aYUwkkrQ5mKxGPpYeRulDnJO/oDGwkS
         FW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883033; x=1789487833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwJE/G6DLPhkatwmSaqyq8HEYQKnbZm9tru5auWihS0=;
        b=RNM9UaZBJNeiHaFc/qdsUZGmA/FXpB1RbwWZeqcz4hdMwNKl6+puM8U4t3wu0c2ecQ
         kroVd2S21mS9mET5qLAY1omru+YKiSWXW4p2BGuk7HN40pqka9BamJhKQWRnlxj2hZTp
         dD5cg5c9R/7j6f24jkkNTzH0FO8LeWlDhcJ7L7mrfRV9ArmqsdZxWUOsZXbwWKRGHWd4
         SeGWVLfVG6vnceKomjk/QroRLQk5Ud40Np87W/xQ1WIRqVsRXnY2A+hIo1Ougd4YAOLE
         B94rvnikkOhWBZT5AXFFSHd5gB29UVn8fbsujharru5+BrTpS7/vN8riuC1h1AoE51UK
         pP7g==
X-Forwarded-Encrypted: i=1; AKwUvBzLZDexrLbCSxhSHRIgqb5FUb4WPMukHTrlfxQLv3W6ttEd3U1A+H2mqzA/tNATyJ+x6+sRQ3w0pG5gzkI=@vger.kernel.org
X-Gm-Message-State: AFuF++kmbnFwSidN542+5nRxab7gFf2kL30A+MsS2Nq1y6b4XZeuuUmw
	ahimqIKqCBrrK0/99Q2Va+Np3PdXpIGuujWWKcUB5tzBVCnW1wmuYC9iUUc0I/0vjpk=
X-Gm-Gg: AYBFou1J7d07o9pnIXC1ZcVoAhMh4TO83gxQEm/Nx0BiHzRwbiqNAKTyjBazDS7NKm4
	O4ukC0ZF24KvRunne9f/NWrHrWSb0HE4oNzmpq3Wm2Epg+BLiufyrzJ55JwPOuLpKkyCu3gw7cF
	pTuhleBwkQEHr6N0+O3lZH7tS8KkTgFiwtq+ZDMEJvemG2pZqIj3nG+l64KUIkDn4eea9c4WP9O
	1T+iTdPfQLidLS4iDk7K07LCw03JvnLQNoKRv/hkgZHAWpeFxG2d0vIRCiDQK2xq1kRl1tkUEva
	IsQ+cMLm8jZ6s4krdHXsDC/nZhKg6yIe7w05QW9Ygis+Y0EtVFNjQ9FK++OGnzu1R0a3jcJYTIp
	lbFyx1RiRY+ZLwCA5cdXryD8iwJzPDQGG0yvov0lBatO5cLcRQcO/A3Wo2KpPIh61rcvt0Z9jUo
	kLXtiqtiuFKNt/OixiFfHdc6nf2ybERmhb/nOKslMfMVCuMSuFYQ==
X-Received: by 2002:a05:6000:2c11:b0:485:8c16:a340 with SMTP id ffacd0b85a97d-4858c16a82bmr28568008f8f.53.1788883033146;
        Tue, 08 Sep 2026 08:57:13 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm37345704f8f.21.2026.09.08.08.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:57:12 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ericwouds@gmail.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next v2 2/7] net: phy: add mdiodev_lock(), mdiodev_lock_nested() and mdiodev_unlock()
Date: Tue,  8 Sep 2026 15:57:02 +0000
Message-ID: <20260908155707.4164559-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908155707.4164559-1-f@lex.la>
References: <20260908155707.4164559-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Code that holds the MDIO bus across a burst of transactions has
phy_lock_mdio_bus(), which needs a phy_device. A library serving a chip
before its phy_device exists has to open-code the same mutex.

Add the mdio_device spelling beside it. The nested form is for a
library whose caller already holds the bus one level up, which is what
the EN8811H MDIO driver later in this series does.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 include/linux/phy.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3d8afe6b7f1c..e74a8f5cf5c6 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2284,6 +2284,22 @@ static inline void phy_unlock_mdio_bus(struct phy_device *phydev)
 	mutex_unlock(&phydev->mdio.bus->mdio_lock);
 }
 
+static inline void mdiodev_lock(struct mdio_device *mdiodev)
+{
+	mutex_lock(&mdiodev->bus->mdio_lock);
+}
+
+/* For a bus reached through another one, as mdiobus_read_nested() is. */
+static inline void mdiodev_lock_nested(struct mdio_device *mdiodev)
+{
+	mutex_lock_nested(&mdiodev->bus->mdio_lock, MDIO_MUTEX_NESTED);
+}
+
+static inline void mdiodev_unlock(struct mdio_device *mdiodev)
+{
+	mutex_unlock(&mdiodev->bus->mdio_lock);
+}
+
 void phy_attached_print(struct phy_device *phydev, const char *fmt, ...)
 	__printf(2, 3);
 char *phy_attached_info_irq(struct phy_device *phydev)
-- 
2.53.0

