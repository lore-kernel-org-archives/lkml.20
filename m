Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.12.53.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405040;
	b=SfBRQOUFBFoaVWgijk+I8DuhUdqJoTbeXViqvuJVr0mb2+vRWfJRX994V+4Nn9gjwyv9
	 DYwvZoiLUmPiC9DzZLQi1pKEB/z4H2qYZ8d+3Rw2KI4Y9bdxKM7CJ6Afcowwc1FlLVILp
	 E68xY5YjeUcxjDiUgzXijRry5W9gq6tmWHK9KeMQ1PwXMWTrbjZQg0WVF/E0iB9p8QHY8
	 cPh4sl6IqcWtkPFGN0OiHxiWjbnluVZHHQ5+WnP0cdS+CChFKgGZAkGVTUaJFi0/u/XzQ
	 HQC8tUwNe3BGx1bVb7m+C0ZaQSCp+S5BEqjE0SlNriWvf6J3zYX0kygV8tUiQtjAnFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405040;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=3I2sFpfk7JOHt50Xn9z5VFX6ZirlazCKqpyLShKJUiU=;
	b=SS03DKfKJcrbNvoHRVPKnkwVsC02ZEHiIozBFubxarK4YdLbv9uXVN/n64q0MhqZKZCD
	 pzpOY9GpcV6AcnyEh6C2d8A5NY1mwekf64fKoj9bZ+5ZSDsNHymHoR8q00cF5iE8B/HG9
	 c430aVD1fMNxR9hluF4tXHHEOFymPlfHxasLo/Y69oV9/+6vkh0IA0zNN12mkxjpETikk
	 zylUgppDrtRBytW/Y0Xh/Rc+YH+xZzDT+ozkrbQedtPZOP4wktRvLbsBYZpqy4OSaoGKU
	 bOdUNl3pq9s711WHul3J+fbUplgVkBAJAHFKwumQUI/Q3OvIh8w6fSbt4uEWnj+bSpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=gMOmKGeX;
	arc=none smtp.remote-ip=52.12.53.23
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5D260A263A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD5D260A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=gMOmKGeX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794405039; x=1825941039;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3I2sFpfk7JOHt50Xn9z5VFX6ZirlazCKqpyLShKJUiU=;
  b=gMOmKGeXpofrkA5ZqVDv90mvnO1P2Nm/6YKo5s1NpAwvthlzjo8sPMLw
   Ml2qSrVBS6htXw1h7/AsPgf/LVBDewFU+cMr7wHxg8RXObCbuu5qUhtTr
   EV5EByZsGXi9SyUY4dllcFl2pc0tIvr+3jCdKwe8LTMwiEDd4qU10vI5c
   KWJOAiJxc44I7GYKqqPVOXInqRiZY0OuN8V3CL1fKez5g8qxsYfxv8tuL
   JjrnGzpxZAiMF0iCwehxL9pBO+WFGVl7FHb96hHJjMfP9+gsQQ1HFBGHa
   NH+pBHs6YGF2oJWV97tnvVC34/krVCYPm9OEkU8+Sx3AlAP6zgX8IiLxD
   A==;
X-CSE-ConnectionGUID: TxPYh5fFS8GFglYQ4Trdiw==
X-CSE-MsgGUID: qIJcmwXWQVWYgdYZzTVeTA==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33584287"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 13:50:39 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:8275]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.61:2525] with esmtp (Farcaster)
 id d8d1cbaa-b114-4571-9cfd-4a401990cb1a; Wed, 11 Nov 2026 13:50:39 +0000 (UTC)
X-Farcaster-Flow-ID: d8d1cbaa-b114-4571-9cfd-4a401990cb1a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:50:38 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:50:37 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 05/19] nitro_enclaves: Stop sending commands to a broken device
Date: Wed, 11 Nov 2026 13:49:54 +0000
Message-ID: <712030a1a6fc70eeca39388a193246ff3d53d15d.1794393487.git.graf@amazon.com>
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

The Nitro Enclaves device always answers quickly to its commands. Consider
it broken if it does not reply to a command within 120s. Except for
STOP/FREE commands which legitimately may take longer because the
hypervisor performs cleanup work that may take some time. For those,
use a 10 minute timeout.

Rework the request handler logic to enforce these limits. But still keep
processes killable during that time. Except for stop commands, which
are used as part of the slot shutdown sequence and have to block.

