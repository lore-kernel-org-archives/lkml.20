Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466282;
	b=BkmOX1UP4ak+/7EfQhfjH8I/Wlu7x5PSYunRobLF7/cmT3w3oS3CyfcTIYhQcwxU99Pd
	 WhG32J+70vgr79A0L2IZdCdAvPGedFamYyB2q+snJkDOD24NLlpxIZLS4fdZup3Y+nAZn
	 sCC6HygISVCZpsW9Lv8ZVO5UeM1fboqi+BUx9ILMcMvrB5DdlzYihF0kxI8PWjiYOiXf0
	 tadJbAJNkmTz96kXvnHAxk502p1SRykW7etEtaqWiMFXoSGHybslULtVlM0fWy0HGJPlw
	 /xIp/JgDcRPt0YtppEXahxrSkU7oU/H5JgmNvzqJeMbou7g9xJXm9IcfsXU/b8VrmUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IwK/Lw/zT89xRbIKZypcZKCrOD63qKhf8jUHRky3Gw4=;
	b=Cw5gDR1Sbkc6THfolro0+rBKAFK9To9BHF9VmQYyE5PoY4HTdwn2bzeMDopQAAC3z1uG
	 ah6oyCJ6+NnJz69chyOpaVl0fEpmHJwp7d8c/IefXeNyk6F+gyD2jbcXzEoN/GNgavSoG
	 6TK6/JpBSmmXc/ol2SJnwS6dN/Pr8ZoroBKPmP58zEAhJTgBqZbNTXgVpIuAl5nFNkLgr
	 1e73Id2O+FHXQx+VeB6o/21ZOL1R/gyQ4rDSOmgs1/XMrhuwU8ZgUvB1akYX+uod3cq2i
	 XFIHH+gB1JySP/c9gbkEDOCuHtX4I6scAVHETvEVNkKg1/7joZLCsJaU++1wjnHTrvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AY44++V0;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EE960A382A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74EE960A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AY44++V0
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37000e7234bso3644661eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466281; x=1795071081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IwK/Lw/zT89xRbIKZypcZKCrOD63qKhf8jUHRky3Gw4=;
        b=AY44++V0KqZlmgX61uk4ifRltVwOaOhN/jLkLt4NZ4SqVLoUsQyijPsMiXEi1CH9LI
         6qnJuSbVv4m30P5Aktvux6xGWFqdsz3d1jDOtNs7d8hUIVF1NY8dR7rRBX+e86dTd4Py
         2DNeaMDjSWT3zO7TbK/JWHbwBDe6E9C7VCmc9S4Hd3EVtLMCFMqTDLJhTq1yNv4q16bu
         NKSl0OMR4I0JLTSwZ0WKLqVDkTLAlvrFjDtha9XiFqXUXinIhhdbWO7Zm9VySGyNwKFR
         csHsbjK5tIBFTLBxzrkj9JWhshEllyo+cNV69X3usTLOVNeleLdadLdDxlICkBmc2g+I
         3ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466281; x=1795071081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IwK/Lw/zT89xRbIKZypcZKCrOD63qKhf8jUHRky3Gw4=;
        b=sPnKg9FurrABTJaoYyWrSYAckg3uf4aNvding+zRjhFLCtSk1ojWUpZNs28f5b5jKs
         2MBB+KeXgEIsPhJ6XKUkpJsIEXIC3NSEETCgisx6j9V26UfXWhbSeMDxdojF0faAyk1H
         fUdzXwbc/EX5nOC+h2wtOa40H491SU6aHKHI+5YpcvJAP07uwH+MF8+Datrgd7BVliax
         UGVxBE2cQXCOX6y9ZKSlnhGiWMiQzG76R6JID0ZTYfy4DErBL0AMmoIdD5fM89Y+J5D0
         m7NnQOP0YjyWlNKmf++MpQWF4ptJKJDhRR/tu62n1xSeEHtAU8F9b38s63HWLm5OvVNr
         zq+w==
X-Forwarded-Encrypted: i=1; AL+hErEKI5l/i2Ki1Q+LY8BoKMBUcPXwT7XpJwDj8GRbvAUOz93hGRCL6X30d3LlOgAVpcA7FPgBHpUDm0RovQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fuup+oZuzWUEPKyplKmjCQG09Mfr1uRzFTzHClT7gEyXcJI0q
	usuhvlyfJf5JU4Ynj2jWDoZEYRytV+4PTgVsjOUXad+CVmn4UxXffyAW
X-Gm-Gg: AYBFou34KB492nV6+4a1lrrGfjV557LB33J5c5LJtqD2SASM2I+V0pqlrlmCbCEbtC9
	g8RnYbJxBbxoIzj1ukL2yIB+8+m9PswvUJo2Zae15ojNORpoIJ+zVzeRyr5DCblRKD2s7HVroVs
	LQKQMnFvyMwL5NkppZbPXk5fDokM/EQGSLbGHTxtvPyf6pbHPSMMNK/zDlBaHA6luQzf7X9jQy3
	W5+Q6RgOYr3ZYzzrPqLnMNKy3dylgT45IDkoxZ+SDOfqN+IyZBUHh0rAE80b916PcBVTAMqnB3Y
	R4Cn4p3kFW8El2R1epeGZ7ib81Aqgiz4ADLxg9llctHxb6M3eLSLu2go2ACRCczp0et8nbjqNIm
	NS+28vVDUyfBhBt3V+lu0vhV6C5ppYKUKgxkHfo+sfy7CG1tjGRxVXmYPUmNCt5AWI0/CX4+oL6
	g7HNe/OAyNRHd4zkBIJV3OtDsUEfOhZvblAO/8OTPCAncz2OO7tJmVSD69yKsMzGu/bawUqgVxS
	b5xvTeovtSptqt8kr7sagH+1NtgTowIRlCjw21GotYJXM6pbalHnLZddDNXHoPb/rqBMHrgONPT
	RTpH9gQTgEt4hYRrQD5v9ROYTE0LyH2jN7FY/AF+dZXeHGaB4uw2TtR5NuTT9s9rfN6/IdFRFhr
	MFajiAtKONLjQyeJK
