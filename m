Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.26.1.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405018;
	b=CW66LZQF+PV5faabToMB4QNNBGL9/jyMB+0PGbaTscV7ggLK8B08Hnwu+vxPAHyV3dHu
	 25eoarygHp8qP4L7z3YAU6qj8IhWKZi9RMudaE9GKrbegO0mBoNmyjuBTRQ3CCOgm8Sjr
	 5BtFmil7sYrx6WjCSmvRyxOt01XqLHknoVA3+VOgRCGRidTWPl62cynq/y9jciHc2LuGn
	 q4o1Maus3osq+EV2MNVxa/gSGx+BT2jDmgKDzL78cYdASeM6m+eQK4BU8T2+lKLzyLIAP
	 +6OJNVYIvy2vYZ49xStuy9mX5v4boHlNq1BNfUtn+biah9fed/waIzVMKeWWxpIGMfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405018;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=KqJRB7/HAskLRm0uxU91jI1jU1dVNVH0YKtgvI8OEj4=;
	b=XINJaC71FhHeB+cNgbSkBwAMOSGsrTtbcVQHT/D2W4UQPTwC1+bhBO2RbHLkrH92hua1
	 Sla/NBjTikqLeDdler+oJD0ul8Ey2rOgZcoST5U1kCPSMbo1ywN38Ti/M0jF2rf06eCmo
	 jkEGe089kSidnjTiDgnISSIPZHO7SOA2MruJQxDmVEPGFJ9Yz3yYO2CdkrkQsLiWxVn8P
	 6KhBWT04mXBxqqlI2YwAFVp+BLe/tNsF9GkIKxNKMfVgZBXEurAGOoESv9iwmcSvwFmNG
	 z4dldpdlFgPK0zpj9xkOru1craLvGBsoFMxQpEO1tcWXUR4xam+1Yc8fSXAR12ATKxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Xam7f4qI;
	arc=none smtp.remote-ip=52.26.1.71
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACF3606A887
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DACF3606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Xam7f4qI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794405016; x=1825941016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KqJRB7/HAskLRm0uxU91jI1jU1dVNVH0YKtgvI8OEj4=;
  b=Xam7f4qIWMIYYne0QKQFK7z0a6sk4C1NSMMoujlKWwhSpydTgHrFNavo
   6VD+VoyPZZ9yX3Z/GbrEBbkhoNH/167D3lVRsvP+xRAl6yPFnT2l7+JBo
   2POiYUFAl78tPMExUmMYjVSsCUgVGWIl4EK8fg0U/5XreyZYKkkldBRjt
   UgdwLXuksu5vDTK5ocmhNAB7zqyTJw6QOdVCc3f9irKGT8wX3LGKyVLM5
   S+NnkS+oYbJM1Ob2x4h6KEhjGXTOHpucbEGInK3emf4W+sBLPwcEe4xrU
   c9X4+PqKIn+c02xd2By9BPWDwiZ17PjPDMCJ1/eXHNaCiLChe+htDtq+h
   w==;
X-CSE-ConnectionGUID: eECG1/zTRn2Kc5piYNPhpw==
X-CSE-MsgGUID: S26yFYqWTcWv+epeHTU1YA==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33743369"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 13:50:14 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:5605]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.227:2525] with esmtp (Farcaster)
 id a7a3f67d-99e2-4c2f-b7b3-f1b1e57637c0; Wed, 11 Nov 2026 13:50:14 +0000 (UTC)
X-Farcaster-Flow-ID: a7a3f67d-99e2-4c2f-b7b3-f1b1e57637c0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:50:13 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:50:12 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 02/19] nitro_enclaves: Split freeing the slot from freeing the enclave
Date: Wed, 11 Nov 2026 13:49:51 +0000
Message-ID: <9374a07993d226de14468fe8b912cd40a64428d0.1794393486.git.graf@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Under rare circumstances, the nitro_enclaves device may turn down an
ENCLAVE_STOP or SLOT_FREE command. In preparation to handle that case,
split ne_enclave_release() into ne_enclave_free_slot() and
ne_enclave_free().

ne_enclave_free_slot() asks the device to stop the enclave and to free
its slot. ne_enclave_free() drops the references on the memory region
pages, puts the enclave's threads back into the NE CPU pool and frees
the enclave. It only runs once the device has confirmed that it no
longer owns what the enclave was given, which is the default behavior
today.

