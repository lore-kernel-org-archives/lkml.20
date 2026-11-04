Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793766624;
	b=3ScM3UxXC9p7aH4O5ni2Vtq5oXxpvZ5WarTyGBrPS8ueeBoa+R7PFH+17NNAFXQ4yogF
	 F6AtRq/W9IvH8VlTZIGGWJYslIB/+/DUZKbxrDfDMKfCOL9IDseX5+Kj9fh9KePt0VQ71
	 8Yg+sZ57IiM7MEVmi1BxIND4r0XPsla9jjHmLD8IC8OiKRGJlUP+i3yJPgB0f6XxFi0Lk
	 v8wTgK+Ay/mCWfQAu44dA9JVeLaSyB8UcGFBHaHFG8wmgYc+lFP40xYRWhJYlw4TFyYZA
	 JCo3KiJ+Kbdkgm8ZAEfAjL3g6+uxAcw/LPlRkuv1CTxTJlwRJ/vDqQlt1PqyGy7Jbpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=lf8+fUIi9nYvAfKMMCuyoqEDJu1jsXhBuDkXiGeAP2M=;
	b=4OAXVkfMGppwyb4Pym1zEG8VqJ4veCNoZvPGMrisEVrmGmlH0y0zktvw3AIWcLYLnow+
	 YoujE9hC1IhAJ2E6Fjh8nyVJLcoRldd7x7TDUNxGnpQDjeaSDSItvLwcSveCyJmaRbwZm
	 YKh6e2dMzU7kamhhHSuHqAMcgwYADg401dZyySvoElwf0Z9yPgMTPvd+oCjgu6ybCVJN+
	 yJIhj5Z4d+q2rgk3QteUIMM8eqi5WWDOr0wzsjKajqy6Ft+Rv1iuAcXo9hVBIxhNhyARG
	 B2e54GdwkdDqy9aPGXZh7ljrbwTxbORKCoHHLeiLDXP8CIrdo9golKdhuLfrw2nYC3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S2NL62jh;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C77A606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C77A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S2NL62jh
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d1353fdcdso291168eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793766623; x=1794371423; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lf8+fUIi9nYvAfKMMCuyoqEDJu1jsXhBuDkXiGeAP2M=;
        b=S2NL62jhYPj0Kpdrgpiy41JLh38Zfoiq8uefbVCDNEgr4KYtyJVuB3qKbIxFcqMfj3
         WP8uVp5Em69yb8z5c7Ft/lUEjpm2jhsCFoiOoKG3Ax1DLRpRVWeQnfZUyv4Tmb+LfjyE
         6ZHiGPH9o8242nilDtRyg+IEAb+GhYyVT5bYfctX71Bz3y704RRZo0eEGw2L0NDSAZD2
         uCt6deYmbJYCUCWkYM62+MJUUUaMgI+4cFvpOZ6uCFT8JNAcZ1iu/WDczv9QpGffQmi9
         9iA+brl/6pJUhGIDSjPbZ89rUlS+iPQ3kxvscT4wR8Uo3mU+ONTxldGuGjh7yNXx+rsV
         YDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793766623; x=1794371423;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lf8+fUIi9nYvAfKMMCuyoqEDJu1jsXhBuDkXiGeAP2M=;
        b=J/izL0wxP6RLPnAoHp79UZTdZNiFaDMQ45fvxaW7iW6wMstSyP0cLcCwDLbxOnhikw
         LhuGx9KSrEkHDK7NFoHcJVKSxhL7Sci7Dua+qL4eKjgxle9l7uK4Qk2J7YuxqVAj4ksX
         ffIEqHT3k1V5FAC0TGa+U0POTqM5s4lNWVVDCaY4yVkS/TCY5cSewR+LbnxeZ1U4p5ZM
         RJxwoNtb2/jfyPbPlD/a2kxVBI/Vqt7ebh3bPEnUrsU44sfxt4vG7Q2dYoLXVfBzL337
         pNacSvOpc5f2RdZw3FFUzvTthV9hQUggrJ60LsC0PB2KAG3Npa1i26KYr5M1izEA+CyE
         KTSg==
X-Forwarded-Encrypted: i=1; AKwUvByfxkYmTs9Zvx3J1Hhutp7XVoI9Irw8OVYuN3KFnmRcr/gkbnM8KLR092Ys1ArFY/XwORzk4k9B6pfYU8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fN4xO3F3PwTcKgZdf4uiIiU5w7LEYpgYEXsrCY6MkO6G3ZSuf
	bZIGpnwgAgekbkOVzAgZPZqGbO9DdCgoXpltQ3HpnXmfdFHqXObUaXNGjjr3onJ1So/NuZhQybG
	yS3Am65NhDw==
X-Received: from dynv12.prod.google.com ([2002:a05:7300:5a0c:b0:36c:9b55:8436])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:6312:b0:36a:1709:458
 with SMTP id 5a478bee46e88-36a423cce1fmr25708786eec.27.1793766623064; Tue, 03
 Nov 2026 20:30:23 -0800 (PST)
Date: Tue,  3 Nov 2026 20:30:04 -0800
In-Reply-To: <20261104043006.1199857-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261104043006.1199857-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261104043006.1199857-3-irogers@google.com>
Subject: [PATCH v3 2/4] perf build: Add explicitly sequenced -lzstd to libbfd
 feature fallback
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Quentin Monnet <qmo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, James Clark <james.clark@linaro.org>, 
	Leo Yan <leo.yan@arm.com>, linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Distributions like Fedora ship a statically compiled binutils libbfd
that depends on zstd to decompress sections (e.g. undefined reference to
'ZSTD_decompress').

Since libbfd does not reliably distribute a .pc file for pkg-config,
perf probes manual linker flag combinations in fallback chains (-lbfd
-ldl -liberty -lz).

Extend the testing cascade in tools/perf/Makefile.config to check
libbfd-liberty-z-zstd and append '-lbfd -lopcodes -liberty -lz -lzstd'
when detected.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index b4764f69f47f..78423b0dcc73 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -896,6 +896,7 @@ ifdef BUILD_NONDISTRO
   $(call feature_check,libbfd-threadsafe)
   $(call feature_check,libbfd-liberty)
   $(call feature_check,libbfd-liberty-z)
+  $(call feature_check,libbfd-liberty-z-zstd)
 
   ifneq ($(feature-libbfd-threadsafe), 1)
     $(error binutils-dev(el) 2.42 or later is required for non-distro builds)
@@ -909,6 +910,8 @@ ifdef BUILD_NONDISTRO
     EXTLIBS += -lbfd -lopcodes -liberty
   else ifeq ($(feature-libbfd-liberty-z), 1)
     EXTLIBS += -lbfd -lopcodes -liberty -lz
+  else ifeq ($(feature-libbfd-liberty-z-zstd), 1)
+    EXTLIBS += -lbfd -lopcodes -liberty -lz -lzstd
   endif
 
   CFLAGS += -DHAVE_LIBBFD_SUPPORT
-- 
2.56.0.385.gac671c819a-goog

