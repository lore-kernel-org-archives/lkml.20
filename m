Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E6635A397
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787901675; cv=none; b=YCl3L+OSFz1clCifyLQG2AUbNkghXKdD51grXasPooGaMS+yVcywJeKeCYzqnBzxupvyDvOLzm34jSThqD23Q2wA+AAk35/D1cVrFBhe76TAUCtfA2jgEixHKVHY0lbb9x1iYdY8h9yuYmdo6vfBQGlFVHAUDCd6+ekrsYyR/7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787901675; c=relaxed/simple;
	bh=chAfC1L2Xhcuor0eDG1nfGmLzwcAZqd27OMHzIsQkAc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eaFM7DRZJ282KvnhEc9eMvZED/FC/Cbb+/fg5Zx9ZY1bMXpHtV0zgKSGPtkiXPCLoytvbo7R3m8BYlyGmq6V+cQ8aoyoKUw+DVVmu0umnr2A4n2VKXZVsak1Y+4QPmP8uk2O0Io/wWVu5rmPSosORBItfaKZFRE1sCaVzbQNAoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=c9m2GAtT; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="c9m2GAtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2U
	Nz/LtL1hHnkEDDiIln49PIlu08Nj1wCtZlHDgwemA=; b=c9m2GAtTAydEp7Bxm3
	z8UmMUQxRUoieMlJXHo0Z22KX7XlGaz80fZNK4SPsdTpFQQuNAfJj9R25ph+P+w8
	axWB96sG1UH3KZ/88Y49sVrAueh3ml7vIJj0MNJ1hqBkXxw7GBa+85kGJy1202Ms
	TDWEnOcrbsgcUnql8r1eSLdLk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCHLtnJNpFq5HHvSQ--.45767S2;
	Fri, 28 Aug 2026 15:20:41 +0800 (CST)
From: "Li Youhong" <dayou5941@163.com>
To: bwarrum@linux.ibm.com,
	rituagar@linux.ibm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Li Youhong <liyouhong@kylinos.cn>
Subject: [PATCH] misc: ibmvmc: free IRQ when enabling interrupts fails
Date: Fri, 28 Aug 2026 15:20:40 +0800
Message-Id: <20260828072040.209200-1-dayou5941@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCHLtnJNpFq5HHvSQ--.45767S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1DCFy8tFy7KrykGw1ftFb_yoW3Krb_Cw
	4F93yxWr90ka4rGr1jgrn3ZwnYkFWDurn2g34DtFy3A347ZwsxWrWxCFn8GrZ5K390kFy3
	JwsIgrWSyr1IkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8T7K7UUUUU==
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC+gm+bWqRNslu+gAA3w

From: Li Youhong <liyouhong@kylinos.cn>

request_irq() may succeed while vio_enable_interrupts() fails.  The
shared error path freed the CRQ and killed the tasklet but left the IRQ
registered.  Call free_irq() before jumping to that path.

Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
---
 drivers/misc/ibmvmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/ibmvmc.c b/drivers/misc/ibmvmc.c
index da82b1edb7c9..b72b1ac4b359 100644
--- a/drivers/misc/ibmvmc.c
+++ b/drivers/misc/ibmvmc.c
@@ -2176,6 +2176,7 @@ static int ibmvmc_init_crq_queue(struct crq_server_adapter *adapter)
 	rc = vio_enable_interrupts(vdev);
 	if (rc != 0) {
 		dev_err(adapter->dev, "Error %d enabling interrupts!!!\n", rc);
+		free_irq(vdev->irq, (void *)adapter);
 		goto req_irq_failed;
 	}
 
-- 
2.25.1

