Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0D7363082
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557366; cv=none; b=W7peaDAFp23X4N9H0kjSkwAKijNyjEUsgCqWUGn+bq/bX8/6ymmR8wx+mw8xXU1miwj3m1sbMcp7Vr8ljAqg2gkaQI6G5GEufR/keb1qUYX2Dx3TN3V1FIFpJZdntrP8yyhDQV7tr75mrGGHaHIOE6yRH79J5/MGoforAmwHqis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557366; c=relaxed/simple;
	bh=eL4VmYxKZVn7w/eWA9nGuI80ywjmKUwXCi3wAdb0ZNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EqQlLfAYTYl+NN0yLBa6kH8lCdzl7D+oVIzhuWsPdCVkx9FWYG+GFQzqCUgzk3gEJvaAzLyfheCkixqyjenm/Z3bzwVE7QSADEhe2yR1hQWI9pdDgx4gOSUT/dKOM/5MXO37oK3maZShUjMUJ9mx/NVzzIDc7JgQgmVG4Lgqdtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMpVj9Nt; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMpVj9Nt"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48881a62e09so1310449f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790557363; x=1791162163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OzyQDgQq1bA/wltiHBCWNPbU1mUF4Aonoih9p/CUirA=;
        b=RMpVj9NtGW3ULqxUwYazQuvbnDRJcoCzP3OOtKzaFsJaemCcLKtGfwUwD2yByUVAq6
         mmJFyzJsK622kJLP/oHVkNWQS9MEEZTcUQaxq5azx3j7sj4VvqEi7pz0QrUyeD9DbShG
         YJS8vGMpk31t56bIeGfPFKDz4MoYPcngvkhUCLWWpPXkwVrI1UIYCMAsAW8WeLRKhhid
         Xi6nnDt3pdIusBFpxzmWtgtKSVObLRCNOq+/paTSMBM+YU67OUOZysMgnTxVmlncgNjL
         OQsglcjoHm1jopkFqPpfQKgKIQi8MnKkvEW8v9BvRscmYDBVPYrhVFSaG2ilzGZxsbln
         Afqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557363; x=1791162163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OzyQDgQq1bA/wltiHBCWNPbU1mUF4Aonoih9p/CUirA=;
        b=KgcF57NfMSu4Kb2ZCSjQbaRd4OCzLbNJcPC2+J2QhoMvSuqj8sTAKg8qukyzbVKRNy
         /ElywCF3CSTlQg0f5IMlQriez8vHH7r5upHnv32sjObzAt1JrmNpFD/TV2WbqGFs9FkO
         gVBO7/Usqr679l8Dqker1UR8E1PT07feORe68kDF1EXd5im6NUm/mAsV6LO2S2RPwV38
         E0G3bjhl4i/Hi+gbgJ15goOchF8b/pJ0Cl1aHNhOa88tY+x2opK5oUS5cWtTPKL6+6So
         taheggng1P6u/F5lCmUfBSXubmx9V+bhVXA9ZJRZnNCNG5p3kmHoQ0wwwqiOHfrAIod2
         pgJQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5qF6WvQ6u6wXGFhvRfx0KHNkajUDm+hH8/yoVkTfXh9mNMvPJ7rPkMaOdNQ2k7ABql9dG2vESiVdYTLU=@vger.kernel.org
X-Gm-Message-State: AFuF++kq4sEbvbwm2AOiyPQ29/JoMWqrZMLvCXRI/qsD3zoImqVD/to3
	SUejO+OJicbEiNAin3hr7ebxQzzwSBX/iCDbHN6WrEqeHzAJvC1xZJLU
X-Gm-Gg: AYBFou3vuKSZltRaiE48OaJ4O4e/mzm4fKUGS/HQTyFPyLcIQglTVya8kBg4N4jZnOB
	LD50ucazkWBaT6ErC8TUzd+eWlxq0AVpVpfc8GCVyVpC3HBaApcXDBR0s8/eapz4tfhN96uz9WA
	zWjeQcHpM1DDxLKxN4F/oz4iLgOdXTXnJdPe9wfSa4ULfUIQVS4xTVoHI+ZUmXe/a/ARq0mBMmv
	+gNbASCoHObcK955faW0X2DyaD9kUeeqFEcJHx9QXJpphvjIj9GJSQzobpxphr3MK545FQahkTj
	2GgYv3Et9BWuGOurLgT9pdEJ/qfypuMg3eCXKR2bBBbesGoOtPp1VBWCxKYiJdjGoLosgiN7lXy
	2Si50WAuEvIGTXjo/aeAgKUCzAxLGAtyHhT9b0CSEhQv6fbioVVZr5qyA0sSHURqQDO+RGEHTg/
	xGl3CDm3atFa2Jb9bE+ZorHQiDSN7lsrEjCs81o3um/uVx0+RefXtHfeVv+w+5wDRS0QqhoJ8eQ
	MzFXcdfUSl53keu5jqaXx2cUuXM5ptrBpX5DI1o5CdrQf4BK62dcrI8Xy1C1FqF//H6aLfsMDd4
	Xjc6iQZJgpNEgZaJ4PJjfZ6actF4uRAxUvkkIz2y1U8fsiS3weE=
