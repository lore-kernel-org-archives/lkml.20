Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347749;
	b=Vjj5SHEOUZodZS7JnFvgAcXtU2VeHSLBKZqtzUp2eixjhPy6Bnz4H02bSJMEAFk0Tdll
	 0PNZgtQWmnFIqERmhgFkn3bF4q0Bqq9Dm8Arp85q/iKVvTSyNWx292sXLYq3QHQaFXC6i
	 4q9fjJnh3qqYvota5iA4uADU3uGuvwCdQwvJJzd+fLVsJ62rW18JuHEGr8A4r/LvNjzQl
	 GZe+htMc39YXRceFFBhHzW8djjeueGnWILX+8EZNyQFGS3xjc3/GkLpAy10tLeuIbJbcf
	 v798P/QEbtM8h1jGUnvSHncqC84FzDw4L7yXFD8jnBT42TYraJDF6ajWoENuwhYK1Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=7+a66nuJAxZv2NLoN6sl/H/HIeT9eO6TiCDIQQ0skPA=;
	b=2QQbWmjm1ixaD9j9mX6esMko0dokCG4+iGHxIUG+iY71TJbOuQq/0u0hSayBbwWSgE/s
	 BCVmypfKx2oFCJfRKR2B3svpIFhrNbK8PDzwQPy9qGVL69HhGqchg56AdyUc0UArFfPf8
	 CfrrbkTXIF0LBudDHI7X03AqhQRBUq2jTX7eC4x2xaGE7c9pW53vRxryzZ3qSLB6+qNPT
	 Q+0McnFwpoOxng6XxKwMeoAl5ljBAht4fmWbQ4zX0i3kVzJ5k3yCUu7FPbV7gewgVmKeN
	 fxzALpPr3beCYnMaT7lUUWmMCRuaYH5NKR/dxd5RVyEximTi0Qk9m2GtVXVtwPjzSgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CJQUmfX4;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A23F60A2603
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A23F60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CJQUmfX4
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1699620f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347747; x=1794952547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+a66nuJAxZv2NLoN6sl/H/HIeT9eO6TiCDIQQ0skPA=;
        b=CJQUmfX4HgORtcCL0l1vBCCbdMVDDPl5n7ClCUA/8kCi7wcR3fYpWpcMLAgkq4o2ue
         ZNbQqVOkxN+GrxPiYtdOA28LcVFSFB/wFKtqRJBtL14UZFOjuqdqbQ8p/NrZ7s0GFuWb
         0UBys49XL/66p5gO1+ccyGVUnCcC7NG1dG07fDq/f/ZlkhZzjUOb7tBv7aYm3+EgfhGJ
         xgtvus3ygtnU38aCKQrJgFsjgnct3NGKZSHC/anN2yIU4NctBtWRIYYcBe3oTdcdIoQh
         hAn2+XH349Stq+N3ScKQVERhQ6k8yjlgGvuqj6keD4ZTZ+lqTPmCMpZx1T8NOz5/OdUV
         9JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347747; x=1794952547;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+a66nuJAxZv2NLoN6sl/H/HIeT9eO6TiCDIQQ0skPA=;
        b=Tk7Zx0pdjiX/0TYXgzfAnpJm3aP8V+eYnH0FFFVUURXLJ3Lh9Ovkav1f/orZ1WJEmg
         /w6H1DP3hzvfTJLHYWBc7GOUzXFvtRPRKkcHDk5osb4VrvOh9lJudXZDP25/4msHwSpJ
         eU513ziCr8kxUdmzMlUgk5HYuEvbzwTRpOyivsMSOpEwuRVOHvMsWRNzRnleCw2gZY1V
         038/5nf1RwxiYjf65SA681pD4wggGFKIjA5Rp5xI8Muis/oqoIdjLaD80YfIL29T5gDD
         YB6ZkR2Sf2OXoZryQs/GjnWBbqiXeLtVenbtMMDe0t7Rz8MHe5+qhAvrEgSFpityRGJo
         MdUw==
X-Forwarded-Encrypted: i=1; AL+hErGOGMkEe8QV1O0VbeILfFCBguvzTCXLIhaibB860t3wxLb+XRSyxAn/mSg0SOTOgki8laiPnSvbM3dRn6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z97s96mSrxavDsYaZ+Ow0ldMJwoIb9klrZurC3VkllbMRceT4Hu
	NhzTidu12EgPUbW6ROoroJvP3AdpjhMGKJPQ0dRqFZPBO4Jhxu76gbw8THKsgtONBCY=
