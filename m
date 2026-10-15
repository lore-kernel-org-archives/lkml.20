Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2D34D2EC4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061398; cv=none; b=D/C6bdBoXsLsjWjs2g8it4ZENzD8fPDlnBc4KudWTzGb7A6hamsYHFMOmJBNv/PYoN3ZvGuiTo88+s2r21LntHeo+atHD3QHRrIrkmctmAeZMD8De+Br3naL3ESn+YAyB7Roi0PMpxzHaIF13j9yT5PZUXPHCgH+Y1/TVufsZVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061398; c=relaxed/simple;
	bh=BXh2KC/D7GXQthn8khp/oBYxkxEzogKXXCzUOL6Vc7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BpF9OaM1S1I2kzr/1NSO9ynRx6tdXkUgaPrxGWKlwPqBiDmnoZbAk6ap8B4BDdHZ1MQrFOvodEFn5G4cpJuzL/FqUS9vZ73MinlGWCUpYNxelMheOBybx2TnWOECrEejhoQ1kl8ltcHfJqnQk6kAeCPqY1XF/nmhVKV/PccOEcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXrAqUqy; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXrAqUqy"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso2418524a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792061395; x=1792666195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9TQ/rDTWNb6jj0ZIezmBlxAzwTLhuF2EhGxHk6EpcU=;
        b=JXrAqUqy1dylQTC1FPsS0DwIvjLMCSQJWX9dLQcWGybNMxF235tV0wd0DSDBCWEe47
         cbrVKvfNfdjyu4deDSJ9JPTP7BSXnUj141du4UOhUtKcBV8oy3ZzbguOeE6ZLPVV9t83
         CqDSFaJy8Ple5zFEUN916qXYl6S40Wy5WUylYMtTOS1qnoFDYvUvoDnbyBGMDsJ5j196
         IuN/DfJn8FvQfrAkHs0frTwOAuu20EExr1Qav1/Mp6rEqfWocb5T6BRIDfbxkPgdEA0t
         dYBlmFuvrTc/P71Bp+1Sp5GExU4jN/VpFv4Iw0NPf6V+zuC//XT5W83Nx0ILIoAiZ7PR
         tSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061395; x=1792666195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9TQ/rDTWNb6jj0ZIezmBlxAzwTLhuF2EhGxHk6EpcU=;
        b=UrK4UzokV/BbFO7kIW8zJGko1jL1slSi1hXacLWe4Or72G36xmO7Jh4lpFVda9SeZO
         G5HUuR+NZthKAXgyFA47bdoOym3jI0D+pMDiSm4/pTg1WSzDWwa/i/HaLJR/Q0Ocx1Kn
         yhMHlYdr2ToFZJlXv+RXUGTw4eqYjC+i2D7KFPC3nOcmJNI/8Baj9w12EthwJWscINMa
         ORldA1VtfO09Rd5O6bZDLd7bcqyeJOuvq9LACz9sk8DwDNAmx0r6UIBvtAcMaF8NHdvV
         DsoWPBrRDc7PKgBcZY9qt5D+NN01tVy1BuY87UHg1vmamV53yxH8D848vhcNFIz7c4Kw
         4vdw==
X-Forwarded-Encrypted: i=1; AKwUvBzZ7aaz6KLe37XRc3b1Ywkig0dzlcHPGFyvF9kkYbrKIuZiRt63OgMgnVQpH0yRO7e6cYDaOZDprPhL/uc=@vger.kernel.org
X-Gm-Message-State: AFq9FYInGipT6pAw+zecZZ603eIfV0tj6c+FRA6dbhMteBqrtRW2yRwB
	d+5ZlDdZFWsIYURiGxqX/jy+Pn06n/N84YbiC0QlhL/ExJGBuoZRjkvZ
X-Gm-Gg: AYBFou0hgzYX78AWGhCy29V6rpKrUaIZ2d0rLJc77RUnWt8Pbc/wu/nFoG//D86iIbi
	n3gk825N6qPXhPT0rQ24uqMNSiJI1dDkWT/bRIrlR+2mGwcOmxOY9rA6JZ2eOzCxtfRcRIru5aj
	BCfFdOCSb1ZS2ZSxQ8L6INm5TrPKPfj6JDG2C1o6zfGXFHAp9Saz3fSIBgebt3JYfOdgOujJJka
	A6NkjbnPaHWQe1BIKsHFno6elsbJb+5Q1hrn0O0zoVWzNx37uLQ/yBwYXG564iDSgfxJXpSS06F
	imhF6FPXLI1K2MnYP4LuHbAxo5bAgCgHyOHx5ByvOOxJPd/fhmMu6Z+LV3zQ71vtCYf7GH0xixj
	P1x9eLEB5+3ZfKxxMBzD0IpcrbUVYv5tepnaShX9WMhqtPjXMhDfuGuy/cO6MXFIryVOez1izXk
	GIAHfjdGJfi2Si+cAoj/xC+z08O7Gd336kFG+ycQ26UWjqiUG6katA8nJGp1C9OsTSsI1iIyYGQ
	e3YCn1jYTICTNQWw1GGkUNB0B103m70d7WR8WlZ1MPtt3yD+x/mWqp5iFTw+I0w9lazJy1CDbY6
	lRfkrLWACo7TcscWJgWbQN99QYs=
X-Received: by 2002:a17:907:2d21:b0:c2b:7686:4d7 with SMTP id a640c23a62f3a-c31a9ff6976mr1704835366b.39.1792061394794;
        Thu, 15 Oct 2026 03:49:54 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3af45sm107890066b.33.2026.10.15.03.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:49:54 -0700 (PDT)
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
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v3 4/5] iio: pressure: dps310: add an OF match table
Date: Thu, 15 Oct 2026 13:49:44 +0300
Message-ID: <20261015104945.2687162-5-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015104945.2687162-1-paulius.zaleckas@gmail.com>
References: <20261015104945.2687162-1-paulius.zaleckas@gmail.com>
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
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 drivers/iio/pressure/dps310.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index aa80d106ac44..ad3860d11592 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1042,6 +1042,12 @@ static const struct i2c_device_id dps310_id[] = {
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
@@ -1051,6 +1057,7 @@ MODULE_DEVICE_TABLE(acpi, dps310_acpi_match);
 static struct i2c_driver dps310_driver = {
 	.driver = {
 		.name = DPS310_DEV_NAME,
+		.of_match_table = dps310_of_match,
 		.acpi_match_table = dps310_acpi_match,
 	},
 	.probe = dps310_probe,
-- 
2.55.0

