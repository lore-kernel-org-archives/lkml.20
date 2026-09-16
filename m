Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388603E6DD0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539196; cv=none; b=fOAXGqyFPRaX61kQaXPaCHf0zsv1D9olFFHnoaLuKHz8iEYV4uUYJ/dA01CiIRvUohvh8BPoV0w22lY2jijVV6Uobspkg0wvJXB5TCcf2jT0LM/jop+kbv6YxWdHWKjRMT+jTsdVJJd1BJGfIuFvvwXa3iuqulnTJh+lGuT+LpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539196; c=relaxed/simple;
	bh=hNWirlQjs7zzyx6axdyrOn6luGlogerhrckrgySM31E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=CnSL1wzJIw47tspJKC4ClKpz4Nr6eQ71TMXDVrhj8I+/xViRtrSzEXcNle3OFPDIT7xwwGMSb8jGkvROPf1u7XGRXJkySwBZ6dEsRBV/rM7MHyA/eOfaywdm/kLoFvdJ4FZW6hYUaYlcLCTa3lPdBKikuNUKroQaZc3CYH0c0Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aQ37ou04; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aQ37ou04"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso11272814a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789539194; x=1790143994; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtP2IcMlbfSjyfjMZ1e0vnZ72bPs3Qn3Gup/k917MuM=;
        b=aQ37ou04p1jA0Ce19hDvU5lR/jXsovQrVorpnaeDzKnbvHXXXaIibvDlLb41uyxuuW
         we4fKNcXUZVPmWj01ZsSOHqV7nbGSBs7nW7XahJ5m5CVcN+UVet/Vp3OqlV7LX99648U
         CZNBEnlWNn8w0TmudgF7f/Yna5tcCRbNJsyuQQnQpiylaqO//GgZAgLPYK2l4gMXLdSp
         TV8fG9t0+Yta5mpEqZOotTAwqxcFTAAJ7U1fj1XRF/kw52lYNiNcnQ+3hXAdp99Sm+tK
         v/e/nYxFvIRKIHYRFEzEDlCmn/0Pf1OKvYSt8bmMG33UeNz70UQZW6E2VMZtngCOu0lI
         rFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789539194; x=1790143994;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtP2IcMlbfSjyfjMZ1e0vnZ72bPs3Qn3Gup/k917MuM=;
        b=pqhGBt5jySI+pHoFG6DYATb3pPPe/QVoK57xbIfxVUwzhXRURG/+47sKa15wps0lE6
         jLPLXVk0q/XHwwtNzpqKbUOI0/CulKM8HP/c+dWn6aAXkouNi6jifrG2YKasvCfDvSGw
         Z3btAdUtRR3nof4kX6OtNqwr6d/GFgwgDgekncI23P5vGtzcxV1YD93sstloYKpYJTBF
         G/21BkWHjIrKZNFnwFHGnNoCnQTsdFRdZIqsydH3zDKzg3ZFe1q71+3AefgYyrHQqYZQ
         U4wmrfvkyrsMTP058gv5H/loBV9atXPype0z/lW8C9254ZbMVaN6/T613Jr6qu0gv2qC
         UIKQ==
X-Forwarded-Encrypted: i=1; AKwUvByvSBXwIBpz6sH0485ke2jlW0mEvG0dTHc2vrTsDRZYxNox5V6OuMbEywuyc+zPaCiJvOsLskEN5PSR2jg=@vger.kernel.org
X-Gm-Message-State: AFuF++lrnL/5n89wla1SQdmLp4F1tHYyfaZEAsjAcO0hbQHuTGrFyaSh
	yWKHDHDq3WiNTTtBSi9HLcWNAUVsFeI9wS1XAzlGHJ/xNrGf0e506VexGULTx+p0Mhit/kScWu/
	yRnjxfWRlBg==
X-Received: from dlep8-n2.prod.google.com ([2002:a05:701b:4588:20b0:143:7f78:e839])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:72a1:b0:3da:f969:b077
 with SMTP id adf61e73a8af0-3dd5f495c5amr3407933637.11.1789539194276; Tue, 15
 Sep 2026 23:13:14 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:12:10 -0700
In-Reply-To: <20260916061218.3061216-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260916061218.3061216-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260916061218.3061216-2-irogers@google.com>
Subject: [PATCH 1/9] perf libbfd: Fix the clang -Wthread-safety build failure
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

perf_bfd_lock() and perf_bfd_unlock() are the callbacks given to
bfd_thread_init(), so by design they acquire and release the lock on
libbfd's behalf and the lock state differs between entry and exit.
clang's thread safety analysis, which perf builds with as an error,
flags both:

  util/libbfd.c:56:1: error: mutex 'bfd_mutex' is still held at the end of function [-Werror,-Wthread-safety-analysis]
  util/libbfd.c:60:2: error: releasing mutex 'bfd_mutex' that was not held [-Werror,-Wthread-safety-analysis]

Mark both functions NO_THREAD_SAFETY_ANALYSIS so that libbfd.c compiles
with "make CC=clang BUILD_NONDISTRO=1".

Fixes: b72b8132d8fd ("perf libbfd: Ensure libbfd is initialized prior to use")
Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/util/libbfd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/libbfd.c b/tools/perf/util/libbfd.c
index 33dc6158b2b1..8ac6670a39aa 100644
--- a/tools/perf/util/libbfd.c
+++ b/tools/perf/util/libbfd.c
@@ -39,13 +39,13 @@ struct a2l_data {
 	asymbol **syms;
 };
 
-static bool perf_bfd_lock(void *bfd_mutex)
+static bool perf_bfd_lock(void *bfd_mutex) NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_lock(bfd_mutex);
 	return true;
 }
 
-static bool perf_bfd_unlock(void *bfd_mutex)
+static bool perf_bfd_unlock(void *bfd_mutex) NO_THREAD_SAFETY_ANALYSIS
 {
 	mutex_unlock(bfd_mutex);
 	return true;
-- 
2.55.0.1032.g73a4cd73de-goog

