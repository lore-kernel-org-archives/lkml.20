Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627572;
	b=AenHyaiPIYfiseo4aihgXi9g1S6/woFEfygq3FeMjyPEpgEoNUx5U6l4J/UiUYOHwlRo
	 X5cBBV/Ah9LIJ1IGFjdQbsyFHtOe8aJ5fHBzBLflyDdO8lUP+aNxqgWiZx+V8WmvnJFNv
	 cKbgz+F/1ST77HBxg7lAkzEwbsL36uoSSk46vCz/g3Iw5wwpnUxXuyOl7GoW7zJ1L+3JO
	 IN7zb9TuqMTg9OiLMZC8VbhyeQVyauyI8/mMAJfEZ+yF/YKDb6A/YJPtH7SLU8rsJwRUP
	 j+Mb4BNSFXn/RG5pX6t0lJiORQGlnOnyKaFp+SV8LAlbz5ij9UeoEPRodirmehqmnPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+hSSsra0t01A9ViC7W1gsCiaByL23lgWqO/7zF8RlDA=;
	b=uOqubPIQ6dR5h8VnvVf/gxkgjre+7/IAEhPalVwAEVgBD8v3oY9FgvsKpT4wUE4QA9R1
	 BNkUm6w8br+8mW6sQZInrs7oWCPXqlelUzWRQQ5I3yBv1NC0GiVrf1hcOYL5TN0h96r81
	 J54l9HIt1MCSHnfT9inbP6DOXoixU1fgflVn9rwxWhw6rvU5rZ0S9sDiirVtYj7b+IegT
	 9WhztCtwHL7mjewpFg38vIgms3NK7d+TV6Se8TKceUUUOPjSRxai0soeWYYGnw+wRblVf
	 tVBjFL7aWNQPt4Kr8psxJaU0NNgXmEitUNIa6kOVUBGjueLsscvW5JKRrcY4AFjzyXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPVNaGWf;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7628A606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7628A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPVNaGWf
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so5149436c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627572; x=1794232372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+hSSsra0t01A9ViC7W1gsCiaByL23lgWqO/7zF8RlDA=;
        b=fPVNaGWfIdmnG1Zmp4wErXiRMgF+M0G7T4qRAIidegAtM9WS2+WA6KUzHIRleugCOP
         3tFrJlYrPwAVMNWWBP0rPRXl4DhUYMOA1Zh0Rm9VJFEx31sMU/R1/PLcfk0qToWQ0bUq
         fYq4A1U56GzDylRyAcacUG0AW1Z0AfDtvSIZCIE0rKWPfxFd+cvX4nOK8Vd/yspaMIZM
         HN0egOC0fqGM/PGblDZyptgtp5mQxTsozQzK+YtUoLNhr52kxh3C4pC+MWZ52dsgStro
         9pvnCb5wwkOpcTB8OoC1YTJQ7YPZJV7N+JKi/0BQ7Xvuu1xZT3WcHSND6kBqkSFFDi6n
         1ilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627572; x=1794232372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hSSsra0t01A9ViC7W1gsCiaByL23lgWqO/7zF8RlDA=;
        b=h846XGRyqKRkaIN3p6loO+dW6AxFDlwqfX3zHlPr/QKjPuTcLCvbWh5DRM+YUDfyGV
         pg7sPa/BNpAZhvZizIL2MfVk8DYzJzOU9cy3+mgrA+rRLJKAs4bj1PgKWlOYC5+4fMbY
         ZCTE6hEhYIu+wXuVWnxUUslCsM+elibejiZQnkqThi/rSfoPQt+dBAn1dMWW7oDs91K9
         hOvoQNK5N9YH7ZUB63/y1GMevA8dkgT5hi0UvkVDSQ+FpL1zBWjKWIhVSIJnExIXjYmr
         UKB2sPQ7RjVXEPUxnHxzhwZo3e6/z55GotZrYZR49O/i/9XroGaR6LkrGlpJET5lceRp
         q4lQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4xzOWTuVvbbHYzbhlk+9DvZ/Ue4F7EN04gVp+j/VepLUfBh1CJkO6+SUEZyHneRYVJdX5JLjayFd1Eg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRIzvulYVpHwNdIcLCaYxxL3KfOQJ2f87RKITu+D6JQJPcvJkD
	8pCxtkf5MKSiorsC4q73WXiP9o9Kw5nee8RHVmPiBNbcmp3Et7aVjKFH
