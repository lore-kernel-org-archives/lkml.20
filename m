Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA4A43B6CF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230613; cv=none; b=f8+wuvyA+L4KHV+6y0J36UDPA3mSJsgLBg0DzUEmkhEM+NdUp48ZIFGWAt+TU/jcaFf5AE/1FWkfY28DonEHrC09va3zIw8OqtswxL80fdsprp+nRyTa+1B/v/4vOJepjJ1MIXKlhAgnlNt0PYr6ZIgZeMT6U/ZBAV+yRT/xA8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230613; c=relaxed/simple;
	bh=cqO5wdf41P3hK1IhnT42rUiwwZX/0DHavJAVseXekoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rGAe6GuLIpJCmNhXmklxumgQFTtE41M0KY+resLMJcuRzJMiVdWH41r3JkRUx0YJ+YMISyHfvaGLrlprskLG8X6gCcoAjoVevIuAK7C3y3I3TTsoAQ923KwciptftC266rUVd07vjC4Py4BKIAwDcIPAmG2GBU2Co7K5jqFmx/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wutwx4I/; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wutwx4I/"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso4929046a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788230598; x=1788835398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aT/QRgr4ndYt36XthRqqu1FeBl0sSG8mE3kwTPAN3z8=;
        b=Wutwx4I/C/iWkDbSu5RHCDtj8U/gWaqvl5e2OcrhWUgSGnva4SPYuhUooDBG53YvpR
         SNCBqBIEyvzZVnZgbqLQSXKxYmcW+MTuiWT99xp7uzok3VFagqEoe0oCfLHoCTjLkJya
         noq44FggStUrdZi2wEAr74bKaHbrymCEdcC6KZ5W/poJuTvxEnswe8zviB66905XDuff
         JyrffL7YkNazvAesc1IgpOo05EzSzM5ukeGoVHbmtI3bT/j6IX5vTh2KlAe3MvO11IWj
         1GJvFMihwtIWZ2wjO2/MB9awYZ98v8SuJzjd6MEsbNag7EdT8E4ZqPEEy1Jji9CgcN/V
         LBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230598; x=1788835398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aT/QRgr4ndYt36XthRqqu1FeBl0sSG8mE3kwTPAN3z8=;
        b=dBoL7inW72FsXCQaQQW0fU/9WHKVm0mxGwqutuE+rsJcpLVWir7UI1S0VtRbK62f2x
         Kpgy69xZoOkgPiupZJTxUBjAei72u4d7RP4XjGoojnYJh9CUnNoABq44XRy+SxJkeXbQ
         rdZzhvkz0VYnqHJ2vUayDbJ+UrfQNUOFWoeNfYoU6fcKeRuDd/KWFE/ytd8h45LEOGbl
         7btHIAVPmliw85zyMVS5a1iIplv862TH4lQvggDEJmcvzAKt1mBdH9A2/GuN5fjyoD7J
         BwZd2D3fLEIick8JkQCwqk/kYIWqiyzTQkv+lkBcgwMJsHru4ExGZVFKiJy3nxsJNp2+
         iMRw==
X-Forwarded-Encrypted: i=1; AKwUvBwQH1+e8IU1dFjuDz+5jssM7xh7WHVOkQz+zImMbj+S/oUKHhJQOKWCpLBCArRhBhrQPEgZ+G/ww8czcXk=@vger.kernel.org
X-Gm-Message-State: AFuF++kgZrCDtrNMuSQ5pKG4Ktx0HcKI7mq9ooydkX6Xd4X1CNaw31cT
	FfKr4hueUR9I4MHnIK4You9XFZFeoYkNt9XgII2IyDaI9iaa+zR4rXxQxZrQj2g+
