Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.245.243.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405041;
	b=HM8oFiJSNno/Da73DcyxW5eZhJZuxs/LEkKfQ2Kjht7bKDM9vVLoBEs1KSvVX1ZM9BE3
	 OsUWO/yzZuKJNULguxkFC0Mont8TmMiZj9frwzEvxm1SoE5BICcXLvzVmNoyT1K5qGmuj
	 Jg1dGisLK9SgVbROjzFpX+mLQmCbcjYcjqI3Sm2cBDa4BGdPkn5asZ1abSSYG4TDR3WXq
	 VqQNFR0yq7vZJ6DM5rh+iyWU5EEG4OBsRrCmcVGKK/ToTErnIsR21P8nuBDd4BjqWPgMc
	 GeE5U76zL9PphW+Hk3n47s7gYcTEnPG8yua7sGJ+A6qnpo652iW7d+nSNSjdZnV5vTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405041;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=v34hq+2+UwnOmAPj53wlQxlZutQrpnzrAkgDgt3RX28=;
	b=0BhHCq/3JTsxzKZF7Y+gF7sqeRpuNAUfihsygEkBNWMWMoFESN110wS1PCPPovxBhAv3
	 rnhJcEl442EHRZicLBpPs3vqQ/4up/aNCfA09X3V2CoxPGchD0h1wwQ2EjMpWbIqa/Rjf
	 xdwqkdeV+F8SY9qb50UmIlzdeZTQF+IUYCbRmi0LcUlrrbnUR4/hE/AZz3VI9zWpFQu7J
	 8LqZwXUpMVu6wLDUzoE4QKcthP10CarQXTxB0cL4iECMU1xbXpiSZ4LfpsJKAl4DTpxQn
	 RlqmAW+O2iPOz6g/7+j/X/fw4NSRJtCtKWSe/RxKYyThHzFyVOjj4U1qlBtNvMOLmdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=DSeJ0pZc;
	arc=none smtp.remote-ip=44.245.243.92
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998F160A263F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 998F160A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=DSeJ0pZc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794405040; x=1825941040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v34hq+2+UwnOmAPj53wlQxlZutQrpnzrAkgDgt3RX28=;
  b=DSeJ0pZc4xw3BMATiGsp8yZg2hXbLcMi2ZdyLXmyYx6l8q8VCLoHDiAY
   tfCWEGaY/WsFKLjR6GOhumSChmiZpWW8tvX9tUkpdZR6IA1RksCuI3iDl
   ycTFD+gCFsdJVbOPvhClxgmZiC+2Fhd9NzQRX1h8KkY/jKlClYcvX4Cl9
   OyFqJ8zXQ+EWdW8t/yzsuX2I8u8dm9RpJuiCYlaB+X6gGS3r+CVEDMwd8
   aCQqAdgnQhbq+coKq9iqajjxMbjbYEPlqqLOFgbqXWdS12otJ+pRhRHN4
   2/zhpWHWRN9MQw0wJBlWEXRzuSsS1HlbvE9AUHDgPs6MEcMAsIThlgbmV
   w==;
X-CSE-ConnectionGUID: JqHESYAMQWaGg0Xp2hEftw==
X-CSE-MsgGUID: +0pSZ1C6QiWZ8wnwdEl7FA==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33227245"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 13:50:38 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:18696]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.61:2525] with esmtp (Farcaster)
 id d89652c2-f271-4de0-9e6f-9b50a15efa04; Wed, 11 Nov 2026 13:50:38 +0000 (UTC)
X-Farcaster-Flow-ID: d89652c2-f271-4de0-9e6f-9b50a15efa04
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:50:37 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:50:36 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 04/19] nitro_enclaves: Retry a command the device asks us to retry
Date: Wed, 11 Nov 2026 13:49:53 +0000
Message-ID: <59febb32ee6366b39e484b3cd0c70b1133fadd87.1794393487.git.graf@amazon.com>
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

The nitro_enclaves device may return -EAGAIN under rare circumstances,
which asks the system to perform the command again. Handle it as gracefully
as possible inside the kernel driver.

Most commands finish almost instantly; give them a 40s timeout. But commands
like free may indicate through -EAGAIN that they are still actively working
on freeling a slot which can take significantly longer. Use 10 minutes for
those.

To ensure that user space still reacts to events during such long timeout
periods, rework some of the locking ordering and use killable locks.

