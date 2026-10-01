Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB655349B6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889304; cv=none; b=fj6gDzaJTCm9HaTmloM5vbaa0SWaE/SJvaViCxzGkcaZu+1/EAhVnHAfx1tP2/v5qY0RYQ8k7J0j+SoSEbHhjoX7kU+t/pEdN6GDtzdBduhZUywm/A5eYzp1F3RvqzC5mYtElxU51mdAeGwgPQj8MJgJEKxYNvPrPwT3PfbgG6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889304; c=relaxed/simple;
	bh=BlM4I36z6bhiXInG6xUzWTewHXmRYA9d2vHYlqTqc2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gwpcMpJrv7pNG4ifiJM46e9zjKGK3c0ZpzSMCyPUv7TpbryP4vkZY581fZ4eyRwe6UR/r2gVKszO3fXJlTOXM3Isbm5ShWpyE/GB15/xgnZkbsInXwR3kRgfX8NmV7GswiKsRWpiltq623UdxwTZn3+t0VGKiBB6Y2436zSDM/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9RIvWVO; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9RIvWVO"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd04edb5so619987c88.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790889302; x=1791494102; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZksoCsYbeBUOZimGQEpylXwSQkeR+dlL9oiy1lwzdCA=;
        b=R9RIvWVOzsF6ipjHsgw2crKnRSIiqbT90yMUDcL9kqLRoEe8lOwBWa7Om4twOo/FW4
         jyT07Ke5SfShj80pZso09FF3+LBKAWMGjpDgND5h3dvacfSt5OM2Fsw44/SPYr+L6o0v
         Vq9lo1tXH8zwAOO9OnYC4d8pi7quzHAyXgy5iwQaIUIgSdIDmegVRQMwKirC30SdsPJW
         j1dFjCaF3zfQ5GU+GXN6h7oRDyJNE9lS3j1vJoasxIyLXyBhsT22KPLEg6Sj2hBbNK8y
         WhVl7LbRK984gVk4D8MAUMCUS5FmE+f0XFOSz8j7geEvOIJbAnMhJ/9ZIRQVD+V50p9+
         uHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790889302; x=1791494102;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZksoCsYbeBUOZimGQEpylXwSQkeR+dlL9oiy1lwzdCA=;
        b=xuljTU+9O9nb79+g6m0JuDNzqNlctc2B5g4c6X/+aUQUQ4tOGrqEj9REV25IhiNToH
         RmSyoiH4lEwDa+VmGLnZ3BaT5LAGrdrSox8pmW4jyICJjvQX5G1zM9w71QqLl8bp6pP3
         2Czai/5zPWifnlTvxp2YL8lSg2xSFSuPVeL7vrZOBcItW3ZfBWciACSa2tzcOmSyal6Y
         mojZVoNsdFwEoVjnRygf0m+0moeBrnFHkWZM1zHrH3dD7hrAGWDN0QImFulH2TyDF3QU
         vPOaJiQ7Vk8jm3JBWMR2j88VUMttpcPr5GySWjYrn6GAZWEKxY2lx15+WNQGkJcGbRab
         DhRg==
X-Forwarded-Encrypted: i=1; AKwUvBzGMw7zr3lDPEjyIauktT6nP2Wo3Dy4lri3Wm7LWhYkjO7l0K+8BxDlFZv1wAcamlUMuO2/gS/Nn07UfKc=@vger.kernel.org
X-Gm-Message-State: AFuF++mcTW1Xl7tQF25HIHEWXNgS7Hgs3PM5ZuLuxOsDxb/n85QWQmcJ
	+NGiS7v7Lnb3maU0TRpWsIWVF4gJz0fy5fDHoipXTliwWpPPL0mdQV1VIrOrrZP25RIyid4d
X-Gm-Gg: AYBFou16GIHJZbhYDX7UZML4IO3tQvYiSrx6L6VPhESrhUmj+ERoh1E5AUK+AnkIuGc
	86RF5mNm5vnBckQOZje2le9zYg6rL+/hOAhCK5qRGhSkHNxO7fPZvdC0GZBErT0WS1+03GJjnyf
	jc0R+BimadkXVfzQN93E5d7unjxidBt9O8gQmy9hQLG02RSH84gL64roEpb7gIdMPCRkUMt7j3h
	IF3YIydRQ+cqCzh9Uoy3UxfFPEUCvrGIN+haoadCeMJEaGkFsM4vm/mgX8gkDN7e/izDsp4xGbd
	gEE6EEu6obRZbyofDTNXN3+sCeeqf/mhliAAVZRSrdY4SAnhTZpkCG1onNHS46KFRb3KTI1N8x5
	epEaAsg5L3XnGA0jBhjjzAcA4xcbgQzrZdiTwInR0D5ACDr0WP/myoSUF8x9+vw1xwtRpwpzAn+
	MXj93WpwSFVnXLMbkhgvfTVBErWp3KdA19TPuX/c52AqZV2hYiFLY=
X-Received: by 2002:a05:701b:420c:20b0:143:5266:48ee with SMTP id a92af1059eb24-14f5d1b790bmr474903c88.42.1790889300697;
        Thu, 01 Oct 2026 14:15:00 -0700 (PDT)
Received: from arlo ([72.235.71.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f067301b5sm925268eec.1.2026.10.01.14.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 14:15:00 -0700 (PDT)
Date: Thu, 1 Oct 2026 11:14:58 -1000
From: Raiden Horner <raidenhornerdev@gmail.com>
To: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: audio: Fix no terminating newline in sysfs
 emit
Message-ID: <ar7NUjfCOwtHRTuv@arlo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Terminating newlines added to adhere kernel coding standards
and reduce noise when debugging with checkpatch.

Reported by checkpatch:

WARNING: SYSFS_EMIT: return sysfs_emit(...) formats should include a terminating newline

Signed-off-by: Raiden Horner <raidenhornerdev@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2308..98b12b77aa9f 100644
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
@@ -158,7 +158,7 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
 	char ip_devices_string[64];
 	char op_devices_string[64];
 
-	char *envp[] = {
+	char * const envp[] = {
 		name_string,
 		vid_string,
 		pid_string,
-- 
2.47.3

