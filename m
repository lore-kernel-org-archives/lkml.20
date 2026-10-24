Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792850945;
	b=zroejrBvY0K7iSJ4HJX/Gw44M5BObC5TrrYfrz0t1OIn8H3F3Fh1Nttjp68LFSdUNorl
	 60lt4anr8VFRWs4AhKnplX0De1q0qSfLcKakWu0eYJrnCwkkLKazwF2e5wqzfz4B/2TTd
	 preTP6oyq/QRjKQo5+ghEETXif0Y9ykq2vHfSYWpcfduyjUXzNWvY8GVhO4Up+IHR9kj3
	 +qCketGCW6xTK5Y8aJZYlXniQQglDs4nLdvU6jW663RmExoIvYhWgIsBOyc3gVXkARBvi
	 +KMg146t4S2SDwUZ0//L4YYaOuMsUw5icS0Qytie9jHjlCWbrOZh9/GK18NLpR9Hz/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792850945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MReo9dgk32myyGMu+6Miwtx+eR0PfmE9SoBWi9y9wmc=;
	b=kcPHPsObvrY/ooq9IbhU/z13J+NRY2uOM/VO0yRsHwhKSUS3wBn44rkWm8qKhiJtDt2n
	 6At2pzi9oXfRDdl9a44+cfFNvoE4kblEByT9QOwmG4wbSk6g1AV4CzpzfJc57l+/10HCo
	 ITRMOOSmc8dK9i4LRMyxDHjVniFR1CJHZkMqL59Y6VesZ07aHUOj4RMDS1wBi1FGF6pyQ
	 yZBYvMmjXLXQjAz/qcJ9mV4f3bI1hD8Lg51YINt6P+MPvC6LcQ6red5dt/6mNb1FFt93c
	 O/hb3H49mUfCPthkoh6BSe9kglJ1euxiyeTiX6zrVzSMdeBgkToRYFHcszvt2BxJNng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="lrL0/RjN";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C264F606A323
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C264F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lrL0/RjN
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so17817425e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792850943; x=1793455743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MReo9dgk32myyGMu+6Miwtx+eR0PfmE9SoBWi9y9wmc=;
        b=lrL0/RjN4wg+cpui6nIWyPyq3Nkq2Myz8HlQH+782TnUvIqh+wRCDJru0uREYSnKUq
         lxOhzSM1wtVLh0BAI2M90yYd3KXIM4KuPKJ75SiOKoXZK72TAN3D9hoyiZXOfZvDHFyc
         Grkell2Y7xtempELYXyWI1JgjUBtFNieWRx+exo+FsE3AHozPOmSa2gIrDZb21ER5trs
         Zvpm0cfPvgPmC+qbb+mCbKg7Kq4OKRAiwSCJYrw0jzlFSjcXkdu1w9Ov4NKVM8IKoeHw
         saX/BwataPq9D/A8xbiutymVToFPyjKpKBrdzNDX+rJgMVcvWcF5wtjSX3hqY8mxeTlg
         h7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792850943; x=1793455743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MReo9dgk32myyGMu+6Miwtx+eR0PfmE9SoBWi9y9wmc=;
        b=2P2QVV2Nurrrlj++t/yHdyj9P3crJW86s2dMUTsnD1ngnhbLvrfVdJu5c03F4ehfCQ
         pPjuHzpRgCbqy/y1Ojh1vg4ytrSOxPz7ndMIuL7RjVEdidoeCG+5ZtBpLUNhBy8V4GDU
         z7ceq/0HHgWqvySt/hmkWEvYgzN0Zsv8tCa2dxt1UB9DDmoUIlEr4/edqFJTdWCvmvmO
         O8wG0qJpo3URlYQ9RuFZomFJmUur1f9AhlxoIIBbiCNDs7ko7DELKRNRfTy8arFeurM+
         LIG2675L1dDykksfJ756C5StH5HqlpcWd0ZoAEdcISNkAMx0Jz0gpHLrPAZK8emOHQl4
         6Szg==
X-Forwarded-Encrypted: i=1; AKwUvBwIPR0AZSLzx9aZvmkPZyQMsEEIf62DN3HW90QfMfp5XSqaI2ow/IJ9AqxkqCEnpfjy4povMxnvuucbBhg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIu5rawkiREMryw+NwJWG1wooJRwTs5Tshah8kh/jF+8kRGVBv1
	natKsXC3UEBwO32PWWs+bO7rUgXNRW1BgYaO4e7BrM6JwNnE+AtF0m1S
