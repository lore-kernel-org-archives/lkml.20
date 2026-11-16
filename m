Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854432;
	b=ThNQ3VApBjOic+T2r5mLbUDA+0No3J8Xp2pXMPgTsYj9XH7284EZwS5aBzz5c5z/4KLh
	 AdaOINCXNKiqLCMyWN7OgZAgP2V1+14ECwCif+8bV624JV1+JVoe9IFNp8rS2w0AChS8n
	 lfWNTqE44xzIcNoluVhRQP6En67GOFKWgom0i+BKbwSXAKF2CAy+SKLjN87cM/AIKtka3
	 3yFVIfO6AVoD7dsQo0ZjMH9aiugg7RexK1Vtlu53VzfGvj8V0XAXz1rI4gsxzW/lk8Dv+
	 vl6BDlByDjG5vMmSNYR+7EawnrUTRHdMcZhPeDZdo6FgUof2oqBdS4/I3lRmTimUPLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854432;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=0RxqszkmvXVOoT1teVc41az1ULR27EKd8OFXQ2iVvJQ=;
	b=Aw3EvAt82e6+W5+WBYN0ztXl01v6DlrK5Ps3exln1Vqw269pasZsC6YSOXGxhi4bJI6M
	 xuOTOy0sITmqhoNlsqHlMH/+uXUSBOuF75z3rraDO8xciRHxBA0Vx802XcgG9PP8F2E9L
	 RhkzfpT9YWM/ZHt/PuA0L8rEpNq6NUZuSzHrftBnQkSm/KvMDS/6uxEowAHBeQnQecBCE
	 hQKMn8s2aDhYMp/vR+Y+SrCOdiRc4xqSFgCgUWyT2TU5J+OdKeh4C3KoPozp/VUGgJqzR
	 AkNDI3EKEQzjEkix+bWRJEr4Jp+/NGL61JH9KOrB7pHHqtyfwBBTfp/5nvPqeu46/aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=EzAjINc2;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=EzAjINc2;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02C7606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B02C7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=EzAjINc2;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=EzAjINc2
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 12DA92230D;
	Mon, 16 Nov 2026 18:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0RxqszkmvXVOoT1teVc41az1ULR27EKd8OFXQ2iVvJQ=;
	b=EzAjINc2BxT+KCiZwA3O1xf2aduQdrtCKRjcD8geQVDEf+1vrxkF4WVCdFDzTjjjVOtf4F
	2tkpW5oqMt3np4lfcTs/8r/aMmKZhogVjLh2wj6ctooByR4WJF5Oxbyfx+kta0zefIKg7d
	5M/V65VTrS+X8N8uUoc0ebAeP/HGFUY=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0RxqszkmvXVOoT1teVc41az1ULR27EKd8OFXQ2iVvJQ=;
	b=EzAjINc2BxT+KCiZwA3O1xf2aduQdrtCKRjcD8geQVDEf+1vrxkF4WVCdFDzTjjjVOtf4F
	2tkpW5oqMt3np4lfcTs/8r/aMmKZhogVjLh2wj6ctooByR4WJF5Oxbyfx+kta0zefIKg7d
	5M/V65VTrS+X8N8uUoc0ebAeP/HGFUY=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 863D51334C;
	Mon, 16 Nov 2026 18:40:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gbkuFx1O+2queAAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 18:40:29 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev
Cc: Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v6 14/17] x86/paravirt: Switch MSR access pv_ops functions to instruction interfaces
Date: Mon, 16 Nov 2026 19:39:02 +0100
Message-ID: <20261116183905.1591611-15-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116183905.1591611-1-jgross@suse.com>
References: <20261116183905.1591611-1-jgross@suse.com>
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
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Score: -11.80
X-Spam-Level: 
X-Spam-Flag: NO

In order to prepare for inlining RDMSR/WRMSR instructions via
alternatives directly when running not in a Xen PV guest, switch the
interfaces of the MSR related pvops callbacks to ones similar of the
related instructions.

