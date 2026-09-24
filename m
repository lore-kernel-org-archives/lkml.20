Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71D130C14A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790250986; cv=none; b=UTyHXqSOlVZMfcTSTxBNO7hLeRh+GVdlWjKMy8nn4h2Z7RLntc/lJY1/Qozkv9gm/6q2aTqSqbCNDvB21kpUQHMs6KvqLvqpN2htJyhnc3IvxaJ71XbvxU46u0sE+JFxt1PdIxdTsNWbhxW4ZwRwB+5AIn03UOLgKIXGzeXJpCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790250986; c=relaxed/simple;
	bh=+Z8ZTpGEfHWM4q/zUbV7kqxbu5dhULZPNJ7diN0yJeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NPcIhqtzvW3QAg610tEpti7CntUzMzXGGqxfc+k6ArBW0J9TD7VwoogSIsCmqmHOTqyLCbdqchckqYNva1U5O1Jw8Lkc5JqytEfpxPrGC2Uvu8a64liW1FkJICs1ZmpuOakqJbeQsS9A+fU+t6XEoXmmuMXwTxXwsVQGPRvuZB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5ZLCRs6; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5ZLCRs6"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so1107123a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790250984; x=1790855784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rBh57CQ8oC/XCjJGNJlSdgV/jpJp4/g95+Pgh7fgMA=;
        b=h5ZLCRs6jcFxfdHs0UkadGQfBABZyDwEnK4TozYKXLU6/zW8U4asodHIcDM93ayRmh
         fOk+5W4D3u/hx0OSE7LRQso0yJbV1c2/lFGLAc4h8DlBmSOHNuAsei8P1Utx77azJApm
         0YsArrhXipVvZwFaSzBoMFjq0LqkKIXyMiPJg69tEzvYZGGmAqGLhISvpDPOzimYWVLY
         66lwsgjpJBXEGSBxjTfFWFKEwk61yMLJuCD/oOhSW3sULIGb5WJAdQW39Ym5aIje8UYN
         6bR4ubLQftFgfrVvkvf2hNklDctaWJHD7T3HFwt7L3Tt8EcV3ArPytWPXTChIeIHL1ea
         wBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790250984; x=1790855784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rBh57CQ8oC/XCjJGNJlSdgV/jpJp4/g95+Pgh7fgMA=;
        b=qk1Lu3PMV/rapCiY+zQfBblrxytoidltXu9bRyqWRbcJsNQHv5ns5UZiZb9H/R4VB+
         XTRNy7wJfshg5lHyQI1KIc4GMonmJC9C7azDh0fi8gOJerEt56oqjR9gJ0M1yw2ZFw6v
         6zvA4eu+ENGJSfb3F6g+cLpeJ6nL/CK3lWUrRw59/gXPYavsftIQgpKAY/jgAhgPXPKR
         i5AkRenOsN+NcojM1evK9uL6jdhCXokF2t+aqzjnd2quRT91ELhmHHsBtNedI8Yz2SW2
         cpCpjcE5Ms+rQeXHZtcWiGuOoFLG1XWRSQqG1jpo9bMfOlLBremDlQqZYM+Br9jdPJfd
         7FWw==
X-Forwarded-Encrypted: i=1; AKwUvByIw1WTjplXDGNg1IzDQDjmstgVSUjJR04FIRFLBjU6iIOFvZXCus+HG0wya1OPD+AtAYZxT+sxV6fppH4=@vger.kernel.org
X-Gm-Message-State: AFuF++kKsJPZcX2qXWDuC5t6efw8oIlBQBX3HFasO8AfrGVe1lzuLsJD
	3Y3UfHd8nmhKAqPj2UG4sEnmFxVKUYBOxDjR6A//ZFgHqwpoW8XVblIr
X-Gm-Gg: AYBFou2343j9lkk1HpljoU7x1bfC/jNpmcQAg+qpr9lK4KRkQVQg9OfDc4Jom1VTpBt
	aj6BZjAtw5czCTt9CsjqRpKJvZsziBOVBzrwZb/NWMPOnbuEVnhbCkdwRF3Pd+Mfvm3zd8RKwCK
	AefEqHHQsXZGCNx/MdjIhrHMJw4GMab9tgW1zCbzqni52iPpmtE6fc+daUJm+NdILl6iGwqZa5S
	rv96AyHLBKLBZ5aEeQti/ggFv5li4aImAUnTCcLKW5fmj2u+anvVc3YuLF3/f0TndXT7xmwDdeh
	nuS1fD95Vx8YtMiuD//sbVp7380EHXZs7OKUX/ZC4KKDSb9AF1A4bMmW2RL/OlpaByLLHpjXR2O
	+Y+tblfpekCc+MzMeWZKfJrrf0HGe5b0EFytGxIyQtlaTgAhsjLlWf0Y0ekqRJN9BqcWiCIlRh4
	AUoi3i92Zmk1s+1Mq9CTqTNhOqUbfMzdioiE/eJtwwyh5kJCWPY04M8g==
