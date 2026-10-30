Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363732;
	b=0Ofd4VyOepFeDbgDBMYqC4LnUCssYKcNQ2AUx/vjuDR3fjdBJ18kPcsIbgZPcNP7LPTK
	 SPZBkh81yPArnwGgJqbYmOWyvDt9pfvaHWKbBfpZqeGM0MAtHH+DrEuUuLwT7wSY9UoBt
	 0E4yHSA/uucIRkm/xLFAPoPJ02dKbxmqviEY6IWM2saZ4NH9158e5Vue/Av5CUbB/aRJ8
	 vE2CkyNxvutmfcEaRQtI1jTgvmHqsuN3MPS4S2F5OaB1//RPD8tyUj+g+P1gCixGjy+Br
	 p+Pu110w45GWJ2TlCixIF9vPyNHEYkdJ5FLAAetvdQRf9HNe96+Ds6hwkhHzNPmcWjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M7/R3LmLUP9HCLPp+1CZga6AX7kccFyKSghLPQjiFI0=;
	b=HtcWtQi4OQmo3EuJVSHYvyi9V9JurlD44KRCEXuHCAxuLh7cIwfPH3mbe9Da95CdWp+E
	 VeWLdDhRH+HwOBsWcPAiZ2ba1MI+jWNt3EDC87WsUERQhM8W0HkPhIT08c+80oybNVZFw
	 P4iv3pBGzn5pwaZpmSwjAMINw1+XEfBL7z09X075oerGyy9Kxc43/uS+qPMUeOuWuHlV5
	 zEQEhWIn/zDxKewBlEPxqaPitEskEl9whmmnwme71uS6N3XyMkjj2tzMW3NxgH/IfEHYV
	 8LowEFX4BJd5AEgxIAMLfM6L2THg5hbjlkdC+b8ojo1urinxwXeww4ewKjOGdmNZhhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Wy93/5Vl";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E45F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E45F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wy93/5Vl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a215e64962so6123505e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793363730; x=1793968530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7/R3LmLUP9HCLPp+1CZga6AX7kccFyKSghLPQjiFI0=;
        b=Wy93/5Vl1e12IqRE65omU8GhbZMP/kBPFIZsru8ISA7tan8uB3EvGSrj+pUH/KjUWY
         JXmnJ35a+hOvAoaoOVc5VDf2+OIWJNw2LhFtGmg67V1bXfSDUy03kmhv6L3KYfh08NVr
         qERWjayJgtiqCHKtl/fIWvweSlyfrp1TThsw/lMlBPPEYYDCrGLj7Rx2Q66PgOUf1a7q
         mPCPFc6K9PWPD69NinrBkk8JoD6L2GR+vvJCJhOAc3xe07Oikq2Q5plFXCHd8OaqVNXh
         HM4bqs4WM+fgqjQMKsI2xhIhF1TWP7DCMMcBELfOA7aR644EH7+ooQUbYGSXWquRB2lr
         xQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363730; x=1793968530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7/R3LmLUP9HCLPp+1CZga6AX7kccFyKSghLPQjiFI0=;
        b=JQthHUGIY1P58Lr15ZyWFKb2qD28ohiJAAERwWwNwEbtyIHqsbO1qN2Z/uYRvsnEC+
         5442ohdzqoSjIphNLHqf04LDo9ywyawWR+A2r2td230NY5/jSR3UcjuOLD8/X32DqvVr
         LpT52t7D55g9CCcMLYvBxkE4lewXTYSOiXbbBIjEBkzj0eCD4PKqdgkPkXkGs91MYoCB
         CAPzY1lPPBqS0HglO62vn3Lffz9MmdDtlkgbPuU6A694r9yL0UM6rQKSYZXgOMJaXZpT
         k10irxKFHKlCpF48tVlqyxtPQTXeyCoutCHxs8n+pDZgobc/+1z2GgIKXYDWIsY2cfLW
         f5tg==
