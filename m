Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.78.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8333DB325
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153426; cv=none; b=MFekXTXRssU3qRrQHSykJIIqw6dn1utXIEo39dETeqMMcFfebqLwcouUdqm8obVqldB6G1zEcSO8QexJ9grXjUD3CzaUxiNGhgvbCiBnva5TRp+zDcak/RUyX9i8xywAVn3FoJBU+T8QqJQ9YOWwCM3VEG9VbLire+72OnnQkdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153426; c=relaxed/simple;
	bh=eZzOC6G4Op+65s6yYFOvGkIJFBiS7fkTUPl+gd8kLWg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T2qj4ZM0YyQeZLSEzV45PobpiKt+HPgY+XZPplkS/SJ/mHCBTWOsY3eWbpVU+cbp2xH9HUnK2oIfpzNJBBz2gOdnOOBBiBI03HWPywJwHgGwDvMwkhWBSCVHmojkmS7jRl0ZiVtS3ntpVmxfIj+5qXrkKT9ahUw05rNEZn4YZe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=post.cz; spf=pass smtp.mailfrom=post.cz; dkim=pass (2048-bit key) header.d=post.cz header.i=@post.cz header.b=W8vzNP22; arc=none smtp.client-ip=77.75.78.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=post.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=post.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=post.cz header.i=@post.cz header.b="W8vzNP22"
Received: from email.seznam.cz
	by smtpc-mxd-59f5574d99-2hr9b
	(smtpc-mxd-59f5574d99-2hr9b [2a02:598:64:8a00::1000:a0e])
	id 2a111f3188304560396b125e;
	Fri, 11 Sep 2026 21:03:13 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=szn1;
	t=1789153393; bh=GFp7BnLG/1x1xCdoSPZ7SXaqDjzPcY8Q+nSC2hvHHk4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding;
	b=W8vzNP22XjZ6TftiFo7i59CnpNjJtHvw6uUIRmEXKJRJZPKmDW5ChJZGLzy+qc7wy
	 JpTcK7HvzztPsTIqLeWyCm2sYFkTd17L1gwew9bWiEQBmxFvUT2T0QuTUf0LBasMeT
	 423VR0fRuYX+gqFoGlzVmFbHVbTceCjhvDGJ6Iv0gP/jhA24lEwDdxgCOJMybhA+NU
	 Mq/o74kRFxoDVC+V7Hdph4c46meErym4qKiEIpo5fwXD3JBsgkRZ2/y0RE6mSG1nGF
	 DC7UgYD8TkmX4LYlCTWYtW2I6NyJgheHF0KJy5WZjUAJgs95ccs4xIPlX6SUEdqrsE
	 p3Flf7pwWqkgg==
Received: from raspberrypi.tailf05c2d.ts.net ([185.155.34.10])
	by smtpd-relay-5d885666ff-7f2q2 (szn-email-smtpd/2.0.83) with ESMTPA
	id 611123e7-6d0b-44af-879d-c6dd0c220d59;
	Fri, 11 Sep 2026 21:03:03 +0200
From: Matthew Zvolsky <matthew-kernel@post.cz>
To: gregkh@linuxfoundation.org
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matthew Zvolsky <matthew-kernel@post.cz>
Subject: [PATCH] staging: greybus: add missing newlines to sysfs_emit
Date: Fri, 11 Sep 2026 21:02:53 +0200
Message-Id: <20260911190253.894650-1-matthew-kernel@post.cz>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add terminating newlines to sysfs_emit format strings to conform with
kernel sysfs guidelines. Also clean up envp array declaration to be
static const char * const.

Signed-off-by: Matthew Zvolsky <matthew-kernel@post.cz>
---
 drivers/staging/greybus/audio_manager_module.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2308..16b688cfac75 100644
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
+	static const char * const envp[] = {
 		name_string,
 		vid_string,
 		pid_string,
-- 
2.39.5

