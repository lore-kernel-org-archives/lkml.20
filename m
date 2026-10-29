Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292966;
	b=2x68OdvcKAR+uQ5BPFfbJzecM+HRsuRHrUfLTfGMBd/Iqqij0zpQ2l6ZkvRV+GM3kkiE
	 q5LcdUBTMtLHrkm07lcrEW/E0GgDfFfi3ax2NZr7hk/PTz4fN+7srHEy0bav0uolQ3tSr
	 Yh75WuWHB9hvEPRtK/w3ipirPtcLtbB4YrYLo54YYkKjMJFYX0YTuoWuErGZok4KUGF6F
	 7cZK51rISw+DYKOgCbda9ZAGJQyCX+HyYg0pwAVXB5wpST5WL33OM0bjd6Y2AzleZ45uh
	 jNhbOZlSMsBsecwm7c5SCBR3Tupvw2z5/qTAc5ItOvVLBsmjNR5rDw3HgutqgDmnh5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9yn4GzvRoaBXfVfumrImiA4cqBiQbn6L5zw3E/B/u6E=;
	b=Nsj+dkvKC78oHa4RPqxWwN+LpTQdRGNLn81bfuJJrRl/XPhYOn9BWQML3HO+1oqalFJM
	 EnN2hObmivybUqoJC9tzZFs0zycfrchug8XJFUM8deV6WCjIjUFSGXXwufMU+OZqN4LqM
	 M7G9OtXtY/UKbmYyW7dVVvTTLCmrwtjvyVGnXftkQWk8mJlL28hA2WTDy1DNkd8YB/IV2
	 tuPadUIghNv+EJ+7A1ysxQ8QQejqFth9x+Bf+TJ26JJQZ/hGcCofR0LPEL/cyUNDew/70
	 5Vgil3G8v1b5N8BqDmiDjLN1+odfxYdfIpRw/fwB3RNUXg1yAcPC0Rts3n1DwrXZCGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q5xd8QiA;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629DC606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 629DC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q5xd8QiA
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso20712965e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793292965; x=1793897765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9yn4GzvRoaBXfVfumrImiA4cqBiQbn6L5zw3E/B/u6E=;
        b=q5xd8QiATHRWOzTvgALEAx4iBXPRhh7cC3KEeOfSH4N5qlYpWj+Y/Lc1PARiI7k15k
         sg9Ej/gHGi1uHOctYZC37xLUkZZvJVNSiyv3BIeoNW1Gqp1BHRSn4yhsKyIRWRYoBBDD
         k+ONuWFbztgcZzkavQg+cS5N9m7MJHSAM+9kgqg0Ah8fcAX6hAyPVhyOzZhwZ9V17nyA
         e1m8dH2WnfIAYIJTRIJpoYy4BkAm6vNTzZMPbJlgFkQr192cv9ExgheGpwI81L922k8D
         BketzgOUqfCb0M546EG/Js6ee9lBNXd4EiqkcudDUDkTyjjEU94I17r+xaa2icNlgvtq
         gN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292965; x=1793897765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9yn4GzvRoaBXfVfumrImiA4cqBiQbn6L5zw3E/B/u6E=;
        b=1T99AcQNx6cepyyscET4wa06ImyB8PvL3gXXnc30E+2lFFn3PZxgKwX6/mBZqndlPQ
         gv93XJ+Ok7DRc1P4xRISaNyoLX7qcgwpsWgKtc9oM/aC+8ImFVd6bPiffdmoKkZp5Mij
         MtaZWIlMPV4Hd0jYTR2dr7BiRTVd1p65aI1Pvw+6FFvfM5WKi5rtOnyScavm8TC/I9yP
         cTYpa26EoMKtFKuJbtaysIR1p+LTmc9kZXBX/IZQtay2JoeP3BnvUxf2sQD19hio/q6l
         tO2fEObTJuy5GAcac8+0BqDKvf+fdfYZEhXEvAzftxhq3w7JiL7ZHuzfhygCOLqOtuht
         lhcA==
X-Forwarded-Encrypted: i=1; AKwUvBxOpJp8FEMxRG73hXQxVs/4e6dWa5zdp2R7bJdHzBtqVF+laulr6jF0qAI0i8Fmu48MABh2wfZdXSoVJzg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdXV/aGq6zxpZFnXnaGyqoijUXT4YFm67/j7NLtaIGRg2qRyw1
	nSPhoFn6l49gmyBgAz99d7AIGLkdpydmSxouFo/d1mrTbOg5W+gGEYM=
