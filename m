Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F30411F99
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792246124; cv=none; b=DU5cvJ+XVQXlTYOdsHUKuEzAM+lmATxoh8K6n66uL8rjD1prCsyMAza+qK+5w9sl2VkYlQXB6JWMUTK9A2Qq28HmeyeFhpzvpwZWEklmDH4xJGQZeSBnFjdxPGKtQOOmr6FNwDyaszUtV0kqePF2QtJUC0FIev/dwWOIJUjJveM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792246124; c=relaxed/simple;
	bh=w7lzAcqdMCZEjX4ITQ15nhloMh4seij6PruLBJ3/GZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NLctUPWBGHM9KwlvkKEaY/t0omIXsKM+ZJIQLCXkONN8p3uRMHu/0ayJ5Z/nD8b1l+VUlYD8FQKI8vICHwkmhTBGGZHJSOWBe8aRHyjPGGnVU3r/aL0qfrwHYgfjKO0GXeycInKchHO2Yrh8F8OuU0LC3DHQfjHPghgOA3BdOyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAACPVeN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAACPVeN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso9550635e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792246120; x=1792850920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNxk/T2LUY8i3MRxnTeuyFwAKCAvPmVRbJValg45Ois=;
        b=ZAACPVeNROOevtuQ6g2s/+XgRzVd1/WtEv0nFrcVQ52VOTrt/a8M4Sx5pkk/NknBgd
         ATF17QnX1EjKACdognhiUAoL2KehgUWloo5Y2OpDjJ3MRoxgFWoCC+5QzacdbzC0d0EI
         i4p26Hag3U6R1O4qKISJCV+R3q3NI8sxtbZzD2AdoUf2WHcv19O4HmWgt0Poy0E9eFsm
         xLp3POv0u30hBBQkDp8JT00ze+QacrzO28ApVaSvp2SrfHD0vu4IpkXFBISbi7SZhB7x
         QhxAv/UjL9UQ8MdQAPD+HtAaTkxQguqmRfkNShRqhT0/Rvuyai0mHfZChIHTPH1DQwMw
         WZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792246120; x=1792850920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oNxk/T2LUY8i3MRxnTeuyFwAKCAvPmVRbJValg45Ois=;
        b=0CpajEmK1Nm6eltcmbYQ66SdnGSOL5zheiXXO6LuduvDb/aFnyDl3wkfULj0XDwWkS
         jVU9w0HOVHlSGGMBCwhMvKcLTMvVocyWvSaf7G/fnDC6BGEERKQFUYq9/8cEBKAfeyvL
         +qoDWLZnoAtgdV/o5gfRrG95zjulFHkgKdQU3nRJmzzhFbYednZA1cXJSj3e1RBx9iUb
         bXF80e++5KCxGzV0wbfF/8rBhj0ICHBKBa5icCcx/4gLJu6cOGLZF5Jd/tAp969ttM3H
         6dz8Njdr57P7fNxWoo7ZSRIC9aFeak4j80o8NvzSIKDCJtv3OGc2O6ht8Dm8CnbHKjXK
         QmaQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2HkyOIDB0Brl4LXvaOM4Vu8yeRtAfWN+QKq+pCNipO4Cne88YcOq6ewddhHLf1kkzXLmE17wX7EZE6CE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlXRpRVGlnen5s3WdNoCJhXYTVksnh8auCbMcZ6JRluMygMfqA
	VF3nhGyMZs8WAInrlBBjhniu5fHcWk8Gxfto5TTNsXKRuUvoJ87r9ecP
X-Gm-Gg: AYBFou2Z3BK+y5DeT4R4oIEJVA+G6ZSMfdoQYC5pI6lA8/0PzSIBlXkV0tp8/IK6SEH
	0fLelbgrws2V/sHGUDV7/THLStmQwBLdrDb5bH8YKPb0Ay7QqaE9ZjXkET74C4vtO+PgiYHEflf
	VK+6CTyZcl0jZQGSUng/jztbhmkbm8CiZkSjQnz1hmhzz9Xq9Lfv22FgOie2CVjZZoycsDMpeqE
	kKcZIzYjcKXJGMNahVmeNZndfQS8sIZ7Mpbe0o0MVNWN+FcgP9Sdiki9iWvO9RiaKVfBBFdB4Hh
	T/2BOLh0mdUA7L49ylD68FpWIY6v4+1fLZ0w3fqVIdKZGdpNb4S0jRKMYF7ntHIi5LyROktmujz
	8M6px9yyNDOiLQ5Gy5xujDe/0/p1PzukJKyigyKMmPpvrrQoz0kX9xgn+VgqGN2/snwbCGz64y8
	megNcSxD2TtFUqATfZjOtGsjOJloh9Pxjwh86heS1qm3fA3QV/rC5up4M1D31phh8UuS0nISRQ3
	WdAl1lxSOaukUtG2Qoyj8pjc7MnL94ouG7APsES9nDLyWDwEgF2FsY1++bdSD1DoeEQ818meEL4
	FA==
