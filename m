Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E959C3E6DC9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788748862; cv=none; b=KVJQsMyS5Kr6GlY6b7hJpoCjVMISUD9pqtUC1NS5c0lvs0+Wavj3HcbZ6BFyrDqNtdPZDdP4kOooitk9VOGrd0KIiB9Cq8zesB3kmip4K0W66z+X8tkgKTJNVZrxitsad/WIGoLZOunUFW+H7ExXma33N28zrx+UCD0AqEZvieA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788748862; c=relaxed/simple;
	bh=FYFljn+KerzI9lJNqX2LM1vqKAbDtOTcn/GA3wYyCyA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FtM5yX+4AjfVSV0+nZBU/+IKcqwIKNBeaEHW/IDnvKLS56q63FKDZzefoVxI5vbMVBDPWXeA8DJ66tjm1bKuIWJPXSw4kv0/DDCBOXEFgWtpbGgguR/JzH1daQlRb81sM5bSwP6CAFs6YNhhj7VI0WHwE7t4SK7XfpbxUJtRNa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8a30e00caa6511f19a56ed5b684f684d-20260907
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:28062592-fb68-4b48-896e-31db5e837f3e,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:7db8b62,CLOUDID:cbed50981217df20958f569d16f72865,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:1|19
	|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8a30e00caa6511f19a56ed5b684f684d-20260907
X-User: fuqingshuang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fuqingshuang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 190124723; Mon, 07 Sep 2026 10:40:51 +0800
From: Qingshuang Fu <fuqingshuang@kylinos.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: [PATCH v3 0/3] irqdomain: Auto-set IRQ_DOMAIN_FLAG_DESTROY_GC and remove redundant flag from drivers
Date: Mon,  7 Sep 2026 10:40:43 +0800
Message-Id: <20260907024046.28845-1-fuqingshuang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series makes __irq_domain_instantiate() automatically set
IRQ_DOMAIN_FLAG_DESTROY_GC when dgc_info is supplied, avoiding future
memory-leak pitfalls for new callers.

There is no runtime bug in current mainline; all existing in-tree users
already set this flag manually. Patches 2-3 remove those redundant flag
assignments from driver code which uses irq_domain_instantiate().

Note: Some drivers set IRQ_DOMAIN_FLAG_DESTROY_GC with legacy
irq_domain_create_linear() and irq_alloc_domain_generic_chips() APIs
(e.g. renesas-irqc). Those are untouched because they do not go
through __irq_domain_instantiate().

Changes since v2:
 - Drop the Fixes tag, as there is no present-day bug.
 - Turn into patchset, add driver cleanup patches.
 - Reword commit message to clarify risk applies to future callers only.

v2 thread: <https://lore.kernel.org/all/20260904070943.934476-1-fuqingshuang@kylinos.cn/>

Qingshuang Fu (3):
  irqdomain: Set IRQ_DOMAIN_FLAG_DESTROY_GC in __irq_domain_instantiate()
  irqchip/lan966x-oic: Drop redundant IRQ_DOMAIN_FLAG_DESTROY_GC
  soc/fsl/qe: qe_ports_ic: Drop redundant IRQ_DOMAIN_FLAG_DESTROY_GC

 kernel/irq/irqdomain.c                     | 1 +
 drivers/irqchip/irq-lan966x-oic.c          | 1 -
 drivers/soc/fsl/qe/qe_ports_ic.c           | 1 -
 3 files changed, 1 insertion(+), 2 deletions(-)


base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.25.1

