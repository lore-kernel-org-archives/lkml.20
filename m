Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793554452;
	b=QuyPCbNb2S8orQV6l+9MKs4ZrxQphBCoeZ0gf8Y561yOG6nztUteLzB5+tTJnq6oMs4A
	 GmLbdNTdGMY+t+beS7KIL8prJFq/xcWEMxSTmQJN/xuK7JVdNkcXLyZrRmj2rlJS/K/2n
	 W9QzBMRybJ4+Jb1BHWpfM8+hrCGaezRTF6jnxdo+qDpQObn/PfCFDcvCq8PMpuff1J6JQ
	 2HQdh1cf2EgaESMMvbcNhm+ELJRAaMfyIsTrFWoPSmk07wyX6vF5QRK2iCJsOl6jIiVtM
	 qmR7+C95EEWr3mxXkeZOFTKp3woEdmC0wsXDdgsi6RBCVQEBejELJRX6YBY59ILkHNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793554452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lmd+Bfr1rJqL0FKWrja5+jS/JqBB9NNsNwZHwDcZMno=;
	b=bKPh5s1ovKNXJPrslcjbBhAwmwXkCQ4jdgu6LXdhJhIhFE5DdzbrgJ7ckZKfou46Fu75
	 ow3f7EsFf9cBeQb72APXmyyey+5jv8kT1gbHYUMNVTEvsiN+Em6YL20U5/qrvPR9hHjCU
	 AOqtzK/Z7SYVWVZpubAnplYH4NlDJyy3EtKdqm8YI8mQKfqMrJj4lVjdO7RhN7R/KtlsX
	 a7q/thQNNOrVH7B+4rXz2xN5C1jvTjlFNXoqF1d0fyCJODfsj4SCEsQwekExeitWg7P6r
	 mn0Z5Y7scaAYcI80IaWKLEjz0IFPR6r9xyHbuxzMnp0bdL0RQx0QjCKIuY3dP7XKwqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nS9UAmCC;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB29606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB29606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nS9UAmCC
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso2946996eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793554451; x=1794159251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lmd+Bfr1rJqL0FKWrja5+jS/JqBB9NNsNwZHwDcZMno=;
        b=nS9UAmCCPVKaXggZ7I/eFnSDV78227cyoHTcGnzTnCsW49gl+F1w0szeVMJoJopXiv
         +dZc3YbJlxYLUg6U+MTvrhLd+w4O0zgBpbd3ni1PsDNqIEmaofrBDwjOTYT3Tibxjoc6
         yq9OKf0YolegBlevwfe8TGmqQvZLH60f3CQTC//hz+NRqonCWyx68Sd8uXdzBRL6dGi+
         ofT05lwjU/PhAnihNR7jfdwl30dtb4ab1gfcp8nlDnkMeA8o5qJpjAfaml6LUs44lkP3
         XN8CIWxDr1Uxa6vyYkfDgBSm9ELQQ45C6vE5rUNlGNRiIz2bAvbYGuxw0zjMqATtIFlT
         WkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793554451; x=1794159251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lmd+Bfr1rJqL0FKWrja5+jS/JqBB9NNsNwZHwDcZMno=;
        b=RZJ5s8ap7UhPAt21Lp/zs6VCCF2M59BeJnO/qAbOp60LhAVio4fxre56vfxLjiF60P
         /ntrEwNm1X9cn7yX4CT2IdLpZ4IxjN+TuYS5jRAZJyNJuF6dNPtgK8uN6+DyY4d27YOm
         VSIi+EU3marEYWLjVqPVxR3EY/JqR8oeuJFJSq7nHBv104NJmMykDxdYcWI4Rp4Nc7so
         TRe4HQw/UHJHDQIRnJe5yHxxFEXey7nXwjNMDsdwLSuqhvQhtphAcqd9o5fukF3S3dIc
         GoaiGBHTh0WOfaz1R91Aq50JA06wvob8CtTFzGkW1sGUzXXZ1zKjS0H8YWPPuJZ7vehZ
         U8cQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpBSLoxnGOtpBwUA1L5Wx+tQ7BpjafEquK6hbk6rjEbhceFKYL8EUIGQ2U25Acy8eRQWAHRm7tH4iwVS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c8sc9Td+mt8mYHF+KdDjFRiGLvBji03gQmDBNeBWW8EW8YOMc
	ji13rnIJFnABklDyIgTzFSRX781sjR3v45g6/nEJPVAc0dpm11/k3B04
