Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.68.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405066;
	b=vwOAHNhcWZVAveFlqY3UHyFN5ZVS2GuPK7ezBIaWErOIxsGmXT5XW5Ppo2jE2fwGoW0m
	 jF5zxhZ+N0+E7Yfxk5wOalgI83NnqGc8FYhVhbnws6NdO5YVo/UxWcsjUiyQykjK8rIt9
	 hXlduFIWUgmPgNN7DGDNTfxLzQfbcf9iT074MVIyMs35Hnqd83v/XS4igBvMyv1+SvWUE
	 Hy2Ves1XDPATBeyJbMVjUBRTrfrIbN4fapvQSkgR/GM/1nXJhwmCMwnEj88mKtJI4rtx/
	 HED3a0M/iIoFAf58zFhjim8tcYJR8KT/55Dmhf2uR/XtXIK6Oq+lviAowrYyIIl7rKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405066;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=QNKLoZvBYZyB54tPXRMahlGIIMeSUB8rBF/6zsOAvbs=;
	b=YQFcrwum6NTLm/PbgJq0+f3jrD1J5uAF3e7buDO1IQ3Ght15yNr97GYHNbk8pOd2gdIt
	 8Ytwfp2vbVnu9IVbV7jEhW1S9KlZwozhsmMlq0wR544Y6yy2zHkLLU1j90cleF27vO0aS
	 C6ZscWNtCJ6ot6yiu+nP/fXz5KM/ozFpw92TupdOM10ElM+GxKTV4yX+tdBMXWV6Et7C+
	 CKXRjB3EfKoWlFVq3W0TJlbjknErPXQIq2gdXyQ/jclFaHuRqdsac3cU++oN6IqWvFI3x
	 dCqPDBxfP234MYbdjUjfe07qxcckMsdI3YVxfIPgUHV6dk5xUUB4zRzDL3KBo+ctVGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=MGuPmEMc;
	arc=none smtp.remote-ip=44.246.68.102
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBCD60A2608
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBBCD60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=MGuPmEMc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794405065; x=1825941065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QNKLoZvBYZyB54tPXRMahlGIIMeSUB8rBF/6zsOAvbs=;
  b=MGuPmEMcQRZl+O3AqQBX5Gml56fsEiAwqN6Do8IksKOSOkwiDmjR2Vp1
   +wsm1lNzpLh0bBvwwO1aX4TrR324mElgDFXPEXh/n01pf8HpE0E2ucM/P
   hilLUMUuq8yf1MK6+0pA8ESXvidA87ldoUSq5lszmBwFugeJ4AnKhtjSM
   +GUXZOVGGjU2GOZqPJCYN87XHa9MQewNXco+40SAI1YvWW2pZXBTAX+tn
   s3mEA/4W2g8oBvbmitxoAiELXc01cfEZYTea+LSl+yo1QqwBLlI88IZFD
   GBEQSK3KoJL6FloVfa8c1KenclJHna+YnXHZ4/ugMFcqe8/B75JyBW4N9
   Q==;
X-CSE-ConnectionGUID: Tem9956YR4y67pAYLIi/Zg==
X-CSE-MsgGUID: 5Ry1hwk3SJ6zrtuzm17oxw==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33632228"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 13:51:03 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:26370]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.212:2525] with esmtp (Farcaster)
 id d2cf791a-93a3-4e38-a09c-be45ff910399; Wed, 11 Nov 2026 13:51:03 +0000 (UTC)
X-Farcaster-Flow-ID: d2cf791a-93a3-4e38-a09c-be45ff910399
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:51:02 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:51:01 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 07/19] nitro_enclaves: Wait for file operations before unbinding the PCI device
Date: Wed, 11 Nov 2026 13:49:56 +0000
Message-ID: <5f80be8bc20324938d6455407afed074a0620253.1794393487.git.graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1794300000.git.graf@amazon.com>
References: <cover.1794300000.git.graf@amazon.com>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

User space may hold enclave fds and /dev/nitro_enclaves fds across a
sysfs unbind or a hot-unplug of the NE PCI device. Their ioctls and
their release then use ne_devs.ne_pci_dev and ne_misc_dev.this_device
after ne_pci_remove() freed both, or oops on the NULL pointer it
leaves behind.

