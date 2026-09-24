Received: from mta0.migadu.com (out-90.mta0.migadu.com [91.218.175.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186CB3D75C4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266533; cv=none; b=LY2bvIs6oUTMxrdSVgHY+dBPDzCDu6Mkj8wHw6mI74iyAPl4cp8ItNHLyHwRQbu+CUc8ZuWjUreJ958jHBZCoYwwOjENWgtDtu1P2AT3Y/0l8MVXVijTOuz3WqUVRiVIa4TqewV8mNoeqQQVJ4amnCqGpXs+QX5yzAD+y0Uiw84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266533; c=relaxed/simple;
	bh=Gcr8hLNdqy1k42dqWVISdXk8rlCA5k+esFk5lI0c9bw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UpWqmHGjVgIfv3dseznbWhjXDLwwZKu8VVHFsvhdLRIgeBqRLbRadWf5xDPYblhMST04Rgsf1AW+kPYDyOJkAMV4XQWTQjryYTCcszYK0LyyOzYxeCywhVB/eDMM6+m/1PrqSaiFjtP6xC8lMpuURoKNqnq/d5be1DpcT7WsIsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JL33j6Hm; arc=none smtp.client-ip=91.218.175.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JL33j6Hm"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Gcr8hLNdqy1k42dqWVISdXk8rlCA5k+esFk5lI0c9bw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790266528; v=1; x=1790871328;
 b=JL33j6HmHVnLW12Ol2vofCR0nt/NadgzqC/PJ7yaOgUsLNA3y/0RUoy6iy7FoxVMurPuMw6J
 63oMbKA1swJtmU6F1VhnX5rZBHNvdqXmkkoPoLgZr55pZidZGpL/MiiYoN8WKq7N7ye9HCDOxD4
 OmORBOoStX1iq+NsY4L9gWNE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ed8d07410b9191b1;
	Thu, 24 Sep 2026 16:15:28 +0000
X-Mizu-Trace-ID: ed8d07410b9191b1
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
Subject: [PATCH 2/3] irqchip/gic-v3-its: Don't free the tables of an enabled ITS
Date: Thu, 24 Sep 2026 17:15:13 +0100
Message-Id: <20260924161514.1112730-3-fuad.tabba@linux.dev>
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

its_probe_one() enables the ITS before its_init_domain(), the last step
that can fail, and the unwind from there frees the tables and the
command queue without disabling it. The kernel comes up with an enabled
ITS pointing at freed pages.

Enable the ITS last. Nothing reaches the new domain before then: this
runs from init_IRQ(), and the ITS joins its_nodes only after the enable.

Fixes: 4c21f3c26ecc2 ("irqchip: GICv3: ITS: DT probing and initialization")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 58e52095e6ea8..a5690721f0feb 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5332,16 +5332,18 @@ static int __init its_probe_one(struct its_node *its)
 	}
 
 	gits_write_cwriter(0, its->base + GITS_CWRITER);
+
+	err = its_init_domain(its);
+	if (err)
+		goto out_free_collection;
+
+	/* Enable last: the unwind frees memory an enabled ITS may access */
 	ctlr = readl_relaxed(its->base + GITS_CTLR);
 	ctlr |= GITS_CTLR_ENABLE;
 	if (is_v4(its))
 		ctlr |= GITS_CTLR_ImDe;
 	writel_relaxed(ctlr, its->base + GITS_CTLR);
 
-	err = its_init_domain(its);
-	if (err)
-		goto out_free_collection;
-
 	raw_spin_lock(&its_lock);
 	list_add(&its->entry, &its_nodes);
 	raw_spin_unlock(&its_lock);
-- 
2.39.5

