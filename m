Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795861;
	b=jagDys/bx4YjaOLPns4Nc9HULnXER4G7mvymE2GsYwy6rxZM3R9HTyRzjbFfRY760sLA
	 ZsHiSiyeyuDHKOqyq3xTOHG1j4uVMQjMuBwWhk+h06f73FnEm8iyaYnU4juoJbA6nnrTU
	 UrwQF2zJe4HkeC/bCTul4lNBQw9vx9j+pOPjK3RnmdFDUWPmglIVf3Eqc6sCL6SZ+uETy
	 XPZI4+iSTZ/dfQwC+I5oAP2e+OnvU8UmkTArTwejmNDQP8tVq8+p/L+yTghXcKsIzh3E9
	 AM2IG7WjER6pQHpcSOq9xoojCSwvwMC6gmYvoQ+OUaRryQ3IuCMcDQn+usDWyFed1IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
	b=DG/JCI0wiLCWjjyNdxFOuU1nHME5A5FElsJCYXTTBJkDXWlEC7GD7WW+4pGwIEPb7fim
	 JUN1TAOTwilAT5PnJj3OjAS2XRso1gJEnrVZYjwpyaXd55Qw0yOWozJXgbMUZWJRdd1uu
	 AcITAz8sXIOMLX4kx76qdPgflWJdh4DdZO807EPzxLrmFHcz6rlFPEP4wVyg2HvMKrdEx
	 Ok5mYxKaxwa1kBTjCxAH5vW9/EcvX6PCJGeEi+Lv04M3yjZBfEmj3wlla5GAFWvRty/4+
	 I6pXydvtN5IdSIOwcV+PKg1BSlUxk7tDSlJMzjgd6H+RECF+AV3zweK6tok6t7HcCHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TvySfWxe;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161FD606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 161FD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TvySfWxe
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490d59c3edaso14498f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795859; x=1794400659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=TvySfWxerwz+dWhRetETBFqzqumF0jAyeAC+LydLBBp/gqeqZaMXoxCiBfvTXTn13z
         yoVlaafMNT/vyGT/QEjCJ89zH9nNG5rVYWGFZv1rGI+0v4QS7+uOF0QOd/I4WZmGTsiy
         tdeSTsYkkak67evWJjmBGRN9YG8CAEni6vSle5comB2ZizaSoU9LTuXC8LDvPoyWgfTV
         E9hoEsfD9kSISankKZuI8mqAV7HfDg4Ikhl1PEiHLnxPrbZmK4yUPrNCILmvH2CxQ7WI
         gwJz2RAEuVniNy8j4RSgseu3O34CIXDA4PERqFXZe6gLmjWSa40Jtm51qu47wpE99/nh
         wLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795859; x=1794400659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=sbagE+GvRcRCIS/0ncw9ic+z2L/0H3Ttbrii2pY8pyYA8BEggghjCy6bmDsnLtnBR3
         4zWAWRcz3Vdflu+v5DdluhAk7WtTi4O4Q6gwAcfvS7/j5Ch7W7IGeikje/DyjQhJgGx3
         j83KhSgRYaRpqmpOoKpJ88yZh3ngYF2k1mGQ8bEZBFmIhI42v2j35Bg7iv8AsoXTbyY7
         t/+/6eLb9/OP3RfLPsWgLuAZ1HQKh6+Ep9ylx9nRbsstIxFLcS6T4zbc70tXNFPf2C4A
         FUW9+E9mf0L0WzNUz7dlkMZ6lRG/D53FS9h+2REgm9iMhUOrzWJXroq8FD8BX3CBfYtH
         B7Yw==
X-Forwarded-Encrypted: i=1; AKwUvBywj/OkOO7QNElp8FUQMao5DA4uQ7metAOFmONCHHVqoR9xtMmV7QkOoRTxzY59i9buURlv63VUuElhBXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aFHIzePPUSEWjyMvCqUNev3T5g4so2WIz2jEzNbChPZzVY6Zt
	RvxFp3vrvjnwKzMNxsT2f8oodsoEEHZpHIb/oqKkoATdy2kh5u58PLLL
X-Gm-Gg: AYBFou3PQnoeeXsajkyix3wTKOHu5icyo7vDF4uvOZECISuWrNqzzrUPTx2fOuwKp4n
	sTcLQxuOESjc4lfJb6qTkZecWPYaqYi7D43MdriM5D6j0YeS5EIR8fV0L0BsCjyurBCh91N7JmW
	6hqoF9VTtZWuM21wgvjuCDSdwCQkZmrDuT3v/0vA0lkzBgGgjlnFqcOxdNYrfr6F/x3xbEtujQ8
	0dKdqoiQYY2KvuTGaGiS4TXdlsyMYDMg1tldo8nNdwHU/8YRAMhlkvAYNAvb2pu94nFQXhOQDh6
	S5vKSyR9VfEKDuuO4GBhwunz+33+qfCOjOYcsTeHV2sO2GsX9udCJSQZcFcrB05Vv5xGkiHLsld
	iA1D8yHFGvr4xLTPPUgmLcg0W/u4zfbnNuar25rOsXtKkh22HmNXquQWuZQ0UGObPfpNZZfn9y8
	OaMGJzpoHUqW5YZSEbmb/msRmVSD+32hMlfGcqGhiuLWIR8pyMMD5mHGZeNICwPRaCNWnh1c3U2
	vIyHmMmHsX1cVuE1SH2lBPdqwVSA5jgp3V2EDcsw6gAXcU8E9r2vBRnpomyQU8CZn66J47sgGUk
	GYJDTt2s2p1EBpAjeFsuqxHdqHZ5Xzb8C4jROxlVRykId0UNtg==
X-Received: by 2002:a05:6000:1843:b0:48f:c595:d51 with SMTP id ffacd0b85a97d-48fc5950db8mr5312034f8f.14.1793795859436;
        Wed, 04 Nov 2026 04:37:39 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Wed,  4 Nov 2026 14:37:14 +0200
Message-ID: <20261104123714.234634-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123714.234634-1-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
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

The AAT2870 supports a dedicated main power supply input alongside parent
power supply for its internal regulators.

Add support for retrieving and managing these supply regulators
(vin-supply and in-ldo-supply) using the regulator framework to ensure
proper power supply dependencies and power-up sequencing.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/aat2870-core.c            | 5 +++++
 drivers/regulator/aat2870-regulator.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index 6b1040c65373f..657ccbb9a9dc5 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/aat2870.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -308,6 +309,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
+	ret = devm_regulator_get_enable(&client->dev, "vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to enable regulator\n");
+
 	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
 						  GPIOD_OUT_HIGH);
 	if (IS_ERR(aat2870->en_pin))
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 73b6d06858cff..896f39e345379 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -105,6 +105,7 @@ static const unsigned int aat2870_ldo_voltages[] = {
 #define AAT2870_LDO(ids, match, vsel, vmask) {		\
 	.name = #ids,					\
 	.of_match = (match),				\
+	.supply_name = "in-ldo",			\
 	.id = AAT2870_ID_##ids,				\
 	.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
 	.volt_table = aat2870_ldo_voltages,		\
-- 
2.53.0

