Received: from mta0.migadu.com (out-75.mta0.migadu.com [91.218.175.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60D148F83E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407940; cv=none; b=aDAZm5IDpSI5BcYmKz9u0mAIB6yP6gOsM2EHn1wt6qvN0zhqAHaXmvgSY3WRS3Lma6Vd6AmqZN7N7Zcl2HXpVUDUfLUoC2VVPDIyGP38978Alen6AT6+3DipLG384wQhFhtv6zaJOCmDf9I4hiNWj5M7ljl0p9CHGM5R5Yebgsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407940; c=relaxed/simple;
	bh=PrgyValbiyYMTfVMJESIc+fLfCQaV5hw9qbA3T1oo9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ljlzs4IKkSFBzW1YK842gHhI4qE6u0W6N+NeZWsZ9kbrXt0pbrjSHCtZN0DYoWHIxstoqqak3Hc2qSFA2cvHFN5jGrKH9kgH05lHR4/OB7Fwriuk8xYrtwIqdLeEBgMcVSvRuC7fC4PG9X4UZyUme5a3w08HqbtNRyZpO6BaypE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mZh3roxx; arc=none smtp.client-ip=91.218.175.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mZh3roxx"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PrgyValbiyYMTfVMJESIc+fLfCQaV5hw9qbA3T1oo9Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789407936; v=1; x=1790012736;
 b=mZh3roxx6BOjRcOhw8+Vh+gPXdJBh5Ry1ClvHQEBqTHfXsoypJg6N5nQlYg8KV/N5YGz/QxB
 pHJ5RhZ2D3NFe1QubA4hCtMxpccuAxmfiow2GMbD6JqCKTxoBvvccIPjbAA220jqQnx0E7/nLNm
 KAImMHyMquTxRv4FjkKAJOTc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a45841c83f61cc60;
	Mon, 14 Sep 2026 17:45:22 +0000
X-Mizu-Trace-ID: a45841c83f61cc60
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com
Subject: [PATCH] KVM: arm64: Reject the stage-2 MMU pointer hypercalls under pKVM
Date: Mon, 14 Sep 2026 18:45:21 +0100
Message-Id: <20260914174521.832575-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The five hypercalls that take a struct kvm_s2_mmu pointer remain
callable after pKVM finalises, and each dereferences the host pointer
in __load_stage2(). Under pKVM none of them has a valid caller: the
host walks no guest stage-2, its TLB flushes go through the handle-based
__pkvm_tlb_flush_vmid, and kvm_arch_vcpu_load() skips the CPU context
flush.

Reject all five when protected mode is enabled.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260914130152.F0D5F1F000FF@smtp.kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    No in-tree host path reaches these, so no Fixes: tag.

 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9a3b92e626adb..4b0d00e55e2ea 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -557,6 +557,9 @@ static void handle___kvm_tlb_flush_vmid_ipa(struct kvm_cpu_context *host_ctxt)
 	DECLARE_REG(phys_addr_t, ipa, host_ctxt, 2);
 	DECLARE_REG(int, level, host_ctxt, 3);
 
+	if (unlikely(is_protected_kvm_enabled()))
+		return;
+
 	__kvm_tlb_flush_vmid_ipa(kern_hyp_va(mmu), ipa, level);
 }
 
@@ -566,6 +569,9 @@ static void handle___kvm_tlb_flush_vmid_ipa_nsh(struct kvm_cpu_context *host_ctx
 	DECLARE_REG(phys_addr_t, ipa, host_ctxt, 2);
 	DECLARE_REG(int, level, host_ctxt, 3);
 
+	if (unlikely(is_protected_kvm_enabled()))
+		return;
+
 	__kvm_tlb_flush_vmid_ipa_nsh(kern_hyp_va(mmu), ipa, level);
 }
 
@@ -576,6 +582,9 @@ handle___kvm_tlb_flush_vmid_range(struct kvm_cpu_context *host_ctxt)
 	DECLARE_REG(phys_addr_t, start, host_ctxt, 2);
 	DECLARE_REG(unsigned long, pages, host_ctxt, 3);
 
+	if (unlikely(is_protected_kvm_enabled()))
+		return;
+
 	__kvm_tlb_flush_vmid_range(kern_hyp_va(mmu), start, pages);
 }
 
@@ -583,6 +592,9 @@ static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
 
+	if (unlikely(is_protected_kvm_enabled()))
+		return;
+
 	__kvm_tlb_flush_vmid(kern_hyp_va(mmu));
 }
 
@@ -602,6 +614,9 @@ static void handle___kvm_flush_cpu_context(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
 
+	if (unlikely(is_protected_kvm_enabled()))
+		return;
+
 	__kvm_flush_cpu_context(kern_hyp_va(mmu));
 }
 

base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5