In order to prepare for supporting the immediate variants of RDMSR/WRMSR
use a 64-bit interface instead of the 32-bit one of RDMSR/WRMSR.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- former patch 5 of V1 has been split
- use 64-bit interface (Xin Li)
---
 arch/x86/include/asm/paravirt-msr.h | 64 ++++++++++++++++++++++++-----
 arch/x86/kernel/paravirt.c          | 36 ++++++++++++++--
 arch/x86/xen/enlighten_pv.c         | 45 +++++++++++++++-----
 3 files changed, 120 insertions(+), 25 deletions(-)

diff --git a/arch/x86/include/asm/paravirt-msr.h b/arch/x86/include/asm/paravirt-msr.h
index 3a39dfa3fe3e..afd9f7abec61 100644
--- a/arch/x86/include/asm/paravirt-msr.h
+++ b/arch/x86/include/asm/paravirt-msr.h
@@ -6,46 +6,90 @@
 
 struct pv_msr_ops {
 	/* Unsafe MSR operations.  These will warn or panic on failure. */
-	u64 (*read_msr)(u32 msr);
-	void (*write_msr)(u32 msr, u64 val);
+	struct paravirt_callee_save read_msr;
+	struct paravirt_callee_save write_msr;
 
 	/* Safe MSR operations.  Returns 0 or -EIO. */
-	int (*read_msr_safe)(u32 msr, u64 *val);
-	int (*write_msr_safe)(u32 msr, u64 val);
+	struct paravirt_callee_save read_msr_safe;
+	struct paravirt_callee_save write_msr_safe;
 
 	u64 (*read_pmc)(int counter);
 } __no_randomize_layout;
 
 extern struct pv_msr_ops pv_ops_msr;
 
+#define PV_PROLOGUE_MSR(func)		\
+	PV_SAVE_COMMON_CALLER_REGS	\
+	PV_PROLOGUE_MSR_##func
+
+#define PV_EPILOGUE_MSR(func)	PV_RESTORE_COMMON_CALLER_REGS
+
+#define PV_CALLEE_SAVE_REGS_MSR_THUNK(func)		\
+	__PV_CALLEE_SAVE_REGS_THUNK(func, ".text", MSR)
+
 static __always_inline u64 read_msr(u32 msr)
 {
-	return PVOP_CALL1(u64, pv_ops_msr, read_msr, msr);
+	u64 val;
+
+	asm volatile(PARAVIRT_CALL
+		     : "=a" (val), ASM_CALL_CONSTRAINT
+		     : paravirt_ptr(pv_ops_msr, read_msr), "c" (msr)
+		     : "rdx");
+
+	return val;
 }
 
 static __always_inline void write_msr(u32 msr, u64 val)
 {
-	PVOP_VCALL2(pv_ops_msr, write_msr, msr, val);
+	asm volatile(PARAVIRT_CALL
+		     : ASM_CALL_CONSTRAINT
+		     : paravirt_ptr(pv_ops_msr, write_msr), "c" (msr), "a" (val)
+		     : "memory", "rdx");
 }
 
 static __always_inline void write_msrns(u32 msr, u64 val)
 {
-	PVOP_VCALL2(pv_ops_msr, write_msr, msr, val);
+	asm volatile(PARAVIRT_CALL
+		     : ASM_CALL_CONSTRAINT
+		     : paravirt_ptr(pv_ops_msr, write_msr), "c" (msr), "a" (val)
+		     : "memory", "rdx");
 }
 
 static __always_inline int read_msr_safe(u32 msr, u64 *val)
 {
-	return PVOP_CALL2(int, pv_ops_msr, read_msr_safe, msr, val);
+	int err;
+
+	asm volatile(PARAVIRT_CALL
+		     : [err] "=d" (err), "=a" (*val), ASM_CALL_CONSTRAINT
+		     : paravirt_ptr(pv_ops_msr, read_msr_safe), "c" (msr));
+
+	return err ? -EIO : 0;
 }
 
 static __always_inline int write_msr_safe(u32 msr, u64 val)
 {
-	return PVOP_CALL2(int, pv_ops_msr, write_msr_safe, msr, val);
+	int err;
+
+	asm volatile(PARAVIRT_CALL
+		     : [err] "=a" (err), ASM_CALL_CONSTRAINT
+		     : paravirt_ptr(pv_ops_msr, write_msr_safe),
+			"c" (msr), "a" (val)
+		     : "memory", "rdx");
+
+	return err ? -EIO : 0;
 }
 
 static __always_inline int write_msrns_safe(u32 msr, u64 val)
 {
-	return PVOP_CALL2(int, pv_ops_msr, write_msr_safe, msr, val);
+	int err;
+
+	asm volatile(PARAVIRT_CALL
+		     : [err] "=a" (err), ASM_CALL_CONSTRAINT
+		     : paravirt_ptr(pv_ops_msr, write_msr_safe),
+			"c" (msr), "a" (val)
+		     : "memory", "rdx");
+
+	return err ? -EIO : 0;
 }
 
 static __always_inline u64 do_rdpmc(int counter)
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 739dbfd8aadf..66c0d6b5423c 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -50,12 +50,40 @@ unsigned long pv_native_save_fl(void);
 void pv_native_irq_disable(void);
 void pv_native_irq_enable(void);
 unsigned long pv_native_read_cr2(void);
