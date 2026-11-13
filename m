Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590314;
	b=qg8DRnmvy3XhYuKmQxVjIqQPeYp9nWHAXFutUhg0EWnLJOB5sGIKXab5yViQ/tJP6bTq
	 nQLbY3rkJOq55YhVfdpyUnayzz2ZlpAt/Ekm+Qu9bhN2SdLzr1WLEYcK7gvVkAOFn+eWL
	 rggrkWiICeK5U2aCgZgPMLCgyg3wgKwfHUeqDh4TNiI7fDW7MsWqB1AVpgGVTzrxZtEu3
	 vXhrlHAUTmIMI94JkuPXZcL4tYaocMEG6Rm+DkerJUTzFRw0fNUp5hQJPEHf+XNaZaqVq
	 1BdB6SovPD3Evx5k+lUumLaOou1/1XNbpBGO16XQmA3k8OEcSJbSW53xbKsf6Ziqdaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=DoGiL5U0zs7GL2/JDFKi5D+u1zoCO0bvFJ6uJO6+43E=;
	b=Pcq1y4sWOt+NG37CUjYJqg/haD/wliWz0gTWGtM8hGLrF9Rln3I5yN7Iujye5n2Hj9fk
	 f/cPPFLpMPo5vTzkThnHbLo4WT5w0CwCi9pP2HhLqEnw3UMVtRmDOF2NGncImLj8deMMm
	 zMzmIasNi3BdPFQ1IyQm5tanuO6H2x0ARlx1VnAQpLtgR5T/0Ii2drmYcia4sk074V0Zu
	 IEKAXQdPkEDBJjTsfUeMhmbL8/dyXTJBkL94k/Qp8KMnvUmoj10i6F5bDogAIgiA76+nT
	 zcguShINKq3n+51JucZnwNNPuIdpawWhSI1LABKT8LyvVMD3j/kul1otYypaiQ/Wcww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QlFLX8WG;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B819607D2E8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B819607D2E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QlFLX8WG
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-378722fd4a3so1400571eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794590312; x=1795195112; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DoGiL5U0zs7GL2/JDFKi5D+u1zoCO0bvFJ6uJO6+43E=;
        b=QlFLX8WG0QiTbv1GLjKWe+J3fRlKx1AUN3rYaTTAYBb4Oqg/fXjeXtzUPZv0yV3OvA
         yJCIBP6QrJysV8/YIBwmNT4crMzy5XyI3LPo2gGUrHRff41zKfqxnNTs8v5kFpAAkuPi
         Lm09JL78DL3Do29VAE6ZoyoyXxy3pWA/ARZAp/5r8NEdDsgztrDE2TKQ1XS2jAYYeSNk
         DFJXT/rqzqjSbaJI3tealCiZMYFY/L0PuT9YElk1Byk3KHzKoTiL6KvhavxHk1LrNdQk
         KpJFJ7Bsq0u4dqdiIEWbRbpLtLnXrj0W+DUEH/X9MJQXKIS3JBzS/jZv6zziiHkgpRdc
         fTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590312; x=1795195112;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DoGiL5U0zs7GL2/JDFKi5D+u1zoCO0bvFJ6uJO6+43E=;
        b=UXiFWluenwcq8ktkwFftIJ8Bk6oG2PEkc9wDYdmGjIU0QP5Ix+mIX1BS0vxPrdq7s1
         Hv82SLeIA7hlzh5VQpzvUmbojvynJ9RbTP/GidCvFXf+06Lsks0NxQOqtL0/4hQ++6gM
         JldfK54q2hCPMT5i9CA9zC1FKPJa9B064hz/O3PRkxn4XKLYKse/W7BC/kmDglD5j2Fc
         UeuanNpZPf7BINxKUtwdpuCg2qD/RMzp3phiZiNFK4f3YM92+K1I3FTc01nMwVNG98l+
         AFc3WMAGOkkrstSRNEeXRo06dBij69LjHAyJX7vQb5iDYeP4GTSzzIaKm4NWz7ckY5wx
         QcqQ==
X-Forwarded-Encrypted: i=1; AL+hErHz+KCFZmQW4Jy64FP757sWPZ4w5xqAwZ2MboA1vWzzULH3jA/lihejTSQPoQnLJQXbGtTNlLqeebGyE3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fGVDF+NkhoqTbY2ZGtulgq1h/4IYGvfMy7gr1Mh6jF3FxPHYG
	ZrQKrIKuOA0HnmyRpczAMatGffZxRMcD9P42U7a5/RHl/oKP+64bJIIAtJPx/SnfhMtP9mTsS88
	ZSpRy4/nAXw==
X-Received: from dybqo12.prod.google.com ([2002:a05:7301:678c:b0:35d:1771:4816])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d814:b0:36f:be1f:1191
 with SMTP id 5a478bee46e88-37a8852abe3mr490970eec.29.1794590312071; Fri, 13
 Nov 2026 09:18:32 -0800 (PST)
