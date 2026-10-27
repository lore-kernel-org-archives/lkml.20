Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088719;
	b=3MOkHQu7sYLDM+OWLjmueC3TcfTILBvkxzaM6hrxS/2Aaz/tUrE7dWJJFfw9vgIpcOYM
	 g+wLGBCN73WjsvGMmpKqGiulN9jdCjvaQrHG+UDc3ojQt1FG+Sf34sxUtkqzbQHXpvSiN
	 wmjvQOZmLW4KYyxxkPJInSSZH6egSoyPm5kgkVGpwXMUjC7PmaQrjgBG/2XHj2vfEUFC6
	 FIUrzKZNMbct2gUnp3Z9BMDBUM0npNodeiod8DvOUuC742wAICs1DAzAGrWZMfQ9Jeapp
	 Fql5Ol7UPgs6iuKgcCjzPQnvM3eQhuQvVGBPtGkMUmVPHFGU/f6TfI+ioffiPS1XaQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088719;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eYU7nRUviv0PRMWv8pLk4R1PsyRqoA4jjfpx6F91JbE=;
	b=dyTgIOLk8xEvc4pgRgs7EWl0ooBSZi+qb6WwkOAv9oFBGi9Znr1C7W0hTxpK9u0nt9Sa
	 m8Iz3t1P4rryOlYGcagSwx++8vMxH4h0Vg7WfAdVIgzOmsfOXaFQQRQ5KigVz571Wxqyx
	 D8Vq+PXeoO40ZIxyS+EdrN/eD/HtSXPzfesOAv0fVATuFr2SHYgnsKzZgjapWjvFOTrjx
	 du18U2bw2cxy40KnPlfnAplHgAFMbsg+0EXhQTT6yYS5+1zHF6M57/mNuZL4kTs+eXGFO
	 L2FEPd90xz5bEGbagjj8AgguEHgPcEG9qYugekAdtQWtd7kAEOvZOOYDcridgVBOPKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bH9hg+ds;
	arc=none smtp.remote-ip=91.218.175.230
Received: from mta0.migadu.com (out-230.mta0.migadu.com [91.218.175.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6975C606A329
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6975C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bH9hg+ds
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5fNaLh6y2LRSzbC19B0rdBidBP/uTWp/P3MFJPydJ4g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793088716; v=1; x=1793693516;
 b=bH9hg+dsFfFLMaoyqNOIZXbMcYS9djHUYeYqmmJ/WFwBCRFCCRLz4m8r8LgHqSHjNUHaLV8a
 bsBwKoTFMNiPK1U1cvRtSxpz5w7bNnl/q9xr3MYdZameHhnxOiutmE45XQZtkhy5xvMPkc1zhS0
 ozDLZLrbBGNWuGu9P2PhjXjA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id de9eea40cfde8985;
	Tue, 27 Oct 2026 08:11:56 +0000
X-Mizu-Trace-ID: de9eea40cfde8985
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
Subject: [PATCH 2/3] KVM: arm64: Pass the PMU events to the hyp vCPU of non-protected guests
Date: Tue, 27 Oct 2026 08:11:46 +0000
Message-ID: <20261027081147.498183-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027081147.498183-1-fuad.tabba@linux.dev>
References: <20261027081147.498183-1-fuad.tabba@linux.dev>
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

From: Oliver Upton <oliver.upton@linux.dev>

Before every run, the host records in vcpu->arch.pmu.events which perf
counters to disable and enable around guest entry, and
__pmu_switch_to_guest() applies them at EL2. Since commit be66e67f1750
("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()"),
protected mode runs the hyp vCPU instead, and flush_hyp_vcpu() never
copies the events into it. So the counters backing a non-protected
guest's PMU are never enabled, and every counter the guest reads stays
at 0, the cycle counter included. The host's counters that exclude
guests keep counting the guest as well.

Copy the events into the hyp vCPU of a non-protected guest on every run.
The events only exist with CONFIG_HW_PERF_EVENTS, so the copy is built
under it. Like mdcr_el2, they're host-controlled and never reach a
protected guest.

Fixes: be66e67f1750 ("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()")
Link: https://lore.kernel.org/all/20240305184840.636212-2-oliver.upton@linux.dev/
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
[Fuad: non-protected copy only, tested on the hyp vCPU, under
 CONFIG_HW_PERF_EVENTS, new message]
Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index d715aa942577e..28a292deecb64 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -690,6 +690,16 @@ static void sync_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 		host_vcpu->arch.external_debug_state = hyp_vcpu->vcpu.arch.external_debug_state;
 }
 
+#ifdef CONFIG_HW_PERF_EVENTS
+static void flush_pmu_state(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		hyp_vcpu->vcpu.arch.pmu.events = hyp_vcpu->host_vcpu->arch.pmu.events;
+}
+#else
+static void flush_pmu_state(struct pkvm_hyp_vcpu *hyp_vcpu) {}
+#endif
+
 static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
@@ -698,6 +708,7 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	fpsimd_sve_flush();
 	flush_debug_state(hyp_vcpu);
+	flush_pmu_state(hyp_vcpu);
 
 	/*
 	 * If we deal with a non-protected guest and the state is potentially
-- 
2.47.3

