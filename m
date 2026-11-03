Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731832;
	b=GBoO1ERqTjaqGTy31UaQZjlZUpMLtpXdP22soCvBWYZsfJqvDGGdaNDPlNO5KeYz4Whh
	 uLKLxxQZm/FD/xQJjd9kaZVJruRQ2rLSSnbmGMT4ldjZSK9XqzQwsQYheemP7Vd9oKYX7
	 dxKk+hj7qHDLhcAf6imuVxomedHCMA1hIjrfBBRQfZsdgw4r3ABSliWIUoHUEIGyHc0HC
	 Aa7QC0pbFEUji7Z2GywadWjDqjUvdzcOmhNmP3Y5IrTqv6wQQCXpQtCNwOpMj98QZ6tjS
	 N9L7ed3ku/2/ZAYlmaifv9g2Np0kgYXrE+i7uAvB7B9oGGz/LO4op+uAF4qszIdREzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2+BNVfT+YGkM3Yz+ODfgwGeUEMVddxdSBH48iV1scYY=;
	b=IXYwltNCdY2QywtpAq3LqtHm92ovU1A0wy7c3uqYXp8dA8gSKdSJeahuZWd0sJS5MjcC
	 sQ2t3Onu1WbpXqaL2Pio1MQb+T0MZuUu1l26yhQr6geLGu5oUdCblRHp8i4F1ArKddtbt
	 T0+i/dTyL68QPrwA1ET1IsgG9Yik9MlitEBuGTMk0OwhRfiVUqtNoi2W3tpqQLYI6Ggwm
	 0WEZA7noQOa9bXksYoyqRnemlbb6gYcXkikdcdohJDd6fqhhcyu7nFo5nKB1ILGQSZx+l
	 P4Yz4wYcboU4CDycYGrg5pBMvDfShs4k9fRx7d4NLyKu4SYPSLmToR4eKgxIlnxp+WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kyKhgmWO;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C29606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7C29606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kyKhgmWO
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48bbb06e746so2279757f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731830; x=1794336630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+BNVfT+YGkM3Yz+ODfgwGeUEMVddxdSBH48iV1scYY=;
        b=kyKhgmWOK0i9NSCzSqQhh1tie3DdyVlciR2eGqB4dj4kY/gYUy/7IVOd8gaRQwcpBT
         MqXfbz5SfcJD4T2B94Ndx2XJuF75XdRoSKoEojKsEmNl/PTBVuMiFJgqadnZYnX275nW
         NIgvLvwll9px8W+NvzMiuBBAPbpPuMSiJinVrN8DfFkwgakIu2sdvIGEzzo0js0kg065
         v/80Zop1sMFspL8eawTb0qlm9cGqUeOnqfiXgKUL1q0ZFoUf19ytWTuWV9eDBtEdeL58
         fQHEEzSm91xKgFIA6TY+tXcGRmEuRMigDnhItAQ8M2m/pnV7MQjBGZeMzCxYgj2SvaQH
         u80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731830; x=1794336630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+BNVfT+YGkM3Yz+ODfgwGeUEMVddxdSBH48iV1scYY=;
        b=OlCx7OctiXKSsGq3oiOK00B1bgVhmzitaUSqBpefIfFAyeGjlzCXXujMJ1RoxwBuPd
         2C6H8lrkrdTvmlr5wqx696M78HRLmJRLKeT3T7mCBCMVyZ79LNmma0zBh365kyTbd5BE
         XW2iWy+QZJXD+Is2exAlfWfpgGP0kK2Od1g1wC6ukQ+Q6McHMbOhm+1aDIF8VK29khmb
         rHvEsmNPT0fNtjniz8ny4rMfZ+C2viZ8gdLAuzzlrp6tgCOXCzrJ0K5C08HgAP2qq/82
         q1BAZHP/r9ctOcUJWPnimoOLJT2MZzNsn3kiNavI+m4hUCqwNOHqjgE4YO6+dV9l97j1
         vReQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDBx7FziPb9oJn3NVhHEPIAr8/ze5N0IPF7wwPB83+PI6NdE337aD7AQwUlJjEAEspAPwor9mWs8v3bS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DW7bL1WyuBphoH5IMU5Bya4/If/iEwLdSJhq2qY6AD+S4Cjsp
	K7H18Ez8+yxq9HGwPM9JA74Rg2fDuZEHfErItGK8sM3LestBhHXQPz2WUbHy
