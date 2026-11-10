Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304576;
	b=UyLlEw5fTaxq7Kxh8Sd4QykZKK3PnJmYSIXQ/ZpD2Dzr7AtUbaOGryEdT4uaDIkWH/4G
	 psbY2bNVi/ujazNwBi7rViv5p+iJc3kXk187fH+73X9QbsUXVjBAB1VfXiCcMYDMMJbMZ
	 NrRMT0rLrOy/f2II/T6H/9FOETmdLpUMM5qJaoKvCpsmE8GlQd5m5dc3bsagYvmLDdQ6J
	 IuAZMGgr+dXcpg/nfmyCSaMUmDcJ4M9GE9Q9y2Dc4eUR5QseKh6Ccuq6Fh7Wz5gc2FXI+
	 PsPJcjoJNOwZ555QKFfPD8XRaMS9Tes/vJoCeMFI/7HbfARj8o4m1PB1HKXN70Jvx/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304576;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=pwY9LfeqcRS7j1sr/gpJK/qWawtftlvmsiGAP+uG4hU=;
	b=YVM9Uz7blAb1ft80PduFCZbA2W45tTBK0vAE61Cr5dPFckGdUXD4dzLu2JcRIrPBkHlm
	 7pYS+TlKcJyn8Bp9L5zFQinhLJrG6495G5L/OFmAIKRuznaw6YGc60TcBBOa4W7vM/MG5
	 sr6DbCHEIwJpTbbM1EwQ83Onq/3+sSGoKH4/BujTc9V300XZJ6UiAhO/AaOWxHqkYzb2Z
	 9MZGqc8kFjmAnkyVj8VH7yyI3TtCDfmtAHmCzYFkIKvs2rg3QRvsRLX5eCSKVxvw44ibh
	 t2wnFBPix5drOXytn6U/96GPCsywH+nqrk3syW6oUOPDVnPul3vrtYjs2sGMWC9TWwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="HfHO/LM/";
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="HfHO/LM/";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E05E606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E05E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=HfHO/LM/;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=HfHO/LM/
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A901B1F7EE;
	Tue, 10 Nov 2026 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794304574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pwY9LfeqcRS7j1sr/gpJK/qWawtftlvmsiGAP+uG4hU=;
	b=HfHO/LM/+l1w+qhfmqU/ecJ8ZK1QLIWUmAWOIAwPicL4GjlpglWqR3g5H/SwLOfbLBhO06
	7WLq+tzMTYnOnRqgy+fU/E1nyBZ7UALUUH2/pThlTRupAZfAil8fw56CLxxakWH57oB0pk
	I7SHD345kPjsN/qk8voaxzXoD6qa/8s=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794304574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pwY9LfeqcRS7j1sr/gpJK/qWawtftlvmsiGAP+uG4hU=;
	b=HfHO/LM/+l1w+qhfmqU/ecJ8ZK1QLIWUmAWOIAwPicL4GjlpglWqR3g5H/SwLOfbLBhO06
	7WLq+tzMTYnOnRqgy+fU/E1nyBZ7UALUUH2/pThlTRupAZfAil8fw56CLxxakWH57oB0pk
	I7SHD345kPjsN/qk8voaxzXoD6qa/8s=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E0691339F;
	Tue, 10 Nov 2026 09:56:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ICdQDT7q8mpaCgAAD6G6ig
	(envelope-from <jgross@suse.com>); Tue, 10 Nov 2026 09:56:14 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/2] xen: don't allow gnttab_dma_[alloc|free]_pages() in PV guest
Date: Tue, 10 Nov 2026 10:56:04 +0100
Message-ID: <20261110095605.369848-2-jgross@suse.com>
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
X-Spamd-Result: default: False [-15.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -15.80
X-Spam-Level: 
X-Spam-Flag: NO

Today gnttab_dma_alloc_pages() or gnttab_dma_free_pages are never
called when running as a PV guest, but this holds for in-tree callers
only.

Bail out early when being called in PV mode in order to ensure no out
of tree module or future use cases are violating this assumption.

This enables to safely remove PV-only code from both functions.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/grant-table.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 604c4eea5930..56a497987942 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1063,6 +1063,9 @@ int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args *args)
 	size_t size;
 	int i, ret;
 
+	if (WARN_ON(xen_pv_domain()))
+		return -EINVAL;
+
 	if (args->nr_pages < 0 || args->nr_pages > (INT_MAX >> PAGE_SHIFT))
 		return -ENOMEM;
 
@@ -1090,8 +1093,6 @@ int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args *args)
 		xenmem_reservation_scrub_page(page);
 	}
 
-	xenmem_reservation_va_mapping_reset(args->nr_pages, args->pages);
-
 	ret = xenmem_reservation_decrease(args->nr_pages, args->frames);
 	if (ret != args->nr_pages) {
 		pr_debug("Failed to decrease reservation for DMA buffer\n");
@@ -1120,6 +1121,9 @@ int gnttab_dma_free_pages(struct gnttab_dma_alloc_args *args)
 	size_t size;
 	int i, ret;
 
+	if (WARN_ON(xen_pv_domain()))
+		return -EINVAL;
+
 	gnttab_pages_clear_private(args->nr_pages, args->pages);
 
 	for (i = 0; i < args->nr_pages; i++)
@@ -1133,9 +1137,6 @@ int gnttab_dma_free_pages(struct gnttab_dma_alloc_args *args)
 		ret = 0;
 	}
 
-	xenmem_reservation_va_mapping_update(args->nr_pages, args->pages,
-					     args->frames);
-
 	size = args->nr_pages << PAGE_SHIFT;
 	if (args->coherent)
 		dma_free_coherent(args->dev, size,
-- 
2.56.0

