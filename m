Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185680;
	b=nI9nNYaeoor1uFinGxauFYyaAGeRRW25bwmPE7Y8nKz4gFGXBKZZRX99rL7FUv1USBQR
	 q9yCS2tjlYXjiZbHHYdm/C5d8XlVp19OIgiWZ4YbYbcM4vMN6X/iL2zeXOhkDCA/yI4xv
	 ZducOaAuKORHYM2UDM2Vb7jD0DFQlZt1Gwr1cquFR5Qoi3raIayB4hJmdCmPy/hycfK80
	 JANenxLnl8g/YJHnASlETlUY1EgM6JhhcYDhbXBT0R8Fg+4BXOmxz8cQmL+jmuans2/QU
	 UaF0MV/jyH6kqXBM0wBv8f+ZD9M639fkvguzx7CSmKvBIpnr+UbIIwNbDn8XDelt+JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185680;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I57WmYqdoF9/N0mkvjFnMDYVaQwsVE67uocH/WyHf5o=;
	b=RLgSJyzPqDjxBMCUD6ZJ0NxZpsl5J3YXjmhON46QXLAlGWnRsiZWlj3m8JfyHaLFdcsJ
	 VdRyS78VlS/fKiHOGQxwQgJNwF5Wq9aTz/Y70Xhrc9p5Q4v26YiraGNjh7IaZWCCzsAHy
	 chomhbQcyveCx5wVOb3s1JLUqGmLCUMPyV1TQZj3hCnYx+FQw58RDrGL2HsHmcm7viWy5
	 Fktkh8AYVxPH9GLzBY3Y8WAU3363Sz/ZfjsuOtN/l/ntr6NWmaO/n5AcbHgQrk+aiWyYz
	 P9DHK36plGpiPQylPqxdgpSPTcSMysQ7U5+ujRovLg6yxaqYcQGSynC4EhNnxHN4L8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nzrgAFB1;
	arc=none smtp.remote-ip=91.218.175.125
Received: from mta0.migadu.com (out-125.mta0.migadu.com [91.218.175.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25982606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25982606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nzrgAFB1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WkQDgAer1PteLDsIHCBdKyWZtLPPEdiBNxjMb3MjjdE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793185678; v=1; x=1793790478;
 b=nzrgAFB1EzDbWVSgkRYBmdoluq84+swjbuvmY7eTxvFF39WGdlhu4ZjhfNPXtUiM1EfCwzue
 CiEl4vuFLL8feB+SSAu4JW4A1Am2HseHKZTryAbYCHYYE+8A/7hGKDgl+FZc70XgMEBTBG8+5Iq
 2rDVjiFRwi0+rvnR6tIVO9OM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 57efae3c060c30d1;
	Wed, 28 Oct 2026 11:07:58 +0000
X-Mizu-Trace-ID: 57efae3c060c30d1
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
Subject: [PATCH v2 3/3] KVM: arm64: Disable host PMU counters for protected guests
Date: Wed, 28 Oct 2026 11:07:39 +0000
Message-ID: <20261028110739.2366566-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028110739.2366566-1-fuad.tabba@linux.dev>
References: <20261028110739.2366566-1-fuad.tabba@linux.dev>
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
However, HPME has no effect, since __pkvm_vcpu_load() sets HPMN to cover
every event counter, and HPME never covers the cycle or instruction
counter. The counters the host has enabled therefore keep counting the
guest.

Stop them in the world switch while a protected guest runs, reading
PMCNTENSET_EL0 rather than trusting the host-controlled events mask.
Gate this on system_supports_pmuv3(), as __activate_traps_common() does
for PMUSERENR_EL0.

Side channels are outside pKVM's threat model, so this is hardening
rather than a fix.

Reported-by: Oculytic <oculytic@gmail.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/switch.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 91e1edf40bcd2..f602154ab49b5 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -175,6 +175,26 @@ static void __pmu_switch_to_host(struct kvm_vcpu *vcpu)
 #define __pmu_switch_to_host(v)		do {} while (0)
 #endif
 
+static u64 __pmu_stop_host_counters(struct kvm_vcpu *vcpu)
+{
+	u64 pmcnten;
+
+	if (!vcpu_is_protected(vcpu) || !system_supports_pmuv3())
+		return 0;
+
+	pmcnten = read_sysreg(pmcntenset_el0);
+	if (pmcnten)
+		write_sysreg(pmcnten, pmcntenclr_el0);
+
+	return pmcnten;
+}
+
+static void __pmu_restore_host_counters(u64 pmcnten)
+{
+	if (pmcnten)
+		write_sysreg(pmcnten, pmcntenset_el0);
+}
+
 /*
  * Handler for protected VM MSR, MRS or System instruction execution in AArch64.
  *
@@ -282,6 +302,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	struct kvm_cpu_context *guest_ctxt;
 	struct kvm_s2_mmu *mmu;
 	bool pmu_switch_needed;
+	u64 host_pmcnten;
 	u64 exit_code;
 
 	/*
@@ -300,6 +321,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	guest_ctxt = &vcpu->arch.ctxt;
 
 	pmu_switch_needed = __pmu_switch_to_guest(vcpu);
+	host_pmcnten = __pmu_stop_host_counters(vcpu);
 
 	__sysreg_save_state_nvhe(host_ctxt);
 	/*
@@ -384,6 +406,8 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	if (pmu_switch_needed)
 		__pmu_switch_to_host(vcpu);
 
+	__pmu_restore_host_counters(host_pmcnten);
+
 	/* Returning to host will clear PSR.I, remask PMR if needed */
 	if (system_uses_irq_prio_masking())
 		gic_write_pmr(GIC_PRIO_IRQOFF);
-- 
2.47.3

