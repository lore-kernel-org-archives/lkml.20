Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086994F474F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369666; cv=none; b=FI+KM+Y5dE4oeLg+zTDMvIALS+nNnilKc18GQ5u+GcyxnWGaKEAy3TZK9h/um8lc2+RKUQMtdf1Dijbaxh0sQaCROaN5If8wUNtTkWw9umGTsCEg1SQ9KjY579lEfkbA8j+TFYo5nbpOlHzfiQRIm9uoqDXUm4VTZzaa0EQtYCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369666; c=relaxed/simple;
	bh=wMUkMpvxRdSIcgthlqnHNGgTyW2QNMNAXejshKH+PfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fEELyWEoAEzKfaVrjqM21Hd2oMJyOHEp4AMkcgJUu6aTer9Rbla5apfBFpEmCJvjRQc9P1KrGYMCpRTXECAkc8AMb5QTqKV8/AsclrJ5E70hPhqZcaAjdZvnIfsFB+nL5orMuD2ZkNonN/AWIUsVwN7GuYB3PWrbzO7AOsqoZIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRHTx1+G; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRHTx1+G"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342568a5b54so407468eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790369664; x=1790974464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZW1dj8PuZjyHIWZ7P5gBwoFvQLqjKYglx97PDSrLr/w=;
        b=kRHTx1+GLwebm9QcdfMJv59mdTDoyD3wnX0xRpv9WwFXDtShxeCrgXCOfPQb7fL/LY
         6sntBr/lSsN0aakH1rNddIxxmOfB7oqCiy54TnxsBS9HmvQSirznIcNlM+MlnkFXijyK
         zpTGOazU8sO7TxYd0m5Jr3Oc6dwCUXqQFSBwLjKyfH2u9EoBatbbFHu9k/1eu6swHU94
         aq3zlR6QASYNFeViLMfmX+bWECdg1FctQIBVXa9Gk40LQLk3Npne2KGe2AtGDAnjc056
         waKx1tvefccgZw6dGPiBlrZu8lyjTmwAcXaLVvhTz7EZ0Q9jkeXHw8IhH9ylEGF0KdY8
         cRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790369664; x=1790974464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZW1dj8PuZjyHIWZ7P5gBwoFvQLqjKYglx97PDSrLr/w=;
        b=VqyhYp5lIZTvuZ9YtnzOQOScnUaP+b1n0FjwkerJAXObLvkospDMVczOXv82rRCqxG
         XTJbdarH7ASL4QOdMdruNslPg3j8HVE0+NQydNu1gdwvpBKG0BGWQBM7ONjQ2TSBzmNT
         aTwKqSEZuNu2A8V1lZpQoaAvQ1BYL98UgydA7apEQ4d4DfrlNh3V4odPslQVe877rW+y
         QY4hxAqDXN9aFopnYueP2xYseVi4f/klbBa3jcFeN+rjMJFqEOlJYNDfek5rro5iC8DH
         J3bjnyCe+j4nHTlWc70v6avpGpRQnPmaaO3Bxno5MVgDYQekyB6Ee8eR+vut+BQlVK4X
         2gpw==
X-Forwarded-Encrypted: i=1; AKwUvBwcd7R5T3pvIlzlPiSf+Nu8BmltOJsmuyB22LGf1Og4M89PwxMP3siH7i9KC/65BbfoB0yBEE7BMZYXs0I=@vger.kernel.org
X-Gm-Message-State: AFuF++lW0oxtWHVzT7NwYuZTuzexknncTvJbOlheUMlMqMU+gb8hr6GY
	DNcX8FkB8PXgPATxs0yNRJAL/7LvLDABMrbvo+YNfDDNvpTaHZFXOV3X
X-Gm-Gg: AYBFou1zsZj22uOXs/OW6HiKnFoa6aPS6i98d3oFwgB4ao5J7yL94G0wn2XhVq2LfP/
	Z64kG8BbgPrCgA1xKKWtMdfKifmy+OW+Jw9SwhWkSCN1ZG50ISpggTrRPaAG43xTJ9MxXqMesra
	npXNn5OpL7O2rAHDLBbG+EeW1y/MxLI/ZoiYYHV7JE2SfdFiQRTJd2k51sqIFj2ndibSbeV8a7R
	1rGaw6ycXmJB8xO9rqXwiqB/UYPNmwWDeTMVxcJeJXwpZO5c1m79raheVpSvX+jM0zBkv0BT45X
	cc6n3zaWgv0MrukvFz8F+kB51J+UUUv90T2Fi1auRnUSGt0lySPmLpCm1mwZO8nD11NLaKv79Ai
	rfg0HKKN/IQifTGo4OrrmyPp6qZbfP8kHkircKwWcLlI3EPKFtV6nJwosVk4l2cWGtSnAWn+jSi
	BTivZsmq6MydLbhk31anyxTpEQY9krO/LhsNeR2PREXkawDcHcCzS5+9WwknTashD7m2J6Y3cRd
	Q==
X-Received: by 2002:a05:7300:7313:b0:342:39f5:f9c5 with SMTP id 5a478bee46e88-34270ac9464mr1657179eec.18.1790369663811;
        Fri, 25 Sep 2026 13:54:23 -0700 (PDT)
Received: from operator.. ([203.192.238.51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm9437703eec.13.2026.09.25.13.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:54:23 -0700 (PDT)
From: Ashutosh Yadav <yadavxashutosh@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashutosh Yadav <yadavxashutosh@gmail.com>
Subject: [PATCH] staging: greybus: add missing newlines in sysfs_emit formats
Date: Sat, 26 Sep 2026 02:23:28 +0530
Message-ID: <20260925205328.59183-1-yadavxashutosh@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to Documentation/filesystems/sysfs.rst, sysfs attribute show
functions should output a single value and terminate with a newline.

Currently, gb_audio_module_name_show(), gb_audio_module_vid_show(),
gb_audio_module_pid_show(), gb_audio_module_intf_id_show(),
gb_audio_module_ip_devices_show(), and gb_audio_module_op_devices_show()
call sysfs_emit() without a trailing newline in their format strings.

Add the missing newline character to each sysfs_emit() format string to
comply with the sysfs documentation and silence checkpatch warnings.

Signed-off-by: Ashutosh Yadav <yadavxashutosh@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2308..5737f2a32f5a 100644
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
2.43.0

