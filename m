Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793232892;
	b=Pav4M+vA7i/Ve8vjbrYON99A1E/kibH6SvPedgtYm1N5Q9di0jy/6djvo/KOBDEEswkQ
	 7ZmR7tBgrUJOWSGgypGIsKo3r1ZlhYE8t3zTPkafjRrlbbYqbe4fLU9cmSVRxzCn3hYrW
	 Iiv2QD/mbm1QHNQxCUAajcrNIwskegE4LXYrgHr0P5TLQ/lpCx7ghKFTyVVGWEsqIxKDQ
	 LTRDC2X8Uf7qeMznbRzvM8Wt1SlzqURHurVlsiFU5e63fnza+2DVlhOFaMSjzdBeVowZx
	 dW2acr7LZiKcQXASmD4UnPckS0ST0YFFVqOxvdZ0UFXQPLR1+B6iusb+I101ZPIL3VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793232892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KLVBw/UkNwKCf0bH78xGpqCQNeCNKlhoh2dQVh4mvTM=;
	b=hpJEMFsobc9ApSwQ5cmrxmZ3cJHVQ1mOVPqI9/dOfvHgkYxwpHz5nBMd6aawf8N2wjdw
	 47Pfzai3Zs0o++QWPfoeG9raXm8W/p3n8z3D1v/kmj4fiZ01hlG6PXVGnLy/FAttr4yPp
	 3JHbRnFTKEwiM3+VdvosbBnoLOYOg6yhXMi6ilbEatr4TS/cM/xjKTenpzSqJv5a7zwGu
	 PEX50Nz6Jqe4jJlt5YlDtZEWB1N1jHY/bijShzdPog0sDubldfMoo9X+wFYyiwfVzVMib
	 xKoXDA10mKNFSYNwEjfkEqF4xhMVhyFoRJG7c92Z9ZC7yp024NeFVcAB+uTwr7HKzXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZurm2vn;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D117606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D117606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZurm2vn
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df4f540ebso779015f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793232891; x=1793837691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KLVBw/UkNwKCf0bH78xGpqCQNeCNKlhoh2dQVh4mvTM=;
        b=YZurm2vn38Ou3OZVInaponIYZXLBJDkwhva9jMzfROFu/1s2AkjSYPTCNsChA6AXmp
         W9TWD/praBvYzF8n5aG/gRG8TcFsEHAIk72D3zLGz80B30J4hZpAtoIriB9gPUfwXm1H
         SKFUZnbzelrJUCYD+g3ks0wT5NQS9wTk0rMBVzFAGhLJlcoT1MoM8j++9NIqSqHXSsT5
         NYtj4RbQr0ymGpqAIGB+0LcL+gaXJu/XM7mBKr8qe19sgG128p9XmgaxU6u0f8lvsBV7
         3sNDYfwyb62sNOKGQdeCC96XXYgkbrJQna8lKk9B/lmVq3YfDGaD+ROffDoR0jJe77vw
         YEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793232891; x=1793837691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLVBw/UkNwKCf0bH78xGpqCQNeCNKlhoh2dQVh4mvTM=;
        b=euESBJWsbvddpJhAFsChXJ0idiydWMll6VDRt+sZP9aYYDskY398qDBAipY5vMTUkh
         Y4Nd8ZvLWY1tEO7KCJLd0dduO3nXRIsJMioZB5IPXNiGprQmYkzbv6Ye6i9aHNPkbbwr
         6pV6NckdVHX4t8mkGjGLybeq9NOs/TS/uMoGLF3yhoGt/gbMvxE1COuPcMjYUWvLJfPm
         Vd2FsgyzMK1qSCetRJMT2A2AzzhRiwEBxRASCt1Ztlo6mIhB3OsU1oZFl4BNVOdNkpqC
         VoD2/WQMQDE8a+mSYpqiwiVqKEKbWWjIUaYueYt5UXXBr/7YZmY+CesjRqKzv9YbQQH2
         LJ/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxNdQQS0OMa4WljrSz3/P41+6eVn92m+pM1NFh4SzG3V8AyyDVbVLcbRC/dk1lWZcH9N4xU+yUviXEv4GA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh/CasKiVH70/cklarKkXF/OwYsp1qwF12LNddTa82cYjS70d/
	4x7Klzu1D1EAwAyqTpQW+K6WZN0rL9XnUtB0hS91tZuZWFSOnNqBtiNBBnv6