X-Gm-Gg: AYBFou2vlRKwNM7rJjjMwzEaA+DZp6qJoj8X5e9sYKl3XpuY2LmQuiQFrkMUKhA2NfZ
	rALyJaOMp1mXptBg3LfY9al59leuePFP0BJXPm/Iu+nJfPlx61R7M9nyo2buG+h0kGdkN8axyRn
	J5Q0VW9+yPieIlpVTKg9zlOw1WFpjFo1jjjUq/5/JV/rxpr2D1EVsxFtTmGUp8paGD3o7V7AQxl
	gpY5vY3zTyuqTJcBbbyBK78nRUZQgJftgMprk0I/eM0XLNzFodj0IC/70ecDr7b3l1xqYAmtdgZ
	wm1BKCCw133EfIUZdXFsUN1fmnX+shj4RqzqiOJDU2qJ9emAR6hyva1slwZep4mLxRcJDw5wqER
	1pcSYlqZxvmoW7BmgapjKMwLlBROm81jzB7QzHJdAYyZeDbNQOuzV72i65/GeHKtthwgYS3+Zf0
	xIhzCGdbv1rL3FtlhbIWC9lFKSn2pLyesepIXdW8SqtewjEoFQ1thvJqkZxs2BbI6FxIzm6K3nT
	wRJztl9YoANwkECrDaN8uE0Gf+eHkUIiW2zDd3vrYsUSse6oXKonAoWjvVRq9KxPMQett9g5CWi
	5/fMt2kEne2LY/s48bV5712jzH3PAjNybA==
X-Received: by 2002:a05:6000:22c4:b0:488:823d:5086 with SMTP id ffacd0b85a97d-499c096bfd5mr530611f8f.0.1794347747383;
        Tue, 10 Nov 2026 13:55:47 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49835d2c05dsm7160201f8f.25.2026.11.10.13.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:55:46 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 01/20] mfd: bcm2835-pm: Remove member of struct bcm2835_pm that is only used locally
Date: Tue, 10 Nov 2026 22:54:26 +0100
Message-ID:  <6b2500112538be613480d472090e5ff6d86339bd.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2398; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=BVhRr6erYdr3wFkjbzEJs89tzl+sRAbty1vb11mdCc8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KVWt+3x735zZE7d3XsVM+Ir1QvYkRsw/GQV AkuwK9+YrKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSlQAKCRCPgPtYfRL+ TsCYB/wKlHgDWs9WbgfoPzex63S+2tugmXVK7KqaQrfxk+uogoRgx22NJCTuQEza5JqZNvFsSs0 twOEXeOfgMREGY4+lHrUyYjk7kC0P4zIhVYdO835/BF9lK1Pdc3PMKVkwdnujeRur1xT5BCwfdk mtghQTqpD6Cb0GDwB/4n4QwirZZGZAsccX6I3WrkOuvibweAhGBy96Vf8U0e1WKnNl37Ou2m4/K Zbl5MJiV13Dvajw2inFrhe0wwMSC0kpa4ImetQsXmxRV00fR8NnvYNncgOZxckNxwfu39q7tXB4 pk2tgDKioZu9PFekQy7YjE0QtRZvqBa1SoD/LDTV411HWeNo
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

struct bcm2835_pm::soc is only used in bcm2835_pm_probe() and thus can be
replaced by a local variable.

With that change enum bcm2835_soc is only used in the mfd core driver and
so the definition can move there.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/bcm2835-pm.c       | 11 +++++++++--
 include/linux/mfd/bcm2835-pm.h |  7 -------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
index 9e8e3dcf4bce..87de35075419 100644
--- a/drivers/mfd/bcm2835-pm.c
+++ b/drivers/mfd/bcm2835-pm.c
@@ -69,10 +69,17 @@ static int bcm2835_pm_get_pdata(struct platform_device *pdev,
 	return 0;
 }
 
+enum bcm2835_soc {
+	BCM2835_PM_SOC_BCM2835,
+	BCM2835_PM_SOC_BCM2711,
+	BCM2835_PM_SOC_BCM2712,
+};
+
 static int bcm2835_pm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct bcm2835_pm *pm;
+	enum bcm2835_soc soc;
 	int ret;
 
 	pm = devm_kzalloc(dev, sizeof(*pm), GFP_KERNEL);
@@ -81,7 +88,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pm);
 
 	pm->dev = dev;
-	pm->soc = (uintptr_t)device_get_match_data(dev);
+	soc = (uintptr_t)device_get_match_data(dev);
 
 	ret = bcm2835_pm_get_pdata(pdev, pm);
 	if (ret)
@@ -98,7 +105,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	 * bcm2835-pm binding as the key for whether we can reference
 	 * the full PM register range and support power domains.
 	 */
-	if (pm->asb || pm->soc == BCM2835_PM_SOC_BCM2712)
+	if (pm->asb || soc == BCM2835_PM_SOC_BCM2712)
 		return devm_mfd_add_devices(dev, -1, bcm2835_power_devs,
 					    ARRAY_SIZE(bcm2835_power_devs),
 					    NULL, 0, NULL);
diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index d2e17ab1dbfc..f70a810c55f7 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -5,18 +5,11 @@
 
 #include <linux/regmap.h>
 
-enum bcm2835_soc {
-	BCM2835_PM_SOC_BCM2835,
-	BCM2835_PM_SOC_BCM2711,
-	BCM2835_PM_SOC_BCM2712,
-};
-
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
 	void __iomem *asb;
 	void __iomem *rpivid_asb;
-	enum bcm2835_soc soc;
 };
 
 #endif /* BCM2835_MFD_PM_H */
-- 
2.56.0.rc1