Date: Fri, 13 Nov 2026 09:17:25 -0800
In-Reply-To: <20261113171734.2188066-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110220803.2503416-1-irogers@google.com> <20261113171734.2188066-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113171734.2188066-15-irogers@google.com>
Subject: [PATCH v4 14/23] perf demangle: Add fast-path prefix checks for Rust
 and Java demanglers
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, haghdoost@uber.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

During DSO symbol loading in dso__load_sym_internal(), dso__demangle_sym()
is called for every ELF symbol. Both rust_demangle_demangle() and
java_demangle_sym() previously performed string searches or buffer
allocations before checking whether the symbol name could possibly be a
mangled Rust or Java symbol, adding unnecessary overhead on plain C
symbols.

Add fast-path prefix checks in dso__demangle_sym() before calling
rust_demangle_demangle() (using strstarts() for '_ZN', 'ZN', '__ZN',
'_R', 'R', or '__R', keeping demangle-rust-v0.c unmodified relative to
upstream rustc-demangle) and in java_demangle_sym() (requiring 'L', ';',
'(', and ')') to reject non-Rust and non-Java symbol names immediately.

Using 'perf bench internals symbols':

  Before (perf binary):
    Average DSO load + sort: 7.348 msec (+- 0.069 msec)
  After (perf binary, -4.2%):
    Average DSO load + sort: 7.041 msec (+- 0.051 msec)

  Before (libLLVM.so.21.1):
    Average DSO load + sort: 81.196 msec (+- 0.780 msec)
  After (libLLVM.so.21.1, -3.2%):
    Average DSO load + sort: 78.599 msec (+- 0.857 msec)

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/demangle-java.c | 23 +++++++++++++++++++++--
 tools/perf/util/symbol.c        | 15 ++++++++++++++-
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/demangle-java.c b/tools/perf/util/demangle-java.c
index c3cb327ed562..5625c4de39eb 100644
--- a/tools/perf/util/demangle-java.c
+++ b/tools/perf/util/demangle-java.c
@@ -158,14 +158,33 @@ char *
 java_demangle_sym(const char *str, int flags)
 {
 	char *buf, *ptr;
-	const char *p;
+	const char *l, *semi, *open, *p;
 	size_t len, l1 = 0;
 
 	if (!str)
 		return NULL;
 
+	/*
+	 * OpenJDK JIT symbols have the form:
+	 *   [prefix]L<class>;<method>(<args>)<return_type>
+	 * where the return type (such as 'I' for int or 'V' for void) is at the
+	 * end after ')'. In __demangle_java_sym(), the parser starts in
+	 * MODE_PREFIX and only reaches MODE_TYPE (required when ')' is reached)
+	 * via 'L' (MODE_CLASS) -> ';' (MODE_FUNC) -> '(' (MODE_TYPE). Verify
+	 * those delimiters appear in order before allocating the output buffer.
+	 */
+	l = strchr(str, 'L');
+	if (!l)
+		return NULL;
+	semi = strchr(l + 1, ';');
+	if (!semi)
+		return NULL;
+	open = strchr(semi + 1, '(');
+	if (!open)
+		return NULL;
+
 	/* find start of return type */
-	p = strrchr(str, ')');
+	p = strrchr(open + 1, ')');
 	if (!p)
 		return NULL;
 
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 0deda26181e0..cea8b9db8cd3 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -2732,7 +2732,20 @@ char *dso__demangle_sym(struct dso *dso, int kmodule, const char *elf_name)
 	if (!want_demangle((dso && dso__kernel(dso)) || kmodule))
 		return demangled;
 
-	rust_demangle_demangle(elf_name, &rust_demangle);
+	/*
+	 * Rust mangled symbols start with one of the prefixes checked by
+	 * rust_demangle_legacy_demangle() ("_ZN", Windows dbghelp "ZN", or
+	 * macOS "__ZN") or rust_demangle_v0_demangle() ("_R", Windows dbghelp
+	 * "R", or macOS "__R") in demangle-rust-v0.c. Check the prefix here so
+	 * we avoid calling rust_demangle_demangle() (which scans the entire
+	 * symbol name with strstr() and strlen() for ThinLTO ".llvm." suffixes)
+	 * on non-Rust symbols, while keeping demangle-rust-v0.c unmodified
+	 * relative to upstream rustc-demangle.
+	 */
+	if (strstarts(elf_name, "_ZN") || strstarts(elf_name, "ZN") ||
+	    strstarts(elf_name, "__ZN") || strstarts(elf_name, "_R") ||
+	    strstarts(elf_name, "R") || strstarts(elf_name, "__R"))
+		rust_demangle_demangle(elf_name, &rust_demangle);
 	if (rust_demangle_is_known(&rust_demangle)) {
 		/* A rust mangled name. */
 		if (rust_demangle.mangled_len == 0)
-- 
2.56.1.703.gf848ed807c-goog

