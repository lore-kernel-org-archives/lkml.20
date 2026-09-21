Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6B2515889;
	Mon, 21 Sep 2026 21:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026982; cv=none; b=HG2MqNM6QUyHH5bwnFjjn9R6AnoLgAVJ5zIR3ZiVoj9cJS7ugmstpheDqOb6EMmZAYMCl/InJxdGOSl3Iub9/4/JFjr6/TiOFpMNsRFfQVRs9mepGAgwLHGZsQzKQyfpBJXt+WO2K9xd7Jhg4Ysd/IE4s91v0yCXHjwCibpU6Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026982; c=relaxed/simple;
	bh=kTR0uuIrtIoVhFFBBMjK2kaa2P3I8IxAKg83n77h1w0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=HipPY9sdbSt37kttA1DPaxRsvc2RHyi4zFCIzk7qhmQKNSvZPCD8WmUTZ6UVfioT0P/N37GjJmrSlDYvwgg6pAPSodu4EFtMO9EsZFenQMMmVtA4C95YhS7fjzvgv+v0S7ZPJ5wgSxYfavLoHgkSCGN3GnpO/qryDlselix2PPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HfJMNSey; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jTyq+OI5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HfJMNSey";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jTyq+OI5"
Date: Mon, 21 Sep 2026 21:42:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790026977;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJcidkigpPmQL5IiSmaIwiZcHQ5PXBs0gqQF3Q189kw=;
	b=HfJMNSeyYaLGFD5RU+84k6ZqjYw2iHLiloCtXkXmicDOf1UKw1IGDnryO67akuyxoBL+Rv
	M/oCrwJB0bo+gxyBi4uybbF9CSSF8uc41p21PYoRd0GLJbCNi/9uGuG+eHH/Q4uG+BTDwH
	tamzK+bihjE2DEYaa/B20peFOkjlYRzhTNjnWZk4qLIUI76a0aXMeYaunwNkHeFIWhWSJC
	bRLd2mEOAxnQ6k1KNcMY2syTNVkYyMlHp0hhH2JGJUfb4bmYOrc5xWDdErO57BW/7jlEIS
	ajuzlwxPb3F+h+I//oQwhJgJOs13kQTmrFN8CSOOqYd35nVJ6ZXOclZnNiw1Wg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790026977;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJcidkigpPmQL5IiSmaIwiZcHQ5PXBs0gqQF3Q189kw=;
	b=jTyq+OI5BqfbgrNMgb0fJF4a/6m+6gEcpso+DQbJfKKxsZ1dRwWjq6bZiCijbcb6SKT6S7
	2E3HVqOnSv6VN6CQ==
From: "tip-bot2 for Xu Yilun" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/tdx] x86/virt/tdx: Formalize SEAMCALL leaf version encoding support
Cc: Xu Yilun <yilun.xu@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Nikolay Borisov <nik.borisov@suse.com>,
 Tony Lindgren <tony.lindgren@linux.intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Kishen Maloor <kishen.maloor@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921-seamcall-version-v7-1-cf05fe76b467@linux.intel.com>
References: <20260921-seamcall-version-v7-1-cf05fe76b467@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179002697616.2819794.5340941302619800860.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/tdx branch of tip:

Commit-ID:     c9fc85f1e44e4e933c7e6702b100b9505715f6a8
Gitweb:        https://git.kernel.org/tip/c9fc85f1e44e4e933c7e6702b100b950571=
5f6a8
Author:        Xu Yilun <yilun.xu@linux.intel.com>
AuthorDate:    Mon, 21 Sep 2026 20:39:23 +08:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Mon, 21 Sep 2026 14:38:15 -07:00

x86/virt/tdx: Formalize SEAMCALL leaf version encoding support

The TDX architecture includes a syscall-like ABI for OSes to communicate
with SEAM mode software. This ABI has the concept of a "leaf". Each leaf
is roughly analogous to a Linux syscall: it has a set of register
arguments and does one logical thing like adding a page of memory to a
VM or running a VM. The TDX architecture refers to this interface
function as a "SEAMCALL leaf".

