Received: from mta1.migadu.com (out-242.mta1.migadu.com [95.215.58.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30551412C14
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764450; cv=none; b=j6dhYVWVPfCH+jzL9DCyYgmshZYqTKHoHBWpIPfQdKbp9DDARgwgV06pCqOuOEEqhEPeaxnIjAeNKGYptmFCUutdanyiOrD3ZWW36Pdti4dOY1k6E/qx/4d8d8dA0Y4OATSgL6AUSAD5EJLg28lQ7BSdRZfC0YgIYp8r3Oy9jsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764450; c=relaxed/simple;
	bh=e5YsO+8ZsLtKhrtsFdAe04oYyuN2yDuSbeWKwHebfCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CL4fio48tqw+Wbg6/+3TRS/DFjysfJO3XTxGcKPP5hbMeqoG8xtUNQe/HbZoR92/W0ruylm2WSFfTDM6aeH8CFORMLVSo6Wd8b7NSa2TkDjKbRSXSiBXSKz23U1utyJA9lprMgWXkg6UhW0EHMRujlKLZVYOzF1UnyqLyIEK89I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rdABVf/L; arc=none smtp.client-ip=95.215.58.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rdABVf/L"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=e5YsO+8ZsLtKhrtsFdAe04oYyuN2yDuSbeWKwHebfCc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788764444; v=1; x=1789369244;
 b=rdABVf/LpUU/JNB6DM7sk3EDjKcxh1mMnu5sMODRTRx2MAMzTdXJrWahxVVcfPNw0YPSBzg7
 DPmmzUU/5lqUWkiGJZ094Mb1BOEVgquYJ58nf7+jyyI2ydCi/L4KtSzKkBFGyAKfG12dh0FDK9K
 m5iExw6/SRopGIdN6P2kAISw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9921440fffa01d34;
	Mon, 07 Sep 2026 07:00:44 +0000
X-Mizu-Trace-ID: 9921440fffa01d34
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
Subject: [PATCH v2 05/17] KVM: arm64: Add {flush,sync}_hyp_timer_state() primitives
Date: Mon,  7 Sep 2026 07:59:50 +0100
Message-Id: <20260907070002.3333525-6-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907070002.3333525-1-fuad.tabba@linux.dev>
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marc Zyngier <maz@kernel.org>

A protected guest's virtual timer is programmed from EL2's own copy of
the state and read back there, so the host can't change the guest's
deadline. cntvoff_el2 is zeroed, so the guest's virtual time is the
physical time.

The flush also preserves the guest's CNTV and CNTP CVAL/CTL across the
host's full-context copy into the hyp vCPU, until the per-EC
marshalling patch removes that copy.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index aeff6ded40fd6..9f697f51c76c9 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -154,6 +154,33 @@ static void sync_hyp_vgic_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 		host_cpu_if->vgic_lr[i] = hyp_cpu_if->vgic_lr[i];
 }
 
+static void flush_hyp_timer_state(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		return;
+
+	/* A hyp vcpu has no offset, and sees vtime == ptime. */
+	write_sysreg(0, cntvoff_el2);
+	write_sysreg_el0(__vcpu_sys_reg(&hyp_vcpu->vcpu, CNTV_CVAL_EL0),
+			 SYS_CNTV_CVAL);
+	isb();
+	write_sysreg_el0(__vcpu_sys_reg(&hyp_vcpu->vcpu, CNTV_CTL_EL0),
+			 SYS_CNTV_CTL);
+}
+
+static void sync_hyp_timer_state(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		return;
+
+	/*
+	 * Preserve the vtimer state so that it is always correct,
+	 * even if the host tries to make a mess.
+	 */
+	__vcpu_assign_sys_reg(&hyp_vcpu->vcpu, CNTV_CVAL_EL0, read_sysreg_el0(SYS_CNTV_CVAL));
+	__vcpu_assign_sys_reg(&hyp_vcpu->vcpu, CNTV_CTL_EL0, read_sysreg_el0(SYS_CNTV_CTL));
+}
+
 static void __copy_vcpu_state(const struct kvm_vcpu *from_vcpu,
 			      struct kvm_vcpu *to_vcpu)
 {
@@ -255,7 +282,17 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 		hyp_vcpu->vcpu.arch.mdcr_el2 = host_vcpu->arch.mdcr_el2;
 		hyp_vcpu->vcpu.arch.iflags = host_vcpu->arch.iflags;
 	} else {
+		u64 v_cval = hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTV_CVAL_EL0];
+		u64 v_ctl = hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTV_CTL_EL0];
+		u64 p_cval = hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTP_CVAL_EL0];
+		u64 p_ctl = hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTP_CTL_EL0];
+
 		hyp_vcpu->vcpu.arch.ctxt = host_vcpu->arch.ctxt;
+
+		hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTV_CVAL_EL0] = v_cval;
+		hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTV_CTL_EL0] = v_ctl;
+		hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTP_CVAL_EL0] = p_cval;
+		hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTP_CTL_EL0] = p_ctl;
 	}
 
 	/* __hyp_running_vcpu must be NULL in a guest context. */
@@ -270,6 +307,7 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	hyp_vcpu->vcpu.arch.vsesr_el2 = host_vcpu->arch.vsesr_el2;
 
 	flush_hyp_vgic_state(hyp_vcpu);
+	flush_hyp_timer_state(hyp_vcpu);
 
 	hyp_vcpu->vcpu.arch.pid = host_vcpu->arch.pid;
 
@@ -318,6 +356,7 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu, u32 exit_reason)
 	host_vcpu->arch.hcr_el2 |= hyp_vcpu->vcpu.arch.hcr_el2 & HCR_VSE;
 
 	sync_hyp_vgic_state(hyp_vcpu);
+	sync_hyp_timer_state(hyp_vcpu);
 
 	hyp_vcpu->exit_code = exit_reason;
 }
-- 
2.39.5

