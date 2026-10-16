Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAAA58B6C8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171893; cv=none; b=uXuRqf0u/UwfuhySwvvh1103J8Wo0D7DslryHnhAla/GdAzc/FX8sVfglz8B53FdEYrMdvaF2yW+yJLJTgrKUkJpt+cYFhfWWfdJP5VE4DwKlPDQ3kn+TVkjsS7g+PbHDmxIgMwnQ9KKbOa5RR14D1ijutz9Ra5C1JW8GnCrWN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171893; c=relaxed/simple;
	bh=XntgmLX4cYU/6Nf79NgEzitDFOVw7AFEttdr1X6z+5I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jUWWbp5jQn13K51myusnUkNrt7BqvZmVquZyz/xvQIoFk7TQ6hG9BqL8wAXHmkAo9mlkWl9sm909eanqsfszuT/RyzB6Z57HgT12jkDb0LaCtl4mgZctTVR6b/xLbcGEzC9ct7I00PAqPjfUUVQnrwxSurRJpEq1f/m1TNb2uCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ts5N+3Hb; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ts5N+3Hb"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3580c07911eso265509eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792171891; x=1792776691; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkpTEfZaNFnhWMfcoXO62r+fEDph+U3x6hbZzfCOL3U=;
        b=ts5N+3HbENs7JQLs6btMZQ3NMrpF11r7LVMA+NAIjzs+V71oaWUJEAmkLplrKtvPNU
         b9Vdi3ngDf3NcOGywgTrFObXWgOzjviZTAG7gET9pL28z8Rr2qjnueAxpjy5/byFumUw
         gsLI4a31bGpXDlmdx4/z/5iBpn8Q0aCech1fuoDNjk6/V8YxYOZYkbTW8H4u0RadGp1r
         LpHS/ShNsmB7U6hsRDsRmvD7gTy3KCVKZ62dj5HjxI9lfgIhNWIorns7bSHTBn2nrD53
         I1qOTisDx2eh9QhP4oF7hMqKU5tkrYSCBMCMaDgCrIHSJtQ7mh9XtoY1eNJuPszI+W/F
         jV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171891; x=1792776691;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkpTEfZaNFnhWMfcoXO62r+fEDph+U3x6hbZzfCOL3U=;
        b=ElMoqxcaT1FMwsOA2r7HiU4/NI8mBOfehK7YGNuYDF53wt5NTYdlBkdgFlxayb2jBB
         N5C492R1/GD/qAjCzIJKaEBI89fc9FAq+H9smH8ySbT9q/XOCPP54BioxKoN4Nj2D0tP
         qNvBqyotiNT8XOj+nPfhGSPryPYKZUQAolNrEhYPWJOJUHUeKzGZwtrY3wr7T8+CG1fy
         rmjshPBLPo5YNSVj08QbIrA76xinzv/N8GOxEi0bnDix1D9AX7/C4RqMiKsAP6JN/YL8
         t9jJlRTOP47qCKQ0N8OSDzpN/nXzqHFQnY+Qm7L6Wdbqbo66f5yIDVH+WU4OsfhC0Tkh
         JnIg==
X-Forwarded-Encrypted: i=1; AKwUvBzWpvH4Fh96iwrNljFEWnpejW5HQsUCW+ZOJgIjD5vFYXoDr4ybUMFRj9DvxYr7Av6FHYA5orjETcnVvLw=@vger.kernel.org
X-Gm-Message-State: AFq9FYItPI+Pna5FCDr8a9wQJcomZiMJp5cLi7FH6Tg+c4Vea4IfCxRu
	HuLPf5vNJCw/GK0PTEEhZ3/zQ5gui97bb/Kntw37oRJsXWs/NvVDSXuUbP0jJx7Fb/k7WeUl1Zq
	b4d5B2875Dg==
X-Received: from dycmg18.prod.google.com ([2002:a05:693c:2512:b0:35f:390d:248a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2a18:b0:35c:8242:9e59
 with SMTP id 5a478bee46e88-361a1860b5amr556342eec.14.1792171889636; Fri, 16
 Oct 2026 10:31:29 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:30:54 -0700
In-Reply-To: <20261016173106.679725-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013222622.1822619-1-irogers@google.com> <20261016173106.679725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016173106.679725-6-irogers@google.com>
Subject: [PATCH v3 05/17] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Align tools/perf's Clang thread-safety flags with the kernel's
scripts/Makefile.context-analysis by adding -Wthread-safety-pointer,
-Wthread-safety-beta, and (when supported by the compiler)
-fexperimental-late-parse-attributes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 39442577418e..ce746b12f901 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -64,7 +64,13 @@ ifeq ($(CC_NO_CLANG), 0)
   endif
 
   # Enabled Wthread-safety analysis for clang builds.
-  CFLAGS += -Wthread-safety -DWARN_CONTEXT_ANALYSIS
+  CFLAGS += -DWARN_CONTEXT_ANALYSIS -Wthread-safety
+  ifeq ($(shell $(CC) -Werror -Wthread-safety-pointer -Wthread-safety-beta -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -Wthread-safety-pointer -Wthread-safety-beta
+  endif
+  ifeq ($(shell $(CC) -Werror -fexperimental-late-parse-attributes -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -fexperimental-late-parse-attributes
+  endif
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
-- 
2.56.0.212.g129ede20d9-goog

