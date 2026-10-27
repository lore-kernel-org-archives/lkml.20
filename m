Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793076529;
	b=mgAXWutcHJ3mMOcAqTmHS8WumRCA6JOD7LHTkbG4ub0HratKAPk8iCLy/gdv4jI38b5I
	 K5wXFJFBrzBplSMw1eVWlk58TwT3zjEi6JBLpbDwxuqJDAhVc33sYtyc6bmcfrdKaovoZ
	 7UpebEe4gUckUME+jBnw0bzb+BHtSsiRUyhW3XT3bhs646szzTYUn+2Gfa/EWaSrevkjz
	 V97dGr88zQsuzAgRbK6Jke3DJLJ2ZANJqkLfqpxUFZMC7ho3QPsrEvQn8Z+j3Hi/sRZgN
	 +BHCqpQ0ys5l6L11E67PitfT7Fp6YABPsWha2hwGZFvP6U3kflhn1PsluS40jR7LTuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793076529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8nNac71k806PRByKbpE3u7jP68UWqjas3/Ce4QU52ks=;
	b=e7vXHnBJn9E1XWfevEq9O7ROM4FUmd0dvsJxE7mhFB14wORtQrcJT53O/DOwh+LYBbZ1
	 1bg8HVTs47MpBqLuuLYVRetomemMknycVjrdGSeCXJv/ILXG0AJWpqxcDUyjkdIi4izyX
	 XyyICJtQpy926Rpk3QOU369MxGNIcBAF6pHGXDGeAzloo5om/m3M7vuceUPLKqf9HiJ2i
	 TnmRTkQefv2bQLBnbSwME2JAMInQBm2pGz8RoCR49muPTfu88xvopAJ4mYRj5AIYBBAz8
	 zhgaDgNi4BXNGJSdFMjluZ+7PVUPDeJG8rldAwuM5X+PrEEi/vIef3HkekmgwbxahHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="h8o2RV/2";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D689606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D689606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h8o2RV/2
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35b2c599f43so2206439eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793076528; x=1793681328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8nNac71k806PRByKbpE3u7jP68UWqjas3/Ce4QU52ks=;
        b=h8o2RV/2sYe53gexNI2Si0Z5yxPSGWY++KAOL1mrgPIbLEYpHp5RsU3VvFnpklPE6u
         dO+G7mMcIVag9eMvNv/5ZuILFUH+xb7W8fMMvQRM623dyJoDUqxzCAAQosHWtHa/oPgR
         B4hUEQ1h760ZMuWxZHb5RXprFxM2Ax9gzxGbyW2ttI6D77gdzSIYBqiU5tw/l+5Kd5iu
         l0qg6pLOBFwendHQLujqu7m7yPbt4wqoE5woEwtwSFSVbJJtHPizwighEUB9Ke8D8PEX
         RmFwUgd5McV90SzwE/kGgeJ+slQ0FrD9ScCJqSD3cGYbL8TnDogGxN9dvXCAB8samSEZ
         PnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793076528; x=1793681328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nNac71k806PRByKbpE3u7jP68UWqjas3/Ce4QU52ks=;
        b=v5EmF5PKvho0R2Wil/bEup1/JOYhZqudeeUR6rQmfOuB9c9oVqxHxMalZsp2bQFz2i
         BWWEC4+9u3U2rHnA0pIodE9HltsJffF7gIjfWf+hS9ff+S9d/Ohu6eJ5kYbYLbLBd7q7
         eIwpclNaCD4k+sniioKGfXdRDprPHawt85UVSJDAjxWGPUG+wA6TMCFO1tdCzJtT+f/c
         KGKy6nAz6UEQqdDN586em9dgYXvMVzl+jhT5soG+8PhUl+wYCswhwmsA3aocoANAfJbY
         Q1WRYqHaiYy/yqm9taQBYLnZrCfA5a/P1Mz+3uWd3qE4NI6Af8Mzud4crXhxvrROaMix
         A2vw==
