Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575173;
	b=TEir0H0AJlvMOAxp2H+YXQednXHM9QcwOfYL80h/8BwWALHsry0K4jNZCW8rqGMlEhZS
	 sKk4yrD6ql7Pe1UPBke2ueDz6LS0aEInBWNZ0/SFOySeb4B8DQfAqxhII9jIFsmLR4dWS
	 IPUYyzUvM9IrWLx3Ovs+FoCIQJ1DUYKiBveBgGTG2BkhW32ZodD8WAZT+UzvaAdlwoFgk
	 KgV0V/jnmef11Ku/ouQuxSMMJW1JOuQpvPQaFgI+aZmn9jPGmSD0Ka1rGLTbJkgE4bsDM
	 EsMsNLMbWV1SLMRbr6igs5yz5UxI0l3JM8BxoEvQIy4wKxWfUu1u8TXGrPU+TvSIXLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xT6/02hBaUasCAGFwUh5CvkWepBMBoWWF+g72TdI+6U=;
	b=Q5F1eTWZdvW4xQ8C12NhPRH3/eJKrvZrd264CGc9L3sNZE7HyUiK4wVbHRfaIp4q+q6k
	 uHlumsVqGB0k7XSM07OwfhnE1SrY66HGHJMo4p7Ceq1RxYetpFayYJqoKMvK3328n5lZc
	 Xp7clXH2PdzlkU1CBnwjHobUjOlwSI5UDOGAqYKvl48Bvjbp/uLxFPCbgDyyh/Y8RVwpw
	 b4NIvXzGBwaJot3OTF7PsvHbGrU9LkNp0ABocAMgqihetDIvZKiZ07L1IhCwiGqTKynZs
	 zGgWUSvqua0N85PM1kfuZpHPQTg1Y9gKur+97viSz2CGR8Ojk3QMlWX+gz8b+NesdEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=szGE0f2s;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B24606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14B24606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=szGE0f2s
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so911331c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794575172; x=1795179972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xT6/02hBaUasCAGFwUh5CvkWepBMBoWWF+g72TdI+6U=;
        b=szGE0f2sDdz7zizHw00OIhnLmttcjLzq+fmK03Qm6UIeDQozwmDO9eNZaxd3+j5WxC
         jF4E4tzQgp/um6BybEXLqDGaSQU6By3vXHi2EERVvOm5CUt8Pml93np13AvfdMPtRANC
         Vzvf7sENZ1XTvCkpuERYMfGqxUpQH4CjcNgIFnNF1HXbAkHkZmcSN/TN86m2Jk07UrG4
         V+dz/bZR6xsTE/hhznn3ZfUbZEjL+kbpqzTT0MyfI23zUD+Z2sXPUZddRLIMD7OH7KMd
         CbTxNTmtYcttV5Px5NAZ+7MQlULX15g4zmZfbpVdpWSMUPCSz1iC6NKZPx6pubAkVdDT
         DiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575172; x=1795179972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xT6/02hBaUasCAGFwUh5CvkWepBMBoWWF+g72TdI+6U=;
        b=GhA3uHbVOly6nTD6GKijXYsR19eaQJOhsHtbj8kg24vEp6sJIbJ6c1T1QYY66C7Sl0
         vPoF9twCLs43ErNTOmANJ2aFpvcll5XilL1vPfK3cv/SdavkWs0bEBG8OSiLn4/DeiBS
         G8+CGPB3PkL7HwKpKYpIQ23KmJ3pJxOBA7JbQ1TWMBVnpVnfrfnLhBMTLasWJvUoLnmt
         Yvqs6+rc4VCRdifHdyL9Pcyfw2sCW57hptnTxZZ9HVcXLVUrMsZY/Xgl6tXp3vCks38l
         uhnttUfDu9i4HzJ+Ul959cyibp9ChgfMhDKbbSemKqz+gB0YlagJwiwR9Ua/jbBP7ShV
         ocuA==
X-Forwarded-Encrypted: i=1; AL+hErGKcyRxfovhtQb7H8QxKKIKBEcGxHnJvL0PkvTl/rkDNXaT39M0hTcjDdp3yTqWxy0bzRijfna2nqpEAk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v+GaAvhhQQnkEU61ICOLwJeIiyem4SmZNrEyTKpm1r8xjJANl
	k9Qq96PtoLm8jXorWDLaAhAUdLYfD+FoZYP/K/zYwRWvMVxYpKxI4WmM
X-Gm-Gg: AYBFou3AyFCculSBcn0toqudll1iX6gPG0+SRDudVGLDRizE/gtvjntycQO9Yba8DxK
	cMbJKp/HJTxbDHxDvATrLKIdTWKOcRj1T5Lvw6XFxZtVSPM9LCEFkZLol2dcK3gPftGM9g3UHqC
	QuH/WrlWaF2dI8Eg45hIzUpNloxvrt6bc8Vox8hVSYn6lX8TWK6DH1UbRoj0osFr2NPlB6LapUr
	+PnLgPScisgwdWo66uib8c5MmmIUTzXMHVv4q+/iqQLxnXv72qxq0zYaQxn4TuuA9euAOFGETk8
	FVQIeEnFdOjoKAcgjGEw4qqlx+TpXbkCtZe9RNeBKO8mShkOTaTDdpSd9l/ihJlkPsFprhmgSs+
	uGanmWSQAQ7LDqXqnCTeaoJ1WML1d4qegTvBtUlDZNM/nzwc02o9FtDTuyepT9QI+TodJJmsfqo
	p+cpx4ONlNvO5zcwHPiXGRWLO2BOMi69ezwUxD4kDLJ6yiA2GlyaY7trtaXSSIQwTNFR94nI52P
	W7jnCyp/Mj4AD9YlGnzVmYXCNwQYTsoyU7llMXVRBjTX/EsAGuwQ0D5QuhqQgW1/vUeRmRotW93
	b6Z5F4ViAyBvkxFEcMN7Xy3Wr3cM
X-Received: by 2002:a05:693c:8310:b0:36e:3ebb:7ef3 with SMTP id 5a478bee46e88-37968d8a404mr2101819eec.39.1794575171781;
        Fri, 13 Nov 2026 05:06:11 -0800 (PST)
Received: from joyboy.. ([2405:201:1:3910:76e1:e2b5:93b5:6091])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm14704860eec.20.2026.11.13.05.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:06:11 -0800 (PST)
From: Rishiraj Rajgor <rishirajrajgor@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishiraj Rajgor <rishirajrajgor@gmail.com>
Subject: [PATCH] staging: greybus: audio_manager: add newline to sysfs_emit formats
Date: Fri, 13 Nov 2026 18:33:24 +0530
Message-Id: <20261113130324.34353-1-rishirajrajgor@gmail.com>
X-Mailer: git-send-email 2.34.1
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

According to sysfs guidelines and checkpatch SYSFS_EMIT rule, sysfs
show functions should terminate outputs with a newline. The show
functions in audio_manager_module.c omit the newline character from
their sysfs_emit() format strings.

Add a terminating newline to all sysfs_emit() format strings in
gb_audio_module_*_show() functions.

Signed-off-by: Rishiraj Rajgor <rishirajrajgor@gmail.com>
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
2.34.1

