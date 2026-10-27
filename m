Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100780;
	b=NDEiFNZkZ46hbUN9TNIKkb2PWMvjljaDnYFG+FAGeHjB0J8RWOsdi7ls7neeAMKRDROx
	 eCHdnKAci36eK7HZ41xvNXy4Ux0nmW8McP+xyEP0J4EXOC0Zu9Tsg7+OSyQWpwtdx6GGg
	 JD8G3moBmGzZrSvJ/gN7dGOrlbELZfBokpyaOypR3v/H2EsTpBB8q+wGfAsd1/FqWoSaW
	 rJ3xNMNtolmQuYQAnqtA+M4XwSma0n+BnH9czg0fUzpnKtB5RoKZDNpjFQteFjBeK3O+H
	 X5+aeLQh5qEtJqNPgz4f81rNPoQR35ZUCHA8VhFKwjyuSz5lLkvlVkjbgJFsf4DuStA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
	b=r1hl4elWOVSi9O2+pHR06A8RB7EIFBE33TuWcteS09XQZ9XAQBLlJnFGOIlAwlsLc4HW
	 0dYGODVNiteXGPJ5OLseShLhiTr1vkMWRumjMCjCWczZyZ5qW15atG9+u0S+BOjIbtsVM
	 uy23CtOeUk1nuFTH8cqbwWClgIZ2Ql+KzZciZRQ/wG4cq4bOfzr30bQckNsqs8bp9iVjH
	 nijIZv2ivLR7o9FH+Wfjqkmw1rJC1k8zfxpV5r+YkRaqneE3Av2th2cv6sOVXOjlhl+0L
	 ZtG8oWNCdvUc6iZMIkJ7Rf21vxE5kBxoJcvsfLnHZBiIV/FFKRA97toftUtIZmL1ILA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FysbPPrl;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA5E60A3835
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA5E60A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FysbPPrl
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c423b145922so539800166b.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100779; x=1793705579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=FysbPPrl9egILZFnpaxPn0Dc65tbxh1CZJ81fu2H8XpNxGeN25sllD4wx+hX87H8OP
         0MfAMCr5e3RSZo2UvGvDtleAKoNkQeAzWPL+Aj9bbK7MgpNAC3vO5pgr/LcDb/EqUu6r
         hSB23AHtxKJImR+2G/y9WE1rOlPiE/4nUOLN51UCzPFPhbYlbh4aXcTgnSAKQ2US1/RN
         Q/Tgy6m4iLSNbLWOCCG714HDnmzYHmh4e4Os6NZYwaaGdvWcTdNoBsIgrHJK2Ka1uopL
         EdAjvZtITVYPop+c4b4f93tJMwv+l3bJgR51VcWOf8K2k28zZJw6LtLKOuxcfrZOjFwE
         5zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100779; x=1793705579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=gl1MXLcy48Vq8uImHQ31ZVK3XUYHVSWXiKuiQj1aWFhKy9Dh8LgdH0oc27T/wz/wfV
         ijb9koppjZfQ2LsT5XT7u/EERcWTa/GgpJyyDDXnGQYH9O4E3H5MAsHveIDCeRRrART8
         FGRiyjcc9ocjtGZoJpg9Gt6groUvyTzZBfnbomov4uoe1hrm0ZDqoC2mL+FKcbq0/Dsv
         SJtCjHf0qm5QHoY9nrUAW1wb5IMjsYJmjRdf723pxFOniPr8DUOSg+YuozDEd4zmXVm9
         MOCbKmkf/mCoNhmS+izOxUanT3LevspJ+pmy/veH3TwkcnsOLw0LtpiWHQeVmaE1gbr/
         SMlg==
X-Forwarded-Encrypted: i=1; AKwUvByK0VrZivXOPkuTeUafPOtxFLhFiSk2V4eB/HaxxVT0EAbQTH33K23aza0G0G9D3hkUBURifRjsw3w2/0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwi+o2IuC6PuJ10rYGhH00/dzFmhrFmJh6GQbbht73O/eFlI2Q
	5TmL9b5Rzb191lnQfMS906TMUpZw9qxmLp3Y512fuZ+jtE4G6STqMMyT
X-Gm-Gg: AYBFou0qtXwb8kqYqRZw80AFVXw7o7F29p1/FV77tB6sTBSXfldULd16IyGC4znue5M
	ULZjwbl9RMQkFb0cRtL9b0FD/X3evNGDIMmZXx1cR3U4vB7En//kButWkPKCuPGxWe5bjpCvfhg
	JUgtnSzacob3whU3oj5pihjeELmzNBZfxPsvgJP0oWMQem+/GQd08kfV6xw5rA1wLUyRxsP2yC1
	9YZbAsF8Nu/RUsoENDz02mA68QgqPdTA5Ak3Q/81OTnMrzoE/5s3FmNAIlvCCTzi/GkNN2pPSra
	UCa1/sS6DhKlj3lepsQZXj1qcFw2RpI0ZJPuhP4/MkFHyePy4OCWctcKzuEZubhOP3lZHgA9Fmi
	PH6AlXvGYlroFHTD5ztKfzkurK+l94kuYfN4cpNu2psPH1nV5jz1r5tKJ2MxpvTEBSeYMYBs1Zb
	uOLe/p3B3RDsuGLMcAz4B/NCFm6vcYXKN1lMKPpquqsZVfRIaNYsb0FMhJqysfmV359/SZDG9pe
	twObU0Xd8GXJuwjH1pN/nA+La2IwCqcRY9i1fJRbEczpEGZKiOL+EQQ+1NF/3V5Ml8oAA39grg+
X-Received: by 2002:a17:907:6092:b0:c31:7495:e57 with SMTP id a640c23a62f3a-c46bde9a0eamr971176066b.44.1793100778881;
        Tue, 27 Oct 2026 04:32:58 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:58 -0700 (PDT)
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
Subject: [PATCH v5 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Tue, 27 Oct 2026 13:32:30 +0200
Message-ID: <20261027113230.47538-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027113230.47538-1-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
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

