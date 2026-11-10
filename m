Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326799;
	b=jV3NlCxU6o6b3YwgOnEtGwJ8jQvrdZnIaAbP2Fn3zMMzMfRRJmwHS0fyQ36W4j3m9Sdz
	 vbCSO2z5ndQ6doCIYPsdk+9RX7vzXYx9y6mF8vBPgGbenAp/q4CSNxnIGgakHXvXs82Ji
	 f1Cy/SDO17zOCDKUHlw2vsGOifvoNUS1JVyTg6s9grRE4VMJ/RzMmUFfMMUkBzcsw8S9G
	 /Ay9wzqYeqDSXfz3XnnXLX2xSU0bsK8lhsU12f5ygw32fw3mzm+jlkBpAxutcHtTwB4WJ
	 g2FicLdKIOw/lWpM/JrSiQCgCprm1DySfFMZMIs7lySX72QHDJu8qJV2/BwJ2VmccvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kJO+2+1LAsC2NcBt84N3ty/qYLz68nqiItgXHSjfx20=;
	b=kpQzJxiodhslXijAhTXxbZ0X7yhHVpRAKCAAjtBFrrNCeQqZdsCrTBuhM8ziocYg9W2X
	 00DtU4GnDcKYbQliWscQB3fAEMpNlgRS3rWp2DBTAPGhOYIItr/xN4014pte7f5cT3i7w
	 YzgASg4+oMo8e+2+04muagQIulrLWiKwIMbUYQ59hTNf5DpRsfUVjq/ZHjpIgu6MciFL7
	 CosyVOcmgPJEbNNIkKMeFdBRbBZ1SNm2nQAnikDjn2Dynkb+a7qFsYNFekwkp5tjBJSEE
	 IlRFIsL2VwpfOR/+rhlQqvy+SKFqck8ge6SI0ReGfBsn5KshxwY2DsNb8JZcEVj+exA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w+kdlYun;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FFE606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66FFE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w+kdlYun
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36fe5944e9aso2285755eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326798; x=1794931598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJO+2+1LAsC2NcBt84N3ty/qYLz68nqiItgXHSjfx20=;
        b=w+kdlYun1XgxamcR9SkDJYFCJTMM4Evboj/4Y1m2LNGYZhV3KqmS2dsWF9rLkAXWij
         eJ94HOJ17aj+Ine1vZ7TaRuw5KX9uGGB6QKyquVAWuNMCgeJ5EBQq4V1afNGfUxUBH+0
         SbhkxGDpWxxOA0TRr+I9ihrBVMYTdiCtNYuF0C0GXCbphGn82bbQ7r1WP3MTS1rb2esF
         MvI89j+qe0aso1hG4soMbaLYHaDZatw7oYOPK3qIr8vgZVmLmOu3nuuPMS9rF14Q7VO2
         psE0cYD5k8x/OjstEocqTD9YLO/JJygrvXiXbRlT4ZgicdP/EeljOERPbuby53ABBvIp
         UGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326798; x=1794931598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kJO+2+1LAsC2NcBt84N3ty/qYLz68nqiItgXHSjfx20=;
        b=etByco9QqiEMQHj/yCyJGxzZH4YPi1YsAnHp/zOjGNRIlroRTPtecEJKHna2YsMlIr
         wWlBRpYeaL0GxjWQE1nDjPHp7J8XzlBAugs9cB275qm2B4Xdy6dbN8K132Oq+wyftoX1
         Ca7Ea7t2kf0aupdKFpr0Obo6Tx/5NyNzKGRdtgXqUvORTjTmosPQQlJHvpU/HiFzdWAW
         Ojxn9foRtkVyG+8SQ38zRO+PkPm+zRiCPrJBf5aGvE5RXCzwwFn6sVzCn8wexMkRG/Yu
         jiydHNoJvhhFFFQN5EwMJiwfMmwUqTz3WYT8KpLNQVPeafFyNDBHXaOELesd11OpRfB/
         sbJw==
X-Forwarded-Encrypted: i=1; AL+hErEwWuyKSfQR4RHdM/X+VQbWflcNAYWLWsdmJJMz+JyZ/1SB0efuGg9o25UVOGypzCFpz+EV7u21+KJgYlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EALkKTUpxs6PCTTPuOig8goaXY9PyURDnYajMxlahjo5pEic8
	WL30CzZZjdBTQAmzEP84hVi7uzwl7bj/7i6sPUjJdcM0BB2bemIK56i1
