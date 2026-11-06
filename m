Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959002;
	b=aM+1MHiH2SRowojD6iLo2BR531FWRo8sVAlFHlBBEdIU0NJcV8TdrLbQSfvnr7Nb3apL
	 +qVykQq2wRPnPGjAjuU85jFYD4Ze1jk+zUGZmjrWsCllFFKWWxdVXWhNlvrzTZzPq/VU/
	 eSAD8zXfeedV9lDmgWisaJx8j2SA6NW6D06Lrv9UnQBokSqztCy2joIDI++kfV/fesqt7
	 k7+uehmAMkTN3Gfn0V093nKa3+soQM7CmSxhjZGlOsFf0mMKBosD+s3Mihy85C6qLqurk
	 ISlSrkXsyjFk6Kp9lQJuhh2BTG5j+OYCPOCnFUef0nxwN+6ymodSkg9Gs+6ySjozYrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959002;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=wc90mkhV4JCZVgq6sGZ1LOiDWQRHHrmx5sOWDPhx3UA=;
	b=0okxsvYPZOAEVmeFmRGHKHkUjQOFEjfredCIq2X/C7MNOZ1hNaHM9DNxor2ueqaY6Qen
	 LZb/Fvcvm9ylsIIdGoiwfDOgchNe49Hg+WlKVaDt2Tx49G46ayer32Kshq7n/1f6RX+Ps
	 HOkXuNLi1Pz2E98VqbezZ8M1b+gvXfYVXLVaZLYpiT9Dxp5VKBpiB8p2mvYzh+ZOhnXod
	 8Ll8VrlYDhDxmCofOaRE3Ui+baAMrE9ciQcLB50js/ZgZsPmQeU/T/isNP+hsw+NvGy0N
	 2hoaBoL90elAtCIVCKN8mPThA8DsLFwBfaGdiS2QVgnuyTuIva1Bn4sCv08b8HUUfwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="l5SK2y/z";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=UHiBLwk6;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D3C606D824;
	Fri,  6 Nov 2026 09:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D3C606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=l5SK2y/z;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=UHiBLwk6
Date: Fri, 06 Nov 2026 09:56:38 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793958999;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wc90mkhV4JCZVgq6sGZ1LOiDWQRHHrmx5sOWDPhx3UA=;
	b=l5SK2y/zcV4gsnXBmTyLjWTfJYJTD9xIpH76/JJPQmfsdAtKfeLnBa5N8s/MeE/g6J0a51
	p0d/i4CMT9UGpGAD1fLL51YLNkJ5lyq/J/OwqCygIXna+Jc7JiimI15z/e3Ik1qHsWUOxK
	69wZBA4GI5b7bIAy/XqzPaXDwlEocSpJIMSX7g8OyBbo4vmsnU7xPxZg3iCanmGko21L+0
	wwSd+H5G9kzzdO7wGR5a4wyLHxThsPjFagteVKc427CJX/Zz2muax81NSg0XNrCfQM19zo
	85j92SbWAaweGC2x+MziFJp/twvTS8UHiZFRSiJkC7rM0poniZ6gcW+aOutlwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793958999;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wc90mkhV4JCZVgq6sGZ1LOiDWQRHHrmx5sOWDPhx3UA=;
	b=UHiBLwk6pSs3q7ieIGTVKPR6RXHo/oGedMzD/LrxVILAkAWFRtztVmv6dRPmRscRA3qceL
	0bFKBLnWeeBBIOAA==
From: "tip-bot2 for Ridge Lomont" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/kcfi: Don't emit KCFI_REFERENCE() in modules
Cc: Ridge Lomont <cyridge@proton.me>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261027-kcfi-reference-modules-v2-1-3a3247f15806@proton.me>
References: <20261027-kcfi-reference-modules-v2-1-3a3247f15806@proton.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179395899801.1009794.675922309720546453.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     fb685de78e6bf79e49854e7d149f69b125583de5
Gitweb:        https://git.kernel.org/tip/fb685de78e6bf79e49854e7d149f69b1255=
83de5
Author:        Ridge Lomont <cyridge@proton.me>
AuthorDate:    Tue, 27 Oct 2026 15:29:21 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 10:47:57 +01:00

