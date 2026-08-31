Received: from mta1.migadu.com (out-32.mta1.migadu.com [95.215.58.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0CE4A0F02
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194121; cv=none; b=J7T/+70bf3vDMzEo2b6JVVhq2Mk6Jc7PVwAwA4XpBetvNgVJDaRz44RBjoWX1gEn+6BSZP3qDL2r2Ig9iP1sa5MaZPYWKPWL6hz4gST1yeRff4WjSMvXJnzWvlqVc/7WK9saQpAhJ9VacSlJMT2ilv4EboA3io6O/57pxS1xaZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194121; c=relaxed/simple;
	bh=VS8GZgRjJ2h0GcotosxCkgRTqdb5O2AjYDV7/AEn/aU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NyGTco7mWdi4+oD5OW7hmt080UDosNPsVijxoG7nPsLS0MA1OHev/IXT3lEHCDninGTbYdli0LNlwCv7RYKtq9N8lZ/fTVKnraisdt4PH6kvr/Oe/vAO/v563Kdd87mvE6UAds5++I+wCqsnV6N5jR2YbDDePd9LQe0ub+aFNMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qNGKroay; arc=none smtp.client-ip=95.215.58.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qNGKroay"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VS8GZgRjJ2h0GcotosxCkgRTqdb5O2AjYDV7/AEn/aU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788194117; v=1; x=1788798917;
 b=qNGKroayC9UoNo4dWH0ifzT+wVz6P9xaF8Dl51m5W8JmiSMuK1xuoZLbeQidLza+FYTmMoz2
 Hvz4OtCXS0DaTbVmesljfYMVDLlf7Pv11oHwU9KOhPTXsAEj/eImqHpijDw+CbstUJJtiHtWyKv
 Ijkcr8eGFXAp1pucqtNaiUBI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9236023ace9825dd;
	Mon, 31 Aug 2026 16:35:16 +0000
X-Mizu-Trace-ID: 9236023ace9825dd
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 15/17] KVM: arm64: Reject host access to protected VM private state
Date: Mon, 31 Aug 2026 17:34:19 +0100
Message-Id: <20260831163421.272420-16-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260831163421.272420-1-fuad.tabba@linux.dev>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A protected vCPU's register and debug state is no longer exposed to
the host. Host ioctls that would reach that state now fail rather
than operate on a copy that is not the guest's:

  - KVM_GET_ONE_REG and KVM_SET_ONE_REG return -EPERM once the vCPU has
    run: the copy then holds reset values plus what the exit handlers
    marshal out. Pre-run access still builds the guest's boot state.
  - KVM_ARM_VCPU_INIT returns -EPERM once the vCPU has run: it would
    reset the host copy alone and rewrite mp_state, which EL2 reads
    only at hyp vCPU creation, so a vCPU the guest powered off would
    come back RUNNABLE.
  - KVM_SET_VCPU_EVENTS rejects external-abort injection with -EPERM;
    SError injection is forwarded and stays permitted.
  - KVM_SET_GUEST_DEBUG returns -EPERM: a protected guest's debug state
    is hypervisor-owned.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/arm.c   |  7 +++++++
 arch/arm64/kvm/guest.c | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 3e00edce23a99..8caacdd4de020 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1750,6 +1750,13 @@ static int kvm_arch_vcpu_ioctl_vcpu_init(struct kvm_vcpu *vcpu,
 	bool power_off = false;
 	int ret;
 
+	/*
+	 * Re-init would reset the host copy alone and rewrite mp_state
+	 * after EL2 has read it. Pre-run init stays allowed.
+	 */
+	if (kvm_vm_is_protected(vcpu->kvm) && vcpu_has_run_once(vcpu))
+		return -EPERM;
+
 	/*
 	 * Treat the power-off vCPU feature as ephemeral. Clear the bit to avoid
 	 * reflecting it in the finalized feature set, thus limiting its scope
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 23f725e2cf745..3a0ea2ae4a307 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -701,6 +701,10 @@ int kvm_arm_copy_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
 
 int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
+	/* Once the vCPU has run, the host copy is not the guest's state. */
+	if (kvm_vm_is_protected(vcpu->kvm) && vcpu_has_run_once(vcpu))
+		return -EPERM;
+
 	/* We currently use nothing arch-specific in upper 32 bits */
 	if ((reg->id & ~KVM_REG_SIZE_MASK) >> 32 != KVM_REG_ARM64 >> 32)
 		return -EINVAL;
@@ -718,6 +722,10 @@ int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 
 int kvm_arm_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
+	/* Writes build the boot state; once run, EL2 owns the registers. */
+	if (kvm_vm_is_protected(vcpu->kvm) && vcpu_has_run_once(vcpu))
+		return -EPERM;
+
 	/* We currently use nothing arch-specific in upper 32 bits */
 	if ((reg->id & ~KVM_REG_SIZE_MASK) >> 32 != KVM_REG_ARM64 >> 32)
 		return -EINVAL;
@@ -786,6 +794,13 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 	u64 esr = events->exception.serror_esr;
 	int ret = 0;
 
+	/*
+	 * EL2 injects an external abort only to complete a forwarded abort.
+	 * SError injection is forwarded.
+	 */
+	if (kvm_vm_is_protected(vcpu->kvm) && ext_dabt_pending)
+		return -EPERM;
+
 	/*
 	 * Immediately commit the pending SEA to the vCPU's architectural
 	 * state which is necessary since we do not return a pending SEA
@@ -883,6 +898,10 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 {
 	trace_kvm_set_guest_debug(vcpu, dbg->control);
 
+	/* A protected guest's debug state is not exposed to the host. */
+	if (kvm_vm_is_protected(vcpu->kvm))
+		return -EPERM;
+
 	if (dbg->control & ~KVM_GUESTDBG_VALID_MASK)
 		return -EINVAL;
 
-- 
2.39.5