X-Gm-Gg: AYBFou2SHMYD58Q+wga1LOwcchPLrm79bjOSdLlmSpb/xswmlV68X/81NYLgiqU3vdk
	RliAgI29xjPqYd2YkbmBYFNKe4W7qEb/QIZqqeZIp+8Qtg2WdCQmsZN8F+8UBnDPgi83L13XEer
	xT0Hp39Hfhj1B8j0cZ7w2FHMKh5bEEUiVcHJ2+nFNTnFMHakDx/L/iMlxJVsR7Kv1+QRZp2zfxc
	buj3PiaWeTdfboMi7ykiw6gFlbfiKL0YjQwv/5BbyErATUq0Rme0BuxvXKSkZIl12HwkeB+9Y9I
	XZFGOLSq0Ht72l7Gw86znNrZ75fxcwGXTwa2QR2YouJNl9mYc8wlMe++pgMfIw9tzcgEVzrWX98
	Tt5Bz4AYCX0g5T2ZU6HSGhsFF2XplBK5UKAA3gjjTaH0xjthiwg2tVP3rJZB5axucyPDtBWdtFf
	kEH8nUeFesZJwdcupgfLNA1cjsXOREQwcTQDrq24EN21Pgol0JpwS5sbHyxqi2A3r0GSaGGTeJ+
	gQ/uUsGC5zUmCq5uQC2zMEonEWuFMweuVmauq3a+uokk54tp0qnKSb904sfARIESd7Re26/9Q==
X-Received: by 2002:a05:600c:3f06:b0:4a1:dec1:4e1 with SMTP id 5b1f17b1804b1-4a966c3ff0emr140304915e9.22.1793292964506;
        Thu, 29 Oct 2026 09:56:04 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80285b2dsm76194635e9.13.2026.10.29.09.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:56:03 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Marius Cristea <marius.cristea@microchip.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>
Cc: Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v4] iio: adc: pac1934: validate ACPI _DSM return type and bounds
Date: Thu, 29 Oct 2026 16:56:02 +0000
Message-ID: <20261029165602.3265518-1-tristmd@gmail.com>
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
 drivers/iio/adc/pac1934.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/pac1934.c b/drivers/iio/adc/pac1934.c
index de59dc27c4405..0ff742ccc66b2 100644
--- a/drivers/iio/adc/pac1934.c
+++ b/drivers/iio/adc/pac1934.c
@@ -1087,22 +1087,26 @@ static int pac1934_chip_identify(struct pac1934_chip_info *info)
 static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 					     struct pac1934_chip_info *info)
 {
-	acpi_handle handle;
-	union acpi_object *rez;
 	struct device *dev = &client->dev;
 	unsigned short bi_dir_mask;
-	int idx, i;
+	union acpi_object *rez;
+	acpi_handle handle;
+	unsigned int count;
 	guid_t guid;
+	int idx, i;
 
 	handle = ACPI_HANDLE(dev);
 
 	guid_parse(PAC1934_DSM_UUID, &guid);
 
-	rez = acpi_evaluate_dsm(handle, &guid, 0, PAC1934_ACPI_GET_NAMES_AND_MOHMS_VALS, NULL);
+	rez = acpi_evaluate_dsm_typed(handle, &guid, 0,
+				      PAC1934_ACPI_GET_NAMES_AND_MOHMS_VALS,
+				      NULL, ACPI_TYPE_PACKAGE);
 	if (!rez)
 		return -EINVAL;
 
-	for (i = 0; i < rez->package.count; i += 2) {
+	count = min(rez->package.count & ~1u, PAC1934_MAX_NUM_CHANNELS * 2);
+	for (i = 0; i < count; i += 2) {
 		idx = i / 2;
 		info->labels[idx] =
 			devm_kmemdup(dev, rez->package.elements[i].string.pointer,
@@ -1119,7 +1123,9 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 
 	ACPI_FREE(rez);
 
-	rez = acpi_evaluate_dsm(handle, &guid, 1, PAC1934_ACPI_GET_UOHMS_VALS, NULL);
+	rez = acpi_evaluate_dsm_typed(handle, &guid, 1,
+				      PAC1934_ACPI_GET_UOHMS_VALS,
+				      NULL, ACPI_TYPE_PACKAGE);
 	if (!rez) {
 		/*
 		 * initializing with default values
@@ -1130,7 +1136,8 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 		return 0;
 	}
 
-	for (i = 0; i < rez->package.count; i++) {
+	count = min(rez->package.count, PAC1934_MAX_NUM_CHANNELS);
+	for (i = 0; i < count; i++) {
 		idx = i;
 		info->shunts[idx] = rez->package.elements[i].integer.value;
 		info->active_channels[idx] = (info->shunts[idx] != 0);
@@ -1138,9 +1145,15 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 
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
@@ -1150,9 +1163,15 @@ static int pac1934_acpi_parse_channel_config(struct i2c_client *client,
 
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

