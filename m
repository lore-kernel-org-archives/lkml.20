Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE7947CC8C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792247317; cv=none; b=usMceyzbaTbtbm4zbuUlGsRmFqP+ca0nIQqGi5QB8jid541Ek++zst1nnVloSvt/41zCokhfM05Wy0MVIG1RCoWmatwvvaSvVxpvSeS9/b/LdGiA3jKL6Bj2nS8zR7Oduvakxgw6O3XePlmMIV2BZnQXfdtizXG8ogTZchUSjVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792247317; c=relaxed/simple;
	bh=KFgv3Vu+tnqvpaQP51JkR+LVi8r9HPxQcQulwSHgR/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cQRxLX0VkoObDm1y+mQTTq77yPkRO51S2j6M74k5kbeHDu1BDDYu4JuZzXxOpuwgbBgXHpb1hxEVbDSs7HKPeaU9WsBN5+R4xMIgFtD9TxekA0XeF+5LxB/sNKk7cL0e192oALxIJ3C63OjFrQP0wPwrMgJVr3KKKiDXo+RQzMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JKrBk7WW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y8GPa6Ra; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JKrBk7WW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y8GPa6Ra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792247312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=577UK/IrfP8S3LuMeyMt+iZan45Tovhf520l9SlBMbs=;
	b=JKrBk7WWgtHR6yLGWOaRdq/EkLTqZNDsqyqR6hUADwrCxFEe1PdPzu9MXk6oh/o+bWZsFm
	rmLdvknipVxOK+gln/SqOPN/jRtqLkS/fcLWUljihB0CwFgUYMcD++8GrQXx7gvoO6AL34
	ClZiBfHBv5wWjRWDWBBsgJaswhGA9BQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-GQAiIf1wMFKqhkV9KpVm-w-1; Sat, 17 Oct 2026 14:28:31 +0000
X-MC-Unique: GQAiIf1wMFKqhkV9KpVm-w-1
X-Mimecast-MFC-AGG-ID: GQAiIf1wMFKqhkV9KpVm-w_1792247310
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c46582442so468494f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792247310; x=1792852110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=577UK/IrfP8S3LuMeyMt+iZan45Tovhf520l9SlBMbs=;
        b=Y8GPa6RaNYNcxXRx/89WKGSUNbA8RQ4a6dRDaqm1DkW0BilDilcWQRvcx8/XIIAT7l
         oa0AbrvjiOGU3l5Akdp1gYhir62HBt026ckqG2LqdBDQg35/aKLKLCWoQpiHSerzlYuL
         l/F+zvdrbnYmhCkYPV6ksCiohafHmFkSvJVLbinIleLz1oQGILP21q2/RQRBRBhFIeZB
         LEtBMBQcRIwLW+yVdFW8IJbGGN9nPNDkYWeQ6+rI/w06gMsYZ4wn7T31EZEi/9gthqei
         Ae0QVEWssOt2pIZJzyqN4uzc7+I9j1+1JURvmkIWR3zB6oywMdOJEh6mRUIWgjL7J4sM
         sk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792247310; x=1792852110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=577UK/IrfP8S3LuMeyMt+iZan45Tovhf520l9SlBMbs=;
        b=xeQwnRSntRYopBq6WXT5aXL485quPlKs37/O69qtt+LTdR1dwnHjvj4DTGFS4myngA
         d/LAJSkqIvOaasHl+j2NioCAjgYClA/HvCNebn2toJ+jk3h/OU4N8VoE1TIyE0BYsYpX
         oQzchoJc6Lvixl0YVRA1THVXBk2mZp19qS2g6nZs8bJ38HZRKE1wzDsIMjkrnYvz8Ucg
         i7Sbw5SB8odAWIakyLkiAmyjmQRb4XJ5RsO/kp9FwdzeSaKleOnyaYW0ZX4wuJnh6uZm
         mVtnxkMqzwkvojmBuSz6F14jeOn0FUreFILgMp4cO3cEDhBoHvtLJeGotzSGBLk2pDAG
         Vytw==
X-Gm-Message-State: AFq9FYJytOB/CXjzZ/rCVv2WLuObqSTsGVDSMHBKGiUX+q7kUzZXWqrQ
	zMfxRccZq/lNpDuZhr77QEU92ozqc20C26dZk1z6+NqGkep2o4mzLHpsGv8fPa3eY/V8Jo+5YK0
	VEgdXex2Z/OmwR7sEJgIv5Ay7PcYGM5mIsVYrgZWsjzucoeQL6WrZx3xUX/qETn22IQR1O22eQ4
	TzpD8zKCyFTKXjwZy7RwT+Ue2JJ5G+imN9zT/b6s/LG5qNQTj6
