Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E55E38E5ED
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790444768; cv=none; b=ZgBSH4yYWTybN0Dm4Cz6BwEeqMUhUKKXvY9NwoTBPWx2R87FN6rB37ZpUqthi3H4KEthSjjQRZOzA9Y0FTPMdq0KiCL6FDo5dQvkLUNetpnqWd3mz3WV2UysU2153nJaNN16HyDLzRjX6cwMmqJ49XqgK9H4YTPNoXoB4d+RYck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790444768; c=relaxed/simple;
	bh=EsanyJd1ry7IS/PKENhlUIl0A/HJjq17akdwIQtFDVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UBOQTt0AwDfjDbMuC54ZS00oKtKuKsXzzIpb5wBL46OPULnKspkvJB8Ow2dP0h+fzHqQh/QStFBQ1yEJj2rSC2hKLjuEtgLrRofsIHL7PdoQal2fJZZ6KlDHUwro8gkZaDM/lP92bomzY3hWcv0CTs1QasNpR0+gsP7szasYQMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ca2sZU+V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ca2sZU+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C811F000FF;
	Sat, 26 Sep 2026 17:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790444765;
	bh=DKziStOl9AVfMuo/laP5NkL+4RGRVTRGDwRoliVScP8=;
	h=From:To:Cc:Subject:Date;
	b=ca2sZU+VxlnwKvXWp7CY08srBSdK5f+YN6UkW4QGOWHJQ6BA7OhiZg9/4S43cx7zS
	 3RquEo0njr+CUXw6v488jE55uIsmqm7TozOlMfBIZvzVIDiIryr9/52t9S6SNJLAkT
	 G69kvnPYImi6cOUsNXUhbTvjVGhG7WO9Oq8YO+to1AuyEJy0RZWDG7lf7XQLaKEsT0
	 duQAVjgNfql92+ue0ZcSlxC02jmTd3v6N5rdBjzdeJM/7WcNPcOa4ze6vMJzLw2Fzm
	 gyZqG56PzD9raDaYHSOA76b8Pox8ILMCC+ucumcw66Bwao2LTYQMWVZlIcgRtnE4p1
	 3pRChVptxoMkw==
From: Eric Biggers <ebiggers@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] x86/fpu: Remove additional remnants of math emulation
Date: Sat, 26 Sep 2026 10:45:45 -0700
Message-ID: <20260926174545.55533-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove math_emu.h and the declaration of math_emulate().  They are no
longer used since support for math emulation was removed.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/x86/include/asm/math_emu.h  | 15 ---------------
 arch/x86/include/asm/processor.h |  2 +-
 arch/x86/include/asm/traps.h     |  2 --
 3 files changed, 1 insertion(+), 18 deletions(-)
 delete mode 100644 arch/x86/include/asm/math_emu.h

diff --git a/arch/x86/include/asm/math_emu.h b/arch/x86/include/asm/math_emu.h
deleted file mode 100644
index 3c42743083ed9..0000000000000
--- a/arch/x86/include/asm/math_emu.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_X86_MATH_EMU_H
-#define _ASM_X86_MATH_EMU_H
-
-#include <asm/ptrace.h>
-
-/* This structure matches the layout of the data saved to the stack
-   following a device-not-present interrupt, part of it saved
-   automatically by the 80386/80486.
-   */
-struct math_emu_info {
-	long ___orig_eip;
-	struct pt_regs *regs;
-};
-#endif /* _ASM_X86_MATH_EMU_H */
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index ec9db0dfa0dff..77488ff5eb8c7 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -10,7 +10,7 @@ struct mm_struct;
 struct io_bitmap;
 struct vm86;
 
-#include <asm/math_emu.h>
+#include <asm/ptrace.h>
 #include <asm/segment.h>
 #include <asm/types.h>
 #include <uapi/asm/sigcontext.h>
diff --git a/arch/x86/include/asm/traps.h b/arch/x86/include/asm/traps.h
index 3f24cc472ce9b..e13f1025c62e0 100644
--- a/arch/x86/include/asm/traps.h
+++ b/arch/x86/include/asm/traps.h
@@ -37,8 +37,6 @@ static inline int get_si_code(unsigned long condition)
 		return TRAP_BRKPT;
 }
 
-void math_emulate(struct math_emu_info *);
-
 bool fault_in_kernel_space(unsigned long address);
 
 #ifdef CONFIG_VMAP_STACK

base-commit: 67639ee98521c1592190c5c67047067a9c3a3fd5
-- 
2.55.0

