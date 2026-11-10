Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348529;
	b=OE4UL+WBOd7SPMYr0s34Uo2386jIbEHSBf2uYQysozcLRH9wNqk7jpKiX1YtbX0UufOG
	 PSEOnqVPh1fOr02tjK4+sIY85vj73O/4TOzrhSe1FYYVohF2nuyQ+3BCNm4D3i6Go+3yK
	 TYszBvm9eUVokZZvy526/Q8zmV8M3dTGI9iZNoRTXmYLyU5Arp3fA76VodnR4/HtuSIdf
	 xKRG1yyq2wefhjGvg8nHi2a9EcWOpPZlYFjPNLKIXCgPLhVd0Nsk7eDHDUn1sj6f8FRcZ
	 xd64Jakht1CCS2/Lka4fLWJu3raWiUYX+F8Px3QVMhqD3IEUwQgpL1bpazZ+J2tRfTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=XGNKZ7qMS5Tp3ggHy18/9Tavv7bRHNEXDq2Mqizjklk=;
	b=SAmQ3oN5nnkzmiRYcZ8ch71XB9Pyyckj78qhZYj6L47wowModZZe78x7Owbe/PNmMHL9
	 C5+9GlS4uhTA5yI9RYUgz0jO2rpx83Ypux9DhKf5S5FxiaDDluJfQ0hqfG0W1EOFnr28m
	 zDoIU4XB/sLqcURIhrwbA9+Qj74TxKIGewuJ6KhYTLbmq0V06PTW6ObcS4KB8842Pb277
	 wKjyL6EoQqt8yI8o/KzsEZfZXhkBL8BnUKP37OCXXmB4fnun7kPlQEODuVWcQ8oEDPAFA
	 7O+b6GpCq8wV2Xt61AIb0qZVTaL9i4IBKYV6a6kaxxsPpJYPGS+RoQxF5HosYsDSsDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CtPVwZkk;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CF5606D522
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4CF5606D522
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CtPVwZkk
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4408262eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794348528; x=1794953328; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGNKZ7qMS5Tp3ggHy18/9Tavv7bRHNEXDq2Mqizjklk=;
        b=CtPVwZkk5rpUNaYiqSjHT0pe5ti0zQy0EUaoS1QriuZqoHj33qT61xERuNGsPECmTa
         Sohjnv0dVPcCIHSv0lxDuoRESyfnOE3lVmUzYtSc5x/bQWYqiJX81TsGluh/MrVzB69Q
         vpScJFvppM0OlcpJ6M8wA6RMGDkgCNfhOvN+j9HRtYIRdGhGiSzzKE4jFEOfiTtBCmad
         g0D6RLFOfXh+YieqQhFoFezljkeopfrCX6lyHeeg06Nwc3e6SbNY0onC/N7N2uillAS7
         QmiMzD9mcJFZ9/3F/EnG3wK/ug5ajqwVaXfjySAnPggnw/AmRA2IcO1HKNbZFF0IQRE4
         EWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348528; x=1794953328;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGNKZ7qMS5Tp3ggHy18/9Tavv7bRHNEXDq2Mqizjklk=;
        b=RVlu1trqQB1Ltl5o5bRpqFrtwJTJ+mVv7h6Zw9/5Q3rKYb7xvIAgXbV5+M+5C+W9Ug
         OiUvM/GDd2kf06XleavFxZ2nQOYGYR0U0mrVgPvRtzIAkgT7r6xkA+qBvsdjQOMAvo34
         O8Z66adNGyYHFFpwbli8fqf/eHbiVslp39MT5Qk3uhkeD1NGuONosNElwAy3dJwZ3ztB
         nITRmWY43ejl5Yjh/5A7oRwGedrYQsUoDfTLl/K9TV/a7daCq2ssf7mDvhJDyyYuvEXC
         Q/aubOfnNk8z7PNx3/X2KmkA1EwBfVomULB1IEpm5PUqG4Y05FLUOiwki7Mj+BfKfCob
         nieQ==
X-Forwarded-Encrypted: i=1; AL+hErFUHKzr+05sHF+oc5tVw/kWROc0ugjVycV0k4h0k3UR7SrrlrbD2HVxIEgW30nUcvCqevReWx6HrI44SN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+t/3vt5gok09KdiOJ+UkAMCpbhLdymLd2qb//raUoWFMz7bgP
	Ph4kpq+g3fs0B79v9rUym2Y28BJnJSMDwlZuUeIwmSb89g3xQPBQfX2Xbyjbnh8ANMFkH4pZ29w
	PPHyBE/ZBoA==
X-Received: from dlbur22-n2.prod.google.com ([2002:a05:7022:ea56:20b0:1a7:58c6:c957])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7e88:b0:182:94d7:f76a
 with SMTP id a92af1059eb24-1b3c03745edmr409318c88.43.1794348527403; Tue, 10
 Nov 2026 14:08:47 -0800 (PST)
Date: Tue, 10 Nov 2026 14:07:54 -0800
In-Reply-To: <20261110220803.2503416-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027231513.816148-1-irogers@google.com> <20261110220803.2503416-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110220803.2503416-12-irogers@google.com>
Subject: [PATCH v3 11/20] perf demangle: Add fast-path prefix checks for Rust
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
2.56.0.542.g3ef89b7020-goog

