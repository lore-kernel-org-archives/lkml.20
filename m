Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2363F105F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539210; cv=none; b=FCZVu5OtwZ/MQPQo2eCvePXQMK44dIAx8GExN8zbAEGVG3Q4NXETdV30/EvVvvUyegZd2xDeYJRRdxgn5dn+ME6WzK4+gW4dy8z0Bxk0k+tAjSsWnbwNqTSapWDAoV4lN223XvhDMjmX+plNRQAk9Xu6lACn/fSUGYhoq/YCgMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539210; c=relaxed/simple;
	bh=/UxG/z8oqDwP9CIwjcJWyPbDAUY4rJGItVrJwkdYtcs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=K63yPveu/6BwJ8kI0Exhf6gqLk5fbLkz8b4ff1yG6+aLPn3JkxAwtAtfs/7Al2YLGDZKPxfB7yvUSV7Gnj5baxnwqVsAzOTyvIQWGs/fqYRh62/5OQTRZzLGRGCOBnaGPH6ogO0LYQUbNrMzF23NVdYdigbKLqms8n4cbslKgpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S5X1sQhf; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S5X1sQhf"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso1894506a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789539207; x=1790144007; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mE+VIvBqxJWeI7GLiq81u6doV2s7RHiOZIS5UCF0zbk=;
        b=S5X1sQhf8PRD27TmBaTV9nyWZgFb4WxZheW59NQRHqiF4qGeGbjdZTBNjuf+5LTGoW
         k7iRZHKHjfGiM3DGjU0Jk/HtYkqa5BxBfUCfxyWnADN4nQY45mZtG+Jaughht4oZ3ZAy
         X8zTcTs9XhzYHOuk5jvxc+sgT5QsWd4F5ARVugsbdnuxtPlULrc0A9ZTVUscGSKtj5IM
         ubV9HCiHt7sXGUCCb9bWtEOw3/Muaomv3OkoWskb0NoGYyU2GM/74lCGMFv8UWWyr1YD
         ghOzHzmt6RdICW8tLOG79O3xfRLmS03tc8vBT9UrTbxoXS6essbUwVzhUzt1WrPlS9rV
         /Kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789539207; x=1790144007;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mE+VIvBqxJWeI7GLiq81u6doV2s7RHiOZIS5UCF0zbk=;
        b=tqZHXHoCUcfnelTfVrCcHa37tykqiz9cUQjkkpwdA+iI2cSJBp8dnhFHZh1GaxRFqX
         4M5GxY3d/ga3vVlZlVZUsSEyrF2zw6DNPH4BFhb89ojE5iOzi/N1BPJc8Agu8y6QBLVU
         LzDuB0iu23xH5H4uZL0YXeBh9Mnu+k2eF84r0/EQCgXSc5NG8mcYfC3FduEitrZza0eQ
         EUzR0GbhK+J0pYFgiIjD4vhjXnRRfky58OEmHETT/f+wWBNXcFzieTgIcK+ojKdTxwWX
         JTG9BtYTEJ3qnhqjwsQNobam64UujOCZoxn3xzNCeuYIDw9OFnbtLaGhPkF/rXL2k0P1
         mK/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxCYg3u9yTsYOFa6Yn641QVvLaNbfeuhbzloW1V53NB0zNekW7rC0+I745Grb+6/ke2YCzuKHLDU64BH6A=@vger.kernel.org
X-Gm-Message-State: AFuF++kzv6NDSsxbneHtOoZfQxjJ8iTjI9ln4goM4JP89ILKKGi1abcx
	zHbFnwqbuB8XL0QnwH3jWJaLORiz67Ko+WyNwlbDZkYkZQaN7PKbCpodhqCsYLxA0+eKdE3IjSF
	46EHkXUDtXQ==
X-Received: from dlep14-n2.prod.google.com ([2002:a05:701b:458e:20b0:143:9704:de05])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3941:b0:39e:237c:50de
 with SMTP id 98e67ed59e1d1-39e237c518amr1393784a91.3.1789539206454; Tue, 15
 Sep 2026 23:13:26 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:12:17 -0700
In-Reply-To: <20260916061218.3061216-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260916061218.3061216-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260916061218.3061216-9-irogers@google.com>
Subject: [PATCH 8/9] perf build: Remove leftovers of removed build options
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

NO_LIBDW_DWARF_UNWIND, NO_SYSCALL_TABLE and the embedded clang/LLVM
support were all removed, but each removal left the matching entry in
the build test suite behind:

  run += make_no_libdw_dwarf_unwind
  run += make_no_syscall_tbl
  run += make_with_clangllvm

None of these have a make_* variable defining what to build, so $($@)
expands to nothing and each one silently repeats the plain "make_pure"
build. The suite therefore spends six builds, as every test is also run
with O=, appearing to cover options that no longer exist.

Remove them, along with the NO_LIBDW_DWARF_UNWIND comment that is still
in Makefile.perf.

Fixes: 2e9191573a69 ("perf build: Remove NO_LIBDW_DWARF_UNWIND option")
Fixes: 3cc550f5bbcf ("perf tools: Remove dependency on libaudit")
Fixes: 56b11a2126bf ("perf bpf: Remove support for embedding clang for compiling BPF events (-e foo.c)")
Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/Makefile.perf | 3 ---
 tools/perf/tests/make    | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 2438b40eaaec..53f538cc8e1a 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -64,9 +64,6 @@ include ../scripts/utilities.mak
 #
 # Define NO_LIBBIONIC if you do not want bionic support
 #
-# Define NO_LIBDW_DWARF_UNWIND if you do not want libdw support
-# for dwarf backtrace post unwind.
-#
 # Define NO_LIBTRACEEVENT=1 if you don't want libtraceevent to be linked,
 # this will remove multiple features and tools, such as 'perf trace',
 # that need it to read tracefs event format files, etc.
diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index f879f8109072..608470ff9c10 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -157,7 +157,6 @@ run += make_no_demangle
 run += make_no_libelf
 run += make_no_libdw
 run += make_libunwind
-run += make_no_libdw_dwarf_unwind
 run += make_no_backtrace
 run += make_no_libcapstone
 run += make_libcapstone_dlopen
@@ -167,10 +166,8 @@ run += make_no_libbpf
 run += make_no_libbpf_DEBUG
 run += make_no_libllvm
 run += make_no_sdt
-run += make_no_syscall_tbl
 run += make_no_babeltrace2
 run += make_with_coresight
-run += make_with_clangllvm
 run += make_no_libpfm4
 run += make_refcnt_check
 run += make_help
-- 
2.55.0.1032.g73a4cd73de-goog