Add ne_devs.lock, a rw_semaphore that probe and remove hold for writing
and the file operations hold for reading, so that remove waits for the
ones in flight. A release or a remove can hold it for minutes while the
device frees a slot, so the ioctls take it with down_read_killable().
Remove then marks every enclave detached, which wakes its poll like an
out-of-band event, and an ioctl on a detached enclave, or on the misc
device while no device is bound, fails with -ENODEV. A detached enclave
keeps its memory and CPUs on release, because the device that could
confirm that they are free is gone.

A second NE PCI function would overwrite ne_devs.ne_pci_dev at probe, so
refuse it with -EBUSY.

Kiro, an AI coding assistant, found this while checking device removal
with enclave fds still open.

Fixes: 38907e124088 ("nitro_enclaves: Add logic for creating an enclave VM")
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 93 +++++++++++++++++++----
 drivers/virt/nitro_enclaves/ne_misc_dev.h |  8 ++
 drivers/virt/nitro_enclaves/ne_pci_dev.c  | 62 +++++++++++++++
 3 files changed, 148 insertions(+), 15 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index 964cb21b27c77..821624c93795b 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -78,6 +78,7 @@ static struct miscdevice ne_misc_dev = {
 
 struct ne_devs ne_devs = {
 	.ne_misc_dev	= &ne_misc_dev,
+	.lock		= __RWSEM_INITIALIZER(ne_devs.lock),
 };
 
 /*
@@ -147,18 +148,22 @@ struct ne_phys_contig_mem_regions {
  */
 static bool ne_check_enclaves_created(void)
 {
-	struct ne_pci_dev *ne_pci_dev = ne_devs.ne_pci_dev;
+	struct ne_pci_dev *ne_pci_dev = NULL;
 	bool ret = false;
 
-	if (!ne_pci_dev)
-		return ret;
+	down_read(&ne_devs.lock);
 
-	mutex_lock(&ne_pci_dev->enclaves_list_mutex);
+	ne_pci_dev = ne_devs.ne_pci_dev;
+	if (ne_pci_dev) {
+		mutex_lock(&ne_pci_dev->enclaves_list_mutex);
 
-	if (!list_empty(&ne_pci_dev->enclaves_list))
-		ret = true;
+		if (!list_empty(&ne_pci_dev->enclaves_list))
+			ret = true;
 
-	mutex_unlock(&ne_pci_dev->enclaves_list_mutex);
+		mutex_unlock(&ne_pci_dev->enclaves_list_mutex);
+	}
+
+	up_read(&ne_devs.lock);
 
 	return ret;
 }
@@ -1133,17 +1138,18 @@ static int ne_start_enclave_ioctl(struct ne_enclave *ne_enclave,
 }
 
 /**
- * ne_enclave_ioctl() - Ioctl function provided by the enclave file.
+ * ne_enclave_do_ioctl() - Ioctl function provided by the enclave file.
  * @file:	File associated with this ioctl function.
  * @cmd:	The command that is set for the ioctl call.
  * @arg:	The argument that is provided for the ioctl call.
  *
- * Context: Process context.
+ * Context: Process context. This function is called with ne_devs.lock held
+ *	    for reading, on an enclave that is not detached.
  * Return:
  * * 0 on success.
  * * Negative return value on failure.
  */
-static long ne_enclave_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+static long ne_enclave_do_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct ne_enclave *ne_enclave = file->private_data;
 
@@ -1390,6 +1396,36 @@ static long ne_enclave_ioctl(struct file *file, unsigned int cmd, unsigned long
 	return 0;
 }
 
+/**
+ * ne_enclave_ioctl() - Ioctl function provided by the enclave file.
+ * @file:	File associated with this ioctl function.
+ * @cmd:	The command that is set for the ioctl call.
+ * @arg:	The argument that is provided for the ioctl call.
+ *
+ * Context: Process context.
+ * Return:
+ * * 0 on success.
+ * * Negative return value on failure.
+ */
+static long ne_enclave_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct ne_enclave *ne_enclave = file->private_data;
+	long rc;
+
+	rc = down_read_killable(&ne_devs.lock);
+	if (rc)
+		return rc;
+
+	if (ne_enclave->detached)
+		rc = -ENODEV;
+	else
+		rc = ne_enclave_do_ioctl(file, cmd, arg);
+
+	up_read(&ne_devs.lock);
+
+	return rc;
+}
+
 /**
  * ne_enclave_remove_all_mem_region_entries() - Remove all memory region entries
  *						from the enclave data structure.
@@ -1542,7 +1578,7 @@ static void ne_enclave_free(struct ne_enclave *ne_enclave)
 static int ne_enclave_release(struct inode *inode, struct file *file)
 {
 	struct ne_enclave *ne_enclave = file->private_data;
-	struct ne_pci_dev *ne_pci_dev = ne_devs.ne_pci_dev;
+	struct ne_pci_dev *ne_pci_dev = NULL;
 	int rc;
 
 	if (!ne_enclave)
@@ -1555,6 +1591,21 @@ static int ne_enclave_release(struct inode *inode, struct file *file)
 	if (!ne_enclave->slot_uid)
 		return 0;
 
+	down_read(&ne_devs.lock);
+
+	/*
+	 * The device the enclave was created on is gone, and with it the only
+	 * party that can confirm that the slot no longer uses its memory and
+	 * its CPUs, so the enclave keeps both.
+	 */
+	if (ne_enclave->detached) {
+		rc = -ENODEV;
+
+		goto unlock_devs;
+	}
+
+	ne_pci_dev = ne_devs.ne_pci_dev;
+
 	/*
 	 * Acquire the enclave list mutex before the enclave mutex
 	 * in order to avoid deadlocks with @ref ne_event_work_handler.
@@ -1577,6 +1628,9 @@ static int ne_enclave_release(struct inode *inode, struct file *file)
 
 	mutex_unlock(&ne_pci_dev->enclaves_list_mutex);
 
+unlock_devs:
+	up_read(&ne_devs.lock);
+
 	return rc;
 }
 
@@ -1774,16 +1828,25 @@ static long ne_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	switch (cmd) {
 	case NE_CREATE_VM: {
-		struct ne_pci_dev *ne_pci_dev = ne_devs.ne_pci_dev;
+		struct ne_pci_dev *ne_pci_dev = NULL;
 		u64 __user *slot_uid = (void __user *)arg;
 		int rc;
 
-		rc = mutex_lock_killable(&ne_pci_dev->enclaves_list_mutex);
+		rc = down_read_killable(&ne_devs.lock);
 		if (rc)
 			return rc;
 
-		rc = ne_create_vm_ioctl(ne_pci_dev, slot_uid);
-		mutex_unlock(&ne_pci_dev->enclaves_list_mutex);
+		rc = -ENODEV;
+		ne_pci_dev = ne_devs.ne_pci_dev;
+		if (ne_pci_dev) {
+			rc = mutex_lock_killable(&ne_pci_dev->enclaves_list_mutex);
+			if (!rc) {
+				rc = ne_create_vm_ioctl(ne_pci_dev, slot_uid);
+				mutex_unlock(&ne_pci_dev->enclaves_list_mutex);
+			}
+		}
+
+		up_read(&ne_devs.lock);
 
 		return rc;
 	}
diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.h b/drivers/virt/nitro_enclaves/ne_misc_dev.h
index 2a4d2224babac..4031d5d23eb00 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.h
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.h
@@ -12,6 +12,7 @@
 #include <linux/mm.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/rwsem.h>
 #include <linux/wait.h>
 
 #include "ne_pci_dev.h"
@@ -35,6 +36,8 @@ struct ne_mem_region {
 /**
  * struct ne_enclave - Per-enclave data used for enclave lifetime management.
  * @enclave_info_mutex :	Mutex for accessing this internal state.
+ * @detached:			The NE PCI device the enclave was created on is
+ *				gone. Written with ne_devs.lock held for writing.
  * @enclave_list_entry :	Entry in the list of created enclaves.
  * @eventq:			Wait queue used for out-of-band event notifications
  *				triggered from the PCI device event handler to
@@ -63,6 +66,7 @@ struct ne_mem_region {
  */
 struct ne_enclave {
 	struct mutex		enclave_info_mutex;
+	bool			detached;
 	struct list_head	enclave_list_entry;
 	wait_queue_head_t	eventq;
 	bool			has_event;
@@ -97,10 +101,14 @@ enum ne_state {
  * struct ne_devs - Data structure to keep refs to the NE misc and PCI devices.
  * @ne_misc_dev:	Nitro Enclaves misc device.
  * @ne_pci_dev :	Nitro Enclaves PCI device.
+ * @lock:	Held for writing while the NE PCI device binds or unbinds, and for
+ *		reading by the file operations that reach it or log through the
+ *		misc device, which goes away with it.
  */
 struct ne_devs {
 	struct miscdevice	*ne_misc_dev;
 	struct ne_pci_dev	*ne_pci_dev;
+	struct rw_semaphore	lock;
 };
 
 /* Nitro Enclaves (NE) data structure for keeping refs to the NE misc and PCI devices. */
diff --git a/drivers/virt/nitro_enclaves/ne_pci_dev.c b/drivers/virt/nitro_enclaves/ne_pci_dev.c
index d2c430d10758f..cd8e934e968c3 100644
--- a/drivers/virt/nitro_enclaves/ne_pci_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_pci_dev.c
@@ -574,6 +574,38 @@ static void ne_pci_dev_disable(struct pci_dev *pdev)
 		dev_err(&pdev->dev, "Error in pci dev disable cmd\n");
 }
 
+/**
+ * ne_pci_dev_detach_enclaves() - Cut the enclaves off the NE PCI device that
+ *				  goes away.
+ * @ne_pci_dev:	Private data associated with the PCI device.
+ *
+ * Context: Process context. This function is called with ne_devs.lock held
+ *	    for writing.
+ */
+static void ne_pci_dev_detach_enclaves(struct ne_pci_dev *ne_pci_dev)
+{
+	struct ne_enclave *ne_enclave = NULL;
+	struct ne_enclave *ne_enclave_tmp = NULL;
+
+	mutex_lock(&ne_pci_dev->enclaves_list_mutex);
+
+	list_for_each_entry_safe(ne_enclave, ne_enclave_tmp,
+				 &ne_pci_dev->enclaves_list, enclave_list_entry) {
+		list_del(&ne_enclave->enclave_list_entry);
+
+		mutex_lock(&ne_enclave->enclave_info_mutex);
+
+		ne_enclave->detached = true;
+		ne_enclave->has_event = true;
+
+		wake_up_interruptible(&ne_enclave->eventq);
+
+		mutex_unlock(&ne_enclave->enclave_info_mutex);
+	}
+
+	mutex_unlock(&ne_pci_dev->enclaves_list_mutex);
+}
+
 /**
  * ne_pci_probe() - Probe function for the NE PCI device.
  * @pdev:	PCI device to match with the NE PCI driver.
@@ -643,6 +675,20 @@ static int ne_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto teardown_msix;
 	}
 
+	down_write(&ne_devs.lock);
+
+	/*
+	 * The driver keeps a single device in ne_devs, and the enclaves and the
+	 * misc device belong to it.
+	 */
+	if (ne_devs.ne_pci_dev) {
+		dev_err(&pdev->dev, "Another NE PCI device is bound already\n");
+
+		rc = -EBUSY;
+
+		goto unlock_ne_devs;
+	}
+
 	ne_devs.ne_pci_dev = ne_pci_dev;
 
 	rc = misc_register(ne_devs.ne_misc_dev);
@@ -652,10 +698,14 @@ static int ne_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto disable_ne_pci_dev;
 	}
 