X-Gm-Gg: AYBFou22pzogTcsmaVZRbKrkWAfsg5HCUJGJ8L7HHE0KBnwCCMDDV3CbdFM9LWJa/sz
	DsPQzsN2Y9KQ1BtP3UMgWdB2/utO+i736JQ8qNI7OU7DQCNypZc0v45WPpvYLW/GwZL3eFhsJyA
	orurrn8anHcSn6poRk0SBvFkjumNFTqKZSWkqBijjNkNeMYubxIDNcRNXROFaYkZnR+/2/02Dkg
	DQo9Lb7wUeUCKpRH8pkMDYLRIm2ajn8ZLLOv+HTuZuWGlCzPuCxWdgD2KDoHy3ZNDAfPjnOgoYt
	4dg32eMDJKTYTka4gxC+UH/FHmUsZEt7EHSsHnEwtsRoIKo0SXAxmBtaGNja+G2wVwiRocpFsPo
	bpXDGTUANQ2pgjV82NGqYRBJZkCpjUUxYFuiSmQQRy/dDM0pBSYqxOdh/wfgnOSWCC17p1p3uRn
	exGMzHsX0CR+jdee8FwpqC1Yi5qEUgpmJBts7PTNK+9vBYVFKgsuEZs3YduNfhwpThR5CzENvvD
	J8hhPajYFf0L/jg3Mwy01m9CmpMSBHDGl+az5cmQ1QdZDLNo/cbSAEPBf9vKZwdi/tjGXWOVCc8
X-Received: by 2002:a05:600c:630f:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4a35ae9e071mr33734455e9.12.1792850943100;
        Sat, 24 Oct 2026 07:09:03 -0700 (PDT)
Received: from NB-6746.. ([178.66.130.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08643dsm46716525e9.4.2026.10.24.07.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 07:09:02 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: linux@roeck-us.net,
	p.zabel@pengutronix.de,
	Sergey.Semin@baikalelectronics.ru,
	mika.westerberg@linux.intel.com,
	andi.shyti@kernel.org,
	iav@iav.lv,
	tzungbi@kernel.org
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	wim@linux-watchdog.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] watchdog: dw_wdt: use devm_reset_control_get_optional_shared_deasserted
Date: Sat, 24 Oct 2026 17:08:50 +0300
Message-ID: <20261024140854.25664-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024140854.25664-1-a.shimko.dev@gmail.com>
References: <20261024140854.25664-1-a.shimko.dev@gmail.com>
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

Replace devm_reset_control_get_optional_shared() with
devm_reset_control_get_optional_shared_deasserted() to let the
device-managed API handle reset line deassertion and assertion
automatically.

The driver currently manages the reset control manually: it calls
reset_control_deassert() during probe and reset_control_assert() in
error paths and remove. This is error-prone and requires explicit
cleanup in multiple places.

Switching to the _deasserted variant deasserts the reset line on
acquisition and asserts it again when the device is removed, which
allows removing the out_assert_rst label along with the related
assertions in the probe error paths and in dw_wdt_drv_remove().

Tested-by: Igor Velkov <iav@iav.lv>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/watchdog/dw_wdt.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 39031445d754..ebd27ee684d1 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -588,7 +588,7 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 	if (IS_ERR(dw_wdt->pclk))
 		return PTR_ERR(dw_wdt->pclk);
 
-	dw_wdt->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
+	dw_wdt->rst = devm_reset_control_get_optional_shared_deasserted(dev, NULL);
 	if (IS_ERR(dw_wdt->rst))
 		return PTR_ERR(dw_wdt->rst);
 
@@ -617,11 +617,9 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 		dw_wdt->wdd.info = &dw_wdt_ident;
 	}
 
-	reset_control_deassert(dw_wdt->rst);
-
 	ret = dw_wdt_init_timeouts(dw_wdt, dev);
 	if (ret)
-		goto out_assert_rst;
+		return ret;
 
 	wdd = &dw_wdt->wdd;
 	wdd->ops = &dw_wdt_ops;
@@ -655,15 +653,11 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 
 	ret = watchdog_register_device(wdd);
 	if (ret)
-		goto out_assert_rst;
+		return ret;
 
 	dw_wdt_dbgfs_init(dw_wdt);
 
 	return 0;
-
-out_assert_rst:
-	reset_control_assert(dw_wdt->rst);
-	return ret;
 }
 
 static void dw_wdt_drv_remove(struct platform_device *pdev)
@@ -673,7 +667,6 @@ static void dw_wdt_drv_remove(struct platform_device *pdev)
 	dw_wdt_dbgfs_clear(dw_wdt);
 
 	watchdog_unregister_device(&dw_wdt->wdd);
-	reset_control_assert(dw_wdt->rst);
 }
 
 #ifdef CONFIG_OF
-- 
2.43.0

