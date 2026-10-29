Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297998;
	b=qPeXT7PpwCI/4AvOPSw0pSiBXWMy83SOAQNzFGQvF08LPWOeltQuu1q3H7COtBi9Boxx
	 rUXYmzOHxkJ6uM/F9tdAoAPLA3mX+muzCffpNNeY2PYH6n6IS0dpH79osxl9K5CeKFhtc
	 2ElmaTRZyUiikli+rN6Tqdhr38PqLVS2DtUGigAdRhKEKRZUhIJf0QydwfuQo0uuGxqLM
	 J8cid2Q/E7dhcThGSNrKvynEaD5/MTxsqaOKNl0lq3+FKtAhYbKPc6CLeE2mqDIOs9+YR
	 SyXkqwR1nYPYKQiGqdSD2/H6CFW3ByDd2jB2iMLC1tyhe5v3dmTttkKHmt3tV/4kBvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iX/5kcgJLHYenTjEkqTynO0b70ye+PYgd2o/7R7g0Oc=;
	b=Cx6vGJgug5aMIhmr0JVtky6HD17hNbFYtN+6rciKYviYR9ZaEK+s9fEzAPQsP/mWIqOy
	 qdyleTJ29COJRms9hjDftueZu4eirlW08w1ybvmipbU6m6cYidT9CKdHyGjwzAmZqhxGa
	 GwyZTxmwEE7ogUAzmKVsOwwG9Cxs5iovAWD2lxI1m0h/nYfcUnSMvyfQj7b2oU9D+ahKl
	 Muy9hpKRx9Fyqg/2/6tj44Ac6wS7OjIoAotvHCNbi3VUOw/BohtwqGKa5Uy+RprIQCf8X
	 gEqXUWJqFhEnavXtucS1m19i7ZlmspHOjJmjnbsGgyRSAlluCNWG6rZWlCFjZtpfLtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYT7YE8M;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09718606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09718606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYT7YE8M
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c43fbcb4393so397220466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793297996; x=1793902796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iX/5kcgJLHYenTjEkqTynO0b70ye+PYgd2o/7R7g0Oc=;
        b=cYT7YE8MnjT535XzV/rYW+UyQxEqaI9/EWDmYbvWt7XA2rYcORvDq2FwiZKn68hH3h
         Hmjg5gt/vNEhjlZk+TFuqMG52UnP6Dg47AHnyvOVjbzL/1mGMD7IdI5MHkxDC0868ExT
         RisSZK41Ha6Sjy+kXg1sDLKDqx9OgclNdXP8DbnALJFClLd8UeDUxCFwtan7jcvM2KS/
         WfQivaOuHEEwv171mwo5xwP2KKFwHNKkf1SXIZmwUS997VBfEQdSJk4DDF+3Rr5hHSsC
         sj+UDlyDkVIlysrw4oy+TIEShGCXblqUBQxX3xRXKfB2PzdATVRxz29WA80sjhYG41hm
         q2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297996; x=1793902796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iX/5kcgJLHYenTjEkqTynO0b70ye+PYgd2o/7R7g0Oc=;
        b=1F8E2k1jJ6rRm2BEgJg/teXGQdA6qTN9MTsuDm61xxYp/5OzC05FJTfFs3jtaTDCR2
         70d9heAGFq3OiTCDZ2jqhmiHgSNtKNPyAl7QRAXTsW0DiHac7ts0EuNPt7M3lBfNwoq1
         FvKEclPGVCqLFvTphPSdqnRgzS/YRs9Yd5ybfh9HoTJfrte+fF5rV8x1jBW9nCGzOehT
         GYI6Okl43ZJvFtOmLjdDfANlaLM1hE1y8445V68RxjQRFTB6qBzhYZ10mlTZWUDvOxMz
         Tnwo84Js2LaJViSr96HqQf6OCf4EcbSys519TwdvXD7vAMXldyoo/cGlyE+DTt6o4RQs
         SyYg==
X-Forwarded-Encrypted: i=1; AKwUvBy00LR+r9sb/qew43/sd2kUyvMukD4U9LVmjup9jjOnpVsFLq3T1c11LQAEF/Ioq6H4CL8/iZi9L3/vScg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxfMHlBXj1Ja0ob8Z0IdtiBPi4hIgCrNU/GO1HIHB7EFozf6bf
	Cor2ejbUzL7LjtRGzGjTBuRgpWugM889F9rCQoJK7i1kKQ2Rx7jbgLzgN7kXGOvb
X-Gm-Gg: AYBFou0y0JG8lm7LgH2ncEotnzqkNiACbz2DP3VHmQ7oj7qD6Nt7khDh9xvsHtnJN/u
	4HGo5dMm8kPwSkCG1aJA+UuX/fi+M+OWtjoKvr3U/rAP6WVTbg9zZp4T7UIDrg0WtDKdP9ALsCi
	cc61+6ma3ICOwIyQEbX68t9syoTp5cZGNCmPDKd1/ObEMBbYcnnzLoEGdc+F4Ak+3sfyvpD6W1S
	l1wqqgqekJGig99zlBkCm5qrEXDAGucWJlFhWfWEO5xhQgzhKHO7nXrIC9SgPV5wuZhNJkE5t7o
	ec3AU3aODfhNL2MThIG0NiFimUHeZ62ZronoWxutJqICEy0iyp6VMN1C/DPfhAYakCnXM+VcIL8
	6Ss+KUZtITI0wY7iYO4S9Vh8N+R1nFAV1zhZeg1doaj0SpyeliihqTiGVgak6gfALSWCw177hVK
	CiDzddrXodjjaj1VVYpX8v6yKB6Ib/BDasR1dtKvB4xNUZS4mLECzgTBZ+YyMzfVMEHsWFMb1Dr
	ae8nbFPcdWwl+1lLXnyDjvKTI2P4ZYeBSc5Hqu0lWVjBa4JuHnI/RZmZxP2o6TeAAfPO5GVHC8s
	jW/JjWN09TMavYh4oRygP/33Nv+BUJguZIIKrN+9MXMeQrAHvj+u1ioEZ7C2ooQt++tT4VEmpzT
	8HQ3G5GX4RTGS/K4BFsDgY2ISqW4BxeSr3zcqZZb1rk/+tlAUqvRS0wGDHdWBSGFo
X-Received: by 2002:a17:906:448:b0:c41:1e13:8896 with SMTP id a640c23a62f3a-c49c635f4b8mr354049166b.28.1793297996159;
        Thu, 29 Oct 2026 11:19:56 -0700 (PDT)
Received: from maria-VMware-Virtual-Platform ([182.186.0.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca2de1b78sm10323466b.2.2026.10.29.11.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:19:55 -0700 (PDT)
From: Maria Sheikh <mariasheikh812@gmail.com>
To: outreachy@lists.linux.dev,
	vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Maria Sheikh <mariasheikh812@gmail.com>
Subject: [PATCH] staging: greybus: audio_manager: Add newline to sysfs output
Date: Thu, 29 Oct 2026 23:19:40 +0500
Message-ID: <20261029181948.13121-1-mariasheikh812@gmail.com>
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

Fix checkpatch warning:

WARNING: return sysfs_emit(. . .) formats should include a terminating
newline.

Add "\n" to the sysfs_emit() format strings of the name, vid, pid,
intf_id, ip_devices and op_devices attributes.

Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
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
2.53.0

