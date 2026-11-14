Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641782;
	b=erkYRk6gSxmmPZ2dCu3AbNFdVUY2CgFVpDTqR5mTqOuAHME+48oT9d3CuK8KVUcx9dVB
	 Fj0rDBBuCUWdKAfWAODpSF/Ui3uuQeCUzP2BpotzzWkC3BJoK9KG3hrfqkOX9wImxLkI2
	 jHaUO5C4AvjhBYcmnPxGaAu4zc1FsKv3GBNR3esy/BanoAPsQAA/RSbIcR/GSIlBMGQU0
	 77MBfF8EBLjSwDgrAmX5W6ObkSlZkqiS70Lf9S3nH3E99l4EprcAYXhJg0S2W10c8JFu7
	 z7fsakryS0hLNcJW1oYVd2PE+8Xnx+9C8u914cl4MWgt72LACs/w7uMkIHQ0a5gV8Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NpzIKzf0j1MF4TQzlOAXahTkNrQC8IVb9GgpNTeOqbY=;
	b=f/KV3P+esUeWQ3Vxu7mj4m57DyKgzaRuyD0z0/cOBh/jl3/RrkjC+nbyMk9YTryyX5m5
	 uLdMy6HOrCTjWOh4ZVJLCxEw6xlytGzRikav93oBP7Tv/G9pA46sBrfb/fm/nhI3SAuqs
	 TMycv3LPL/QxfxWIgERwsjzqMbgtUFGa9RmEa4QiWqqzU7szhlAKSC1MQTRuPju9ZupTL
	 ohrS6z6DoeLdC0DPqzRRqmmfotNKzFbO4CClB6QspBtm+A3tCrEWSuQe5Pod+bjH9UZlL
	 dxA9JVTp/MHIR/7OVvuOHgDBEge7fn5Ba1cHw0ebH22YsN0GxjLhMVwAOFWUmDgUcbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yH+fI61O;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EBE606A33B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9EBE606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yH+fI61O
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37600b0db49so2472051eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794641781; x=1795246581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NpzIKzf0j1MF4TQzlOAXahTkNrQC8IVb9GgpNTeOqbY=;
        b=yH+fI61OsffsKXPV6EmPFbgm1cISUEjkYB31t7ZuyE0kV6rj8f7gWVNU0CavO7PsOM
         zt4nwJIx9bAxuj71IRspBEf4fD886uXjLU1VU+2Vm15llZl2X53H6RBr0gOIKfzx514H
         jEOGAUgXVliLm1sr+bBsW8Uf6lw5YvuMxcIPAZtijUKvqq92mR2smtYnJyAagwZDmioS
         7H7OZIKuAhNxTKuRsssm8L+ZrUZCR6eItcPnBTujJxeRARtKbNrdcdhoTMZXU6omBZFy
         dT1rc7icNgfNPG6K9A0Jn6QD7EPIftmn25CkGiHouGNv4Ryz5qk6FG5+V9yHPdliK04/
         DffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641781; x=1795246581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NpzIKzf0j1MF4TQzlOAXahTkNrQC8IVb9GgpNTeOqbY=;
        b=W7tS9Qr5gQcVI2CT4UqfcO+C1pcg0f+cUIi92/bFScvsz1S+7586wWubnmvokLaKHR
         dCH451DH0nq1mVAzT4DhBtVFL8KS4LEa9ZTgDIjFv6MAzIPkyBvWBrZNUjqNN6NSCPR1
         Tih14gfS8Cukhd2xODWjlIqD0/2Gr5fC8MHwskvjCg7wmO+69eS6yBllRXmOMUb0NWtn
         81YF1l+GkikYgmn5nAKGUSYqwVlhJj5gpJHEuKfhYYZHzllHW6kkbjTF92S8JQs3TLGk
         g62Hway6VljlDf5p7cqkh4Q1bFmrDQRbUiGRUR1sN1sTIuh163Fd5SPiyDXEa/N9A/f+
         7hzg==
X-Forwarded-Encrypted: i=1; AL+hErG2Dnroe+8u1IzTGKok4g8gb40jIv6Tg7eMdeWs3iiPTtm7SCr1RaAwG3z8AcivV8weMY/2mOmvIVQM45c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ptZDQ1b2OpAYB4sLGxAcc48cSfrlMjDFRBa1n3rm5FCiQ0XBb
	5UokCf/6tYN7lmjAmHStkrVJIzoffEjFjLPuFwjy7W4E+YEXNlP33Upq
