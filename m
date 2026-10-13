Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5155616DE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930401; cv=none; b=NPcRcFXkO9PNnNj3TkE+strSYqxncRR3APQ0PosDBfzKbNqhY6hDgtbT0ZhQLSx+ZuqmPOdW058JkCqIFf5QnoPn4imJWYHSCchSWAAazALP/cLwtu67cJoy0RY7dI4eyfKMWO1QZFVSL+u2Hjh4FnlZ2zaBNcbrVEJ5S3Upwos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930401; c=relaxed/simple;
	bh=x2csqR8dDP2NCSK8ek5vU6PAamZazjSrMmyYhw8xZI4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V5b4+dWcD8oG9UK7Bf34j+ETKuRfuZ1WZVKPqqAb9YXjZVSAqWgfIohIyq9xRHsdcU3iEZHKJB6w5o5Et7WryBDM5HupQE7uP4PbanaONd9c1opcE6V23JIdQIwIye2ABH18LKjfpij1VUQ2qE+zLBT+nAJKutvVp+i1slz+Nms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BcOVB2V7; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BcOVB2V7"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7811043eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791930399; x=1792535199; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZIK7O2vtZmPG/MzaFS6aJid7lIfJvEiqBHfvqhoMys=;
        b=BcOVB2V7n5cs57M5RRBOzyH9B2VgnrX5qFhul/i1pIdcyiSuaD/A/Lf2BtPKa0hVw3
         3y/6RfKnjSbEfROa9Z7dIleKRvqhJ5I9AjuDh1ordEHG6cwGTf2KDGiUcSWKSQCnkofe
         d58gen8DukTzOzNKNlytzg8A32WzSlhpcWJhkJ5csInbrTpmVL0quPITS8l6fWgbv/u5
         uyDfmQk92rvH35yxbLUd2oQLQDhUaUaXrGnru4XS8ewxMJRkRExfd8Qt7QmdwC4go/QF
         WfZ+47kpdQCOOuTcnSaVzc9/TihShgimpKzaQp0zwZO0SMaQljGKHfL7d7E7QZt4sVKa
         /7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930399; x=1792535199;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZIK7O2vtZmPG/MzaFS6aJid7lIfJvEiqBHfvqhoMys=;
        b=wRA75/rhx0DR6eyHVMXYjSv0FSS8D8yisR82e4q5YBv/evoRUdioffE7QRtqxmZzZx
         q5dyoEZyvfD7JWNKT+kNOfll82S5RPtSpa6oYpfUxU0RNTGQpcUU9C8T7KHK23XpZBpJ
         NUvGtnkMR6a5GGvFlOm9EicsokrU7C+Hy9NWP198JFTYOMt4v9g3mzN942/a+YbVimIp
         xEtxODrIQyq+EOjsmX1nUP4DlXvODrfa/DVjvwFAB4kTd+vHnUiTn87LJKcs295dkbZT
         fGPzHj4nptmeV4OpLC7PGtGGYNe0Ruf3Fz7N+zaC0tFKRilrkDedQJqlaOsEVFJaEmrp
         uVYw==
X-Forwarded-Encrypted: i=1; AKwUvBwPKTCsznjQauSW6meXaCCJWUi8VMe4t1HvZQB+48+5IcZqw9XMQL332uTNx64B3/3NP1qzDPx5hCN3ycw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVfq/5VhwLjoJOCaZYxz27T5AfDjR+Ojcwkt6GiWoiLVZmkYFb
	bZ7gzQI+WBFzNIueIAQnAz5Wuz4Eq55z/rCG/+fTX6TiiusX36sT3cIPhEkg0ddip4XXn3JMQY1
	CujM4BiTBTg==
X-Received: from dycal34.prod.google.com ([2002:a05:7301:1ca2:b0:35c:c374:d526])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:a0f:b0:315:afc1:72db
 with SMTP id 5a478bee46e88-3537e046a1dmr18119322eec.9.1791930397618; Tue, 13
 Oct 2026 15:26:37 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:26:13 -0700
In-Reply-To: <20261013222622.1822619-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013222622.1822619-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013222622.1822619-2-irogers@google.com>
Subject: [PATCH v2 01/10] compiler-context-analysis: Avoid unused parameter
 warning in _context_unsafe_alias()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
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

