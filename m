Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793528746;
	b=rXXyco+mOgyxC412Ss0kZNVEo1TSQEHnX5HauDzBN3zUSE+3vEJkvpx0rp0siQsQ3Cv2
	 QB0XCGn7BUAP3q81l0K9w8Y4ibFII1RRFNyux9Bw7bcHFr7PZ8j3Cb4HyMs8i9VFHVN/r
	 9KHYx4NMFKexQpgG7p9ClmidUu9GSAq3Beq1SlF71NiLeK3eKAQHjcr9ZfdZLzv07hdo2
	 F8YO1tUbS14RVQnquUh52zYQ2JFwDMeXY6v3JY6SOc/ZA++OsbWBHp1EHTan/BEaCvv8r
	 AU/woZ83v3GU7dIs4gU2Sy7t+md7tOLvMbUFxInwNp11Dv6/zHZ3qSH9GjRMKbqS2CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793528746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0WNWdAH/5+xVZy8kDLSNEMLIm1NWHJIuWvqvMrdiB/Q=;
	b=CvPqJjaTotgEZK8aip/7J8tmbbzQdZYbMItWP1Fz7l6MsCp54TkoAnwC6bfI5ZFE+XHr
	 s0JxU4qTI1r0ofno+iyvip5OUDQgwVo1rquRw5elDWEm2e8zUU2Q5/KTynMRCTu9nxhb5
	 eIWFTFB2ru2yOtBCE5ZDpYEnVa3QuzdbTnTtQTQ2b38skb8zXBVK624neMNnIFDbr/LnS
	 o1bkxSzhNEJ+Ta3x0dL3KoM9Rmu4RlIYi2Kk84vJ18yrOhkaRaxgz5r/XaF6UXlMWPBVR
	 9s47ZFDqS7+q7p9QsEZ0cvsoQ6DSXgCi3JlXsNPUvI7LjC/jvdgQwIWJuFwK3Fsh1OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b5CTssnI;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23E5606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E23E5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b5CTssnI
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15943c9c005so301369c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793528745; x=1794133545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WNWdAH/5+xVZy8kDLSNEMLIm1NWHJIuWvqvMrdiB/Q=;
        b=b5CTssnInoLalaKG7mYWQqQTj1jvMnkisvs/9OXE7YcgV8rSQXzSYMWHGzE32E0naq
         uuGrTZrCiikAdzdZalQzj6MC/nMR23/yWzhtoSyeoIB6zbZQSjMeSeWI3dySdGPDQktN
         U5FDt0JZVis38IaTzwGZMt2QI59/fkREzd891W+FshvnRCZc+++7Vj73NrbTUTToSqai
         45m7K0KBeViVkwkCGehTfm5gEh8wlsARcYxvbf1jcp3rKX1GrVYN9R/S+/7JW9xiQ/I8
         nx/NvYJTrpDm2x2ToMPjVz9w4dEgKDxQxRfCT2YbysMkVQbaDfDgEjKP1n/g+0sYE4fY
         kuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793528745; x=1794133545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0WNWdAH/5+xVZy8kDLSNEMLIm1NWHJIuWvqvMrdiB/Q=;
        b=GDFK72sEfwYaXHa4IJR4405k9N+EYYc5XM5eKM5YuRxfVy/kYjO3XQ1iNdcO7dGgua
         jVIYAi3sWeXWdTVRSjq1hAohEXHhzseNPNaQpZY6Jb4Kv7OqjSf137CQf50raT7I0twQ
         IrB8Ffw6RifP6ivEXx5pJLvC0r6PhQR0QsRRHInU3oqw/FdxmV3AgLGFcIkJKlafnevf
         7ki6kuF+oxkkxhXnhV61IrmO4qb5UxeXbeaqRshmdJfeHnDXS8ivu3FvNiHIEgvWntnr
         QjLE4+RJHQMbnzRcNC4Y/Wumvw67Mn0999cBTOsmjTC/qhs6kN7LvNwqz815rsaYehqg
         PsOw==
X-Forwarded-Encrypted: i=1; AKwUvBxtnzgNwj3bNP9nJfm+qS87QO+t0k6nvQX0pBWSLLrZRQ7tAnSI38B915eKYNfqp00F38FhTtNQedjZMEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTHHY5vW7qjzQZYbAag7+d9MO1ceMPOSTC7joAoljwuZnO+yF6
	ZCRC7x5B90WWY0xmSKt3FxjhHPFc0227iux4VQngiGun3u47R3g66vgq
