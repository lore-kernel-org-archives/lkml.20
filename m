Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A90B49E120
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301495; cv=none; b=OtPuPG6uXN7w+3sJngyDeAk8YzwIgJ6WVJxMlpte4NtIoymtiMdPPkuAaxDpU3hUhoQxTqobBlGA1F7zJ/OBG6f2YeITORAfVWfcgJjojGGzPaxeITHBohuyOs8oxIG1aIjP6eVd4Hsk0X+37uLxNQaai7NfYDLBzJY9nrKPMjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301495; c=relaxed/simple;
	bh=i9wB6k+gSOJqbar4HQq7tst641yPZLYwPNCoR+olQXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ac+lMdRd6L2kYAUTxfacIJ/DOMZaXewuU8zb+MCZJF4vYK38fQML0ATCcv3QlZfL87OpMBpQ39MiuhEcmJ/kIeoxgwDO6glAvKh4brVvd7BXFnDWb0ey/lYZHCpG/ORXqsm0kHCk8lnsT47HqQ7lHugp9bdROokHPgpBUChTWLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWCmSryF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWCmSryF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afe75f055so2697446f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301490; x=1791906290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IWzGAzD5eF9cKyqD/7NUq8DDIAMBDaKbaaDeJ35N/qg=;
        b=bWCmSryFJu2Im8XYnZWVIjPECjICDIPEWqOF26DU3pSgyE40v1RptM8z94G4iqWhG5
         6cdJk1j0B8x3PWq7Jely5pWZI0v8Gf5aEcQeAqM5r1iDs/zVQ763RblewIt3BkofJ1eC
         8aVv/Y0EBtFZkC7mlhRz3xWjZNS0uwZUmVBLbTfjrwuNub3zR9n7/ERmvck8/TOMuGGm
         T+gWm/EVR2lpjCyO+/nswLSd/LWHgRJn7oAIYDaqWikaAYOFfS7MFIniAkjheupANWIl
         jVhMWbOPW769hFOykWnE9s10j8bZrP3r2Jv8mBaWCS1jugjDg6CpquVZjuYGj72uF2kL
         z1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301490; x=1791906290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IWzGAzD5eF9cKyqD/7NUq8DDIAMBDaKbaaDeJ35N/qg=;
        b=h/JLiSBVJBiQIOM4/X3P5KtvfEk314rzDw4Z5GpgwkhlHvDkbJ8PPpT4HC8OQYzxgr
         UPnOY+7+k8qmGr7v2yjetn6L+In2+64TjbB908A7/5TUxcA6q4u03cMOnq9xGurv7sBN
         hQFjmEJmq3X0iq/MnDoqylxKxJqt/UwE/jufAuVyqx05/z7bVG+ZwAPDkn9neheb46Su
         FnQXQor3HecqvSs46xCyYQi08buKMTShLT32hlincQv1bwF8zscafIIfTNEx29/+2hNW
         kjY7diiwh4gfn7hcC7X1mPMU+fYtAuI3nfrlOnWnsrLS4xRbq1dNdbOWdjnHcsftJgaD
         LIXQ==
X-Gm-Message-State: AFq9FYKjdkM3BSCS/Qcn2rW1/bltA007adribcwngsNwm0wZQm6uFiRj
	aTw2fYA9zU1qUJ4tT+nG2bPtwNXDjWf+5SkiQR1C6reVMwee2uI8BNpi
X-Gm-Gg: AYBFou27W+GliHDHaBFqmb8FB30uDuJPnN6vhKXFmnmdDuYUaQ4keHrMhsJ7Ke3//6L
	nIh/mYIeobIEk8jJ/HMxqn2TzaxNC8XsuQuyOZiPTKauk2WUmPRBo4hTmMn7ljSG/FoBkYHKiR9
	1d0Y8VbYMZFatVAqWJ9UZwSt1wo51RqCq+9ngk3OnMgzBKI0Hw0SiFbRSTmGt+6q/ZfUfDdgXc9
	6lq4vX4nZNapWS27luiyzgXMnSY3nZG2fGdiQhkWjvXrqqf8NZojVcGu7iaztFR1NeVjcNo6nNR
	DIY9FS9kMp/7Xp+uQCDuXStiXFLLOXS5L7gKqYZQAn3nvcxRRWf3fIFToAd71B7rBqYfnE71hub
	h60ZU4HtartwidMgYJ8qLMEwinsDUVhJVPv+xLX3KB9qZkD3QKalFsYCe4JqKBENo6e0nv7Jlnm
	KPgKHQO1tJjC0J8lKPm7+SSYrFQ1RNF3mxRM9qZZXyCrfjsnIm1jFAt1K49gq8mZRDnq3bHiXeh
	VlOCkEQ8A+4Fwiqcus=
X-Received: by 2002:a05:6000:25c7:b0:487:489:7af0 with SMTP id ffacd0b85a97d-48c6d15f9d6mr3766141f8f.17.1791301489629;
        Tue, 06 Oct 2026 08:44:49 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b6e6sm327615f8f.14.2026.10.06.08.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:44:49 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 6/7] regulator: lp872x: Add support for input and regulator power supplies
