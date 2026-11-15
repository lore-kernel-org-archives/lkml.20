Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733126;
	b=lOdLbH0wlvglzDohPKn/WwAlTzEhM1P0ccUSZn7LiPB9ZDL96ceopfNyZnt84MKAEX1l
	 E4MFNnZgJC8fGO7zGJlcX4bBIAYj7tRN13J8+1Judyk/PJoSedqZxqukRw5H8qAQEpJQX
	 gV02YGAvKLUOhO2sD2lGkRBnksSfESDN0bzSeTCQGvWUFn1gnh9rCv5wMUV0CY0jNhv3a
	 /I5iGq2YRMrInlbFGVBtbx3cXlD/XsF1lEE9h369CMhINfauSxrg9edGpAaOv+ZT0gEhs
	 q65IEmhKrHJAZOZTF79pUFOzKj9YmJs9P4+Mo1H3Pj+BJQdzK7l/6mjWWSeL7T0yU5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Yu1iUE5tUZZVSrKcPtur6Bk4ggWxQJ9hvoe00qeVCog=;
	b=qzM1AlIHx5yDBpaEY9LbA4OdG5nswJTmektdapLZ3iC/7QsfbU4G5cNSJv6FIvg9mtEe
	 tXVEmCJvLR8DY7tX9frSfTU/X1RB7xNQyO8NvSruHNEiSmXCBPpfQs6ssh3afAhpJ44hh
	 or2dLE9TVwzGXoPyR0r8XHr7WPkhuWa3oxe7B+EkagH1XXm7m6JO2ZvK8JNtsa25nlQgY
	 HcPY0b4Cn8+PFj+hsWD5FA7zFK20X344Rjw4HBsx7FwgVME5HHtODmcFhPx8jj6tzVahm
	 czQFTL19Rnvn8mar1ff2TfNxatXrlILgoVccUTbvxWx43oH5HaFr2u5AIHXtifjcw4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IyceJaFL;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438F7606A899
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 438F7606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IyceJaFL
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so407131666b.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733125; x=1795337925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yu1iUE5tUZZVSrKcPtur6Bk4ggWxQJ9hvoe00qeVCog=;
        b=IyceJaFL1RD5Uj2cIYVkpqUJGYpAsQmAs62+dHkJSyi1OeJRjqJV5iWG8HiRIEvz6+
         v5bG7Tc3+GvJfr5w7o9rrzpV/rP+kCSDWiQLTz0uL/yh0n9UJ0cDcqT4+1mMHh6BH3TU
         tjBwUBiKEAkPZMNOXDM+/DrtE487igK2CgmXQ1by5XPLosztCslliB4+2MfTUt0TiVH+
         KDpQMayiU84XyR8THqFWcLn0ogiBtJoiX1HGHBFaOm5Dg4EnXHWYhCzhSiT59U1edPB2
         HKuVttmS3CGSoBUYcdz9icL5De7Rx8yMBwVwS0r2hvKsPk2y0d3E3HZHNXbZt9ZiVx7s
         H/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733125; x=1795337925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yu1iUE5tUZZVSrKcPtur6Bk4ggWxQJ9hvoe00qeVCog=;
        b=twrFiUttcdWfl47+fyPH4/jMdjln34op05PGHjzobkGFkQZT0fnzMIWB/5ff8kRXTw
         0PEg36mV7gwJFlNeMRdGUyZgwh1iV9iKZxMibQlyEW6SlnuXw+AgKaCnVM42tBP/gu8k
         uMOkjV3j8VHP6+a3y+ni9UoZtbvJJyo7qiTMuOhNxBCbW33DQZKtVS7xzLVKLbOmBIYJ
         jEnvLWv3Bp11eL80ZJoPEQ2iXjiHbrSNKsztl+XpQ0Qk3d/V4sQsJnnSWjm6FdWXHk7Z
         2GhzaOOOJnOl/mWrwj0v7z1Ncq4UbLxRb8F2YtygeFGD/OBfTmZDmESW1W9cNSWQPrY8
         6lEw==
X-Forwarded-Encrypted: i=1; AL+hErGBd463zJalRnp673+2Pw8D/nrplUjVy3/CauXyz/GvPvGLLRdHSVxmK+YbvEEfJ3QXawWDfDWJuMk4vtU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RHMZJCBkwhRIX1J3ddYt94zBNMCeQ5Dr5BpxKg3ge0ZpuMv/p
	EQpBt40siHSOEwYI8ofGh0gqkecrOZREeu5Z2zYAM8vKBwPla/T6v40Y
X-Gm-Gg: AYBFou2EF71zI2/GijROlG3P7iLIPnq0MngZ4oOGZ3STF0lPrw6duMRrX2f/k4CEUpW
	+zgzmhcebDKMrgiVr1rprfp7auyHFlUbfX5iZEtY0WM3hKY6V7Z57e+9ULriE84g0VzMnCIOppR
	E6Do+DQGSh/M3qrjRKNQKGkzEhIdxe3C7ehJinVftOdxFgN0G+SodjkXKuFvdeox666LU+17TeC
	oeK9WeySUiNoBIXhwp4vXfJ1usMO4ZO8iltHJyVpP84QEOn+GM8FnA7CaeKmGV6AHwXOLRnBknD
	90w9MD4HMbzIqHrXIGTJtZOfHWa7MYNcFKtB5q4mT7LIACZHhbkmCSGtns2yyUEydtZoBTSMFPE
	JumXLZb7LJp1wuAL+QgzHjJzYdoZZnFGGmefXbnMkie/rc+Qu5ecdF/Uqv57yiuQWxl/bjTj5cd
	tbBBxce9a+dtwc10hnuwwfYm/nOu2AgK+0CpEoefN4ECkxnmvwi4JtuXWjrSdyHlWDQUN7SopXY
	6iPZM5OZyskjJNCJnHAwhv3Sr5grEm+TRvWVOpQuOOTnWg/SGnM7SXR8VsIP19j/R06fAf3Bqbr
	/3KAztBs5qReAkXsmPTa0NWhF8YWEGC5zVyJvgTy1tkPUBDaUEzKce1XQDHdG901nnGD0FSAW8u
	s+Xf1LHwztQ==
X-Received: by 2002:a17:907:5cb:b0:c50:95b7:d189 with SMTP id a640c23a62f3a-c5095dd72f4mr610171066b.0.1794733124625;
        Sun, 15 Nov 2026 00:58:44 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:43 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
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
Subject: [PATCH v7 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Sun, 15 Nov 2026 10:58:25 +0200
Message-ID: <20261115085826.89641-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115085826.89641-1-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
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
index f5409dd91efb3..9017960ee73b1 100644
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
@@ -307,6 +308,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
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