X-Forwarded-Encrypted: i=1; AKwUvBxXmlPQSYnwNLtKF7vPGmThAmIpOeHOKOZg7mtjUwkYL7yVwoSGkM8zU9UuIu4ZDls18t+R55mnTPDTIJc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAo4z9mW8Pz/Gu+iFcftZrW2c+K9jn8yoaDW111RHIk51N8xP0
	xPNJ9nW6yGab3BT2EUqDDZzEbUhVMIZB43yasX4Ay/tuR+HCdBobiWmZKXqzystH
X-Gm-Gg: AYBFou0XXjymAduKPFqrYQOMz2sNYAchko+fecOzO041oXNY4W6/9zjGHBX81QaGlmi
	LRGlyim9j260bXhcKza2Q6jG7ASpFcBwkZd6zvLFJhz28gaPPo5iOoRhFFmHCT4wDAoeyjhL22S
	L0O5Vt2we015OTK4mOgdwbUao9W23qwx1mvQFP9ZECmMz3reQEEkXamouFzhORNo0j9/eN8vBnW
	qgsbIKU9dgUzV2R3Ve5SjUE1nyN57thqGJuTPT6h1u0TqaQlRV7BPPZc4dYTEUmZKIyUEuL5mnQ
	uoqD/Nqu7IynHFoFueMs30AFFq60ThcccPJb5H2bCw4aHTSWn9yF+6iB4a42vgV0bfiEx85tX15
	N5eOjDJ4I5/y4SLqWQy8sTRooyBnfKbuVD7zBhBvkbtpHCrCE//1WPZBzOOLRDVmeoWZnTpRjzo
	ZMXhJHj+fPD8qQlfaAkoCUdreeCrciPy4z5k5tj0ja2INt5NFzJF3omKCbLzKJeoTcPsJFb9PaU
	QZUms4Xt/eRwBL8Xkc2hshEDfvb7n0OpsXfL4iDVzt7I6o34CEOIfQYIBg/3j/N35cF2axetnl4
	8C6jL/i3cn3NX2JrCMCS8ZwOYrI8LSJacQ==
X-Received: by 2002:a05:693c:821a:b0:36a:30b:5dce with SMTP id 5a478bee46e88-36a030b74dbmr7205493eec.19.1793076528157;
        Mon, 26 Oct 2026 21:48:48 -0700 (PDT)
Received: from chitransh.. ([27.61.39.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7b23sm41283776eec.19.2026.10.26.21.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:48:47 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	W_Armin@gmx.de
Subject: [PATCH] platform/x86: dell-wmi-ddv: switch sensor mutex to devm_mutex_init()
Date: Tue, 27 Oct 2026 10:18:19 +0530
Message-ID: <20261027044819.75761-1-chitranshmandhaniya@gmail.com>
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

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Replace mutex_init() with devm_mutex_init() for the sensor caching
mutex so the mutex lifecycle is managed by devres. This allows
removing the manual mutex_destroy() call from the
dell_wmi_ddv_hwmon_cache_destroy() cleanup callback.

The translation_cache_lock in the same driver already uses
devm_mutex_init(); this brings the sensor lock in line.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/dell/dell-wmi-ddv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
index f8903ced461b..c7f3d07abbc7 100644
--- a/drivers/platform/x86/dell/dell-wmi-ddv.c
+++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
@@ -548,7 +548,6 @@ static void dell_wmi_ddv_hwmon_cache_destroy(void *data)
 	struct dell_wmi_ddv_sensors *sensors = data;
 
 	sensors->active = false;
-	mutex_destroy(&sensors->lock);
 	kfree(sensors->buffer);
 }
 
@@ -566,7 +565,9 @@ static struct hwmon_channel_info *dell_wmi_ddv_channel_init(struct wmi_device *w
 	if (ret < 0)
 		return ERR_PTR(ret);
 
-	mutex_init(&sensors->lock);
+	ret = devm_mutex_init(&wdev->dev, &sensors->lock);
+	if (ret < 0)
+		return ERR_PTR(ret);
 	sensors->active = true;
 
 	ret = devm_add_action_or_reset(&wdev->dev, dell_wmi_ddv_hwmon_cache_destroy, sensors);
-- 
2.43.0

