Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6D354CF53
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082799; cv=none; b=NfvwSIZOQrhF/ZYrjCMTWTlaXJjfUj53f1nkhXZKkXmEGV/WlljvCjObfkZi6ipTUmqB6Aqrrai/Zr75dKnCJiB4B2uJMZov+9R9CIdVSImH4ZvY+GoC41UYMx519YlAZ2mrJvxfv8zSFjB8hHqpKGEDjkquoSdOJE/WVfkEAeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082799; c=relaxed/simple;
	bh=qTLWLGQbIRcfgnEXNW0MOl1wFesZy4OYnqx+TTEz3Fo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NHMVSKcqes9wWE8NH5HUviNtP5mrkQQR2xR3x43mEtYGGaFsSxY1J50JXW+ZKOUresiSTbbkUmjJtAvId08a63uWI8WDrWSbcB5EqZ1f9H6LxNJXFPt9u9E6TvDsB0wF4oXjv+5eg7CpexGe836YmlYw8TBua+fauXUKj83Uj2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S6CX2+8z; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S6CX2+8z"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49ccfad90f1so27433265e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082793; x=1790687593; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7lwUocssBorXppr+cuEfwSHFlo2ooUh5GMt4e7kXAU=;
        b=S6CX2+8zofbG5CMG/7oFInbydvt4QO69gAKiVyJIB/BSrh+HPYtQiwWwwXishep5dN
         Hy7X5vVXT3CmWqsB/OOSw72rjqLC2knWB50qq9TEMXDnOSHkcczebA2bWY0/tGRiF3ne
         huBbMptk9XSPiNojS8NYqYSOHPCD8/51r2RHI/2G+lyBqoqafH9tlXd/5J0IICM0/bEf
         QPtI0t6ULBpIT3DtEV5U/FGBYvFtRA6DSEi7NONe32pk8HjtcDhNG3JMfhaDG0T9LKFo
         FPJCHEdaZCwoRDUcQVkPZymTfW17z4o410npN7L17WZmcTOe1Sb9pKCbLMk5B91WCmy2
         dsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082793; x=1790687593;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7lwUocssBorXppr+cuEfwSHFlo2ooUh5GMt4e7kXAU=;
        b=t4IcF9IWoKwAbhRd+0+/X3t6ghmfl6SsMBNvsqq+lSFFQvp+oW0g4P3i7PB8QQ6HKf
         Phl4eumCfeZVun4/vNFsD9L/TWlchc9cKBnDMqSDV/kxx7siNAZWr+to9C57sLMUY/q7
         /yDQvOUBHOqjXLoZWr1HMcpG6pmSJkEGaXFM9jJmG17B+m2kb8rtYUSRFkw7VpdaORw2
         Q842VrHEeFZ0ZnqEGUhjd9gu+gwjg3aOqJmrrs0pVKEjRhjAEmX31RUcTTu41qsKOX0I
         BdK4e6XPpoe/4Wx3/MR6MzH2zVZz5Lu1t0lJSSVOtkMOGlJdArPhshPxfAmYucsvSyko
         1lmw==
X-Forwarded-Encrypted: i=1; AKwUvBw+CMfO+UvIKeaZJ9OeUh9AJCV3W/lpA6c83BUHZjSuS2L4eh3fe4rtXJOmv9i/v1bnAgFiY1ve1Zw7mdg=@vger.kernel.org
X-Gm-Message-State: AFuF++n7U34CAppnr0r5uUQdLmzMYmpGL6ypYH4d63XAPqrEQ/nkG7CI
	PUKbNLRNuFL0W4zyO+RQIPk4GYLzhgZ4XZ1Mw8wF0kr7THjCnfFTuJyeC2usl9XcnfEy1cy8xLq
	3uGTtElMwen3hHw==
X-Received: from wmco6.prod.google.com ([2002:a05:600c:a306:b0:49d:3263:b3be])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1989:b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49fc5714d14mr205647445e9.11.1790082793037;
 Tue, 22 Sep 2026 06:13:13 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:42 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-10-smostafa@google.com>
Subject: [PATCH v8 09/25] KVM: arm64: iommu: Support DABT for IOMMU
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

The pKVM SMMUv3 driver needs to trap and emulate access to the MMIO
space of the SMMUv3 to provide emulation for the kernel driver.

Add a handler for DABTs for IOMMU drivers to be able to do so.
In case the host causes a data abort, check if it's part of IOMMU
emulation first.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/iommu.h |  2 ++
 arch/arm64/kvm/hyp/nvhe/iommu.c         | 14 ++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c   | 15 +++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 1fa728ab47d4..3f16879b5fa7 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -7,6 +7,7 @@
 struct pkvm_iommu_ops {
 	int (*init)(void);
 	int (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
+	bool (*dabt_handler)(struct user_pt_regs *regs, u64 esr, u64 addr);
 };
 
 int pkvm_iommu_init(void *pool_base, unsigned int nr_pages);
@@ -18,5 +19,6 @@ int pkvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
 void *pkvm_iommu_alloc_pages(u8 order);
 /* Free pages from pkvm_iommu_alloc_pages(). */
 void pkvm_iommu_free_pages(void *ptr);
+bool pkvm_iommu_host_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr);
 
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu.c
index cacab0dc462a..b7b11f6616cd 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu.c
@@ -5,8 +5,11 @@
  * Copyright (C) 2022 Linaro Ltd.
  */
 #include <linux/iommu.h>
+#include <asm/kvm_hyp.h>
 #include <asm/kvm_pkvm.h>
 
+#include <hyp/adjust_pc.h>
+
 #include <nvhe/iommu.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/spinlock.h>
@@ -158,3 +161,14 @@ void pkvm_iommu_free_pages(void *ptr)
 {
 	hyp_put_page(&iommu_pages_pool, ptr);
 }
+
+bool pkvm_iommu_host_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr)
+{
+	if (pkvm_iommu_ops && pkvm_iommu_ops->dabt_handler &&
+	    pkvm_iommu_ops->dabt_handler(regs, esr, addr)) {
+		/* DABT handled by the driver, skip to next instruction. */
+		kvm_skip_host_instr();
+		return true;
+	}
+	return false;
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index da5014e4e96b..863c571e47e4 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -758,6 +758,12 @@ static void host_inject_mem_abort(struct kvm_cpu_context *host_ctxt)
 	inject_host_exception(esr);
 }
 
+static bool is_dabt_with_isv(u64 esr)
+{
+	return (ESR_ELx_EC(esr) == ESR_ELx_EC_DABT_LOW) &&
+		(esr & ESR_ELx_ISV);
+}
+
 void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 {
 	struct kvm_vcpu_fault_info fault;
@@ -780,6 +786,15 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 	BUG_ON(!(fault.hpfar_el2 & HPFAR_EL2_NS));
 	addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
 
+	/*
+	 * Emulate data aborts for IOMMU drivers, other access will be denied
+	 * by host_stage2_adjust_range()
+	 */
+	if (is_dabt_with_isv(esr) && !addr_is_memory(addr) &&
+	    pkvm_iommu_host_dabt_handler(&host_ctxt->regs,
+					 esr, addr | FAR_TO_FIPA_OFFSET(fault.far_el2)))
+		return;
+
 	switch (host_stage2_idmap(addr)) {
 	case -EPERM:
 		host_inject_mem_abort(host_ctxt);
-- 
2.55.0.1082.g2b9226bbc0-goog

