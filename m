Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098223;
	b=eiYgzbpqArxKnAK9LUaWdcHVNOvHC1E88Z4TXFm/BqdmUBf0yCuDCM71OgLrgw4fmR4J
	 ZIsVUhydrCPkJ8yT0CtN67ThFDNmvWpUr29H3xNQS1gX4QMCiZKNTtLGae5MJ8TJUeoa6
	 Z9UeYoh1+gDLDVYNJPCs330YFxEeQB+wLzlFzeKmb2BxFflY/F9001KS9tvYb5b8i4v8d
	 fIXoh0+zqX1WNAUDpFsKDFGJPe0/Cr00Anbubci6EqTjH8z507zkvWWnASpQjnB2r2fE6
	 NJcf2skDuKFMIPUMdPgCHUsY3LanoYwJvp/yHPnytyqtvoJvfySNmAnkKQYJWXYyK7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=wqr2oHyh/WvkzMJU46Zu/Kg3r7Hga2odINRQa1fGeMI=;
	b=gE+Mv2RPgB6jVQroIwVyDkWQ5G8tLO1YCRbl3g2xbQdsXt0Oot2+rTuN3xdKzDydzqGX
	 bDEG10wwY0D0oXHC7CjhNryxQ6H37SMqfrZMTSaqsy69XelIiumfL8SsXq55rWln/S6tl
	 5SAm9eqhQFe5eSJnlMjYOhKoU/n6KZydIOUqcp/k//ZYs/qXH28jcLYRBhN6kfu2IPqAK
	 /NJhHuQO5Vudvb4uLauIG7KSB5ZtnqjjmoSnKL7txgGHijG1TwELIyPXDotxr4+flRIiY
	 N1wgcLdbtA4YAlIA/HsFndyJl9GQWROV9BaPG2z3yRKMp8ObQH9bnfXBobMTqecwv4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eKqZh+Lg;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484F660A2634
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 484F660A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eKqZh+Lg
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a210470b49so32564485e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098221; x=1793703021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqr2oHyh/WvkzMJU46Zu/Kg3r7Hga2odINRQa1fGeMI=;
        b=eKqZh+Lgzdv5D2uFw0CICxE2DUA79MiqFBFi7PcIyINYJz9ld5AnFeuNzyDLtHoYFB
         TybIuQjduXU33wYAcfU2NVo6jVLNQKbZstPgI7iud/YkxeaVvuqmrOpZQG/CM3a9rhqq
         38og3eNx+7iAEj9HrlJkfo/Ytjz3Mf0CHzx8JfmGnafSEyVvaGPowBHp4JiSKl7NLfbW
         lxoDfDV2GDeLoO26yW3bPa6jifsHDZR0BCGqok7jbZr1TBJsBIqjbM8HsNmb1s7HOMck
         wI4/RpiIhiBFz28Pg7NY1EXE0WmcRKAKTMgnY7+GmDn9qR0LKRNWh4BAvq4iSPMRa8bI
         VWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098221; x=1793703021;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqr2oHyh/WvkzMJU46Zu/Kg3r7Hga2odINRQa1fGeMI=;
        b=wwK97MZMfyIseeID7Jsnm41iy9dy3AWoMuVKw0oWNX7AOfpq5YODXs7lqpkFVtZJiR
         CqhXTaJHqWJ07pdRl5+3HpU9WEe6os80bLYJZz4q/g/z9Nc040N4jAsSRkONPsMRFHnH
         u1nwZ7H/cqKszytHfvAzQkdQZuNTleNIwOMwDIFIsStICJb86FuqOf+fwczSAXIj/wkY
         YGSea9+ZSVPZHtFcCLL0yI7D9Gpwt+VFUVfmrtjn4DJ6xk3Lm4t2KB+TyHEk9/slyghZ
         zxfK5E9hsGZXzpHwJHy6v8vZgskEUXUMazlW1YYtluyLqsm7+IAQyICqT4jaKtmdIEfX
         OkbA==
