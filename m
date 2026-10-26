Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793056154;
	b=PTm+uahN86a/8lZxuvfwSTAGGp8M3H71wXxiYPVncmMBHiZJjc4c94RQ9fAddgpSpLq6
	 eyRB4rwJ9OCRgiuf/oXYTYRW5AVQhQI+7yOk5q9dqaovupodgpcXUi6cdc9VZ/kqPHE8n
	 GHNQuQBLjPHDK8Lrel2bXPknn0gqvDq1fTh2XciuMBBLovXPFIi82SXdUQNE28g8ztSQz
	 dUb1UyYEQt0Y8jwxBMjKWZHaYeUx09bXBTXoIyqY8DFOp3Q59zVliHeUuViAxI5Eqih7f
	 BWOwZkHt+rm9cu8Y/Zq4jYfU7KKI/WQHrIaZjFqF5MpwNUOgWktvI47aMzMX2U+fxHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793056154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K/9dj9p0jw42E2EuvvjFl6cSZqQkfF2nRLQFIDKRY8g=;
	b=NubT3+VA7wCfV2MjcVSLavwjyCmW4Sga0yrNKar4czFQOf7/8GgZ7h4v0EZIxES7daz6
	 oYlR6cf6gvcP2sIcsbQ5OCLouyrM+Egm3GhHRBAWQi1f0713Du/uenak4TQ8HPtL6zcSi
	 dN+LQSDeWEkCRniU+Jo3gOV067MF6YOU4WXEdpfS9AFhls0zl62Kx2LZiX5pEZx2eDOqh
	 4P2fshsFlyLk7G+m4R1o+eFr3lk9z26vZ4cZ2KcSW4Q6QYmHKk36SainWlLJ73XPQ/LTi
	 +blmUyXqa6zyoo2pYEWn+8CB1Nhx70DmkP1+UhfFf6biFt/DOrD6I9GOuCHYjK6s9bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="fkbUb/56";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831F9606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 831F9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fkbUb/56
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so4167125e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793056153; x=1793660953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K/9dj9p0jw42E2EuvvjFl6cSZqQkfF2nRLQFIDKRY8g=;
        b=fkbUb/56Bl74RQSphNz0p8W+Mm2Ev/DD+y4zNjH64dRcg/FKJBexRdR1kcS3oX10Vw
         bVZ0CfGuyq2Yd4JtIObFLCtxnUGssJ+dBDtwpsPMna2aUh0pVgFp6ytjfYSV9Tz1Nwe6
         gi2f5XdZAg2vT5gwASgzLqAEFDwE6x3mpfWFMaSVFz6iJceK9eDMaTBmqmlGyM+Z8JSd
         f3hGAFFJfFw3QrW4ve1JsE3v81nNwFkK/C/kYdGK9N1q74KO3BuDAKzkWtt8XySaW7xs
         mMty9CwigLU0wvj7vBIOeKcaOeJqgnUsFp32eFvrPsDG+Mw0ErwCwU7crwsBGOPt0ryv
         MzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793056153; x=1793660953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/9dj9p0jw42E2EuvvjFl6cSZqQkfF2nRLQFIDKRY8g=;
        b=V1fDTVSzHPACFDAb9q+2dygw8lf1BrBd+asgJ4KZaSMzNhHyQU+HojYRP2s0DqmOUF
         jTe0FsHKwQ9VnUOjdb4l8Q3VBH+daYj+2PkYaVMKdGvXj9tpf8jElWs5kTntXUgf7HXb
         jfIksCZmvpvhnJXCqF+Fp1pdljxccclGRzfCLaEw8RBlQ+ZgDKWCGw0Gw05AprqYWlKy
         oh6X4herFj6OF/X2aiD0KrGOW3rSlZLgKNkSqRcLGOfhRWxbjMzMKgHbR66zf3wtbCvv
         SjMtnvwrfIE8Q9BoQalu2WeNERGMpCd+B2Zuf/SYbyy4YJ6GkZO/WCMlmge8mn7c8K2W
         3ORA==
X-Forwarded-Encrypted: i=1; AKwUvByQbNLj9MtzjdZCojAk1KHC1C1UHK5nW7d2H25oV4yKjqsM7yLBbNFU6EWey7fxbVay8NTDoa71hbZtcOw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzUID08knzd24TCxAuFC6tzkUR/TwH/hBun4O0o9BJ7INFTdzv
	v+ULHllIokLuJAmleSX3d99V3K1UlXvvRWNQo992Agca1026n+6505I=