X-Gm-Gg: AYBFou0B9Ku7kapHsxxVL7avnIXwKl6cE48WgxP0KiTEYswgDVzHBpbVM4dfFGXGEe+
	iBfdSCkxlvH/QM9zXdMo4NRGpw9+IiSlu9MPMefIE35BtEk3sHeHtjYDA2QZzEqDp+bCNUInEvT
	WN59aDiJh1Soe3jxBdXULkfvj/tOrV10zPggg7GNPxTB083RVpowSB15zb4YlM0sGy0fNAfUdkM
	IrGaCwD/bUvtU6veDMPd2/1smrYfEF8tp8WuXSjBS1Km0ZHp9GQ2t8bLt0goc+cU61r/q0ZJ/FN
	LqvI6a5I7VcLsNzpoNdX4kbfRFIjRSp4gDaMQnJ2CB/3CsWDE6Sa5YYXNUMrnYpSXKQa6hfr2ik
	ZzvhDyLYmzcuE7n360rmkmCvw/NtLkYsOX4hjBdJWIzhM2m/qz6V5xrSAPr02cTq0sj0GrONQDr
	ha69kf62WUR1eMjeeeOSmM7S7xcWfFAC4SGnJEfGxFf4kVmFewF3mqLbIXYVoTIw25xBImX6saj
	3MvaMmyszduobUVm6LYBM0Het11AWAu24Pvi9MWYnuxbj7wlM0x4U7IeCnf60OH4icotAveXWPq
	y74Im3CtNEWxjSTUwc7mhdaVqym2Qax3
X-Received: by 2002:a05:7022:7e0c:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-1ac5a0b8a9amr15565000c88.14.1793627571462;
        Mon, 02 Nov 2026 05:52:51 -0800 (PST)
Received: from chitransh.. ([2401:4900:c96b:4969:d3e1:18b4:929a:2da2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm44774162c88.6.2026.11.02.05.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:52:50 -0800 (PST)
From: surirajat@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	markpearson@lenovo.com,
	hdegoede@redhat.com,
	rajat.suri@dell.com
Subject: [PATCH] platform/x86: lenovo: convert mutex_init() users to devm_mutex_init()
Date: Mon,  2 Nov 2026 19:22:15 +0530
Message-ID: <20261102135215.352680-1-surirajat@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Rajat Suri <rajat.suri@dell.com>

Convert the mutex_init() calls in thinkpad_acpi to devm_mutex_init()
so that the mutex lifecycle is managed by devres.

This fixes thinkpad_acpi, which never destroyed the hotkey, brightness,
volume and fan mutexes on its teardown path.

Per feedback, the patch now covers only driver code for hardware validated so far.

Details per driver:

 - thinkpad_acpi: bind the hotkey, hotkey thread data, brightness, volume
   and fan mutexes to tpacpi_pdev, which is registered before any
   subdriver init runs, and propagate a possible failure from
   devm_mutex_init().

No functional change intended.

Signed-off-by: Rajat Suri <rajat.suri@dell.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 22 ++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad721..0fc105fc28d0 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -3381,10 +3381,14 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	       tpacpi_inputdev->close != NULL);
 
 	TPACPI_ACPIHANDLE_INIT(hkey);
-	mutex_init(&hotkey_mutex);
+	res = devm_mutex_init(&tpacpi_pdev->dev, &hotkey_mutex);
+	if (res)
+		return res;
 
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
-	mutex_init(&hotkey_thread_data_mutex);
+	res = devm_mutex_init(&tpacpi_pdev->dev, &hotkey_thread_data_mutex);
+	if (res)
+		return res;
 #endif
 
 	/* hotkey not supported on 570 */
@@ -6830,11 +6834,14 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
 {
 	struct backlight_properties props;
 	int b;
+	int ret;
 	unsigned long quirks;
 
 	vdbg_printk(TPACPI_DBG_INIT, "initializing brightness subdriver\n");
 
-	mutex_init(&brightness_mutex);
+	ret = devm_mutex_init(&tpacpi_pdev->dev, &brightness_mutex);
+	if (ret)
+		return ret;
 
 	quirks = tpacpi_check_quirks(brightness_quirk_table,
 				ARRAY_SIZE(brightness_quirk_table));
@@ -7575,7 +7582,9 @@ static int __init volume_init(struct ibm_init_struct *iibm)
 
 	vdbg_printk(TPACPI_DBG_INIT, "initializing volume subdriver\n");
 
-	mutex_init(&volume_mutex);
+	rc = devm_mutex_init(&tpacpi_pdev->dev, &volume_mutex);
+	if (rc)
+		return rc;
 
 	/*
 	 * Check for module parameter bogosity, note that we
@@ -8913,11 +8922,14 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 static int __init fan_init(struct ibm_init_struct *iibm)
 {
 	unsigned long quirks;
+	int ret;
 
 	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_FAN,
 			"initializing fan subdriver\n");
 
-	mutex_init(&fan_mutex);
+	ret = devm_mutex_init(&tpacpi_pdev->dev, &fan_mutex);
+	if (ret)
+		return ret;
 	fan_status_access_mode = TPACPI_FAN_NONE;
 	fan_control_access_mode = TPACPI_FAN_WR_NONE;
 	fan_control_commands = 0;
-- 
2.43.0