X-Forwarded-Encrypted: i=1; AKwUvByGp2NkrnewDNTkxYFNXlxL52Lr+40JM7Y8lSQxyDvEuq9M9c5KPWFr9M2v2FsAf9NwFOU70LbD8gk5c1Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKLSVffVEkTbm5EkvvBkpoUchEq7F5iDlPUhJpIANqTh/rVFxM
	SdBJMy0zuIgkC6PZKYGkEbBhKQyBX6FL2kwxxRkUB+S7BL3kPNUCMT1zCwYvgp81dKY=
X-Gm-Gg: AYBFou3u/O6I9Yxn3EEZ/6oddUYpc7xqwfF/jqcfOFVXNi2YNW/4+aNl6UZmFs5hPw5
	6c+AhR9vAK0jK45aP+V5XaeZ35b1HpoAFYmYk3fEUteiIlDDlLnbmE9ZEZSRsiq4f40qySO5Yvn
	D8RvlB/ni0WGVmERXrOyUZxvcbXEfKcGovtid15eb383oeFxa/owFYuCt+/te09LbTi/MUNwJIj
	u3d8nGluMW4lzzfJ4TEme8NtvL9z4k+q4KNH2i3QkU7rfrWYQ9SOQJ/jgn2MpqURwdBijBvXz1n
	zTehVyxw0dkZ5Jn0JoTm4ZmvyXx6sPpdIMeGYIPlDC6j2HAotRt3Pwyu8JMxDtEArBW0UzV4Z7r
	McJqzWUCeYJ7puU0HsbjvnQjPVzefQYnKUngMwUmash6vzchTo8e9DiVqIzD2nYFv1wc5tx3tUL
	hDA6ySa7vxVWqjmG9lo0GNhg+obYbu/DNuXYz30qcMUrH88HqEqO7aEQPiT34k+gkxWH69aY/+y
	nDIXAubqbCSvhgGqrXcKwm3HdppoQcX3q+5Gw5CZ+1/vVB6gVrml+Yl2kISa+3ZubaBaGt6Lydl
	iYh/mqH91FU+W9bi5TEtqxn5t5g4bR0pZieYoEOk8IE=
X-Received: by 2002:a05:600c:3155:b0:4a2:1cc:6551 with SMTP id 5b1f17b1804b1-4a35accc591mr202414745e9.35.1793098220677;
        Tue, 27 Oct 2026 03:50:20 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a029332sm230145445e9.4.2026.10.27.03.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:20 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/23] gpio: Drop unused assignment of acpi_device_id driver data
Date: Tue, 27 Oct 2026 11:48:40 +0100
Message-ID:  <28a56ed1ecf497caa4b15e950cbe49679f3db2e5.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2815; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=w3ZZRjAJ/J3qAkfFOC8HTjGkZ4zKUXCz6t5iB/yC7aU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGSdsDYn65dNz644U6+MQGUkT1RRZVPs1iCb djGn+3ofpmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBkgAKCRCPgPtYfRL+ TsQMCACNFeA49ZlUxPZeEfLgRDzcKGjDLpqqUnWiATJWRH00aUXSTzB0nV5oly64XY+3q90+1Jc pi1Aw8FqHvBlUszglMN6Sg5Gtmqu+t1qShe9D3w0f5GsJUeKI06RjBrtlbpeKL486nkqNjzhuFe 5LWGfOUqGiBOW6nYP+7n1K7muIufp5JtNFuaMIiiwBZTXmrS9KTW5fKAEPUezWayc0SDdGdVu3/ Gx98VBP1aThG+v9FfR138JjwqP6gwMmvakx7F+0KlJP8dujm79mL3wnlq+A0P72MNjBN+gy/Qcy DYUwA3YoAeCjVNKZgVUAqkF/OMDZj/qwSL6eqouVSYA3eUgg
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