With this patch applied, a launch or a release that runs into such a
window waits for it to pass. When the device still asks for a retry once
the time is up, the caller gets -EAGAIN.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 28 +++++---
 drivers/virt/nitro_enclaves/ne_pci_dev.c  | 83 ++++++++++++++++++++++-
 2 files changed, 101 insertions(+), 10 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index bb5fdc377b051..0e9d6157dcc64 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -1155,7 +1155,9 @@ static long ne_enclave_ioctl(struct file *file, unsigned int cmd, unsigned long
 		if (copy_from_user(&vcpu_id, (void __user *)arg, sizeof(vcpu_id)))
 			return -EFAULT;
 
-		mutex_lock(&ne_enclave->enclave_info_mutex);
+		rc = mutex_lock_killable(&ne_enclave->enclave_info_mutex);
+		if (rc)
+			return rc;
 
 		if (ne_enclave->state != NE_STATE_INIT) {
 			dev_err_ratelimited(ne_misc_dev.this_device,
@@ -1219,11 +1221,14 @@ static long ne_enclave_ioctl(struct file *file, unsigned int cmd, unsigned long
 
 	case NE_GET_IMAGE_LOAD_INFO: {
 		struct ne_image_load_info image_load_info = {};
+		int rc;
 
 		if (copy_from_user(&image_load_info, (void __user *)arg, sizeof(image_load_info)))
 			return -EFAULT;
 
-		mutex_lock(&ne_enclave->enclave_info_mutex);
+		rc = mutex_lock_killable(&ne_enclave->enclave_info_mutex);
+		if (rc)
+			return rc;
 
 		if (ne_enclave->state != NE_STATE_INIT) {
 			dev_err_ratelimited(ne_misc_dev.this_device,
@@ -1267,7 +1272,9 @@ static long ne_enclave_ioctl(struct file *file, unsigned int cmd, unsigned long
 			return -NE_ERR_INVALID_FLAG_VALUE;
 		}
 
-		mutex_lock(&ne_enclave->enclave_info_mutex);
+		rc = mutex_lock_killable(&ne_enclave->enclave_info_mutex);
+		if (rc)
+			return rc;
 
 		if (ne_enclave->state != NE_STATE_INIT) {
 			dev_err_ratelimited(ne_misc_dev.this_device,
@@ -1347,7 +1354,9 @@ static long ne_enclave_ioctl(struct file *file, unsigned int cmd, unsigned long
 			return -NE_ERR_INVALID_ENCLAVE_CID;
 		}
 
-		mutex_lock(&ne_enclave->enclave_info_mutex);
+		rc = mutex_lock_killable(&ne_enclave->enclave_info_mutex);
+		if (rc)
+			return rc;
 
 		if (ne_enclave->state != NE_STATE_INIT) {
 			dev_err_ratelimited(ne_misc_dev.this_device,
@@ -1777,15 +1786,18 @@ static long ne_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	switch (cmd) {
 	case NE_CREATE_VM: {
-		int enclave_fd = -1;
 		struct ne_pci_dev *ne_pci_dev = ne_devs.ne_pci_dev;
 		u64 __user *slot_uid = (void __user *)arg;
+		int rc;
 
-		mutex_lock(&ne_pci_dev->enclaves_list_mutex);
-		enclave_fd = ne_create_vm_ioctl(ne_pci_dev, slot_uid);
+		rc = mutex_lock_killable(&ne_pci_dev->enclaves_list_mutex);
+		if (rc)
+			return rc;
+
+		rc = ne_create_vm_ioctl(ne_pci_dev, slot_uid);
 		mutex_unlock(&ne_pci_dev->enclaves_list_mutex);
 
-		return enclave_fd;
+		return rc;
 	}
 
 	default:
diff --git a/drivers/virt/nitro_enclaves/ne_pci_dev.c b/drivers/virt/nitro_enclaves/ne_pci_dev.c
index c37777bb95b49..199c3c7f8c42e 100644
--- a/drivers/virt/nitro_enclaves/ne_pci_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_pci_dev.c
@@ -26,6 +26,32 @@
  */
 #define NE_DEFAULT_TIMEOUT_MSECS	(120000) /* 120 sec */
 
+/**
+ * NE_CMD_RETRY_INITIAL_MSECS - Delay before the first retry of a command the
+ *				NE PCI device asked to be sent again.
+ */
+#define NE_CMD_RETRY_INITIAL_MSECS	(10)
+
+/**
+ * NE_CMD_RETRY_MAX_MSECS - Upper bound on the delay between two retries of a
+ *			    command the NE PCI device asked to be sent again.
+ */
+#define NE_CMD_RETRY_MAX_MSECS		(160)
+
+/**
+ * NE_CMD_RETRY_TOTAL_MSECS - How long after its first refusal a command the
+ *			      NE PCI device asks to be sent again may still go
+ *			      out, before -EAGAIN is reported to the caller.
+ */
+#define NE_CMD_RETRY_TOTAL_MSECS	(40000) /* 40 sec */
+
+/**
+ * NE_FREE_TIMEOUT_MSECS - How long after a first -EAGAIN ENCLAVE_STOP and
+ *			   SLOT_FREE may still go out. Scrubbing a large enclave
+ *			   can take minutes.
+ */
+#define NE_FREE_TIMEOUT_MSECS		(600000) /* 10 min */
+
 static const struct pci_device_id ne_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMAZON, PCI_DEVICE_ID_NE) },
 	{ 0, }
@@ -96,11 +122,24 @@ static int ne_wait_for_reply(struct pci_dev *pdev)
 	return 0;
 }
 
+/**
+ * ne_cmd_frees_slot() - Whether a command is one of the two that free a slot.
+ * @cmd_type:	Command type of the request.
+ *
+ * Return: true for ENCLAVE_STOP and SLOT_FREE.
+ */
+static bool ne_cmd_frees_slot(enum ne_pci_dev_cmd_type cmd_type)
+{
+	return cmd_type == ENCLAVE_STOP || cmd_type == SLOT_FREE;
+}
+
 int ne_do_request(struct pci_dev *pdev, enum ne_pci_dev_cmd_type cmd_type,
 		  void *cmd_request, size_t cmd_request_size,
 		  struct ne_pci_dev_cmd_reply *cmd_reply, size_t cmd_reply_size)
 {
+	unsigned int delay_msecs = NE_CMD_RETRY_INITIAL_MSECS;
 	struct ne_pci_dev *ne_pci_dev = pci_get_drvdata(pdev);
+	unsigned long deadline = 0;
 	int rc = -EINVAL;
 
 	if (cmd_type <= INVALID_CMD || cmd_type >= MAX_CMD) {
@@ -137,12 +176,23 @@ int ne_do_request(struct pci_dev *pdev, enum ne_pci_dev_cmd_type cmd_type,
 		return -EINVAL;
 	}
 
+retry:
 	/*
 	 * Use this mutex so that the PCI device handles one command request at
 	 * a time.
 	 */
 	mutex_lock(&ne_pci_dev->pci_dev_mutex);
 
+	if (deadline && time_after_eq(jiffies, deadline)) {
+		dev_err_ratelimited(&pdev->dev,
+				    "Device asked to retry cmd type=%u, giving up\n",
+				    cmd_type);
+
+		rc = -EAGAIN;
+
+		goto unlock_mutex;
+	}
+
 	atomic_set(&ne_pci_dev->cmd_reply_avail, 0);
 
 	ne_submit_request(pdev, cmd_type, cmd_request, cmd_request_size);
@@ -159,6 +209,27 @@ int ne_do_request(struct pci_dev *pdev, enum ne_pci_dev_cmd_type cmd_type,
 
 	atomic_set(&ne_pci_dev->cmd_reply_avail, 0);
 
+	if (cmd_reply->rc == -EAGAIN) {
+		/*
+		 * The device answered, so nothing is in flight and another
+		 * command may go out while this one waits to be sent again.
+		 */
+		mutex_unlock(&ne_pci_dev->pci_dev_mutex);
+
+		if (!deadline) {
+			unsigned int budget_msecs = ne_cmd_frees_slot(cmd_type) ?
+						    NE_FREE_TIMEOUT_MSECS :
+						    NE_CMD_RETRY_TOTAL_MSECS;
+
+			deadline = jiffies + msecs_to_jiffies(budget_msecs);
+		}
+
+		msleep(delay_msecs);
+		delay_msecs = min(delay_msecs * 2, NE_CMD_RETRY_MAX_MSECS);
+
+		goto retry;
+	}
+
 	if (cmd_reply->rc < 0) {
 		rc = cmd_reply->rc;
 
@@ -221,7 +292,14 @@ static void ne_event_work_handler(struct work_struct *work)
 	int rc = -EINVAL;
 	struct slot_info_req slot_info_req = {};
 
-	mutex_lock(&ne_pci_dev->enclaves_list_mutex);
+	/*
+	 * A release holds these locks for as long as the device takes to free
+	 * the slot, which can be minutes, so wait killable: that is not
+	 * reported as a hung task. The worker gets no signal, so the locks do
+	 * not fail.
+	 */
+	if (mutex_lock_killable(&ne_pci_dev->enclaves_list_mutex))
+		return;
 
 	/*
 	 * Iterate over all enclaves registered for the Nitro Enclaves
@@ -229,7 +307,8 @@ static void ne_event_work_handler(struct work_struct *work)
 	 * is corresponding to.
 	 */
 	list_for_each_entry(ne_enclave, &ne_pci_dev->enclaves_list, enclave_list_entry) {
-		mutex_lock(&ne_enclave->enclave_info_mutex);
+		if (mutex_lock_killable(&ne_enclave->enclave_info_mutex))
+			break;
 
 		/*
 		 * Enclaves that were never started cannot receive out-of-band
-- 
2.47.1

