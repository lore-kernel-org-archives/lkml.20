Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602660;
	b=o6Mjyo+kPSBTwP9s+1WZJRV+Ej6/2MuUh0vz2/VNpTHMs2PhY4rT4AN3nWL/SP8Yyyl9
	 DTb8npdy5Xadh2QRyY/a28IVSwX3goaY3BlotGuHLk0ixZ6IWFSO/A4gZvAscQUfR5fiW
	 gcgpf7razkpFzTa2XS1nP8v9ic6oun42swK/49IaKXXDevwwTnOsjfytEUJMQRJd7Ifhk
	 8q4bBGl8BOuiilYL8tlcHgXxBGg152eNTKrRDhTfcgIHNtRPFP8Prk2qIVr0LyhvXoGF8
	 rg9XveRM24NP8hXKAt608AxGPVimRLf+VU8M4kP6efnJCaz/CpOkPAvtrEUx+lEcxdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EfwNfupZ0TIPuuv+IGtyp0tzfxdoSxsiIGDg+mfEKAU=;
	b=RynSbHcM9ew+Wto+AF//cBB7ZSe0C3+54Zu7GWgIPZT/xdgyxyuWpwGvqrNFK01rQ0wD
	 pvwqKz1PzYF/ktOuZFcokgjDx+NcB7Jbxfym68H+t1hJE9O/NOZKW1ay8UYUNSGCrukQu
	 rHbfmAVUpsmPbsCi0zvBby/gCph1jqG7Ey2uf8OKMiV0yJsi84ybA4olW8aCdIiDqA8kQ
	 LScFEH9LoGX6qw0oSBBVPRNHiKoZV8DfKZu53mPI66UFYXaEkSXDBjvN8//DSKTY7WoEx
	 RafgUcX1o/Xn4ZM2YrCgkqKbYI4PV7DC44Mf/hYjEx2gq6FsTEPnHsbVbndRPIYxemQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cenRYtIz;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B602F606A328
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B602F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cenRYtIz
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso963313a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602659; x=1793207459; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfwNfupZ0TIPuuv+IGtyp0tzfxdoSxsiIGDg+mfEKAU=;
        b=cenRYtIzL5g/KFvXHlF4y9NTGcDmVgvtXMRDcpFLLR6zvc50pahn5XGh6GZfL8FQqB
         gQqr7q+c3wJQGDGM9iichYXsqcl+bYjtky6GnPIce0H4zPxJ1woAVYSlPCAsPCBHxcxl
         xpIvAtThd7y1X9RI87Z6j9U+g1+zT62dN+U9tiKgLvB+wiJr5uFY2iG4yLpPBrKtassE
         xgiNUw3XKDa8iAornXTBZyFM1ovx03XSF9BBWCMAiiR2i1UXKEY/E4RF1rolg1HrP7hT
         v3lhaqIZx6bKoYmCS0nSGp/a1+ptPRgpA185mG6rGpt04XSOyq9+lBgdu8AaQEFxn9DN
         yUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602659; x=1793207459;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfwNfupZ0TIPuuv+IGtyp0tzfxdoSxsiIGDg+mfEKAU=;
        b=eY+GYGROu3E71+iyckPCb8ajAZ5WKZ97G8mlzK+dPOplmxnwNB/7jD23Q4wq6c35uC
         q6CnFFng00XUXRcz5GgzRBYwqOskT0suIG2vL248jOKCTG/tQW6go129WZPJSBscSyfL
         m1gswxOpv5zZnDw9EBllDh7Y/fFpmVWTawhM1QMC0oQWAf+ztUpZjMtqSp2ezMUaoCn0
         a3zJ8nV8q7tz31oqB1ybzeRIBNOqqLswdwTUoJbSwMnLioFDUzfwtCawgAWQAufcSwWC
         PIdiCn4XweQIMahW2Y7XR/UiHCGMcTBZIxsFCN+nrtDyIk9SrIQF4uk0GKFJSMSoSV9d
         9LeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRTC6pjrRs1UgE5UMDYeyeOoTof2ayKc6/bCQKDTGQz/Dmf2wyqEsZZ2d3afEmH4BikyAjdBWOKEwpYyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUAS+yOA2lqM3MJPXToN4nQXpd3o6Pb3YGLkh59gCLgiAzgcNj
	qr30DcAWNaUYxt6yKTMcz1MTcE1WzOCDEEdYmCP2F0TENJHUxdxtNKySjxzMVsWaOG6+Ued8vXw
	mACCwCb+xEQ==
X-Received: from pjboj12.prod.google.com ([2002:a17:90b:4d8c:b0:3a8:645b:da8e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b90:b0:3ac:c03a:38ad
 with SMTP id 98e67ed59e1d1-3ad86c00fa4mr2544214a91.5.1792602658534; Wed, 21
 Oct 2026 10:10:58 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:27 -0700
In-Reply-To: <20261021171044.155240-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020163640.746159-1-irogers@google.com> <20261021171044.155240-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021171044.155240-2-irogers@google.com>
Subject: [PATCH v6 01/17] compiler-context-analysis: Avoid unused parameter
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

