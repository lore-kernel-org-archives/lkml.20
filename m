Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598977;
	b=f2q97RcAKvwm1L77Vz9JuIudQYWfvZSQBAr+RcUY6vgcNocDIQZ9TT9LeDGzKhAlRBTo
	 8bdwWf+kiosF5MOlZU/p2/xM4Ts4joqo1UBYs6Vbm16rUbLSx0PQhvDx/oZeeN5Z2EU55
	 UtdUip9N++I0HXaN/tlIDtmlL8pVvs5/dfc+LccxGFAjAp/YvfbveQLWtRTHUVhRZWGPy
	 HBty1iX/0H/5ORaNC+dfTOzuNyoP7It36cECFWT0OSvJop1ofv2xE4GXsoVntZgbKO9UP
	 25R4+XV8Loy5EfGobBgXd3I7RsqjrWIM3UZW2JO3kVCPtgitFQja30qS6uXkTpb/YcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q7vPTpyG25KHlbD48LUyUXAGxP+fU7yyx1dKZKZGXsY=;
	b=icv2Q/OevKQh9aWCFt+x0gtUPUJoJmk4dNM/H+UEKGZPsOdw4XupaOL0NAMkbkYMOM2v
	 W82acJhLBDJJH8mp+bGINLuOd6F+07qcbMp12zByOzujmhbvy6cd8qrHRSoG0SYdB5XlZ
	 6Wc5A+MHtc3sDb1PGNIG7GP/K+oG3pyAVn0FtWGoQUSWRtu1hiE2YBlySihqAfvM8swF1
	 unPttcJw2CdTxY8bp0qrU//LqCeZwJqElkBm1V8lUe6ve/eHvR5nO/FjYokS/6toa5H5F
	 48NzV0r3IekMZRyUX3HkDE+OZoK0M+B0eudAcqCKP7YzvKhZhKLYXKwFw5/Y5tXCU8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SzMHivtY;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385AD606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 385AD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SzMHivtY
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so8412555e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792598975; x=1793203775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7vPTpyG25KHlbD48LUyUXAGxP+fU7yyx1dKZKZGXsY=;
        b=SzMHivtYzl9WEeITRjfux9Cu/BCfwpYinjhFZLBbmsxXxXavmD/STXYNYc2rwY/h5Q
         t90Q1RwdYIQ0uOfUAi9xLPg9zWFkdbHqr33dJrPdbd+NaWqTh9Pu16/FLr2fB8AKTRbX
         bk4TnhWi/MQZ0R2jtvqj5hmHWUUB1coY0e7mENxEH3CjzoeO9CcfQLEc1Rafk9pBF9ML
         4bT2meXKaTFCkXRbF9t/I/O+f9OwoZkduzaJh/YN/q57dIskFYEpufAfy42sx8nWUb6x
         X3dzjfXJCRtd2MYpriLbHjvkiH5MTkj1tf5uMEXKJ6CfkD8y4KMjHzD5gJIo7Wg4QFHZ
         a4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598975; x=1793203775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7vPTpyG25KHlbD48LUyUXAGxP+fU7yyx1dKZKZGXsY=;
        b=D/Z/suoSpSaPUL0npXeeUwQjBuFwmPYfHRU/ABxSoq2yZcp8bkavuJLGFjb8Wxfsld
         d6TchvEW2c/eLoIznQ8/QJyNqE4yj6S1MS+S/xUi8xaeT7Ry3N1Ir6bEuocDpwiA+z8x
         JuxRiF6lZVDecNB44/OY1xkhyIBPsHThSoBtmcxGVFuq0tDziebG7vW1n+ud5ZYPPBNc
         WE9DaOZRWuAah3h4UeFLXTLivCsh2aMs6Iefn5XgZKTFBVcjX/l6l8/nMK0QRmvvThD/
         h4+mF9UutVM+nw+m7r2imfVrKVaKeTyy7d8vb2ndm3Fn3BdiAeiq7VTSK9y+x+mO26Ba
         w4sw==