X-Gm-Gg: AYBFou0oOAFaGODRsHqHe94TbvIJ2sw419jHVBA+RRhIh7bu4k2GT6Ab2pp6u+RTbbd
	rGJ9JMwWBJU6dbPXSQjAb7e/0BJigbWWKy/Izjz3NPAG+WYJl86s5bN35Ws4AoYaAYWaTOe71L+
	EsZO2s9uba8XosaSCqCGrLbvm7cUVt6Pdnd7YvrEpjwEFyNhSxi9PjOOzrxs4lvMuQLur2Js3cO
	34bVq9z59k9W/Ozu3DZb25HVKlartY/qPv83YS8TgpoibLj3xinFA+Qq3+l4e0FFYRiZDR7kJtu
	4vFjcjMhlmgc+nWdbMZVoxkwaKd//Q57zGKtaE+td743GPRTUlw0lf0+7mxDF+2Rb0wPUNTg8+H
	1M9PQdUnjvVmCBC/w2CtWdkhpkTJP6sj8PCKiHo97IjIBYYKR87VBO8ndN8l4U4LYH9IkQaqoXP
	pr3lOJLkixeQXf4iPwEsmtf4Z9w8nThVmHsu+pRTUDalpVS+6KXD9scCLUachMDT/Lpcz8SHAJx
	4KBfQxiO34XnL9seFAHSlN1QZOTNsTTR2przQa1VGEQ+OQOQofPs44+wQbCY637VQr62L798/nV
	2EEi3QeEl3EnyamB9hNneGike2j8h+HbECQl4eV9vBC1961pIA6RClK/mPeWgq2yaIHA2dJmJ91
	xDSKs1ogVdXqgZP0cWQE3+OOWwmjaVAOuM9YAleCeu3wU9GUrGmszh/yUatlTm8GgHdX5GGi5Kr
	x2TiS6lP44lQOm7DWt9Qt+yxOuZIrHe+v+4qa4a5p4AyW3qqRKu2X9/UaqgdpytcD4
X-Received: by 2002:a05:701b:4244:10b0:188:ed6d:ebc9 with SMTP id a92af1059eb24-1ac5e6f5225mr10635487c88.38.1793528745096;
        Sun, 01 Nov 2026 02:25:45 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm6767163c88.9.2026.11.01.02.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:25:44 -0800 (PST)
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
Subject: [PATCH v4 3/3] iio: proximity: sx9360: keep the IRQ balanced across suspend and resume
Date: Sun,  1 Nov 2026 15:55:04 +0530
Message-ID: <20261101102518.22757-4-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101102518.22757-1-kapoorarnav43@gmail.com>
References: <20261101102518.22757-1-kapoorarnav43@gmail.com>
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

sx9360_suspend() disables the interrupt first and returns with it still
disabled if a register access fails. Resume isn't called after a failed
suspend, so the interrupt is never enabled again. sx9360_resume() also
returns without enabling it on error.

Make the two mirror images: disable the interrupt as the last step of
suspend and enable it as the first step of resume, before anything can
fail. The driver works without an interrupt line, so skip both calls
when client->irq is 0, as sx_common already does.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9360.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index ed83d809ecf5..f89c556e0989 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -797,8 +797,6 @@ static int sx9360_suspend(struct device *dev)
 	unsigned int regval;
 	int ret;
 
-	disable_irq_nosync(data->client->irq);
-
 	guard(mutex)(&data->mutex);
 	ret = regmap_read(data->regmap, SX9360_REG_GNRL_CTRL0, &regval);
 	if (ret < 0)
@@ -809,23 +807,29 @@ static int sx9360_suspend(struct device *dev)
 
 
 	/* Disable all phases, send the device to sleep. */
-	return regmap_write(data->regmap, SX9360_REG_GNRL_CTRL0, 0);
+	ret = regmap_write(data->regmap, SX9360_REG_GNRL_CTRL0, 0);
+	if (ret)
+		return ret;
+
+	/* Last, as resume isn't called if suspend fails. */
+	if (data->client->irq)
+		disable_irq_nosync(data->client->irq);
+
+	return 0;
 }
 
 static int sx9360_resume(struct device *dev)
 {
 	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
 
-	scoped_guard(mutex, &data->mutex) {
-		int ret = regmap_update_bits(data->regmap,
-					     SX9360_REG_GNRL_CTRL0,
-					     SX9360_REG_GNRL_CTRL0_PHEN_MASK,
-					     data->suspend_ctrl);
-		if (ret)
-			return ret;
-	}
-	enable_irq(data->client->irq);
-	return 0;
+	if (data->client->irq)
+		enable_irq(data->client->irq);
+
+	guard(mutex)(&data->mutex);
+
+	return regmap_update_bits(data->regmap, SX9360_REG_GNRL_CTRL0,
+				  SX9360_REG_GNRL_CTRL0_PHEN_MASK,
+				  data->suspend_ctrl);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(sx9360_pm_ops, sx9360_suspend, sx9360_resume);
-- 
2.53.0

