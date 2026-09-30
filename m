Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D5D377553
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752536; cv=none; b=riaxGul3xJqhyLa11kKHDIC/toP+0ZIyeOi8b7L8jiXDwHaNghMjVGd8yinJM4zBpd16PZsOk8y5aFrhGMMODAo57PQ/o7ff9pjhazHFtAD8LRBbMo8TMQAo0cd7r2wtHnMahjeOOSifUTCTpU98SRWZoWRLPh4qNusj1SOV5DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752536; c=relaxed/simple;
	bh=Uv8673BXW487YhAql7BVA6vApReuaTTxPWI2C9lkqJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UI5t3cjOZ54C/wFRONnPndKq5d+r/2CirFetq05YCjWUoYfnmeXS4/Ld4RWn1w57dCd2Z+oQ3G4u2MoATMtvM8L7PyFMYx8qFTIDrgzZdpXuVKU99ANdTtypmJZmmVxI49+jt68/CQMwUHPnuAO0kfBpYIyxptj+aegFFsoupLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3FUjCVQ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3FUjCVQ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso31376115e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752528; x=1791357328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91UgRJj2a9cqCekJgIMfhdUvCOQ/1gwR4pNIdWvIxRc=;
        b=Q3FUjCVQwjaQ2UWSq/dqprUKHjBk7iUytEtWe6w+YKxMgWGK8bOuvneYGaO3+o1Qz2
         upsOVsiFJ327T/spzqJr10EzSlYSpYJ/KI0NVvCpXA0PKGbMS/LiLqtFWLCLmcHr3WtR
         pJiWfNUzILK/ZiJvheecXSw0Yf8gsnTLD9dI0TIvr655oFFqaZKMsutHzv1dnVqx38WQ
         tvtBHX1ETpMCjDc8i/y1+y+byVpnUeGVmDv8v0PmrdOLr+w/cWFn5MGzW8VZceloXHlg
         GVtFJWUjRCf2I3s/8SD7ojpSX6+LY98zEQtCGnsVm9tuBu7v9+6PBx7mSGuz+thrJWDE
         6fkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752528; x=1791357328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=91UgRJj2a9cqCekJgIMfhdUvCOQ/1gwR4pNIdWvIxRc=;
        b=KYW/1pDdDVhtdTRNUl1viTGrXpeCjQ8aK0XktRUHmHJxRqjIMQ26msARWe9iX4jY2G
         eEJdSEBItQh+5VIqAnFDH6XrmpVp9/UHH5OlmWwDaXxIcEr3uYTkeiv7q9LASsj2UQa9
         w5/qPWHgZ51i6JfTOBgpi1KzghIcw2e/pA14h+p7HS5XrkaP+RMUEB2uxqVoqazw93XB
         f/c0NFultWlP+VqfQqIzpYY94h+DrQ87Q4nKiO/JfibDDyq5DY49mm31YLq0erDMPpQZ
         0NmLksFut7W0ydZ5mVgHVAcfqDh6nbKFWhTV2EbKDNpWqfImBxdL6RVrk2rV2l1z8Ix8
         TUaQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/Ku74ZUHvdne3RlMItKrafD1cGfCnnCejjEdKGqBPY9BHRF7poWcwVRtXgatCsBJc0+QpweoUPkTy8nI=@vger.kernel.org
X-Gm-Message-State: AFuF++nMQI+QMgCr6PGeKIXbWx4DnU9wuxuE/9CXvRmzPrB7q9rmdKdG
	nMKqfDUbYkQXcP99d4gBLVkrptLzO1B3T2JUMGPkkliQp/mBFdmBJHuj
X-Gm-Gg: AYBFou0VJuo++ivTld8I/BySxV2JpXHrxQWQXBPGUvGuiNDLj6Kos6z8zaOXfKc9hK1
	MYkFy0gj+Lh60iiX8Uqpsp0VXaWLOMst/fSXNch5cH5Hi4Cdu6AmLDLJdki0kTquRXxR6MMa91k
	hcOe6f0TnrFpnDIrVrUunhEDtbNrxX8DUWbGcgpUbi6tmogenSeDZnyi/LOZ8K7gA3vejedHNhC
	O3EIxbgbqiD1HLwdz+pvljOW9tabGsk7QTl1TKFt1Ri9hzKSHgpo6GVqbxZwN09YxDuvmD4i5DI
	BJOJYs6pNJka49BXIr8jJF9WXte7Qlx5dlqs0QyROzQqdJgBllrie6P1DR/qOqbU9BIpvZK6zCS
	6FQAgjGZLxN8JqbaTpBVjNJBieSM+Wrj++rNTfy/o9qzlWdPzUoWOwd/AVrTLisUp6ZREt59B/I
	m093ZVgA8VltiDDr4FZVSH8oqLh8xHDYKnhvQVkj85jMjk1YstB091H0feCC2LLzW8VKRSPpgk4
	VHUjQXOYVWmVkrHSrs=
X-Received: by 2002:a05:600c:3b1a:b0:49f:c451:b4ab with SMTP id 5b1f17b1804b1-4a01b12b310mr5780705e9.29.1790752528575;
        Wed, 30 Sep 2026 00:15:28 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029be7e4sm1256979f8f.12.2026.09.30.00.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:15:28 -0700 (PDT)
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
Subject: [PATCH v1 3/3] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Wed, 30 Sep 2026 10:15:13 +0300
Message-ID: <20260930071513.54697-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930071513.54697-1-clamor95@gmail.com>
References: <20260930071513.54697-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
index 8f6d7956e79b2..a9a11be373916 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -17,6 +17,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/aat2870.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
 
 struct aat2870_register {
@@ -309,6 +310,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
+	ret = devm_regulator_get_enable(&client->dev, "vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to enable regulator\n");
+
 	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
 						  GPIOD_OUT_HIGH);
 	if (IS_ERR(aat2870->en_pin))
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 4d399d0486d19..4cbcb277ff20d 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -114,6 +114,7 @@ static const unsigned int aat2870_ldo_voltages[] = {
 	{						\
 		.desc = {				\
 			.name = #ids,			\
+			.supply_name = "in-ldo",	\
 			.id = AAT2870_ID_##ids,		\
 			.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
 			.volt_table = aat2870_ldo_voltages, \
-- 
2.53.0