X-Gm-Gg: AYBFou0KAxWptV2h5pl1V2MdzNLvyidccuz5zsx3CF+0AwkvWfWuv/JRgyggvJcbrk8
	xDqGQclrGqlsrjxdLJkBcvPvGO9bm3t00M2uOUFb6CnGpMABST/lm3Q0mhLpz6aLAsxcLN6We0b
	YzrrAifsvAZzm03LFqyjWjja+549CGw8OXBs6d4AwNz0VF9tYAdazzQpzRb28jZikB0dsc1mNmg
	0/4l2EB8IDUnQ2OgjRbpXe7JojzmRrkbVnObhYcHo4KT00VjnEMPOVPeND2d6VsxcRE/vrBINPn
	NlAo217delSmciZ0yiokhoee0YSjIY+GD2UKvDMKehKiUYkpo6lvUCNpmBT6tfbf+Bar+Kx0UWk
	6LdMxun7/g8glwurEk7/+zPtY
X-Received: by 2002:a05:600c:1f86:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1d75ab363mr62939815e9.4.1792247310051;
        Sat, 17 Oct 2026 07:28:30 -0700 (PDT)
X-Received: by 2002:a05:600c:1f86:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1d75ab363mr62939115e9.4.1792247309522;
        Sat, 17 Oct 2026 07:28:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d97b7bb9sm27107205e9.0.2026.10.17.07.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:28:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Dave Airlie <airlied@redhat.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	driver-core@lists.linux.dev
Subject: [PATCH] firmware_loader: Expose requested firmware names as sysfs entries
Date: Sat, 17 Oct 2026 16:27:33 +0200
Message-ID: <20261017142826.2668881-1-javierm@redhat.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most initramfs image creation tools (e.g., dracut or initramfs-tools) have
options to create initramfs images that are either generic or tailored to
a running system. For example, dracut has the --host-only option for this.

That option allows to have a smaller initramfs image which only contains a
sub-set of the kernel modules, libraries, binaries and configuration data.

One thing that can't be queried in a running system is the set of firmware
names that were requested by the kernel to support the different devices.

Let's expose this information as sysfs entries to allow initramfs creation
tools to determine the set of firmware names that are needed by a system.

On an AM625 BeaglePlay board, the following will be exposed through sysfs:

  $ grep -H . /sys/class/firmware/requested*
  /sys/class/firmware/requested0:powervr/rogue_33.15.11.3_v1.fw
  /sys/class/firmware/requested1:ath3k-1.fw
  /sys/class/firmware/requested2:regulatory.db
  /sys/class/firmware/requested3:regulatory.db.p7s
  /sys/class/firmware/requested4:ti-connectivity/wl1271-nvs.bin
  /sys/class/firmware/requested5:ti-connectivity/wl18xx-conf.bin
  /sys/class/firmware/requested6:ti-connectivity/wl18xx-fw-4.bin

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../ABI/testing/sysfs-class-firmware          | 19 +++++
 drivers/base/firmware_loader/Kconfig          | 14 ++++
 drivers/base/firmware_loader/main.c           |  2 +
 drivers/base/firmware_loader/sysfs.c          | 75 +++++++++++++++++++
 drivers/base/firmware_loader/sysfs.h          |  8 ++
 5 files changed, 118 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware b/Documentation/ABI/testing/sysfs-class-firmware
index 44ca1b78a0e1..bae9d4bca0fb 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware
+++ b/Documentation/ABI/testing/sysfs-class-firmware
@@ -75,3 +75,22 @@ Description:	This file supports the timeout mechanism for firmware
 		fallback.  This file has no affect on firmware uploads. For
 		more information on timeouts please see the documentation
 		for firmware fallback.
+
+What:		/sys/class/firmware/requestedN
+Date:		October 2026
+KernelVersion:	7.4
+Contact:	driver-core@lists.linux.dev
+Description:
+		Read-only, each file contains a string with the name of a
+		firmware that was requested and successfully loaded via the
+		firmware loader. The N number is a monotonically increasing
+		integer starting at 0, assigned in the order that the names
+		were requested.
+
+		The entries are global and deduplicated, if multiple devices
+		request to load the same firmware, it will appear just once.
+
+		Entries are never removed, so they represent all the firmware
+		names that were requested since the system booted. This list
+		is useful for user-space tools (such as initramfs generators)
+		to determine the set of firmware required by a running system.
diff --git a/drivers/base/firmware_loader/Kconfig b/drivers/base/firmware_loader/Kconfig
index 15eff8a4b505..368aa8289d4f 100644
--- a/drivers/base/firmware_loader/Kconfig
+++ b/drivers/base/firmware_loader/Kconfig
@@ -221,6 +221,20 @@ config FW_CACHE
 
 	  If unsure, say Y.
 
