Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794067679;
	b=Cq2ze3BkUBDrNJGD+p0fGE6Cp5oefxSGGyb4iYBuq9ltLEwCMOJNHCOGQiM1NM1IHV20
	 oYYX2PlxBPaWevFT30iqwFfq0eBV7r+QrWdQYjCQWJyDrsszIV+bYvAfMrdzqQjymShnU
	 ZNbO6Ih9BfbsWZYQzddar9qGllxgSOjlxtnokoN1QeMVhoEzg22Omh+CQgzBXtJ0LuWep
	 qCKP7VM7N4rWMztuaN2cKDfrhETU389+ccw23Jb5zzPkewexZk+VBTtSCE+lN13GDQr/B
	 muVDhcIcsTDJyiom3jsPG4IQiwP0nxb+ZlzT/jF3ipLnr6UvFGnPz0dkbhCTMY0EscQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w9ad/RtjHCJ7QFgHhoqC4kL6cny/ndwNqseOOI9y/+Q=;
	b=Bs129qZohZXIG1+w/8vfM/s0rR+xYzIjZsRROrM3dVII6cigjF6nfJPhONsirRiy2RVi
	 mGQNEFDw1xVAsTt/BVKWDukaU5F1ZSOhjjlIcavK1Ba+qc8G1IQ7Sf1+DVYeNUXLzGPRt
	 E++u0dVQxMkDsqqWRdRRpVri66plXgCtqMvVIr8okQR56NjmSr+8guEGgUVNgdTjsDICc
	 BxE4aFV03YanODGPuZ/DEgqWCtegLAHx/e/pQvsg7nKF4sO7J3HCJ/wd2P72B3a+/rGZg
	 YsWHZvYKuLLv63I96xLLJvZEp2mtl56EwYB6t7BFP+r+f+dPxoduQ4Duy5zP16Umc0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vPvdF6aA;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36CD606D82A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36CD606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vPvdF6aA
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1aefd1bf74aso507629c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794067678; x=1794672478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9ad/RtjHCJ7QFgHhoqC4kL6cny/ndwNqseOOI9y/+Q=;
        b=vPvdF6aAyOOGfXmtGZoL9hYy3XjlZTVFvFMW4LYLACarr2+XYknq2u4wzpWrixOJNS
         yMl+JagsDkAZ0AD7fiCRjB2X0DdfrJKvRvESGFGieQEWCouMREm0LHPbJ7QlWcpdcBNC
         /SZt4iusqNDs2ce1E8c/bc81OYjYYx/SBCc8WgtbKZa5YOp6c6Hj9o97zsB6ivPxDN7Z
         zeu28ZxlZpDHLeYyZKRKLFYHbvs+XOFlloKhX2fUFrLJRhVh1Z/T2930c550RWwmGXOi
         u0csKjzz2bOYTqs1PN8QzS/h0EuwnobtEr+2iPGF7Mn63y3nToz8U8E/aeFj0USlavUo
         7yWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794067678; x=1794672478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9ad/RtjHCJ7QFgHhoqC4kL6cny/ndwNqseOOI9y/+Q=;
        b=vUU7c6ii63WHQQnPM7bhJE7aBf5ey4anE9XCusKUcYqVUS+4zUwD0KZ9K0PGDbyg4U
         ehPKAcQaRmNqXfUSgch0yWeEJLdGKypKypHCXuyAstQBikoR31xrpnedQrC7nS/WBUXy
         CnT6JeNJ/eV6FixN5abBYqS6IfOc61pQn2wqcGYkSrhSSZ95yKjWfp6bHk5X8zr3PtEi
         HtGWazTP6UltMxXubj7LLAabuWjjGyrC0JEQXATflHrjpQxOQEz+k6LYKjIW2OdxaI4M
         J/dgJUD2I6Oz46g4lawdDYNLxqAghTFRtho5SZFDSrd8r/y+ujJWKB8sOBdRSG8jQTiN
         XwlA==
X-Forwarded-Encrypted: i=1; AKwUvByGPaju4Pown8ghjGmU2YLIb/tiM95kykUVBY/BIbA46NNLtQdRf5Ffa8JHbI+/iNc0f1Ch1ygLZ4SnHOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W7TgBb+CsckkOjoPBNHAzYvMiMQO98+Yf2W8T8y04cCiC/cGU
	pOw6a44uECywgvGNviiYPEFJ7bHJ82jj17zinbHVjuuCFCTQU+8dlh8q