+void pv_native_rdmsr(void);
+void pv_native_wrmsr(void);
+void pv_native_rdmsr_safe(void);
+void pv_native_wrmsr_safe(void);
 
 DEFINE_ASM_FUNC(_paravirt_ident_64, "mov %rdi, %rax", .text);
 DEFINE_ASM_FUNC(pv_native_save_fl, "pushf; pop %rax", .noinstr.text);
 DEFINE_ASM_FUNC(pv_native_irq_disable, "cli", .noinstr.text);
 DEFINE_ASM_FUNC(pv_native_irq_enable, "sti", .noinstr.text);
 DEFINE_ASM_FUNC(pv_native_read_cr2, "mov %cr2, %rax", .noinstr.text);
+DEFINE_ASM_FUNC(pv_native_rdmsr,
+		"1: rdmsr\n"
+		"shl $32, %rdx; or %rdx, %rax\n"
+		"2:\n"
+		_ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_RDMSR), .noinstr.text);
+DEFINE_ASM_FUNC(pv_native_wrmsr,
+		"mov %rax, %rdx; shr $32, %rdx\n"
+		"1: wrmsr\n"
+		"2:\n"
+		_ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_WRMSR), .noinstr.text);
+DEFINE_ASM_FUNC(pv_native_rdmsr_safe,
+		"1: rdmsr\n"
+		"shl $32, %rdx; or %rdx, %rax\n"
+		"xor %edx, %edx\n"
+		"2:\n"
+		_ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_RDMSR_SAFE, %%edx),
+		.noinstr.text);
+DEFINE_ASM_FUNC(pv_native_wrmsr_safe,
+		"mov %rax, %rdx; shr $32, %rdx\n"
+		"1: wrmsr\n"
+		"xor %eax, %eax\n"
+		"2:\n"
+		_ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_WRMSR_SAFE, %%eax),
+		.noinstr.text);
 #endif
 
 static noinstr void pv_native_safe_halt(void)
@@ -208,10 +236,10 @@ struct paravirt_patch_template pv_ops = {
 
 #ifdef CONFIG_PARAVIRT_XXL
 struct pv_msr_ops pv_ops_msr = {
-	.read_msr	= native_read_msr,
-	.write_msr	= native_write_msr,
-	.read_msr_safe	= native_read_msr_safe,
-	.write_msr_safe	= native_write_msr_safe,
+	.read_msr	= __PV_IS_CALLEE_SAVE(pv_native_rdmsr),
+	.write_msr	= __PV_IS_CALLEE_SAVE(pv_native_wrmsr),
+	.read_msr_safe	= __PV_IS_CALLEE_SAVE(pv_native_rdmsr_safe),
+	.write_msr_safe	= __PV_IS_CALLEE_SAVE(pv_native_wrmsr_safe),
 	.read_pmc	= native_read_pmc,
 };
 EXPORT_SYMBOL(pv_ops_msr);
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index a4719762d7ea..11814bc2633a 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1148,15 +1148,32 @@ static void xen_do_write_msr(u32 msr, u64 val, int *err)
 	}
 }
 