X-Gm-Gg: AYBFou1QrruJxmCKk1IbdrcnB4/ILkn2bqdRCQSrccVlVbSHvy5km+SDzlr+a79kTRp
	gikKU4qhFgC9ZSsaAIIBl0eq3UyVW58jd1ZVIJVKkY1kwv2mlcwssiyHEpUe9IYL3/NvQJLtx6g
	z8iK1zu7yHqEXNidBUUZjtAXsm+0oALuM504xP+atVwXpLPue4mF2dhiHrgYRy37CS5GWbyS7UL
	Bb7842NAzGSPN1Z8szD280jh84OObwWh+3q2gWwFqYMOcSyfVzrJvx4wqBA+qsFecIBRxGpGjTN
	nKqnyX42ASGWxqU7TX/SG3GoVvCVYJCA454ihq0n/ZZKTXD+xKVN0aqwtu+gB0Z7r5c1AV/OCUe
	pqBOm+OYmjOxqwujG3eexQyunKfuxy6VyTDyvLkPoAF7scyxRWCxnR6BiG/6sWDXpidGwZYIZlG
	JM+HmLrw0aEmhMvK3ZPCf+BTNfsLRDCf+1ad2awIa2vw2183qn1Ry3THX+r4v9Uq0XKVygPNqIu
	L5U/RJ98ncCiSfATvAQt0Bx/mTg/6LWAvNDrqIusVhKAPg2iRFAfHXkfzKm3gjCpdh5ZFZN74+2
	p8AIYo5E9JV0YIcSM84=
X-Received: by 2002:a5d:4841:0:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-48e5d3120admr7180228f8f.51.1793232890621;
        Wed, 28 Oct 2026 17:14:50 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f37csm25262605f8f.8.2026.10.28.17.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 17:14:48 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Marius Cristea <marius.cristea@microchip.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v3] iio: adc: pac1934: validate ACPI _DSM return type and bounds
Date: Thu, 29 Oct 2026 00:14:47 +0000
Message-ID: <20261029001447.1114691-1-tristmd@gmail.com>
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
Changes in v3:
- Use acpi_evaluate_dsm_typed() instead of manual type checks, per
  Andy Shevchenko
- Use (count & ~1u) for the name+mohm loop bound to ensure pairs
  are complete, per Andy Shevchenko
- Drop Fixes: and Cc: stable tags since this is hardening rather
  than a fix for a specific regression, per Jonathan Cameron

 drivers/iio/adc/pac1934.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/pac1934.c b/drivers/iio/adc/pac1934.c
index de59dc27c4405..b6315a13a353e 100644
--- a/drivers/iio/adc/pac1934.c
+++ b/drivers/iio/adc/pac1934.c
@@ -1092,17 +1092,22 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	unsigned short bi_dir_mask;
 	int idx, i;
+	unsigned int count;
 	guid_t guid;
 
 	handle = ACPI_HANDLE(dev);
 
 	guid_parse(PAC1934_DSM_UUID, &guid);
 
-	rez = acpi_evaluate_dsm(handle, &guid, 0, PAC1934_ACPI_GET_NAMES_AND_MOHMS_VALS, NULL);
+	rez = acpi_evaluate_dsm_typed(handle, &guid, 0,
+				      PAC1934_ACPI_GET_NAMES_AND_MOHMS_VALS,
+				      NULL, ACPI_TYPE_PACKAGE);
 	if (!rez)
 		return -EINVAL;
 
-	for (i = 0; i < rez->package.count; i += 2) {
+	count = min(rez->package.count & ~1u,
+		    (unsigned int)(PAC1934_MAX_NUM_CHANNELS * 2));
+	for (i = 0; i < count; i += 2) {
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
@@ -1130,7 +1137,8 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 		return 0;
 	}
 
-	for (i = 0; i < rez->package.count; i++) {
+	count = min(rez->package.count, (unsigned int)PAC1934_MAX_NUM_CHANNELS);
+	for (i = 0; i < count; i++) {
 		idx = i;
 		info->shunts[idx] = rez->package.elements[i].integer.value;
 		info->active_channels[idx] = (info->shunts[idx] != 0);
@@ -1138,9 +1146,15 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 
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
@@ -1150,9 +1164,15 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 
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