X-Gm-Gg: AYBFou0o2sPtcwlBL2xgF8wXOsh52SdEOlWisKRuIEXzdREumFj1M9Lx9/QeK0eTop1
	5uMFdhdtno9RudHAJuir5BEowsV94McDavNpGK8sKGKNcNs/azt+27MCzBba7XZOxWWcXop4l1U
	aRfxCTjTOx/M0J+sn9Gc/V1i2ed/646nqWu4FRCMnde26l180PndZLdVJEl/FR+N+AUhr/VO/OI
	l8WTt/NQ0i+gh0s+WTKdqt4vBjDa94bc7BeDoYRJi2o9o/JIA0reHi+Veunm1wKlhPS82OvJMDx
	CVggVSbk+5EA2p0DcDOWQxLFX+Cr5cGUSkoIFD8RxMz937+wQls8EDGTk/J8FLoJZ5LfUoHb3Um
	MR5jgQW8GWAXmiZmFpZHOt9Gs9UNYSEasvAwYGn2bR7+yodlYIctWiTAspp73RSMjGlSur0C+L8
	R6DJze7PlMWT6p3rb3FQ0imKNwb1fiU19HCu2py2QcMVLhRX04bc8ivDUpuU6+V3v//S4GibkO7
	4SOmVrkVncu5cux7VbgQ1qr2yrYDXxGTFeMiizTbfzZhvVphKdoDqmx0bg=
X-Received: by 2002:a05:6000:3109:b0:48d:fa9c:7838 with SMTP id ffacd0b85a97d-48e6e2bc07amr34627188f8f.2.1793731829766;
        Tue, 03 Nov 2026 10:50:29 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd507c78sm22132f8f.54.2026.11.03.10.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:50:27 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Marius Cristea <marius.cristea@microchip.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH v7] iio: adc: pac1934: validate ACPI _DSM return type and bounds
Date: Tue,  3 Nov 2026 18:50:26 +0000
Message-ID: <20261103185026.3139023-1-tristmd@gmail.com>
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

Reviewed-by: Marius Cristea <marius.cristea@microchip.com>
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v7:
- Round package.count to pairs with & ~1 inside min() and simplify
  loop condition from i + 1 < count to i < count, per Andy Shevchenko

Changes in v6:
- Replace min_t() with min(), per Andy Shevchenko

Changes in v5:
- Keep existing declaration order, only add new 'count' variable, per
  Andy Shevchenko
- Replace (count & ~1u) with min() cap and i + 1 < count loop bound
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
 drivers/iio/adc/pac1934.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/pac1934.c b/drivers/iio/adc/pac1934.c
index 5e901ab25c8e8..fcdfe5f3b9190 100644
--- a/drivers/iio/adc/pac1934.c
+++ b/drivers/iio/adc/pac1934.c
@@ -1094,6 +1094,7 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 	union acpi_object *rez;
 	struct device *dev = &client->dev;
 	unsigned short bi_dir_mask;
+	unsigned int count;
 	int idx, i;
 	guid_t guid;
 
@@ -1101,11 +1102,14 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 
 	guid_parse(PAC1934_DSM_UUID, &guid);
 
-	rez = acpi_evaluate_dsm(handle, &guid, 0, PAC1934_ACPI_GET_NAMES_AND_MOHMS_VALS, NULL);
+	rez = acpi_evaluate_dsm_typed(handle, &guid, 0,
+				      PAC1934_ACPI_GET_NAMES_AND_MOHMS_VALS,
+				      NULL, ACPI_TYPE_PACKAGE);
 	if (!rez)
 		return -EINVAL;
 
-	for (i = 0; i < rez->package.count; i += 2) {
+	count = min(rez->package.count & ~1, PAC1934_MAX_NUM_CHANNELS * 2);
+	for (i = 0; i < count; i += 2) {
 		idx = i / 2;
 		info->labels[idx] =
 			devm_kmemdup(dev, rez->package.elements[i].string.pointer,
@@ -1122,7 +1126,9 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 
 	ACPI_FREE(rez);
 
-	rez = acpi_evaluate_dsm(handle, &guid, 1, PAC1934_ACPI_GET_UOHMS_VALS, NULL);
+	rez = acpi_evaluate_dsm_typed(handle, &guid, 1,
+				      PAC1934_ACPI_GET_UOHMS_VALS,
+				      NULL, ACPI_TYPE_PACKAGE);
 	if (!rez) {
 		/*
 		 * initializing with default values
@@ -1133,7 +1139,8 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 		return 0;
 	}
 
-	for (i = 0; i < rez->package.count; i++) {
+	count = min(rez->package.count, PAC1934_MAX_NUM_CHANNELS);
+	for (i = 0; i < count; i++) {
 		idx = i;
 		info->shunts[idx] = rez->package.elements[i].integer.value;
 		info->active_channels[idx] = (info->shunts[idx] != 0);
@@ -1141,9 +1148,15 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 
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
@@ -1153,9 +1166,15 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 
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

