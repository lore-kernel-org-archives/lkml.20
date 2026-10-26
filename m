Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032199;
	b=xIlzlFk1+63YkEwqThRsvvLvv12yHOqvZtRSc7LWGO9WjmtkyOV3qIxcQeYiugHUrKYK
	 Yg3byT/RDaX6dlQ7R8Dtt2qFLki7UHOY+emHjA33E+6B71EjCwNbEbZPjEwkzf0HJK3C6
	 KwDNw5+M9KTQvMA5WJv08Oy/2X4RiSud5vAbZ62J1u/h1aFZShZ/pYxwKkR49CLejkHZQ
	 c3Rw/AmJuX4Nv7+qmIcW8rLcYG6ed936c0o5DsdKKYS75Zk6Ic2er5fSy0CqfN59XJy3q
	 evFYfUfqCM2D3UVAgC5rtGzPrNVJj6MsrnHB65pzRZT/CGdhni8WY4mU3KkbgLvcieA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=6CzQSR2Mr9KQQooh036x28O9hJJYMD9oyrD3pTQshjY=;
	b=E1r+MhR+skc/OTm07JXEH0K59EDWnB3YvyPQWX6lX9mj3xrELndoNQ4uBfV6MpaPTGz1
	 qqY7Qzku97jom7gf9mUpYATa/ajmYNfNCA+bq3txcJ01N39ISuWS8ic+1JElmLyNXKz+X
	 w9ED1a1fuas15Wuup3YuRu5DPnQxjfxF0carfAlZVMiSmSLqPLcrejjOWlLFUZJV45u2u
	 PwP/qmmwsWak77dTZY7D75XeqD+pIkRZvP8KMA4m9QwoHfHXPctsmGExAiX26FbzIEcPU
	 mHHgMYLkS4JW8Zz0JuL9kJjHbIJH7Nj0DzjgwcroSjJJyto3ARun8linho8kfFg8pBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Tf8jqa21;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BB160A5BD0
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53BB160A5BD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Tf8jqa21
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2909483f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032197; x=1793636997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6CzQSR2Mr9KQQooh036x28O9hJJYMD9oyrD3pTQshjY=;
        b=Tf8jqa21Nb+ekgxKako1TDbCbjNzgjEtGoUsMU0fOwnC0A+ILtOr9nfO9efwRhwT10
         4i8TQRXvwKgDXUHs/KarjRrxtjbDW1fmxwFbXsaDhkObgoMR0DeXKdLHfBCG271ZXmCL
         Bxmu/vn43pm9IuB4ltKf8eOHPvz/iOTJId9zcW6p9RIeMMvpoRDFJzMsgshfMOG23Yy+
         1p7CFvWxkWLuZIppDPzhxb05OyUcOCzyadUryWjg4dAajsjeG5vElLXtTqS70nGd19g0
         27y+yQsRskDqM/uqUxe66XIIDKDRHnocOvcanwdCvOwXoJiXOl3SPPHXO156DTPIKHHT
         pIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032197; x=1793636997;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6CzQSR2Mr9KQQooh036x28O9hJJYMD9oyrD3pTQshjY=;
        b=NGuTr2lfkcnvIZIk+IeRMSF0DXsGKSzHcdwFplCUT/6vN89KHZQsJ3Ul80G9BpKDlT
         6p6+UxIecju7z3BBPEb4S44RRTtzKljrsV+8htvsbFGzetRycogdyWtbvhCa5FtENIzM
         Wb4O+jgMg1dvGBbcNEFzs8cpIo3y3KZkAWfFDVFM3lld5/5onSjarGBwhyYZr7M/IWwe
         aA4DhkLVxchzWYLSIfPPsHO5Msld4k0hAMNOvTxAa27nLdds58yTdaYqydRBc/J0igle
         w/o3nPfJ0WOUxHlWgLF3LAbG60nrnnoDRRq6jOkKibLU26PhGry5N6bLfpL39niX0u8k
         sBjg==
X-Forwarded-Encrypted: i=1; AKwUvByeraq52Y+B+h9Wsh/raHEHyYHtm7MXbc0DRnoj0yO9Dd6PQmgbbDcgvfQyzL8KCZcslGxDbSK31C23s9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAvwFyuu/rA6t7NovZlBNPUBCM9T9i29Ysgec+JzlittPCItAE
	guBPoi0TuQIkuYBAsCmu+1/7Omtr9uIrCWZNiakAT/sJTha4jZZ3m4YewBJI1k7xz+w=
