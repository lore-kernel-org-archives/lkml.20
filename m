Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08723D1AA2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189095; cv=none; b=FoeHhjjtGV1/DzbxaGy8tKJ6Nx5xj4OATqUnghmBKxT1mKWNYNsg2hgCWN6LT+js8+3zilTimc40H5iE/q3BZ8g7QIiF1IC0WGEw/LwPcvTuUe3zoDsfnX5Hjm9dES6w//NwIc+NuVyeu3RrW6Zk1WypxJwaerMhlpZ5oy6QXUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189095; c=relaxed/simple;
	bh=wrvIrrRxxCxbjC5y19PcJbeqSjug7uXwZUzwZWAtOzg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mSi0aa78UUXf0BlY/NXUi8et6DXvXF4z6xE1+M0HT3Fjy5KELHuKKG+rC1lM6CE/xL05XgB1hfIpOVDUIgjIEUekTmai4+o6+iBxTUG6pGLD3uHMw8aSnd8k1BKANJT0F3Tpp5SNCQFlofnkb7ySNYiIHZRSu0mD0yX6cBaox2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GERgQ7VE; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GERgQ7VE"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35d4538fd74so977801eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792189093; x=1792793893; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viOIzDo9krKszOCmVOjeW9f2aQpRArqmnQIoNv00KM8=;
        b=GERgQ7VEptYHtuywXeGPexcRRABvAQlOCTyBqWgsp03EktZ9iq6MC2XaYh1+OH4SfX
         783Tefip3c7gxWwZCHrPcRH9gnSZ94Q18yx2O6ePin/mnFrtg/se76AleW2HJmFPk+BQ
         z1ETQ35cMMYyzwycJIqRwvnyQg57hu6y5AK6THK+CW4/X0JkhaVT1bCanI2wFzaOqHLk
         ce1vfuJ76j/Vufazemzq8cHEf2/TzBSPztY6ku7wJ7ThBVsZpCV836+7Rio1jq134ytO
         1pnR83OpesSGOnl37kVKjeheOFJHabCzOXkAre8UXl3fmSMKTliXuTnn8ehLaWw8sKMH
         RrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189093; x=1792793893;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viOIzDo9krKszOCmVOjeW9f2aQpRArqmnQIoNv00KM8=;
        b=wLakjtaoLmoQuXCtSeoKPqsXbmbYGOLT6WSDRMZ5l7nDJQ60Wr9WYDjHD35P9DsxQc
         85x4T6PMhFktQyHdIWjDeACcUBlFbTlY7Jk0GZMC7EoeFWTz21Rz06Mfk6g6B5T7ZXNG
         OGFY0YgH4+XPaoRR7GW0HG9uaLoOb45uY3cSn979e/fAyLaocQXgEZQ0uQA4z7VoDg3L
         80++4foR24sl2gS5sVguEZP9vEDd+ftwFS72e0WnI6PkcRI9UdDEEV60Pb+mG+pgZxJI
         /Smeip9NkGXZdpJRzgtzTpBeVEBZpokvi3UVAy6AjLik9BxHULsyQAUsZoTkjj3o3jnR
         ATnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDRZHUfw4rBEc5QWL3oXUELr51MYKxDkkM6CNwdgIxJGHNp3SVJSjQTLbsrvoxJUeneamVSGdcywM82Wk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkICVxOtYhUiOaQ+a9eywdegQ1bgHqrMJ+uMckaQDf3eH/K7en
	nmRhZupeQzx5222dG+EocMNmDGfDBpS8zbO14aR/PGW8Z7JtMXqoyH6RUErA3ZEwrh8GQiDq8yR
	iE0Di+mneMw==
X-Received: from dlbut6.prod.google.com ([2002:a05:7022:7e06:b0:15a:d2bd:6a16])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:464a:b0:143:868a:20c1
 with SMTP id a92af1059eb24-185151be30emr1295600c88.46.1792189092510; Fri, 16
 Oct 2026 15:18:12 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:16:44 -0700
In-Reply-To: <20261016221700.1282659-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016173106.679725-1-irogers@google.com> <20261016221700.1282659-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016221700.1282659-2-irogers@google.com>
Subject: [PATCH v4 01/17] compiler-context-analysis: Avoid unused parameter
 warning in _context_unsafe_alias()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

_context_unsafe_alias() does not use its parameter 'p', which triggers
-Wunused-parameter when building code that enables -Wextra (such as
tools/perf, tools/lib/perf, tools/lib/subcmd, and tools/lib/symbol).
Explicitly cast 'p' to void to silence the warning, matching
__assume_ctx_lock() and __assume_shared_ctx_lock().

Reviewed-by: Marco Elver <elver@google.com>
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
2.56.0.212.g129ede20d9-goog