-static int xen_read_msr_safe(u32 msr, u64 *val)
+/*
+ * Prototypes for functions called via PV_CALLEE_SAVE_REGS_THUNK() in order
+ * to avoid warnings with "-Wmissing-prototypes".
+ */
+struct xen_rdmsr_safe_ret {
+	u64 val;
+	int err;
+};
+struct xen_rdmsr_safe_ret xen_read_msr_safe(u32 msr);
+int xen_write_msr_safe(u32 msr, u64 val);
+u64 xen_read_msr(u32 msr);
+void xen_write_msr(u32 msr, u64 val);
+#define PV_PROLOGUE_RDMSR	"mov %ecx, %edi;"
+#define PV_PROLOGUE_WRMSR	"mov %ecx, %edi; mov %rax, %rsi;"
+
+__visible struct xen_rdmsr_safe_ret xen_read_msr_safe(u32 msr)
 {
-	int err = 0;
+	struct xen_rdmsr_safe_ret ret = { 0, 0 };
 
-	*val = xen_do_read_msr(msr, &err);
-	return err;
+	ret.val = xen_do_read_msr(msr, &ret.err);
+	return ret;
 }
+#define PV_PROLOGUE_MSR_xen_read_msr_safe	PV_PROLOGUE_RDMSR
+PV_CALLEE_SAVE_REGS_MSR_THUNK(xen_read_msr_safe);
 
-static int xen_write_msr_safe(u32 msr, u64 val)
+__visible int xen_write_msr_safe(u32 msr, u64 val)
 {
 	int err = 0;
 
@@ -1164,20 +1181,26 @@ static int xen_write_msr_safe(u32 msr, u64 val)
 
 	return err;
 }
+#define PV_PROLOGUE_MSR_xen_write_msr_safe	PV_PROLOGUE_WRMSR
+PV_CALLEE_SAVE_REGS_MSR_THUNK(xen_write_msr_safe);
 
-static u64 xen_read_msr(u32 msr)
+__visible u64 xen_read_msr(u32 msr)
 {
 	int err = 0;
 
 	return xen_do_read_msr(msr, xen_msr_safe ? &err : NULL);
 }
+#define PV_PROLOGUE_MSR_xen_read_msr	PV_PROLOGUE_RDMSR
+PV_CALLEE_SAVE_REGS_MSR_THUNK(xen_read_msr);
 
-static void xen_write_msr(u32 msr, u64 val)
+__visible void xen_write_msr(u32 msr, u64 val)
 {
 	int err;
 
 	xen_do_write_msr(msr, val, xen_msr_safe ? &err : NULL);
 }
+#define PV_PROLOGUE_MSR_xen_write_msr	PV_PROLOGUE_WRMSR
+PV_CALLEE_SAVE_REGS_MSR_THUNK(xen_write_msr);
 
 /* This is called once we have the cpu_possible_mask */
 void __init xen_setup_vcpu_info_placement(void)
@@ -1380,10 +1403,10 @@ asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
 	pv_ops.cpu.start_context_switch = xen_start_context_switch;
 	pv_ops.cpu.end_context_switch = xen_end_context_switch;
 
-	pv_ops_msr.read_msr = xen_read_msr;
-	pv_ops_msr.write_msr = xen_write_msr;
-	pv_ops_msr.read_msr_safe = xen_read_msr_safe;
-	pv_ops_msr.write_msr_safe = xen_write_msr_safe;
+	pv_ops_msr.read_msr = PV_CALLEE_SAVE(xen_read_msr);
+	pv_ops_msr.write_msr = PV_CALLEE_SAVE(xen_write_msr);
+	pv_ops_msr.read_msr_safe = PV_CALLEE_SAVE(xen_read_msr_safe);
+	pv_ops_msr.write_msr_safe = PV_CALLEE_SAVE(xen_write_msr_safe);
 	pv_ops_msr.read_pmc = xen_read_pmc;
 
 	xen_init_irq_ops();
-- 
2.56.0