+	up_write(&ne_devs.lock);
+
 	return 0;
 
 disable_ne_pci_dev:
 	ne_devs.ne_pci_dev = NULL;
+unlock_ne_devs:
+	up_write(&ne_devs.lock);
 	ne_pci_dev_disable(pdev);
 teardown_msix:
 	ne_teardown_msix(pdev);
@@ -682,6 +732,10 @@ static void ne_pci_remove(struct pci_dev *pdev)
 {
 	struct ne_pci_dev *ne_pci_dev = pci_get_drvdata(pdev);
 
+	down_write(&ne_devs.lock);
+
+	ne_pci_dev_detach_enclaves(ne_pci_dev);
+
 	misc_deregister(ne_devs.ne_misc_dev);
 
 	ne_devs.ne_pci_dev = NULL;
@@ -699,6 +753,8 @@ static void ne_pci_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 
 	kfree(ne_pci_dev);
+
+	up_write(&ne_devs.lock);
 }
 
 /**
@@ -714,6 +770,10 @@ static void ne_pci_shutdown(struct pci_dev *pdev)
 	if (!ne_pci_dev)
 		return;
 
+	down_write(&ne_devs.lock);
+
+	ne_pci_dev_detach_enclaves(ne_pci_dev);
+
 	misc_deregister(ne_devs.ne_misc_dev);
 
 	ne_devs.ne_pci_dev = NULL;
@@ -731,6 +791,8 @@ static void ne_pci_shutdown(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 
 	kfree(ne_pci_dev);
+
+	up_write(&ne_devs.lock);
 }
 
 /*
-- 
2.47.1

