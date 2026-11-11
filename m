Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418942;
	b=pAiXCndtRxiAsR4s1FKjvBUqX+mD63ORg/nU4ZrrwobGXM8WHghcYjEiO0hNjL3JKxhr
	 yH5rpOs+g6V7G5j5zXJ9i6XKOoTIpeoT2qlusRUiEu0oMZsa6DSIaCR2vZCkFn4GbNlR9
	 NrZnNavswbEMyvgR8h3n+xKYzGFKWaGjilK9reOi/geJ8TOHrDSCmqT2JAtVJqh9Myll5
	 qRX9mvNGp+mVZB2FkKUKH556mQSkN4+Xc13VvxQHyUZN51wGpAU8UN6X7Pk44mWgWF+7e
	 1WwaDDfJhHB2RMWDgyf8RyDmQHt9WqFtnLebptuhbWUpK/OLOVYd2OouQkqO9RQAG1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zDRXRDkvAvadJBp5vb4+ZdZF5QkdvjyK1sAy//1KamI=;
	b=qJ459I4JGGAcykMCf1nVuwoxyZ0oI3egAR65oQUV/d7KMchxOuSJw95PL0c3YXoX4VCf
	 isVp2L0zSpdPqBvh1a4RPt4W8bKmxbqVaDx9hz4x5AONbk76apwu3OjhUf7O3hl8tvw6n
	 ZGHa7XXNIPDAh75zIPYAbTXZO6vsq1jKJofkEGjXbwvb909uGk5heHb3JsBJDPLJcLIu9
	 4Xf33yYSIVnjS18/Q8f/lC8TD6Xn5dLVvkKWkbOOFD1dk2zjJ9TIdt8wo1uiwbOy9+dvU
	 n+T5qbrygfgJnGVah3osyW9MR7vTKt0us3pqd6nadWeIBDTTUQElAtGUkNH4qH3arBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bu86TRv7;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E34A606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E34A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bu86TRv7
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so52237eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418940; x=1795023740; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDRXRDkvAvadJBp5vb4+ZdZF5QkdvjyK1sAy//1KamI=;
        b=Bu86TRv7lWNL5ZRXbxQ1f3us+2YFob40eTV15x+VhwyhYhYoDC/8w761Xf8Z9/Eo1X
         d08ERGvVBUEvAeZZXTg+7yK3h2DGcePqSQs6xPtzDtrTvweUaEARPYhMyxGE4AzNXhKt
         3FlpO9HhQrUK2EE4+FcXgoSo5joiwMxEEgjR/9EvdQRSFYZBZDS1v1nAup63GKmPKQfk
         vUV5yC+cwocGYXgjHYGIeylmRcdpOl8k5DkTQeDp7DPGu24L0/mrlKX987AIQYfjDuBn
         i9QdMPAEMEXW2VVDJwIQ8puewsWfqAjOXEfeJZGOGje+qVpTnLSE1JectrYlRD6+HANe
         /3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418940; x=1795023740;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDRXRDkvAvadJBp5vb4+ZdZF5QkdvjyK1sAy//1KamI=;
        b=XGcELHn8oiuMklyPLENcpSNAGInCTiXEF+3GcAFKELE6/w7W/4gv0srjEY+BuF3849
         RNJuGKNujeLdsjHvG6eSRUSg0cp90AUIkvTNpEUs723a3Poh/zjzobZ9OM1YQBA2meeB
         IS8RPoyiN21b+ujuwlNmr1hNhF3T/3QHbr60MtwjMxzEkAWPOz6VASZP2pKvc6AkmqgG
         Y+8K51KqU46rI5PwPnfMs+aW3tbQEUXC+FN5Znu8vpqNJiUYNgsCelvzO6twA7T+81O+
         uJs12LRxRkR0Dh3KsM3y5b6sAtCdG+Tk0uN6c9ObHPjJH7Ap8E4Sfv5+hTOHrXFJ2yhp
         1iBA==
X-Forwarded-Encrypted: i=1; AL+hErE2e0oLokY1Linr6tAl8nOLi0vW1P/O2CICvAuGDaju6fsOgYxjfKBfOg3e93cMmSAwpC/Rdabi8Gi3Cwg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xtRZcChMWaWLK0SP5RPel0TMNXzWVNSzzCfmIbxS/LH6uNqmG
	Qbt8v/R8MNRorZq5ZUyhPk8eTe6dyKVhypRA8qLnWDI2ufiU4rbsp4rkwC9HSh2IcTcMGU4S/q9
	ngQ2SlcONig==
X-Received: from dyboe15.prod.google.com ([2002:a05:7301:3d0f:b0:36a:184b:374c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7fa6:b0:36d:38e0:79f3
 with SMTP id 5a478bee46e88-377e1af812emr141935eec.25.1794418940056; Wed, 11
 Nov 2026 09:42:20 -0800 (PST)
Date: Wed, 11 Nov 2026 09:41:53 -0800
In-Reply-To: <20261111174213.3526604-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111174213.3526604-2-irogers@google.com>
Subject: [PATCH v12 01/20] compiler-context-analysis: Avoid unused parameter
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
2.56.0.542.g3ef89b7020-goog