Just like syscalls, the TDX architecture wants to evolve the ABI to
extend functionality while keeping compatibility. But unlike syscalls,
which do this by picking a totally new syscall number, the ABI encodes
the "version" number directly into the bits of a register argument. So
instead of openatN being whatever the next free number is, the SEAMCALL
leaf number and version number are encoded into certain bits in how the
RAX register is defined in the ABI.

In Linux, several seamcall*() wrappers have been introduced to invoke
SEAMCALL leafs. They all take a u64 "fn" argument for the leaf number
which eventually gets set in the register. As above, the version number
lives in the same register as the leaf number. So callers that want to
select a specific version of the leaf, can jam it in the right place in
the register by passing it in the "fn" argument. Today only the caller
of TDH.VP.INIT does this hack, but future kernel changes will need to
select versions for more SEAMCALL leafs. So a less hacky solution is
needed.

Explicitly define the arguments for seamcall*() wrappers:

  - Add a build-time assertion to ensure "fn" only contains valid
    SEAMCALL leaf number bits. Note the P-SEAMLDR selector bit (bit 63)
    is part of the leaf number for SEAM loader calls, so it is allowed.
    This also means the "fn" can't be a narrower type, such as u16, to
    exclude unrelated bits.

  - Add a "version" field in struct tdx_module_args [1], so most
    existing callers get a default "version =3D=3D 0" behavior without code
    churn. Update the TDH.VP.INIT caller to specify the version
    descriptively.

Encode the leaf number and tdx_module_args.version into RAX in assembly,
because this is the place where the "fn" and struct tdx_module_args
fields are marshaled into registers.

AI was used under supervision to review code and workshop logs. In
particular, it helped evaluate the assembly changes.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Kishen Maloor <kishen.maloor@intel.com>
Link: https://lore.kernel.org/kvm/4f4b0f29-424b-45ed-8cfd-c77da2ea390f@intel.=
com/ # [1]
Link: https://patch.msgid.link/20260921-seamcall-version-v7-1-cf05fe76b467@li=
nux.intel.com
---
 arch/x86/include/asm/shared/tdx.h         |  5 +++++
 arch/x86/kernel/asm-offsets.c             |  1 +
 arch/x86/virt/vmx/tdx/seamcall_internal.h | 19 +++++++++++++++++++
 arch/x86/virt/vmx/tdx/tdx.c               |  5 +++--
 arch/x86/virt/vmx/tdx/tdx.h               |  8 --------
 arch/x86/virt/vmx/tdx/tdxcall.S           | 10 ++++++++--
 6 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/=
tdx.h
index f20e91d..f2cfa71 100644
--- a/arch/x86/include/asm/shared/tdx.h
+++ b/arch/x86/include/asm/shared/tdx.h
@@ -143,6 +143,11 @@ struct tdx_module_args {
 	u64 rbx;
 	u64 rdi;
 	u64 rsi;
+	/*
+	 * Leaf ABI version. Note that it gets encoded into RAX along with the
+	 * leaf number.
+	 */
+	u8  version;
 };
=20
 /* Used to communicate with the TDX module */
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 0818168..b3c00ff 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -95,6 +95,7 @@ static void __used common(void)
 	OFFSET(TDX_MODULE_rbx, tdx_module_args, rbx);
 	OFFSET(TDX_MODULE_rdi, tdx_module_args, rdi);
 	OFFSET(TDX_MODULE_rsi, tdx_module_args, rsi);
+	OFFSET(TDX_MODULE_version, tdx_module_args, version);
=20
 	BLANK();
 	OFFSET(BP_scratch, boot_params, scratch);
