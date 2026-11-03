Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670787;
	b=ICKboZtiGOMyQEHNoXPXXGvyD9LIF2vc/byn9DYzwWD4Gj8UAuX0U04fwpGBhyPhMj2f
	 sSlL2c4NApqtgOmuOPhGPopOMLWnP7wacTdERprItcoIUcVT9yVYezexzAnSyyQCXITXZ
	 1j4NzdvffPPcFvkqU2rqgnhHmoMIpbgsUeGuqlqqK/0Ww9wLhZ1d9kWkXXJ/gWwWJEbZT
	 MOJGL+KKEtrC6w/utHwiwWXcf03s7SbI6GqL0KeXcq0VSgOsIyONnlZE6DWm5Z71iURma
	 lUJGNAX3MIJS5Pb1k2tfIN/tsi5xJWhBJFvGFpmNqVM7OKwZMo7iklQ+bCGVyGH0qkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670787;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=w78hgx36qeDHkysHaTIEABwBhJjJACJ9wwYhJIydxFc=;
	b=KsNsKsSqyukLIAJIAKYQ7GGgDqHHDVqjzMvIAwXSKM6CL5o3aXPGbZPS6pxr+5CCumxx
	 ZXNbLn38z/6bmESWPH1yVYvTnXPNbnlz8tSchalBIYnKWyQYKl4N4bUFopvJN36wwncYu
	 3VV76Zf8S3ijENnqHo9yC35j1Lfqk2vfSbOyIjdwAzMYsoWtYuHYm/2QYFdeb1Ag/MH7m
	 vsn2AWu+jmuGuHFp+kHrw6t1WTPtc2rEqxAbXcSkDQiLSd87e/UhAJrMAnbC1UjqHBSot
	 397A9OXYkYhniQ+3TItJyz85ZPkzgARf77wr5CDD1IVwwZXSPgErnXT5oEaCQRblCXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cxa4X7ev;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FDE606D80D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cxa4X7ev
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EF11F00919;
	Tue,  3 Nov 2026 01:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670787;
	bh=w78hgx36qeDHkysHaTIEABwBhJjJACJ9wwYhJIydxFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cxa4X7evwgmhT/qasL4MLE40CUJG68EkUsdVHT/Ffy3m7G0JcbTOYTr0zP5scp3PS
	 2eh25X1AYw7idPIJDzKt3eCz5iliLqquqNtpYuA3rD4uAq7ha/S76JpnFIDgfaIQA8
	 DDay2j6pyQfl3lV+tFuh/AVJnQVVdjTjtJ3IR5IUrMbpksgXLuDwwHqZt+FTTtqEkE
	 9joqTQBzhLUgfxladE2Zg/y3FTLxyGM+Ex3G2pAWc6g+aGmtG+AoQzz7VKYXmZInzy
	 XEYvCIsAA+HXqDWTrkuguYVYHh8zD4Hnh+gH9Mgq4cS4A3A03FGCXOPy+u2VgrHZfn
	 WdyH+V9M+Ep3A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Chuck Wolber <chuck@wolber.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Subject: [PATCH v2 13/20] x86/entry: Stop excluding the entry code from KCOV
Date: Mon,  2 Nov 2026 20:52:31 -0500
Message-ID: <20261103015238.3780910-14-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103015238.3780910-1-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
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

The x86 entry code has been excluded from KCOV since commit 20355e5f73a7
("x86/entry: Exclude low level entry code from sanitizing"), when
noinstr couldn't keep KCOV out of noinstr functions.

Since commit 540540d06e9d ("kcov: add __no_sanitize_coverage to fix
noinstr for all architectures"), noinstr implies __no_sanitize_coverage,
and on x86 objtool removes any KCOV call left in noinstr code. KCOV
instruments the code after inlining, so __always_inline helpers don't
carry it into noinstr functions either. What remains instrumentable in
arch/x86/entry/ is the system call dispatch and the ptrace system call
hooks, which run in task context.

Drop the exclusion, so that noinstr alone keeps KCOV out of the x86
entry code, like it does for the other coverage implementations. A
traced read(-1) now reports 18 instead of 12 PCs, the additional ones
being the system call dispatch.

The generic entry code has to stay excluded, but for a different reason
than its Makefile gives: parts of the interrupt exit code, such as
irqentry_exit_cond_resched(), run after leaving hardirq context, where
KCOV adds their coverage to the trace of the interrupted task. Without
the exclusion, they show up in the traces of system calls interrupted
by the timer. Document that instead.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/entry/Makefile | 1 -
 kernel/entry/Makefile   | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/Makefile b/arch/x86/entry/Makefile
index 83b4762d6ecba..cd24c28358f97 100644
--- a/arch/x86/entry/Makefile
+++ b/arch/x86/entry/Makefile
@@ -5,7 +5,6 @@
 
 KASAN_SANITIZE := n
 UBSAN_SANITIZE := n
-KCOV_INSTRUMENT := n
 
 CFLAGS_REMOVE_syscall_32.o	= $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_syscall_64.o	= $(CC_FLAGS_FTRACE)
diff --git a/kernel/entry/Makefile b/kernel/entry/Makefile
index f220bae86b123..2c837b7513c71 100644
--- a/kernel/entry/Makefile
+++ b/kernel/entry/Makefile
@@ -4,6 +4,9 @@
 # as long as these things cannot be disabled per function.
 KASAN_SANITIZE := n
 UBSAN_SANITIZE := n
+
+# Parts of the interrupt exit code run after leaving hardirq context, where KCOV
+# would add their coverage to the trace of the interrupted task.
 KCOV_INSTRUMENT := n
 
 # Branch profiling isn't noinstr-safe
-- 
2.53.0