+config FW_REQUESTED_SYSFS
+	bool "Expose requested firmware files as sysfs entries"
+	select FW_LOADER_SYSFS
+	help
+	  Enabling this option will track the names of firmware files requested
+	  and successfully loaded by the firmware loader. Each requestedN file
+	  under /sys/class/firmware/ contains the name of a requested firmware
+	  file that was loaded since the system booted.
+
+	  This information is useful for userspace tools (e.g. initramfs image
+	  generators), to determine the set of firmware required by a system.
+
+	  If unsure, say N.
+
 config FW_UPLOAD
 	bool "Enable users to initiate firmware updates using sysfs"
 	select FW_LOADER_SYSFS
diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 24213a0ea831..409b6274156e 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -909,6 +909,7 @@ _request_firmware(const struct firmware **firmware_p, const char *name,
 		fw = NULL;
 	} else {
 		fw_log_firmware_info(fw, name, device);
+		fw_add_requested_name(name);
 	}
 
 	*firmware_p = fw;
@@ -1736,6 +1737,7 @@ static int __init firmware_class_init(void)
 
 static void __exit firmware_class_exit(void)
 {
+	fw_requested_cleanup();
 	unregister_fw_pm_ops();
 	unregister_reboot_notifier(&fw_shutdown_nb);
 	unregister_sysfs_loader();
diff --git a/drivers/base/firmware_loader/sysfs.c b/drivers/base/firmware_loader/sysfs.c
index 29a10d2ad537..0bc603d0d10c 100644
--- a/drivers/base/firmware_loader/sysfs.c
+++ b/drivers/base/firmware_loader/sysfs.c
@@ -423,3 +423,78 @@ fw_create_instance(struct firmware *firmware, const char *fw_name,
 exit:
 	return fw_sysfs;
 }
+
+#ifdef CONFIG_FW_REQUESTED_SYSFS
+struct fw_requested_entry {
+	struct list_head list;
+	struct class_attribute_string cas;
+	char name[];
+};
+
+static LIST_HEAD(fw_requested_list);
+static DEFINE_MUTEX(fw_requested_lock);
+static unsigned int fw_requested_count;
+
+void fw_add_requested_name(const char *name)
+{
+	struct fw_requested_entry *entry, *iter;
+	size_t len;
+	int ret;
+
+	mutex_lock(&fw_requested_lock);
+
+	/*
+	 * First check if the name already exists in the list,
+	 * each requested firmware should be present just once.
+	 */
+	list_for_each_entry(iter, &fw_requested_list, list) {
+		if (!strcmp(iter->name, name))
+			goto out_unlock;
+	}
+
+	len = strlen(name);
+	entry = kzalloc(sizeof(*entry) + len + 1, GFP_KERNEL);
+	if (!entry)
+		goto out_unlock;
+
+	memcpy(entry->name, name, len + 1);
+	entry->cas.str = entry->name;
+
+	sysfs_attr_init(&entry->cas.attr.attr);
+	entry->cas.attr.attr.name = kasprintf(GFP_KERNEL, "requested%u",
+					      fw_requested_count);
+	if (!entry->cas.attr.attr.name)
+		goto out_free_entry;
+
+	entry->cas.attr.attr.mode = 0444;
+	entry->cas.attr.show = show_class_attr_string;
+
+	ret = class_create_file(&firmware_class, &entry->cas.attr);
+	if (ret)
+		goto out_free_name;
+
+	list_add_tail(&entry->list, &fw_requested_list);
+	fw_requested_count++;
+	mutex_unlock(&fw_requested_lock);
+	return;
+
+out_free_name:
+	kfree(entry->cas.attr.attr.name);
+out_free_entry:
+	kfree(entry);
+out_unlock:
+	mutex_unlock(&fw_requested_lock);
+}
+
+void __exit fw_requested_cleanup(void)
+{
+	struct fw_requested_entry *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &fw_requested_list, list) {
+		list_del(&entry->list);
+		class_remove_file(&firmware_class, &entry->cas.attr);
+		kfree(entry->cas.attr.attr.name);
+		kfree(entry);
+	}
+}
+#endif /* CONFIG_FW_REQUESTED_SYSFS */
diff --git a/drivers/base/firmware_loader/sysfs.h b/drivers/base/firmware_loader/sysfs.h
index 1cabea544a40..6ed79ad7f6c7 100644
--- a/drivers/base/firmware_loader/sysfs.h
+++ b/drivers/base/firmware_loader/sysfs.h
@@ -115,4 +115,12 @@ static inline void fw_upload_free(struct fw_sysfs *fw_sysfs)
 }
 #endif
 
+#ifdef CONFIG_FW_REQUESTED_SYSFS
+void fw_add_requested_name(const char *name);
+void __exit fw_requested_cleanup(void);
+#else
+static inline void fw_add_requested_name(const char *name) {}
+static inline void fw_requested_cleanup(void) {}
+#endif
+
 #endif /* __FIRMWARE_SYSFS_H */
-- 
2.56.0

base-commit: 902fdc5e6662a96de71887ce4c2a591231aed82d
branch: add-fw-sysfs