With the two apart, all donated Enclave resources like memory and CPUs
can stay tracked as in-use when the device turns a command down, for as
long as the device may still use them.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 111 ++++++++++++++--------
 1 file changed, 74 insertions(+), 37 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index a50dc4f737b55..bb5fdc377b051 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -1386,7 +1386,8 @@ static long ne_enclave_ioctl(struct file *file, unsigned int cmd, unsigned long
  *						from the enclave data structure.
  * @ne_enclave :	Private data associated with the current enclave.
  *
- * Context: Process context. This function is called with the ne_enclave mutex held.
+ * Context: Process context. This function is called on an enclave that is on
+ *	    no list and has no file left.
  */
 static void ne_enclave_remove_all_mem_region_entries(struct ne_enclave *ne_enclave)
 {
@@ -1413,7 +1414,8 @@ static void ne_enclave_remove_all_mem_region_entries(struct ne_enclave *ne_encla
  *					     the enclave data structure.
  * @ne_enclave :	Private data associated with the current enclave.
  *
- * Context: Process context. This function is called with the ne_enclave mutex held.
+ * Context: Process context. This function is called on an enclave that is on
+ *	    no list and has no file left.
  */
 static void ne_enclave_remove_all_vcpu_id_entries(struct ne_enclave *ne_enclave)
 {
@@ -1464,41 +1466,24 @@ static void ne_pci_dev_remove_enclave_entry(struct ne_enclave *ne_enclave,
 }
 
 /**
- * ne_enclave_release() - Release function provided by the enclave file.
- * @inode:	Inode associated with this file release function.
- * @file:	File associated with this release function.
+ * ne_enclave_free_slot() - Stop an enclave and free its slot in the device.
+ * @ne_pci_dev :	Private data associated with the PCI device.
+ * @ne_enclave :	Private data associated with the current enclave.
  *
- * Context: Process context.
+ * Context: Process context. This function is called with the ne_pci_dev enclave
+ *	    mutex and the ne_enclave mutex held.
  * Return:
- * * 0 on success.
+ * * 0 once the device has freed the slot.
  * * Negative return value on failure.
  */
-static int ne_enclave_release(struct inode *inode, struct file *file)
+static int ne_enclave_free_slot(struct ne_pci_dev *ne_pci_dev,
+				struct ne_enclave *ne_enclave)
 {
 	struct ne_pci_dev_cmd_reply cmd_reply = {};
 	struct enclave_stop_req enclave_stop_request = {};
-	struct ne_enclave *ne_enclave = file->private_data;
-	struct ne_pci_dev *ne_pci_dev = ne_devs.ne_pci_dev;
-	struct pci_dev *pdev = ne_pci_dev->pdev;
-	int rc = -EINVAL;
 	struct slot_free_req slot_free_req = {};
-
-	if (!ne_enclave)
-		return 0;
-
-	/*
-	 * Early exit in case there is an error in the enclave creation logic
-	 * and fput() is called on the cleanup path.
-	 */
-	if (!ne_enclave->slot_uid)
-		return 0;
-
-	/*
-	 * Acquire the enclave list mutex before the enclave mutex
-	 * in order to avoid deadlocks with @ref ne_event_work_handler.
-	 */
-	mutex_lock(&ne_pci_dev->enclaves_list_mutex);
-	mutex_lock(&ne_enclave->enclave_info_mutex);
+	struct pci_dev *pdev = ne_pci_dev->pdev;
+	int rc;
 
 	if (ne_enclave->state != NE_STATE_INIT && ne_enclave->state != NE_STATE_STOPPED) {
 		enclave_stop_request.slot_uid = ne_enclave->slot_uid;
@@ -1510,7 +1495,7 @@ static int ne_enclave_release(struct inode *inode, struct file *file)
 			dev_err_ratelimited(ne_misc_dev.this_device,
 					    "Error in enclave stop [rc=%d]\n", rc);
 
-			goto unlock_mutex;
+			return rc;
 		}
 
 		memset(&cmd_reply, 0, sizeof(cmd_reply));
@@ -1525,22 +1510,74 @@ static int ne_enclave_release(struct inode *inode, struct file *file)
 		dev_err_ratelimited(ne_misc_dev.this_device,
 				    "Error in slot free [rc=%d]\n", rc);
 
-		goto unlock_mutex;
+		return rc;
 	}
 
-	ne_pci_dev_remove_enclave_entry(ne_enclave, ne_pci_dev);
+	return 0;
+}
+
+/**
+ * ne_enclave_free() - Give back what an enclave was given and free it.
+ * @ne_enclave :	Private data associated with the current enclave.
+ *
+ * Context: Process context. This function is called once the device has freed
+ *	    the slot of the enclave, on an enclave that is on no list and has no
+ *	    file left.
+ */
+static void ne_enclave_free(struct ne_enclave *ne_enclave)
+{
 	ne_enclave_remove_all_mem_region_entries(ne_enclave);
 	ne_enclave_remove_all_vcpu_id_entries(ne_enclave);
 
-	mutex_unlock(&ne_enclave->enclave_info_mutex);
-	mutex_unlock(&ne_pci_dev->enclaves_list_mutex);
-
 	kfree(ne_enclave);
+}
 
-	return 0;
+/**
+ * ne_enclave_release() - Release function provided by the enclave file.
+ * @inode:	Inode associated with this file release function.
+ * @file:	File associated with this release function.
+ *
+ * Context: Process context.
+ * Return:
+ * * 0 on success.
+ * * Negative return value on failure.
+ */
+static int ne_enclave_release(struct inode *inode, struct file *file)
+{
+	struct ne_enclave *ne_enclave = file->private_data;
+	struct ne_pci_dev *ne_pci_dev = ne_devs.ne_pci_dev;
+	int rc;
+
+	if (!ne_enclave)
+		return 0;
+
+	/*
+	 * Early exit in case there is an error in the enclave creation logic
+	 * and fput() is called on the cleanup path.
+	 */
+	if (!ne_enclave->slot_uid)
+		return 0;
+
+	/*
+	 * Acquire the enclave list mutex before the enclave mutex
+	 * in order to avoid deadlocks with @ref ne_event_work_handler.
+	 */
+	mutex_lock(&ne_pci_dev->enclaves_list_mutex);
+	mutex_lock(&ne_enclave->enclave_info_mutex);
+
+	/*
+	 * A slot the device did not free may still run on the memory and the
+	 * CPUs of the enclave, so the enclave keeps them.
+	 */
+	rc = ne_enclave_free_slot(ne_pci_dev, ne_enclave);
+	if (!rc)
+		ne_pci_dev_remove_enclave_entry(ne_enclave, ne_pci_dev);
 
-unlock_mutex:
 	mutex_unlock(&ne_enclave->enclave_info_mutex);
+
+	if (!rc)
+		ne_enclave_free(ne_enclave);
+
 	mutex_unlock(&ne_pci_dev->enclaves_list_mutex);
 
 	return rc;
-- 
2.47.1

