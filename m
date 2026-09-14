Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B54F418343
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376178; cv=none; b=Poe6h6w7EPiWKLGirascEdURnVtbB1gIb8tPwoe2xo3PFPRunK7FygiqclWl4oYyFoPLBu3c71hnl3cSODWK92lXYPlT4Ii5O3L1tIviVx80BoZKy8FAlO9OlskhOXkmMyhQPFR0l8kxsubY0MfHLbkd2MhAJSGkXZlrJBaljek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376178; c=relaxed/simple;
	bh=y7LKP0hPBt0w9rE1pUDYU13Xz7kCbBtwcqXAb5/KS50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YrZW6IWR2b598h+tG3rhu1nnllOcQDQjVBN9aEjhQdExYoFAn/dyuYFc4NXO2lSOUagD+Ga1iWZzwzgqR0TBIKEPdrplwrg2WOkNTMiQsmg2O4x7wXRldAVD2E4Hht5f/Ol1wyNzjyvrb9E7TmFuZdeKNuFK/Yb2C/rRuDG8+j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMh4ioFt; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMh4ioFt"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f9bso18660135ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376169; x=1789980969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QrzJJYdH2i3lLZDFeZVpijQjrI6XyK+8ogP7QUaZAPQ=;
        b=mMh4ioFt0v1P6p1d61k7esv8H1fVx82d8PC1xNjsnDsL0UJeD2MlXGGGLMDiolY6h+
         h9R9ewF9TFBKWdDdKhmHldsdvMJ5Qz8LUAiL3zWG8xyvIgVAomuypNXc3XVJXtFPo05Q
         Qx4UZTHbY/RJniPHbhc6jKMBqJDLL+3XWk7PIa3wU9vVAEYndltW7U4+EMNCdsIWLsap
         RwsfCdvxSkTa4fJI4/FC/si7hfGe4Ddwpj4CX7Kx2kWNLsQtj2ITLzz/35Cq8X885DsA
         hkyqo0AoknfLh75jbAj3NWflPtqL3PX6hXMk2BjCjJxnECMmyStBAUrc6W645/LIhXLX
         cpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376169; x=1789980969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QrzJJYdH2i3lLZDFeZVpijQjrI6XyK+8ogP7QUaZAPQ=;
        b=C0AVqHWPKs10DtHha/pRVZGA4qUz5S7ngLIKqft0enjg5rcOP5jMSxTkqoRaBmrwNU
         i5+8DGCLdvZ1IwdD+GLPhVgLcVa5sn8IQiawUvdGVzl+bakG5v3lYdI2RPxCmI+1ahOf
         O4LL+tnEhgfNa83+Ts+al6Xq0PJB0kMyjHSb5BO2XU3qZ6EeJa7DLUU72ndpa/0BCBD3
         i6+dJ36ugfQUJO0bK6HPV+6OTRVRzT3WTgTkNU34hVkVt+K50PXU2EvWM1b+0AGmlS/7
         11SyRGQF7W4S6BF7DRKBJg82CVc+cUxOy9P6KMHF1QSffmuNe2Odi2CCWEyH1BIdBPkf
         ijZA==
X-Gm-Message-State: AFuF++l/Ce5KQdWOcYswFGN9AxcBLPA9HCjr4RKxrxWA5msfMeYiwm/k
	cvGaWjLRpv2NsvqVy8dCUGmCz+hO+AhS/BCsSA9XwoU0qjqj3OulsiJ04Omsi/w=
X-Gm-Gg: AYBFou3WCrtoDlEvD/LOWXANx18gXvu3T65wW8rXMN4YjEwCjYjovBzCSo58/qahpmX
	+VRznVEFWT/fyQfCgG5kNSkQo72ptjm6OFrDTEi4b6Y1hK5RbXlM6wVxDaet1olC3hmLX5iX6ag
	mtkZ2UtbKSMa/GBsKY/1PWM5yn/cPsW8BNBURbpon9grg/kv7JJy885/YF1e++hotRJNnvppHTV
	GWTAUY94HaVVygvoUZoXoqfMxoFWTsY8XM+BOKkdbHUAlMQQYv1m7WQAy0ZI/NOZ30JWwXI//0L
	nGdB1Qdhghf29VjXjSpDY83wRVc6pQlba9D6vrBiPcFXccYM1YaUPFM+zeL9IZKJiotB+Q2s8cN
	xB9LuqxMgf6Lis7KbfELQ9UV/lj2/udLU3QnSR10SUq1AoNkMnRKSSl+nzhCuN2vGyWfwlo6SRf
	+lAxgRnpEwwloeUnyduqStArk6+AOExS9+DE/gtSBUm9DRv1bBLb7dSzIf+6iZDlPBKKkoSc4ZU
	FkpWFZkdxOoDdXufyriqd/4
X-Received: by 2002:a17:902:d4c8:b0:2d8:d4cc:be65 with SMTP id d9443c01a7336-2dd6c713ce4mr30781575ad.18.1789376169491;
        Mon, 14 Sep 2026 01:56:09 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfd8c84sm44569105ad.62.2026.09.14.01.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:56:09 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: linux@roeck-us.net,
	tzungbi@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	triet.hoang.dev@gmail.com,
	wim@linux-watchdog.org
Subject: [PATCH v2 6/8] watchdog: pm8916_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Mon, 14 Sep 2026 15:54:49 +0700
Message-ID: <20260914085451.891675-7-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914085451.891675-1-triet.hoang.dev@gmail.com>
References: <20260914085451.891675-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert deprecated SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS()
and pm_ptr().

This lets us drop the __maybe_unused annotations from the resume callback.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/watchdog/pm8916_wdt.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
index 007ed139ab96..b97c132de321 100644
--- a/drivers/watchdog/pm8916_wdt.c
+++ b/drivers/watchdog/pm8916_wdt.c
@@ -233,7 +233,7 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, &wdt->wdev);
 }
 
-static int __maybe_unused pm8916_wdt_suspend(struct device *dev)
+static int pm8916_wdt_suspend(struct device *dev)
 {
 	struct pm8916_wdt *wdt = dev_get_drvdata(dev);
 
@@ -243,7 +243,7 @@ static int __maybe_unused pm8916_wdt_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused pm8916_wdt_resume(struct device *dev)
+static int pm8916_wdt_resume(struct device *dev)
 {
 	struct pm8916_wdt *wdt = dev_get_drvdata(dev);
 
@@ -253,8 +253,7 @@ static int __maybe_unused pm8916_wdt_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pm8916_wdt_pm_ops, pm8916_wdt_suspend,
-			 pm8916_wdt_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pm8916_wdt_pm_ops, pm8916_wdt_suspend, pm8916_wdt_resume);
 
 static const struct of_device_id pm8916_wdt_id_table[] = {
 	{ .compatible = "qcom,pm8916-wdt" },
@@ -267,7 +266,7 @@ static struct platform_driver pm8916_wdt_driver = {
 	.driver = {
 		.name = "pm8916-wdt",
 		.of_match_table = pm8916_wdt_id_table,
-		.pm = &pm8916_wdt_pm_ops,
+		.pm = pm_ptr(&pm8916_wdt_pm_ops),
 	},
 };
 module_platform_driver(pm8916_wdt_driver);
-- 
2.53.0

