Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262379;
	b=3+w8YepVtBv6gtlOnYLcsYtmMlLtIAf/o8dY2fTaCBDQxa9LXoYrm6T76z8l8hhO7Gc4
	 2koWcG3zvDJiU6Q6kmcXGa3EOkF6EMjFQFxD2uxT1ELdqqlzvbf1iRFMFA5s/e0hWXbJi
	 oR4LVkYGQQVphD5bim0/ow/4gH2s3EGPadNQ6Kl806ucRfsz/XAROqnYUu3zuM3ZBiMPi
	 UMPh7xt5braF3xtfrjZpRUv15rSw4Mfh6e/y3Du2sZnDFUH0uXzpgVNRQxNwxFmVBi7qn
	 JwalZbcLo6ho0DYgL3h11lNebBEP5WL+4t4JP/LqBmZsLq7EhhyuxBzefM1q4tKwqoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zErrqnlEG6xc6cNz8Rb/DdY5GOFsAT42rGi6nItA13g=;
	b=21OxyWd4QWBsshM+MnjY/UnTMkwsFKqdCqIbPL1dZpV6uffUPQRq/q0eFaDkQTpVJTeT
	 62j9/KQ9lO85f906voskvZXSjc3oWjR6j6hXxbCOv3DZ+TaKv88toKVe2Q/njNBuDcPOB
	 WpK7s9dF25TyynRI43nzceUDmilIqftWdfFrxoKdsy5kK3bKjQzYYHGoY98eD7f06SW4k
	 mySZZDzXaWrPJNLinXRc/Wh5kgmdM8xZpNBY4IU9+Fz5F1hKwObcIit0YvJNONESxhOm4
	 LjJxoR9NrAaEzN+zRanMvPh7TO5bcqfYQJsY0qA35wpeDOYPfDJpwwRdLU/Sl9s1KGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="A/oy4t6q";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A303606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A303606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A/oy4t6q
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df4f540ebso886447f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793262378; x=1793867178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zErrqnlEG6xc6cNz8Rb/DdY5GOFsAT42rGi6nItA13g=;
        b=A/oy4t6qN+Q/bG/BT5S3XsYMMsIM3P1jN1hF29agMxtIGsrEbca0X6xjGsEs5usWK7
         fByw/wpS0IjDrbmi851J+QuRREOTbxlXXGdW+oBNND3Moq5OH/pGUuZvd7c0rMoNcpDO
         PQlUTXvq3B8UtGF7fO7oPmU1wcQPSshBhM/yOCh6BB2y7ILc6nYSFu5TPSJ63ReaGoOA
         t+Fx6ht/fvzMUyxV8NjcHs8oZfzmcCnvbMx6gyndTXdoxS+tJ+0+2qJQlFGA17/shZQ9
         QJonzhPnh6/OmjIF8VHbs9xBWv0MAr/Zyf125CJUAaKG45/6EomZ2X50oGaHN/433EvI
         INwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262378; x=1793867178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zErrqnlEG6xc6cNz8Rb/DdY5GOFsAT42rGi6nItA13g=;
        b=BVeUrauvtbelkAhE/vy/chdz4WwSssdPyL6cxxYbzvC2vGvp4pj93D/X38Rnt9ABBl
         tUtQzBSi35SATywIDHpZuhyN9FMgYFpzlgcu7h7kcYEbzDIqOWocWmbblZ/iRilYhHIj
         acGybKvXMLwBKIM2PKGW23jpW7V8oXn78XYD0mzCE1cYigG+844AQ/gOm8jM9W0A9sfq
         m/nfHuHz/aOyvGrtCqWQN9gCzm6kCC3DnkP2R+fOpCZpEviDUgWhnlBhfEDvYDFvF941
         A9dKrVKaT363uVaBPsMOFrJxqYyngk1G4yBKS2N1wpPCEcT8K8SeJVsgyxaSthb/jiwd
         fLYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLNxZAX8hx4bXL1E7oVdQN8mFHoaJQ4MslEixZovVkRH3qpTxd6ubIPREGXvj6XmRKRt7L5W7dYmc8wes=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXCIUgfXz6svaNQVqx6dLw1GiNowWnRM3/bS68BO9XyZ4iX4FR
	OqOjjlOwC2RSRnqIlDtHd3Pgg4pDtMYNm1FV338jojbK8qTSLEcC9qZhgxccQORH
