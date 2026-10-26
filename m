Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032182;
	b=pqR34gX0ZT+j/SqMCFv4ksSPU8vq+wDcWjnAK5uK57wJ2v4kmkCgDzaQIunEwh/EDCrr
	 QnqGr/MybMhBJxJhJeoslDsVLn79fp0eqUIghCPlUFEYsvZrg0ox121khI1iNn2aX6NE4
	 u7GtJOvjJN0ComBijNIjO/G0eOI38qfj6boYEC12U8XEh1eQo0N4MBLIhMLKacaHfAJ8t
	 wtzRYvHyy7szKBZulJmrh5TdFZpOrOXNn2FauOnQ/PfGUKHlhHWIeYXQqkiH9OtzuhwvU
	 5daydCzUcvPwgiDQ3mqxUvt30QQkmVrqyaIe7JtczF6LfWcMR8bLU2cvHS1AW8uyNrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=wqr2oHyh/WvkzMJU46Zu/Kg3r7Hga2odINRQa1fGeMI=;
	b=a03zQ2wcagwfEkjA55bjTtvLWPSDx7TJq7QFgaM5Aal8LnAr046kFPeM4s7da/9Wbyqi
	 BADosRTD/HSSuFP33yEFwRU5An875ejkqLunsKw26qICuL5rAC/OJqCGzFkTSKm8JHf94
	 WATKoiDdhyO/+nU3wOhKgDZ0TbEBuMQlEWQ3aMueFm1sMFmf7EyHfmKcAgPvO/uoEnZPv
	 OBoQS4nFn64IP6Wh88rcirOhtWfIZ8W5+f0YSfx0T80xAXI/0OUrYlvZ7IFd0Bm7l2PcP
	 SFCNoeu7LlbUTFQegsjhChKrj/kENRQt2Ck19rtjTzbAnTSflMfSRJtNd3F86JXYobQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oP2cnKvH;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F3E60A2622
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F3E60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oP2cnKvH
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so11684205e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032167; x=1793636967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqr2oHyh/WvkzMJU46Zu/Kg3r7Hga2odINRQa1fGeMI=;
        b=oP2cnKvHsgOa9ZR0+SLbt97VPWG4QPO9CUXDmVGNdTezfhLgNKqd2sAoMFI5fK3fwo
         vvsWp12hG5Vb6dB8NstqBJP+ROHKPUACHlIxQnD1POz29dE5rJQX+NKbIyqPYar2y6tN
         gnNwT6AEBbK9vWTBpEvnW7cU2eFiMlBAruEdbv4rfRKfNZDR1vDEQ7JU6W8m4JSNA8Kt
         kO/Nma8DAUspWGLSsZ98nfGe4krtqyfn8jF41eI6seyuOZgU77B9OHJy2/rrVhzZUwCU
         rjPMYVmafhyir8Uzywo9+UPr0fXYk1ImVuCN2Q1PcEr7rWsIfqP1Z/uheD248NVSJhx/
         hAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032167; x=1793636967;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqr2oHyh/WvkzMJU46Zu/Kg3r7Hga2odINRQa1fGeMI=;
        b=tgEkbQ1QpdRSw4Uc+dfMGYCZvAFuq8XASy3iSmqqFicMs8LRpgCyPNCmgZRaWahgvG
         yZQwJ8lBFY5rlkJk/bqlpQoeHRJxcYfZG+2UTMdq5HghOtxWdgHwrE6/WEjDc0wpADjV
         Brt0gvbliJtbrhh2KCb6rSK2zUJAuB7CqLrn/ahhUa+8wSbSyGsTi1QRzpNveLLg1hir
         9H9YgqG7Yu5KWb1YA2IZn/RHtW2dM36g7aEYe9A8h5UZq7TBOkq2gAQLWeJa9CWsr+gV
         SU9wvi/tS1ekkpd6/0JzMKUpymP3bg28c4EvJsU8ZXT/HqPYasAwhj9bo58AUzJZZZad
         ra0g==
X-Forwarded-Encrypted: i=1; AKwUvByqvmD1doBAryyKXO3VHfOJie1JG3x5kqmy2BHPmYIHW+2xj4CFxziqnqlOCTG1mxHtTaw8nLf/XtZr2w4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgZo8xrxaKoGGB/H2CtaAYduVUvChyMOpp5VRdgFgC0pr5gEzk
	B2s7ePjWXtcrZW2eigWia4EeTjsrwEQ8y9a+qlpmDkNo7WICZNUIP6CwqnzlLwTReDs=
