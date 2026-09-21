Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0475B488766
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988464; cv=none; b=JLNF2E7PPFSc+A5zitD55TwouGQ/AL4kHAacHJF/34PDY0t8+9kfSRskCPsv3KtBoz9v79gMwvEqPwoE/XFC0skHf887NN46cAlFqe4GAy14Xx8DqI2v58tood7lPvpSZoGTYVa1Yd0vwSVeG3a0eKTKWn+GnnUlhP/UJWoKMiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988464; c=relaxed/simple;
	bh=nq6c2HIL7smpOLcesIc5VsHG9EFe4PxsntTqAaTUuBA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uxcn1JQAeuJStJMN/WnMsgprH5g6ga+lOlc29j/n+DctIC6eQNjhSZ39wRlSJCGoEU7f8K30qRIIWCLEhz92fimw+PtHfIpsNo0uur8atk/1kNxNv2qLUtg1ic7qoowBunmQli19CFlHIRplJ9pNrLCoWH9D57+BcdQatISJeQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jo+/E8bc; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jo+/E8bc"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6aa1c4f3001so3829127a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988459; x=1790593259; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U06rcgIn0LVt5Do84ZIYuayP7YCGGpRPbIbmdcyZosY=;
        b=jo+/E8bcBPYZBTDMteRnOWdS8I4C3eHA5hUsw+cky15J/5G7BRyTzWo/J+M80/0w1R
         Ir287JkavtljC0NP2nhfWflwM72QexeqJPFmldGjE/bYXMs5CNzNCKovyjazcyvkT7Cc
         G+ttrAPZ/uGLV6Xu3G6ZnGIE0M9sMUg5geSo5RRE6Oz8RswsZnl2Z7Qnb1fkkhBdVXX/
         3p023XKdCkkQf3+r7UtWwijOtJxDm/JGjki15glYO1ZKf4jXtRc32kFWX/19GHbnTLJY
         7kN3d2oEBZlK1tpu+8NYOv4oMJeYddorgGVWcB2BSSFTGNXpu7JtgKTq/8jyisAxsUf9
         9j1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988459; x=1790593259;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U06rcgIn0LVt5Do84ZIYuayP7YCGGpRPbIbmdcyZosY=;
        b=wfjMowJTxKE9fg+KTP8ZDjWtJ3Hyt7UWMZO9R9dIkMB4i7xquzGcxnWk7pV1Yx+dQN
         zZo0jEVmcPktwQEZy8Tg8yi6ZPczjINN0pxk6x4J6cakYxulXKJdWlSLNOfSn/SJcNvI
         w+4lSjk6q0BbWAiV7LTPI4k7/kdrlJmba/JfzI9KyFUUo0lBx4YWNH7+dvW3pOdw385s
         enNpJ1SDpBIGRhD41LZMsRhwZ1Pe98NlCgWFJnINFkx4EXsY8QbVRtc2VOzYUMtDe/wA
         rA7Lh9qOB8aEm1jzDYgONB3/LnZXc3byBtgOppOJHUdRNF6yDQ8/xkrDLVLGthwQ6bnK
         yo9w==
X-Forwarded-Encrypted: i=1; AKwUvByCQZkVOmg9ARQPK7q0EEtZDXvYfkNkL963N3+tZBmMuVsClBZY9RNRqZZm5udGv4uJKbdfBcslmPpd8lA=@vger.kernel.org
X-Gm-Message-State: AFuF++nWIfIlavxW8b4ZoYZYkfksHsXqOwBKs+WHck351ZwKF+GbcNo8
	7kGUEGzlblDRcY0sG/UjuYUQG3UPRg8f5QG2Vh24f6qzLgCdiQNjJwvNxAiESgVaRJJQSBgEyHM
	pJlDGYFJUutY4yBLPm6wtqg==
X-Received: from edea12.prod.google.com ([2002:a05:6402:a18c:b0:6a6:1a9:f70f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:23d5:b0:6a5:f814:2278 with SMTP id 4fb4d7f45d1cf-6aa577f5a1dmr7324139a12.2.1789988458556;
 Mon, 21 Sep 2026 04:00:58 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:44 +0100
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921110050.3977591-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-3-vdonnefort@google.com>
Subject: [PATCH v2 2/8] arm64: Introduce can_set_direct_map_range()
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

For systems where can_set_direct_map() is false, it is still possible
that a subregion of the direct map can be modified if it is mapped at
the last-level. Add an implementation for can_set_direct_map_range(). It
falls back to a page table walk to verify the mapping level if
can_set_direct_map() is false.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/set_memory.h |  3 ++
 arch/arm64/mm/pageattr.c            | 50 +++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 0091ba12200e..80bb94a340fd 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -9,6 +9,9 @@
 bool can_set_direct_map(void);
 #define can_set_direct_map can_set_direct_map
 
+bool can_set_direct_map_range(struct page *page, unsigned long numpages);
+#define can_set_direct_map_range can_set_direct_map_range
+
 int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 132938b32eb1..5fcdb292905f 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -102,6 +102,56 @@ bool can_set_direct_map(void)
 		arm64_kfence_can_set_direct_map() || is_realm_world();
 }
 
+static int can_set_direct_map_pud_entry(pud_t *pud, unsigned long addr,
+					unsigned long next, struct mm_walk *walk)
+{
+	if (pud_leaf(pudp_get(pud)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int can_set_direct_map_pmd_entry(pmd_t *pmd, unsigned long addr,
+					unsigned long next, struct mm_walk *walk)
+{
+	if (pmd_leaf(pmdp_get(pmd)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int can_set_direct_map_pte_hole(unsigned long addr, unsigned long next,
+				       int depth, struct mm_walk *walk)
+{
+	return -EINVAL;
+}
+
+static const struct mm_walk_ops can_set_direct_map_ops = {
+	.pud_entry	= can_set_direct_map_pud_entry,
+	.pmd_entry	= can_set_direct_map_pmd_entry,
+	.pte_hole	= can_set_direct_map_pte_hole,
+};
+
+bool can_set_direct_map_range(struct page *page, unsigned long numpages)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+	unsigned long end = addr + numpages * PAGE_SIZE;
+
+	if (can_set_direct_map())
+		return true;
+
+	if (!numpages)
+		return false;
+
+	/*
+	 * If !can_set_direct_map() then no one can split blocks and it is safe
+	 * to walk the page-table lockless.
+	 */
+	return !walk_kernel_page_table_range_lockless(addr, end,
+						      &can_set_direct_map_ops,
+						      NULL, NULL);
+}
+
 static int update_range_prot(unsigned long start, unsigned long size,
 			     pgprot_t set_mask, pgprot_t clear_mask)
 {
-- 
2.55.0.1082.g2b9226bbc0-goog

