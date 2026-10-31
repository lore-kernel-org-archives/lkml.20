Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793420731;
	b=vO6RRnfAiVhYO0t2ilaUKXAAGmajpqX7tUZhs8M6lqO+DaRK3a02F12RQa05fd4qcJ0D
	 3dNaRfOfxpD4I36YXgCkz8SfXSlAGH5K3/jly6pjCsLo81TcjHtPW1T+wr3jomouaZGQm
	 BX1zvpLf4zK1qzCkc9J6l0Q7XWH9ANYDfcVutsqCoOEmV0EtwsZT30tDneihxohyc5pCo
	 6zmWyhUXsq90hWjujlThd/28wYgs2yye8t0eCENve5y8tapsv7JeKSsuikcizFPIA9Hju
	 +wgJT5VBmY4bI71ouGt23qmDzEwshvJT2EhCLLL/Viee8pYJyNzTYD+s46vBRRlZGcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793420731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Ytn1aoCXRBTnTF0UFBaz0xL8UpYoU0vm5ll32XMj224=;
	b=44zadCL+eWuzDJ8SlaiwvgxppKKKgWLwNQ/KUd3rkiRQsyFwJbgoFfvN8COqPgNqnsjV
	 x+E3HJXNIr2nGjtAT4BrPQXWNeHZosAfkhANDu7y4ArvKke/rws0R9Dp0XJOdaCVq9HJB
	 jzSK56sde87acZKMrpdecOrRcRMHiLiN+IZAZSa3wqT5+bmJoMWl96wZgY0w2U4DGJjQm
	 WwJQbj/C/6PmKdWcPvdD6YY9m8wGpKjxE4hQipZFUaTTmsjs6kH482W3Kfau607c20Kj6
	 7TL016gUqCHmFHz/EOoGDRSuRuvxoGy07g+PD1Hbuf5GTKWMxKimoKalMM0w74X9p4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=PVHUMYdG;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA60A606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA60A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=PVHUMYdG
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8241a56cd70so927630a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793420730; x=1794025530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ytn1aoCXRBTnTF0UFBaz0xL8UpYoU0vm5ll32XMj224=;
        b=PVHUMYdG3XBHZ1PPdwW9kxzi/Cn3CLep2Rtt9KE6biMyJvv6TAC6+UwIzzz+LIv/eh
         Oc1+GM90zU1928AVqs5BGAA1xWOAnhh6yl59/31jDUwHmMePDF8Hi8ng8LTYvh3bfg1C
         rRrQPUvMYQLUyl74arO4LT3ONE9+1Fo+YToD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793420730; x=1794025530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ytn1aoCXRBTnTF0UFBaz0xL8UpYoU0vm5ll32XMj224=;
        b=cXRIj7rxIrrZv29sE6Hp+CExp63J+QoNMq+X8mm7XweVnt9x4tbY0hdJPuOkrfNY8J
         uYi1wtNBhDZ+vOnGl43+oFGzlvHWHKe4qZurgzoZWfhyf+KBC11TTL96ACMvxqVk2REB
         5SjdzVCkF+UsFN3kARSrXCd4c/Vp7RoisPd73bSCRNWqXPgT1BCxjBzieiXFIC4KeWFJ
         8bprdhoXdYK+1OWwANOW1QROgBoQ6GpeZ7KMBANcp83qyXHO+MuJ6I8ZOvTxpaLTVM0L
         VU4xHDuY6EFXybg0MZXgaz/gyNTenA6Qds+AB/BE03nGEjr2TECEakth9KC1JGHKyx+a
         YsHg==
X-Gm-Message-State: AFq9FYII+C7O+zFCQtqzKjKdKX/vggVDQxlPS3hZ5Fg8YXbQ6zRyuIaZ
	ICmn5T4AiKk5alvI9AnMYlSENGgmitx8fkymZHrbggPdWx0qHeSFa/nD+q0SLgdJjrs=
X-Gm-Gg: AYBFou06Er+XT61JR8dBBJfSQxHKnj5+HCrsWpRB5ObFk1weOa/JTr7iiBkBLtDT8Ry
	lgrhawKEFgQrVaU95HRMW+LQwmjCHC4xwX7hUGnKzXz/q3rI5J5yDiN0PxaHEd+x7sSk7DLE2Bb
	Ub0geFONxC1SaIMy4b5WmYLWUVWbd1TUt5cr8ndxSOCKTA0Xc5AWcAWFWQl4Uj1NFTkmvb35nMm
	HsdQpbLxCVmfbzj4qJjCawPA/WagDz5CrH0fYT71fydBYLZjRQJmA2kFYu8OmBcidj6kts4DexP
	YBLNXtpD+hd4TJWZRzXSC4r62QIBPIxhgC9tUFnRN1IX986oh02e/3SrouN2p/SvgtIXa/oSN0M
	evHox9LVKk3OXK/s2dI4xpNylqXV+udlqLjalKEr8ohDCIHsiP4cHCuM1wF/dOEFUoe5j05cAr4
	RTgxEuVgQBOlAPmPg858yJMCMslCiEzuGGNzO25n0Kk6hulRSDHYEYAhpwvG+S9uxgNauMRmjQf
	kIz3oU7Zozh/J4ceJvOpy9oFxQjRPnKwppN9G/uYoQtycE1EmXAqTbgOuAnhcZ4cdglF88K02fn
	xYZb7IXx2lXsJBdEPhx58kQ8qNmHTmtP/ene9e9NuvGENtL2Rr2hIyX8HDmOnul3EY0oxvlLK7Q
	IIF0yU1d7Ap6ClqJSD3VWSOz4VS4zBg==
