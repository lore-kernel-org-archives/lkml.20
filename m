Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4288547040;
	Sat, 26 Sep 2026 19:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790450953; cv=none; b=fXcXIs6KAUqYLSt4c14g0Dhvt4BZ0wSbrWO7eiAlB4Wwx464oTcjmgOXnwzjKgqiHawunM2cz9fkjZ9yq+UbmCjNoC/fzflYcyM90FFZSvTtWmILk+6xb4PjiWy8LtCd4qbIwXIBzjPo7F8FArLctSQj3ADkYaCu/lJ8C4T9AAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790450953; c=relaxed/simple;
	bh=a9Hfq/vZFXQnmeh6rVuwkocvTyJgrDUR/bBEUF6+mTI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=atThh7PLNbSKIZYpsNKHQcs2gjzDqm1Ytdtx/uUNw0PrOZnLzJfs1v2vejUrZ4Bn0i+LwmbGHWIrVyk/GZqgTjdxOjIecUcAddYDBsTP5w3cogcDEjY7xI+PnNOcjG9O6NRLKg4JECIo+Rt2dR5y3BfWOTnHcRw8KS6r7D3pDP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Pkpp+PlB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6aB9rlo7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Pkpp+PlB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6aB9rlo7"
Date: Sat, 26 Sep 2026 19:29:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790450943;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrzJdPknFlwJsA7qbvWX9L5rvFEJbZGuiLxYKlxzsLU=;
	b=Pkpp+PlBtnTnF6ZckWsawYB/XN5rOgPaQ7tjzkf5y7bAzueJSmyo7Qm8Yt2pZ5UaQtSI5t
	BUKL34Vlcz7E8Vc9tu61CNEsgZqPwxkuMJHAD+vbsO6tSuy1jWUtUaB6S2t4FbBDiC3EZf
	Bd9RPMgw528e82Xx0x/I7NE4wNa2vt3+VAOt9LGnC5ioPlMyjL6YPAqjS22Dbb2yvqnyVN
	/fHuehnABN0G5KlOEzZJG8CHFDP9LkhFEh1XUqTvGYkiInXA3+lDO28TdhPl4tYU6oUOkv
	BoYxB7K8ee1ZpIsnRr0x7f7VI0gZCewYiz95wmi9CyFvUic6GDEPJSE98+R3CA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790450943;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrzJdPknFlwJsA7qbvWX9L5rvFEJbZGuiLxYKlxzsLU=;
	b=6aB9rlo7BZ/1mtzrdxQDJLhT13ub3IUtWq6fhmSO4zgZLREbXHahMUZfB2JLGcPTuQz0cb
	X4XU2iRfLRMpU0Ag==
From: "tip-bot2 for Eric Biggers" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/fpu] x86/fpu: Remove additional remnants of math emulation
Cc: Eric Biggers <ebiggers@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260926174545.55533-1-ebiggers@kernel.org>
References: <20260926174545.55533-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179045094172.3910103.6652246869256676786.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     7606d01b963fc3e4e19dd53ca6c5fdd97f7bc1d7
Gitweb:        https://git.kernel.org/tip/7606d01b963fc3e4e19dd53ca6c5fdd97f7=
bc1d7
Author:        Eric Biggers <ebiggers@kernel.org>
AuthorDate:    Sat, 26 Sep 2026 10:45:45 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sat, 26 Sep 2026 12:01:48 -07:00

x86/fpu: Remove additional remnants of math emulation

Remove math_emu.h and the declaration of math_emulate().  They are no
longer used since support for math emulation was removed.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20260926174545.55533-1-ebiggers@kernel.org
---
 arch/x86/include/asm/math_emu.h  | 15 ---------------
 arch/x86/include/asm/processor.h |  2 +-
 arch/x86/include/asm/traps.h     |  2 --
 3 files changed, 1 insertion(+), 18 deletions(-)
 delete mode 100644 arch/x86/include/asm/math_emu.h

diff --git a/arch/x86/include/asm/math_emu.h b/arch/x86/include/asm/math_emu.h
deleted file mode 100644
index 3c42743..0000000
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
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processo=
r.h
index ec9db0d..77488ff 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -10,7 +10,7 @@ struct mm_struct;
 struct io_bitmap;
 struct vm86;
=20
-#include <asm/math_emu.h>
+#include <asm/ptrace.h>
 #include <asm/segment.h>
 #include <asm/types.h>
 #include <uapi/asm/sigcontext.h>
diff --git a/arch/x86/include/asm/traps.h b/arch/x86/include/asm/traps.h
index 3f24cc4..e13f102 100644
--- a/arch/x86/include/asm/traps.h
+++ b/arch/x86/include/asm/traps.h
@@ -37,8 +37,6 @@ static inline int get_si_code(unsigned long condition)
 		return TRAP_BRKPT;
 }
=20
-void math_emulate(struct math_emu_info *);
-
 bool fault_in_kernel_space(unsigned long address);
=20
 #ifdef CONFIG_VMAP_STACK
