Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CF630EF8F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788748860; cv=none; b=SOdrhQ5BiJC5YGCRggrJfG52oKETDIGlOOdxetoSRmwd8zxgDD/NpEWXHNQiPD+lXhRzM5CF5ogiYjXmGcZzmXjYEMnpi230YXk4JylGtEuk0G+PSWt1qjJMdc79JfyOHeSFJPfruWwJZvlQ8CRmroPglmur2JF+Oxxj1YZqt/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788748860; c=relaxed/simple;
	bh=ZuesSl7eoekQFqwz5U/xtDEqO5oEGMST0BXlc85grYY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mnGAjfaOHeKnYPGHsUI64FKnG2pV8Gx22M7cAWI7EgMFAh7BFLlyCA59GlcZIRR77vyPren7rJ9h5SkXmxD2XOAWVaNDQ478Zpky0cPhsMY2AyHXXm/U4IDvvPTdozbN82L9xDGoBt56iqJYV+oFXiXTUnqo2+RqwOrV1E+UUsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8a5e175caa6511f19a56ed5b684f684d-20260907
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:96d6bc66-d284-4c00-8854-150dde7bb2d5,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:7db8b62,CLOUDID:485baa5c7f0e7fa972a8131d24825df5,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:1|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8a5e175caa6511f19a56ed5b684f684d-20260907
X-User: fuqingshuang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fuqingshuang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 569164611; Mon, 07 Sep 2026 10:40:51 +0800
From: Qingshuang Fu <fuqingshuang@kylinos.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: [PATCH v3 1/3] irqdomain: Set IRQ_DOMAIN_FLAG_DESTROY_GC in __irq_domain_instantiate()
Date: Mon,  7 Sep 2026 10:40:44 +0800
Message-Id: <20260907024046.28845-2-fuqingshuang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260907024046.28845-1-fuqingshuang@kylinos.cn>
References: <20260907024046.28845-1-fuqingshuang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a driver uses irq_domain_instantiate() with dgc_info to create
generic irq chips, IRQ_DOMAIN_FLAG_DESTROY_GC is required so that
irq_domain_remove() can clean up those generic chips.

All existing in-tree callers manually set this flag today, but this
pattern is error-prone. A future new caller forgetting to set the flag
would leave generic chips allocated by irq_domain_alloc_generic_chips()
leaked on domain removal.

Set IRQ_DOMAIN_FLAG_DESTROY_GC right after
irq_domain_alloc_generic_chips() succeeds inside
__irq_domain_instantiate().  This makes automatic cleanup the default
for all users that provide dgc_info via irq_domain_instantiate().

This is the correct location for the flag because:

  - irq_domain_instantiate() is a high-level wrapper which internally
    allocates the generic chips, so it should also take responsibility
    for arranging their cleanup.

  - Setting the flag in irq_domain_alloc_generic_chips() would affect
    legacy callers like __irq_alloc_domain_generic_chips(), some of
    which have custom cleanup paths that manually free the generic
    chips (e.g. gpio-tb10x does kfree(domain->gc) before
    irq_domain_remove()), leading to use-after-free.

Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 kernel/irq/irqdomain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 57c819da30c2..4fdcb6df5306 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -344,6 +344,7 @@ static struct irq_domain *__irq_domain_instantiate(const struct irq_domain_info
 		err = irq_domain_alloc_generic_chips(domain, info->dgc_info);
 		if (err)
 			goto err_domain_free;
+		domain->flags |= IRQ_DOMAIN_FLAG_DESTROY_GC;
 	}
 
 	if (info->init) {
-- 
2.25.1

