Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637520;
	b=WGPqxzJ26EH+rli2PLmjE4n7BhbtAeugP5eN6uCttXwlcQ7Ju54vBk15yCKDYNDfBp+y
	 tlTAkzP70+7OVsj4yK3Plx+dQQHWPOYFb793TsnJ8Eex8Smb4Zv0KCJgzhz3TmHsgLqWA
	 3HWD0awFI2mNA2HzXbwrjcH3NxfPlX1FNpfy9hiZnOS6tFRsB3P0nvrzVxEgcnno9C65u
	 XgVlSrnk4Bg4d0ectQaObn+8X5hE8qmpoQVqcy0HeTg2INv0C9olcoqpKmarEucSZSAor
	 aVF5phqADzHfDeEJTej1l4yBCt+SDOCiDOryPRPsUlqH3BabzLlHBhYV9heOUQuqhGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2WGPteuHnSLOwvDm9/vsDbf5wTWrBYNeJGx6JscmGUc=;
	b=2cKi/V198oCmK1gOCRTZ5yjhLdaSSlqViKiz6tux5lnnrH0+O9irqRGDkXRdnTH94q2s
	 ZZKmRphC0N6cq0dEUz0o/QnYXNit2UpCQaudm143TKitTMBuBwQ9XMDhqD0hPwxN1JJDj
	 Y+beIhhx2mrBCz1/69NlDFhZ6ElWzyUIoGzn2enA/FpB4mkRmlFMOcfdm6lQ6L/LENDZq
	 OUdVzWPsOd9ir8tEZdANIlvJN4eoc3KruL0H9+GmWXxLqedvcYzmCkPCWurAf3X8nfXmx
	 Y3LC+3v5WK6lY0GYYKzgc0h/DXWIsaMgCErzuEuA3ejA7ufVerrkC/VM7eRbd0MvUIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDM81Zhr;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79384606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79384606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDM81Zhr
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e946155442so22831565ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637520; x=1795242320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2WGPteuHnSLOwvDm9/vsDbf5wTWrBYNeJGx6JscmGUc=;
        b=MDM81ZhrXVtkf7RBmuhEtOO6fdtBonUzvMEZu8Cudg59MPVHYbjGXSirI2b8DKFfZT
         /T2rnZR5HX00xbkEKz5oMYtbU1Cg3N5UeUBOMA64UVFbjXChBD6b6PuRBclwIELluCcT
         3yuRxwiAvPquyZKw/bI29op5T3D3ewRn594D5v5JaF+mRlA8R2p36CZok5OTQeSItACQ
         Ic0opiVzD6W+zfi+ZXxwkZG7QaXDP36+Yu/WbFMIl/hW9pgS6dDydQGqTLs7wudiHXMR
         G2lpzXb5s1YLGceRGAWFwY85EYJIZvP1e641m8AN9sE69mcztpvdDFt8AQUi9z24ZlQP
         vKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637520; x=1795242320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WGPteuHnSLOwvDm9/vsDbf5wTWrBYNeJGx6JscmGUc=;
        b=GgrqBpMdmIjb0F9dFid0S3C5teur6qgN7gKn7yZG52VNjfvKTMC5P+LjC55cW3dp+k
         q5Cu5b5fs+5WGoi804cMoxgXvAaSmQCyDcu4WH9Udf+FIhmbwtQ45n2QNIzvQ9drYFL5
         dVQYzrO0VoUGodxvaFpVh21rFQKYkEMcd9y2YD/HwJ3B3XdFsIwgs0tbkGRQcAsOpehL
         jF7Yen3SxDTuselICV/IAOueXcKXmr/BQ/SYJLFXbo3r28tyiueisc0ubl1JZI9Ba/qk
         nvW5JNaV1djklpqQhWGiOT0hGF0hrvsHIrLe1kyASK5BqujcYT3Ff4lPkdxQi7NK98+w
         eyCA==
X-Forwarded-Encrypted: i=1; AL+hErG6haRDGUQQKBVO2ifhl2UQZp5vnpdB+8afyoPmLUjE0WMTGowhst5fZIUHcKeWDNXJa8nJ+AczEoX2fPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cq5Fa5/uprPzYKfZDLRn6SNvB1boZrRWPjjfLRP6kCyJPS07Q
	J3riwP+n5lswsDHuyCi+vMcwDkgpc6pRKRJnBOBAlst5DVcF/EZQiWxl
