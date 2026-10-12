Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2C03C5DC3;
	Mon, 12 Oct 2026 09:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799168; cv=none; b=Nzmu0MJpFAqCDdF9NhaP32cybu+gxnc28ul4Nl9K6/7tiUnphwC6OJxthHXPx59EfHuXSfaAQkY5aXXrbIgRkYKPoEzyypCeAlmrbsoN78d4Skbxzpq0y+1nXVTo5Wj1p9IQeD0lSE2l4xjHO8R2vdbolM491dPkqIDfJG/Dwk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799168; c=relaxed/simple;
	bh=NHaVAjPVAIFw58C1+eTEFtPmwZEEHI1ZYwz+Epf6OcI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=N51k5OTDFHIlcatqc+DYCd3mPIBWsyeFeZVrvIKaqih6pMjKMyaRU/kcCnzUPagUR4dz3FDlVISA5G6mbnK9WMVy0+trGeBwK3N9hKACjmtd31vEFnDSSht9iz64Rs/MpTif1VwQa+TEhAPDO69AiBkIGKtuPOTPlJ1/gSK8N68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4bDj9Kgd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=22yuvLef; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4bDj9Kgd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="22yuvLef"
Date: Mon, 12 Oct 2026 09:59:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791799161;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0tPGLxFs9YI5/93LLwt+RSG2z9ddnBNlLaP4H+TnN8Y=;
	b=4bDj9KgdXvTvF5KaU6Bve1QqQ63yf4YxK08mzIUJwrS9Y1Mvcf7GHFQBMehsvYFLZJkn9o
	v/l8gjPrlH9Vy1AhShNQ+zdm7MO6GSprPDlO6yzZh3EbvkrEGhLBteH6Fc+88wJrZdqy0E
	rsoUQooFZRPE1utN8yV2MNNVKXhqvsKG/9PeDzB911wh6GwPBjM8/tHCtNrg/y/jwNDkdO
	fKM1C3nLB+X06O2DWySRqlfnFhhTJZuSB6ultySWpVv6Xmee1UYgtHdja4eI4G1GPxlQMP
	IML1GmrK/YulxwF7vGSc8PK5AaRo2oz//vipG+jZ9m++ZPrLSVQZrLJKj8J5tA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791799161;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0tPGLxFs9YI5/93LLwt+RSG2z9ddnBNlLaP4H+TnN8Y=;
	b=22yuvLefmp1dRRRTYpWzquXDLh3sayZRYPttk9C3nmdWd12fzVlAexFCZUhPyqzei2J0/x
	7cL3ajvs81QHNjDg==
From: "tip-bot2 for Kees Cook" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/urgent] x86/kcfi: Decode the kCFI check from the trap address
Cc: Kees Cook <kees@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261012090436.1676525-1-kees@kernel.org>
References: <20261012090436.1676525-1-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179179915966.1914040.16165141501355454735.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     4505a262deae7df06e33617dfc104d5541eec91d
Gitweb:        https://git.kernel.org/tip/4505a262deae7df06e33617dfc104d5541e=
ec91d
Author:        Kees Cook <kees@kernel.org>
AuthorDate:    Mon, 12 Oct 2026 02:04:24 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 12 Oct 2026 11:47:32 +02:00

x86/kcfi: Decode the kCFI check from the trap address

Since commit b2250d63e6422 ("x86/kcfi: Optimize call sequence"), a
CONFIG_FINEIBT=3Dy kernel running in kCFI mode rewrites each kCFI call
site at boot so that a failed check traps on the 0xd6 byte of
"test $0xd6, %al", one byte past where the compiler's "ud2" was.
handle_cfi_failure() steps "addr" back one byte to find the trap in
.kcfi_traps, but decode_cfi_insn() still decodes from regs->ip, so it
reads each instruction starting at its second byte.
"movl $-<id>, %r10d" then decodes as "movl $-<id>, %edx", so the
reported type is right by accident, but "addl -15(%r11), %r10d" decodes
as "addl -15(%rbx), %edx", so the reported target is whatever %rbx holds:

  CFI failure at lkdtm_indirect_call+0x16/0x20 (target: 0x12; expected type: =
0xc79a2d1b)

