Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032208;
	b=h7N5een6UOVOTjYU5lCh7374HjtGuPdsi1sLKD1RjkViVCgygZSgoGD1QSOtimmYJyXN
	 nZhrsAL3ouEo82GDy8hlgSnXN3rlWW/pVi4YZ509GzzYp7iBTl3lqqOI6VyDGcqs6ATjc
	 SKB7E1Ex6ipmUXjYXL9Oc44azs2nsaiWgN8dL4+xnnZjM1zQmCS1w+gK0HfaP9VLN1kr3
	 ozHd9E8GBEyFwpnFVSAo+RpBiRWcukcmDYM0SvoW66qbBmHL2aTofCrg7lbudIlpEOk9F
	 Ot56wfP0+Dmybm390w8ofiSyj5U+EUdY9DdFWLN1dTkVnp3vLLWww2n83EQtIJ11Phg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=uFDrQsBe+MUA+O+UTEJS2qQxgKTTnDQEatWGo1wqTVo=;
	b=Ux6nx6oNzWMg/zESGdRd/1T2s9ctdPSjSF7ZGc5fo+/0DudZ9W8gkr+lvjCVoMcokv6X
	 LtMBjYAaR47dKy9wXSqPDXCWKesLb6QxJkg0otPTAHUl6Of7+zb3rz9wf20/rolGJ9q8D
	 ng2RLgEpk0UR/yZ2UnSti/odRZl0fO7dq6DVxv1NY3KzG085aomMuCVq4HGJG4PSho9kX
	 Br6FVx0Z2m81/LSnvnRqxEUmn05HCVP7GlpPhL44kkXdzHv6+UFT14OQfHqIayDDzpsGn
	 tYYPg0gnqAEvQmSLki0GC7eGOe8KrhERNSDsVkOLSxeJEBVc3l/1l26Ooj5QQx1qIdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Nf4dIV9n;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1C660A6F7D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D1C660A6F7D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Nf4dIV9n
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a215e64962so23828615e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032207; x=1793637007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uFDrQsBe+MUA+O+UTEJS2qQxgKTTnDQEatWGo1wqTVo=;
        b=Nf4dIV9nGKjWMfkWTRLOEF7KESqst9cc70ApROBKerpeKNscqVYuC6ZJ2WjAyNYJsG
         vGB8C0FyMb/Jp37teOa3bkKqT0bpEhMqBbWt0MP9lzzjAuqqP29vPziDfSvEi0AywX3A
         EKYOTTFojLGphu0gn/KlIxZENyrxyEfb9l4sg+Lv+0BqBSSt7I5AI01xEafLSumUlaK8
         t/uNp4cK2RqcqeGbLWFnBajhDMHBQaVBLtu95CaAEtKCVHxnHyrLGqaZvLIPmzz8FsDZ
         oNn0Nou51O+Uhqt38HRDoByfutGXI8aSerTCZqU8PqTc20U5hSbrvWy749H+kp1JjE7L
         v4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032207; x=1793637007;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFDrQsBe+MUA+O+UTEJS2qQxgKTTnDQEatWGo1wqTVo=;
        b=lawXznTQHc2Ok1q+VZZZVlEsmp+BLRD6PH7rg/08IWF8ferbGPUrUz5ia9+9jBfZzP
         3+1s3ZIReHwHeyY+6oZp9lbedAo7ZqTWVZENH1attM4ideQ2VW1bFd+zzw7RTEMD32Uy
         muL9E8Y4CXjPUGbvoHw/Na4QD3lpTzEJZOpg4bh9XA2HhFhx26YDc1qfCDg2H/7kipcU
         BjgJgT+08FJuqlYS+4i4ux2JVhyqZYPZ7CRb6/0lvFiBc70VqSZnWIEvu8rJ/HDZI15Q
         UMuvacRF3zGN5d9dxn/EdIrpn5avUW3eul3YeNy6k87IlmLtgiIEOAUuAPTaYdvFbjQl
         vMeA==
X-Forwarded-Encrypted: i=1; AKwUvBxVUpEFGZ8ZxXbyTFRAcI0t0at1WlpGxEpunvgRYteYvl8o18T82Xdjfca4mt3D4DUqslfFu6lBxZnigC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKw0ugUSAgBDqGR3U3x36lU2ZoxZspf45CHpHXbdWXlmQTXHCYf
	/FgvPToj1Jyf1I6FVn9b/6cjfITzr/idKGF6BvaJvafl/Ne8XKSFbSaIbl1V/8/38u9KotcvMET
	hKybAR9Y=
X-Gm-Gg: AYBFou1U5FZ4px81Hqcl4Xb6NOC9LQCKAyBAF+P2CdCxkQfKS1B4Pt1jBgO04gZW5XW
	hhIfZTheHliVU4I+LnEjAiFevc/010XexknCb4Eva9MVAMRKab/5QOUCvYXe47IOItY5guwnTDi
	e5np6OYJym8XWfkUZogWi7sBXh+DzMrA/zVng7qavjXjD8agIfE2JJbnV6zi1XQsX6TNpB+Fr0x
	pYwcZJOZPPuRn8IxlSa8uDesuAS1gArcwP6NnP4OCrDYwRycbF6U8vd/g289XG9TJaxA13Y5e5N
	midm5O8k3uk2I8ohETH74atmZu3UNqwjLshPzhKDGQ924Ix7JiCorY88tydyfl5BH3x05AskGAv
	HQstEJ+QDGZG14NYQmz6It/F9pUgD15KehbR1BL0e9n7wxDpeM64wusIAgMAQ8IGAjjizQNGvZu
	/grN2DjuPb+WaonIXjr0WYND9JQLsaWWcruCZT/e/DjRb2cgRVZT9tBllgMNZwGDdUW9RdJdkkK
	C8iccki3x6Sp0WlNu0NR5wlLFnt1F0ZdMoXNO+6SUjRsbxV7g2+uUir5IvE5T73b3pk+TBo4G5n
	+cje1Y1rSnSbS0vb5+jTc2TzNl7Y2bzhLbVHFzw7YCE=
