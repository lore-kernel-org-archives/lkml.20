Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792844076;
	b=XdEj82Ga2ZC0X1hoG9TBo+hY2yGmmgN1wzhvrTa8om5pAJBNkpQIzAvN0Wy92O7NF7Sr
	 7WhCGa2jzI4yqyR5yGVbgaBAhln6OA+7gc5XUz/orW0gBf11u7PLbwQaPzZ290M+Qf56w
	 BLbvUEjGquuKuYBHZ0PZnXfTyl7rkGJe+i44DdnXetTkhu94m/1YxAlgdznhH5DXTX8Dl
	 yndYIpLDbEy+Ki91sGny7PQYjoFWavYA7HyqLy2YPcayE+Xqlb4pqluY4utRiZ37GrGaV
	 RdQxeAxNQwFls+3CT+Ksij5gdvDpwB+X/Tjtdo2YO4taJId/abUux6mSsRGnu+Pz2nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792844076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3IjMPJb38YAf6cwqMCv7g254aUrxQzhzPP6hfN2i0bE=;
	b=z1z41sQxZJ3K/KTCI5ew85LgFxdJ3qpBakSJL7xEJTRF9tXvmmNznvIp+n6ETlBKY7PQ
	 fSr6F58Oc+j0kNBHcmL2rtwUyRGDOCNLNSril0vIfWE0wQk5jY6mh8t+ttyFvvONEqXmD
	 laSOXwi9SnMI00vfacomH14ntYNlPVXV6Dmf/fENcjPd6pm2GS907xxE+IURWsN1Vg1/A
	 1BmtUuePorxwC5y/1551MKsHKL/ukhgzPU4wY4NfXj8haKGrEZnqX1UOAyW44svKGciTs
	 6CbuEq8fxGIX5kLYEj+Y+pWXFRBKIHB9Fe+enmJFDpi+rzZghQk5eFdU6cUTF4np8RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lt49uhn3;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80426606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80426606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lt49uhn3
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afbd2c386so935647f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792844075; x=1793448875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3IjMPJb38YAf6cwqMCv7g254aUrxQzhzPP6hfN2i0bE=;
        b=lt49uhn37Z+8mdul7EfjiDo090a6ajh+wxBaz5Rp3prC/KjJJ1lAaS4MjTRk1ywb15
         AgkGRq8fcuLvbpFpxXRcpKF2ATtGUc53WIJkO+hsZaALVZWgi9Vl/xWu2+3Y5mkImdJP
         e7FDQz/rKIBCQyHFkbaI1ysgWaFIzr14S81L3Q0qH/0JtH+EJL58gsa1AmtKHl7sWzzf
         cbuCnEJXY/RfE7XHw9wpACIfLBir7kyHbj8kgQDnOeTvL/3a6JwspCAA81wTa984tcgC
         DzKdskByJp7wPAG0/DD4TNAq67mBlpCwa8Ln65/uhCM4bmjBM4x1mZLmVZ43/pWxSgCN
         hBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792844075; x=1793448875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3IjMPJb38YAf6cwqMCv7g254aUrxQzhzPP6hfN2i0bE=;
        b=qRBgFmhV69NM4SfIJQOE8MWIruS0SzVeE/Jb/SJsIeTfWcYGa6EEGX6Kf9Dg5NPj2l
         G4GH2x5qSJe0P8/DUtaBoHYopdALrJ8zwg6olpQci9PBNAjdOar4i8BfuUUtfgWXvflW
         v/A2MH69uu+coajG12h4ulzjX1JUM6HR4tyvS1uc/tTSC/vC7IQ1mBSr0Kme9Qgnxkrs
         pjBYGNSsliualABZcuxyjPb7PLplywi/0z2XqFhGo9Lqxp7+ni9Q18VUWVN8aeRUSrjB
         zI91FUZvJqHQqMbtCutep5ukPE18kyed6nlA9QVraepZp2xoosQ7ITSdnLKbP6pSZB9G
         wMXw==
