Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951409;
	b=YwCHw1iGD4fA+IvGY3+DYZf3XnwyRi7Hqzt4YD7/pCaj4DQfGkMHIL4jg/GXngZAA0F9
	 tdQ1/EciNY3MArdHyz6BHBeIA9ZTifZD2HNOMz6vk25R40AT7G/cOKMDZVq9mMFcOWoB2
	 qNMo5cddYFsD7Aqfg+AqFxjSo8gOEy5jTu86G0cS6yqU0NlOJRZ+MO5cOhYKJgE93D5VG
	 Bl1htwd+KQoZJ+ZLueFKXTr1JfcF1/ocrUVREix0sFHrup3XV8sy/tB8PDZp/bl3uBeEP
	 50tpbph7GJdYk868bOkGYRQHmQRUgUbGaFwDvKeur2hCUNIu+iJcZwPDRfnJandiFbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FuQYvevBom22bTnzSsTpOFkpY8t4qr2tg5E7eW5T0Y8=;
	b=k7laRl9In8qJ3zJ0HwSn1srIHis5Y4FsL3Lx7rJU40JXHAsvURseqnluJi58H70opS2J
	 q1+mrhdFLty9hrzHj2fPJA6upJsswTInzJZUYokEMTsSRyY6XiJbSQ7sEewxTsrrvRsO1
	 IRfuiqBKuInUFft3IoamLcjUgi2jBHOPgvePo0rYhv0Aj/G04sw7aO+iCRCAc1MDyYhdt
	 M8Z7jJOyaj4WkOpfImeAU1kBHlNsDlXspeXp1yHBqogI+XE5vpUkKWUkPeWBBQofVYB4E
	 AtK72ylIDgZdYezB4O0/7J/uR0OCDS466QlpI9t+mnveq2TcnN0v7ppN0R6S5dg1fsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SjwI2lnG;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516EF606A327
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 516EF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SjwI2lnG
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so15708565e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951408; x=1793556208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FuQYvevBom22bTnzSsTpOFkpY8t4qr2tg5E7eW5T0Y8=;
        b=SjwI2lnGWsinoP36jfi0ElwFZziJ93zTgjc/8QgRa5KztbBQbZawlofZ7iG+//j7vY
         bScv9n6R5wwlBVJmwebpIwQVyAV14rrLJYBTR6WqU743VDO18gsggzmUenDyw+twCZ9r
         A4qMbuTpOCk0EJTGdGomO9wqcsfMs8RykGTU18kRjzpH/i1vnr8irhYU2csD/kvLZrX1
         A4EyaDB8D56X4uqGMx+tMcjpQbx53lsjuqRt8fyi+ZV7nkmZwAVVEjT1BM41GSz8+uLt
         C5G7OuuGM6ePEkyWdb9G08Mnz2spgI+XdGeVlawZJBc0oAWkhAISYbxQPJW4qIdJ+kN5
         EKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951408; x=1793556208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FuQYvevBom22bTnzSsTpOFkpY8t4qr2tg5E7eW5T0Y8=;
        b=lI93PBSQwprBJwAjbByMvCLqUzRcvfm8dlcUF1Y1PuZGoc6iVcfl+dIgC+Pwe+38AF
         JJ2j46Ttt6PxqR+jLyyvW3ItqhAz9Fu25zQPvzzFH5z89uMZHTPfrqs/fkRpqata57gZ
         XicRoHeIvVEW2v5keamL9/nzFSxu5otBQFkY77LtTx/KW7BxCM8yA7Uaj6O6WMvCB3is
         7SUfwEUm8gbgAi6ebXP85OLVeUNzImi/UfFZzdoNPlF3f15O/5zdaAlsP2OacQ5OQd41
         tAIZ1/BwkqrUCFXIcyKcIBmBfx1xy5u2qaGQF5L98MhDAxLIAFIrdw2yrBAkQ0jgwkf+
         vaoA==
X-Forwarded-Encrypted: i=1; AKwUvByKrWuFhIefDRFqf9oPnRigpeAF0+C7CHt67naUtkVEhgODnU3XsaJUb1rh4aBsEqH8+XYOr6Y77YUzwrQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe5GcYr3CnOXf1gpCXo/aADsCOUPcR8lp8f/Md0GN2b7bw4qDn
	ex7ZaxRTW6Dj/k/dFsxwF/uOFOy6orMthLrbE8EzTqsf92ZzaEyt73U=
X-Gm-Gg: AYBFou1lIcGf21VdsMNC4i4nyRV7+qMQ7eKfS2K22DSfGmo2swB/c7/nlybtKBwEzbb
	L16h8fh/d4AVk1Fao9uoB1il0eSR64aema/M6AvqE6MQVm2D32D7t1O84u7PvV1jE7rQSKoBGB6
	jaSyLE1JivwYHfdHINjSY8i8ayKFIgGS0Z086wFOBWNrTZ9BtFxDwB9V+62csn73t20SZpye2h7
	UtM4HYfcJKJm9PxusMmo1hJ6W0vdtBXS1WvgbkRma7nT7Ud3LQ6hQAzVs82BlyHtHyXvEBDTBI3
	7CsGQxw6Tnb0Zq4JEqlxuya73B+k3N49j7waZ/Jcid2u/n9cLSndFPntnVf/Yg8m5iLiV269F97
	+nPr4GlZw2madcxExq6r89mUzunrdO+t76iD4CJwkdQRc7fkOGAilgvxJZGYgmpc5gY0qTK5L4E
	de3Nc6dMhDYGGrSMSPG3sYjTVtQXOyYSC1SIlM756D9LqcES24k2SML+/MKicKLzWkhBBTupM4Z
	q04RfBfrk3F5QJOmXJ5t6trq3cGgRulBmGBmg==
X-Received: by 2002:a05:600c:4ece:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4a35ac9d116mr83202465e9.9.1792951407729;
        Sun, 25 Oct 2026 11:03:27 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a4cb7bece3sm82641055e9.10.2026.10.25.11.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:03:25 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] iio: imu: inv_mpu6050: validate ACPI object types in asus_acpi_get_sensor_info()
Date: Sun, 25 Oct 2026 18:03:23 +0000
Message-ID: <20261025180323.3641477-2-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025180323.3641477-1-tristan@talencesecurity.com>
References: <20261025180323.3641477-1-tristan@talencesecurity.com>
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

asus_acpi_get_sensor_info() iterates through a nested ACPI package
structure without checking types at either level.  The outer object
returned by acpi_evaluate_object() and each inner element must be
validated as ACPI_TYPE_PACKAGE before accessing their package.count
and package.elements members.

Add type checks at both levels of the package iteration.

Fixes: a35c5d1aa96a ("iio: imu: inv_mpu6050: Create mux clients for ACPI")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
index 460792ed27e03..81fe1d96365b4 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
@@ -57,11 +57,17 @@ static int asus_acpi_get_sensor_info(struct acpi_device *adev,
 		return -ENODEV;
 
 	cpm = buffer.pointer;
+	if (cpm->type != ACPI_TYPE_PACKAGE) {
+		kfree(buffer.pointer);
+		return -EINVAL;
+	}
 	for (i = 0; i < cpm->package.count; ++i) {
 		union acpi_object *elem;
 		int j;
 
 		elem = &cpm->package.elements[i];
+		if (elem->type != ACPI_TYPE_PACKAGE)
+			continue;
 		for (j = 0; j < elem->package.count; ++j) {
 			union acpi_object *sub_elem;
 
-- 
2.47.3