diff --git a/arch/x86/virt/vmx/tdx/seamcall_internal.h b/arch/x86/virt/vmx/td=
x/seamcall_internal.h
index be5f446..051ad2d 100644
--- a/arch/x86/virt/vmx/tdx/seamcall_internal.h
+++ b/arch/x86/virt/vmx/tdx/seamcall_internal.h
@@ -11,6 +11,7 @@
 #ifndef _X86_VIRT_SEAMCALL_INTERNAL_H
 #define _X86_VIRT_SEAMCALL_INTERNAL_H
=20
+#include <linux/bitfield.h>
 #include <linux/printk.h>
 #include <linux/types.h>
 #include <asm/archrandom.h>
@@ -23,9 +24,27 @@ u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *a=
rgs);
=20
 typedef u64 (*sc_func_t)(u64 fn, struct tdx_module_args *args);
=20
+/*
+ * SEAMCALL leaf:
+ *
+ * Bit 15:0	Leaf number
+ * Bit 23:16	Leaf ABI version number
+ * Bit 24	Pending interrupts detection mode
+ * Bit 63	1 for P-SEAMLDR leaf, 0 for TDX module leaf
+ */
+#define SEAMCALL_LEAF_MASK		GENMASK_U64(15, 0)
+#define SEAMCALL_SEAMLDR_MASK		BIT_U64(63)
+
 static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
 						  struct tdx_module_args *args)
 {
+	/*
+	 * fn contains leaf number for TDX module calls and P-SEAMLDR calls.
+	 * Other fields in SEAMCALL leaf like leaf ABI version number are in
+	 * struct tdx_module_args.
+	 */
+	BUILD_BUG_ON(fn & ~(SEAMCALL_LEAF_MASK | SEAMCALL_SEAMLDR_MASK));
+
 	lockdep_assert_preemption_disabled();
=20
 	/*
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 063574e..96ced04 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1959,10 +1959,11 @@ u64 tdh_vp_init(struct tdx_vp *vp, u64 initial_rcx, u=
32 x2apicid)
 		.rcx =3D vp->tdvpr_pa,
 		.rdx =3D initial_rcx,
 		.r8 =3D x2apicid,
+		/* apicid requires version =3D=3D 1. */
+		.version =3D 1,
 	};
=20
-	/* apicid requires version =3D=3D 1. */
-	return seamcall(TDH_VP_INIT | (1ULL << TDX_VERSION_SHIFT), &args);
+	return seamcall(TDH_VP_INIT, &args);
 }
 EXPORT_SYMBOL_FOR_KVM(tdh_vp_init);
=20
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index a886c54..db20954 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -52,14 +52,6 @@
 #define TDH_PHYMEM_PAMT_REMOVE		59
 #define TDH_SYS_DISABLE			69
=20
-/*
- * SEAMCALL leaf:
- *
- * Bit 15:0	Leaf number
- * Bit 23:16	Version number
- */
-#define TDX_VERSION_SHIFT		16
-
 /* TDX page types */
 #define	PT_NDA		0x0
 #define	PT_RSVD		0x1
diff --git a/arch/x86/virt/vmx/tdx/tdxcall.S b/arch/x86/virt/vmx/tdx/tdxcall.S
index 016a2a1..a194e83 100644
--- a/arch/x86/virt/vmx/tdx/tdxcall.S
+++ b/arch/x86/virt/vmx/tdx/tdxcall.S
@@ -45,8 +45,14 @@
 .macro TDX_MODULE_CALL host:req ret=3D0 saved=3D0
 	FRAME_BEGIN
=20
-	/* Move Leaf ID to RAX */
-	mov %rdi, %rax
+	/* Leaf ABI version -> RAX[23:16]. Zero rest of RAX. */
+	movzbl	TDX_MODULE_version(%rsi), %eax
+	shl	$16, %eax
+	/*
+	 * Combine leaf number arg and leaf ABI version into RAX, they don't
+	 * overlap.
+	 */
+	or	%rdi, %rax
=20
 	/* Move other input regs from 'struct tdx_module_args' */
 	movq	TDX_MODULE_rcx(%rsi), %rcx
