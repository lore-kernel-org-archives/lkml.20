Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DD75328A3
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915992; cv=none; b=nLujr3gfkfm/v6dXTUZG3tKp8BYMaASOjv3NzcakS9RPzLSTll5Jh48HfXMgscBGXs6l1QQ4v8eZip2TulPsLAxdIsh7UEcYczQq5NHdeSWRIikFQqnGCzr0RAkD0XkzLACl0kvL5mQRCJZKC5KaRv9mOrTbbly5PBqGIVSoOqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915992; c=relaxed/simple;
	bh=x2csqR8dDP2NCSK8ek5vU6PAamZazjSrMmyYhw8xZI4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n3+X1Cvew7yUmG0UDfwrqQGY4gYlaVpDuSkW0lDXCJ7Sr7RyfWz0AVrLwfQNPrdw1uYJc2U8MvDs2z6xgzrxURjOvxee2UgmWns3PAHTv1Fmok8cRYfnu4OUz4K3VJCBBk1cteSPQ25IOSVSXhuICk17V7f8xKvZGBhnnrOAIfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f0MA0i2v; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f0MA0i2v"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35a04491c56so185790eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791915990; x=1792520790; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZIK7O2vtZmPG/MzaFS6aJid7lIfJvEiqBHfvqhoMys=;
        b=f0MA0i2vovznKZG18UqGB8Pux8Dfro4XD6Yy5fVIbs8wCD7n9xjSQX7+LWVH+gVryh
         deG9+tIP+tzmi4g46aeYUYkZ1G4bbNSj0vhU8OXjSzOxnmVi1dbbR07fZWqMknKmTB8N
         XZi/g8C2kKC19KC+NTY8GUetBM5RuDYzUv4mqQv6Nx/9C3meRe0acetb20OfbzSNv80/
         Zn6QvXDk15SucI+u5jXY+ckJEmmeb4T2ud6fcp0U3N7v/rurw6amrXjNsX5dHUfcuc/o
         Oxxnp+9ElhEqKtzcn7FP98tZnW1j6wM2xeehW8pYRa6mmgBqGNzJoDIY58/bsZg0KSD1
         xx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915990; x=1792520790;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZIK7O2vtZmPG/MzaFS6aJid7lIfJvEiqBHfvqhoMys=;
        b=AKpY1BpwQhSq4LHvSJoAosDbVuhiXB8OBnI74jd20rU4eycGDVwIw2OEACyz6ImgaX
         C22XpHUDaIZOLhWrbpdWP4PVNwKqwyLtREi60eAYcqIjpXPYx83pmCgmA5NmU3BNSlCt
         fCGCly38925WgRT2dhRPc2+uUk9lBchC+j55HVjyieJhy7/Au6TDrfFhZia9YB/vkfzd
         rf4izqMhCUITIoGsMD3JvOQygdOjPdUZU1ItjnpDXmq48BL5MxS1bfKBUODODHWWYZYa
         gZsksh6s1G+5rw6fCMF7teDtu54IiCq4T/bXnbTNg+y724kYCjY/7iuacGgrfFVsY26t
         rOIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvuf+gsOn1GmLuoXrDcUNZG0ZnJ89g+Sd6gRZqFaibKyerPUlFuNlsnmr4y+VlalSbmQrOFNjf3Ex2f/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaQ7FRRWHYJEWi8cNULqUmg6C8DwRYMxsQ7fo5xWnOTvwFB8MC
	i8mSf4+pc5IVvdPnR8pDxvpoQ7U2oI4fyaQG/0f55Gc5v+Pdf20MIATQ0GMJDsKrF6GEKWXZ3bq
	ZfcT+LMR4lg==
X-Received: from dybry2.prod.google.com ([2002:a05:7301:4d02:b0:351:4ac4:5ff5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:dd95:b0:353:58b7:b5fa
 with SMTP id 5a478bee46e88-3535f48136amr18225249eec.1.1791915989888; Tue, 13
 Oct 2026 11:26:29 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:24:49 -0700
In-Reply-To: <20261013182458.1234616-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013182458.1234616-2-irogers@google.com>
Subject: [PATCH v1 01/10] compiler-context-analysis: Avoid unused parameter
 warning in _context_unsafe_alias()
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

_context_unsafe_alias() does not use its parameter 'p', which triggers
-Wunused-parameter when building code that enables -Wextra (such as
tools/perf, tools/lib/perf, tools/lib/subcmd, and tools/lib/symbol).
Explicitly cast 'p' to void to silence the warning, matching
__assume_ctx_lock() and __assume_shared_ctx_lock().

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/linux/compiler-context-analysis.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
index 8302ebc2ea8c..024e303188ad 100644
--- a/include/linux/compiler-context-analysis.h
+++ b/include/linux/compiler-context-analysis.h
@@ -243,7 +243,7 @@
  * alias as a function argument).
  */
 #define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p))
-static inline void _context_unsafe_alias(void **p) { }
+static inline void _context_unsafe_alias(void **p) { (void)p; }
 
 /**
  * token_context_lock() - declare an abstract global context lock instance
-- 
2.56.0.385.gd3acb90ef8-goog

