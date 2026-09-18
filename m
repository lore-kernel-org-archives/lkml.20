Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C393513550
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748075; cv=none; b=m205Bf57szdzwELfQuUvC33mFjVPc4XEIilaA7KtSAoGTSVzJjIsiVQyTsvO5kkN0rG1pYyD5+4rJ4ijnXSuLIk8R0R11PzhdkHetH09xB7ZS/fXv8TsFj2nvwapab8W+Ub5tFS1q+f+L31rxCrutkSwiht56EkyZuGuF4YcEfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748075; c=relaxed/simple;
	bh=/MNpjrsAdeuGBr8lafXjVrXztBQBNQ9r8wMeiWGBFZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggqpM5b0xU5X5iBzBLPtkOTIxeq92Fmff/DBIQeQ84w+Zn8hY4eITJs0pY0kNGfR7/I5j14zXgEBnlx4q3js2ppNH+LE/4jdzg+sNCPa7UwGMBn+w9wVNyYtoUgxZRROK0UMeMRn/qrTLxOELBPpZAzWXLH91jLdxtFizsK3Wgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2FrRP/u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2FrRP/u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C651F0089A;
	Fri, 18 Sep 2026 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748073;
	bh=2tB1KkXkaU5QmWVylv9lGv4ky5kgG3UAVpPmpa8Uw3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z2FrRP/uuCgfSvknfub0VLAy0QKjf0HMfhws0VgGmRM40vLVDGdAQfPs0Fc8Ql4H9
	 xi1hQrIyyIi3VgRo+Qx0mLrMkRRauAt+aKSCSILzyoi+pbWICaAE8D33XDWiZ5DBBB
	 DsofAeVnKxVJ0hcMm0LypJhxiy1eVgUwiMdpzPSVKUbQHiWbELkxUANc/+6rMR98Jm
	 vKoJYf10/mdQ8lYdLlZoC//ub3yliJaIgYDssRyayNTAqO6Z4Jd/A3zgY+qlXT2IoU
	 fVf13W1KBziWhUy2WtTRZVBDsAju8ljxebcLGO8/fCOQ+2clCC2RLvfqvcch8m6OzL
	 TKsVdmCuJf5iQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 05/21] KVM: arm64: Protect TPIDRRO_EL0 across guest entry/exit
Date: Fri, 18 Sep 2026 17:13:49 +0100
Message-ID: <20260918161407.2300-6-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mostafa Saleh <smostafa@google.com>

To prepare for using TPIDRRO_EL0 to hold 'current' and repurposing
SP_EL0 as an overflow stack pointer, eagerly switch both registers when
entering and exiting the guest.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_asm.h           | 10 ++++++++++
 arch/arm64/kernel/asm-offsets.c            |  1 +
 arch/arm64/kvm/hyp/entry.S                 | 12 ++++++++----
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h |  2 --
 4 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index e5b92ac09e69..1cfe9216a2ff 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -408,6 +408,16 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr, u64 elr_virt,
 	msr	sp_el0, \tmp
 .endm
 
+.macro save_tpidrro_el0 ctxt, tmp
+	mrs	\tmp,	tpidrro_el0
+	str	\tmp,	[\ctxt, #CPU_TPIDRRO_EL0_OFFSET]
+.endm
+
+.macro restore_tpidrro_el0 ctxt, tmp
+	ldr	\tmp,	  [\ctxt, #CPU_TPIDRRO_EL0_OFFSET]
+	msr	tpidrro_el0, \tmp
+.endm
+
 #endif
 
 #endif /* __ARM_KVM_ASM_H__ */
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 6038ab3beb25..cb8448cc5f51 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -108,6 +108,7 @@ int main(void)
   DEFINE(VCPU_HCR_EL2,		offsetof(struct kvm_vcpu, arch.hcr_el2));
   DEFINE(CPU_USER_PT_REGS,	offsetof(struct kvm_cpu_context, regs));
   DEFINE(CPU_ELR_EL2,		offsetof(struct kvm_cpu_context, sys_regs[ELR_EL2]));
+  DEFINE(CPU_TPIDRRO_EL0_OFFSET, offsetof(struct kvm_cpu_context, sys_regs[TPIDRRO_EL0]));
   DEFINE(CPU_RGSR_EL1,		offsetof(struct kvm_cpu_context, sys_regs[RGSR_EL1]));
   DEFINE(CPU_GCR_EL1,		offsetof(struct kvm_cpu_context, sys_regs[GCR_EL1]));
   DEFINE(CPU_APIAKEYLO_EL1,	offsetof(struct kvm_cpu_context, sys_regs[APIAKEYLO_EL1]));
diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
index 308100ed25de..4c89931a6a92 100644
--- a/arch/arm64/kvm/hyp/entry.S
+++ b/arch/arm64/kvm/hyp/entry.S
@@ -30,8 +30,9 @@ SYM_FUNC_START(__guest_enter)
 	// Store the hyp regs
 	save_callee_saved_regs x1
 
-	// Save hyp's sp_el0
+	// Save hyp's sp_el0 and tpidrro_el0
 	save_sp_el0	x1, x2
+	save_tpidrro_el0 x1, x2
 
 	// Now the hyp state is stored if we have a pending RAS SError it must
 	// affect the host or hyp. If any asynchronous exception is pending we
@@ -66,8 +67,9 @@ alternative_else_nop_endif
 	// when this feature is enabled for kernel code.
 	ptrauth_switch_to_guest x29, x0, x1, x2
 
-	// Restore the guest's sp_el0
+	// Restore the guest's sp_el0 and tpidrro_el0
 	restore_sp_el0 x29, x0
+	restore_tpidrro_el0 x29, x0
 
 	// Restore guest regs x0-x17
 	ldp	x0, x1,   [x29, #CPU_XREG_OFFSET(0)]
@@ -146,8 +148,9 @@ SYM_INNER_LABEL(__guest_exit, SYM_L_GLOBAL)
 	// Store the guest regs x18-x29, lr
 	save_callee_saved_regs x1
 
-	// Store the guest's sp_el0
+	// Store the guest's sp_el0 and tpidrro_el0
 	save_sp_el0	x1, x2
+	save_tpidrro_el0 x1, x2
 
 	adr_this_cpu x2, kvm_hyp_ctxt, x3
 
@@ -161,8 +164,9 @@ SYM_INNER_LABEL(__guest_exit, SYM_L_GLOBAL)
 	// mte_switch_to_hyp(g_ctxt, h_ctxt, reg1)
 	mte_switch_to_hyp x1, x2, x3
 
-	// Restore hyp's sp_el0
+	// Restore hyp's sp_el0 and tpidrro_el0
 	restore_sp_el0 x2, x3
+	restore_tpidrro_el0 x2, x3
 
 	// Now restore the hyp regs
 	restore_callee_saved_regs x2
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index c382848d3194..b5f7ef8e6371 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -66,7 +66,6 @@ static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
 static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
-	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
 }
 
 static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
@@ -209,7 +208,6 @@ static inline void __sysreg_restore_common_state(struct kvm_cpu_context *ctxt)
 static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
 {
 	write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL0),	tpidr_el0);
-	write_sysreg(ctxt_sys_reg(ctxt, TPIDRRO_EL0),	tpidrro_el0);
 }
 
 static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
-- 
2.55.0.1082.g2b9226bbc0-goog

