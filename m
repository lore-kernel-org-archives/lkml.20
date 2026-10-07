Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC934508E9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394595; cv=none; b=Ne0/6661ujH1vQDSLo8Ovc5jNQEigK8p1qwiLVnwJ1uyOi3+XyyBaKrvW91JvitxCScX8uePOdcVax7Cj5QNe2mraVX5f+RhqCDONAZIAwWrcr/Uq+9/683J0p4nzUoLbXfFbRpYnS8huiOa8awZQtLp5fJ9yyaxpgBYb79JBBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394595; c=relaxed/simple;
	bh=xTc6+Pt0HIOzphR1+634CVvLaokHVF/vgtj5j9M3IHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PeJlGFeB6Lq+pQXDC67bRE62Ed/saNdZfaoOUqnoUKaXpEvimVvXdhPdQdzVDMSWXXgLv+j0calU37E5S/Nsa9acip36DvvctVn+u7QpQhdJLhDeZK//4rwce6hRJjSY9vCqI1IyMinl9nJt58zzTacx8u8gLL35XrKM9DE8e2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8dBWjfE; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8dBWjfE"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-88bda150550so1315372b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791394592; x=1791999392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T2dKA+grcHjFFGSBsQQkVj014EQjGGZzyE9asz2HkMk=;
        b=J8dBWjfE5B020XVjlX8BspkAUj3w8hVNiAhZWPR4jRN8YFr8HhkiY2TOfJ4MtInlHe
         78bKqUUDqLZYjZJYNJ/pJDqAhqE+HvO8Px+UsAg9DEumsiapY2WYtZ7lKphc7ktXfiWe
         VTAB+OT9dxhPwewgiGdfMyfjy6FTlVyrOd8geGkChNEyVty1+SgaG/qHS0dPAxFkIidv
         VpBXMXHsNphexQ3xGEUHg+TYOj5Uk13qtWrXK6CvBQXEkiyjOvnl5//w5/LnTNi1zRT6
         Rlmefxe+bheUBZf0/VW/o2qFWEfG5q7Rc4aDJ9MmfQEAP4z50+LzrTmr/B/gGOwZ+AwJ
         RF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394592; x=1791999392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2dKA+grcHjFFGSBsQQkVj014EQjGGZzyE9asz2HkMk=;
        b=cI9EPQs+2RnLzv+N8/VI3bIQ5f/mEbzy1FMO3phJhZhm8eMPUP8Mk8SmTAEpJK8IpI
         F5L/UraUmpM+9EVx/ZgAYpAh6jaNLE4gaepXcPK9p/F32FgiQLyC5J4+GEWvLtcCoqmh
         uOjkC+bRtidUWAyU6TP5mqTBUAWWkKkMSLOEG7xweUs3hyd2w7hcE6RZhYbhDo4G11c8
         TAFTO5QH8BwpKkDAUv2Wbm9/1aB1TLacecwizgvQ/MVQBcxdFsxm5ALhP2v4JlnLPoX2
         lF+/s74o76fjC2wX7Q1Y6rneKjnD88o6lb/yebt1GtFnRpMRbU0A72q2gG4w9QXFFf9c
         gD4A==
X-Forwarded-Encrypted: i=1; AKwUvBx5NBGUitQBg3DOMEj5A1/X9clWjCj38EaWzHJ6mWATyv3wOK/9tqemeMaPIs6yCEed/RyU3W9HDkn+UoE=@vger.kernel.org
X-Gm-Message-State: AFuF++mbIXX7izP0HIdbXzlbuSBK0xZXrvQchpi1i7VfONXxiYo4BsqB
	4aK1m+NOx9SL7VbH4M0+9rqsdLFh7r1mHmTpgf9KdI1pj1mhLCBGVCjz
