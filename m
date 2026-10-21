Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622355;
	b=OuX6yFKFS7wa0FwX+ejCLCenvJHOiBadTiFlOY1BjBiZr+0aEWN6Y9vc75jfNEUYJ8yv
	 mD/TcsAW19wJnFERPy/guk+m0izddcqN4zixAueXcpAGGOvGSimExf2GslvZsSgSZYcQl
	 tidEpzKrC55Q0JDw36aDOsLEdTPSG9hDFEOz0txPsTfl0Ps85arT4oPIV38CgTt0TgfEV
	 kRVBamBEJ4NxWZho5zrb3u9cNHrXPNrTuo3giwF1e4ao/uTgp6EwO9V1hlmdDeIDCyUqN
	 9fSUECLzGTSAxBncxmG8osN0oXcH5teQxpLH/Jo+UnJAsH+TM1MAZphAJEpbrxjTlPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EfwNfupZ0TIPuuv+IGtyp0tzfxdoSxsiIGDg+mfEKAU=;
	b=CCqT0pEeIRZYN19g6w8Y14Q3z56CYZR0sZUQxEZODSDhLPCbTG/SpA6Tq2I7oGtSeden
	 2iq/Mmgmq0de7girTqD+h9cEO7iXNL5bdW2IXf9QQvX1BfZFIl0upsgmffd4K4qtz1j4f
	 BbT7WuhQaaMKaJY0fll+0yTNhEWHJkfFrB58sShwbIRF2p31Rk+y6I9orRpBkfaZahFwN
	 TGFQEKDA3MGRlr5WbLGPPew9wd+8zYWF2zcFvc8uTDzYQGUBaW86o049ledtABSWut4AM
	 52JFOmbgWK1ic3uiAEyeOMGWO3p6oD5IQmIH+qClmX/rYy1e5HaRkArJgM2adXVEobQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=j61J4hAe;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB24B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB24B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=j61J4hAe
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso2548753c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622354; x=1793227154; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfwNfupZ0TIPuuv+IGtyp0tzfxdoSxsiIGDg+mfEKAU=;
        b=j61J4hAettOCJAV2Yf12i7cgtPCGYtlzFiqpXht5gWErhlUAEAzDBETkRZggx6k8FD
         3pKFKSyhmPY7afOsnoTl961fj6+xMqNJTOoiV3Bfkp2w4XxS583Mv2e5ktX65e3fBgw9
         4SUsMxknLozAOfP/HnHD3PD54Z+QQhX2at5AshLIqb5Z6rzLn1FIMSkXxP/HjNY3qtE3
         QiJyKYj+adEg5GtNicESm//2EBXPirqDJZgTspxsGnent0HcKAHhZfvpY+dZ3lN11AhN
         JWqt4iY4FCgGNv0KVI3wwG0hmLqSuh98E/e77OmqyvjzPAMRC0vj+i8fCtYEujOYRT1u
         FUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622354; x=1793227154;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfwNfupZ0TIPuuv+IGtyp0tzfxdoSxsiIGDg+mfEKAU=;
        b=dyoM+7p2s7VZdC2l9g/cnzf9/64vA6jzyxwpdKQqon32UY2Gri5eOJrmP6odrwhoIM
         tdCHdZdlZIO4BE8DUEmvc5YEtfMWdxWIbP5ONViul+WnSw3sQHyr5Bz72VzweDPce+ot
         dV4gzMjJIwHSC1+qeC1ccbYizq/uJmdLQRooKEVbUskqorknYyEUAuhSTC83EdWC5mYI
         FiqZkw1GGBytchOl358YEVeyxzeDk/TciWQ2bwNXWH09+SEw+FFJSHtvr7kaBT3LCu2K
         kmIcSo0NcyHvE52BE8pd2LD3hsw+pJV8krLMHvq/XBlkCBvKsl8oDr5DcFtexmYbsgNv
         cwig==
X-Forwarded-Encrypted: i=1; AKwUvBzTiXQ4OCft4XTBCmz12VoJ+2u3AiTcFnLNzND2YSYiNyNc0vCPq6TBsFduzy8GDdJCVc58X1cbmm30TuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnMfVLcVU2qJGp0zJDrs6ixbU1QtRe7mC7AMjwmZKROIHc663W
	OVeX7BJPDWOM6k6L+CzhrxbL2QNCIbebGzSb/opYQqphLxKyKe8xG0kkb5oqniPlQgdUDS+CENk
	bEHyWTViDpQ==
X-Received: from dlbur22-n2.prod.google.com ([2002:a05:7022:ea56:20b0:191:1417:6caa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:d0d:b0:168:3243:c911
 with SMTP id a92af1059eb24-190a6dbcf54mr4906912c88.37.1792622353590; Wed, 21
 Oct 2026 15:39:13 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:38:49 -0700
In-Reply-To: <20261021223905.715051-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021171044.155240-1-irogers@google.com> <20261021223905.715051-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021223905.715051-2-irogers@google.com>
Subject: [PATCH v7 01/17] compiler-context-analysis: Avoid unused parameter
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
2.56.0.218.g1ec904b173-goog