X-Forwarded-Encrypted: i=1; AKwUvByztanTJ3GdSUlQrRYayqFB9w1hUoh87PesIfVvY9+JKyc6suA8rxFPIeM0Y2mx614Uj46I4HzGtXjD0uI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8KCS5FglK9TGL9A4jJ/wdGwFr5YOFi+aFIcND+ALPWTay60Ju
	FCLP0W24LuVHchPMruwQuCXZbqTCs5GXlSPfPCbYyrqcMvhFxqT1/AAJ
X-Gm-Gg: AYBFou3Vy4fgkShgC9xI76GltYVY5AW9xzvJ6pQP1ET5ec33swz3ZN9zeE4Zk9LRbNl
	PWjnd9CLpatq6/+JndsvAWaXrpKbe6IkIV5EKxfoFOQDfMSoPIIonawacaB+BoUt0IV3xEQY3X4
	Tc6V1zoKpwVhbxaznRJmyagKCQS8P034OuDgu43Xok3LFoNZH/EASieX6k3L7SQqfHdt0OdHOWs
	wImzvJc4CDloFWIH2/egeLZDkIUT4vQtvFqrC2XfslZHcIFQlf++mJqadYvzwtkSMrLnH9KVSPF
	jS46a5eBY64CWlj4z8Yl9Xg30vUWRRoc/S9kgs9MZbFHGeeFSUXlUbnbrh/ApXrThV9X+uhwEug
	98lcZPsXzSXk4T8Aag/09569Eq3WrSs4N3f7e/RuhEFJVYQvNTJ+aaUjmlOmL3eMtQOsG+469xV
	wbiS3g3N1dRVh3jAHRkNBEFRdLJle3lC8gYLQDVDDQLpy3+RTkNK77xfWuRsmyhdMGB8AQeRIHJ
	GLhOm1rrBY9E445UsKzf730TKYfpmQvQHoor3ZsFOxreTXJGNL9SKn7agwGLMBLWeuKsf+nbEWq
X-Received: by 2002:a05:6000:27c9:10b0:48c:4444:f0a2 with SMTP id ffacd0b85a97d-48e3eb247e3mr2009823f8f.7.1792844074714;
        Sat, 24 Oct 2026 05:14:34 -0700 (PDT)
Received: from NB-6746.. ([178.66.130.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece5e4asm3860411f8f.59.2026.10.24.05.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:14:34 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: tzungbi@kernel.org,
	linux@roeck-us.net,
	p.zabel@pengutronix.de,
	Sergey.Semin@baikalelectronics.ru,
	mika.westerberg@linux.intel.com,
	andi.shyti@kernel.org,
	iav@iav.lv
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	wim@linux-watchdog.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] watchdog: dw_wdt: use devm_reset_control_get_optional_shared_deasserted
Date: Sat, 24 Oct 2026 15:14:23 +0300
Message-ID: <20261024121428.18862-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024121428.18862-1-a.shimko.dev@gmail.com>
References: <y>
 <20261024121428.18862-1-a.shimko.dev@gmail.com>
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
 drivers/watchdog/dw_wdt.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 39031445d754..2cffe337b4ea 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -588,9 +588,9 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 	if (IS_ERR(dw_wdt->pclk))
 		return PTR_ERR(dw_wdt->pclk);
 
-	dw_wdt->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
+	dw_wdt->rst = devm_reset_control_get_optional_shared_deasserted(dev, NULL);
 	if (IS_ERR(dw_wdt->rst))
-		return PTR_ERR(dw_wdt->rst);
+		return dev_err_probe(dev, PTR_ERR(dw_wdt->rst), "failed to acquire reset\n");
 
 	/* Enable normal reset without pre-timeout by default. */
 	dw_wdt_update_mode(dw_wdt, DW_WDT_RMOD_RESET);
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