X-Forwarded-Encrypted: i=1; AKwUvBxLAIETlFGlls6PF612mxMSyslMZ2C3AWRUZDVX/MKTC0NLcAkec9hUCNinyDc6Fi8OTS+LReCyuLIRcMc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlAOtu5kZjNPec1U6n4yya8ZZL7UvTKmURR5Nkjh6g63y3BXMr
	MBg6Gjc7FkH9jyL3wsW+jCtZuKbMSglkUq3Q/tfwlog/PPm5Ylx1qBo=
X-Gm-Gg: AYBFou1KEaYLTWGhio/NiSIHJ7/nVOrc4EuweVLEBLatc9N4E23oagWgHt06b843/Xt
	GN/8mvn4YdY0O8js3dkI3AAcrkaX3IHnPtz84UvGbc6j97yzme1Mv7/ol3bqx+K/jKJRqHz7kHp
	hslUdXzSwVaUeuZHH1L5L8IVt9hILzwg7cGpuO86KX2H6Z2QfDXEogfr2bebqZj/Lv5z+YwC8P8
	K4NG182+rYwStUfPlVtFUmpGdoZE600YC95BMTb54LR9qam6X8YC/oL86RgtZcer05mZ8DOptQ0
	CqF6J78BBtUslfPGVmetjGqw3wf8Ht0EnhEQ8/7BX3EyQ/yQinkylPqOYvsW2naBrviV70oDyTp
	I7vKNq4IgNR9DLK9TloRDAaBn+m2iKh8fMgckPa6zfBHX8L/qq/n3WeMjba8jT1wfcRrKyNucc7
	drLSEmrd3cumNOeQnVT2IvxoMTlsJsfLHQF+OWnIxrNfvODKG6zBk+GWnTHe1nOK/m2pCeaTtf4
	ebM3nGx8Q8JrAqcKX0DZjIHCPfH3b4/xJ4ZzcERgaDIO0qHz6bIByd7nXlmZk7EjXkjulvIAA==
X-Received: by 2002:a05:600c:83c5:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4ac19329ea4mr38828955e9.33.1793363729731;
        Fri, 30 Oct 2026 05:35:29 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7270asm3084970f8f.11.2026.10.30.05.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:35:29 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Marius Cristea <marius.cristea@microchip.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v5] iio: adc: pac1934: validate ACPI _DSM return type and bounds
Date: Fri, 30 Oct 2026 12:35:28 +0000
Message-ID: <20261030123528.606107-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

pac1934_acpi_parse_channel_config() calls acpi_evaluate_dsm() four
times to read channel configuration but does not validate the returned
object type or array bounds:

  1. No check that the returned object is ACPI_TYPE_PACKAGE.  If
     firmware returns a different type, accessing rez->package.count
     and rez->package.elements on a non-package object produces
     unpredictable values.

  2. The loop bounds use rez->package.count directly without capping
     to PAC1934_MAX_NUM_CHANNELS (4).  A package with more elements
     than expected causes writes past the fixed-size labels[],
     shunts[], and active_channels[] arrays.

  3. The bipolar and sample rate DSM calls access elements[0] without
     verifying package.count >= 1.

Use acpi_evaluate_dsm_typed() with ACPI_TYPE_PACKAGE to validate the
return type at evaluation time.  Cap loop iterations to
PAC1934_MAX_NUM_CHANNELS, and verify package count >= 1 before
accessing elements[0].

Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v5:
- Keep existing declaration order, only add new 'count' variable, per
  Andy Shevchenko
- Replace (count & ~1u) with min_t() cap and i + 1 < count loop bound
  to avoid unsigned literal question, per Andy Shevchenko

Changes in v4:
- Reorder variable declarations to reverse xmas tree, per Andy Shevchenko
- Drop casts from min() parameters, per Andy Shevchenko

Changes in v3:
- Use acpi_evaluate_dsm_typed() instead of manual type checks, per
  Andy Shevchenko
- Use (count & ~1u) for the name+mohm loop bound to ensure pairs
  are complete, per Andy Shevchenko