X-Received: by 2002:a17:90b:5807:b0:3a0:8050:2ec5 with SMTP id 98e67ed59e1d1-3a0985be2fcmr1751949a91.12.1790250984098;
        Thu, 24 Sep 2026 04:56:24 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663fd0sm4598745a91.9.2026.09.24.04.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:56:23 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bao Cheng Su <baocheng.su@siemens.com>,
	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>,
	Tobias Schaffner <tobias.schaffner@siemens.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henning Schild <henning.schild@siemens.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] platform/x86: simatic-ipc: fix platform device leak on registration failure
Date: Thu, 24 Sep 2026 19:56:17 +0800
Message-ID: <20260924115617.1578309-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

register_platform_devices() registers the battery, LED, and watchdog
platform devices in sequence. If LED registration fails, the battery
device remains registered. If watchdog registration fails, the LED and
battery devices remain registered.

These failure paths leave successful platform_device_register_data()
calls without the matching platform_device_unregister() calls.

Add an unwind ladder to unregister previously registered platform
devices in reverse order before returning the registration error.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: dd123e62bded ("platform/x86: simatic-ipc: add main driver for Siemens devices")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Use an unwind ladder to unregister previously registered platform
    devices in reverse order, as suggested by Dan Carpenter.

 drivers/platform/x86/siemens/simatic-ipc.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/siemens/simatic-ipc.c b/drivers/platform/x86/siemens/simatic-ipc.c
index 7039874d8f11..4a4509fc9263 100644
--- a/drivers/platform/x86/siemens/simatic-ipc.c
+++ b/drivers/platform/x86/siemens/simatic-ipc.c
@@ -92,6 +92,7 @@ static int register_platform_devices(u32 station_id)
 	u8 wdtmode = SIMATIC_IPC_DEVICE_NONE;
 	u8 battmode = SIMATIC_IPC_DEVICE_NONE;
 	char *pdevname;
+	int ret;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(device_modes); i++) {
@@ -139,8 +140,10 @@ static int register_platform_devices(u32 station_id)
 				pdevname, PLATFORM_DEVID_NONE,
 				&platform_data,
 				sizeof(struct simatic_ipc_platform));
-		if (IS_ERR(ipc_led_platform_device))
-			return PTR_ERR(ipc_led_platform_device);
+		if (IS_ERR(ipc_led_platform_device)) {
+			ret = PTR_ERR(ipc_led_platform_device);
+			goto err_unregister_batt;
+		}
 
 		pr_debug("device=%s created\n",
 			 ipc_led_platform_device->name);
@@ -153,8 +156,10 @@ static int register_platform_devices(u32 station_id)
 				KBUILD_MODNAME "_wdt", PLATFORM_DEVID_NONE,
 				&platform_data,
 				sizeof(struct simatic_ipc_platform));
-		if (IS_ERR(ipc_wdt_platform_device))
-			return PTR_ERR(ipc_wdt_platform_device);
+		if (IS_ERR(ipc_wdt_platform_device)) {
+			ret = PTR_ERR(ipc_wdt_platform_device);
+			goto err_unregister_led;
+		}
 
 		pr_debug("device=%s created\n",
 			 ipc_wdt_platform_device->name);
@@ -169,6 +174,14 @@ static int register_platform_devices(u32 station_id)
 	}
 
 	return 0;
+
+err_unregister_led:
+	if (ledmode != SIMATIC_IPC_DEVICE_NONE)
+		platform_device_unregister(ipc_led_platform_device);
+err_unregister_batt:
+	if (battmode != SIMATIC_IPC_DEVICE_NONE)
+		platform_device_unregister(ipc_batt_platform_device);
+	return ret;
 }
 
 static void request_additional_modules(u32 station_id)
-- 
2.43.0

