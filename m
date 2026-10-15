Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E804A015A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094966; cv=none; b=KuFZzC4KVJFSrfO4FfNL67iJGvpcPoq2w49I/7D0y/2DijaOstMJ8FA+R/NsPbQFmY6f+Hod+chTnhgWpKTn1oL3iSlEiwhn+b0qTpTsDXsjpCsc3K4oCTey3wv/RaotonfR3su3PGGE/bHRe+7KQy6oy27bJyFZb/q409R37Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094966; c=relaxed/simple;
	bh=3vT4+pcdhJcVD4Z3oSn11IvY9+bAtQf3X3KAWQIbuE0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nb+Ub0WgZVih79JiksexF2/OrnRm3wN4KH2lT6Jo+QAWUp5ic0DXzjX/9PeZguoqhYB2WBReAjN69xRnbZwnI2CkWh4DOKiNGCub5tHG1Pi3DhmvsUfTZNr/6bYep0ptyzCwmVnTeD9yoQv7HRHPVenXnmXurrkGWRzqHiJDvK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pTrEhjjZ; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pTrEhjjZ"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48dfa054f26so440276f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094961; x=1792699761; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=laM6+wZiNuYMQDtQzAoP4s+131ogUMmRLEJwdwwKDsc=;
        b=pTrEhjjZkao/gkr8ZRRphcdXpdGCCP/7CDO/PHIyaoqD9FdruInUs3+1M9usdVLA6A
         GJAhMMJs2K4yCp1cxWlt/8yhwarEds9LzTcxkIBYd+dyV/kHIqYNVnxrgYCYZyx43fPT
         ZoIXpHrOteHb1DO1u3cirX4oChm73WtVTxS4tfUz/FQ34Ct5mSi6fHuHz5OjVBZs08ZJ
         9g/p0Vkak3dAikCbMI7TRzZ0YPDhg4tSF79X5pmfMLhUxBXfQ5DBwSab9UgFrXT4jl0G
         PPLOzM4t9XzfP32McXAGGf4cDLZTJnyKYR6FMyZLiQngegp+z3KTcOe5dRWJ68ZyIy6l
         tzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094962; x=1792699762;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laM6+wZiNuYMQDtQzAoP4s+131ogUMmRLEJwdwwKDsc=;
        b=nUwdTZAObK3XdhC8+lcMaRvrHCw7aJYbEEptu5NEbtaqJ+3lAIqS+e4pnwyvxSbtd9
         bKX8fa5ARwvszakNryL2l4a1vP9l4V9rmumFOSwASITMlGMT72N3Rq3HzlFR8sW4z5NE
         bGsFVHj6jKzrYa5POys0N7xGM8k2KO1VK3igMfTNst/5p8ctLoozWxvXnRuwEcDAmsqM
         u0IFdmIM14jWHeUVkglmGPJMmmG40tuLW5mxirEhx53U4lXE9Dlg0w9N5TCe+ti/y7yY
         d3EvSKuK7RHVJKoDUUlQVo2QDvQQUVHPLoHfjcan8GdO2iHpWR3FyUxt2TWU4WiLhwiI
         N0IA==
X-Forwarded-Encrypted: i=1; AKwUvBxs4P8krpwDRXJrKW/TW/wFxo4i5uGYHCoPLw7NBkJoBdWV4yHp+IExlF8K8U/E/HoVb+wQeG2IyjWO9lE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtZ94/nhJDTLpqTJ25NkMm0R25kM0msbQ5NLWFJMJ+hZy+y/4B
	4iUr/WCaCLJ3d9ipGCFtResxW9Up/16X22tL7BZKaib0FcfhtmOxRtgrvsdrPZbQEP6i+jdHJQL
	vASn5Q6T7DxiTeA==
X-Received: from wmbd8.prod.google.com ([2002:a05:600c:58c8:b0:4a1:8444:ff6d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e4a:b0:4a1:ac66:6ac8 with SMTP id 5b1f17b1804b1-4a1c7fa065fmr12093425e9.4.1792094961525;
 Thu, 15 Oct 2026 13:09:21 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:40 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-10-smostafa@google.com>
Subject: [PATCH v9 09/25] KVM: arm64: iommu: Support DABT for IOMMU
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

The pKVM SMMUv3 driver emulates the SMMU registers for the host: the
MMIO is donated to the hypervisor so that host accesses trap, and the
hypervisor performs or rejects each access on the host's behalf.

Add a dabt_handler op and call it from the host data abort path for
aborts with a valid instruction syndrome on non-memory addresses. If
the driver emulates the access, skip the faulting instruction,
otherwise take the normal path, where hyp-owned MMIO is denied.

Only aborts with a valid instruction syndrome can be emulated, so the
host must access emulated registers with single-register loads and
stores (readl/writel and friends).

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/iommu.h |  9 +++++++++
 arch/arm64/kvm/hyp/nvhe/iommu.c         |  6 ++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c   | 17 +++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index acd5058ef3ed..bd6604f194b5 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -13,6 +13,13 @@ struct pkvm_iommu_ops {
 	 * with the same @prot, which must succeed.
 	 */
 	int (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
+	/*
+	 * Emulate a host data abort on MMIO @addr
+	 * @esr has a valid instruction syndrome and @regs holds the host x0-x30,
+	 * SRT 31 is the zero register. Return true if the access was emulated,
+	 * which would skip the instruction.
+	 */
+	bool (*dabt_handler)(struct user_pt_regs *regs, u64 esr, u64 addr);
 };
 
 int pkvm_iommu_init(void *pool_base, unsigned int nr_pages);
@@ -25,4 +32,6 @@ void *pkvm_iommu_alloc_pages(u8 order);
 /* Free pages from pkvm_iommu_alloc_pages(). */
 void pkvm_iommu_free_pages(void *ptr);
 
+bool pkvm_iommu_host_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr);
+
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu.c
index 36432bd46c78..cdf6e87bb68e 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu.c
@@ -149,3 +149,9 @@ void pkvm_iommu_free_pages(void *ptr)
 {
 	hyp_put_page(&iommu_pages_pool, ptr);
 }
+
+bool pkvm_iommu_host_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr)
+{
+	return pkvm_iommu_ops && pkvm_iommu_ops->dabt_handler &&
+	       pkvm_iommu_ops->dabt_handler(regs, esr, addr);
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index c14af6a4877c..523bb6bd793b 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -13,6 +13,7 @@
 #include <asm/kvm_pkvm.h>
 #include <asm/stage2_pgtable.h>
 
+#include <hyp/adjust_pc.h>
 #include <hyp/fault.h>
 
 #include <nvhe/arm-smccc.h>
@@ -778,6 +779,12 @@ static void host_inject_mem_abort(struct kvm_cpu_context *host_ctxt)
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
@@ -800,6 +807,16 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 	BUG_ON(!(fault.hpfar_el2 & HPFAR_EL2_NS));
 	addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
 
+	/*
+	 * Let the IOMMU driver emulate accesses to its MMIO.
+	 */
+	if (is_dabt_with_isv(esr) && !addr_is_memory(addr) &&
+	    pkvm_iommu_host_dabt_handler(&host_ctxt->regs, esr,
+					 addr | FAR_TO_FIPA_OFFSET(fault.far_el2))) {
+		kvm_skip_host_instr();
+		return;
+	}
+
 	switch (host_stage2_idmap(addr)) {
 	case -EPERM:
 		host_inject_mem_abort(host_ctxt);
-- 
2.56.0.176.g3575e65682-goog

