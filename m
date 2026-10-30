Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334221;
	b=LtaDJYenWaD/Q5O5RuF50lYQh8xMFnmMlG4rsJUBrf7vNqh6zeKsnwKq/3XBa7HBnoYH
	 JRtXYPGy79EzyNaahFNEMVgizUwpJJoe13+yFugzzmJGl8wResh3U1ZDgKFKRGCR5G9Lh
	 HErBTAtV8bdGU6PcYP9EWC/0dBqcjP+YjaKFvRS8p+0LwZKFcfc9qzTgt4McyP3f0hFYP
	 1RNZNBZLeL2aEPQuN7mNAxoR9DtQ6qAkBubcRc1dvI87yEqJXCimWNCPZFbusc3Wof7gC
	 pZxHLuRdneHGavSi7GaawmKdDKrEGpkTI4baPFuECRe8UbvZXeJ5eg9py+FlsMEO5Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S6qrCm3VJbLk2H2beVEtsK8a9baQ0SAzBEfNGb4zgPg=;
	b=yLY929nogiJJ9pQ5A9pl+Ii1aqLT9Y9MBdiFa/8HomU3Eujk5hq0x0FIDJ9mBBIIzA0m
	 TplE9UAmm0aHzxxxQWbQ6dF+VEmb/SUNavwJKahApKInMB6wBNFePp5HtR2OQCCy+4x6q
	 XLbXIfJQnvv4VwE0VWv576YhA+wQNrMY1LS/rSi1AH6q1pFFyiym7XwopOcqlLxxDL5hH
	 wLJeyClYM6Ch83t6HHK7bkhImpxKz4pHbNwUfSrT134DfK31LxgtM8thvAlqB4HNl+NEY
	 uF4OdDSdrkhEr3TWOQ3YUCg5NeYDCYdDLJspZpZpUdyV/uNlN6Z8DF56L+NBNqzMKtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=Qp186+H6;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C0A606A333
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C0A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=Qp186+H6
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-843cf077f10so448597a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334219; x=1793939019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6qrCm3VJbLk2H2beVEtsK8a9baQ0SAzBEfNGb4zgPg=;
        b=Qp186+H6nDG5dCHQ8CdatqiicdYdxzaOBmc1LQWJBRsEPtK1ukFV7bQmGhHYAS1ycJ
         vBLzVJW9poHdLm71gzPv0JWD6g/TL5VvTx1RDFza6oZD/BktGHeR3tSHcW/7+nPS6ckB
         QrzVdOgTVsZgtzTYDVDE925yffkK/YUl6WG+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334219; x=1793939019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6qrCm3VJbLk2H2beVEtsK8a9baQ0SAzBEfNGb4zgPg=;
        b=IJ/fwq5mAgzgLLkD/nrQaatgkBaq8Xkr/h4+F1ZvTtgDRcs/vPv3SD0cS/loi+BJ8U
         ZMeuDfj8gAu0COI14DptPQcCtg8voSsUxsKKi5R6aL5x8ZuxFbm6CXtnjm8z+Yh0tGjn
         79W4zk7VxO5oHONKyl6Hg6cM9Aj9XKGFV+qHokWUfFkSN0QK0iQAQ376VvTS/GUgtQdy
         SY1UIVMrYPuV0HdYLLYAfbrF0Bi3m1YQSuqaTIAd3qmHsPHkDJW5hXA4YdawIA3IDGRi
         RjFERn2sGp4qew7e/4I3Bj2FlLLs6O4qL/Qr8np9F3lZqECgKTIsol/Pg4SwgYl+4MnE
         No+Q==
X-Forwarded-Encrypted: i=1; AKwUvBy5sJjWFRLAhSfu1A4RKqMMMGP1KN9ne5mynU4mt22HmRWPjTIuOLlkVmVOmnUGfmff4v2qmOv4OAoNjOI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvIJHWFKUjf5NYsGjGF0EidQ3Sl/JX8h5OKiEgBAN0UUP8d3rZ
	ctN1WWBTUfByGha7+nMGX0rL5B6UgOra55I0sEXaYPJq+4cLgxiJjYu+nyjASjFKAP0=
X-Gm-Gg: AYBFou3/bNMNBf0RMhYlS/oXX+MUIqc+PRmwvRXc3xzDK+VjtFTl09MAAq5wifRXawQ
	LUs1H5DpVxolbvkE52fONPFXnxPprG6w6Jd+wZnZGr0C4pUpmmjqLcTfrjuPGxouQfGJH/Bo0kY
	zAgjPJYpFHJS8s5UgcuaHb3MWQa4gLR8rdxgA4b09m3hJ6yollGhhTyK03QzhmV+G7Sx0aHN3hQ
	12k0N71BmixaiazvQDoXjD5K+M5AvbYrmERijash3GhL380lQl0PWKepXUO7iPVmCjUWOIWPqk9
	fiqKXL09h78j8gpkiMdRssO7qKhB/LxvFtc+CmD7jnD4KbnuzvCozj4xiaxft+d43ZLiwQ19Q24
	C+ay3Jk60UfEDr45Nts+EcAlMPsRF5ui9o+Z5IeFuKm40aM/OnNOzqlek6n3Qh7ffNH7AYg2uDU
	39E+uscHo+CkkKYR9IGfvYfaoOS3EKIcyQiPlf5Hsy+gqRatzTkx23PN1E+DE9btciQFBwoGRTK
	C9ePSCshEP6m3o8LIWm3t4a7U9lQguKHmmwlh/Rip/qgsP8VUh3ZjLqucmkyLMOAZLhuUd+jN4C
	+r8MdVPeOyDESh7NshJvnXurGbpaUSe9wwpJa6fimaPrhpxdTFGKT5jEKuFOUfHD+8AdznpG/7x
	XqPVY0ec2sZgkqOR+jmiMtCJVyf2oAxA=
X-Received: by 2002:a05:6830:4490:b0:81c:37e2:2012 with SMTP id 46e09a7af769-85d3652e9e4mr823151a34.15.1793334219235;
        Thu, 29 Oct 2026 21:23:39 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d351e77c8sm1162541a34.2.2026.10.29.21.23.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:23:38 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: kvm@vger.kernel.org
Cc: Alex Williamson <alex@shazbot.org>,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] vfio: Publish the container after all fallible initialization
Date: Thu, 29 Oct 2026 21:23:37 -0700
Message-ID: <20261030042337.74512-1-kylebot@openai.com>
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
I have a reproducer for this issue and can share via DM

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
index 185f359f75d3..a7089eff3039 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -907,14 +907,10 @@ int __init vfio_group_init(void)
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
@@ -923,8 +919,6 @@ int __init vfio_group_init(void)
 
 err_alloc_chrdev:
 	class_unregister(&vfio_class);
-err_group_class:
-	vfio_container_cleanup();
 	return ret;
 }
 
@@ -934,5 +928,4 @@ void vfio_group_cleanup(void)
 	ida_destroy(&vfio.group_ida);
 	unregister_chrdev_region(vfio.group_devt, MINORMASK + 1);
 	class_unregister(&vfio_class);
-	vfio_container_cleanup();
 }
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 4e5d738ccf4b..8f780049b7c4 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1824,10 +1824,17 @@ static int __init vfio_init(void)
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
@@ -1840,6 +1847,7 @@ static int __init vfio_init(void)
 static void __exit vfio_cleanup(void)
 {
 	vfio_debugfs_remove_root();
+	vfio_container_cleanup();
 	ida_destroy(&vfio.device_ida);
 	vfio_cdev_cleanup();
 	class_unregister(&vfio_device_class);

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