- Drop Fixes: and Cc: stable tags since this is hardening rather
  than a fix for a specific regression, per Jonathan Cameron
 drivers/iio/adc/pac1934.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/pac1934.c b/drivers/iio/adc/pac1934.c
index de59dc27c4405..cdb730217d46c 100644
--- a/drivers/iio/adc/pac1934.c
+++ b/drivers/iio/adc/pac1934.c
@@ -1091,6 +1091,7 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 	union acpi_object *rez;
 	struct device *dev = &client->dev;
 	unsigned short bi_dir_mask;
+	unsigned int count;
 	int idx, i;
 	guid_t guid;
 
@@ -1098,11 +1099,15 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 
 	guid_parse(PAC1934_DSM_UUID, &guid);
 
-	rez = acpi_evaluate_dsm(handle, &guid, 0, PAC1934_ACPI_GET_NAMES_AND_MOHMS_VALS, NULL);
+	rez = acpi_evaluate_dsm_typed(handle, &guid, 0,
+				      PAC1934_ACPI_GET_NAMES_AND_MOHMS_VALS,
+				      NULL, ACPI_TYPE_PACKAGE);
 	if (!rez)
 		return -EINVAL;
 
-	for (i = 0; i < rez->package.count; i += 2) {
+	count = min_t(unsigned int, rez->package.count,
+		      PAC1934_MAX_NUM_CHANNELS * 2);
+	for (i = 0; i + 1 < count; i += 2) {
 		idx = i / 2;
 		info->labels[idx] =
 			devm_kmemdup(dev, rez->package.elements[i].string.pointer,
@@ -1119,7 +1124,9 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 
 	ACPI_FREE(rez);
 
-	rez = acpi_evaluate_dsm(handle, &guid, 1, PAC1934_ACPI_GET_UOHMS_VALS, NULL);
+	rez = acpi_evaluate_dsm_typed(handle, &guid, 1,
+				      PAC1934_ACPI_GET_UOHMS_VALS,
+				      NULL, ACPI_TYPE_PACKAGE);
 	if (!rez) {
 		/*
 		 * initializing with default values
@@ -1130,7 +1137,9 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 		return 0;
 	}
 
-	for (i = 0; i < rez->package.count; i++) {
+	count = min_t(unsigned int, rez->package.count,
+		      PAC1934_MAX_NUM_CHANNELS);
+	for (i = 0; i < count; i++) {
 		idx = i;
 		info->shunts[idx] = rez->package.elements[i].integer.value;
 		info->active_channels[idx] = (info->shunts[idx] != 0);
@@ -1138,9 +1147,15 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 
 	ACPI_FREE(rez);
 
-	rez = acpi_evaluate_dsm(handle, &guid, 1, PAC1934_ACPI_GET_BIPOLAR_SETTINGS, NULL);
+	rez = acpi_evaluate_dsm_typed(handle, &guid, 1,
+				      PAC1934_ACPI_GET_BIPOLAR_SETTINGS,
+				      NULL, ACPI_TYPE_PACKAGE);
 	if (!rez)
 		return -EINVAL;
+	if (rez->package.count < 1) {
+		ACPI_FREE(rez);
+		return -EINVAL;
+	}
 
 	bi_dir_mask = rez->package.elements[0].integer.value;
 	info->bi_dir[0] = ((bi_dir_mask & (1 << 3)) | (bi_dir_mask & (1 << 7))) != 0;
@@ -1150,9 +1165,15 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 
 	ACPI_FREE(rez);
 
-	rez = acpi_evaluate_dsm(handle, &guid, 1, PAC1934_ACPI_GET_SAMP, NULL);
+	rez = acpi_evaluate_dsm_typed(handle, &guid, 1,
+				      PAC1934_ACPI_GET_SAMP,
+				      NULL, ACPI_TYPE_PACKAGE);
 	if (!rez)
 		return -EINVAL;
+	if (rez->package.count < 1) {
+		ACPI_FREE(rez);
+		return -EINVAL;
+	}
 
 	info->sample_rate_value = rez->package.elements[0].integer.value;
 
-- 
2.47.3

