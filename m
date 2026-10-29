Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292851;
	b=wUIj96Bpc8VSP6ZmSitQQocxDTMyQ6HGMHIlVJq3dlhaZ90+F3JCrWfIBs1NwHSCm8R3
	 dtXZE2yV00OIEl2hHu8NCAgoaLbPZQC/giY0OdWWFo6WVZaUKK4pnHOVpemZXhOPh6be0
	 WiFDtB/kkYWY7Rdmz13rhTyx2wrkEfC4fq4fes5sjL9a85Gg3sIXWLqOqLRk2KeN9oPzl
	 NeJqN7zPS5ohTgOqEJJ33YVqZIYBTcJtdG0mX5aO+FptTzUWXprFZ6iszukgAaIJrnd7w
	 Z8lWMqpfHW/EuRLHEfuegPDK8NKqMueaE7JKGwKLmgXbIXZOIoiYKu00jDSpq1XnyiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292851;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 X-Mailer:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=KoCxuWWjDP1yVw1HvFaevXnQ4QC4h2u92EWwxCuPW/M=;
	b=Ip1mxgV9n28fPwFuuuyv3CYw+HJ69ba0lCm3JEqT29t/jDj35/uo7Q5jhZrmp124OwPw
	 SWyfdlPJdFod4RdXXdynhvhC6BP20zZDJV8/kTY25AnNGFna1qd/4JYgaOWIL1nhmNAVW
	 9NRNC/HpNF2TVLtMaVZqUTepYs8J+4rUIUNqClUcaUwz0+yzXia89jk37kUTfIW+oTppW
	 1OL+XG99B5YNQlq3Lnt6W84KlxkYnSHpF54fjesHMP4YcxRKxJCiRiaz5MwCuVxjLU36H
	 Sb3Gl4qSqAOaccborj53MyHhbWOUpvx3E1XdyQBBISRr+MNpRheMVhNTOwss2h+ls4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tEl6cpHA;
	arc=none smtp.remote-ip=91.218.175.86
Received: from mta0.migadu.com (out-86.mta0.migadu.com [91.218.175.86])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1F5606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA1F5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tEl6cpHA
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rJ+GI9mSP2GAsgikWKRz/p+K9ZdSdVmHlMdYCh8VOxs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793292847; v=1; x=1793897647;
 b=tEl6cpHAtlunNNiZkjSyzVXX/bFpNZ1L7FiVP5ZBpqLFUH0FqeQnS6pzgRm2U9zJeRjiJ6kO
 apM1kLT2Cz+JSlxR/feG7HAFpNQxVco7kOxuv88/RzuR5Yf3UMb4ngwHeRIJqikj/ky6pZlNJIL
 91/zkTlXPShxZxzQLgI1yhqM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 66c164750fba40cd;
	Thu, 29 Oct 2026 16:54:07 +0000
X-Mizu-Trace-ID: 66c164750fba40cd
X-Migadu-Flow: FLOW_OUT
Date: Thu, 29 Oct 2026 16:53:58 +0000
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Puranjay Mohan <puranjay@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Ben Cressey <ben@cressey.dev>, 
	Florent Revest <florent.revest@linux.dev>, Bill Wendling <morbo@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Subject: [PATCH v3 1/7] scripts/sorttable: Make the arm64 before_func offset
 configurable
Message-ID: <20261029-b4-arm64-callops-kcfi-v3-1-1b011ad5ddec@linux.dev>
X-Mailer: b4 0.15.2
References: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>

sorttable hardcodes before_func to 8 bytes on arm64 (two prefix NOPs).
Make it configurable from CONFIG_ARM64_FUNCTION_PREFIX_NOPS instead.
kCFI kernels with CALL_OPS need three NOPs. The symbol does not exist
yet, so no functional change.

Reviewed-by: Ben Cressey <ben@cressey.dev>
Reviewed-by: Florent Revest (Anthropic) <florent.revest@linux.dev>
Acked-by: Alexei Starovoitov <ast@kernel.org>
Assisted-by: LLM
Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
---
 scripts/Makefile    | 4 ++++
 scripts/sorttable.c | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile b/scripts/Makefile
index d7fbb7ca098b..7ef1c84cf79d 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -54,6 +54,10 @@ endif
 
 ifdef CONFIG_BUILDTIME_MCOUNT_SORT
 HOSTCFLAGS_sorttable.o += -DMCOUNT_SORT_ENABLED
+# 0 or unset (no prefix NOPs) leaves sorttable's built-in default in place.
+ifneq ($(filter-out 0,$(CONFIG_ARM64_FUNCTION_PREFIX_NOPS)),)
+HOSTCFLAGS_sorttable.o += -DFUNCTION_PREFIX_BYTES=$(shell expr 4 \* $(CONFIG_ARM64_FUNCTION_PREFIX_NOPS))
+endif
 endif
 
 hostprogs += gen_init_cpio
diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 88e49a5c4251..2e951f2f60e8 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -281,6 +281,11 @@ static int add_field(uint64_t addr, uint64_t size)
 /* Used for when mcount/fentry is before the function entry */
 static int before_func;
 
+/* How far before the function entry a patchable entry may be recorded */
+#ifndef FUNCTION_PREFIX_BYTES
+#define FUNCTION_PREFIX_BYTES	8
+#endif
+
 /* Only return match if the address lies inside the function size */
 static int cmp_func_addr(const void *K, const void *A)
 {
@@ -912,7 +917,7 @@ static int do_file(char const *const fname, void *addr)
 		/* fallthrough */
 	case EM_RISCV:
 		/* arm64 and RISC-V place patchable entries before the function. */
-		before_func = 8;
+		before_func = FUNCTION_PREFIX_BYTES;
 #else
 	case EM_AARCH64:
 	case EM_RISCV:

-- 
2.54.0

