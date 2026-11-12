Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502493;
	b=fIvkE8rrH6V3uSo1RU6uxnWw6vqCKgEopGas7nIkVegsAhM+ozDbG9cD9nfh5jn2TSRP
	 /SY4jTs3Vfdy/uJoB8TrGut/5hDVaqaepXXJrOhZZ02n+IPL6CQPTfc/mEV/3AVMR27Sk
	 /Ffze98evAAruU40+zaGA0cRRNhr1GcXQy4Ibruc5HIhbX6NYGkDaxq+7R7IDwFv0s3/u
	 1hHjE9mt+z8/VZqIheqan+jh7FC9rYhT6RFaBz3xXD/yAfz4xNzBJW9Fkg7MBn0F+ZtAv
	 yXu0yEagicJyyQpdOMdV9OqdJtW6NLvEFjcqRGqp7oAgkzXrwjZ0BiyXzVKpHG9jjKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fqqhsv4HNVlwlDwd/MGgk5Abc7qDWDaQ0rMfWr6u7Ms=;
	b=lven5CmWxjl4mFAYDCVF3WRv5BjSHP8jj6yFcP1ni8sQkSy8OpFuMglOLSHQ9a//fgJF
	 HdUnhltFooob1+GdYETtN06/C5xuLtzLbLWUckztXrahQwkx3SVa9vZPdHAv6FutHXix0
	 Y5swi5RG88ma1CR8bASZzyiVmH9+gPOx0mVsvbLpBgZfrtDC6PUyATuA8h7+6X5T+t3wH
	 aWm+nVrLxXfYL+U34vHR9MtTw8dBQT4+S1DPiD6W704vAMZ8AbHbEnBqzK+xDpZW1uTEk
	 HgDi0xIGH5n6AjVYRYIzRuneR47Lfgp9GNfxVFbwFOQOtNtE4AZv+E74+9phSVycefg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xtwj/7nB";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A63606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17A63606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xtwj/7nB
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-170135e43c7so3297967c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794502491; x=1795107291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fqqhsv4HNVlwlDwd/MGgk5Abc7qDWDaQ0rMfWr6u7Ms=;
        b=xtwj/7nB6IzT+eKvlx6Vm43h+xfCwnWN/lGVIPTbiPNj38G8BAwDbdPde+nLaRu2ao
         B6W696dENvc30r8NzhdXvLebPnOkJWNUQsbi2WPOBg5PJJi8aw8CuR/VuvjFyV5gb9GX
         XvYB7h5OUTHesjQjsuxR56vez1Sab9M4Qq8G39ywpM2APZzlcYCBAZEKHAnWmScxmGXJ
         0vv2LX95vMnt5/knfwqwW15ACi2bXGWSThqnwAFqsgPnVd5dItvu/4Lm780hsporRRa4
         A1DxT0UcPRPgujkpTyeBlC3if61c9pOiKItUUMrtz4beGK4ZpJTfQXevC+E6ea8wmTUq
         g+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502491; x=1795107291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqqhsv4HNVlwlDwd/MGgk5Abc7qDWDaQ0rMfWr6u7Ms=;
        b=MEIDYvu1qXDC1pibwbYn38yb5se6PLgKLx3jrsIYZJT1VSFgx7JJMSX4IRGvbHpRf+
         bSr9RlPKQd9jlK8FNQA6Ti0esUH37Rrnhd46Wp6m/QInFLX6D/9e5YKeG7h8rCOYl+j8
         lB/F+RbVX+XTOnfpNthJqeSQNtr1PjJ6f/0Kmps94qDR0U2tbyJ9vNt0zmy7F7PX4OeI
         X2wuwBwFIYE2FPCK16OivupA6qy2STTtmHkB1rGFQ1a1LYPG2mQEg8DAfsA+VzUAUzW3
         ZUYom5TGbF0YGpKzO8iNc3RwZhyqETawUgup5lSTSRCo007gtHLv+fMYUqhaQvMLEvw2
         lC4A==
X-Forwarded-Encrypted: i=1; AL+hErGX5Vey1bYd1OI7eiaFEm0Pioj4yrhCr02nGB0wpQDtxAxEXWZtAHIZnDBP6TvnEKILIxV8NpE/B1XIkdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V/btWaVXZidCA/hObFzqRGUYVeGxaR1tnayWIKa636WhyaVts
	1Hj9bdw0zwno0gdF3cW2bgPbYSyabau4UpZ7QZ/+LgCXNeAL74zpllzk