X-Gm-Gg: AYBFou3b7CHD0WOa2lt+JBFnEGPtOU0iSXXgusCIw3rm9SEd2IeQHcySYlSGQJyPg8q
	fLsKyHdzi6a0mzyYMsKXDd+Y7K0NKuvRDWTgi9GC9PlnKIpMCQJ/9K05cIGAfqScZKISmoqviiO
	e9FQs8N08cAFcgXUrg3UT6YyUtu6TQGyi+FosCnmJFr6yCTZW3K/KYaHbIfdy6gIZxC1ztnUoqc
	+8D3YAQLhEmpqIpUgx5PAertj/Bt/04Fn6pd2OiLPZFwh5YX8ViKe4GF+zUjdyV79ZOJRwm7r4I
	T4IMD6XKDWuedv1B6F/+gTImZh92SFcjoXLe+7j3R0MbowN34XfrtSlF70mFU4mpliPsmAwxILw
	l29q98ErAxjCHvc284j5KmgHzVupQUYftARYLfAeChMvjbTn7XbS8m5tmmTKRLBbQ4C/olqPQOo
	PDqWmYc89dEyznRknMDZz6MboH8OikAaSh6bWoVCN4r5niGNPaGSkkbFcZSX7tvoMKYaX2XbXZ7
	/HhsYLZn2YFzBgdBMS/W7KfImDM/3pXiC4M5zpDq5Yy9OImMSqwRh7Qx6GkLoQ8zB/3O3wajic1
	dhjVMNbKkKPvxdX9OyzfFsGLPjdXVb5IFCeb79J3PCXihUydDvUVQeQHhvi46P/iDgrxcgo5/Z4
	GZGCQ4qOE/5iwWSiSfS+WhmW7Bz5YXqBtOQXGSyL5l9Tu3EZXXORqocr7nDWXIwi2JBHE6lr01R
	gpwaFvGDuaO/o73I1IKW9PBcoN6NBF8OlOAD/QS4CBm01tlpgHqHAOWA8=
X-Received: by 2002:a5d:5e92:0:b0:48e:5db7:fd6c with SMTP id ffacd0b85a97d-48e5db7fd9amr9968747f8f.4.1793262377778;
        Thu, 29 Oct 2026 01:26:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-ddd3-b021-e674-5520.ipv6.o2.cz. [2a00:1028:8388:a84e:ddd3:b021:e674:5520])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm31125184f8f.22.2026.10.29.01.26.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:26:17 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Thorsten Blum <blum@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marius Dinu <m95d@psihoexpert.ro>
Subject: [PATCH] crypto: atmel-i2c - find the bus speed behind an I2C mux
Date: Thu, 29 Oct 2026 09:26:16 +0100
Message-ID: <20261029082616.53365-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

On the Turris Omnia, the ATSHA204A sits behind a PCA9547 I2C mux. The
driver reads "clock-frequency" from the mux channel, which has no such
property, so the probe fails with -EINVAL:

  atmel-sha204a 6-0064: failed to read clock-frequency property

A device tree patch in 2024 added the property to the mux channel. The
review rejected it, because the I2C core ignores the property there. The
driver would then compute the wake token for a wrong bus speed. The
review asked for a fix in the driver, but none was sent.

Keep reading the property of the client's adapter first, as before. If
it has none, look at the parent adapters. If no adapter has it, use
100 kHz, the default of most I2C controller drivers.

Fixes: 11105693fa05 ("crypto: atmel-ecc - introduce Microchip / Atmel ECC driver")
Cc: stable@vger.kernel.org # v5.19+
Reported-by: Marius Dinu <m95d@psihoexpert.ro>
Closes: https://lore.kernel.org/all/46ea55652f8bcdef51d5c552902fd0cc@psihoexpert.ro/
Link: https://lore.kernel.org/all/20240515104149.2ce3566e@dellmb/
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
Tested on a Turris Omnia with 7.2.13 and 6.18.59: the driver probes, and
/dev/hwrng reads random data from the ATSHA204A. The mv64xxx controller
stops at the address NAK, so this test does not exercise the token size.

 drivers/crypto/atmel-i2c.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 24bded4..5ff7bf5 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -347,11 +347,28 @@ free_cmd:
 	return ret;
 }
 
+/*
+ * A device behind an I2C mux sits on a channel adapter. Try the adapter of
+ * the client first, as before, then its parents. Without the property,
+ * assume 100 kHz, the default of most I2C controller drivers.
+ */
+static u32 atmel_i2c_bus_speed(struct i2c_adapter *adap)
+{
+	u32 bus_clk_rate;
+
+	for (; adap; adap = i2c_parent_is_i2c_adapter(adap)) {
+		if (!device_property_read_u32(&adap->dev, "clock-frequency",
+					      &bus_clk_rate) && bus_clk_rate)
+			return bus_clk_rate;
+	}
+
+	return I2C_MAX_STANDARD_MODE_FREQ;
+}
+
 int atmel_i2c_probe(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv;
 	struct device *dev = &client->dev;
-	int ret;
 	u32 bus_clk_rate;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
@@ -360,14 +377,8 @@ int atmel_i2c_probe(struct i2c_client *client)
 	}
 
 	bus_clk_rate = i2c_acpi_find_bus_speed(&client->adapter->dev);
-	if (!bus_clk_rate) {
-		ret = device_property_read_u32(&client->adapter->dev,
-					       "clock-frequency", &bus_clk_rate);
-		if (ret) {
-			dev_err(dev, "failed to read clock-frequency property\n");
-			return ret;
-		}
-	}
+	if (!bus_clk_rate)
+		bus_clk_rate = atmel_i2c_bus_speed(client->adapter);
 
 	if (bus_clk_rate > I2C_MAX_FAST_MODE_PLUS_FREQ) {
 		dev_err(dev, "%u exceeds maximum supported clock frequency (1MHz)\n",
-- 
2.54.0 (Apple Git-157)

