Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA173D88E3;
	Tue, 29 Sep 2026 02:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790650785; cv=none; b=VDLfjbQ4cnYd9uTNo0fRVGMJkUwfmNK6tBNW8Vi6S9MnSix75OwhHBnBKl8QzFL2Nw05X7wwabUuGv9nO9SDcrIb0zYaMEi1rCQG9n7RVLBD01fghBczWKjRDRVafbjFfWtLMKUjy9qvJfNbEkaa3opW8O9RACYQ3N0o484O/Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790650785; c=relaxed/simple;
	bh=wMDn/99kbM3cpo3YW+1f7ihtUa/ZfmESGs6kN9DTh4M=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=UXDkT579MgIgPRvJ0q5oGXFvWvnAqDyp2gfv+LqeuYoMXJM9jjoFR9SK2O/pGJKGRV4ryM1Z9B47TOWLuO2n31pyeu1C4jCBltQzVn9wRlUfQT6PhxH38Q7yCbQ9kKTZJY+nq5Vb6anzPLo9gBMaq6+MCLbznHaa1OsLLsg7YCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=46g1dKIZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5NK3+nA9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="46g1dKIZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5NK3+nA9"
Date: Tue, 29 Sep 2026 02:59:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790650773;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3gecGyLKysWreLFoIZvuxz7zDhoytzOujQLiSrcdd+o=;
	b=46g1dKIZu9RsYW9aN+7NvYw90s64pFlGhncPAH+oODOuE8nHEHcg2JBZ1HvKPOLJdlkxGN
	4/428xW+j8J53bOcHluq42Fh6y+7TQ+QqeD6sAfh1Tm7INto/G+RC75b0/tQMG8tecUOcY
	1Ei+miLG5cFDy2s0PS8adDqFpRGzz1YB6PjznvsTf4LHy3AE6MoAsJlUjljnKscSPEbx58
	qyIscnRFddJ7ReEFYARf9fdP1kKFBnGhsTFigQDifI2ud+VM0Xly0yyz3B3sZXxkYVJstq
	9hyhbjJcNZFXu3gYfcnTIqZNlUnVkCCRfwyRae2LfUU0hKOTzbRGeAe9Vle7vQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790650773;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3gecGyLKysWreLFoIZvuxz7zDhoytzOujQLiSrcdd+o=;
	b=5NK3+nA9TUI9QRZK9CvrbsIHP5lY2Hm0WieOBnKbvzUaTtbfidGEoQPjumNCPsQRF/QZ5u
	HLeXeB+0XpkRQQAQ==
From: "tip-bot2 for Ard Biesheuvel" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/boot] x86/boot: Move unaccepted memory handling out of the
 decompressor
Cc: Ard Biesheuvel <ardb@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925075137.44298-7-ardb@kernel.org>
References: <20260925075137.44298-7-ardb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179065077139.3910103.7553960153553333815.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/boot branch of tip:

Commit-ID:     a9bc562daaf2596e6eab5f1a5e3a5880c4b2a1ee
Gitweb:        https://git.kernel.org/tip/a9bc562daaf2596e6eab5f1a5e3a5880c4b=
2a1ee
Author:        Ard Biesheuvel <ardb@kernel.org>
AuthorDate:    Fri, 25 Sep 2026 09:51:40 +02:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 28 Sep 2026 17:41:46 -07:00

x86/boot: Move unaccepted memory handling out of the decompressor

arch_accept_memory() is an arch-specific hook that is required by the
EFI stub when processing memory that the firmware reports to the OS as
EFI_UNACCEPTED_MEMORY.

This hook is called after ExitBootServices() has been called, as before
that point, the EFI memory map may get updated behind the back of the
running EFI stub, making it difficult to get a stable view on it while
iterating over the entries.

Currently, the x86 version of this hook is implemented in its
decompressor rather than in the EFI stub itself, in a manner that is
problematic: when an error occurs, it calls the decompressor's error()
routine, but without having gone through the decompressor initialization
code. This means it will resort to direct port I/O rather than the
hypercall based interface that TDX guests would use otherwise.

Conceptually, code that is only called from the EFI stub, and never by
the decompressor when doing legacy boot, belongs in the EFI stub and not
in the decompressor.

So move it into the x86-specific EFI stub code, replacing the error() on
the TDX path with tdx_panic(), and dropping the error() when no CC
support is detected - the kernel can decide what to do in this case
after it has booted.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Link: https://patch.msgid.link/20260925075137.44298-7-ardb@kernel.org
---
 arch/x86/boot/compressed/mem.c          | 42 +------------------------
 arch/x86/boot/compressed/sev.h          |  2 +-
 arch/x86/include/asm/sev.h              |  2 +-
 drivers/firmware/efi/libstub/x86-stub.c | 39 ++++++++++++++++++++++-
 4 files changed, 41 insertions(+), 44 deletions(-)

diff --git a/arch/x86/boot/compressed/mem.c b/arch/x86/boot/compressed/mem.c
index 0e9f84a..1721af3 100644
--- a/arch/x86/boot/compressed/mem.c
+++ b/arch/x86/boot/compressed/mem.c
@@ -2,48 +2,6 @@
=20
 #include "error.h"
 #include "misc.h"
