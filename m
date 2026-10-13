Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6285349CE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916003; cv=none; b=XxXekMmA9mddTj5j4rDjBwIlim/SsU/t5PVYgOwxXp/7cwib6dbsQ/y9IjDFdkyQLMPLWQ14pXVtA81P/7N4vzLhRxeoIslgP0K51u3lVULEleT9pb1lYZUhEpKHYDvcOm16g7SXRi1bRkT7ZO8qxHVTJpmYE24SFFxXenQAGaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916003; c=relaxed/simple;
	bh=CMzWLsSvUBuoBzjwvp7EGGHEbhbirK0Kv2OvNgP3qM8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KEVjBWh9ij0Bas49tCkpIa+vUj2ZCBfhtG/++OKR446D4vPKq6/EAE1VZt5zaN7MvyPzaRkMjBrfWR+ZH33eE1v9Pc45Dd5zqDWU7rpeF93eb2mGw4FCk3k6G60D7X82HKRGQe8uU7RdwgV+TMbszJLNKswmoZC+o1u6tDOYhjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QSUyoY/v; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QSUyoY/v"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso5565494eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791916001; x=1792520801; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3HbwDarhrHxgEfaQxuccmNcSi/54Dhir4/ZTP/Ma6I=;
        b=QSUyoY/vERqQ3h22Px4JBAhfwltkU7JXI9mr/fDNOPGkifRizYRJAecKl0k6Sr7zW0
         FHtTgwjr0TSj93ZRH+eS6IH1dGPryEEQOdcle2vOWVSAYMCEpgU3SBivPux4hdzaxCRW
         Yn5iI41jxro25k85He+Jtk3tAk6LKE6l3DozY40/D9w00iMBr985rFity5ZcZ8cJAjZ8
         mj93RAoX4Sqb3lvUnDjuBNndUwI+j50Ev+tQ+KJ1ep6QJZE8+lI+/bV4VB6KRnb3rjIZ
         tBDikMCt5nHSW2Ho0or93SSlTqrUmderOqizuYu6jGsCeOrxSCSrj3MNhIWY+gyhLphr
         gUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916001; x=1792520801;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3HbwDarhrHxgEfaQxuccmNcSi/54Dhir4/ZTP/Ma6I=;
        b=Y/lSZoXjikon9wu9frPnp05G0tSBSI/EaWIGVMhqKr8UOehzIPQ8M4GaLrav4ZT8gR
         hqx7KyN5USYF67f1mRaKMyoohCkvA4fcOEKeZC+CBeY1PqCS6SPnyMCyPKThpI0ntwZ/
         v7WeLoB0pIsl+TYNIcoqHfykh+gGVuesm7b6zmehExooZyQ0hmmuYHY0UJZygBJ+q3b1
         Uo7BZVIuz8H2XysRGab0iVJJ6LBkjqXwnJ0qxabwCEFKad9YNZNmz6wyLDoyKTzQUBAF
         Uvu0msm9EKLGV9EQGuN7lcZAwedXscEIPxV6WD9+nc9UJDFFdW7kG//CyRYpjgDy/EOQ
         AxWw==
X-Forwarded-Encrypted: i=1; AKwUvBxt75NQJKy00HYWNR3Ua5wOUKeDzXLv+8BM3K1htKwRabcU88hS2ke7iH+WjWLhxhQHUSj0IcuF6tpJRTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxiREgOCN4r7wNFkSyA1WpnUCDb0xvsh3r1yD8n2/kx9kIDh5Q
	/1mpdw0tAEyqI+O9A8b9unU7fVVIFYJl/GWsBD9eG8+DxzGu2oaurjdZVU7fuBFt2nEjViKErdv
	eAdQmuDGrdQ==
X-Received: from dyng35.prod.google.com ([2002:a05:7300:7f23:b0:352:3ca9:9a5b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:810f:b0:356:a044:b194
 with SMTP id 5a478bee46e88-356a044b1e5mr16397097eec.39.1791916000286; Tue, 13
 Oct 2026 11:26:40 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:24:53 -0700
In-Reply-To: <20261013182458.1234616-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013182458.1234616-6-irogers@google.com>
Subject: [PATCH v1 05/10] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Align tools/perf's Clang thread-safety flags with the kernel's
scripts/Makefile.context-analysis by adding -Wthread-safety-pointer,
-Wthread-safety-beta, and (when supported by the compiler)
-fexperimental-late-parse-attributes.

Assisted-by: Antigravity:gemini-3.1-pro

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 39442577418e..d536203ff42f 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -64,7 +64,10 @@ ifeq ($(CC_NO_CLANG), 0)
   endif
 
   # Enabled Wthread-safety analysis for clang builds.
-  CFLAGS += -Wthread-safety -DWARN_CONTEXT_ANALYSIS
+  CFLAGS += -DWARN_CONTEXT_ANALYSIS -Wthread-safety -Wthread-safety-pointer -Wthread-safety-beta
+  ifeq ($(shell $(CC) -Werror -fexperimental-late-parse-attributes -E -x c /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -fexperimental-late-parse-attributes
+  endif
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
-- 
2.56.0.385.gd3acb90ef8-goog

