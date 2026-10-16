Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5C34D6C4C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164948; cv=none; b=cUUWJC2ZQFecQ1H7KTDcxy+oTzF9um93asTCC7jclWHE3ta+Dp0FlXzghSGD5lyU2P2h1EQgOyn6E+eyqm1l82TnT5LMZCz7irlUb7uqItWIYO6J6sN3VS6CfGRH+nMeEC/A0L3LYFtpDYNnNmM77cKfikIEVzcPWv82dukniQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164948; c=relaxed/simple;
	bh=gAjWw6G9lcSq8Zo8mxFK1qqxGDdtLdmuHsxWpOlc32g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+jeG4vQlkQBNwr7wNRnkbOi4gKA+X6MjB3p/gwVN6MKEJt35GTgFCxo00LjStWTq1dcxK1emEhtN6CWM+WClUEmGM2jVxSJn6SpKquzrTjmd1gFytQeCcE3Um9SYIbSxE2+vcAUo+XlC2uUXNlrBIIGq9SnXJaOB8lDb7cSZ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3uHZ00k; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3uHZ00k"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso5836366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792164943; x=1792769743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56A80MSXyfRwi9kKSqYlXnDxAngt+h6Mj8IZY9vejNc=;
        b=P3uHZ00kIJz4Z5/zDJs46jIzzLseL00bjw7L/uWX552j6qLwegbw0QhS0TVYFflyQ7
         ZvYLvtkBv4eZvZcimQoaLDVkpxxSO2kK8pDbWygxo+SlnfhAcc3f5R8RsZPojfFrDUdm
         T5oL9xa83iPgZ5equUVjbs67774yHbq2UAPh9o6Ir4kMvLAnF6LKRzI6Aq1O6Ktt7x0T
         Phrh8h4b0s0SbZejmLkStQoRTh1Rppziiw3yhhxxUq+pZq48P/F6cBcJMdgk26Dav/Vx
         A/uWTwJ8lC0WB9cN3pe0YOcX8zyZZQMW95dUWajt86lm4RljQb7kSHFu+/EqsPz53KHI
         lxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792164943; x=1792769743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=56A80MSXyfRwi9kKSqYlXnDxAngt+h6Mj8IZY9vejNc=;
        b=Me8nysV5KS+DePZbgsyo+LImGkgfvdUWF1GwFVC7edFZOeTI7UEpvZjSfglsJYK1h9
         4qqgybQXfEP2RvDFvmpWg2YHCCSx5x2boILa6DlzlQ1GP+JRSoSxOtIWa32thVsGze39
         EsLcd4/kwrE3hQ9fs8Y/xrIPXI1u8txXFtdtBjtGa6SFEXoUAEoYd9T+0Yac2nh8fAkb
         suShkhnZnk+ZSeS0rEZOz7X/WY55Lwim94DnPYgknf1bETDStBe3hoQtBWUR1MOZVBEo
         ehH77q/wL5cEtGY7xdh6Zlwpu//OjETFxLQleD5qzdt3IB7z4XJ6ppctYkwnfs9kd72+
         25QQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOmK8L+nIQzEyAD53pIh3R4TOvAmmXtVP6fLZXfCc6H23Gw0vz65HUF0M5SOlDQuJgrK6ch/sDQWwvQHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh21i57DJldRaoO/uEPTt/idtwF2XeCHTg1XgOuN0AHTp5KQnO
	DEOpMV8FA8pvscNRYFMLOfxseqsMPNc3oR0+zBW4RWJJLWl5VvkAjP99
X-Gm-Gg: AYBFou1nlyEDxCvOdrlHy1SDPu+GBCNxw4ZaWrBsyCMmuvcuHFqcit82VVC0Fz3gR/u
	4U395eJDr6NlVxP+faHr1Ej6l5MJypYiwrJIMAYF4Lmo/almhF2tO15fiE5J7xanABpLY1q/dk1
	0y9dHkzad6TIXeqG+//ffSRW59swibMbNs0oRC+Bv4lDvc77J4k7V0YNlXBK9DetWJ948Hc3ECt
	xrrUqk3Tp+EaUApg+n+bL370Zbz6SMmuqhaFPzpt7qWYC190zWVz0uR7bN6UH9jVm9F6YO0j7HM
	y7+c88CMdDmCEj/+/MozX+nGJEkniP06CLS+liYpe/mzHGQgt0Z5v4dBuR54CBmDcxwjkQSBhwZ
	/6CqYNdgB7wyIiKyifeZGZO68WBKHfTFgjjjQXV3Bfv/cDvi3gMqjAPRevJYjUsu/iqEaMw8fZj
	fmOLRhyiTSP9oB+dupQNqf6QcZAKVAJrifJWbsswffRwJf1bJ238u+ZbHmhGv/knc4D6naYbcqj
	PZGNiUYZyinMOWkOBronNFV+7Vf6H2+7YhuMTzJ2bqU79XJZrhqKgBlkHxUqGpp29BdSEf0tC3C
	B30uOlz+lb4ozSG+a5ugbqpbwIA=
X-Received: by 2002:a17:906:9c96:b0:c2d:c739:30e0 with SMTP id a640c23a62f3a-c419f707becmr11778566b.38.1792164943313;
        Fri, 16 Oct 2026 08:35:43 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm999067a12.10.2026.10.16.08.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:35:42 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v4 4/5] iio: pressure: dps310: add an OF match table
Date: Fri, 16 Oct 2026 18:35:32 +0300
Message-ID: <20261016153533.3701000-5-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
References: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devicetree nodes match the driver only through the I2C ID table fallback.
Add an OF match table, so the chip data comes from the compatible and the
module autoloads from the of: modalias the I2C core reports for
devicetree devices.

Assisted-by: LLM
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 drivers/iio/pressure/dps310.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index f2a8698e1e30..d0a2f6c6ec48 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1043,6 +1043,12 @@ static const struct i2c_device_id dps310_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, dps310_id);
 
+static const struct of_device_id dps310_of_match[] = {
+	{ .compatible = "infineon,dps310", .data = &dps310_chip_info },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dps310_of_match);
+
 static const struct acpi_device_id dps310_acpi_match[] = {
 	{ .id = "IFX3100", .driver_data = (kernel_ulong_t)&dps310_chip_info },
 	{ }
@@ -1052,6 +1058,7 @@ MODULE_DEVICE_TABLE(acpi, dps310_acpi_match);
 static struct i2c_driver dps310_driver = {
 	.driver = {
 		.name = DPS310_DEV_NAME,
+		.of_match_table = dps310_of_match,
 		.acpi_match_table = dps310_acpi_match,
 	},
 	.probe = dps310_probe,
-- 
2.55.0

