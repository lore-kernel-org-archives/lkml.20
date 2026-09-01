Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F7C4746CC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253145; cv=none; b=eTw5WvXi7JBeW9bfrfN7WeA9tHB3ZDMdxTvIdt+LvRtSIOotz/365DBysxPTRviAZBnI2aTVL13Gi+fe8/A4+hOh6y2t5vzeCG5FvCvKQ3OSmTkFqBVAdJ9MiA8ABz+6fmZ/7Tcc9LUef8A7NlM/dho4+pSi9q2LQLKmLBZ1CqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253145; c=relaxed/simple;
	bh=7M6nbeG9tPY43T+AEALi+OiwCuMxXMzSjBxd0ttccnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SI3xV+tzacRc3HHBQCTUD3zwaoq7LoBWMWyB+3TKhWEPIFpViucQuWBjAzh0PmKTpfvgfsp453gss8bV6f/ARVX1yGUPjZ2KUy9YvdJqBdI2XQ1l+7t6UFRQacrJVCXLc2HhhQm7W2rJLFp/pDJMcoLnJygoUD3MTejmKk7O434=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=eCWAHySr; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="eCWAHySr"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1677c91969so434151566b.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788253142; x=1788857942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5XBJS5aRnfQSYIGXFuLlH4XgQF6yHiUe72vjHiZv9s=;
        b=eCWAHySrgIV9xLjilL0tl6n/8MaNFHzyR+knDtWydEGW62yFm76iFI7Y8Tp+OIuqSp
         DnA4ohMN+1yiOHdfipHC1m9LClceJZiQxzO5EEG7+Kx/uVHoWzEMtKLcJSOddJ9B1ind
         yPY5dB4Zqi0egSoWT7r9EcL6+XEMY+mXDGXAZ3D1Gk+eEBRINbiciMlYb4TW/k6TfLcT
         TgNvwGLKLsJr54uqU4ZSvH+7MCRL0kXwICgrhdHeJsNpSk6xylgk5JQeu6q5EsgaFSM2
         RGk3W1u+0YnpVwvKJ/z+y5pqC6/+q2xzh+wdIZ4CXO/HYL383SEFtnpTf019Brtm9vxe
         /lZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253142; x=1788857942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5XBJS5aRnfQSYIGXFuLlH4XgQF6yHiUe72vjHiZv9s=;
        b=RpfAkPpBKuQfib6n+zD1rGdiP+icTFk8guyxcZPNFptlURdojZ0hCwfmMW09aKfagI
         PYS96X9N/woS7+3p9gB0yHbdVcrYxYFeHd8OH8wi+0p29Qu7sDRqrp3E/7fZuWMaXtdx
         OvBHody5r5IQfToRRjqTgmXKR75MboS4m7UDj5nrKPTYOSPZMNh+GxGvRr8SkBVrmjGB
         NYEMP5sJI/NIHmT6v4ss6NbM5YomSxTLJPRxgg0UsCktTM6Y3Yf+FGL4zOEa4ZgsZH2X
         pJVSs1ALe95KVWSc7epjR2WO3U4Ct1eI1MoxpLATYtdQJzuukJOrBbxCGDp1RlQVpitX
         PSWA==
X-Forwarded-Encrypted: i=1; AHgh+RqGGiTIDWiqbJTj4cOJvASSYH9xOQKCg6k0/n4K8v0NffCrrKzJEZ+YZLJoLEpZLr0XiPboz1feFrdMHcg=@vger.kernel.org
X-Gm-Message-State: AFuF++nLkkFifSmJCJb3J1MGa7kj91r4ZrIY12os7tcxPuo8nOQT+Vvj
	hx+R9VHOkpZWU2kRo175e2p9wp/ms9TRu8OerOSoJa6Hj859bUVNXoCa0f6EWAX2ZFABKAjOZ9f
	Qz50K
X-Gm-Gg: AR+sD12Yar89+vvziN5XwvZuv0XOLeVBY8p92oFK/o1o171q7b1ZB9X+g9+fIYKnZwq
	P3e+kf5mljq4FmihaiQI0PMvfd8PPrGN7zVd5wEBlNx3h3m/bvzuQ9eGv9YRO3FrrfqPGs7kKNO
	Z82qNhSdAMjbz/eXycxOnpMy8fkqRQwHJL91aT28+7ggFDk12x0TQSF1XtQ7hcsbOJAQie9d2zH
	QiCD594DuIsFyXbyxaJ4gJh8xVFq5RFekrMSzrVazjQkQtMpGGm6uWP2IxVdU0LIauSgQ9P8UHr
	HE0tjYOQpnRRujW4KjH9/ZZw8GWsWfnECEiHMALuRwfx+zYIJgaXLqiXgqts5AK/DKyQ6pYjFlK
	GjtA+6g73MVWXtTEZ9fTq45flJzllJBCJ09EXKy47XWTh2xdC+4iujWml1g7jG8Q/mFFm3bNzXL
	Gm56Gu/a2l6zaoBBCi69OCSRlEfrBHnebi/OY1d+OLD1A6wYVI1jkstJL98wI7fxA3RHNWh8aMu
	2yyEAhXoxFnOf1wXFr073RBOMM9yvhOuAbhxNcu31g=