X-Gm-Gg: AYBFou0zSya9e+0LJ+VxwnGsvkto7u373/SrhAa3LOjauXQL5lkejxYf9O0mo0zlwKv
	+iiV91sACklU1J/vviopRNReBpp5uUtZGDQu2ldXchvI0BRSy/4l7Ercc1gcgNS6jWlrvm4gBw/
	ztaR7G9862AU99Z2UaPfyjM6Vdcq2NDZXg3E7IACWgO1m2wxhDt32AY0ZOvP0ZyV3e37HTqbVLQ
	HqUE7sGVNdHemu6LQWeRUC2OtZM5i0UGtAGKFPc0wul+HmojUbQ0r5nG7pNvUS6bS3B6a25XLUN
	+iyXBiRhOrHjPulf+xEo6TQVTXLFs/dH+SHozjYEeQMDvY3K1oblobCem1CBKv0+NbkHaxxW7Cm
	Gmc0p3k5vi1DBuH9aGPu2oo3ey3Xlt8Xnb718BEWTBSbg3RFqdZY6I/pWnkkGlseawVNsFUkhRQ
	iH7VX6KB3WT/+WKg2ds0f7u2jA7aHI3rBbjYdrV2YIsX7CtaXn3N1SiInLzOYs5gIX+k+34IuB/
	+JrIVVhWyyBVFnEXsLpGSsdkzIf2/WGJ7AFI4Fl0aeVySOoM5UZKNVpWIRBUovWWr4ODc8VwwSi
	pmFabSIkQ06KYunE2fHFKKUeBqSYgwZOBKWmQP+R3Gc=
X-Received: by 2002:a05:6000:2990:20b0:48e:2bf4:e7f1 with SMTP id ffacd0b85a97d-48e3eb924c5mr9627380f8f.39.1793032196704;
        Mon, 26 Oct 2026 09:29:56 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e412cc164sm16225635f8f.7.2026.10.26.09.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:56 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yang Shen <shenyang39@huawei.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 17/22] gpio: Unify style of acpi_device_id arrays