X-Gm-Gg: AYBFou2PByxbkbht37Gn7b8Rh/kRBaQfdNMOA9BVP7lHSo0IqIlkcH2MJpQEt1pWa6f
	Btd/ldwpO6skkj+S4SsXe9cSEwmYGI4Mz5FSbS0LnAF4kKxvCQec6zICfJ+gkEL4h2vTlgtsj1C
	gjnyvVNR1k14PTDX9X88SoSe6UBF7Klxv7XW1wMbEym4e+DiPbPSSpN2LNz0qasHq2ZmGUYYRn8
	tY/QfhMVzeTyO8VizGhWycUYmZXP3tfIHSvgdI69eXhV83s8V/hdiyxaurqjSPKyll7r26HupVb
	AGn2PSKi/DxEHGWQLemu8iJkp6AFxu4JWcQMfpjbUg0GyHlyh5WHS8RPPdgfltVSnCkZH4I1RT1
	tJLdz66jLIUGRv9yQWi2/VaUWYtCQ+tXFfMS/S+dBPmHLzJmb4G19thktEFa+Gu0Z+7mjfWIEPR
	aGapZoBtQzRGJEitjuRLbmzLXplJZYid4ddwNpL0Gl4p/syxLoUiX4jvyI9dmZPe5FlNudb+vRa
	o4oCQpYPV+vfMYMO+cno1B7QIOIoVlBmGcwAw==
X-Received: by 2002:a05:600c:45c4:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a7bfec4e49mr19489675e9.2.1793056152703;
        Mon, 26 Oct 2026 16:09:12 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e9aasm229425455e9.5.2026.10.26.16.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:09:12 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Marius Cristea <marius.cristea@microchip.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH] iio: adc: pac1934: validate ACPI _DSM return type and bounds
Date: Mon, 26 Oct 2026 23:09:10 +0000
Message-ID: <20261026230910.2569782-1-tristan@talencesecurity.com>
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

Add ACPI_TYPE_PACKAGE validation after each acpi_evaluate_dsm() call,
cap loop iterations to PAC1934_MAX_NUM_CHANNELS, and verify package
count >= 1 before accessing elements[0].

Fixes: 0fb528c8255b ("iio: adc: adding support for PAC193x")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/iio/adc/pac1934.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/pac1934.c b/drivers/iio/adc/pac1934.c
index de59dc27c4405..43c4705c27be7 100644
--- a/drivers/iio/adc/pac1934.c
+++ b/drivers/iio/adc/pac1934.c
@@ -1101,8 +1101,13 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 	rez = acpi_evaluate_dsm(handle, &guid, 0, PAC1934_ACPI_GET_NAMES_AND_MOHMS_VALS, NULL);
 	if (!rez)
 		return -EINVAL;
+	if (rez->type != ACPI_TYPE_PACKAGE) {
+		ACPI_FREE(rez);
+		return -EINVAL;
+	}
 
-	for (i = 0; i < rez->package.count; i += 2) {
+	for (i = 0; i + 1 < rez->package.count &&
+	     i / 2 < PAC1934_MAX_NUM_CHANNELS; i += 2) {
 		idx = i / 2;
 		info->labels[idx] =
 			devm_kmemdup(dev, rez->package.elements[i].string.pointer,
@@ -1130,7 +1135,13 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 		return 0;
 	}
 
-	for (i = 0; i < rez->package.count; i++) {
+	if (rez->type != ACPI_TYPE_PACKAGE) {
+		ACPI_FREE(rez);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < rez->package.count &&
+	     i < PAC1934_MAX_NUM_CHANNELS; i++) {
 		idx = i;
 		info->shunts[idx] = rez->package.elements[i].integer.value;
 		info->active_channels[idx] = (info->shunts[idx] != 0);
@@ -1141,6 +1152,10 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 	rez = acpi_evaluate_dsm(handle, &guid, 1, PAC1934_ACPI_GET_BIPOLAR_SETTINGS, NULL);
 	if (!rez)
 		return -EINVAL;
+	if (rez->type != ACPI_TYPE_PACKAGE || rez->package.count < 1) {
+		ACPI_FREE(rez);
+		return -EINVAL;
+	}
 
 	bi_dir_mask = rez->package.elements[0].integer.value;
 	info->bi_dir[0] = ((bi_dir_mask & (1 << 3)) | (bi_dir_mask & (1 << 7))) != 0;
@@ -1153,6 +1168,10 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 	rez = acpi_evaluate_dsm(handle, &guid, 1, PAC1934_ACPI_GET_SAMP, NULL);
 	if (!rez)
 		return -EINVAL;
+	if (rez->type != ACPI_TYPE_PACKAGE || rez->package.count < 1) {
+		ACPI_FREE(rez);
+		return -EINVAL;
+	}
 
 	info->sample_rate_value = rez->package.elements[0].integer.value;
 
-- 
2.47.3

