Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA274D797E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404591; cv=none; b=Dcy0u2Tk15y/M9xaLB6S/1fykYPNdMCgu4z1MZagMU6Ek8J+P/CNXwMl+zBkrP3itNKke3E7wn0MQZcgqsgHl6dZFnUkThGrIkoLpEiclUaUXCwCm2768hrQaWyCmRg0TRyC5Ht9eky9e3bFr3RCrm49ve7swXRdEmuUzmg1BrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404591; c=relaxed/simple;
	bh=dE+CLRTmP2biIMs5iXmOIJYZyHULbF2+dSHPt4eaWFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CUby/dRw46GLRWdhdWusPBIwi3VqKNOYEUC1lnrvtPT9B2JdSpK+RTDn17/ReYehePivd5fOlLLuipdxFZ34C5inqnlJyYKw3B/7Q2wf3QRZfqxWGd+MqccezkIPz+zrPfjFjrThnlQ1JrML+cZgWLtO44PkxrX/EPh8feZecLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6qji9U3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6qji9U3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so17263065e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404588; x=1793009388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOBCTDJ4Zly3dd28/nrymNa+BhMmBCq2pAK/siAAt/A=;
        b=Y6qji9U3pfynSD73L35J7XBpx1K3GqRFlOkvsHy/FFdsFLcUzF+XHmL+uR1sGHViRq
         2mmTUyxpsLVUIcUktGAPiUICDroXdIo5g1XaSCmvLEAI+sYh6Wx35r9fATc9XZcNCSsB
         ySFRxmt1wnxglvvZ97tdt1A7oqXJlIv3fhIFeOLNRwJK0A8dn9ziBilxLVQeqAWmT+Of
         hvtgXbWufjNO828S8TJ5zgPeNkH851rvsHNFeSGR4N6VT+4HJWamrbZ+WJwpX4bELCfL
         yS0iaM5J7DeGnaAUycvMskhHRJBR7+8NVD/NV76sX3Irbtzal0i1lmRWyG2J3kGmZceF
         i9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404588; x=1793009388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aOBCTDJ4Zly3dd28/nrymNa+BhMmBCq2pAK/siAAt/A=;
        b=yTmtw1jisu9xr0oKE4aQtO1E4LF+TjdYjOY5z19NOgczvnf7FBUyUaJ9illWB19fD1
         LFmLi7osh8lx8eTXVoI66VDcfHkfii4Rxt2sV/YOmZe18XI1oMe3oXmarGD2AKNus4ej
         qX30iHr7ZLDjz+8u2xZRcA2vPcSGbNHn9eo+oWg5Ri85o6cTWBYHKkT0I1w3S8/x1EWN
         RQ6CqKclGfIQcXG9DUL/xB6cPzibDpO0AmEYce2IUa7MtMW1x3W7ZDLh6sd/P50aQkyP
         uvvqKqtVAIWJxXY21AG0MkB9lD0y8ltJ3bRUzAx4lH1ve2PrC6Y421JzcISPOc4TxeUu
         l9+A==
X-Forwarded-Encrypted: i=1; AKwUvBwaR2N0VgU4eqguLmBoqsrHT8ojMS4/1wfmXCcvZoVYYhRgILAk6radjITsDrtqcdlB9kQsFLpkyeLs4xo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY2FbWy090XiYI2Dp1yCZMeL+qsaze8n1KW14wX/3gtjpLz0qk
	dbPfRxaoGOciAsBkWb0eZyApPL2ln8yW/QWSCJjkmvcY+WGFqXZ0M2tU
X-Gm-Gg: AYBFou2W74lxvUyhstw6UV4/ZcWMtC3Ne8eXECku+ynQpWXJBryXaxCAb10QXwOpzi+
	Pyo4rHG+m8Y8RLsUsIoahgFe+zFk0PeBcRApZr5AeEqq2BqBcB3wjLfUrG9lMKseOUw2kcI3LkB
	tEr014N+aDeaJpYvky7g90FZqH+87FGTj9tEOEgPgpEyfWJNClm3s7nZwyRwxK3T5lJv7c7he4w
	R1HIPGgOXuMzKtXz5JLDQVXzRRn+/eXex1yGcugsp0Uclk4yzPgIhYvMX7n29OpaIjViHz1+hZ8
	LnyPQHteR89AxxcZl0mzNtF3M61DPk+wvjIl5bEFJuNdqZePuI/QmchwQmxCv0npc8xn0e28sVf
	iNNI9YRV5pK2E7BsY1NjiGLwYLzJFGaOd8MZbAyp++X2f32/ZebG2OQki6MTLNbJnhvixYVb+EJ
	iZDwYyCd3dbF7ZuSOdc2xx0zDTKRIKsiSuo+9JpSqnGJ1PSLZnxxAOxeHMTwDnSkHNpYFXbjy2L
	uaIKtQ4wh/8248ka7NeauC0IFqnpA==
X-Received: by 2002:a05:600c:3e0a:b0:4a1:ef9d:1b68 with SMTP id 5b1f17b1804b1-4a1ef9d1bcemr8412035e9.10.1792404587670;
        Mon, 19 Oct 2026 03:09:47 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm510533485e9.1.2026.10.19.03.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:09:46 -0700 (PDT)
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
Subject: [PATCH v4 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Mon, 19 Oct 2026 13:09:30 +0300
Message-ID: <20261019100930.110954-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100930.110954-1-clamor95@gmail.com>
References: <20261019100930.110954-1-clamor95@gmail.com>
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
index fe43ef675f257..0284c5fa8fb54 100644
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