Pass the adjusted address to decode_cfi_insn() and decode from it.

Tested ARCH=3Dx86_64 defconfig with CONFIG_CFI=3Dy and CONFIG_LKDTM=3Dy under
QEMU, with LKDTM's CFI_FORWARD_PROTO and both Clang 24.0.0git and GCC
17.0.0 (experimental, with the kCFI series). With CONFIG_FINEIBT=3Dy in
kCFI mode, the report gives %rbx as the target without this change, and
the expected lkdtm_increment_int() with it. With cfi=3Dfineibt, with
cfi=3Dfineibt,paranoid, and with CONFIG_FINEIBT=3Dn, it gives
lkdtm_increment_int() both with and without this change.

Fixes: b2250d63e6422 ("x86/kcfi: Optimize call sequence")
Assisted-by: LLM
Signed-off-by: Kees Cook <kees@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20261012090436.1676525-1-kees@kernel.org
---
 arch/x86/kernel/cfi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cfi.c b/arch/x86/kernel/cfi.c
index 1df26df..8e5c4ed 100644
--- a/arch/x86/kernel/cfi.c
+++ b/arch/x86/kernel/cfi.c
@@ -10,11 +10,11 @@
 #include <asm/insn-eval.h>
=20
 /*
- * Returns the target address and the expected type when regs->ip points
+ * Returns the target address and the expected type when addr points
  * to a compiler-generated CFI trap.
  */
-static bool decode_cfi_insn(struct pt_regs *regs, unsigned long *target,
-			    u32 *type)
+static bool decode_cfi_insn(struct pt_regs *regs, unsigned long addr,
+			    unsigned long *target, u32 *type)
 {
 	char buffer[MAX_INSN_SIZE];
 	struct insn insn;
@@ -29,13 +29,13 @@ static bool decode_cfi_insn(struct pt_regs *regs, unsigne=
d long *target,
 	 * =C2=A0 movl    -<id>, %r10d       ; 6 bytes
 	 *   addl    -<pos>(%reg), %r10d; 4 bytes
 	 *   je      .Ltmp1             ; 2 bytes
-	 *   ud2                        ; <- regs->ip
+	 *   ud2                        ; <- addr
 	 *   .Ltmp1:
 	 *
 	 * We can decode the expected type and the target address from the
 	 * movl/addl instructions.
 	 */
-	if (copy_from_kernel_nofault(buffer, (void *)regs->ip - 12, MAX_INSN_SIZE))
+	if (copy_from_kernel_nofault(buffer, (void *)addr - 12, MAX_INSN_SIZE))
 		return false;
 	if (insn_decode_kernel(&insn, &buffer[offset]))
 		return false;
@@ -44,7 +44,7 @@ static bool decode_cfi_insn(struct pt_regs *regs, unsigned =
long *target,
=20
 	*type =3D -(u32)insn.immediate.value;
=20
-	if (copy_from_kernel_nofault(buffer, (void *)regs->ip - 6, MAX_INSN_SIZE))
+	if (copy_from_kernel_nofault(buffer, (void *)addr - 6, MAX_INSN_SIZE))
 		return false;
 	if (insn_decode_kernel(&insn, &buffer[offset]))
 		return false;
@@ -82,7 +82,7 @@ enum bug_trap_type handle_cfi_failure(struct pt_regs *regs)
 				return BUG_TRAP_TYPE_NONE;
 		}
=20
-		if (!decode_cfi_insn(regs, &target, &type))
+		if (!decode_cfi_insn(regs, addr, &target, &type))
 			return report_cfi_failure_noaddr(regs, addr);
=20
 		break;