x86/kcfi: Don't emit KCFI_REFERENCE() in modules

KCFI_REFERENCE() takes the address of a symbol so that the compiler
emits its __kcfi_typeid_ symbol, which the SYM_TYPED_FUNC_START()
assembly implementing it needs. It is used from arch/x86 headers for
__clear_pages_unrolled(), copy_page(), __memset() and __memmove(), and
all of that assembly is built into vmlinux.

Modules include the same headers, so with CONFIG_CFI=3Dy every module
also gets an __ADDRESSABLE() reference to each of these symbols in
.discard.addressable. This serves no purpose there, and since
__clear_pages_unrolled() is EXPORT_SYMBOL_GPL, modpost now rejects any
GPL-incompatible module that includes <linux/mm.h>:

  ERROR: modpost: GPL-incompatible module repro.ko uses GPL-only
  symbol '__clear_pages_unrolled'

even though the module never uses the symbol. This makes OpenZFS
impossible to build against CFI kernels; its configure checks fail
in the same way and are misreported as CONFIG_DEBUG_LOCK_ALLOC.

scripts/module.lds.S does not help here: modpost checks <module>.o
before the final link, and even after it the discarded section only
loses its relocations, the undefined symbols stay in .symtab, where
the module loader resolves them with the same license check.

Only emit the reference when building vmlinux.

Tested on x86_64 with clang 23.1.3 and CONFIG_CFI=3Dy, with both
CONFIG_LTO_CLANG_FULL=3Dy (the configuration from the Fixes: commit) and
CONFIG_LTO_CLANG_THIN=3Dy: vmlinux links without warnings and still contains
__kcfi_typeid___clear_pages_unrolled, __kcfi_typeid_copy_page,
__kcfi_typeid___memset and __kcfi_typeid___memmove. It boots in QEMU
with no CFI failures. A minimal module with MODULE_LICENSE("Proprietary")
including <linux/mm.h> fails modpost before this change and builds and
loads after it. OpenZFS builds against a CFI kernel with this change,
and its pool, encryption, checksum and send/recv operations run
without CFI failures, in QEMU and on a desktop with CFI enforcing.

Fixes: 9b041a4b66b3 ("x86/mm: Ensure clear_page() variants always have __kcfi=
_typeid_ symbols")
Assisted-by: LLM
Signed-off-by: Ridge Lomont <cyridge@proton.me>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Nathan Chancellor <nathan@kernel.org>
Link: https://github.com/openzfs/zfs/issues/18092
Link: https://patch.msgid.link/20261027-kcfi-reference-modules-v2-1-3a3247f15=
806@proton.me
---
 include/linux/compiler.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 0ea7150..ea161a7 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -258,10 +258,13 @@ void ftrace_likely_update(struct ftrace_likely_data *f,=
 int val,
=20
 #endif /* __KERNEL__ */
=20
-#if defined(CONFIG_CFI) && !defined(__DISABLE_EXPORTS) && !defined(BUILD_VDS=
O)
+#if defined(CONFIG_CFI) && !defined(__DISABLE_EXPORTS) && !defined(BUILD_VDS=
O) && \
+	!defined(MODULE)
 /*
  * Force a reference to the external symbol so the compiler generates
- * __kcfi_typid.
+ * __kcfi_typid. Only vmlinux needs it, as that is where the assembly
+ * using the typeid lives; in a module it would only add a reference to
+ * the symbol, which fails modpost if the symbol is GPL-only.
  */
 #define KCFI_REFERENCE(sym) __ADDRESSABLE(sym)
 #else
