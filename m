Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9689353A82
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557363; cv=none; b=BhRSswzMhpN9YiRNMLPPWePxvjFYkE18BJtP6JbCxqvtJLaFj6ESe69sgb1Ong8qpJ8KLolvgt1j1G5L2xKoL5uj375hb002nq7BS554fTkMuxp33TrMlamgzqo/ahUqbJY3L2v0fjlPriq9yFZ3u15RiBzXcskA7lCq0Qd5Qds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557363; c=relaxed/simple;
	bh=YeaJ4Ia0VTq5E1Pkw5SVDSdPOiqtRjvDNNn7V/os76g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lyX8+EwMma6OnCqQXKy5OEAPeyZxACq96fM/KyvAAqTYgHb7/G8xTrajfwkqBKzIUZgN09nMOvdWmAtYj/u3Ld6OeMLfzNVuoE9tX3c1ARE4G2b+9n5VIq46sNyT0woPNYrkI2a6tEeSzQg6VPBo5+pWJMaOG65CIbSU0cnt9qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHccM71A; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHccM71A"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so18630655e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790557360; x=1791162160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gD/C8uckJi4Nxey0HiO7Rb21XqdULzwYOsQTHmvqetg=;
        b=kHccM71A+E/6RLdRyGkCyygfTREtsDo9jvMw7ZGxZ55/crVo8SF3Sr7IMm5NIdRIcI
         hysYYkcv/CtOj3uGpM77XHyoaLA7a6kdnAEJmpe87eQF48W2OyT6zNVUYK8VZo1A+XBh
         pSvcfdyPwSE9M2PKLs/HrUsFESPQJW/YUa8ipSPOJdMrdl7au0m02iiiD0DDs71CpanZ
         /9/kbv5RxiyJXK8ByEoWqiG35sroRM40+nvo3WrcC8InFNHen12b3e3IWaBwFhG1lFsv
         BSJbgE7f+UdvOxAbgpU2FZZfuZHy0D6sxxBjGquh4neYNMytVn2U6bf1FcaMyBY+8Vjy
         wFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557360; x=1791162160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gD/C8uckJi4Nxey0HiO7Rb21XqdULzwYOsQTHmvqetg=;
        b=RNgvoeZkcp2eNtk+z+5nNhCtDL18/WK0DPw9LUPxdee/GmguUDjdSNROUBZhAbxR93
         7svYC7Jby65Ac4/L9CPl8pxCyFI9sxhH1MgsIPqJ8PXHF6lGB8yhVzL3DtDTaAQ5JUIg
         /Xz0vsfbLyJN3IeY4giPFTnV5bPsArUQ1z30gv7Fn2dt2pg0ZLwBEbvgyf9H2o0t7Upi
         Y6A8+dsmtV04xjCzoXlZ/vU9Mukbj+47OyD39C8YfiYI2xqlgAwmvAadZ1m9JuCsVn7b
         cVtfz1opmdPWW+J7pW/pGAkV0Lc0VmW2+WGxAVWC5v1cs/H4e+PYTWPXeEKFGy4O8eR9
         wDSg==
X-Forwarded-Encrypted: i=1; AKwUvByUrZQEMFcKwpV5ifGKrjkjVzwptTbLmKDgLAnAXxKuwLwGzRnjt5RayjN0tgGwfRaMUsWkyP+wl7b7nVE=@vger.kernel.org
X-Gm-Message-State: AFuF++kMlyOJE4UqKf5rEwNAwfdGt5J/dmSDVU7v0WvdfgWlhUkQnjHI
	kGc2rgNrFZPcYrJIkIb9SozJ9l6aIzb+1hahlGkkfVzXmuwAWk9q3VCK
X-Gm-Gg: AYBFou3ZhQoqMJY4n1HbeLzGukYSixCUxH9+8mfz/emv+QVP/Cu2eJ3QprrOGfDXL0w
	+ObhovIH/Irk5dVDVLj1xBOwaDKgKoxCd5oUom3+iJ8DY806MOObct0MeTXIIFI55+Ygvy2hzP6
	obTBSptuywMNMSTpKC0RmqlBo/+w7qBdLSg0BHLWcUry/zWKNLzXWnr+QwLW3uRxHo1J3faNwnR
	e/Fd8jH4WSTDQK7H9KkvUjZQZHjhSTrsEHbGNKyNgttrOlg7Au2/s27dSPwHrSvPcL5E8CvLIDg
	qDx7cjnNoYVg7tyXTK2HZAicy/UP7fYyMUrsxQIJCqWCzYpMicOIg7VcZyizflHdw7UeH2Z0O/k
	DFAdkk4P+FkElQ/HBq88lVdjlZwzOAzr0WAzELjLOfMBOCSUSfq0wtV77TTK5/ga6vNIo8EQbGa
	UyMqQPyjX1fE9aSYX6gzjXfK1at/wO1c9xFpuxxx8GpjuMCM3NfixBqZXBh2h1Id0AvAzKDqMPw
	EZkAXugWZwfVcwxtWVnuz4tHD6gglL9cwLAA5zQQZ8S7oOy4zWSkB6T5Gh+lXNkG+g+zqcC6C3g
	yZsPlWAIgykovY3v+jpd1ElkcuWYfuQseB0Q8qNXpWDC1Wo6yDs=