Date: Tue,  6 Oct 2026 18:44:30 +0300
Message-ID: <20261006154431.318936-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006154431.318936-1-clamor95@gmail.com>
References: <20261006154431.318936-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LP872x support dedicated main power supply input usually shared with
parent power supply for one of internal regulators (ldo1).

Add support for retrieving and managing these supply regulators using the
regulator framework to ensure proper power supply dependencies and
power-up sequencing.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/regulator/lp872x.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
index 3d95ca7fa0246..df19a5cc94d0d 100644
--- a/drivers/regulator/lp872x.c
+++ b/drivers/regulator/lp872x.c
@@ -471,6 +471,7 @@ static const struct regulator_ops lp8725_buck_ops = {
 static const struct regulator_desc lp8720_regulator_desc[] = {
 	{
 		.name = "ldo1",
+		.supply_name = "vbatt",
 		.of_match = of_match_ptr("ldo1"),
 		.id = LP8720_ID_LDO1,
 		.ops = &lp872x_ldo_ops,
@@ -485,6 +486,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 	},
 	{
 		.name = "ldo2",
+		.supply_name = "vin1",
 		.of_match = of_match_ptr("ldo2"),
 		.id = LP8720_ID_LDO2,
 		.ops = &lp872x_ldo_ops,
@@ -499,6 +501,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 	},
 	{
 		.name = "ldo3",
+		.supply_name = "vin1",
 		.of_match = of_match_ptr("ldo3"),
 		.id = LP8720_ID_LDO3,
 		.ops = &lp872x_ldo_ops,
@@ -513,6 +516,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 	},
 	{
 		.name = "ldo4",
+		.supply_name = "vin2",
 		.of_match = of_match_ptr("ldo4"),
 		.id = LP8720_ID_LDO4,
 		.ops = &lp872x_ldo_ops,
@@ -527,6 +531,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 	},
 	{
 		.name = "ldo5",
+		.supply_name = "vin2",
 		.of_match = of_match_ptr("ldo5"),
 		.id = LP8720_ID_LDO5,
 		.ops = &lp872x_ldo_ops,
@@ -541,6 +546,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 	},
 	{
 		.name = "buck",
+		.supply_name = "vinb",
 		.of_match = of_match_ptr("buck"),
 		.id = LP8720_ID_BUCK,
 		.ops = &lp8720_buck_ops,
@@ -556,6 +562,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 static const struct regulator_desc lp8725_regulator_desc[] = {
 	{
 		.name = "ldo1",
+		.supply_name = "vin1",
 		.of_match = of_match_ptr("ldo1"),
 		.id = LP8725_ID_LDO1,
 		.ops = &lp872x_ldo_ops,
@@ -570,6 +577,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "ldo2",
+		.supply_name = "vin2",
 		.of_match = of_match_ptr("ldo2"),
 		.id = LP8725_ID_LDO2,
 		.ops = &lp872x_ldo_ops,
@@ -584,6 +592,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "ldo3",
+		.supply_name = "vin2",
 		.of_match = of_match_ptr("ldo3"),
 		.id = LP8725_ID_LDO3,
 		.ops = &lp872x_ldo_ops,
@@ -598,6 +607,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "ldo4",
+		.supply_name = "vin3",
 		.of_match = of_match_ptr("ldo4"),
 		.id = LP8725_ID_LDO4,
 		.ops = &lp872x_ldo_ops,
@@ -612,6 +622,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "ldo5",
+		.supply_name = "vin3",
 		.of_match = of_match_ptr("ldo5"),
 		.id = LP8725_ID_LDO5,
 		.ops = &lp872x_ldo_ops,
@@ -626,6 +637,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "lilo1",
+		.supply_name = "vinlilo1",
 		.of_match = of_match_ptr("lilo1"),
 		.id = LP8725_ID_LILO1,
 		.ops = &lp872x_ldo_ops,
@@ -640,6 +652,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "lilo2",
+		.supply_name = "vinlilo2",
 		.of_match = of_match_ptr("lilo2"),
 		.id = LP8725_ID_LILO2,
 		.ops = &lp872x_ldo_ops,
@@ -654,6 +667,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "buck1",
+		.supply_name = "vinb",
 		.of_match = of_match_ptr("buck1"),
 		.id = LP8725_ID_BUCK1,
 		.ops = &lp8725_buck_ops,
@@ -670,6 +684,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "buck2",
+		.supply_name = "vinb",
 		.of_match = of_match_ptr("buck2"),
 		.id = LP8725_ID_BUCK2,
 		.ops = &lp8725_buck_ops,
@@ -743,6 +758,7 @@ static const struct regmap_config lp872x_regmap_config = {
 static int lp872x_probe(struct i2c_client *cl)
 {
 	struct device *dev = &cl->dev;
+	const char *in_supply_name;
 	struct lp872x *lp;
 	u8 general_config;
 	int ret;
@@ -760,6 +776,12 @@ static int lp872x_probe(struct i2c_client *cl)
 		return dev_err_probe(dev, PTR_ERR(lp->regmap),
 				     "Failed to init regmap\n");
 
+	/* LDO0 parent supplies chip itself */
+	in_supply_name = lp->info->rdesc[0].supply_name;
+	ret = devm_regulator_get_enable(dev, in_supply_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable supply regulator\n");
+
 	lp->dev = dev;
 	i2c_set_clientdata(cl, lp);
 
-- 
2.53.0