X-Gm-Gg: AYBFou2cQFipuIRVcLK8TX/YbJSD2pSpION4kjzVM9ewtjawveipf/MoHsIcS5m+vGJ
	PVwfJ8yte+s77RZMsdBg3tUOR8ps/lzyi7OKiSHVM2iXKngGldGXSnlZHlNaBtN7OoEtH/1ZPwy
	N3thkLgrZOIgxT6Zg5GyaWJzMz5jgj1W73QPwSNOH/AzMAIjaOpW3PIk0hKQXbHUJV5yv7SN+j8
	Xzv6NYmNfquqzRydAqQDqvgruJ8GOec3+AaYuPZv+ey/1fkEwPf96HReh3tnZoYeQI2e7emWr9M
	4jkl0yq5lvmaBlV0bS3glcELe94xPCQYcEzDXgAQTQamA1CEZ4zmrBdE3h+RW/hCxlTzJMm/ubN
	rcwuApUX9KzvIJLnwX2oKgq9/8dxoe0Qs10vOu4kE9UaUp8z7GyB9UW2R6mlQT7I2rQpBzXOyx9
	+SGRIo26DZniJPvCMv6T4GH7u/PanCP3lFu5LQ9HICAvZlgDGScyIkeUrwEdFRjRiYjNJhETaoF
	LejsHgCNWEioPjJRGCUroIOMBo6dYpnXt0c8XiEIUA1Q4Dwjie1AhqKpo9HUPlEDVpsGIWji5Zh
	IVcf9TUBboIUsSAgZwl6GR3hqpc0qqjWfOKcqq09yUkd1M3pA90EIgVRT98=
X-Received: by 2002:a05:6a00:4394:b0:881:e626:74a6 with SMTP id d2e1a72fcca58-891b0f9246cmr2650565b3a.12.1791394591619;
        Wed, 07 Oct 2026 10:36:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bbd8823bsm665809b3a.51.2026.10.07.10.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:36:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v2] net: ag71xx: Use default NAPI weight
Date: Wed,  7 Oct 2026 10:36:28 -0700
Message-ID: <20261007173628.657527-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the custom NAPI weight and let netif_napi_add() use the core
default.

The old comment claimed larger weights wasted cycles and cache, but
recent RX and TX path changes altered those tradeoffs. Keep the driver
on the standard default unless measurements show a device-specific value
is needed.

iperf3:

Before:

[ ID][Role] Interval           Transfer     Bitrate         Retr
[  5][TX-C]   0.00-10.00  sec   327 MBytes   274 Mbits/sec   31            sender
[  5][TX-C]   0.00-10.00  sec   325 MBytes   273 Mbits/sec                  receiver
[  7][RX-C]   0.00-10.00  sec   170 MBytes   143 Mbits/sec    0            sender
[  7][RX-C]   0.00-10.00  sec   170 MBytes   143 Mbits/sec                  receiver

After:

[ ID][Role] Interval           Transfer     Bitrate         Retr
[  5][TX-C]   0.00-10.00  sec   341 MBytes   286 Mbits/sec   30            sender
[  5][TX-C]   0.00-10.00  sec   338 MBytes   284 Mbits/sec                  receiver
[  7][RX-C]   0.00-10.00  sec   184 MBytes   154 Mbits/sec    0            sender
[  7][RX-C]   0.00-10.00  sec   184 MBytes   154 Mbits/sec                  receiver

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: move out of patchset
 drivers/net/ethernet/atheros/ag71xx.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index 4e4794c4dfdc..8a3c689f6825 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -40,11 +40,6 @@
 #include <linux/io.h>
 #include <net/selftests.h>
 
-/* For our NAPI weight bigger does *NOT* mean better - it means more
- * D-cache misses and lots more wasted cycles than we'll ever
- * possibly gain from saving instructions.
- */
-#define AG71XX_NAPI_WEIGHT	32
 #define AG71XX_OOM_REFILL	(1 + HZ / 10)
 
 #define AG71XX_INT_ERR	(AG71XX_INT_RX_BE | AG71XX_INT_TX_BE)
@@ -1913,8 +1908,7 @@ static int ag71xx_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	netif_napi_add_weight(ndev, &ag->napi, ag71xx_poll,
-			      AG71XX_NAPI_WEIGHT);
+	netif_napi_add(ndev, &ag->napi, ag71xx_poll);
 
 	ag71xx_wr(ag, AG71XX_REG_MAC_CFG1, 0);
 
-- 
2.56.0

