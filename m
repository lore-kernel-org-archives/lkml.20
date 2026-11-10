Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304582;
	b=GH7/royL/p/NQZWrTPyG3tg2MHia8BpF7mBwJnSM6GBZVi8ORovMrSkuRawV/Vw3Cogz
	 B5JGNGDE3pHRmndOSMnZS8Eq3oumEDFB1VEEYfvrFPgSUQENRPcOTjUXmLLsQwac/V5bl
	 HOGRMVkDNK5+OBrPP1MZi0TqULJj3wu/NP6lenBhvXArUdcR3w5lqQgQJT9mHLcA8DAc6
	 82Uyhgx4FF1Lb/4pb+rjFkPPPGAiwHF2hG3oyYVT3qRKlKHR9xdcqyHtitFYdNt4cJOAz
	 4T14oo9SIW4X65PzyHDczR4CmZORVe2BXxS7oL5OCyQAxmDcMEoFhA2bubiJzQG4DfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304582;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Server:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Pre-Result:X-Rspamd-Action;
	bh=rns9WXqnK2J0gVFQfCh2DDABX4hO+ztKL/sbEuKtsOU=;
	b=N5fX2Q29Rmd5AaHbXKDg8Fp5Z8uHcwCaWE8cM1NbBUnM1tHCilO5Q2QqryADdj+I2wte
	 YFyC2FmitBzoyYNeKXrYPAH+uZhalA9T/owrzB7ZtNnkVLD44bgf3OjRr5BND0oIuE0lD
	 vUOq/YaAW9tuhmjTDaySrZij8Ekrn8UNtF5EcW3aFSULeKOUYVIljCmlxJTbeWyJDXh0P
	 e8CKtdWe1AipfhM8IibpwkE1qb0eoIbp23NFlRCcd8tYuTMt3UKxfrmlNBk9tYI6ndCI3
	 K6R2V6YHLvO7wBduDWrcS+lTEPbJ2ZW7TEBQr99iyLFV6k2bFL7VXKGMhCrCQAyui7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2848606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2848606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5412421F2E;
	Tue, 10 Nov 2026 09:56:20 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04CFF1339F;
	Tue, 10 Nov 2026 09:56:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p/aFM0Pq8mpgCgAAD6G6ig
	(envelope-from <jgross@suse.com>); Tue, 10 Nov 2026 09:56:19 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 2/2] Xen/gnttab: improve error handling in gnttab_dma_{alloc,free}_pages()
Date: Tue, 10 Nov 2026 10:56:05 +0100
Message-ID: <20261110095605.369848-3-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110095605.369848-1-jgross@suse.com>
References: <20261110095605.369848-1-jgross@suse.com>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Queue-Id: 5412421F2E
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action

From: Jan Beulich <jbeulich@suse.com>

Both decrease-reservation and populate-physmap can succeed partially. For
the former this may be pretty unlikely, but clearly the latter can hit
both out-of-memory conditions in the hypervisor or denial because of the
allocation exceeding the domain's allowance (there's no interaction with
the balloon driver here either).

In gnttab_dma_free_pages() we simply can't give back to the system what
hasn't been re-filled with backing memory. For gnttab_dma_alloc_pages()
both parts of the overall region need dealing with differently.

While no present caller of gnttab_dma_free_pages() checks its return
value, also don't use -EFAULT there: It really is an out-of-memory
condition. (In gnttab_dma_alloc_pages() -EFAULT doesn't look quite right
either, but I couldn't think of a clearly better error code there.)

Fixes: 9bdc7304f536 ("xen/grant-table: Allow allocating buffers suitable for DMA")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/grant-table.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 56a497987942..2a520080a570 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1096,6 +1096,24 @@ int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args *args)
 	ret = xenmem_reservation_decrease(args->nr_pages, args->frames);
 	if (ret != args->nr_pages) {
 		pr_debug("Failed to decrease reservation for DMA buffer\n");
+		if (ret >= 0) {
+			/* Free the part where decrease didn't work. */
+			size_t done = ret << PAGE_SHIFT;
+
+			if (args->coherent)
+				dma_free_coherent(args->dev, size - done,
+						  args->vaddr + done,
+						  args->dev_bus_addr + done);
+			else
+				dma_free_wc(args->dev, size - done,
+					    args->vaddr + done,
+					    args->dev_bus_addr + done);
+
+			if (!ret) /* Nothing else to do? */
+				return -EFAULT;
+
+			args->nr_pages = ret;
+		}
 		ret = -EFAULT;
 		goto fail;
 	}
@@ -1132,7 +1150,12 @@ int gnttab_dma_free_pages(struct gnttab_dma_alloc_args *args)
 	ret = xenmem_reservation_increase(args->nr_pages, args->frames);
 	if (ret != args->nr_pages) {
 		pr_debug("Failed to increase reservation for DMA buffer\n");
-		ret = -EFAULT;
+		/* Can only free what has been re-filled. */
+		if (!ret)
+			return -ENOMEM;
+		if (ret > 0)
+			args->nr_pages = ret;
+		ret = -ENOMEM;
 	} else {
 		ret = 0;
 	}
-- 
2.56.0

