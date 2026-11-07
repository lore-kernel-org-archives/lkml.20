Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026470;
	b=U3dVESIWpPlQZiLZCY/P8s5s7/qApQt25pKNOnk509jkR+BGBA4Mno1DCdhGLNdY5ZFH
	 coTwGIyvcvyMqVQ8qH/N1wm6lKKO7H4NalO/MaBuMkLj2xUnH62E15MSDubR4F5Gzdo2v
	 b+7+8EACs3pXlssEbGg64DWBKr1aU+UkATyXb93z6Fhg4dcFk6lZWw1H8dI9/sHP+DLoY
	 cahEWqqOT91ERaYqwtycz4zfx5BcNSdIeyWBzB79oxuiIO93GK/FlGWnOFB/qtmoQr/HX
	 WiJh8/ZHM7LJlWQc5yhcmUrIwP1DcM83phzubrYrjmCsndZj9JnZxohLO4mHOZlgo/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
	b=mgLFL+JU1l2KjaUqibs4iUu7zVVnBBWK29mvb1YZEDJFKM6DRx96qd22WWYnf+7Y96z7
	 Un7SCq4aDZuNNF/z/R/ve6SOvuAu45WX/5rqFrx5bQp5i4AsR4XDTiMqozL6t0PiDmO7i
	 oZNlgyyJCvukx2KIn9i9nmnAbm8jyWrgc+Hj6oN1QeBivkm3d6q+fAtc+lbtkAlvISTOE
	 SNJMmZAkwa9zr1TXnrUt7i+GWC7tuvc4x5J1HjiR7Cgwzf7l7k3CC2F+I/+6uFDoQCZ/Q
	 yjSnvyOwfKUYbNBhG2xxcQACpdA1x/8LtzMq7B8HbDtHJsrd0HV9LJg5KCLGb/bJCZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IliWAyAL;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922F4606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 922F4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IliWAyAL
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-49e5451d6a5so1275981fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026468; x=1794631268; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
        b=IliWAyALxjy1uXdSPYQsMwX7OxIUrYAt8aakwdcFa2B9I1f7wdYBUw2rQfybHJCbKi
         p+NBSKFtWcIndLmV8FpAu3Ilw0w+mPyQTbpCeIhkSriNzuBDw9MDZ16+AVygRNM9XcET
         pjHQfqNGyYOxQ3mNmqQiGT+Ff3/IE72Ck7LlY15LNJxrXo2BiVBDXjFD26v0sUj0Pzff
         QZ14eSSkx6znxNvWNncXH25UkpXUnqcD3Djc0np8Z6fxcBPnaZAL7HxMLvfNRQOb8d4O
         FgxxR2H6+um64vz7pJscZhr4devSryk1GM1ulwYTHHoqoI/SpHhj7yKJqPR3MdDOR8W7
         aMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026468; x=1794631268;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
        b=UnCzEWfKlybpKSbbBMk/NKfTphqlKDcjZ7I4b3ytU6qYI6fhnAYjSTxZzch6AYa3OD
         tOtus8TG1Ag/jwP7AnakgwvY0nGWKiZ1DNx4fMTbiR9wIHOGYWXwPlSBWgplzbrr3o8a
         TVfJjkNK4Bo2GcvS6pKI+TDSjRVxH4bB8KVl9XA3ukPAOGa0GhHmzdbFAwFogPi9akWU
         /Fc9oO9+MbVhK8ZA89aRt1wtbhv0p6RRbBKDVrcs47wYWSi0dMsOgeD6pHGt4c4smcCJ
         7RP0MAHPV5QglOSTBo/l3x5wWw/dfEsqyko7DSaGMe4YCb+D05ZbnHMeugOvFVZZFD2G
         26+Q==
X-Forwarded-Encrypted: i=1; AL+hErFGKiDmQ445keh3FO6q6A1v0vqnqKUZSkZdX74OhbWcFiBEAqLJhOzXw7YrldU6VngISh2wz+HLbsI4lW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lMTOaFbJBCbNc6Opabj+kUUvowAYk5IejBVERjUj+9JrdgUKc
	iQMVIP6nK0+sc1m5gk8ZFh5rUsxPRagtZ+R+oZBZcA5Pxv9Su4e6YpDvQHXW3ML9h6b62wWB5lc
	OEEfS3SVYcQ==
X-Received: from oaccr15.prod.google.com ([2002:a05:687c:260f:b0:49e:5a8:3cb6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:e710:b0:49d:cc3f:a9e1
 with SMTP id 586e51a60fabf-4ad98c52c81mr2878448fac.45.1794026468092; Fri, 06
 Nov 2026 20:41:08 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:42 -0800
In-Reply-To: <20261107044102.1506626-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107044102.1506626-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107044102.1506626-2-irogers@google.com>
Subject: [PATCH v11 01/20] compiler-context-analysis: Avoid unused parameter
 warning in _context_unsafe_alias()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
2.56.0.455.g6c5a503b38-goog