X-Forwarded-Encrypted: i=1; AKwUvBw3ioSCTcUcu5qyxKfjUTvktFYVlZvhnGtholtLoltJaVOw0iZesdg1shi3fMArEGSFjaEHwFlMlul9mjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYISBJWtoLbS5dUvcM8GpIofVYduZ2a1GoD97JQw9UOchM9+NH2r
	UA9Xku5+cvIPXOyz3eCvNUIv3iFLTp1jap59lrr/1X4rLJ215ofsEc/Z
X-Gm-Gg: AYBFou1E1HuHfILWoOTtkCKnJATmnNWoMC+sqhbrJeza7LRmUixolbq5YN7WK//B9AL
	czGpy1pu0AqtI0Gej0KvJH0yjlsRj8wCmV+x3Q6I2rm44nggiuvvU7NYYCIqZhUydW2qzQK4Y1N
	pUFg+Eab2gfZmrfPA5YxQ+Wl7gZ9xlDB5adctPmx4qpNZP9PsyLCRdznimbWEol2NP6z8GvI5g6
	2KErgtqBwxk5pOojAOBBcx9S9DWjumwovvyzb7Fs1l5Fzj1YOAk1fYBOvpHiId9K/AqIf1r3LBn
	I6dy6VhCvnSF3CTB4NkrKdFpsRD/ZRN1RXG3bn96S/IS5TmvhimCqW+K6Jvc++8fw/7FsJXttO+
	r65QzoCl+CON7PGxNOmDptVDQQhmwwBH82DbyAeIjFxKz7+wF5gCdSismEaGUVN5c+1Z4HoR9qQ
	Bhiw+Lu9w1+aGQkXXw3WEg29NC4h2VO10H1QExSW74YMljhS41qyG0MVSgzl1yoNpO7u/tz0FUp
	tA3Zd6DdcZ9Z9WZDl7SBR6bRsNnVrHIdh25NpSzoBxf79ZK5sIX3qtT6ogVO0t41v4NttfMl3bt
	/zOFQCpzoyT7RGk9uHeK3BNHawkpTjciCs/5NjgdDfb+kJ186jA18Qo/Cvp/
X-Received: by 2002:a05:600c:3b82:b0:4a0:108:3b48 with SMTP id 5b1f17b1804b1-4a1fdaf7464mr60190065e9.7.1792598975417;
        Wed, 21 Oct 2026 09:09:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e254f0bc2sm6226569f8f.1.2026.10.21.09.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:09:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] i2c: mt7621: fix copying uninitialized kernel stack with reduced page_len
Date: Wed, 21 Oct 2026 18:09:24 +0200
Message-ID: <20261021160925.286424-1-ansuelsmth@gmail.com>
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

When a page_len is less than 5 bytes in mtk_i2c_xfer, uninitialized kernel
stack data is copied and written to REG_SM0D1_REG. Equally on the read
part, an unnecessary read is done.

Guard these extra copy/write and read for the page_len to fix leaking
uninitialized stack memory.

Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 19dde7c4069e..b4d2f9c5514d 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -96,7 +96,8 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
 	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
-	if (i2c->have_scl_stretch)
+	/* Set SCL_STRETCH only for Mediatek SoC */
+	if (device_is_compatible(i2c->dev, "mediatek,mt7621-i2c"))
 		reg |= SM0CTL0_SCL_STRETCH;
 
 	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
@@ -302,9 +303,8 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/* Set SCL_STRETCH only for Mediatek SoC */
 	if (device_is_compatible(i2c->dev, "mediatek,mt7621-i2c"))
-		i2c->have_scl_stretch = true;
+		i2c->have_scl_stretch
 
 	adap = &i2c->adap;
 	adap->owner = THIS_MODULE;
-- 
2.55.0

