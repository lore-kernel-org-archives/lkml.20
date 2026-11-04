Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793762698;
	b=QWAt8Mz33DuXwCvQf3p6TqYQ92kqOOJ419RO+sWT++HZeMtyTecVOd1qkH2pKLNYf/sn
	 h6Vtl0loDCBHqq0MJ58ykQ3Cr9i3fNNXD82nC606shmISKy2KsJilf2df58FK3+F/KIhc
	 DQsYCw84kEiZIwhyoYNE9LnmYgUfC9wgevBZH/8Uugoq16QzVvxIP2CaRsMKQ/sPSiMHg
	 fvcX8C53mIR3CgYc7tZAJRikpw7UyacqF7ZzLdlr2D0paFHgH5+qn72T4CAJpdsLgjxyy
	 vdIh/R6UGCdPPt5Rq6uP8SPgBmqRqwKIhmHWynGPWI7iiFH/NcIAOlP1+MTp5gfGv6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762698;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=AHVLeFCIAjPF0ZWVLuwnrV2ro0VsDuR9khR1+pmV1R8=;
	b=Kbq0XZkfqe833ancaVyr8zNZvscjT1+907T4bkrkF+sdHuzToM2c/nccRnzVvr9dWCao
	 Lp5KRyzlShB6ecWe0fuit/SxtD8SEYV7EhXNdamZ5ltnsB49gTyqKgzhbg9x+nLsjuIvr
	 4Wr0vVEkV1ZdQd3XoHspniNRsOXWMAsMRzErDLgu8se7nQVFno8mDxCutFYB1qTja52z2
	 RUbWzduNGbJ5l1zisqdhJL9+bYCq7fMc+rcc8ES3un/K01B0XRN+1Rr8OsIqqSGVan66n
	 vK/vLDrPDtI5e0XrIo1EfLDCAcu95k8VpFAb147qNdfmRWokSZAPI4QL02A8sVExUCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AC2606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1AC2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABnVf+Epepq9TI_AA--.27975S2;
	Wed, 04 Nov 2026 11:24:52 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] dca: unregister the provider when domain allocation fails
Date: Wed,  4 Nov 2026 03:25:01 +0000
Message-Id: <20261104032501.1554137-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowABnVf+Epepq9TI_AA--.27975S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFWfCw1fZryrWF1UZw45Awb_yoW8Xr1DpF
	48JFyYk3yqqw4UJwsFg3WkWFW5G3Wft348uFW8G3s09395WFy0gry8XFy8urWvvFn5GF4S
	vFy8tFyrCry5AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Sb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjcxG6xCI17CEII8vrVW3JVW8Jr1l42xK82IY
	c2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8GFyrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jr0_Jrylx4CE04Ijxs4lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JV
	W7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Cr1j6r
	xdYxBIdaVFxhVjvjDU0xZFpf9x07bihFsUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwYBA2rqpP0CHAAAsE

register_dca_provider() registers the provider in sysfs and in the
provider IDR before it tries to create a new domain.  If the domain
allocation fails, the function returns -ENODEV without calling
dca_sysfs_remove_provider(), so the IDR entry and the sysfs device stay
registered while the caller frees the provider, leaving a dangling
pointer behind that a later lookup can dereference.

Remove the sysfs and IDR registration before bailing out, matching what
the adjacent error path already does.

Fixes: a1741e7fcbc1 ("locking, drivers/dca: Annotate dca_lock as raw")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/dca/dca-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dca/dca-core.c b/drivers/dca/dca-core.c
index 583510850fad..e08f8894d7e9 100644
--- a/drivers/dca/dca-core.c
+++ b/drivers/dca/dca-core.c
@@ -368,8 +368,10 @@ int register_dca_provider(struct dca_provider *dca, struct device *dev)
 		raw_spin_unlock_irqrestore(&dca_lock, flags);
 		rc = dca_pci_rc_from_dev(dev);
 		newdomain = dca_allocate_domain(rc);
-		if (!newdomain)
+		if (!newdomain) {
+			dca_sysfs_remove_provider(dca);
 			return -ENODEV;
+		}
 		raw_spin_lock_irqsave(&dca_lock, flags);
 		/* Recheck, we might have raced after dropping the lock */
 		domain = dca_get_domain(dev);
-- 
2.34.1