-#include "tdx.h"
-#include "sev.h"
-#include <asm/shared/tdx.h>
-
-/*
- * accept_memory() and process_unaccepted_memory() called from EFI stub which
- * runs before decompressor and its early_tdx_detect().
- *
- * Enumerate TDX directly from the early users.
- */
-static bool early_is_tdx_guest(void)
-{
-	static bool once;
-	static bool is_tdx;
-
-	if (!IS_ENABLED(CONFIG_INTEL_TDX_GUEST))
-		return false;
-
-	if (!once) {
-		u32 eax, sig[3];
-
-		cpuid_count(TDX_CPUID_LEAF_ID, 0, &eax,
-			    &sig[0], &sig[2],  &sig[1]);
-		is_tdx =3D !memcmp(TDX_IDENT, sig, sizeof(sig));
-		once =3D true;
-	}
-
-	return is_tdx;
-}
-
-void arch_accept_memory(phys_addr_t start, phys_addr_t end)
-{
-	/* Platform-specific memory-acceptance call goes here */
-	if (early_is_tdx_guest()) {
-		if (!tdx_accept_memory(start, end))
-			panic("TDX: Failed to accept memory\n");
-	} else if (early_is_sevsnp_guest()) {
-		snp_accept_memory(start, end);
-	} else {
-		error("Cannot accept memory: unknown platform\n");
-	}
-}
=20
 bool init_unaccepted_memory(void)
 {
diff --git a/arch/x86/boot/compressed/sev.h b/arch/x86/boot/compressed/sev.h
index 22637b4..62e50c2 100644
--- a/arch/x86/boot/compressed/sev.h
+++ b/arch/x86/boot/compressed/sev.h
@@ -14,7 +14,6 @@
=20
 void snp_accept_memory(phys_addr_t start, phys_addr_t end);
 u64 sev_get_status(void);
-bool early_is_sevsnp_guest(void);
=20
 static inline u64 sev_es_rd_ghcb_msr(void)
 {
@@ -37,7 +36,6 @@ static inline void sev_es_wr_ghcb_msr(u64 val)
=20
 static inline void snp_accept_memory(phys_addr_t start, phys_addr_t end) { }
 static inline u64 sev_get_status(void) { return 0; }
-static inline bool early_is_sevsnp_guest(void) { return false; }
=20
 #endif
=20
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 9e7a077..4b5db43 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -517,6 +517,7 @@ void snp_accept_memory(phys_addr_t start, phys_addr_t end=
);
 u64 snp_get_unsupported_features(u64 status);
 u64 sev_get_status(void);
 void sev_show_status(void);
+bool early_is_sevsnp_guest(void);
 int prepare_pte_enc(struct pte_enc_desc *d);
 void set_pte_enc_mask(pte_t *kpte, unsigned long pfn, pgprot_t new_prot);
 void snp_kexec_finish(void);
@@ -626,6 +627,7 @@ static inline void snp_accept_memory(phys_addr_t start, p=
hys_addr_t end) { }
 static inline u64 snp_get_unsupported_features(u64 status) { return 0; }
 static inline u64 sev_get_status(void) { return 0; }
 static inline void sev_show_status(void) { }
+static inline bool early_is_sevsnp_guest(void) { return false; }
 static inline int prepare_pte_enc(struct pte_enc_desc *d) { return 0; }
 static inline void set_pte_enc_mask(pte_t *kpte, unsigned long pfn, pgprot_t=
 new_prot) { }
 static inline void snp_kexec_finish(void) { }
diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/l=
ibstub/x86-stub.c
index cef32e2..80556a7 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -10,6 +10,7 @@
 #include <linux/pci.h>
 #include <linux/stddef.h>
=20
+#include <asm/cpuid/api.h>
 #include <asm/efi.h>
 #include <asm/e820/types.h>
 #include <asm/setup.h>
@@ -17,6 +18,7 @@
 #include <asm/boot.h>
 #include <asm/kaslr.h>
 #include <asm/sev.h>
+#include <asm/shared/tdx.h>
=20
 #include "efistub.h"
 #include "x86-stub.h"
@@ -1068,3 +1070,40 @@ void efi64_stub_entry(efi_handle_t handle, efi_system_=
table_t *sys_table_arg,
 		      struct boot_params *boot_params);
 #endif
 #endif
+
+#ifdef CONFIG_UNACCEPTED_MEMORY
+/*
+ * process_unaccepted_memory() is called after ExitBootServices(), and so th=
ese
+ * memory acceptance routines cannot rely on EFI protocols for detecting the
+ * presence of TDX or SEV-SNP, or emit any kind of output if any error
+ * conditions are detected.
+ */
+static bool early_is_tdx_guest(void)
+{
+	static bool once;
+	static bool is_tdx;
+
+	if (!IS_ENABLED(CONFIG_INTEL_TDX_GUEST))
+		return false;
+
+	if (!once) {
+		u32 eax =3D TDX_CPUID_LEAF_ID, sig[3] =3D {};
+
+		native_cpuid(&eax, &sig[0], &sig[2], &sig[1]);
+		is_tdx =3D !memcmp(TDX_IDENT, sig, sizeof(sig));
+		once =3D true;
+	}
+
+	return is_tdx;
+}
+
+void arch_accept_memory(phys_addr_t start, phys_addr_t end)
+{
+	if (early_is_tdx_guest()) {
+		if (!tdx_accept_memory(start, end))
+			tdx_panic("Failed to accept memory");
+	} else if (early_is_sevsnp_guest()) {
+		snp_accept_memory(start, end);
+	}
+}
+#endif