If a STOP/FREE command failed to respond in time (10 minutes), the
device is clearly broken. Switch to a mode then where it no longer
accepts any new commands.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 20 ++-----
 drivers/virt/nitro_enclaves/ne_pci_dev.c  | 63 ++++++++++++++++++-----
 drivers/virt/nitro_enclaves/ne_pci_dev.h  |  4 ++
 3 files changed, 59 insertions(+), 28 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index 0e9d6157dcc64..964cb21b27c77 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -1500,29 +1500,17 @@ static int ne_enclave_free_slot(struct ne_pci_dev *ne_pci_dev,
 		rc = ne_do_request(pdev, ENCLAVE_STOP,
 				   &enclave_stop_request, sizeof(enclave_stop_request),
 				   &cmd_reply, sizeof(cmd_reply));
-		if (rc < 0) {
-			dev_err_ratelimited(ne_misc_dev.this_device,
-					    "Error in enclave stop [rc=%d]\n", rc);
-
+		if (rc < 0)
 			return rc;
-		}
 
 		memset(&cmd_reply, 0, sizeof(cmd_reply));
 	}
 
 	slot_free_req.slot_uid = ne_enclave->slot_uid;
 
-	rc = ne_do_request(pdev, SLOT_FREE,
-			   &slot_free_req, sizeof(slot_free_req),
-			   &cmd_reply, sizeof(cmd_reply));
-	if (rc < 0) {
-		dev_err_ratelimited(ne_misc_dev.this_device,
-				    "Error in slot free [rc=%d]\n", rc);
-
-		return rc;
-	}
-
-	return 0;
+	return ne_do_request(pdev, SLOT_FREE,
+			     &slot_free_req, sizeof(slot_free_req),
+			     &cmd_reply, sizeof(cmd_reply));
 }
 
 /**
diff --git a/drivers/virt/nitro_enclaves/ne_pci_dev.c b/drivers/virt/nitro_enclaves/ne_pci_dev.c
index 199c3c7f8c42e..70fda4d29891f 100644
--- a/drivers/virt/nitro_enclaves/ne_pci_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_pci_dev.c
@@ -46,9 +46,10 @@
 #define NE_CMD_RETRY_TOTAL_MSECS	(40000) /* 40 sec */
 
 /**
- * NE_FREE_TIMEOUT_MSECS - How long after a first -EAGAIN ENCLAVE_STOP and
- *			   SLOT_FREE may still go out. Scrubbing a large enclave
- *			   can take minutes.
+ * NE_FREE_TIMEOUT_MSECS - How long the driver waits for the reply to
+ *			   ENCLAVE_STOP or SLOT_FREE, and how long after a first
+ *			   -EAGAIN it sends either again. Scrubbing a large
+ *			   enclave can take minutes.
  */
 #define NE_FREE_TIMEOUT_MSECS		(600000) /* 10 min */
 
