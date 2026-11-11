Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.245.243.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405062;
	b=ZXKjWdMORs710QYaM03Nci7ptyCYACIrikqAwOSU7lC/x1GyRJtjHw7BfCg8mdpO1DjC
	 nIUPBxA7E6rfzAtv+Eu/F/PSaZCf9ntfiq2yoOa0jdejPfGg2KnZi1tpz64nmA99sp+R9
	 QrQVjOViTEc/vrhI2iHOxlA4sccgwSoM/ll96SuETHn6sYQ6u8qpcecX6a7eDjCdsm3Km
	 PqJeAWqHMNIUyj3yAkPvMnK9cLyCyESFPUnj1GK3mwO5h8QVNZwrzytNp4P0ZQ7EamjCA
	 XOEcOAqQ15tYJ5ac9CfCuPSjRPdTVmHEYx7h/mMAa5jZ+Ju8+ZFAI0yflJibfwaB+YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405062;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=5NR7NFzEbKRoN04DTUe+cp8bzmTaGorYINakXJx8eTs=;
	b=qc+HvCeiz/A3F5x7gEdt/mOBhoh6QLGZF1R3deClsKfgYhktQB9ZZb8GrbDXnsZwi1V7
	 /XEMkz0iT7jZzXRurMnoGxaO3Lw3quLObegTCWGmcJnkKyb28uQEHJf37lF7KRvCKiwnj
	 BhiIuaGG2ZqEvmCc5qRwGOpplopfnLEeiayX20K+oyWhjDYaolqe2tmjAiqXe97NyZQde
	 fJnN5E8pISmVxNWi0yvrbFwZHwltIRah2Jha3gsQ+XzTQPUcTicZ8xca6me3J+mcV7hZE
	 x9cI+Bxuo9ievFKoUkAwqnqdSV8rdMmsvbi7c1WhoqZdNgCV7P+xJeKbREFYuKUgCrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b="a/FczF3V";
	arc=none smtp.remote-ip=44.245.243.92
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCD0606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FCD0606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=a/FczF3V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794405062; x=1825941062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5NR7NFzEbKRoN04DTUe+cp8bzmTaGorYINakXJx8eTs=;
  b=a/FczF3VMX5FstJkTwwIOxPuRacRjWNd/joBAH8O6tO/qaBwMeY8FrG1
   8tI76qbZuCXB6D3iKcAc//hY6YGRWq+Apd6m0MS/PIR26rbYHS9i6dbEa
   IMgBJ4cQMON0BpUv74LmxDBuOUl8e/6VDHZd2ZcrBJSDf51Vvmofo8R1I
   3YUr2pjR+kIRTZaCzDwrGFR/a4GdLcMTDOi+1UHgrBlK6e2Y+Evyg85H1
   2LsxsTqCI5bq9JAEGNIRd8JIFEtbTpBDF4NuDXcfKb+s90bSEEXWEFm53
   FGkiaY7QZWRasTe5vCF6fzQ3Xd9CuXMtcvY8+zi2uKdocfZVM5j6agD5L
   Q==;
X-CSE-ConnectionGUID: N25FiPobTviDkf+FZuWUkw==
X-CSE-MsgGUID: 6yELX0LATTKubuCuzNZG6w==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33227260"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 13:51:02 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:13045]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.24.250:2525] with esmtp (Farcaster)
 id 2e0ad20d-a3d7-4fb5-a7d0-b4fc1496227a; Wed, 11 Nov 2026 13:51:01 +0000 (UTC)
X-Farcaster-Flow-ID: 2e0ad20d-a3d7-4fb5-a7d0-b4fc1496227a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:51:01 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:51:00 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 06/19] nitro_enclaves: Set up the device state before requesting its interrupts
Date: Wed, 11 Nov 2026 13:49:55 +0000
Message-ID: <0cb4cd3c0ca0be812a3e8c6264b266ea17912766.1794393487.git.graf@amazon.com>
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

A nitro_enclaves device left enabled by a previous kernel, for example
before a kdump capture kernel binds it, may raise an interrupt as soon
as the driver requests its MSI-X vectors. ne_pci_probe() requests them
before it initialises the reply wait queue, the enclave list and the
mutexes the handlers use, so such an interrupt oopses the kernel while
it binds the device.

Initialise those fields ahead of ne_setup_msix(). ne_devs.ne_pci_dev
stays beside misc_register(), because setting it publishes the device to
the ioctl paths.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_pci_dev.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_pci_dev.c b/drivers/virt/nitro_enclaves/ne_pci_dev.c
index 70fda4d29891f..d2c430d10758f 100644
--- a/drivers/virt/nitro_enclaves/ne_pci_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_pci_dev.c
@@ -620,6 +620,13 @@ static int ne_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	pci_set_drvdata(pdev, ne_pci_dev);
 
+	atomic_set(&ne_pci_dev->cmd_reply_avail, 0);
+	init_waitqueue_head(&ne_pci_dev->cmd_reply_wait_q);
+	INIT_LIST_HEAD(&ne_pci_dev->enclaves_list);
+	mutex_init(&ne_pci_dev->enclaves_list_mutex);
+	mutex_init(&ne_pci_dev->pci_dev_mutex);
+	ne_pci_dev->pdev = pdev;
+
 	rc = ne_setup_msix(pdev);
 	if (rc < 0) {
 		dev_err(&pdev->dev, "Error in pci dev msix setup [rc=%d]\n", rc);
@@ -636,13 +643,6 @@ static int ne_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto teardown_msix;
 	}
 
-	atomic_set(&ne_pci_dev->cmd_reply_avail, 0);
-	init_waitqueue_head(&ne_pci_dev->cmd_reply_wait_q);
-	INIT_LIST_HEAD(&ne_pci_dev->enclaves_list);
-	mutex_init(&ne_pci_dev->enclaves_list_mutex);
-	mutex_init(&ne_pci_dev->pci_dev_mutex);
-	ne_pci_dev->pdev = pdev;
-
 	ne_devs.ne_pci_dev = ne_pci_dev;
 
 	rc = misc_register(ne_devs.ne_misc_dev);
-- 
2.47.1