X-Received: by 2002:a05:600c:4e55:b0:49f:bd3c:bc1a with SMTP id 5b1f17b1804b1-49fe66f506fmr192589715e9.21.1790557360115;
        Sun, 27 Sep 2026 18:02:40 -0700 (PDT)
Received: from mikebook.tail5724d6.ts.net (83-244-142-114.cust-83.exponential-e.net. [83.244.142.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017652d1sm144207825e9.5.2026.09.27.18.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:02:39 -0700 (PDT)
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
Subject: [PATCH 3/5] perf symbol: Grow the Rust demangle buffer geometrically
Date: Mon, 28 Sep 2026 02:02:25 +0100
Message-ID: <20260928010227.1903673-4-michalpl2003@gmail.com>
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

When a demangled Rust name doesn't fit in the provided buffer,
dso__demangle_sym() adds 32 bytes to it and formats the name again from
the start.  The number of attempts grows with the length of the output,
so the total work is quadratic.  Names with deeply nested generic types
need many attempts, leading to noticeable slowdowns in larger programs.

Double the buffer instead, reaching the maximum buffer limit exactly
rather than stopping 32 bytes early.  The demangled names are
unchanged.

Add a test for a symbol whose expansion exceeds the bound.

Signed-off-by: Michal Pluta <michalpl2003@gmail.com>
---
 tools/perf/tests/demangle-rust-v0-test.c | 12 ++++++++++++
 tools/perf/util/symbol.c                 | 10 ++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/demangle-rust-v0-test.c b/tools/perf/tests/demangle-rust-v0-test.c
index ee4ddb61174b..d1e0636d73bc 100644
--- a/tools/perf/tests/demangle-rust-v0-test.c
+++ b/tools/perf/tests/demangle-rust-v0-test.c
@@ -69,6 +69,18 @@ static int test__demangle_rust(struct test_suite *test __maybe_unused, int subte
 		free(buf);
 	}
 
+	/*
+	 * A symbol with more lifetimes bound than fit in the largest buffer
+	 * must fail to demangle rather than give a truncated name.
+	 */
+	buf = dso__demangle_sym(/*dso=*/NULL, /*kmodule=*/0, "_RINvC1a1fFGZZZZZZ_EuE");
+	if (buf) {
+		pr_debug("FAILED: symbol larger than the buffer limit demangled to %zu bytes\n",
+			 strlen(buf));
+		ret = TEST_FAIL;
+		free(buf);
+	}
+
 	return ret;
 }
 
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 3cb42805a82f..1a52bc2980a0 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -2737,29 +2737,35 @@ char *cxx_demangle_sym(const char *str __maybe_unused, bool params __maybe_unuse
 }
 #endif /* !HAVE_CXA_DEMANGLE_SUPPORT */
 
+/* Buffer limit for a demangled Rust symbol name. */
+#define RUST_DEMANGLE_MAX_LEN (1024 * 1024)
+
 char *dso__demangle_sym(struct dso *dso, int kmodule, const char *elf_name)
 {
 	struct demangle rust_demangle = {
 		.style = DemangleStyleUnknown,
 	};
 	char *demangled = NULL;
+	size_t buf_len;
 
 	/*
 	 * We need to figure out if the object was created from C++ sources
 	 * DWARF DW_compile_unit has this, but we don't always have access
 	 * to it...
 	 */
 	if (!want_demangle((dso && dso__kernel(dso)) || kmodule))
 		return demangled;
 
 	rust_demangle_demangle(elf_name, &rust_demangle);
 	if (rust_demangle_is_known(&rust_demangle)) {
 		/* A rust mangled name. */
 		if (rust_demangle.mangled_len == 0)
 			return demangled;
 
-		for (size_t buf_len = roundup_pow_of_two(rust_demangle.mangled_len * 2);
-		     buf_len < 1024 * 1024; buf_len += 32) {
+		for (buf_len = min_t(size_t, roundup_pow_of_two(rust_demangle.mangled_len * 2),
+				     RUST_DEMANGLE_MAX_LEN);
+		     buf_len <= RUST_DEMANGLE_MAX_LEN;
+		     buf_len *= 2) {
 			char *tmp = realloc(demangled, buf_len);
 
 			if (!tmp)
-- 
2.43.0