Date: Mon, 26 Oct 2026 17:28:28 +0100
Message-ID:  <df5cc7d6cb7deff715a4c7df967e8cf8c3ce7e2d.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7445; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xecV7P6Tu5XHFl5UH4gpYV2pLRSEwcVsWkWhxPVL700=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33/GywwqYfW/7Ukt9tps3DUViG6wTxDhsZfje RqWXMmjVReJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/xgAKCRCPgPtYfRL+ TpvXCACryaryyzj1A6+A47NutuZqn3awXGBn/A6CWceak/6RVzwoJfCskIFX6Dz02vTGltw14s6 vaDX7nQeisNp/oEOnsZM8CYsQVsQzsDu7nroynZgUBErqVGmhbzVCOS3dXwhrBeiWXJlRNAP36i 6O/i3ywWn8+Ujrjm86kwhPUM0m6uOlmh8FwYwV4TaJf/EoyGbYEc9m32kx9+pKlL7h/yl185OsZ seDcjBfde6Ni6e9P3rNm7q1NK9abIUa6bp1EqsV3fO+ApgJraxl2qsn/0toVlt4NnpanaDBjmJ/ j1uSQI0VOqvL6AAQJmo7xGGuTyUCOhSm9xG8v5JJfCMUuCQd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the various acpi_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the few offenders accordingly. Additionally sort the entries by
.id.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-amdpt.c           | 2 +-
 drivers/gpio/gpio-dwapb.c           | 2 +-
 drivers/gpio/gpio-graniterapids.c   | 2 +-
 drivers/gpio/gpio-hisi.c            | 2 +-
 drivers/gpio/gpio-loongson-64bit.c  | 2 +-
 drivers/gpio/gpio-mlxbf.c           | 2 +-
 drivers/gpio/gpio-mlxbf2.c          | 2 +-
 drivers/gpio/gpio-mlxbf3.c          | 2 +-
 drivers/gpio/gpio-novalake-events.c | 2 +-
 drivers/gpio/gpio-tegra186.c        | 2 +-
 drivers/gpio/gpio-xgene-sb.c        | 2 +-
 drivers/gpio/gpio-xgene.c           | 2 +-
 drivers/gpio/gpio-xlp.c             | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index 32c4d0ee8101..74b40e2c3485 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -128,7 +128,7 @@ static const struct acpi_device_id pt_gpio_acpi_match[] = {
 	{ .id = "AMDF030", .driver_data = PT_TOTAL_GPIO },
 	{ .id = "AMDIF030", .driver_data = PT_TOTAL_GPIO },
 	{ .id = "AMDIF031", .driver_data = PT_TOTAL_GPIO_EX },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, pt_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index e159c3f98f1c..3b24daabcf0f 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -720,10 +720,10 @@ static const struct of_device_id dwapb_of_match[] = {
 MODULE_DEVICE_TABLE(of, dwapb_of_match);
 
 static const struct acpi_device_id dwapb_acpi_match[] = {
-	{ .id = "HISI0181", .driver_data = GPIO_REG_OFFSET_V1 },
 	{ .id = "APMC0D07", .driver_data = GPIO_REG_OFFSET_V1 },
 	{ .id = "APMC0D81", .driver_data = GPIO_REG_OFFSET_V2 },
 	{ .id = "FUJI200A", .driver_data = GPIO_REG_OFFSET_V1 },
+	{ .id = "HISI0181", .driver_data = GPIO_REG_OFFSET_V1 },
 	{ .id = "LECA0001", .driver_data = GPIO_REG_OFFSET_V1 },
 	{ }
 };
diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index 6a77a5864d09..72be289c65fa 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -395,7 +395,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(gnr_gpio_pm_ops, gnr_gpio_suspend, gnr_gpio_resu
 
 static const struct acpi_device_id gnr_gpio_acpi_match[] = {
 	{ .id = "INTC1109" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, gnr_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index 1a89695ce515..f03df71e3296 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -223,7 +223,7 @@ static void hisi_gpio_init_irq(struct hisi_gpio *hisi_gpio)
 
 static const struct acpi_device_id hisi_gpio_acpi_match[] = {
 	{ .id = "HISI0184" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, hisi_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 0fdf15faa344..d76c3cf177d1 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -556,7 +556,7 @@ static const struct acpi_device_id loongson_gpio_acpi_match[] = {
 		.id = "LOON000F",
 		.driver_data = (kernel_ulong_t)&loongson_gpio_ls3a6000_data,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
index b6a460363d01..f07dca415b70 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -134,7 +134,7 @@ static int mlxbf_gpio_resume(struct platform_device *pdev)
 
 static const struct acpi_device_id mlxbf_gpio_acpi_match[] = {
 	{ .id = "MLNXBF02" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 62d9ffb7b41e..3a0010fa6760 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -452,7 +452,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_
 
 static const struct acpi_device_id mlxbf2_gpio_acpi_match[] = {
 	{ .id = "MLNXBF22" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf2_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 96c40f745320..33efa819061b 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -274,7 +274,7 @@ static void mlxbf3_gpio_shutdown(struct platform_device *pdev)
 
 static const struct acpi_device_id mlxbf3_gpio_acpi_match[] = {
 	{ .id = "MLNXBF33" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf3_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-novalake-events.c b/drivers/gpio/gpio-novalake-events.c
index d5a3bd48bed3..113a4069120a 100644
--- a/drivers/gpio/gpio-novalake-events.c
+++ b/drivers/gpio/gpio-novalake-events.c
@@ -305,7 +305,7 @@ static int nvl_gpio_probe(struct platform_device *pdev)
 
 static const struct acpi_device_id nvl_gpio_acpi_match[] = {
 	{ .id = "INTC1114" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, nvl_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 34e084c95d7a..50de4bf20a5a 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -1617,7 +1617,7 @@ static const struct acpi_device_id  tegra186_gpio_acpi_match[] = {
 	{ .id = "NVDA0608", .driver_data = (kernel_ulong_t)&tegra241_aon_soc },
 	{ .id = "NVDA0708", .driver_data = (kernel_ulong_t)&tegra410_compute_soc },
 	{ .id = "NVDA0808", .driver_data = (kernel_ulong_t)&tegra410_system_soc },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tegra186_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 6f2907468507..30b6e9f3f8ba 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -340,7 +340,7 @@ MODULE_DEVICE_TABLE(of, xgene_gpio_sb_of_match);
 
 static const struct acpi_device_id xgene_gpio_sb_acpi_match[] = {
 	{ .id = "APMC0D15" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_gpio_sb_acpi_match);
 
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 84c1cc165024..f4adf2962557 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -196,7 +196,7 @@ MODULE_DEVICE_TABLE(of, xgene_gpio_of_match);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_gpio_acpi_match[] = {
 	{ .id = "APMC0D14" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_gpio_acpi_match);
 #endif
diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index 50625f98f8e2..d659112d7f1c 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -306,7 +306,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 static const struct acpi_device_id xlp_gpio_acpi_match[] = {
 	{ .id = "BRCM9006" },
 	{ .id = "CAV9006" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xlp_gpio_acpi_match);
 #endif
-- 
2.56.0.rc1