X-Gm-Gg: AYBFou1yUQ4IJiVriWKBqoPiS1aHYWg6GRkZm6jcbbSp/mJaZVhcvSEV6Z7PTBGum6D
	s+WTPW4IeAjY0S2nwNWEfemI7WpgWy5fqO3DymwAB81w+fltRah+NiwimqL6Lbd9dfZytmArB7G
	O6dmqLf7gF8mDLQFd/bQOAmR4E0fixQbckT7Q/4+llo68i8dJ1KVqUY+isc5AfJI/g52SHXhvIE
	JXQqDOymUtdJ8LsPydmbd1EY0vyPXFe0IFCUvUNokvF4Pk/x467c2zDm4DRhKInNhdTqeHxPPE3
	0gsltHTWtzWgHv2VqQPc2evmkME2aopwgwzXL3lrPtzT4PATqBKpzZfARosgaXL8PZD2ZB2rFwv
	K1NpvN01wqCnS8l/ATOLLcaZltkDMvFOv/PwUIEqz8Ts56dQ3UGAavlRV3VF2XRyUTHSDNRwPCw
	GEwY1hb//96MgIZLDNq4xEbCCC+2FlrQd0PCWX/yd21ZqSiUQtySIKQkWkgcwWA50+F98uqrusW
	bQYaDR0/w3j8eDC
X-Received: by 2002:a17:90b:4c52:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39907b66006mr6760084a91.2.1788230598432;
        Mon, 31 Aug 2026 19:43:18 -0700 (PDT)
Received: from kernel ([45.251.35.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e907fsm30366812eec.25.2026.08.31.19.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:43:18 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>,
	linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	jkoolstra@xs4all.nl,
	lkp@intel.com
Subject: [PATCH v2] crypto/amlogic: Use devm APIs for clock management
Date: Tue,  1 Sep 2026 08:12:52 +0530
Message-ID: <20260901024302.5407-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver currently gets the core clock and manually enables it using
clk_prepare_enable(). This requires matching calls to
clk_disable_unprepare() in the error paths and remove function.

Switch to devm_clk_get_enabled() instead. This lets the kernel handle
enabling and disabling the clock automatically, which allow us to drop
the manual cleanup code and keeps the probe function simple.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608310329.QgxCCMs1-lkp@intel.com/
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
Changes in v2:
- Dropped the devm_crypto_engine_alloc_init() change due to build
  failure reported by the kernel test robot.
- Kept the devm_clk_get_enabled() clock cleanup as the sole focus of
  this patch.
- Link to v1: https://lore.kernel.org/linux-crypto/20260821151303.8150-1-raizudeen.kerneldev@gmail.com/T/#u

 drivers/crypto/amlogic/amlogic-gxl-core.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 169c6eeb51e5..6f4c62ddaf89 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -243,10 +243,10 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (IS_ERR(mc->base))
 		return PTR_ERR(mc->base);
 
-	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
+	mc->busclk = devm_clk_get_enabled(&pdev->dev, "blkmv");
 	if (IS_ERR(mc->busclk)) {
 		err = PTR_ERR(mc->busclk);
-		dev_err(&pdev->dev, "Cannot get core clock err=%d\n", err);
+		dev_err(&pdev->dev, "Cannot get/enable core clock err=%d\n", err);
 		return err;
 	}
 
@@ -261,15 +261,9 @@ static int meson_crypto_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	err = clk_prepare_enable(mc->busclk);
-	if (err != 0) {
-		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
-		return err;
-	}
-
 	err = meson_allocate_chanlist(mc);
 	if (err)
-		goto error_flow;
+		return err;
 
 	err = meson_register_algs(mc);
 	if (err)
@@ -290,8 +284,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 error_alg:
 	meson_unregister_algs(mc);
 	meson_free_chanlist(mc, MAXFLOW - 1);
-error_flow:
-	clk_disable_unprepare(mc->busclk);
 	return err;
 }
 
@@ -306,8 +298,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	meson_unregister_algs(mc);
 
 	meson_free_chanlist(mc, MAXFLOW - 1);
-
-	clk_disable_unprepare(mc->busclk);
 }
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
-- 
2.53.0