X-Received: by 2002:a05:6808:c3d5:b0:53d:c86f:d332 with SMTP id 5614622812f47-5640ddf9e52mr3176595b6e.22.1793420729703;
        Fri, 30 Oct 2026 21:25:29 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm3000260b6e.3.2026.10.30.21.25.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 21:25:29 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	outbounddisclosures@openai.com
Subject: [PATCH 1/2] vfio: Publish the container after all fallible initialization
Date: Fri, 30 Oct 2026 21:25:26 -0700
Message-ID: <20261031042527.6418-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

vfio_group_init() publishes /dev/vfio/vfio before vfio_init() has
finished. The optional no-IOMMU backend is also registered after the
misc device. A concurrent open can therefore obtain a container while
the module is still COMING, even if a later initialization step fails.

The failed-module-init path frees the module without waiting for these
open files. misc_deregister() prevents new opens, but does not revoke
existing files, leaving their vfio_fops and callbacks in freed module
memory. An unprivileged first-autoload race can trigger this by exhausting
the global task limit before the IRQFD workqueue creates its rescuer.
A subsequent VFIO_GET_API_VERSION ioctl reports:

  BUG: KASAN: vmalloc-out-of-bounds in __se_sys_ioctl+0xaf/0x120
  Read of size 8 at addr ffffffffc089df70 by task vfio_race/1484

Move container initialization out of vfio_group_init() and make it the
last fallible step in vfio_init(). Register the no-IOMMU backend before
the misc device, and unwind both resources in reverse order. Once an
open can reach vfio_fops, module initialization can no longer fail.

Fixes: cba3345cc494 ("vfio: VFIO core")
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 drivers/vfio/container.c | 22 +++++++++++++---------
 drivers/vfio/group.c     |  9 +--------
 drivers/vfio/vfio_main.c |  8 ++++++++
 3 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
index 003281dbf8bc..bd245e23a55d 100644
--- a/drivers/vfio/container.c
+++ b/drivers/vfio/container.c
@@ -577,29 +577,33 @@ int __init vfio_container_init(void)
 	mutex_init(&vfio.iommu_drivers_lock);
 	INIT_LIST_HEAD(&vfio.iommu_drivers_list);
 
+	if (IS_ENABLED(CONFIG_VFIO_NOIOMMU)) {
+		ret = vfio_register_iommu_driver(&vfio_noiommu_ops);
+		if (ret)
+			goto err_mutex;
+	}
+
 	ret = misc_register(&vfio_dev);
 	if (ret) {
 		pr_err("vfio: misc device register failed\n");
-		return ret;
+		goto err_noiommu;
 	}
 
-	if (IS_ENABLED(CONFIG_VFIO_NOIOMMU)) {
-		ret = vfio_register_iommu_driver(&vfio_noiommu_ops);
-		if (ret)
-			goto err_misc;
-	}
 	return 0;
 
-err_misc:
-	misc_deregister(&vfio_dev);
+err_noiommu:
+	if (IS_ENABLED(CONFIG_VFIO_NOIOMMU))
+		vfio_unregister_iommu_driver(&vfio_noiommu_ops);
+err_mutex:
+	mutex_destroy(&vfio.iommu_drivers_lock);
 	return ret;
 }
 
 void vfio_container_cleanup(void)
 {
+	misc_deregister(&vfio_dev);
 	if (IS_ENABLED(CONFIG_VFIO_NOIOMMU))
 		vfio_unregister_iommu_driver(&vfio_noiommu_ops);
-	misc_deregister(&vfio_dev);
 	mutex_destroy(&vfio.iommu_drivers_lock);
 }
 
diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index b2299e5bc6df..dc8f8a38723f 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -898,14 +898,10 @@ int __init vfio_group_init(void)
 	mutex_init(&vfio.group_lock);
 	INIT_LIST_HEAD(&vfio.group_list);
 
-	ret = vfio_container_init();
-	if (ret)
-		return ret;
-
 	/* /dev/vfio/$GROUP */
 	ret = class_register(&vfio_class);
 	if (ret)
-		goto err_group_class;
+		return ret;
 
 	ret = alloc_chrdev_region(&vfio.group_devt, 0, MINORMASK + 1, "vfio");
 	if (ret)
@@ -914,8 +910,6 @@ int __init vfio_group_init(void)
 
 err_alloc_chrdev:
 	class_unregister(&vfio_class);
-err_group_class:
-	vfio_container_cleanup();
 	return ret;
 }
 
@@ -925,5 +919,4 @@ void vfio_group_cleanup(void)
 	ida_destroy(&vfio.group_ida);
 	unregister_chrdev_region(vfio.group_devt, MINORMASK + 1);
 	class_unregister(&vfio_class);
-	vfio_container_cleanup();
 }
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 423ead48aafe..dfc48a9e0fe6 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1852,10 +1852,17 @@ static int __init vfio_init(void)
 	if (ret)
 		goto err_alloc_dev_chrdev;
 
+	/* Publish /dev/vfio/vfio only after all other fallible setup. */
+	ret = vfio_container_init();
+	if (ret)
+		goto err_container;
+
 	vfio_debugfs_create_root();
 	pr_info(DRIVER_DESC " version: " DRIVER_VERSION "\n");
 	return 0;
 
+err_container:
+	vfio_cdev_cleanup();
 err_alloc_dev_chrdev:
 	class_unregister(&vfio_device_class);
 err_dev_class:
@@ -1868,6 +1875,7 @@ static int __init vfio_init(void)
 static void __exit vfio_cleanup(void)
 {
 	vfio_debugfs_remove_root();
+	vfio_container_cleanup();
 	ida_destroy(&vfio.device_ida);
 	vfio_cdev_cleanup();
 	class_unregister(&vfio_device_class);

base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.53.0


