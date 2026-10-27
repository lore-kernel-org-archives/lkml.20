Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102247;
	b=S1vcWeT22f/xnvJSUDIxsaiYNQR0UN4icMSJFqXvQg0OcgSUQpHilgdKripLoHUR100e
	 DbKHvwAHLksjJaDuTLJOfkIxvwkg9QUhlZ/MgEe6OgNpmVDuRs6yqVAmsNko2sY4mbnUm
	 39s5bLkmxCskGVnSvlQyNdlxmHxhL5Mo0l5m6tpRGp4AK4aMgekZqE33eClgEylQFgv/p
	 9SxTNSZimo8FWqPvAtEpMuOEmYnrl1X3ZTaD/Ne3enDb7elMO0VDfWKjZzvh/ALqCE/nI
	 7DlfGU0jbRdjCkLR8tPeHcx/x/AwnuDZlGMubty94ycVm5YJYyvEntgUbkwM2j/RYmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QaAMuJbecrAztR6OaS8JIvlR/iE1jXKP7uKOYNLmkZs=;
	b=F7b9j9qcMFFWZ30IavZsGFQt02zoxym8PdLtyNNMcc0uE9PK/66FEDS+5foAErZGJ9QA
	 06mcgpRkiI25DSJy4oD0yqyzRuH/w/OSqwmGons7IeYz2f/2izzqZCggcPKcepHpetNdy
	 dEcr3cZMFgA5E8J4AX5Nf9jxFz/YP/rQRFNl7UhWG6aAzWRzVXAf5LALQYsir37Ak6ujE
	 gglIjwSRQkoHMtEktLUP1LBr3ssFbuZ0wtpisFq7x1jjMqoPi5wtlvi7gxb6zOOFGySmu
	 J6jtWiaCFvzz+bMLan0qpSsSTrP5uYHTZW8IQuQuZXrMMIh4UwDpwN7hha8YZagP+Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rUo1Bt3W;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F189606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F189606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rUo1Bt3W
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc751eddf25so2191860a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102247; x=1793707047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QaAMuJbecrAztR6OaS8JIvlR/iE1jXKP7uKOYNLmkZs=;
        b=rUo1Bt3WlmJDL6Ruf1fN9OAooIDfi9NWIDf3KH50UEJzsqhUgsq1eZwf2fcblRd/GH
         0ivAKKU9auoPoXsAxwCAlJYFD+mGt8BaSo6fwnFXepdW+w/O7qRIRZduzqyepo0zW5b0
         sEDlt01yqVUELclWI0I9TI687SEMuOxSEDTp8k0nfpuLpJPUYTt3m8EthGWULfqWEF2N
         vQByFG5RrOdJJffME6M5S5S/YxfloCYI9wPoOt/98nq2ZCtBjyNDA//5Fhgqy3szbujI
         G6Pe9nsV4srbUtP3NvT3C+bRSXiDdmmBZ/iaRgItITUviZ6ODxFU/rV8hylVWBss0Pru
         PT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102247; x=1793707047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QaAMuJbecrAztR6OaS8JIvlR/iE1jXKP7uKOYNLmkZs=;
        b=lCMNStVxTGiknAG3jNPipKUmh+vGCdDiVAJ5a01C19r2Ld5CzOBy0j4TDwl6MMFocM
         yY3UMWZRKmHg5oGrYZzfn0Rcwxy91JTDrM7ytJcR6t6WU/Aot9HVxgnufi90bhDPiLQe
         mOyLCFryHTVm100YyIBoouyd48RZrwB/JIEzWJ0xS9/e/ADKp/LiN7u7R46J759HrL4j
         Krg07EUBLVCFjZidLMbowStLYUjnH1PgbW2PDXMbYWnrJlWnpdfkxosGhYb8O2ldEEO+
         +hMTwL0p+rIvPTBmi8PAoPSN98xd/tg6oSDs1EQc9DBagkqRljpGG5nlAAeypZzrWkWA
         M6VA==