X-Received: by 2002:a05:600c:4ec7:b0:49f:ff6b:bc82 with SMTP id 5b1f17b1804b1-49fff6bc143mr59883395e9.20.1790557362894;
        Sun, 27 Sep 2026 18:02:42 -0700 (PDT)
Received: from mikebook.tail5724d6.ts.net (83-244-142-114.cust-83.exponential-e.net. [83.244.142.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017652d1sm144207825e9.5.2026.09.27.18.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:02:42 -0700 (PDT)
From: Michal Pluta <michalpl2003@gmail.com>
To: acme@kernel.org,
	namhyung@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] perf symbol: Move Rust demangling into its own function
Date: Mon, 28 Sep 2026 02:02:27 +0100
Message-ID: <20260928010227.1903673-6-michalpl2003@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928010227.1903673-1-michalpl2003@gmail.com>
References: <20260928010227.1903673-1-michalpl2003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dso__demangle_sym() is the only place that implements demangling logic
inline.  The other three are one call each to a helper.  Move the Rust
parsing and buffer growth into rust_demangle_sym(), with the same
signature as the other three.

A Rust name that fails to demangle now falls through to the other
demanglers, matching how the other demanglers chain into each other.
A v0 name can't be misread by any of them, since none accepts its "_R"
prefix.  A legacy name can only fail here on allocation failure or
hitting the output bound, neither of which is language-specific.

Assisted-by: LLM
Signed-off-by: Michal Pluta <michalpl2003@gmail.com>
---
 tools/perf/util/symbol.c | 61 +++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 858a14a91f79..89db9a670833 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -2740,47 +2740,56 @@ char *cxx_demangle_sym(const char *str __maybe_unused, bool params __maybe_unuse
 /* Buffer limit for a demangled Rust symbol name. */
 #define RUST_DEMANGLE_MAX_LEN (1024 * 1024)
 
-char *dso__demangle_sym(struct dso *dso, int kmodule, const char *elf_name)
+static char *rust_demangle_sym(const char *elf_name)
 {
 	struct demangle rust_demangle = {
 		.style = DemangleStyleUnknown,
 	};
 	char *demangled = NULL;
 	size_t buf_len;
 
+	rust_demangle_demangle(elf_name, &rust_demangle);
+	if (!rust_demangle_is_known(&rust_demangle))
+		return NULL;
+
+	if (rust_demangle.mangled_len == 0)
+		return NULL;
+
+	for (buf_len = min_t(size_t, roundup_pow_of_two(rust_demangle.mangled_len * 2),
+			     RUST_DEMANGLE_MAX_LEN);
+	     buf_len <= RUST_DEMANGLE_MAX_LEN;
+	     buf_len *= 2) {
+		char *tmp = realloc(demangled, buf_len);
+
+		if (!tmp)
+			break;
+		demangled = tmp;
+		if (rust_demangle_display_demangle(&rust_demangle, demangled, buf_len,
+						   /*alternate=*/true) == OverflowOk) {
+			tmp = realloc(demangled, strlen(demangled) + 1);
+			return tmp ?: demangled;
+		}
+	}
+	/* Failure to grow output buffer or buffer exceeded sensible bounds. */
+	free(demangled);
+	return NULL;
+}
+
+char *dso__demangle_sym(struct dso *dso, int kmodule, const char *elf_name)
+{
+	char *demangled = NULL;
+
 	/*
 	 * We need to figure out if the object was created from C++ sources
 	 * DWARF DW_compile_unit has this, but we don't always have access
 	 * to it...
 	 */
 	if (!want_demangle((dso && dso__kernel(dso)) || kmodule))
 		return demangled;
 
-	rust_demangle_demangle(elf_name, &rust_demangle);
-	if (rust_demangle_is_known(&rust_demangle)) {
-		/* A rust mangled name. */
-		if (rust_demangle.mangled_len == 0)
-			return demangled;
-
-		for (buf_len = min_t(size_t, roundup_pow_of_two(rust_demangle.mangled_len * 2),
-				     RUST_DEMANGLE_MAX_LEN);
-		     buf_len <= RUST_DEMANGLE_MAX_LEN;
-		     buf_len *= 2) {
-			char *tmp = realloc(demangled, buf_len);
-
-			if (!tmp)
-				break;
-			demangled = tmp;
-			if (rust_demangle_display_demangle(&rust_demangle, demangled, buf_len,
-							   /*alternate=*/true) == OverflowOk) {
-				tmp = realloc(demangled, strlen(demangled) + 1);
-				return tmp ?: demangled;
-			}
-		}
-		/* Failure to grow output buffer or buffer exceeded sensible bounds. */
-		free(demangled);
-		return NULL;
-	}
+	demangled = rust_demangle_sym(elf_name);
+	if (demangled)
+		return demangled;
 
 	demangled = cxx_demangle_sym(elf_name, verbose > 0, verbose > 0);
 	if (demangled)
-- 
2.43.0