X-Received: by 2002:a17:907:3cc2:b0:c1c:5aa1:de57 with SMTP id a640c23a62f3a-c2557030696mr1955254766b.13.1788253141904;
        Tue, 01 Sep 2026 01:59:01 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2564e314a1sm511942566b.42.2026.09.01.01.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:59:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 01 Sep 2026 10:58:57 +0200
Subject: [PATCH 2/4] regulator: qcom-rpmh: Add supply names for PM6350
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fp4-regulator-supply-v1-2-68288ab70aee@fairphone.com>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
In-Reply-To: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788253139; l=3749;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=7M6nbeG9tPY43T+AEALi+OiwCuMxXMzSjBxd0ttccnY=;
 b=7SFZ8HclaBruaPUHto81Cu0JBen6SHqfGQODtd1jNnHZc9QBEOVltlW8XJwjkrB4gH1llSGzF
 b1js7DE1B7oA6C36kBVLSiNZB8UnGgOglhKPBpz8cPKsYvc1bzTVxyo
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The supply names for the PM6350 regulators were skipped during initial
bringup. Add them.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 46 ++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 25c14de3cd8b..dd2265961151 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1589,31 +1589,31 @@ static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
 };
 
 static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
-	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, NULL),
-	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, NULL),
+	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, "vdd-s2"),
 	/* smps3 - smps5 not configured */
-	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo4",   LDO,  4,  &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo5",   LDO,  5,  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo6",   LDO,  6,  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo7",   LDO,  7,  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo8",   LDO,  8,  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo9",   LDO,  9,  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo10",  LDO,  10, &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo11",  LDO,  11, &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo12",  LDO,  12, &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo13",  LDO,  13, &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo16",  LDO,  16, &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1"),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      "vdd-l2-l5-l7"),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
+	RPMH_VREG("ldo4",   LDO,  4,  &pmic5_nldo,      "vdd-l4"),
+	RPMH_VREG("ldo5",   LDO,  5,  &pmic5_pldo,      "vdd-l2-l5-l7"),
+	RPMH_VREG("ldo6",   LDO,  6,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
+	RPMH_VREG("ldo7",   LDO,  7,  &pmic5_pldo,      "vdd-l2-l5-l7"),
+	RPMH_VREG("ldo8",   LDO,  8,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
+	RPMH_VREG("ldo9",   LDO,  9,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
+	RPMH_VREG("ldo10",  LDO,  10, &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
+	RPMH_VREG("ldo11",  LDO,  11, &pmic5_pldo,      "vdd-l11"),
+	RPMH_VREG("ldo12",  LDO,  12, &pmic5_pldo,      "vdd-l12-l14"),
+	RPMH_VREG("ldo13",  LDO,  13, &pmic5_nldo,      "vdd-l13"),
+	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo,      "vdd-l12-l14"),
+	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo,      "vdd-l15-l19-l22"),
+	RPMH_VREG("ldo16",  LDO,  16, &pmic5_nldo,      "vdd-l16"),
 	/* ldo17 not configured */
-	RPMH_VREG("ldo18",  LDO,  18, &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo19",  LDO,  19, &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo20",  LDO,  20, &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo21",  LDO,  21, &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo22",  LDO,  22, &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo18",  LDO,  18, &pmic5_nldo,      "vdd-l18-l20-l21"),
+	RPMH_VREG("ldo19",  LDO,  19, &pmic5_nldo,      "vdd-l15-l19-l22"),
+	RPMH_VREG("ldo20",  LDO,  20, &pmic5_nldo,      "vdd-l18-l20-l21"),
+	RPMH_VREG("ldo21",  LDO,  21, &pmic5_nldo,      "vdd-l18-l20-l21"),
+	RPMH_VREG("ldo22",  LDO,  22, &pmic5_nldo,      "vdd-l15-l19-l22"),
 };
 
 static const struct rpmh_vreg_init_data pmcx0102_vreg_data[] = {

-- 
2.55.0

