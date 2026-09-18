Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D584EB866
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734330; cv=none; b=OjIaXNMsK+jxunVPxh1SjSO/wCqjMjjf2f1lDTMJG4oeObwzZeN2KACkCkroqcY7n2P4jCFMUzseXnuMY7kX8um6grIP/7r3dMwGDfqSF4mZhQoMDf4tyIQ+KGrhAqEW1TVhJiQzgcPb5FuNKoZLob0+6KqslhRg+RhIJNRV5uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734330; c=relaxed/simple;
	bh=Yj4RwbCvi7B7lQgZjaL6AuMOkRGQNU1rLzNzZVSRhLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WqmYBpHgYVrPjtJOzg9yXvY0IItHcU2aQKGSNl8IzZZBLNwWaqNCP25x4eeOqqg91NNloQAcxQdrw/D7qyzNqUiugjOCAWU18gGICH6QNkVpEG6+kzhM6Alk9B+irFWUGd7NflyYMLs1QGg8VCy0TfhmwAM4amRx5gOmQURkYN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TewyKczt; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TewyKczt"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so747792e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734322; x=1790339122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIjQv3Ni12nKKfUqhl2wfffLShu1iZGR3QKWNIW24Vw=;
        b=TewyKcztUbm7jz1l3JyXaqkHyF5NpsyWTh1Db8yKsyA2VPHZdgHyY1GveURgAUHSO+
         +C+ZpiCr3VjQNzIxCTqnHl4L10fpG3zkD9C1HUwXFAHh/yKsnzqttuwdNmzfloBRbUXz
         f0i9q8hkmYlJ61nza4p6SYDmLVnzJvWg6jazTee3p06jv6j0xJTyWatDxsq/YAAqqjqK
         psTPx84FQ7uLcqrdOj0erPdV7A6+jAxCaVovsUv1M1E6TOBLZXauEcGfMo0UqrT6eoXP
         sS9azI1McRUyr6o1kvx78ZwgTfbqOQ65Gz7SUa8XNVChOXtxLkfWcs0WGn1CEqTLiNfJ
         pQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734322; x=1790339122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIjQv3Ni12nKKfUqhl2wfffLShu1iZGR3QKWNIW24Vw=;
        b=pFb7zWp2Evbc0VSRv1ds/4erdHwhNbCccsIhTAmljk8Gb1kVuao0mgpnXnMjuEX5lf
         SEIQFGmSzuXW+mFNjS0f6ZivUoGtFNibzCTqMrvxOUnorM5lFlBsTcPyn36/IBGoHyCY
         4/B9PX7Sc0vOVoEvCMyxzU8UmGIk0Et04L8LzOeTN22r0wlc3zs/WztufSy0+Oubq3+S
         YqsYUrd+E5za9rye2tg4DXLP40RbZMusy12BiC8IbPt71CuVHZeZWuRvVCjw2LdWbFnt
         u4pbkiARHggdSnA+GGMksqCpfrJL7j0fsqP+uof9CrtjYJiaLVQLvM7njLoswlNZthlJ
         3SIQ==
X-Forwarded-Encrypted: i=1; AKwUvByg5FVzt211JMrGQTADiZCUs+6kh/RSMfTmmMjJBzdQaXjj7K6uCB/U5jN2uNTWbsJAh2bzGHNmMs3uHPw=@vger.kernel.org
X-Gm-Message-State: AFuF++nT63+QleFN3IhkBNSkTOQADBqry8rxxwaidhPfmhiRwhE8QSBd
	ka9X3TdJl+Xc2ft/T0URLVLxSeQwIVLVP7HOTjZdbXJWY8EcNebacMuv
X-Gm-Gg: AYBFou1hLLfps1Q/nckwts9znL3+HQtOlIWUKYh236/QGp/ttVW5nl3+ugYf02mKYru
	pbQymTNW33aBevknwIhhN6EH1qyaoZvNr72ftrV0UMvJxZglGDsx1xjasyJwkSKtnKzBX6j/zOg
	ML6jENKDo7WSMVY/miyjYzf/6yg119ocXGPwpb8rLypmldXQKrHPbefKTTnfrtUcxF7T+kiLiKC
	td5u+t8Q/iFgYvFPHkjTUETIHtZooLT31O9x0accBjRVcmcA+pEOCCrSZszM9F6bbpNC59spAT/
	WtUF2gn6EQ6qPRqEG293JxhZJyA5fC+Hus8iKvUDW6Vvv2rZss66BgT/jnCS/Yuek5SBsu+3ypE
	e8V0kzZTmFnsHM2cFtX/NFiBwnqiqdSGmgxwAUATTLC9/h3+Qi8QV+et/i5RrSy517muWlrUxeP
	bQRykGlfX5FJ5M2vptRCHI0upTIkcAlPBVYYitP/a/ibLedUt7jQ+X9QrEDBlxBzGRjreQfR/do
	6x/pGIJchcqUDIeM8+FzQfjAiaNWSUqs5S8eXuWTIZ7URuZrfwdWpL8ozaCu2GAX7MNXES8Myjw
	i5Eh
X-Received: by 2002:a05:6512:234e:b0:5b4:ac1b:89bc with SMTP id 2adb3069b0e04-5b8c1818e38mr752954e87.24.1789734321552;
        Fri, 18 Sep 2026 05:25:21 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea53sm398549e87.12.2026.09.18.05.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:25:21 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v7 02/10] iio: pressure: dps310: use a local device pointer in probe
Date: Fri, 18 Sep 2026 15:25:09 +0300
Message-ID: <20260918122517.377565-3-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918122517.377565-1-zoone.rupert@gmail.com>
References: <20260918122517.377565-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

probe() spells out &client->dev for every devm call. Take it into a local
instead. Keeps lines short as more calls are added later in this series.

No functional change.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 35260b399390..bd7da4f12749 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -845,11 +845,12 @@ static const struct iio_info dps310_info = {
 
 static int dps310_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	struct dps310_data *data;
 	struct iio_dev *iio;
 	int rc;
 
-	iio = devm_iio_device_alloc(&client->dev,  sizeof(*data));
+	iio = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!iio)
 		return -ENOMEM;
 
@@ -868,7 +869,7 @@ static int dps310_probe(struct i2c_client *client)
 		return PTR_ERR(data->regmap);
 
 	/* Register to run the device reset when the device is removed */
-	rc = devm_add_action_or_reset(&client->dev, dps310_reset, data);
+	rc = devm_add_action_or_reset(dev, dps310_reset, data);
 	if (rc)
 		return rc;
 
@@ -876,7 +877,7 @@ static int dps310_probe(struct i2c_client *client)
 	if (rc)
 		return rc;
 
-	rc = devm_iio_device_register(&client->dev, iio);
+	rc = devm_iio_device_register(dev, iio);
 	if (rc)
 		return rc;
 
-- 
2.43.0