X-Gm-Gg: AYBFou3q/pr7YKo/i4MducMUGWhz25n4CTskqkkMEunyz0cLSzqYrH5TcedrxvaJ+ql
	GZg8wySWHINJdbAdB6cbaylYB5a/9nlwi/zdmLw0rPe7F2DoJ5amSUX9K5m4dv5CriJBIkhkSiq
	bBgEnCqzc0MrN338qnHe8iI+bX1iDGrZzRbeBu/I2Jkve7yBwFiQtWURqSNLaEfh47jln3leqd5
	9Xm74N9t8+4hITwwz238xTHfCWwFbUmOy4+GrXdknwRu4HoDmeW0KUK9rSMZFRyUhdtRlJES9vV
	65LWdWg+LKSk6ZtwX0RPmV1v21qzq5Y/hBgDD/HgKuF4uhFFXjQU2VQHdKXcvzbuf5xog9wwO/k
	YVcH6+4UdlO1V2Mj5sKomN1MfiViKANxE1byE3nNOVYezeAAo39KRYTp+U5fPFcMsCGIDreeQcy
	sMUDYt3ANMEJoii1Y5Cp+xKy7O0MG10Wggw5BkocNT69ek1CablybGG0DbiTuo6qcgqp/lwJp4h
	YBlj7JF7onC1RqzdDVsQ/Ib3+KYi+zV79mEJ4cPYq+TOU8k00j8nNG0xxzeWcBGel6AlFCiqfwV
	Ka0luFZMvDQtLnP6rd4RvtzGzlg=
X-Received: by 2002:a05:7301:d188:b0:36a:12bb:7f8e with SMTP id 5a478bee46e88-3751eb8ababmr3534905eec.13.1794326798150;
        Tue, 10 Nov 2026 08:06:38 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm8453403eec.7.2026.11.10.08.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:06:37 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v4 1/2] net: phy: move DECLARE_PHY_INTERFACE_MASK_ZERO to core
Date: Wed, 11 Nov 2026 00:05:53 +0800
Message-ID: <20261110160554.918652-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110160554.918652-1-coiaprant@gmail.com>
References: <20261110160554.918652-1-coiaprant@gmail.com>
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

The txgbe driver currently defines DECLARE_PHY_INTERFACE_MASK_ZERO()
locally, but incorrectly uses PHY_INTERFACE_MODE_MAX as the array
length instead of BITS_TO_LONGS(). This allocates significantly more
space on the stack than necessary.

Move the macro to include/linux/phy.h and build it on top of
DECLARE_PHY_INTERFACE_MASK() to correctly size the bitmap, while still
initializing the stack variable to zero.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>
---
 drivers/net/ethernet/wangxun/txgbe/txgbe_type.h | 3 ---
 include/linux/phy.h                             | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
index 757d1ce8d3ad..8071464c7b90 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
@@ -315,9 +315,6 @@ void txgbe_up(struct wx *wx);
 int txgbe_setup_tc(struct net_device *dev, u8 tc);
 void txgbe_do_reset(struct net_device *netdev, bool reinit);
 
-#define DECLARE_PHY_INTERFACE_MASK_ZERO(name) \
-	unsigned long name[PHY_INTERFACE_MODE_MAX] = { 0, }
-
 #define TXGBE_LINK_SPEED_UNKNOWN        0
 #define TXGBE_LINK_SPEED_10GB_FULL      4
 #define TXGBE_LINK_SPEED_25GB_FULL      0x10
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 21afc2082b17..43aba23109fa 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -159,6 +159,9 @@ typedef enum {
 #define DECLARE_PHY_INTERFACE_MASK(name) \
 	DECLARE_BITMAP(name, PHY_INTERFACE_MODE_MAX)
 
+#define DECLARE_PHY_INTERFACE_MASK_ZERO(name) \
+	DECLARE_PHY_INTERFACE_MASK(name) = { 0, }
+
 static inline void phy_interface_zero(unsigned long *intf)
 {
 	bitmap_zero(intf, PHY_INTERFACE_MODE_MAX);
-- 
2.47.3