X-Gm-Gg: AYBFou3NgEupHqUkuGNZ0p+gmUYgPxwgrhv7GTOMEuDrCk51VZPjYV4uu+QAf7BDCpf
	9U23kUOjZxuCXm9SHOfcRMmy84PVQp4bsCvwYmEE3UUnnM1ZaTfNE91rbzTW2jBWYygBWuVlXGV
	oqPZ7KKVmp0Ev7tG3IVTj2/Rc1MhxCdHZYSB0DPHshANmlZkSQTCTIuRB/GBY8a/VmFl0G9hwsq
	gbIBTN+b9iQoLSqQqU5kEJ9jltz9aYt08VizKX8MSLbnTXd3TfX5FMDDV7Ko4cHz5aGzDPa5JZ6
	tsyot3F9fPO6pKCZ0UAcpRiLYFvIlbW1v7LGQ+FbIs76wZGhu4uZ2ike95QnrKGudWOx7oZCCgC
	3QSYuk+jcBaDADCd8pifWCPBRe11TzF6mkdeg/pN/MdnsFKTQFCt3A/K+COnrv/sG96I9znMMX4
	nuQYQjkbhSncDLk2Va9Jdha+cG0AI8RstMEd5/DByTn+65BrJ2lgXudvWrLXsd60J/SPKqnvwTp
	iN5NmBPYTBzDehLZVyOaBRW5nO3yPXIdL7+sxeFCILf+JBpDUnU/cf2Rb3QzXtST6K6bk97JLTz
	XP3Nu98Zh05y8h9ShPyCKXcLTjmFkIor
X-Received: by 2002:a05:701a:844d:20b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-1b50312ef36mr116784c88.19.1794502490931;
        Thu, 12 Nov 2026 08:54:50 -0800 (PST)
Received: from omarchy ([157.10.22.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm332905c88.5.2026.11.12.08.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:54:50 -0800 (PST)
From: Jamil Khan <khanjamilahmed202@gmail.com>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: Jamil Khan <khanjamilahmed202@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: samsung-galaxybook: Re-enable ACPI features on resume
Date: Thu, 12 Nov 2026 22:24:32 +0530
Message-ID: <20261112165433.64461-1-khanjamilahmed202@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The driver enables the ACPI device (SDLS) and its features (notifications,
power management, keyboard backlight, block recording) only at probe time.
On a Galaxy Book4 (750XGK, SAM0430) this state is lost across hibernation,
and after restore every CSFI call fails:

  acpi SAM0430:00: failed to execute CSFI; device responded with failure code 0xff

so charge_control_end_threshold, the keyboard backlight and the
firmware-attributes all return -ENXIO until the driver is re-bound.
The performance mode (CSXI) is not affected.

Add a resume callback that repeats the probe-time enable sequence in the
same order, and use it for both system resume and restore from
hibernation.

Tested with a hibernate/restore cycle on a Galaxy Book4 750XGK
(BIOS P11CFP.025.251116.HQ): without this patch all CSFI calls fail after
restore, with it they keep working.

Link: https://github.com/joshuagrisham/samsung-galaxybook-extras/issues/12
Signed-off-by: Jamil Khan <khanjamilahmed202@gmail.com>
---
 drivers/platform/x86/samsung-galaxybook.c | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index b150e1f..27a2d27 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -1381,6 +1381,7 @@ static int galaxybook_probe(struct platform_device *pdev)
 
 	galaxybook->platform = pdev;
 	galaxybook->acpi = adev;
+	platform_set_drvdata(pdev, galaxybook);
 
 	/*
 	 * Features must be enabled and initialized in the following order to
@@ -1432,6 +1433,49 @@ static int galaxybook_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/*
+ * The firmware forgets that the ACPI device and its features were enabled
+ * when the system is restored from hibernation, after which every CSFI call
+ * fails with 0xff. Repeat the enable sequence from probe, in the same order.
+ */
+static int galaxybook_resume(struct device *dev)
+{
+	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
+	acpi_status status;
+	int err;
+
+	status = acpi_execute_simple_method(galaxybook->acpi->handle, GB_ACPI_METHOD_ENABLE,
+					    GB_ACPI_METHOD_ENABLE_ON);
+	if (ACPI_FAILURE(status)) {
+		dev_warn(dev, "failed to re-enable ACPI device on resume\n");
+		return 0;
+	}
+
+	err = galaxybook_enable_acpi_notify(galaxybook);
+	if (err)
+		dev_dbg(dev, "failed to re-enable ACPI notifications, error %d\n", err);
+
+	err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_POWER_MANAGEMENT);
+	if (err)
+		dev_dbg(dev, "failed to re-enable power management features, error %d\n", err);
+
+	if (galaxybook->has_kbd_backlight) {
+		err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_KBD_BACKLIGHT);
+		if (err)
+			dev_dbg(dev, "failed to re-enable kbd_backlight, error %d\n", err);
+	}
+
+	if (galaxybook->has_block_recording) {
+		err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_BLOCK_RECORDING);
+		if (err)
+			dev_dbg(dev, "failed to re-enable block_recording, error %d\n", err);
+	}
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(galaxybook_pm_ops, NULL, galaxybook_resume);
+
 static const struct acpi_device_id galaxybook_device_ids[] = {
 	{ "SAM0426" },
 	{ "SAM0427" },
@@ -1447,6 +1491,7 @@ static struct platform_driver galaxybook_platform_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.acpi_match_table = galaxybook_device_ids,
+		.pm = pm_sleep_ptr(&galaxybook_pm_ops),
 	},
 	.probe = galaxybook_probe,
 };
-- 
2.56.0

