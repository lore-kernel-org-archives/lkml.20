Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201534;
	b=tMxU34vAogwqw4Afu9nwwEKEm4K1ZpgkihmqZAe7thlpIA0nYgZItB7pReFbSnYi1B9V
	 I6vh5L9EylYThF6VTXaqhF5b5k6hvtBlw8Ln8dVgXMV3VkF1ypbmHBKoOy4OGw2HyfNcP
	 3niK67JQ6rv17p5p5LHYhv1Yp+jDjX73jkzFMngdB/p3HlaxGFH4m+DyrtANGeOH3mgD8
	 vzhQedmKV7TOPCFZ96ZnQFezpyl0emgEwJqgMZbflm24OWPBPK/nQEK23UoBKlbPE7gIv
	 nkE0WvN2ZiFZwnChAdGM0Qj1Vb7vVYjAmQmc9iEwqR1v4X+jz2jYJcLX0FGHKR6qhtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201534;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Jf9o5ALa0aH8v3eseKK4dcnBI+6AQV7EtQWnwTYCkd8=;
	b=Z4Ppth3EPY+UMP+i6lq2CAcLz94yZ/sGT8RD6t+a6102BZ46QfEEBxCtgngrAikMfqib
	 SaYVE6pLBiR3lFbPWLJwxydTmllH26AK/nzoA5GIeXABUVp1MBVl565TdaqLAx+jjzhMp
	 CfCthIdCYXSU1tTkeg9bsKwpGe0zvpSHMNJm3T70IEIABV7s2SDh5A8KKSI98ANgj4i74
	 vGbN7bQTTCg7lhR3+KdAQrHF17bOE0HNEK+uX21GzP//DecEcf4BHjsfM9PfXZ/30YSvg
	 FPNvZus9/WCJhsZGAXANsmk5c3w2UQSosVK363YH7CVihUI2tz8uJFc56SJjLPgjvbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="JOVpw/kd";
	arc=none smtp.remote-ip=91.218.175.23
Received: from mta0.migadu.com (out-23.mta0.migadu.com [91.218.175.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C6D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87C6D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JOVpw/kd
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=l0zERwZtSXMxkg1YrAMkeKkP4CDuD4jEFbJgtN9PQgU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793201531; v=1; x=1793806331;
 b=JOVpw/kdgoTC7HorSI+raphfMCNVHbHqVQnK/zsKwJSrxxcTTyg358yAQwwIHrZIet+uFo9X
 cJjCFyxhTxf8MohwgahL6optYxuQb4NTjEIXKX5nMzAFoxFpRoxfT8/ZK5BiG3Ao51J4TAO15Sa
 Fk0abCRPrp/7FPgfqYHHolLA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c1b98ceec568d8e8;
	Wed, 28 Oct 2026 15:32:11 +0000
X-Mizu-Trace-ID: c1b98ceec568d8e8
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Oculytic <oculytic@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v3 3/3] KVM: arm64: Disable host PMU counters for protected guests
Date: Wed, 28 Oct 2026 15:31:52 +0000
Message-ID: <20261028153152.1740044-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028153152.1740044-1-fuad.tabba@linux.dev>
References: <20261028153152.1740044-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A protected guest has no PMU, and EL2 clears MDCR_EL2.HPME for it.
However, __pkvm_vcpu_load() sets HPMN to cover every event counter, so
HPME has no effect and the counters the host has enabled keep counting
the guest.

Clear PMCR_EL0.E in the world switch while a protected guest runs, which
stops them all. Gate this on system_supports_pmuv3(), as
__activate_traps_common() does for PMUSERENR_EL0.

Side channels are outside pKVM's threat model, so this is hardening
rather than a fix.

Reported-by: Oculytic <oculytic@gmail.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/switch.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 91e1edf40bcd2..003469e85ed46 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -175,6 +175,26 @@ static void __pmu_switch_to_host(struct kvm_vcpu *vcpu)
 #define __pmu_switch_to_host(v)		do {} while (0)
 #endif
 
+static u64 __pmu_stop_host_counters(struct kvm_vcpu *vcpu)
+{
+	u64 pmcr;
+
+	if (!vcpu_is_protected(vcpu) || !system_supports_pmuv3())
+		return 0;
+
+	pmcr = read_sysreg(pmcr_el0);
+	if (pmcr & ARMV8_PMU_PMCR_E)
+		write_sysreg(pmcr & ~ARMV8_PMU_PMCR_E, pmcr_el0);
+
+	return pmcr;
+}
+
+static void __pmu_restore_host_counters(u64 pmcr)
+{
+	if (pmcr & ARMV8_PMU_PMCR_E)
+		write_sysreg(pmcr, pmcr_el0);
+}
+
 /*
  * Handler for protected VM MSR, MRS or System instruction execution in AArch64.
  *
@@ -283,6 +303,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	struct kvm_s2_mmu *mmu;
 	bool pmu_switch_needed;
 	u64 exit_code;
+	u64 host_pmcr;
 
 	/*
 	 * Having IRQs masked via PMR when entering the guest means the GIC
@@ -300,6 +321,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	guest_ctxt = &vcpu->arch.ctxt;
 
 	pmu_switch_needed = __pmu_switch_to_guest(vcpu);
+	host_pmcr = __pmu_stop_host_counters(vcpu);
 
 	__sysreg_save_state_nvhe(host_ctxt);
 	/*
@@ -384,6 +406,8 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	if (pmu_switch_needed)
 		__pmu_switch_to_host(vcpu);
 
+	__pmu_restore_host_counters(host_pmcr);
+
 	/* Returning to host will clear PSR.I, remask PMR if needed */
 	if (system_uses_irq_prio_masking())
 		gic_write_pmr(GIC_PRIO_IRQOFF);
-- 
2.47.3