X-Forwarded-Encrypted: i=1; AKwUvBz5WrcOTEMHCWBd989O4dtf1AkU249kRjvPqBpFlS0kPQgnJyLhdK5ncj9HqoyXwJr5U8HbVezEFLqLL8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKn5dI748zwMJeV7YXj5qll3tRFxDZfos8JNqq9oBr8kyO9F0gi
	hQ13QSoVyw/kwHUcZDxFgjWmMMIeHvmBJODeBmNHocxINcOnmy6liilx
X-Gm-Gg: AYBFou1OUpt84gQChsnOhl2DR2moYRe+NUPhBoBW5fFVdDBOwFpACLaDoD7asjVbk5T
	3mXse+FcNWv43QFwxt+SxY0jOVHFCErYASFucj6u8iWCv8ELjvmRo6Eb9/AHZocWaMFes3RlVWf
	UIwnU4q4SEiG6EafbscY2MTP+Pe/0pXclEELR8HICmiz0tjz1gpoAPap1SQF7i9brO4kLvbkgkT
	/S+n+9ipLN/D0jBuG5UA4PQ2XVDD67xcbbMfiR/q/Mvo8ihJArRma24Wxx3Gfn05wptWly14zV0
	e+19c0+AAk/ruUBXMeAT9mEevqdaiZZhBqpG22GEj3cxVdYbZ/Ks4Ogm+0v8TL5yjomMhWa7VC4
	NIa4G2SuU5x13Z3Y2HwtHJ030aUeNsWGSwJpu5E3QYjvgI+31gaKhZOJChT1KDhRyyvKsUFf+fm
	+meRqRNADpgayM7+ut4G/t77jlvNfL1NkMCGPgrtsKVIHEzOshV/EgP8BE/tvP4xIgrisRFmVib
	MAtPAWNAypu6ajDRUgEFndAaYAVbG4mNJjzQSMeB0FcndwyOLf+OXjPYDIj4r9346szXAzoPIU=
X-Received: by 2002:a17:90b:3dce:b0:3aa:6b5d:a02e with SMTP id 98e67ed59e1d1-3adeafd64c2mr8426537a91.54.1793102246644;
        Tue, 27 Oct 2026 04:57:26 -0700 (PDT)
Received: from n151-105-216.byted.org ([106.38.226.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40427bf1sm3704970a91.6.2026.10.27.04.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:57:26 -0700 (PDT)
From: guzebing <guzebing1612@gmail.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	sagi@grimberg.me,
	leon@kernel.org
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guzebing <guzebing@bytedance.com>
Subject: [PATCH] nvme-pci: unmap the full IOVA range on PRP setup failure
Date: Tue, 27 Oct 2026 19:57:18 +0800
Message-Id: <20261027115718.2241149-1-guzebing1612@gmail.com>
X-Mailer: git-send-email 2.20.1
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

From: Guzebing <guzebing@bytedance.com>

When using IOVA, blk_rq_dma_map_iter_start() maps the entire request
before PRP construction begins. However, iod->total_len is accumulated
as PRPs are populated. If a PRP list allocation fails, nvme_unmap_data()
passes this partial length to blk_rq_dma_unmap(), leaving part of the
request's DMA mapping intact.

Use dma_iova_size() as the unmap length for IOVA mappings so that
cleanup covers the full range mapped by blk_rq_dma_map_iter_start(),
even when PRP construction fails.

Fixes: 7ce3c1dd78fc ("nvme-pci: convert the data mapping to blk_rq_dma_map")
Signed-off-by: Guzebing <guzebing@bytedance.com>
---
 drivers/nvme/host/pci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 77317e5d00f9f..4f07425afb8d5 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -958,8 +958,9 @@ static void nvme_unmap_data(struct request *req)
 		attrs |= DMA_ATTR_MMIO;
 	}
 
-	if (!blk_rq_dma_unmap(req, dma_dev, &iod->dma_state, iod->total_len,
-			      map)) {
+	/* IOVA mappings cover the full request even if PRP setup fails. */
+	if (!blk_rq_dma_unmap(req, dma_dev, &iod->dma_state,
+			      dma_iova_size(&iod->dma_state), map)) {
 		if (nvme_pci_cmd_use_sgl(&iod->cmd))
 			nvme_free_sgls(req, &iod->cmd.common.dptr.sgl,
 			               iod->descriptors[0], attrs);
-- 
2.20.1

