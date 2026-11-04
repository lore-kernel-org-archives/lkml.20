Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759623;
	b=aP8Z7UUhDtyMZaX9lwpzPkvep/t48JY3GLdASoglFkZ5nUvyUio45lcv5oNOJ8Ckllfi
	 xCqDWmgYgMBpZkrscwhscC+rhopb0KDwiuytYT/j+Ad7F6PDzfKyimtsrbB+Vle84vBJl
	 YC6CzzZUyrOBKR2K1cesuVbBf8KcXqDP89SuKhlMPiyxXnatf1hpaIw1ErW5txXbhxYzK
	 Xe8rhn0TBt3TiUPm7Ds7sPRyVIrmxaIRlrSJjiw8nFFC6UojqH9LCXM2hpwg/PP4A2B/e
	 6VTMzxou925tCVd8OkhIHomLGfTAO2daXADGZlAwnS2DYW1t/rm2v805Wre7L337gcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759623;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=eY0Q9HA7pjCQ/pDaWyN7RMHY7mPH1auvFiWqQI/rL40=;
	b=vlazXE1eBwI7ajLU+5qnlHSXGLrLEQX5PmEcsNNYTwbdf4jeMM4MT46WtGpD7rSA1xJE
	 ekEcbcMXDpNULOc1Ay4AqV7fnvEFsRAsx53XeHvMer7PkeoP1abKHb54VVecZP9lNiPlQ
	 5quj4ZMx5yywxWOlfo7kTlnBvMC76IAEq5J2c1M+vWGGTY1f6+cymBpW7YvqIxMoTXNvj
	 mkgEIopT6On5purdmf5kqCj0U6Ck7PDTzP3z8QJvj6StHdOn+KOfNbhVDOp1oerTS+YLb
	 sjpC6AZEGWIl3Tgs7VNMoFPPShbZMy4eRVHrwqB4SYOS4O/gtHhrZsJ5ZOLn19uEJmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=d5wJrp2n;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C138606A31B;
	Wed,  4 Nov 2026 02:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C138606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=d5wJrp2n
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5367d0735;
	Wed, 4 Nov 2026 10:33:33 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] EDAC/pci: Fix potential private data leak on release
Date: Wed,  4 Nov 2026 10:33:33 +0800
Message-ID: <20261104-db9e3c75b3-edac-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa1a46793bb03a1kunm9a448115163696
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHRlKVh0eGEpJTU1NQ00dS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=d5wJrp2nLqvK9rwcHV9Bm5CzWSbURjZZAxBom+/Ch5xUqg2FWtgIVkOLW6mcZHou1OAdh1RHvmiO6mmsts6C3e8H/opXCZyPJQdrADUUHgiSeq+SHJsjq49p5IodVf5S8DdXDCV8IbSQMVycopNYU3lMJ2F8T+pRvkX3VUKsoF4=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=eY0Q9HA7pjCQ/pDaWyN7RMHY7mPH1auvFiWqQI/rL40=;
	h=date:mime-version:subject:message-id:from;

edac_pci_alloc_ctl_info() allocates pvt_info separately from the
controller, but the instance release callback only frees the
controller. Release the private allocation there as well, when
the final instance reference is dropped.

This issue was found by our static analysis tool under development.

Fixes: fb8cd45ca39b ("EDAC/pci: Get rid of the silly one-shot memory allocation in edac_pci_alloc_ctl_info()")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Build-tested the changed object with x86_64 GCC W=1, using defconfig
with the driver dependencies enabled. No hardware/kernel runtime test or full linked-kernel
build.
OpenAI Codex assisted with source review, patch implementation and
commit-message drafting. The submitter has reviewed the changes.

 drivers/edac/edac_pci_sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/edac/edac_pci_sysfs.c b/drivers/edac/edac_pci_sysfs.c
index 9f437f648e4e..cdb9291765e3 100644
--- a/drivers/edac/edac_pci_sysfs.c
+++ b/drivers/edac/edac_pci_sysfs.c
@@ -83,6 +83,7 @@ static void edac_pci_instance_release(struct kobject *kobj)
 	/* decrement reference count on top main kobj */
 	kobject_put(edac_pci_top_main_kobj);
 
+	kfree(pci->pvt_info);
 	kfree(pci);	/* Free the control struct */
 }
 

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
