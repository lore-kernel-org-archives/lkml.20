Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2433A6B71
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505821; cv=none; b=MXa79BiC5uzQWxmFYdHuu7XFrPGMwERx5EyCiW/swMmTN86VvcM3ACBWIpUMx9FZ23tIQe+VFHxYTpX2xni71+2i9a37bhy6y8laDKiVbMVk6RTAjsQHiZd04A0zn2zLqbboGfdrbxNTFM/c9xeBhxXkxjLNBrVCuUpXg0Gv68M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505821; c=relaxed/simple;
	bh=0n3SeuWz+jrJBGC8FjIi6Ivz/KIfgPWW7xOk9ijrA/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lU8Z83VYJF89uIjhUTayAwcMu1gy2RNlsmwYNtpjHoI/LT/rJbwnIOrdMSlK5JggnmS7BbRcifIxIJuOOiUttVGoBW8NenjNAPFgQC7gm+AnxmlG3FBmr420AE3LSohbtPfcOmNe1g1y2I9IWFjcRuTPsVsTeu6qZHgDVAxvYjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: aab67022a82f11f19a56ed5b684f684d-20260904
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:0f83db59-2027-49ca-bd55-6e0cad45a651,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:7db8b62,CLOUDID:5a928cc535eae8bccb325ba5557fc0f1,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:1|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aab67022a82f11f19a56ed5b684f684d-20260904
X-User: fuqingshuang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fuqingshuang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 91244237; Fri, 04 Sep 2026 15:10:10 +0800
From: Qingshuang Fu <fuqingshuang@kylinos.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: [PATCH v2] irqdomain: Auto-set IRQ_DOMAIN_FLAG_DESTROY_GC in __irq_domain_instantiate()
Date: Fri,  4 Sep 2026 15:09:43 +0800
Message-Id: <20260904070943.934476-1-fuqingshuang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260902065939.441981-1-fuqingshuang@kylinos.cn>
References: <20260902065939.441981-1-fuqingshuang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a driver uses irq_domain_instantiate() with dgc_info to create
generic irq chips, the domain is expected to automatically clean up
the generic chips when irq_domain_remove() is called. However,
__irq_domain_instantiate() does not set the IRQ_DOMAIN_FLAG_DESTROY_GC
flag which is required by irq_domain_remove() to trigger cleanup.

Currently all existing callers of irq_domain_instantiate() with dgc_info
manually set this flag, which is error-prone. If a future caller forgets to
set the flag, generic chips allocated by irq_domain_alloc_generic_chips()
will leak on domain removal.

Set IRQ_DOMAIN_FLAG_DESTROY_GC right after irq_domain_alloc_generic_chips()
succeeds inside __irq_domain_instantiate().

This makes automatic cleanup the default for all users that provide
dgc_info via irq_domain_instantiate().

This is the correct location for several reasons:
- irq_domain_instantiate() is a high-level wrapper which internally
  allocates the generic chips, so it should also take responsibility
  for arranging their cleanup.
- Automatically setting the flag inside irq_domain_alloc_generic_chips()
  would affect legacy callers like __irq_alloc_domain_generic_chips(),
  some of which perform custom manual cleanup and could hit use-after-free.

Fixes: e6f67ce32e8e ("irqdomain: Add support for generic irq chips creation before publishing a domain")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
Changes in v2:
- Move setting of IRQ_DOMAIN_FLAG_DESTROY_GC from irq_domain_alloc_generic_chips()
  into the info->dgc_info branch inside __irq_domain_instantiate(), as suggested.
  This avoids unconditional flag-setting which could cause use-after-free for
  legacy drivers with custom generic chip cleanup paths.

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

base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
-- 
2.25.1

