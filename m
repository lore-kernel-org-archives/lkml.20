Received: from mta1.migadu.com (out-216.mta1.migadu.com [95.215.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0CF3DFC61
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266531; cv=none; b=jXzoWmDAK2TILiOKfdnZvv72/Xw3HfY/Yb0jO30MjoNWD3h5iRKSb9a5mZHJiPMhUAL5RI0eUji0C0vSQJFcputOntNHhU8RbsoIzcTMTRN9k7OziPE1Vbub50Hzx2xkgQL3zV3lCJv7aV69NTHPvCad+UGRzZFEsZqMv+x1Sj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266531; c=relaxed/simple;
	bh=bbqKbCVQWUtgUYZiQExxW9IUx9sKykumuGPzmEQ+fcs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W8qOLnqGIsmwrg3s56RWbioJpi2TzZcd9p33ji05P7vCvvWqy/JlixK4SxTAsqdS6LrfzyFbMs6bUukoYyEs1tj+E3+68Fcczxnen8YaTSqTGH0teg0/2aqreJbi4XD48MVVMPYnr/cgZZ82z7LCysbRGvXAqX/3LpzOKQne7J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=f4plrYL1; arc=none smtp.client-ip=95.215.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f4plrYL1"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bbqKbCVQWUtgUYZiQExxW9IUx9sKykumuGPzmEQ+fcs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790266528; v=1; x=1790871328;
 b=f4plrYL15OXVvNdzAl11rF4fVQ8a6/2QHeLxaVsXGLz9cTHrkmmjDXQwwoQJDUB2KNGn8asM
 FVlE3XB35JdfCdKG4im7wyQEvuERRmt96HjltvJZAisFPVvCeJBLlmVKxNUoneZwtDu+x64pfzg
 2zXFoHaAGRVGPM0oEJ7PX5ts=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 29c0e88ef0365e47;
	Thu, 24 Sep 2026 16:15:28 +0000
X-Mizu-Trace-ID: 29c0e88ef0365e47
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] irqchip/gic-v3-its: Don't free a vPE table shared with another ITS
Date: Thu, 24 Sep 2026 17:15:12 +0100
Message-Id: <20260924161514.1112730-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260924161514.1112730-1-fuad.tabba@linux.dev>
References: <20260924161514.1112730-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On GICv4.1, its_alloc_tables() copies a sibling's vPE table baser
rather than allocating one, but its_free_tables() frees it like the
rest. A probe failure on the copying ITS then frees pages the enabled
sibling still points GITS_BASER2 at, and the kernel comes up running
on that sibling.

Mark a shared table so its_free_tables() skips it.

Fixes: 5e5168461c22c ("irqchip/gic-v4.1: VPE table (aka GICR_VPROPBASER) allocation")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index e9807af235373..58e52095e6ea8 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -87,6 +87,8 @@ struct its_baser {
 	u64		val;
 	u32		order;
 	u32		psz;
+	/* Inherited from a sibling ITS, not freed here */
+	bool		shared;
 };
 
 struct its_device;
@@ -2604,7 +2606,8 @@ static void its_free_tables(struct its_node *its)
 
 	for (i = 0; i < GITS_BASER_NR_REGS; i++) {
 		if (its->tables[i].base) {
-			its_free_pages(its->tables[i].base, its->tables[i].order);
+			if (!its->tables[i].shared)
+				its_free_pages(its->tables[i].base, its->tables[i].order);
 			its->tables[i].base = NULL;
 		}
 	}
@@ -2703,6 +2706,7 @@ static int its_alloc_tables(struct its_node *its)
 				WARN_ON(i != 2);
 				if ((sibling = find_sibling_its(its))) {
 					*baser = sibling->tables[2];
+					baser->shared = true;
 					its_write_baser(its, baser, baser->val);
 					continue;
 				}
-- 
2.39.5