X-Gm-Gg: AYBFou2vMc3Du5LHbt008uiwTCNumeVecZgDty9DWOUUEsUc3+Gqtt2uChHHXtpGJZ0
	+f7kLvSsKJSmKuELRU82DHe8uoGGKHTDKsE+7dC2QRAjK6FHYuTTpu0D2pgpbMrwt6RsDRc8LAp
	WNycNOc7Z/Bxs0mEUn+i4mj/A9ly0XxU3LjApk0yxK2ypBeVoVS8IWr/mwe+Tqz1QfgaouhyCqN
	yv6z6VEmfoIWuTRPNo8j83fdG75+a/SMWXkvuiBbCiigc3ElmuARqIROalxXGbnwO7anozzhDNY
	FUdJJLBu34+34nbAcaNnvOZOcLCRsYrVIkR5/4Kk1idU/715VKNdqW5Jz0E7KiaUSkZLePTZsr+
	vcsEz+UlJCfFITaDmrvBPUjHEGcZVDv112JvjwfODncyefTCPMmlXiyrxnmae3xhMbsTpHf540s
	pFxQ9sxBlEy37tq9+YW5j7LSWTP0YhT4xdOqxET9ixqKT8dpNOnUCQQV1b6cUZbJLuzvTGNKLhx
	UZ42QPeNbtNyBf0TiDfn77GQvIoie8MOrja90ifB5UyhR2DIz2Ffn1XFqGy4MpkH0nuc8rpD7Y3
	BzB9b74iPQeZBheR/TZVjt1IIb6jX2/vEMv7XN4vRrg+
X-Received: by 2002:a05:600c:e547:20b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4a7c366d7c7mr2488415e9.1.1793032167395;
        Mon, 26 Oct 2026 09:29:27 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a574088sm191680635e9.9.2026.10.26.09.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:26 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Yang Shen <shenyang39@huawei.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/22] gpio: Drop unused assignment of acpi_device_id driver data
Date: Mon, 26 Oct 2026 17:28:14 +0100
Message-ID:  <16c3eef04c5e344b86c068def56779ccf8a90438.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2815; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=w3ZZRjAJ/J3qAkfFOC8HTjGkZ4zKUXCz6t5iB/yC7aU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+j0NcRj8CGwJZKkKv1p3iTbcoYX9Do2QXWz A0z9fNMkgGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/owAKCRCPgPtYfRL+ TmZOB/wJNB50xuHcTWKR+ARhgh/cccagicNCoa01dFtlxjanrxgRkVA0PwVozDfQgzfJ5/jsVE3 UAiYam6fczClINdVPONcXBRaPTF7XbZczdvkLkcHlVJmlQOVEHaUhWrAVkxFmOaIvgebj/GAlj6 pMMvk8ReRcdvHkbgwii+pLhBSlkIE6rvZ8yZnFo8RJdXwRxt6whR+Y8jhqV8qUQaQ9fky0Vl365 RV/z6zJV2p/Q1TxgrkB9gm8PIZZopPa4ZSM9kC5CWv/jMQxvLUyYMk9FmPJMc9SYNxZ0Tv95+I5 DdtFxvDY9vz9URgZhI/Bps9IcrrrX+UM4B+COaOJHx79jgLu
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
acpi_device_id to zero without relying on that value. Drop these
unused assignments.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-hisi.c   | 2 +-
 drivers/gpio/gpio-mlxbf.c  | 2 +-
 drivers/gpio/gpio-mlxbf2.c | 2 +-
 drivers/gpio/gpio-mlxbf3.c | 2 +-
 drivers/gpio/gpio-xgene.c  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index 42d41cf87ac7..3b65ed4592ee 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -222,7 +222,7 @@ static void hisi_gpio_init_irq(struct hisi_gpio *hisi_gpio)
 }
 
 static const struct acpi_device_id hisi_gpio_acpi_match[] = {
-	{"HISI0184", 0},
+	{ "HISI0184" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, hisi_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
index 1d338b24d52c..b2a7a41f1437 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -133,7 +133,7 @@ static int mlxbf_gpio_resume(struct platform_device *pdev)
 #endif
 
 static const struct acpi_device_id mlxbf_gpio_acpi_match[] = {
-	{ "MLNXBF02", 0 },
+	{ "MLNXBF02" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 5e4726d583c1..70b6a5413a86 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -451,7 +451,7 @@ static int mlxbf2_gpio_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_resume);
 
 static const struct acpi_device_id mlxbf2_gpio_acpi_match[] = {
-	{ "MLNXBF22", 0 },
+	{ "MLNXBF22" },
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf2_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 929f64c5140a..4c10a78e428e 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -273,7 +273,7 @@ static void mlxbf3_gpio_shutdown(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id mlxbf3_gpio_acpi_match[] = {
-	{ "MLNXBF33", 0 },
+	{ "MLNXBF33" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf3_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 809668449dbe..22d22962963b 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -194,7 +194,7 @@ static const struct of_device_id xgene_gpio_of_match[] = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_gpio_acpi_match[] = {
-	{ "APMC0D14", 0 },
+	{ "APMC0D14" },
 	{ },
 };
 #endif
-- 
2.56.0.rc1

