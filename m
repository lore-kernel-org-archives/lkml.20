Received: from mta0.migadu.com (out-199.mta0.migadu.com [91.218.175.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6238444701
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385713; cv=none; b=c48rz65CFWtvYGZgZzUC/dhEsC5AuRteOgBBq4uMWRXWno6T5rFb+J/wvoT4xYp5FgYtPQP3dEwwbCWvxtFEw6qL0I8uB3Vfy9XfKkZFoAZBIPM3aY55DIfn4XLMBOb0Lgo7tVRDsyMsE6UwzGK/9L6d1XYE8tfBwGXNl+cOnZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385713; c=relaxed/simple;
	bh=4yfN1gycnb44ryNru42szUE7VLGbmxLWNo36QO1dLZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XBtr1dYpdfLigqLC01vbmf9pImYfVK8toZuYwi/ojVlZLBixgNLB5ZYu8YMt8at3blTspnmkjO28DQvIBLBEeBd0cDQpLC6djoOnkG+/JDyaji52mpQlUpmxopi/v1dcf7rxhugWV+34M5M4pLRfH5vwLMVemHEED4H0lJKgLEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h/R1SvUw; arc=none smtp.client-ip=91.218.175.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h/R1SvUw"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4yfN1gycnb44ryNru42szUE7VLGbmxLWNo36QO1dLZM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789385709; v=1; x=1789990509;
 b=h/R1SvUwuN31UE31Nxh9gTG53YtHCS0W31mFfA3NxyF83p9SjIPIn7zx56H6JwY6eSnsze5f
 oM5pHEL38uJriQFmEP4AhxUJC4cANSOxWOJaTk8GeKm4gHhCJSzyYg5Tf8b0CZFphzadhaR1n+4
 hEuURaNzi/vGu/SnQtf7YKvA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bc666f73e4b472fb;
	Mon, 14 Sep 2026 11:35:08 +0000
X-Mizu-Trace-ID: bc666f73e4b472fb
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
	steven.price@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com
Subject: [PATCH v3 12/18] KVM: arm64: Prevent host PC adjustments for protected vCPUs
Date: Mon, 14 Sep 2026 12:33:32 +0100
Message-Id: <20260914113338.159227-13-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260914113338.159227-1-fuad.tabba@linux.dev>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__kvm_adjust_pc() lets the host advance a vCPU's PC or inject an
exception, which for a protected vCPU would let the host redirect
guest execution. Drop the request there: the entry handlers apply the
host's PC_UPDATE_REQ on re-entry, where EL2 allows it.

__kvm_adjust_pc() adjusts the vCPU a get/put pair returns, the one it
was given outside pKVM. Both host callers hold the vCPU mutex, so a
hyp vCPU loaded for the vCPU is loaded on the calling CPU. The request
for a loaded protected vCPU is dropped. For a loaded non-protected
vCPU, PKVM_HOST_STATE_DIRTY selects the copy, since adjusting the hyp
vCPU while the host copy is authoritative loses the update at the next
flush. Adjusting the hyp vCPU copies PC_UPDATE_REQ in and back out
again: without the copy back, INCREMENT_PC outlives the adjustment and
the next KVM_SET_VCPU_EVENTS trips WARN_ON(INCREMENT_PC) in
kvm_pend_exception(). With no hyp vCPU loaded, as under
KVM_SET_VCPU_EVENTS, the host copy is adjusted as before.

Until the marshalling patch clears PC_UPDATE_REQ on the host copy at
exit, a KVM_RUN that returns to userspace with INCREMENT_PC set leaves
it on the host copy of a loaded protected vCPU, and a
KVM_SET_VCPU_EVENTS before the next run then trips that WARN_ON.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/exception.c             | 21 +++++++++-----
 arch/arm64/kvm/hyp/include/hyp/adjust_pc.h | 19 +++++++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c         | 32 ++++++++++++++++++++++
 3 files changed, 65 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
index 6e60d890afa4a..7ea62e5304ae9 100644
--- a/arch/arm64/kvm/hyp/exception.c
+++ b/arch/arm64/kvm/hyp/exception.c
@@ -353,12 +353,19 @@ static void kvm_inject_exception(struct kvm_vcpu *vcpu)
  */
 void __kvm_adjust_pc(struct kvm_vcpu *vcpu)
 {
-	if (vcpu_get_flag(vcpu, PENDING_EXCEPTION)) {
-		kvm_inject_exception(vcpu);
-		vcpu_clear_flag(vcpu, PENDING_EXCEPTION);
-		vcpu_clear_flag(vcpu, EXCEPT_MASK);
-	} else if (vcpu_get_flag(vcpu, INCREMENT_PC)) {
-		kvm_skip_instr(vcpu);
-		vcpu_clear_flag(vcpu, INCREMENT_PC);
+	struct kvm_vcpu *target = pkvm_adjust_pc_get(vcpu);
+
+	if (!target)
+		return;
+
+	if (vcpu_get_flag(target, PENDING_EXCEPTION)) {
+		kvm_inject_exception(target);
+		vcpu_clear_flag(target, PENDING_EXCEPTION);
+		vcpu_clear_flag(target, EXCEPT_MASK);
+	} else if (vcpu_get_flag(target, INCREMENT_PC)) {
+		kvm_skip_instr(target);
+		vcpu_clear_flag(target, INCREMENT_PC);
 	}
+
+	pkvm_adjust_pc_put(vcpu, target);
 }
diff --git a/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h b/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
index a4fb04faa7d09..94ba768996032 100644
--- a/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
+++ b/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
@@ -68,4 +68,23 @@ static inline void kvm_skip_host_instr(void)
 	write_sysreg_el2(read_sysreg_el2(SYS_ELR) + 4, SYS_ELR);
 }
 
+/*
+ * Under pKVM, the vCPU __kvm_adjust_pc() adjusts for @vcpu (NULL drops the
+ * request), and the copy of the consumed PC_UPDATE_REQ back to @vcpu.
+ */
+#ifdef __KVM_NVHE_HYPERVISOR__
+struct kvm_vcpu *pkvm_adjust_pc_get(struct kvm_vcpu *vcpu);
+void pkvm_adjust_pc_put(struct kvm_vcpu *vcpu, struct kvm_vcpu *target);
+#else
+static inline struct kvm_vcpu *pkvm_adjust_pc_get(struct kvm_vcpu *vcpu)
+{
+	return vcpu;
+}
+
+static inline void pkvm_adjust_pc_put(struct kvm_vcpu *vcpu,
+				      struct kvm_vcpu *target)
+{
+}
+#endif
+
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index da8ab636063cf..1dcc75261dc08 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -642,6 +642,38 @@ static void handle___pkvm_host_mkyoung_guest(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) =  ret;
 }
 
+/*
+ * PKVM_HOST_STATE_DIRTY names the authoritative copy, the host's when set.
+ * A loaded protected vCPU takes the request at its next entry instead.
+ */
+struct kvm_vcpu *pkvm_adjust_pc_get(struct kvm_vcpu *vcpu)
+{
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+
+	if (!is_protected_kvm_enabled())
+		return vcpu;
+
+	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+	if (!hyp_vcpu || hyp_vcpu->host_vcpu != vcpu)
+		return vcpu;
+
+	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		return NULL;
+
+	if (vcpu_get_flag(vcpu, PKVM_HOST_STATE_DIRTY))
+		return vcpu;
+
+	vcpu_copy_flag(&hyp_vcpu->vcpu, vcpu, PC_UPDATE_REQ);
+	return &hyp_vcpu->vcpu;
+}
+
+/* Reflect the consumed request back, otherwise it stays pending. */
+void pkvm_adjust_pc_put(struct kvm_vcpu *vcpu, struct kvm_vcpu *target)
+{
+	if (target != vcpu)
+		vcpu_copy_flag(vcpu, target, PC_UPDATE_REQ);
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
-- 
2.39.5

