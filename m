Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B95511E7A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784715; cv=none; b=FStr5yXuYW1H+O7Y3hvkmXgIvp6TkaNPxyMPzBPMU5A+dC9OXFCBjONQQuQn2GjcfF12bk/vfWt9MyKCrj8GK/km7XsEYxbqjXgYTNmOGSmy5xjycKcP0EnO9raSP3L8Om59iH1u18cafd6NjgepIJ1RzajncsI6nUvUqeUnHeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784715; c=relaxed/simple;
	bh=mhiFQi2dBjObRl78LuvvVUQq6uT6vsfGTPWbqHb1j5A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u1UH23aoemco7eC1j8RmmQfbhhn3zcC3J1P8dr0kz20BLhfG7RLtQw9YYI36JFrZ5cjcty0DsvAeb3MjaVK9wihkFHh9ldwCt2fqJ//xkbjIL/rQVDevVb9N1zTUBXIKzk29RqNDuR7qiTE6Y7mjXFYrQ65P6yIkQqIFOJxLJX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ttEWMnmS; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ttEWMnmS"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D694B497;
	Wed, 30 Sep 2026 09:11:46 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 71BED3F85F;
	Wed, 30 Sep 2026 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790784710; bh=mhiFQi2dBjObRl78LuvvVUQq6uT6vsfGTPWbqHb1j5A=;
	h=From:To:Cc:Subject:Date:From;
	b=ttEWMnmSP+6hHJupnRbWqBuLe3k7hhK9BEZF9Apx/uxB3FrC1oGaqpdwFswGrGgxD
	 lKqC70LTIm4hrWpX20oUDdjXYBbgv7OcpUcwgzwLz4PaLZha6HWRBLOfLW1Sa3Y09Z
	 wfDNKf8Fb2fHd7UT5AWnjnHFWjDL3afPo5Z1n1dE=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	maz@kernel.org,
	tglx@kernel.org,
	radu@rendec.net
Subject: [PATCH] irqchip/gic-v3: Ensure change to DS is visible
Date: Wed, 30 Sep 2026 17:11:23 +0100
Message-Id: <20260930161123.46368-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reported missing GIC synchronization when the
FLAGS_WORKAROUND_INSECURE path modifies DS. Specifically, an immediate
read of the DS state after the write might not observe the effect of
that write, which can lead to misreporting the DS state.

Updates to the DS bit are tracked by RWP, so poll it after the write
before proceeding to read back the DS state.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 drivers/irqchip/irq-gic-v3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc..181f6eb11732 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -164,6 +164,7 @@ static inline bool gic_dist_security_disabled(void)
 
 static bool cpus_have_security_disabled __ro_after_init;
 static bool cpus_have_group0 __ro_after_init;
+static void gic_dist_wait_for_rwp(void);
 
 static void __init gic_prio_init(void)
 {
@@ -179,6 +180,7 @@ static void __init gic_prio_init(void)
 			val = readl_relaxed(gic_data.dist_base + GICD_CTLR);
 			val |= GICD_CTLR_DS;
 			writel_relaxed(val, gic_data.dist_base + GICD_CTLR);
+			gic_dist_wait_for_rwp();
 
 			ds = gic_dist_security_disabled();
 			if (ds)
-- 
2.34.1