X-Gm-Gg: AYBFou0+o/MjG1G8/vqDJgEs23vagQVoxt2nORBSs7ZAWtKLsYden1a8ghP2sIGy4Gm
	VOMP85IjXFtBZp4BlkhcfJ2uIcjBqiibeTljHLwzQbeSJ9Ur96cVFFuyDKsvhBPOJgqpM9B4q5e
	U340uj3G1rBndDbGTUT7M+T/C19h/q0myeUaF5zaT5Hl059qv8LWfpUkK2JLwL5MVAN3tFHVhHx
	N3dUOA4AOVmopoGCHgz7Fe0Eo9Py/dyepJT/tmW+rGKviaXdV5/sV7QA5PmgPecLBtlyalQ3XzW
	fZRQfcPF0yQOq46XvuFgHeiQVYHgscWnzsYt3r5leOm2gDUqaROl8A0JQ9vQuWI5YbcKOjpqoSv
	Dwdk7zVGEDPnzeRJtgI3B+6cm4rGTr0RdG1F02vvxlmKeVUggHgP5Kg1atqYLrt8GogBYX47x/r
	9VbcNL7khKw2djretRrvj8wMSEAX6wq+mlP22gPXbnzkKBAR9itfI6K9YRh7sC38N478BidMyet
	JQA1jCTSW6SjmHpAhJaKICL3xlaR7qzKwhpcs22NpXOiEZ65ue2ZxqFHbE8voKnOXXk0b8P1TUZ
	xO46rAh2aU0X+mWDHIq6Ca+wEDmmsiWEIKzxbzmtSf9J5lexzkGPiRuj4uSle7q02RQLaicSFMZ
	emhHkS4VsLZK9dUVepOar36FGYGQUPsbSjqqZSb/HrXX+mDobWQ5J7Er0UOrZzCCMibmmqt+wEc
	6k2w==
X-Received: by 2002:a17:902:cf06:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2ee0dada474mr41995045ad.27.1794637519659;
        Fri, 13 Nov 2026 22:25:19 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75b467sm18593085ad.20.2026.11.13.22.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:25:19 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-rbtn: Serialize access to the rfkill device
Date: Fri, 13 Nov 2026 22:25:13 -0800
Message-ID: <bcae17e45257dc32f4b9af20e1760dd3f7fff46f.1794633181.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

For slider type devices, the rfkill device is created and destroyed
from rbtn_switch_dev() whenever the first notifier is registered or
the last one is unregistered, i.e. when dell-laptop is loaded or
unloaded. rbtn_notify() runs from the ACPI notify workqueue at the
same time and does

	if (rbtn_data->rfkill)
		rbtn_rfkill_query(rbtn_data->rfkill, ...);

with no locking. If the slider is toggled while dell-laptop is being
loaded, rbtn_rfkill_exit() can unregister and free the rfkill device
between the check and its use.

Add a per-device mutex around creating, destroying and querying the
rfkill device. All three run in process context. The rfkill core only
calls back into .query and .set_block, which do not take the new lock.

Fixes: b05ffc95f9ed ("dell-rbtn: Export notifier for other kernel modules")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
Developed with the help of an AI coding assistant (Claude Opus 5.5),
which found the issue and drafted the fix; I reviewed it and am
responsible for it. Builds cleanly with W=1.
Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules: the dell-wifi and dell-bluetooth rfkill devices are
registered and unload/reload with dell-laptop is clean. The race
itself was not reproduced.

 drivers/platform/x86/dell/dell-rbtn.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-rbtn.c b/drivers/platform/x86/dell/dell-rbtn.c
index c0b3877bb27d..a38bd84bac5a 100644
--- a/drivers/platform/x86/dell/dell-rbtn.c
+++ b/drivers/platform/x86/dell/dell-rbtn.c
@@ -5,10 +5,12 @@
 
 */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/acpi.h>
 #include <linux/rfkill.h>
 #include <linux/input.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 
 #include "dell-rbtn.h"
@@ -21,6 +23,7 @@ enum rbtn_type {
 
 struct rbtn_data {
 	enum rbtn_type type;
+	struct mutex rfkill_lock; /* protects rfkill */
 	struct rfkill *rfkill;
 	struct input_dev *input_dev;
 	bool suspended;
@@ -115,6 +118,8 @@ static int rbtn_rfkill_init(struct device *dev)
 	struct rbtn_data *rbtn_data = dev_get_drvdata(dev);
 	int ret;
 
+	guard(mutex)(&rbtn_data->rfkill_lock);
+
 	if (rbtn_data->rfkill)
 		return 0;
 
@@ -142,6 +147,8 @@ static void rbtn_rfkill_exit(struct device *dev)
 {
 	struct rbtn_data *rbtn_data = dev_get_drvdata(dev);
 
+	guard(mutex)(&rbtn_data->rfkill_lock);
+
 	if (!rbtn_data->rfkill)
 		return;
 
@@ -154,6 +161,8 @@ static void rbtn_rfkill_event(struct device *dev)
 {
 	struct rbtn_data *rbtn_data = dev_get_drvdata(dev);
 
+	guard(mutex)(&rbtn_data->rfkill_lock);
+
 	if (rbtn_data->rfkill)
 		rbtn_rfkill_query(rbtn_data->rfkill, ACPI_COMPANION(dev));
 }
@@ -415,6 +424,10 @@ static int rbtn_probe(struct platform_device *pdev)
 	if (!rbtn_data)
 		return -ENOMEM;
 
+	ret = devm_mutex_init(&pdev->dev, &rbtn_data->rfkill_lock);
+	if (ret)
+		return ret;
+
 	ret = rbtn_acquire(device, true);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Cannot enable device\n");

base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.0

