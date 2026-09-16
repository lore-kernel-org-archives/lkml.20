Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CE03F0A86
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539207; cv=none; b=Y5Nc6JBRMEyMBxI4BhFTaGX6BOW1VEz0Z3wG/ts2oIUbkXLfFItxDcQUM8sCBoMTjcC5TDbCtkKSFMjbNTUyjkeAdm8z5c37Cy3u6DlG2QQ8RNRDTzhPZPO+ct83ZzW6zqNf38c5/Wk0uuSlrUKzLEGrGjJuu5sBmKSa1/zq0nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539207; c=relaxed/simple;
	bh=9AQBOX7WHaFtXKrai6q48Xl/HvE+e0N8DcJlpSobYXI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=uWefjo/mORj/9Pynj9WaZogyJU6jaQfbkZtd1JGpGduwhJkdXULwrlcFO02GEiPo140fU4nlBAkDC3nhhjwMFKAar2685hKrTaN0jbKvzrVqCe9ENS8pPcFv+Dw8pn7hVVRo+AQMdNtGww3zTMMVNAnYCX5CLpmquGHy38fZJA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rcr2L7sD; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rcr2L7sD"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4afc810bfso1700526a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789539205; x=1790144005; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=icwakIRxoRygxUn8RuGulJXMD/67KQ1hy2QcRu7qTfU=;
        b=rcr2L7sDxZVTco3JJcBMrGiBH2FJI4pOWDgpEz+WDX8TE7SVe15tzeYAHFqLhLFoBD
         WygyNCbivXUQWA8oiw2jNTk2U5g/wg5vniZV6zh1OXIXpihls5NTNEATd/AH9xGB0rGW
         473FX/a5mzKlQ/v1t6KvdYy30Vuy0d7HRp/Zuo6aYWxlDH1b2Tw4sGkGvXastJilb+EG
         6w5TGVDFgYlJ+UYYfHKdyVEzNqP5mXwUXN6CXob+NmVeACXFvtJN5V9dtcwJ2mBtkX+q
         cTPws6PUj8E3xlub0B8AE0TvIX08Fby9O+09cBGwlQLQJ8uR6PWUVRh7gXcbgNQ0gXuX
         G0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789539205; x=1790144005;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icwakIRxoRygxUn8RuGulJXMD/67KQ1hy2QcRu7qTfU=;
        b=RjTNSsekFcqJy8/wfSHiRYBFEZUNy6sSxD/NwCMEUCJCTEwxOEBbuzT6Ow7CvIrvyr
         7EzcFaz508ymuDLnSNBD7XoWMeDSK+G3iB8EPwQAAZHaaQEzL4N18qgsPzM7fhO6tXQC
         SVHi/J606lwFqHXu3Dic7cxRaJV0ZKx3j6yfam6vT9OOyqtWDmwEx+hq7RKKskNMBtmd
         kKVATVxCHnV/OnxKM/IbQ9Mq5KycvKCgWymTjywhIVnUqJDK5Bht6SX/i7Zei5vcI/kQ
         LSED8STnHJQdNcuVVGRIkWedr9gmeJm+yKaH3GKU/t0VH+H7SDHnn5ouCTWvAq58uOoU
         H/gw==
X-Forwarded-Encrypted: i=1; AKwUvBwcwWyl+zucUOjBZSCoHVZc9ObydYYfMZ91I2aIz3h/HD7smQAShfzXYU/APm697+3+RZ9N7aIG3ph4pYk=@vger.kernel.org
X-Gm-Message-State: AFuF++kov6XzZSFSxQJa047s4+TpY7yxMmYDmKy+okuLkL1J3NEQ4+ao
	p6DDNOTl9JUWud/VcALtx9YodxqT9zRj3+PTdV8JTbda9LMfmo7u5cS4HvYZ+v0MMJ697bz4I8w
	/G7MDmsTA+A==
X-Received: from dyhb21.prod.google.com ([2002:a05:7300:1495:b0:32b:7182:c3b7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2446:b0:2d8:d4d2:d13a
 with SMTP id d9443c01a7336-2dd7655b5f3mr91909395ad.22.1789539204632; Tue, 15
 Sep 2026 23:13:24 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:12:16 -0700
In-Reply-To: <20260916061218.3061216-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260916061218.3061216-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260916061218.3061216-8-irogers@google.com>
Subject: [PATCH 7/9] perf build: Check the version of the compiler that is used
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The flex and bison flags are adjusted for clang older than 13.0.0, which
doesn't grok -Wno-unused-but-set-variable. The test is reached because
CC_NO_CLANG says CC is clang, but the version comes from $(CLANG), which
defaults to plain "clang" and needn't be the compiler in use:

  $ make CC=clang-19 CLANG=clang-12
  version from $(CLANG) -> 12.0.0, flag stripped
  version from $(CC)    -> 19.1.7, flag kept

Dropping the flag lets the warnings it suppresses in the generated flex
and bison code through, and those are errors under -Werror.

Ask $(CC) instead, as that is what compiles the code.

Fixes: 878460e8d0ff ("perf build: Remove -Wno-unused-but-set-variable from the flex flags when building with clang < 13.0.0")
Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/util/Build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index d08f2af7d970..a4618e4e4848 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -339,7 +339,7 @@ bison_flags := -DYYENABLE_NLS=0 -Wno-unused-but-set-variable
 
 # Old clangs don't grok -Wno-unused-but-set-variable, remove it
 ifeq ($(CC_NO_CLANG), 0)
-  CLANG_VERSION := $(shell $(CLANG) --version | head -1 | sed 's/.*clang version \([[:digit:]]\+.[[:digit:]]\+.[[:digit:]]\+\).*/\1/g')
+  CLANG_VERSION := $(shell $(CC) --version | head -1 | sed 's/.*clang version \([[:digit:]]\+.[[:digit:]]\+.[[:digit:]]\+\).*/\1/g')
   ifeq ($(call version-lt3,$(CLANG_VERSION),13.0.0),1)
     bison_flags := $(subst -Wno-unused-but-set-variable,,$(bison_flags))
     flex_flags := $(subst -Wno-unused-but-set-variable,,$(flex_flags))
-- 
2.55.0.1032.g73a4cd73de-goog

