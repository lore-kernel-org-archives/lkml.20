Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651529;
	b=d6QAwVspPw7iatd1UHsbhCm5U2UaJ0MrNa/NUrZ/hp2dxiHPBZ6eeO4sbInjw1ggNs78
	 jo3BpDGmONdOVsG0Kst3B/x/tMWKd3Lrk+LYdsVtdBP2FoyE5k8+xmUYHsIHEjUh86Bz4
	 3pfAnT+OCrG2RAo7X98OAWWxJS9dIrNVVZqfSlvDAXMa+h7zhDxB3NUZhlrGQS9+OOxbb
	 6/if2QTp5vob4Qxb14EBHrORA55cc/NBG2bhCIrWUeTcZ+L09tn6Ey+MrGxT5A0tmqpF9
	 GIAjQaSF7AuT5EV/DuWjfEvPyg46I2ibTe66ZEcQS6aaKMgZmyRTfjfx7IBcnmGFxbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H4Ir+S1HIvgiCnIswFhbd70oXGozU9IYDaLeZqUpSfc=;
	b=RtusjTnA6M7yS4y4bP1a8iBZaF6iotaApjJ3hFgA8vT0ZpmudUPaCbPzYgO/xjVIvzUI
	 wX1BvBS0jcsBmipJ0JbldFkDFltlHlMLtIC3qK6sOfLWygDPXYVCIzQFU2UvNxaYQH3lF
	 IOZ0Otyd3y+HhHE836kF9COiqdsHk1421nx5JOcbR7P6I7TpnF8sAv5rDpVMK2z1DrX37
	 SlckigwOyuAD14vc3pI4B+11P45WNwXYW7fFGbPWOSJo9vBsBRY7AB4Dlj6MITO5YnkeN
	 tVv+scvuwChxE9sTR57eTbBbv1HGO7w0j8qbOOwxZKQ9l5FaMep8rCumjtGvXBtF3Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tMpbStDW;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33937606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33937606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tMpbStDW
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1635742c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651528; x=1793256328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H4Ir+S1HIvgiCnIswFhbd70oXGozU9IYDaLeZqUpSfc=;
        b=tMpbStDWCChEQaXZIQoa52f8Si8VaB1T03Y8ayvkbQ+zG5gAHettQSRqKyfI+2+b1M
         ZMjmahzmZEa7qb/PXDJYOZ2pcyXFjGdCxnknHV31vrGogtpnObgN5QYEEIu+1lFB3s3+
         nkGT1PQAWqMzEuKLssS+TdInlQFvqvyHw37GepQKuUnxbiPmzxaEfgd7RjHj3yDstEZA
         /GgynEk4o+wK8+ZcrO5jAMfv4oey1kSjcMV15Joqc1ofsLvWMYj6E2djldockEMWclIk
         2WdX03fvgkA8Ra/klClxvQHNQf6sH4Vu2Nt5M1/V3o76WxIy3FMrj4txLyIhuT8FWPTs
         jzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651528; x=1793256328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4Ir+S1HIvgiCnIswFhbd70oXGozU9IYDaLeZqUpSfc=;
        b=Z8HDKKSBtgtmtxQoNqmHdkSlPOkSUIYydhaUHUTMos7HWIfZQTTBMBY3clo4GV09I7
         1D3UfuRNlio0N9zbJXUDAR0NMqHgZYd9zeXM3XUgqFAM9eL2gjLxGLxHLzLSB3JFtCjJ
         AMtSuXiU3qVPZc3bUWNB9J+osZe7997w7f4sc6KFB//AaHU6V1aABmgQ62hADWwP0N9C
         84w86Nlb/S/5quoEKLxQTLu2NeQbHi3SPD1ZHdwQ9fjefux/0jMdA4nVSp4j+23OD0XK
         xgDW9zrJsULx6v9pamPaIpotMk/N8RL5NlZmY9NoQCQeJAou2Pq0P5iLYzBg7YnxdJ6B
         tsbQ==
X-Forwarded-Encrypted: i=1; AKwUvByCI4HpSRuq5JpFkuglSLvMHCK7HJyVNdyOObC2ZatZov5dDyOoDr7JkcYyBb7U2kqySMa5fyt115aL7HU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+fYvktIhEX1GGofv3MDxJl+aL5YDYlvL963HzxfkOyWW2yLTA
	xxeUtlomwdP2BKU/ysc3lC34VNqFADMF9SY7mygHZZZ5KykOY43JPyfG
X-Gm-Gg: AYBFou3gjKxDbXozuQWg1o/ybCdXFRoOv1/cNMDrskp4D4uw+6QwgcXN/ByuQoHSTKq
	IVw4fIi1ho2Sm/CZ1L25JZshDjwnVrjgMi8Dm9RqX7h5p8rafWX36Z5o9di2oOf8vIw7faVjMaU
	SSUebHoziUmpU1NIMg3r8TkLKpiz/rXYUjaRAbk31MGAH/KtkuMfFctz7xgKZQWpTGE4mps1k7L
	6Acevc0fM1R9cgFtj0MkVIoT9Tg+ezan1Os7v6LVzNMYfRqvXv9nvwakBh5IkaEJmantoML3d9N
	ssa5YZZwUJG+njd/ckoWlRxJfVIALzc8CVgjbnCHcJIIrJhlrEQZ+xtqds7sXcir7Ub2wiaQdYK
	I+YQB1WkQaj8/kJiBWCq3e39PgHDf1QY6Pc2kAkbo5BWld5C1i9uxI18Hl/UrVrp4wsZcKvri6S
	6DNQ2TghcfT20xlvjsG7Z/z0WGYrMMqAPWo4t2fteIiBtL69Jc6GOviMUvNw+uRiOLjWnFpKGLB
	RNtw8/Tg5zMmwuss0lCA2HxAfUixpFbNVQKbGZaFHId7SkePbm+RsG2W9AyGKp/2754609H7oFZ
	vxBoV4mZF4xCvxBSJP3NYWBxQqLvTx8=
X-Received: by 2002:a05:701b:290b:b0:14a:8df8:56b1 with SMTP id a92af1059eb24-1933bb42675mr1646687c88.22.1792651528119;
        Wed, 21 Oct 2026 23:45:28 -0700 (PDT)
Received: from LAPTOP-LJ15R92N.localdomain ([152.58.25.80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180b9esm18403478c88.4.2026.10.21.23.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:45:27 -0700 (PDT)
From: Akshat Rawat <akshatrawat095@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akshat Rawat <akshatrawat095@gmail.com>
Subject: [PATCH] staging: greybus: add missing newlines to sysfs_emit()
Date: Thu, 22 Oct 2026 06:45:35 +0000
Message-ID: <20261022064535.13466-1-akshatrawat095@gmail.com>
X-Mailer: git-send-email 2.53.0
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

According to Documentation/filesystems/sysfs.rst, sysfs attribute show()
callbacks should include a terminating newline. Add the missing newlines
to the sysfs_emit() format strings in gb_audio_module_*_show().

Signed-off-by: Akshat Rawat <akshatrawat095@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2..5737f2a32 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -103,7 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -114,7 +114,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
-- 
2.56.0.windows.2

