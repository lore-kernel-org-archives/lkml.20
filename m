Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884571172E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792109138; cv=none; b=tVp6w3ZmVLTZVh9S16/QuUfUimgXnXpydlu9GxiFSSGaHpi09hWhsHV1Nm5RzP84bx7hxo6pJOoEaW2PE6/CYqOS/P5PTdrrKfz4JAvxlO9cLQiNwryR8IH3lCpL4fGbWK3zdjzeKoWJQ028suKslzR7cpyED67N/VNzocWIg1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792109138; c=relaxed/simple;
	bh=fPRYypa44znrNavChK57m+Ydl3AyDgbMBifU9YzFMLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7lPmlId3Q/Dq13Kdcv8HBn/G2vGwGB6bI8lOMcAfJg+fZSaLXZfYR6NzlP8X6WzE79h2+y9LLDZl/vy0lniB3YNlXfjNSl647N0Ukq+jx3FsysDG6khMlJdfIJE0386OBDx5xcrg0+Ds7UCIvGoF9f2bSiTg6oQTOS4y1dt9N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rScwL5k5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rScwL5k5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4956869750eso38310725e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792109134; x=1792713934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnhsvI9MzVbrWhzAeYwgCkKjH6CfXVlO8VeDcgUlxMk=;
        b=rScwL5k5O6KZT1xUuakOfKTXFJWr+OAjf8bQ8GsWjMa4D8l3XuFAzK3ywr6S7ER0g4
         hw5cKkAhLWyypo3HS8444/rvHwgbanQDCjQtMRb1Sfpg47ArO6hWtTMWGEV08v94vzMc
         qwbyUJz7/GgOmqHapRdvrEDirTx2GdWy5D9PDrXYB6cE2Kq6oS/FFfYJFk1XdKfGRKF4
         pr5QELEyQ0xWdd2g/zbRhBV6v9lWfL6IhcIZsqsr5Qx+eXucI8MVITTOEWUh/2MqB6qf
         5UGc2zYHC+B8dusJZUZspdAv4HwTUCa5wYSKjpZl1QIvu9raRQTuqBgRJqy6+E32Fwe6
         NGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792109134; x=1792713934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnhsvI9MzVbrWhzAeYwgCkKjH6CfXVlO8VeDcgUlxMk=;
        b=DhLUW7lWz+JNVwnfxG3NMyGWwOuTnR3odO05i3ehYlS/oZmB0Y10fNYnrnpbImhysF
         weT/0pT4fMml849UIJyyBtZhyymPvByFCtkL1c9xuJSc2drfVZFr9ZP/zLUwwDs6Rwml
         b7stnOtv8Zc3m2cF/kU8fQ8BXpZPmVl4cpY8IeX4thOz+h2TSVdzyUZidMKfFTsc2Gyh
         zodwIac4vFy1tCfULCVNljScwceMEZV8GCwH0mig9x69OQv8Y5DRmMOn3Pmniy/lAF2v
         1y1r5oQo/LLE7jeW1npokhDVxlYHZk7xbo+RIcJJSnb3neEhrnhZ6EZjFtGg3I/5ZP+o
         ewkg==
X-Forwarded-Encrypted: i=1; AKwUvBwAx+yedzL87cz5gZbsFbRfljvMPZ5bkhcIuGdM7S9It5nnshdvJvNll5+izXFFdSTdYiazr5bTeWJ68+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/xlGvGuSIG6ztRfHhw5wRJNSiWRWfuO520ctVs5sQCOWulCU8
	kgN8TgZtWiFpLH4S+63wVbro6XORXGxsIK0tQSC13tgeA62yi6zbu3s1
X-Gm-Gg: AYBFou2BPGPd6Ty5nWQJ9+jfhqV71DXFH79IvrphA+4Mroiz2O4RA1dbvbaoztV5zZO
	2tqlSx3OEx+ULbyko1juaK2s4Li9ywr9zzADQZXSU6ytzfwh5eKj6enK6pjIvDETU348c3E/nzx
	cmcYF9wnq0gp5eO/MigwgWc7keswSn/XR7RASXZUCPumhiln1sUy01bDCOL/wWveDxku/1GeYYg
	3eQ+arzwIgatmvCAI4jg7oYz9HQwBZ4+Awsq9c2cPPQowW4xdfe8XJFMyJ+SZeTZ940aihjO9ip
	bI6GPkkhYDKTDk52DBSTCeU0eUKEbmGfBXK6mWju+feXBpt5jn/AeJQKjDlSpzVzqq1eskRbg+m
	YdrplCQ0C6dP8njS+7yRcdbvzg42vSGqD5XJoNapqw/EPnMxAAAeyWfVSkC1aJxDR+T7FVnqsjV
	X3tQX9d0lq7hSVZJ6+XvzLSM+HK6/KqnAfUHPzMr8NXpiT8UBJTEwT8BN9D6XwERT9Tu0SldLsQ
	ZXHYpdEzpPuDWmj1qhCwbm4BRmjSGoXwypB1kWY7/Nyzxfp2HsrjA==
X-Received: by 2002:a05:600c:4747:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4a18e49d65dmr411113445e9.5.1792109133763;
        Thu, 15 Oct 2026 17:05:33 -0700 (PDT)
Received: from fedora.fritz.box ([93.93.22.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8d1esm1315821f8f.39.2026.10.15.17.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 17:05:32 -0700 (PDT)
From: Stefano Munari <stefanomunari.sm@gmail.com>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>
Cc: UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: usb: lan78xx: fix error handling in lan78xx_open()
Date: Fri, 16 Oct 2026 02:05:21 +0200
Message-ID: <20261016000521.92868-1-stefanomunari.sm@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed interrupt URB submission leaves NAPI enabled and EVENT_DEV_OPEN
set. A subsequent open enables NAPI again, triggering BUG_ON() in
napi_enable().

Clear EVENT_DEV_OPEN and disable NAPI on the submission error path.

Reproduced using failslab on a Raspberry Pi 3 Model B+ (LAN7515).
With the fix, the injected allocation failure returns -ENOMEM and a
subsequent open succeeds. Verified connectivity with ping and SSH.

Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved PHY and MAC management")
Signed-off-by: Stefano Munari <stefanomunari.sm@gmail.com>
---
 drivers/net/usb/lan78xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 5655941f1478..6a95934bb3d3 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -3484,6 +3484,8 @@ static int lan78xx_open(struct net_device *net)
 		if (ret < 0) {
 			netif_err(dev, ifup, dev->net,
 				  "intr submit %d\n", ret);
+			clear_bit(EVENT_DEV_OPEN, &dev->flags);
+			napi_disable(&dev->napi);
 			goto done;
 		}
 	}
-- 
2.55.0