X-Gm-Gg: AYBFou2QOjLrfQatxmLKERXWvQqDGsywnWiiYRFwa5ii7VNJtIMeaUO/Bk6N02Fylew
	Wkr5LNirf/Zin1CXuTuYAHC/RvBHAYsozYEh5nxQH8QNU5zhIMbxVdKEoxwwQfxHGel6K/+E7Bt
	9+1cedPWzbMYbAdeF918aBB1/SFk90qhZRdV16yaTDVxIcDHiW+MbyTJxL5XuUAlXj+x8AFiHJi
	08r8fGMqJrX/wSOryLo+Glsyj4jVVZs53Gk6jmbSRZQDT2sA6jnVqw4zWSpKd6jN9vvNUTKCRoh
	BFOOmOI1WHfeUBkmpGcsr3hyFoIMqSLPySd9XgBohdrWIqKZVMwonLgWvllgmnc25wnfUQKNoql
	ddArU4am6hpUJt3ZXAuuuyGZwIP18UJlrXiiKQZ+j/trLxfuudh9hrDz+mHRxZ29jo7hkVG1DCG
	o+pSrtxxYxDEmeYZa9beyYB5rSWlRo7nYKtVk6x9otQJypSfSyXNnQQgjRNSdWIMiyP6TDyhZ+P
	7HxvP0Bel0CzmCXloD42zii0QromQIc+ilbuev1guKSsfZHdx3hDf7E4LRMMbgQAsweSzz1bijJ
	PrXno6NrpesryUTcNZwv/YwSzmxMYTL75yeZGoTGVvboFkN9sB/v
X-Received: by 2002:a05:701b:4591:10b0:1b2:46ee:4cba with SMTP id a92af1059eb24-1b269b2154dmr3020374c88.18.1794067677587;
        Sat, 07 Nov 2026 08:07:57 -0800 (PST)
Received: from LAPTOP-LJ15R92N.localdomain ([49.43.7.28])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4fd2d6sm15683821c88.23.2026.11.07.08.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:07:57 -0800 (PST)
From: Akshat Rawat <akshatrawat095@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Akshat Rawat <akshatrawat095@gmail.com>
Subject: [PATCH] rtc: as3722: check return value of platform_get_irq()
Date: Sat,  7 Nov 2026 16:08:39 +0000
Message-ID: <20261107160839.422-1-akshatrawat095@gmail.com>
X-Mailer: git-send-email 2.53.0
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

In as3722_rtc_probe(), the return value of platform_get_irq() is
assigned to as3722_rtc->alarm_irq without error checking.

If platform_get_irq() fails (such as returning -EPROBE_DEFER when the
parent interrupt controller is not yet ready), the driver logs an
invalid IRQ number in dev_info() and calls devm_request_threaded_irq()
with a negative value. This causes devm_request_threaded_irq() to fail
with -EINVAL and abort probe permanently, breaking deferred probing.

Check the return value of platform_get_irq() and return immediately on
failure to properly propagate errors.

Fixes: b45062619840 ("drivers/rtc/rtc-as3722: add RTC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Akshat Rawat <akshatrawat095@gmail.com>
---
 drivers/rtc/rtc-as3722.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-as3722.c b/drivers/rtc/rtc-as3722.c
index 9682d6457b7f..dfa3628ad95b 100644
--- a/drivers/rtc/rtc-as3722.c
+++ b/drivers/rtc/rtc-as3722.c
@@ -198,6 +198,9 @@ static int as3722_rtc_probe(struct platform_device *pdev)
 	}
 
 	as3722_rtc->alarm_irq = platform_get_irq(pdev, 0);
+	if (as3722_rtc->alarm_irq < 0)
+		return as3722_rtc->alarm_irq;
+
 	dev_info(&pdev->dev, "RTC interrupt %d\n", as3722_rtc->alarm_irq);
 
 	ret = devm_request_threaded_irq(&pdev->dev, as3722_rtc->alarm_irq, NULL,
-- 
2.56.0.windows.4