X-Gm-Gg: AYBFou3DzMUPwkdCLOu8wndMKVklHY1iYLxDrToXl07EJHP084VuogU+dUCgNCikSJl
	x7sECFo43J3TqefD4l0TyCiIc95ptIsM3Pbm9UBUr3ND/+ZS/GTLUU/B3MOBpVIR4TsGMMSNiiC
	WF5bI60XIUU0C25/xkKJz2twnYOeDsyQUJKRvEoAlLDGkWtciFpnpMppwI2cSP2wRKSvwZZVbYQ
	fANbbxBTl5N2nsrRgaUhoSCjQEhceUh2Enh4f2OnYb3TxX3Y9zfsC9D98dbo9Do6AckTQLPJM2S
	bDWbvJEKiGzSoA3Bfh2pNIGaRCl3VzGagdLj4dNQq1aJALvnoYiAD7dKz6IQaJFPxDAEuOBAzTW
	T02FLAcLE7wAOuomUht+9v40BRf8LL1DgorqfnoxBiwnGPYT8m6tLY1ftRmigbV3J1rCT//38YI
	C9f16O7CYvknjRu6EHegLDt+Hck4M/9M8bexHv7wYLTG/TSN+gcL2iKwqSyEG7+jNOHPURn8Ha+
	5AlpzaES++UZrOB7vtQq5f43jWt0CgufWc6AmGxnJhKujgSiMFx0kOqPW25Br5dG58xTHNXqaLI
	+itmkCNZTB21n+ezVi7bQBmoi5lwgE/tTuP4S1F4lyUZ0pj3PZoEl9cYzWiIbRf+Zw==
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a42437876mr12357251eec.34.1793554450978;
        Sun, 01 Nov 2026 09:34:10 -0800 (PST)