@@ -98,13 +99,14 @@ static void ne_retrieve_reply(struct pci_dev *pdev, struct ne_pci_dev_cmd_reply
 /**
  * ne_wait_for_reply() - Wait for a reply of a PCI device command.
  * @pdev:	PCI device for which a reply is waited.
+ * @timeout_msecs:	How long to wait for the reply.
  *
  * Context: Process context. This function is called with the ne_pci_dev mutex held.
  * Return:
  * * 0 on success.
  * * Negative return value on failure.
  */
-static int ne_wait_for_reply(struct pci_dev *pdev)
+static int ne_wait_for_reply(struct pci_dev *pdev, unsigned int timeout_msecs)
 {
 	struct ne_pci_dev *ne_pci_dev = pci_get_drvdata(pdev);
 	int rc = -EINVAL;
@@ -112,10 +114,13 @@ static int ne_wait_for_reply(struct pci_dev *pdev)
 	/*
 	 * TODO: Update to _interruptible and handle interrupted wait event
 	 * e.g. -ERESTARTSYS, incoming signals + update timeout, if needed.
+	 *
+	 * A slot that is being scrubbed holds the reply for minutes, which is
+	 * no hung task, so wait idle.
 	 */
-	rc = wait_event_timeout(ne_pci_dev->cmd_reply_wait_q,
-				atomic_read(&ne_pci_dev->cmd_reply_avail) != 0,
-				msecs_to_jiffies(NE_DEFAULT_TIMEOUT_MSECS));
+	rc = wait_event_idle_timeout(ne_pci_dev->cmd_reply_wait_q,
+				     atomic_read(&ne_pci_dev->cmd_reply_avail) != 0,
+				     msecs_to_jiffies(timeout_msecs));
 	if (!rc)
 		return -ETIMEDOUT;
 
@@ -179,9 +184,23 @@ int ne_do_request(struct pci_dev *pdev, enum ne_pci_dev_cmd_type cmd_type,
 retry:
 	/*
 	 * Use this mutex so that the PCI device handles one command request at
-	 * a time.
+	 * a time. A slot being freed can hold it for minutes, so let a task
+	 * that waits for it be killed, unless the task frees a slot itself:
+	 * release has to do that for a process that is being killed too.
 	 */
-	mutex_lock(&ne_pci_dev->pci_dev_mutex);
+	if (ne_cmd_frees_slot(cmd_type)) {
+		mutex_lock(&ne_pci_dev->pci_dev_mutex);
+	} else {
+		rc = mutex_lock_killable(&ne_pci_dev->pci_dev_mutex);
+		if (rc)
+			return rc;
+	}
+
+	if (ne_pci_dev->failed) {
+		rc = -ENODEV;
+
+		goto unlock_mutex;
+	}
 
 	if (deadline && time_after_eq(jiffies, deadline)) {
 		dev_err_ratelimited(&pdev->dev,
@@ -197,10 +216,18 @@ int ne_do_request(struct pci_dev *pdev, enum ne_pci_dev_cmd_type cmd_type,
 
 	ne_submit_request(pdev, cmd_type, cmd_request, cmd_request_size);
 
-	rc = ne_wait_for_reply(pdev);
+	rc = ne_wait_for_reply(pdev, ne_cmd_frees_slot(cmd_type) ?
+				     NE_FREE_TIMEOUT_MSECS :
+				     NE_DEFAULT_TIMEOUT_MSECS);
 	if (rc < 0) {
-		dev_err_ratelimited(&pdev->dev, "Error in wait for reply for cmd type=%u [rc=%d]\n",
-				    cmd_type, rc);
+		/*
+		 * A reply does not name the command it answers, so a reply that
+		 * comes after this would be read as the answer to the next one.
+		 */
+		ne_pci_dev->failed = true;
+
+		dev_err(&pdev->dev, "No reply for cmd type=%u, not sending more cmds\n",
+			cmd_type);
 
 		goto unlock_mutex;
 	}
@@ -242,6 +269,18 @@ int ne_do_request(struct pci_dev *pdev, enum ne_pci_dev_cmd_type cmd_type,
 	rc = 0;
 
 unlock_mutex:
+	/*
+	 * A device that does not stop or free a slot leaves the driver unable
+	 * to tell what the slot still uses, so treat it like one that did not
+	 * answer.
+	 */
+	if (rc < 0 && !ne_pci_dev->failed && ne_cmd_frees_slot(cmd_type)) {
+		ne_pci_dev->failed = true;
+
+		dev_err(&pdev->dev, "Slot not freed, cmd type=%u [rc=%d], not sending more cmds\n",
+			cmd_type, rc);
+	}
+
 	mutex_unlock(&ne_pci_dev->pci_dev_mutex);
 
 	return rc;
diff --git a/drivers/virt/nitro_enclaves/ne_pci_dev.h b/drivers/virt/nitro_enclaves/ne_pci_dev.h
index 6e9f28971a4e0..19e129d14a3a0 100644
--- a/drivers/virt/nitro_enclaves/ne_pci_dev.h
+++ b/drivers/virt/nitro_enclaves/ne_pci_dev.h
@@ -279,6 +279,9 @@ struct ne_pci_dev_cmd_reply {
  * struct ne_pci_dev - Nitro Enclaves (NE) PCI device.
  * @cmd_reply_avail:		Variable set if a reply has been sent by the
  *				PCI device.
+ * @failed:			A command got no reply in time, or the device did
+ *				not stop or free a slot. No command is sent to
+ *				the device after that.
  * @cmd_reply_wait_q:		Wait queue for handling command reply from the
  *				PCI device.
  * @enclaves_list:		List of the enclaves managed by the PCI device.
@@ -294,6 +297,7 @@ struct ne_pci_dev_cmd_reply {
  */
 struct ne_pci_dev {
 	atomic_t		cmd_reply_avail;
+	bool			failed;
 	wait_queue_head_t	cmd_reply_wait_q;
 	struct list_head	enclaves_list;
 	struct mutex		enclaves_list_mutex;
-- 
2.47.1

