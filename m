Received: from mta1.migadu.com (out-49.mta1.migadu.com [95.215.58.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6504AFE10
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347371; cv=none; b=nu0k9wiNcM1/XPy5bGlPkyxNrWLxY6X+noJCrGkfPTc7lOGKabxZEqP6IlLScZ43lzOtqM7gCkzF7MKSf780rpgGbEYmAZxjEmMbW3xj/Nxbl65JmJaBTYY1G1p9QyRDiZ0xWRfntuBPL3UFqYqFofSXwWMZkyeE/4FYJoNw0fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347371; c=relaxed/simple;
	bh=5AL9LkZ2LYbHywWwODcudzzAvjR2VJe6JkktCAmnYSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sNiRykBSYJjPm5EQ4elSnoEvUZgNsJ2CCdGzq0KDrP46Xc+0SPFwUKWV7QYIRBcCS7hYNC8c6bdZUdRwhIhYEha4AIxmN9dpGLMJ8S3XaNuY3ZHw5N2WAnrpkqzUjSu53DqHGFZQ4mxyNt5a3gHDy83wP0UCL2om60eqZCTCSrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rCzfzmfv; arc=none smtp.client-ip=95.215.58.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rCzfzmfv"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5AL9LkZ2LYbHywWwODcudzzAvjR2VJe6JkktCAmnYSg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790347355; v=1; x=1790952155;
 b=rCzfzmfvdeJTU7eYEWGODaJZv0kvMp49aVgrhuIRf8zEBBV9SQmSIpu5gViLOIG9vmIvNBSF
 Jy7oKpqU9H7hTyD+WqlAiaOeZEo3Zh+0gNinHULmJdPymmkPZnfhmE4gP50otJInFlapzHksQxV
 UWkx9Nc6B4tOuSyuxdkcIUm0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bbdfddbeec2d8be9;
	Fri, 25 Sep 2026 14:42:35 +0000
X-Mizu-Trace-ID: bbdfddbeec2d8be9
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Hans de Goede" <hansg@kernel.org>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Luke Jones" <luke@ljones.dev>,
	"busybox11" <busybox11th@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v3 4/4] platform/x86: asus-armoury: use sysfs_create_groups() and sysfs_remove_groups()
Date: Fri, 25 Sep 2026 14:42:28 +0000
Message-ID: <20260925144229.3693-5-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925144229.3693-1-denis.benato@linux.dev>
References: <20260925144229.3693-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

NULL-terminate the attribute group list and let sysfs_create_groups()
create it so that sysfs_remove_groups() can be used to rollback in case
of errors and on module removal.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 7c54f616d701..5d74a2322f4b 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -909,11 +909,12 @@ static const struct attribute_group *armoury_attr_groups[] = {
 	&panel_od_attr_group,
 	&panel_hd_mode_attr_group,
 	&screen_auto_brightness_attr_group,
+	NULL
 };
 
 static int asus_fw_attr_add(void)
 {
-	int err, i;
+	int err;
 
 	asus_armoury.fw_attr_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
 						NULL, "%s", DRIVER_NAME);
@@ -953,22 +954,16 @@ static int asus_fw_attr_add(void)
 	else if (armoury_has_devstate(ASUS_WMI_DEVID_GPU_MODE))
 		asus_armoury.dgpu_disable_dev_id = ASUS_WMI_DEVID_GPU_MODE;
 
-	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
-		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
-					 armoury_attr_groups[i]);
-		if (err) {
-			pr_err("Failed to create sysfs-group for %s\n",
-			       armoury_attr_groups[i]->name);
-			goto err_remove_groups;
-		}
+	err = sysfs_create_groups(&asus_armoury.fw_attr_kset->kobj,
+				  armoury_attr_groups);
+	if (err) {
+		pr_err("Failed to create firmware attributes groups\n");
+		goto err_remove_file;
 	}
 
 	return 0;
 
-err_remove_groups:
-	while (i--)
-		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
-				   armoury_attr_groups[i]);
+err_remove_file:
 	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
 err_destroy_kset:
 	kset_unregister(asus_armoury.fw_attr_kset);
@@ -1138,11 +1133,8 @@ static int __init asus_fw_init(void)
 
 static void __exit asus_fw_exit(void)
 {
-	int i;
-
-	for (i = ARRAY_SIZE(armoury_attr_groups) - 1; i >= 0; i--)
-		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
-				   armoury_attr_groups[i]);
+	sysfs_remove_groups(&asus_armoury.fw_attr_kset->kobj,
+			    armoury_attr_groups);
 
 	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
 	kset_unregister(asus_armoury.fw_attr_kset);
-- 
2.47.3