Received: from localhost.localdomain ([2400:d802:dd7:8000:50b9:9b10:1e19:1f0a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1easm25450066eec.5.2026.11.01.09.34.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 09:34:10 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk
Cc: john.garry@linux.dev,
	nilay@linux.ibm.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] nvme: Do not drop the cdev reference twice when cdev_device_add() fails
Date: Mon,  2 Nov 2026 01:34:00 +0800
Message-ID: <20261101173400.98931-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Since commit 9952f3882ecb ("nvme: fix cdev lifetime"),
nvme_add_ns_cdev() and nvme_add_ns_head_cdev() take a reference to the
namespace (or namespace head) before calling nvme_cdev_add(), to be
dropped by the char device's release, nvme_cdev_rel(), and drop it
themselves when nvme_cdev_add() fails.  But when cdev_device_add()
fails, nvme_cdev_add() has already put the device, and nvme_cdev_rel()
has already dropped that reference: the caller drops it a second time.

The namespace (or head) is then freed while it is still in use.  With
one allocation failure injected into cdev_device_add() for a namespace
on an NVMe over loop controller, deleting the controller gives, with
native multipath:

  BUG: KASAN: slab-use-after-free in nvme_put_ns_head+0x21/0x140
  Write of size 4 at addr ff1100000a4ea078 by task init/1
   nvme_put_ns_head
   nvme_put_ns
   nvme_remove_namespaces
   nvme_do_delete_ctrl
   nvme_delete_ctrl_sync
   nvme_sysfs_delete
  Freed by task 1:
   kfree
   nvme_ns_remove
   nvme_remove_namespaces
  refcount_t: underflow; use-after-free.

and without it, a use-after-free of the namespace in
nvme_mpath_clear_ctrl_paths(), the namespace having been freed by the
last close of its block device, followed by a general protection fault.

Take the reference in nvme_cdev_add() instead, right before
cdev_device_add(), so that it is held exactly while the device can be
released, and let the callers neither take nor drop it.  The earlier
failures in nvme_cdev_add(), ida_alloc() and dev_set_name(), return
before the device is initialized and so before the reference is taken.

The problem was found with kbound, a static analysis prototype that
checks whether callers rely on an object after a callee returns a value
for which the callee may have released it, on v7.2.12; it is present
in mainline.

Build-tested with x86_64 and arm64 allmodconfig (W=1, sparse): no new
warnings.  Run-tested on QEMU (x86_64, KVM) with KASAN: a loop target
exporting a null_blk device, connected through /dev/nvme-fabrics, with
failslab failing each allocation under nvme_cdev_add() in turn, with
nvme_core.multipath=N and Y.  Before this patch, every failure in
cdev_device_add() (7 of 7 with each setting) gives the reports above;
with it nothing is reported, also with lockdep and kmemleak, which
finds no leak either.  A failure in dev_set_name() gives no report,
before and after.

Fixes: 9952f3882ecb ("nvme: fix cdev lifetime")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    The bug was found with kbound, a research static analysis prototype.
    The patch, the changelog and the test setup were written with the help
    of an AI coding assistant (Claude); I have reviewed and tested them as
    described above.
    
    The runs were on next-20261030; the code this patch touches is the same
    there and in mainline, which it is based on.

 drivers/nvme/host/core.c      | 13 +++++++++++--
 drivers/nvme/host/multipath.c |  2 --
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index af71d02b8476..f9d23e9d35ec 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3978,6 +3978,17 @@ int nvme_cdev_add(struct cdev *cdev, struct device *cdev_device,
 	device_initialize(cdev_device);
 	cdev_init(cdev, fops);
 	cdev->owner = owner;
+	/*
+	 * Held for the lifetime of the cdev and dropped in nvme_cdev_rel(),
+	 * which also runs when cdev_device_add() fails.
+	 */
+	if (cdev_device->parent->class == &nvme_class)
+		nvme_get_ns(container_of(cdev_device, struct nvme_ns,
+					 cdev_device));
+	else
+		nvme_get_ns_head(container_of(cdev_device,
+					      struct nvme_ns_head,
+					      cdev_device));
 	ret = cdev_device_add(cdev, cdev_device);
 	if (ret)
 		put_device(cdev_device);
@@ -4010,13 +4021,11 @@ static void nvme_add_ns_cdev(struct nvme_ns *ns)
 {
 	ns->cdev_device.parent = ns->ctrl->device;
 
-	nvme_get_ns(ns); /* Undone in nvme_cdev_rel() */
 	if (nvme_cdev_add(&ns->cdev, &ns->cdev_device,
 			&nvme_ns_chr_fops, ns->ctrl->ops->module,
 			ns->ctrl->instance, ns->head->instance)) {
 		dev_err(ns->ctrl->device, "Unable to create the ng%dn%d device\n",
 			ns->ctrl->instance, ns->head->instance);
-		nvme_put_ns(ns);
 		return;
 	}
 	set_bit(NVME_NS_CDEV_LIVE, &ns->flags);
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 9e0a0fd77c56..ae8059366b57 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -681,14 +681,12 @@ static void nvme_add_ns_head_cdev(struct nvme_ns_head *head)
 {
 	head->cdev_device.parent = &head->subsys->dev;
 
-	nvme_get_ns_head(head); /* Undone in nvme_cdev_rel() */
 	if (nvme_cdev_add(&head->cdev, &head->cdev_device,
 			&nvme_ns_head_chr_fops, THIS_MODULE,
 			head->subsys->instance, head->instance)) {
 		dev_err(disk_to_dev(head->disk),
 			"Unable to create the ng%dn%d device\n",
 			head->subsys->instance, head->instance);
-		nvme_put_ns_head(head);
 		return;
 	}
 	set_bit(NVME_NSHEAD_CDEV_LIVE, &head->flags);

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.53.0

