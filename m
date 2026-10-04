Received: from mail-wr2-f38.google.com (mail-wr2-f38.google.com [74.125.225.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219603C3BED
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132108; cv=none; b=g1N1tjWAFWAQXa7Pt9I/ydfWfoVrJ4SSoZmVE6nnWRoGo8i7mP/ji9djmN39Fj7aVT5xoamZS2xBg3xzJlYhTcsN4MYEmyX5+vAI8NQ1+fR9arurKxDaVx+mv1KHQ89KDrJY8rbARnIfF5tQiGTCGseD3sVQ2GudF/KtkV3myqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132108; c=relaxed/simple;
	bh=9abUzeZOFHUuC8XhKlIBm5XhZ3akVALxDSkiJR3sypg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTDjJAyCcchfrX6dSEEgqCEGZQsYM6gB1AHAMcAeqVaLoNhq9+XnJpE5kbxxgp8/RJsJKreS/1NMg8C5sk8yYZtYGoRyq63xHujfqauPT+PhbKafpkxO2apreNP/sF/aK/lQoJDjpL1yhEOk+CB0peipG3IK1H0mHx9KRbFdC44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXwFVcu4; arc=none smtp.client-ip=74.125.225.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXwFVcu4"
Received: by mail-wr2-f38.google.com with SMTP id ffacd0b85a97d-482f6350f89so462569f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132104; x=1791736904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OmglYMJlZ0PFFt90eMP4sh4crhV9rDL4/VEmoOSLe8=;
        b=aXwFVcu416Odp4p6YHveT+GLwwYxHD/emFL7Q/SCUuiYRV5GrntVu6ld7FhLjjFOOH
         KDsvk9XU5RLqtNjYa/EWsaBf8DT6juv5Twdg0cd3cAUcHTCIAurPvRat3k6e6ohjMAkp
         Nc5brzKocVYhQVclTFJHNQd673RmyQZc2YwRu5Y5wZkQs6dZR6qot102ZgF3B5S2M1e7
         dHdiqJfbZdowCLFOJecYFBJ9aHxhg1xMMPdne4adLHY34gVl73CpA7uDPMwwNPY7CxnL
         WiPMamKB0Q1ITMC9LaqrnGQCrgWbwWrRTePwYeWjCxO86aO7fBYWYF+JWNi0BaauRy7u
         vGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132104; x=1791736904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8OmglYMJlZ0PFFt90eMP4sh4crhV9rDL4/VEmoOSLe8=;
        b=eVJ8vXtnlTFYEH8OmHCPJPHUYHBtx2oQzxI6v4FxI6eJ5pJRExUogGcczpDwxL2dfN
         vC9Xl7ecom7AHUW5xZ60O0tTOAjoK/VbKwreBKhYQfPqdLTwzsnieW2uhCzwcEnBZedX
         b3a31eZglZFaZUHUMvS6630jgq/qi5r0nozzQbQQLA+OGbo8TWesmbv/ePOMwKOechEr
         Wk4PNokx+LaHREwoIht2BNytsjlW2h5M44syfF+zNPDGJsny2w8Cs7Hj78R2GsGNzK/n
         49kcZNaDtSiHyZs5ETn8C+Oq/sU8LJIA259CHt8/VsSC8prxWc+TJfbDkJ50aFTPAjDT
         0Gzg==
X-Forwarded-Encrypted: i=1; AKwUvBwgCQB4o22HF/71TPhBD7trUsGzzTLdP8UdAcZ17BwJzJyrbfZ/83erw+c2eeVElUp8b8bqBWXjd8lsgKw=@vger.kernel.org
X-Gm-Message-State: AFuF++mFIvnnnPG5KN3/4zlzn1+wJueJqRRVXpCFKCq5EP+2ZNxDayeW
	L5pc68ANwPehdycKs25yETtHg1YcUJ10ty3e4ozxMl5BxJO8UqrGG+fg
X-Gm-Gg: AYBFou1lL2wFqtuVMNUhfob1nOI1PBkwwZ8U9y+Cb8/qQgFFQDb3Ygf5ZjkE6Q3zOjV
	syhuuZEuReQLQyrPWI6pYMky11WkSKRLealtQFQtR6DS3ZsSNooVknQwnyHa1j4PHiUCk/a9Mk5
	az7/Uf4L4CAfClBf2Rf0aDl/UfVtqz2BMvv69mewviA5yxvG/wjweVgNKLyThU0txaWQCrs5SWU
	yt51yGroPSg3eDCf90krqM2yGz06aigXna/XKJRh8EnqFjxRqFaxYCaIlDisZmX6yFz4Ju/C9fa
	RA7upoo5NI1JyMbZ9afPPlTv8leSyC+C9ym98Gcthwdkerbb3ef850ch0CRzxtPgMqZqJVYKDnl
	QV+zbIIwA7dMiioZ+BfTzQBkf3rbQmyShKaG91ZRVigUVvuSXv+3aaFkc3EQgeu9WDjtDj8YO4A
	Wi9y9xBzmoqprq73t+R4OxcDGoj0iWG9CbT5R5HDG1CH8ynQ3qxRiAPzHanVcsjeG9q3Kp2FmJJ
	WYd7Z93gk8Nzba43Wo=
X-Received: by 2002:a05:600c:6995:b0:4a0:1e53:e51f with SMTP id 5b1f17b1804b1-4a02758572amr146705745e9.14.1791132104073;
        Sun, 04 Oct 2026 09:41:44 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f07cdsm18765185f8f.10.2026.10.04.09.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:41:43 -0700 (PDT)
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
Subject: [PATCH v2 3/3] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Sun,  4 Oct 2026 19:41:21 +0300
Message-ID: <20261004164121.193514-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004164121.193514-1-clamor95@gmail.com>
References: <20261004164121.193514-1-clamor95@gmail.com>
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
index 909c14ee60323..0bd430b90bc1b 100644
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
index 8a58eb27f3f5f..a921e40ca47dd 100644
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