X-Received: by 2002:a05:600c:8b65:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a1d75f2574mr69075175e9.5.1792246119996;
        Sat, 17 Oct 2026 07:08:39 -0700 (PDT)
Received: from machine.home.arpa ([2a0d:3344:57f6::1046])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce3302b5sm84430745e9.4.2026.10.17.07.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:08:39 -0700 (PDT)
From: Luka Panio <lukapanio@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Luka Panio <lukapanio@gmail.com>
Subject: [PATCH 3/7] Input: edt-ft5x06 - add an optional controller boot hook
Date: Sat, 17 Oct 2026 16:07:51 +0200
Message-ID: <20261017140827.290666-4-lukapanio@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017140827.290666-1-lukapanio@gmail.com>
References: <20261017140827.290666-1-lukapanio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some FocalTech TDDI controllers have no flash and run their firmware
from RAM, which is lost whenever the controller is reset or powered
down. Allow the chip data to provide a boot callback that is run right
after the controller is taken out of reset, both at probe time before
the controller is identified and when resuming from the power-off sleep
mode before the register settings are restored.

The boot ROM of these controllers only accepts commands shortly after
reset, so skip the 300 ms settle delay for them and pass the reset GPIO
to the callback, letting it restart the boot ROM when it retries.

Signed-off-by: Luka Panio <lukapanio@gmail.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 25 +++++++++++++++++++++++--
 drivers/input/touchscreen/edt-ft5x06.h |  2 ++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 536d633d97a7..e57611e48217 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -148,6 +148,7 @@ struct edt_ft5x06_ts_data {
 
 	struct edt_reg_addr reg_addr;
 	enum edt_ver version;
+	int (*boot)(struct device *dev, struct gpio_desc *reset_gpio);
 	unsigned int crc_errors;
 	unsigned int header_errors;
 };
@@ -1131,7 +1132,16 @@ static int edt_ft5x06_ts_init_hw(struct edt_ft5x06_ts_data *tsdata)
 	if (tsdata->reset_gpio) {
 		usleep_range(5000, 6000);
 		gpiod_set_value_cansleep(tsdata->reset_gpio, 0);
-		msleep(300);
+		/* Controllers with a boot callback handle their own timing */
+		if (!tsdata->boot)
+			msleep(300);
+	}
+
+	if (tsdata->boot) {
+		error = tsdata->boot(dev, tsdata->reset_gpio);
+		if (error)
+			return dev_err_probe(dev, error,
+					     "failed to boot the controller\n");
 	}
 
 	error = edt_ft5x06_ts_identify(tsdata);
@@ -1233,6 +1243,7 @@ int edt_ft5x06_probe(struct device *dev, struct regmap *regmap, int irq,
 	}
 
 	tsdata->max_support_points = chip_data->max_support_points;
+	tsdata->boot = chip_data->boot;
 
 	tsdata->vcc = devm_regulator_get(dev, "vcc");
 	if (IS_ERR(tsdata->vcc))
@@ -1437,7 +1448,17 @@ static int edt_ft5x06_ts_resume(struct device *dev)
 
 		usleep_range(1000, 2000);
 		gpiod_set_value_cansleep(reset_gpio, 0);
-		msleep(300);
+
+		if (tsdata->boot) {
+			ret = tsdata->boot(dev, reset_gpio);
+			if (ret) {
+				dev_err(dev, "Failed to boot the controller: %d\n",
+					ret);
+				return ret;
+			}
+		} else {
+			msleep(300);
+		}
 
 		edt_ft5x06_restore_reg_parameters(tsdata);
 		enable_irq(tsdata->irq);
diff --git a/drivers/input/touchscreen/edt-ft5x06.h b/drivers/input/touchscreen/edt-ft5x06.h
index deadc756cd74..7eaeb562d11f 100644
--- a/drivers/input/touchscreen/edt-ft5x06.h
+++ b/drivers/input/touchscreen/edt-ft5x06.h
@@ -13,10 +13,12 @@ struct attribute_group;
 struct dentry;
 struct dev_pm_ops;
 struct device;
+struct gpio_desc;
 struct regmap;
 
 struct edt_ft5x06_chip_data {
 	int max_support_points;
+	int (*boot)(struct device *dev, struct gpio_desc *reset_gpio);
 };
 
 int edt_ft5x06_probe(struct device *dev, struct regmap *regmap, int irq,
-- 
2.55.0

