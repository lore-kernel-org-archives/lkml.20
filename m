Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588122;
	b=E4hg+7nxZd98E8WpZp5pW8iPsQ1Ay5/RXvbtzrQH7ne3H28wQOyA8tPLhXdiMft+fsPJ
	 5dwym93rDBdcsavhyuF+UcDeOg0pUmBhvYFXsPNDhv8Dd0cCUCEfrQSZ+LVGxXN8DGErf
	 7DZ6KFEaFJ+spkITgmlL4jQT5piGPm3L+lqiZVUHNUhAuvl0QuOKkfuTRXEV2TEAHzD5E
	 WcwTu+S/Sk7AfqfIMmpheUFkkxPrTJdqBkX1VdALhBWoQUm2hm/aVXTNyzGbg2/nb5Hei
	 if3Czedi0m3VOsZ9oWv5IanZf3zwjSYmIq3aSPgA6/162wnL9bZA1vEoR/11cQ7JZew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wNOZ8QyL0UheBANe+7QNGXLjq8SQVqhuN9MkvsYBKOU=;
	b=LxCipHJvVi2lwdEMFtYIc5wNxHLsFfHyZvTiWPek1+NzoVMZlFsA4VpOtvFUf3r8YlzD
	 TXAx9xQPKOyvRnXNjkZKv4V0wKBD16LqqVw/vXgDZ1L46dxOjf8+BUo+L2uoaYfMF2M5K
	 r9vYbK7xQBgzzbLdQghbWn5l4nf7Eg5kOpU+Zs4inLoK6FyI6LsmfTZklz/gRDi6F71f6
	 f2d/rmYb6ts16Ial3aD1/xUL9frTtXDEQP3F8iANYkSTB8RBqRV/THdemG/zcWl7CCXvj
	 LvW7pQh9FG7FfP/QBup+ZXuKeHzFVXLmMvyQ7BIQfBonnCj0IqmbusL9bcHlheCYmSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qJzeW58f;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E450606A8B7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E450606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qJzeW58f
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b29df78132so401280c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588121; x=1795192921; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNOZ8QyL0UheBANe+7QNGXLjq8SQVqhuN9MkvsYBKOU=;
        b=qJzeW58frSJVc/bTLXJ1qVwDghwEIKW5P6kTNZCmkEMgWd9WdH4878RrtoAN22owpZ
         zQuKLqJofTK6ANlVd3cE0aznQ+ftaEXBhp+DsWIH+xdEDmgcGnS6NvJ5Hg/d7swNWSWe
         DjphfHHtwQWIka9/u9Pz03Pc5OkstVEuF20dNn1JKPgLzWfupWpQFgSfQ0Ln4utrOdht
         sLr93KOS+VpoBlBU2uNgztQInDmI/wXaxugzVPimdyA9vpFS3JYGLLKNoaRkf9a01W11
         vb5pLOoeQXjTC7g3K+zFrd1zLH+KmA81stNRwbIgWGmxIj1tfDTs8EIQqJlbySccO0eQ
         D1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588121; x=1795192921;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNOZ8QyL0UheBANe+7QNGXLjq8SQVqhuN9MkvsYBKOU=;
        b=jZ1EGrCWnrzr9c8a2OSK3R/B8jhWs5EOK8t15C/80BY27R2m7ml4qDTQXEqQhW4Vxz
         5YKfLgVn6098uJdafH9WPKjKLo3Df1bRldNUp5E1c0tOU3wXgTF4T0sOC/098G84Mgbs
         XY8sWJeqtwrJW09F2CNkGR+keCZajyNLKzPGr8HO8d/I6SNcqecbxUugZYnpRmr0XLCo
         CoclKafHahLWdwieNUQE62j80XFBk4xsISIfODRieXivVYpo4C7dYgs5DnYtywoHYDoa
         9q0zf1nal4C+yfZ8nG+5Uo1RLSujbKfNymC0Xvp1WonRduBAnaSwUwKHtWNU++u357wN
         ygAw==
X-Forwarded-Encrypted: i=1; AL+hErEGoWrkAYgjcv3Uv+3HamwljqoV7yuaQl16PSdLKZRskb8rc4dK5IHESGAEXSYHqdPes8hhrqwt6m3tcWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e9RoD4ROFPp5nAXCNQuh16q0gmtHquWJ2BKfDaBKCQ3TAfRFv
	1LYDp8LvG5fnCTEpBhc2kmWCQd1VXugK/UEIpDAOXbllhBuFo6jOqRe7LkJohdVR3I6qz/8Lvwj
	j3CR1QqmM2A==
X-Received: from dlep4.prod.google.com ([2002:a05:701b:4584:b0:197:f679:f62d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:41:b0:1b3:90f4:499b
 with SMTP id a92af1059eb24-1b502f8a8a9mr3200571c88.0.1794588120968; Fri, 13
 Nov 2026 08:42:00 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:32 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-2-irogers@google.com>
Subject: [PATCH v13 01/21] compiler-context-analysis: Avoid unused parameter
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
2.56.1.703.gf848ed807c-goog

