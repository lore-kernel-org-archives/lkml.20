Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808ED2DF13B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332391; cv=none; b=VT42V8CbgdSBqdUlYVgc8UCm5UP5QtBzfVQsDpdlTqaKgoRPHhncPg2lw8ckSAmNQrhhTISAi3zP80x+U5n8pkVjx9ANWnenfV+a6ZmE1iqkPu65XXn2IkQQRi8viy/1DSJj1dreiQXcaHklaSemTrA483jYewLKwe3v9UTz3Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332391; c=relaxed/simple;
	bh=fGcWXD1jgDSNs74DUYfGEtbJQxmdsZpWU/5NnUXB2OI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=kz9XIUc00m6lktl3QTNEn3BhKfC7sjkfsLquqzp537ib4/vITzXr1ZwrRfRg0BvK6fm/tvdG0vjREfSwYYWeGC9W0MfofzK5xvfM/72/b4WUfkOjmrtZmIfueq+18tRGCks7YS1WHuEmKBRor2YCgwUs69NqXBi0M+v28G3uDhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e099dd40a69b11f19a56ed5b684f684d-20260902
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:00670d97-afbf-429d-b641-216ef744c357,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:cb901616f663613b6eab53a147e65bad,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e099dd40a69b11f19a56ed5b684f684d-20260902
X-User: fuqingshuang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fuqingshuang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1251345178; Wed, 02 Sep 2026 14:59:44 +0800
From: Qingshuang Fu <fuqingshuang@kylinos.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: [PATCH] genirq/generic-chip: Set IRQ_DOMAIN_FLAG_DESTROY_GC in irq_domain_alloc_generic_chips()
Date: Wed,  2 Sep 2026 14:59:39 +0800
Message-Id: <20260902065939.441981-1-fuqingshuang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

irq_domain_alloc_generic_chips() allocates generic irq chips and stores
them via d->gc. However, it does not set the IRQ_DOMAIN_FLAG_DESTROY_GC
flag on the domain. This means that when irq_domain_remove() is later
called, the generic chips are not freed because the check for
IRQ_DOMAIN_FLAG_DESTROY_GC fails, resulting in a memory leak.

Currently, every caller of irq_domain_alloc_generic_chips(), including
irq_domain_instantiate() when supplied with dgc_info, must manually set
this flag. If a caller forgets to do so, the allocated generic chips
will silently leak on domain removal.

Fix this by setting IRQ_DOMAIN_FLAG_DESTROY_GC in
irq_domain_alloc_generic_chips() right after d->gc is assigned. This
ensures that any domain using generic chips will automatically have the
chips cleaned up when the domain is removed.

The flag is set using an idempotent OR‑operation, so existing callers
which already set this flag manually remain unaffected. Even if the
allocation fails halfway and frees the gc memory in the error path,
irq_domain_remove_generic_chips() checks d->gc for NULL before
proceeding, thus no double‑free can occur. Setting the flag here is
always safe.

Fixes: e6f67ce32e8e ("irqdomain: Add support for generic irq chips creation before publishing a domain")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 kernel/irq/generic-chip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index 2c8bc6ce082e..13b634053a3e 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -308,6 +308,7 @@ int irq_domain_alloc_generic_chips(struct irq_domain *d,
 	dgc->gc_flags = info->gc_flags;
 	dgc->exit = info->exit;
 	d->gc = dgc;
+	d->flags |= IRQ_DOMAIN_FLAG_DESTROY_GC;
 
 	/* Calc pointer to the first generic chip */
 	tmp += dgc_sz;

base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
-- 
2.25.1