X-Received: by 2002:a05:600c:6989:b0:4a7:557c:530f with SMTP id 5b1f17b1804b1-4a7557c5341mr31152915e9.1.1793032207023;
        Mon, 26 Oct 2026 09:30:07 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a55e99fsm209023675e9.4.2026.10.26.09.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:30:05 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Michael Buesch <m@bues.ch>,
	Andy Shevchenko <andy@kernel.org>,
	William Breathitt Gray <wbg@kernel.org>,
	Robert Richter <rric@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 21/22] gpio: Unify style of pci_device_id arrays
Date: Mon, 26 Oct 2026 17:28:32 +0100
Message-ID:  <d25a89cdde69bab418158b59366f64270e699add.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4580; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=mUrlPBOf6srrWjxLPoBuv0fEC72tbzfH4AjJHLxXHd8=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqz79TdEg27KPnm58JHh8pzeb0FLLv+/sa4swT6x4N5xd XP2zpyITkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAmwv+fg6Ff6Pi6jpJrawoC ZsXsZCvpS9a7wxje2qVw1eJbWBIrh9b7qGod3QKh4+eOXkpcO6eWaYbeB1OlFaefqYWJfbg2m/8 ke7pf6+QvOXwqi2RvxJT5BKfXJKgsceKJEij6cEz/6IV5ict4jj2ffVtsE9Nyj6hp6gZ2gWVbxP +tDe++EcZazzFJukH4i5JF6Imu8tfz2e2fO74ss8iLbc9gfR66meHX6V8W5TvTuNep/2hpWBWV/ 5qtT7tZeqFXr+4y39jvaqnHT6VlpM6aH5PCniet8MGRMYE3py5WfHXHkw+TtnYmbQ4WLjq4+fEB zyBl6yW9isLCc5Mz13Ac/CJ0/tO1Q1VveM+tuxX7/uY3AA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the various of_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;
 - at most one entry per line;

Adapt the few offenders accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-amd8111.c      | 2 +-
 drivers/gpio/gpio-bt8xx.c        | 2 +-
 drivers/gpio/gpio-ml-ioh.c       | 2 +-
 drivers/gpio/gpio-pci-idio-16.c  | 3 ++-
 drivers/gpio/gpio-pcie-idio-24.c | 8 +++++---
 drivers/gpio/gpio-sodaville.c    | 2 +-
 drivers/gpio/gpio-thunderx.c     | 3 +--
 7 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index 8078b5d7b80c..25ad6d82f708 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -60,7 +60,7 @@
  */
 static const struct pci_device_id pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_8111_SMBUS) },
-	{ },	/* terminate list */
+	{ }	/* terminate list */
 };
 MODULE_DEVICE_TABLE(pci, pci_tbl);
 
diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index f3a2321bc388..3f568a0d61d7 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -255,7 +255,7 @@ static const struct pci_device_id bt8xxgpio_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT849) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT878) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT879) },
-	{ 0, },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, bt8xxgpio_pci_tbl);
 
diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 391188c0f2c2..ba1b540db28f 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -514,7 +514,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(ioh_gpio_pm_ops, ioh_gpio_suspend, ioh_gpio_resu
 
 static const struct pci_device_id ioh_gpio_pcidev_id[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x802E) },
-	{ 0, }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, ioh_gpio_pcidev_id);
 
diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 9d28ca8e1d6f..ddb644be92ac 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -98,7 +98,8 @@ static int idio_16_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 }
 
 static const struct pci_device_id idio_16_pci_dev_id[] = {
-	{ PCI_DEVICE(0x494F, 0x0DC8) }, { 0 }
+	{ PCI_DEVICE(0x494F, 0x0DC8) },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, idio_16_pci_dev_id);
 
diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index b99f4863443d..685e8bea7f2e 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -382,9 +382,11 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 }
 
 static const struct pci_device_id idio_24_pci_dev_id[] = {
-	{ PCI_DEVICE(0x494F, 0x0FD0) }, { PCI_DEVICE(0x494F, 0x0BD0) },
-	{ PCI_DEVICE(0x494F, 0x07D0) }, { PCI_DEVICE(0x494F, 0x0FC0) },
-	{ 0 }
+	{ PCI_DEVICE(0x494F, 0x0FD0) },
+	{ PCI_DEVICE(0x494F, 0x0BD0) },
+	{ PCI_DEVICE(0x494F, 0x07D0) },
+	{ PCI_DEVICE(0x494F, 0x0FC0) },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, idio_24_pci_dev_id);
 
diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index 950aa12815eb..49e9d2863542 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -239,7 +239,7 @@ static int sdv_gpio_probe(struct pci_dev *pdev,
 
 static const struct pci_device_id sdv_gpio_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_SDV_GPIO) },
-	{ 0, },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, sdv_gpio_pci_ids);
 
diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index be96853063ba..d7d60d6044e0 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -589,9 +589,8 @@ static void thunderx_gpio_remove(struct pci_dev *pdev)
 
 static const struct pci_device_id thunderx_gpio_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_CAVIUM, 0xA00A) },
-	{ 0, }	/* end of table */
+	{ }	/* end of table */
 };
-
 MODULE_DEVICE_TABLE(pci, thunderx_gpio_id_table);
 
 static struct pci_driver thunderx_gpio_driver = {
-- 
2.56.0.rc1