X-Gm-Gg: AYBFou38Z5UJL0wnG38DenXXzD69MYKHlZs8Wj+7aF4oUmUFyVb76VwoQ+bNj3aT4gZ
	7tdF7FgHLs8tbr75b6LYeePGeqh9QGCS7l+864wF0+HgdI5ffjV8DUE6IKR0Ky4GXOl10onIfEo
	xk+GqwkCGSe6DYzQYdYyHiJTfVtXpheSoTpXs7ZDmuO9DO1vPxwxye6MEljfXfar15jYYcJ56Al
	0kUs59Td2fOtIV0HhNdvtyQtke1zejbWStEOLFPiEirglWQv19d2NH1vUpBUasYIxVGr2AgTXon
	5riwAeIZYyp63wbt7nd/mbaTN7mqXru3h3/GtDQwSr52dfEnr0p6Jr/cre4w++5Bbl71U6PgVOB
	0sZb/Fr/el6gDsl1KOlqMIJDV4gfxy8TsllhG1Vdj4LW70gn2S7bYSC1KOxMJrUfftCU+D1Tt7F
	mPFgENebhPrUpaEHuG0pcv5j89HbcwUwQuNTxm+8CUt6R1y5DxU3zlNa1J+30cbJvjsQBCQzyXk
	n6EQfKhLkTTdOG4jZ/fwEXxzzkfA0AEKUJpsRfeIX9DxqzbrtZF9vDomQgOt7J+1+e7x9WxG/vf
	YOQhKgjcYuwsbWRI5f7z9rzIsU4ly7aM42EXZU4wubYDBiAmTPvZtsRcEtqBR2zvqStyLTWI0wY
	+97c35PmQ2N87wp9wyDuvgiLE1x2axjwnQ+fMFgW6Wv985xyn94BNDkjSaQCtVdZ8wzPdMpP9vq
	k+2uFkTlOHFvFpm/BiMKfFQv0HtHhdfX7xu46Cex/vzA==
X-Received: by 2002:a05:7023:e41:10b0:192:a481:361 with SMTP id a92af1059eb24-1b50308a2c0mr4266658c88.7.1794641780699;
        Fri, 13 Nov 2026 23:36:20 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d990sm16082635c88.4.2026.11.13.23.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:36:20 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v5 2/3] iio: proximity: sx9324: keep the IRQ balanced across suspend and resume
Date: Sat, 14 Nov 2026 13:05:56 +0530
Message-ID: <20261114073601.23404-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114073601.23404-1-kapoorarnav43@gmail.com>
References: <20261114073601.23404-1-kapoorarnav43@gmail.com>
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

sx9324_suspend() disables the interrupt first and returns with it still
disabled if a register access fails. Resume isn't called after a failed
suspend, so the interrupt is never enabled again. sx9324_resume() also
returns without enabling it on error.

Enable the interrupt again when suspend fails, and enable it as the
first step of resume, before anything can fail, so resume mirrors
suspend. Use disable_irq() rather than disable_irq_nosync(), and call
it before taking the mutex, which the threaded handlers also take, so
none of them is left to run once suspend has returned. The driver works
without an interrupt line, so skip these calls when client->irq is 0,
as sx_common already does.

Fixes: 4c18a890dff8 ("iio:proximity:sx9324: Add SX9324 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9324.c | 43 +++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/proximity/sx9324.c b/drivers/iio/proximity/sx9324.c
index 1c8ba28c030a..ed2caadc7747 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -1091,15 +1091,13 @@ static int sx9324_probe(struct i2c_client *client)
 	return sx_common_probe(client, &sx9324_chip_info, &sx9324_regmap_config);
 }
 
-static int sx9324_suspend(struct device *dev)
+static int sx9324_sleep(struct sx_common_data *data)
 {
-	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
 	unsigned int regval;
 	int ret;
 
-	disable_irq_nosync(data->client->irq);
-
 	guard(mutex)(&data->mutex);
+
 	ret = regmap_read(data->regmap, SX9324_REG_GNRL_CTRL1, &regval);
 	if (ret < 0)
 		return ret;
@@ -1107,25 +1105,42 @@ static int sx9324_suspend(struct device *dev)
 	data->suspend_ctrl =
 		FIELD_GET(SX9324_REG_GNRL_CTRL1_PHEN_MASK, regval);
 
-
 	/* Disable all phases, send the device to sleep. */
 	return regmap_write(data->regmap, SX9324_REG_GNRL_CTRL1, 0);
 }
 
+static int sx9324_suspend(struct device *dev)
+{
+	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
+	int ret;
+
+	/*
+	 * Before taking the mutex, as disable_irq() waits for the threaded
+	 * handlers and they take it too.
+	 */
+	if (data->client->irq)
+		disable_irq(data->client->irq);
+
+	ret = sx9324_sleep(data);
+	/* Resume isn't called if suspend fails. */
+	if (ret && data->client->irq)
+		enable_irq(data->client->irq);
+
+	return ret;
+}
+
 static int sx9324_resume(struct device *dev)
 {
 	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
 
-	scoped_guard(mutex, &data->mutex) {
-		int ret = regmap_write(data->regmap, SX9324_REG_GNRL_CTRL1,
-				       data->suspend_ctrl |
-				       SX9324_REG_GNRL_CTRL1_PAUSECTRL);
-		if (ret)
-			return ret;
-	}
+	if (data->client->irq)
+		enable_irq(data->client->irq);
 
-	enable_irq(data->client->irq);
-	return 0;
+	guard(mutex)(&data->mutex);
+
+	return regmap_write(data->regmap, SX9324_REG_GNRL_CTRL1,
+			    data->suspend_ctrl |
+			    SX9324_REG_GNRL_CTRL1_PAUSECTRL);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(sx9324_pm_ops, sx9324_suspend, sx9324_resume);
-- 
2.53.0

