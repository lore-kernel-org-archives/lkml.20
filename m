Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.26.1.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453168;
	b=Y7qPWPh28EfC1qdQdeyH5Xn1nzo5Gazf0Mpp5DY1i9T7xhA2W6VQRgvnR9R5SaURuu7R
	 li4vyXa6MG3CYILTmX9gxOOJ53wdmCOqLYmJbYVS1PtCurNBhdi6XwpmwyyYXBsew9don
	 9SxXngT0LH4BLE2oRe5/Z4VNC1wAxZNwOxvMNPgLVDtZeZstuwGqE1YwyxwwP7aayg/w2
	 DKBx0afk8LVLpw0kiovFM0/IsPP7X8/ir8uh75yb+DDzHkz5Nw4XbwdezNUblLBZqImra
	 ArlQVXrq/DsLIipfixQWug5Lw2CUSHlN647nrqCQGCC6xBj0Gr/MNrV/LbEux+f3sHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453168;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=dpjNhBbOeeMIRA0yJlCg88Aml+TpmebJNWqt85PYkgM=;
	b=VfsFarSH5lRGM8rjcoZMCmXJthvIoh2T2q8c1uGvU3r4A8Qs9NT0hRv/f0mSmj7ddmzq
	 vruYkJeZXoIjyT6ldlYN9CPxBFlG4kS2o0fAvn56NDOBcEc70q6qaL7PLiTZaZdAe5IDf
	 rbdClYNrO250lgoYlFckrVMamTSa7H7cqFJIEKO/KpeNCrQsEzSbr4/GTN1HwK9IohBP7
	 9sbieiViB2K1wsDccvjyOKgRJTQf7ZGacZZPKss4GukSW3rn84mPnwFU87zNBJEmZ1T0S
	 8V1fxYgmtPS97oRo/2cFeq8roZGYXa3X159FvymdR6cnHac0T8LEbSSAJCgYJk/6nOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=cOOo0If3;
	arc=none smtp.remote-ip=52.26.1.71
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93045606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93045606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=cOOo0If3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794453167; x=1825989167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dpjNhBbOeeMIRA0yJlCg88Aml+TpmebJNWqt85PYkgM=;
  b=cOOo0If3IeJ2G/WSRNQzaA3iG5SHywoi4XGnBKKmeUkiTg0+KREcYm1f
   tBlH/NT+GR043ZpZpJlvUoV4TE5T/n8jUiwftZbxf3bTNSH39H/g09SHr
   /r9UT4JvF5mb08MNvJ9hrZJdOhy2+Ti8/VRyyG/EpKNPYr0E07ExqywMk
   s3Dp0xSNXRvvQlz3xx9d6ShttRXPzWOe8VxAV0QPQ3z7otjC/8qZTBLr9
   BaEFsXBk06FY/XAoXgvKO2/ejj0ENAiOv9gJgDyv27qJS8oU1mDky2z1O
   M95+QtdzoNN6D7qyUfgWZHqf4hNyge2DMQaorgIXwTqKJh0oQN/MqZY/5
   Q==;
X-CSE-ConnectionGUID: zRLMiZZfQh+aDOkE2wA8Tg==
X-CSE-MsgGUID: 4tQw/NmzRp2ebpuA2FOOdQ==
X-IronPort-AV: E=Sophos;i="6.27,208,1787011200"; 
   d="scan'208";a="33802569"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:12:47 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:23244]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.127:2525] with esmtp (Farcaster)
 id 351a61f2-a5b8-4d50-8579-43dd6fc519b1; Thu, 12 Nov 2026 03:12:46 +0000 (UTC)
X-Farcaster-Flow-ID: 351a61f2-a5b8-4d50-8579-43dd6fc519b1
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:12:46 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:12:45 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 18/19] nitro_enclaves: Time the wait for the device to turn off by the clock
Date: Thu, 12 Nov 2026 03:07:14 +0000
Message-ID: <cb6490e940c12707a40355943e04a537716ecc67.1794393487.git.graf@amazon.com>
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

Unbind, shutdown and the next probe give the nitro_enclaves device
NE_DEFAULT_TIMEOUT_MSECS, 120 s, to turn off. The device turns off only
once it has stopped every enclave and scrubbed its memory, which can
take as long as a single ENCLAVE_STOP. ne_pci_dev_disable() also counts
the wait in 10 ms steps of msleep_interruptible(). At HZ=100 each step
sleeps two jiffies, so the wait takes 240 s, and with a signal pending
it does not sleep at all.

Allow the device NE_FREE_TIMEOUT_MSECS, 10 minutes, as for ENCLAVE_STOP,
and poll the register with readx_poll_timeout(), which keeps a ktime
deadline.

Kiro, an AI coding assistant, found this while timing an unbind on
hardware.

Fixes: 89308c11ae3b ("nitro_enclaves: Init PCI device driver")
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_pci_dev.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_pci_dev.c b/drivers/virt/nitro_enclaves/ne_pci_dev.c
index cd8e934e968c3..edc72d4f623e5 100644
--- a/drivers/virt/nitro_enclaves/ne_pci_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_pci_dev.c
@@ -9,6 +9,7 @@
 
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/iopoll.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -550,8 +551,7 @@ static void ne_pci_dev_disable(struct pci_dev *pdev)
 {
 	u8 dev_disable_reply = 0;
 	struct ne_pci_dev *ne_pci_dev = pci_get_drvdata(pdev);
-	const unsigned int sleep_time = 10; /* 10 ms */
-	unsigned int sleep_time_count = 0;
+	int rc;
 
 	iowrite8(NE_ENABLE_OFF, ne_pci_dev->iomem_base + NE_ENABLE);
 
@@ -560,17 +560,12 @@ static void ne_pci_dev_disable(struct pci_dev *pdev)
 	 * state is not immediately set to disabled and going through a
 	 * transitory state of disabling.
 	 */
-	while (sleep_time_count < NE_DEFAULT_TIMEOUT_MSECS) {
-		dev_disable_reply = ioread8(ne_pci_dev->iomem_base + NE_ENABLE);
-		if (dev_disable_reply == NE_ENABLE_OFF)
-			return;
-
-		msleep_interruptible(sleep_time);
-		sleep_time_count += sleep_time;
-	}
-
-	dev_disable_reply = ioread8(ne_pci_dev->iomem_base + NE_ENABLE);
-	if (dev_disable_reply != NE_ENABLE_OFF)
+	rc = readx_poll_timeout(ioread8, ne_pci_dev->iomem_base + NE_ENABLE,
+				dev_disable_reply,
+				dev_disable_reply == NE_ENABLE_OFF,
+				10 * USEC_PER_MSEC,
+				NE_FREE_TIMEOUT_MSECS * USEC_PER_MSEC);
+	if (rc < 0)
 		dev_err(&pdev->dev, "Error in pci dev disable cmd\n");
 }
 
-- 
2.47.1