X-Received: by 2002:a05:7300:681c:b0:36a:18e2:64c with SMTP id 5a478bee46e88-37685d72786mr5325491eec.11.1794466280392;
        Wed, 11 Nov 2026 22:51:20 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm24547205eec.27.2026.11.11.22.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:51:19 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jaewon Kim <jaewon02.kim@samsung.com>,
	Hyunhee Kim <hyunhee.kim@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Input: regulator-haptic - drop platform data support
Date: Wed, 11 Nov 2026 22:51:14 -0800
Message-ID: <20261112065115.1803973-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112065115.1803973-1-dmitry.torokhov@gmail.com>
References: <20261112065115.1803973-1-dmitry.torokhov@gmail.com>
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

All users configure regulator-haptic devices via Device Tree, and there
are no in-tree board files providing platform data. Remove platform data
support, call regulator_haptic_parse_dt() directly from the probe
routine, and remove the unused header file.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/regulator-haptic.c         | 20 ++++----------
 .../linux/platform_data/regulator-haptic.h    | 26 -------------------
 2 files changed, 5 insertions(+), 41 deletions(-)
 delete mode 100644 include/linux/platform_data/regulator-haptic.h

diff --git a/drivers/input/misc/regulator-haptic.c b/drivers/input/misc/regulator-haptic.c
index b1aa3488ed6c..d99f716ef44b 100644
--- a/drivers/input/misc/regulator-haptic.c
+++ b/drivers/input/misc/regulator-haptic.c
@@ -10,7 +10,6 @@
 #include <linux/input.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/platform_data/regulator-haptic.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
@@ -112,8 +111,8 @@ static void regulator_haptic_close(struct input_dev *input)
 	regulator_haptic_set_voltage(haptic, 0);
 }
 
-static int __maybe_unused
-regulator_haptic_parse_dt(struct device *dev, struct regulator_haptic *haptic)
+static int regulator_haptic_parse_dt(struct device *dev,
+				     struct regulator_haptic *haptic)
 {
 	struct device_node *node;
 	int error;
@@ -141,7 +140,6 @@ regulator_haptic_parse_dt(struct device *dev, struct regulator_haptic *haptic)
 
 static int regulator_haptic_probe(struct platform_device *pdev)
 {
-	const struct regulator_haptic_data *pdata = dev_get_platdata(&pdev->dev);
 	struct regulator_haptic *haptic;
 	struct input_dev *input_dev;
 	int error;
@@ -155,17 +153,9 @@ static int regulator_haptic_probe(struct platform_device *pdev)
 	mutex_init(&haptic->mutex);
 	INIT_WORK(&haptic->work, regulator_haptic_work);
 
-	if (pdata) {
-		haptic->max_volt = pdata->max_volt;
-		haptic->min_volt = pdata->min_volt;
-	} else if (IS_ENABLED(CONFIG_OF)) {
-		error = regulator_haptic_parse_dt(&pdev->dev, haptic);
-		if (error)
-			return error;
-	} else {
-		dev_err(&pdev->dev, "Missing platform data\n");
-		return -EINVAL;
-	}
+	error = regulator_haptic_parse_dt(&pdev->dev, haptic);
+	if (error)
+		return error;
 
 	haptic->regulator = devm_regulator_get_exclusive(&pdev->dev, "haptic");
 	if (IS_ERR(haptic->regulator)) {
diff --git a/include/linux/platform_data/regulator-haptic.h b/include/linux/platform_data/regulator-haptic.h
deleted file mode 100644
index 4213e1b01316..000000000000
--- a/include/linux/platform_data/regulator-haptic.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Regulator Haptic Platform Data
- *
- * Copyright (c) 2014 Samsung Electronics Co., Ltd.
- * Author: Jaewon Kim <jaewon02.kim@samsung.com>
- * Author: Hyunhee Kim <hyunhee.kim@samsung.com>
- */
-
-#ifndef _REGULATOR_HAPTIC_H
-#define _REGULATOR_HAPTIC_H
-
-/*
- * struct regulator_haptic_data - Platform device data
- *
- * @max_volt: maximum voltage value supplied to the haptic motor.
- *		<The unit of the voltage is a micro>
- * @min_volt: minimum voltage value supplied to the haptic motor.
- *		<The unit of the voltage is a micro>
- */
-struct regulator_haptic_data {
-	unsigned int max_volt;
-	unsigned int min_volt;
-};
-
-#endif /* _REGULATOR_HAPTIC_H */
-- 
2.56.0.567.gdb80ae8cd5-goog

