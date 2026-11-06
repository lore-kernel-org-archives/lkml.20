Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948634;
	b=YqVecSd7ZIX7gx7f5Qsaoixnw2xTPvn040rk459n11GH5reDjdG8/YBLJ0kjagT9lt6S
	 ksB860LGY4OS4OR0yAG4+4FM9b9V1ZQOTJKCwdqNcNr5Vq/oLu5wwb1MtiD8XlazL+gdV
	 TBeNmhdIoPvqr9wgVQzSsbLh9Jfs2AamXPewyMAZbwuI2dILGN/xoLh/J9MQP6qJtTO28
	 lXT9YdjlOqYvdymOtLWG0l/6JPbklc0TJS5bYvn6YGZewdJqm1qXIYARSS1wHVofELFAR
	 jom1gdAO48FTvDOp9a1vpBnPwPm3pA7A1z1ZeUDeExQnYc3RsVXuDv5c/kDs4307Ecw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
	b=0gNI/yuReKoj1zKG+S+WevOZGXUaVzo4H+oAxM5CQ6LuZA17Vm7UE/EcLboss+cMGtWR
	 KAH7I5FO4wdoIEOQ21WEh+R1xNu9gCCsyQWH1W1nvdsiFIZpuzInY7DSadNpiWBI6MyD7
	 MhJZ1Z0YNXXfUr2x88/sHo6MvXJJBy99GOppLKmZzN7VqrrmgSEi45/q29GPO9lK2jCQB
	 32T1PHsSBxjemqrSnrdwwWqOEzHNSDpgGMvBCGC+LjNWB2c6Yo4lyqsVdb2YdhPVYLmkr
	 RyTUhBRLo+L5gbanA5yKEqGVCi6uqYU5Ry5ceASoxBeix8sf4BBdkSUWd9/HdFTdcRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f7sd+OYW;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BBE606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71BBE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f7sd+OYW
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso732704eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948633; x=1794553433; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
        b=f7sd+OYWJ/tV1texRXyFbE+uxQhcbXaQ4s2MwCggEhGtsyobGo+LZXAC0AyNc/aNCJ
         vyC5ZObxaQkkv8sIzIBIW5sacZgUt08EYg9UISikRKsAKH/imMMzkrYsnA8XeA8bvEKN
         NpSoepKPw9RdGAOchdmr7NcfiA+mi4dKZXyJC4Iw4VW45rVsPP8UksJ1N+WL4YnlAmul
         CU5Kkk59azrEgEUP5kEeUtcH1wnFYSHgZz+sx9WHbDzbOkL66E7TlSwFvcXXfDx1LX2y
         bNQRqs2+Cz4Bn1HTzgp4WGaFZCZnXX4aMPowVR5C5+7C//4+JGJfM/7ZzzO4rllg0jUa
         eCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948633; x=1794553433;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
        b=HqM/xSremdawMc7W3y9EiQa/Fbvq8jEX6JfgX0klfYMwZAEgvItyj9/EusxdRozO1Z
         YWFTdCx43YIMwhSutmnoVxOo6OvaszxDJ0tjwY4tqOIXzBTndq2pG6q+nbu8YzSvkdJ4
         09Nb3CSByRdPJAhkRyxcmXdCddnuLR73sfOqolNRv3Vn7xbNOM13goufGezMQUmya6WT
         106+aAIt+IUgEDT1jRDrHBBcBt4L3fRlXdNp4qyzryoUo9goO4HB9Z2HgvISal8fIYp1
         FAfA3d0t2zLisXgY43mJeE4vjl64xeJsy6Q2IZDHvKxT1gv1oGPS1yHLHm0L623Ffeg8
         T3tA==
X-Forwarded-Encrypted: i=1; AL+hErEy1b4EiIb6jLiACaDdRtP+1aqO1kYTJ5QKZZY6y1nk6nLT0nq+tcxaG7VRo1TJ/5gwGhyIdRTvKVu2SYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DFKb5ozuTe+Lxa53neR4SAcvBaxyTAtbjGVdhfN78jCelKk+6
	lzp6zSpEqIfjJNcGmTVtyfJ0QWpbLJuF8hMzWPhIMTaSPNbEgJdDSA0hwhmd6GyhA2fuyNjpB+I
	WUA8UYreefA==
X-Received: from dyvp21.prod.google.com ([2002:a05:693c:8855:b0:369:f864:c5e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:40c8:b0:36d:2b02:86a6
 with SMTP id 5a478bee46e88-36f72cc1ae3mr2730314eec.4.1793948633131; Thu, 05
 Nov 2026 23:03:53 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:25 -0800
In-Reply-To: <20261106070344.329897-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106070344.329897-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106070344.329897-2-irogers@google.com>
Subject: [PATCH v10 01/20] compiler-context-analysis: Avoid unused parameter
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

