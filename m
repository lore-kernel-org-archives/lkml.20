Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBC24B4025
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574360; cv=none; b=p4TeRLA7jGqQOkFReHVvMwbRjSLJcOyyBbV5AeoQ3DY3XVh6iICahNzHGuxVI+ie2RboBcL/DkHeq+HcZCJ/ArBP3NuhjwfENNKHXUMqpQd86v5AZ4MVmYqbAt5cQmpAjPrGpC14IKZ8y3C4m/7X7rlqgtYpiY4/Af94Pz3smpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574360; c=relaxed/simple;
	bh=kMWns+AkkV19g2ntJ9Bt4GZvg34B01WvXfsnBIlnUys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i8GF9XUPFZc/jQU3md/slmZJGmEP1Y7zkp4deWGtYSByaxipyQFjAlzv3+YCTzSMJyLmN4QAf/skj+MdESUxKmioFQne+hQ9Y5r+ZdSAhAlm2YF/U1wxEsVtQaFSW3KhsUSvXmRNq+A6bUv0URe2g3MmFom7rqMeZiTkCPPGqgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XF1LnI3J; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XF1LnI3J"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so14124855e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789574346; x=1790179146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=50E3YuEZXofIUoMxdIwnwVu3+9GJoeNTgmZl7PziNLU=;
        b=XF1LnI3Jp6d/hlkw+O5OMM7Es1qz4eP/WXP/WYlb3cxU1InLmrA95VMgk7AAMHulkl
         IjAg6YS0Gr6OqcQFZk8ziUQ3UcQCu7QY9q/2XrP4wTBNa2TAJZ3lS96v/mRQdo+90vMR
         xrtCiPSLTzRFkTF08GDjMXIQ2bX6vIh1hhyRi/vPB8+IKpYICGeH9xH4GXRXESL9Dmq2
         5XeHbCnCk5izeHaHUX8g2EbpsZeIF1CQT2zt0tHalR9rmDKV1cMTnD/m2Ts9UeBL/8S7
         cl0o5mZwLUznlPdV5OHfFgtvc6S+RTFO3Zfx4KuPEm0yrdsyA/K7rmrz8ZvuAFH+onUr
         M47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574346; x=1790179146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50E3YuEZXofIUoMxdIwnwVu3+9GJoeNTgmZl7PziNLU=;
        b=htjZHaiLPXqR/LiY4gm11XXrMlLGhDv8s//dZTemdAAYKEXbmIZWiREMhNln10FnBB
         dWnVlga8//8G25L22byjPprh3wtPpI5TxedoiV4CYcgeiJC3x9JsZJqAHZOj1HUD7Vch
         ZJY71/yr4Fg3Et+RyVW4d8WNRTh0kvpz1l0if5ITSrAjaJBGIHr/A7nnbFwh+zh2VQbB
         7Ww2Var2tQNzLkNeKOgUcuer5y3qO7t3KhQjsyCR9SpFBZdzUaKUTGAQ2VyQO0gbOx5W
         /X3GHjdcC0+Jn7hrakRWQ1l0F7ECat4F2VtIia712LCLiOsAxfj0LiMmCO5hceoNpG12
         cwVQ==
X-Forwarded-Encrypted: i=1; AKwUvByxBBXRu+vW4luOMA2ZGpBgCWA+OT9WiTKZBxdYHGu8ge+LQMEnmoVMhwZ510LUl/zx58M8uL7i8QHLWkg=@vger.kernel.org
X-Gm-Message-State: AFuF++ny/XCDx6zbKEDznIupoJigLd74bERDsVKChbHhCJzc41buOYiV
	ahtJDZr4kLVFdgYFlJNW3K+yV8z0Y0kgPSWfBWFHvf2AapLsl61cHNZz
X-Gm-Gg: AYBFou0EwxhvLLngqLrjVoLYv5BSvcqrvOnsixOW28A4N9LtpNUe28HftLuOSdDMNHD
	2dsV+myHwXUofaIONJMPkzzl8t6DWs84jxjIVft+cXuOWpVmXpJzHXENrL2X0rIm+9JiXGI35I2
	9cfJWGZ4fTQmomdKwnNDCgy1Z5QDffUIwOFhorU4aBVrOiLInvonqaao/QiePD7IIWF3brFR8JD
	PUHgIN7NmZREulmTKm6j4FdNMFHf5zDDCy9Eiip6OhEDDZ7QyOLx6qxjhevjOexAVwENgl+kErA
	5cyQQU+VyIh1XbJmXAzEwXcaT/HJINhkjvuXKWUdNPMZGnESUGv06IxycX9VAXpRiOAEEE4z+JY
	kGINYbCtQo2jyk0LQQg/0/4hN0vY8o1nRhCyL34znet+x+WjartJXbBAsBLciai5jbVrQaOz26K
	HrXWSWIfn6j6JFlR+d8zG6hBe9cCR4qZrYca9+FzF23BX8/P8rfwMPX2w6+Ss5viBtU+7l
X-Received: by 2002:a05:600c:4e48:b0:49e:663c:c67e with SMTP id 5b1f17b1804b1-49ebe991792mr42095035e9.25.1789574345830;
        Wed, 16 Sep 2026 08:59:05 -0700 (PDT)
Received: from omermac ([82.222.238.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd256105sm461075e9.14.2026.09.16.08.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:59:05 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: add newline to sysfs_emit return
Date: Wed, 16 Sep 2026 18:58:55 +0300
Message-ID: <20260916155855.9022-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a terminating newline character to sysfs_emit() format strings in
audio_manager_module.c.

Without a trailing newline, reading sysfs attributes directly from user
space (e.g., using `cat`) appends the command prompt to the output string,
leading to broken formatting. Including '\n' ensures compliance with
sysfs single-value formatting standards and prevents parsing issues in
user space tools and scripts.

Signed-off-by: Omer PALA <palaomer100@gmail.com>
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
2.55.0

