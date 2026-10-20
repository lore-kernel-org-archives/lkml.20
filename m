Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514212;
	b=TCpHlU7iwv2vGH8hPEHrk+zTxpNXsCppB+UwHmLuOOjZPsovaHBRlreqQaw6lXAspHSr
	 rbwqmkYWI9ohaBZd0LOQcE48mBTEMRsLZtN4dfNtZKYJnujDYSoe8fbzYvffCtSu5WWqR
	 oO3yDtvJ1YUZhT5dCgDCfUoRuMZWddFkOi6Ji7p4z5xrLXmpv9wAMFTgZVbD+aFt15cBO
	 aydxULnHSX3mVP77vBF8fdPSIfAAvvC8fBqUXIoazMIDCBQLkbSf19H5Rm/9Y0Db8fpML
	 N+yGxVTA5htFfGxxJ3fJhml4sjDeb0ZLzZ+AEjcREilil/4n4vXnTm74tTQ9w4o4Uug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=viOIzDo9krKszOCmVOjeW9f2aQpRArqmnQIoNv00KM8=;
	b=n4C3WXWAgYaU0g4yxWjeKoCPr++KKce4YkzBfhoVnoOxrdvtzUa7Z+NNidRP18hoKwoW
	 fSTvLjtRe28iVNZjnZ/W10CRaisiehCiqCG8w3ytzc5/6yMcw95iSEtsWyMWaFsRYwYr9
	 b04hMtGCVL4L8FpiNw4Avto0UsfnwR5lGviJ9WiVRRxRz2Nrz+D2VYoMNCooc6ZZzfEok
	 WpGqMUylFR3D3RLStHrg+HkxB96H4Ynr9XX2ezE25+2vMwTJd0ZM3/14YuoD7v/Fr+Rs4
	 6gz0ReAU0R3WXdDiTk3MYGCNm2IxlGJ+5T9tXh4pHMRlCCyE9SQ7f8qzPI9DLhg4p9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=X5BTfVBT;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12DC606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C12DC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=X5BTfVBT
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-366c279b454so931358eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514211; x=1793119011; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viOIzDo9krKszOCmVOjeW9f2aQpRArqmnQIoNv00KM8=;
        b=X5BTfVBTpQLcvB2MGZfAGtuwm237zHiWb+DSuZNC7Qp9faasqFzpZbyzmD1ISDRU71
         wBRzMGS6sivj6EYNa87pc2loGs0WCybULkcVHIlcrBlhjKYjwAoahk+a6mahFE5RIYBT
         PRei3tgM5I4THuneGR9JKvAC/6kkEv/z0nVuw+qdRO6bTtEgYL+eRsSDpUULuVKOgfXq
         Y2XfhbfRGhJdTj3ks1/oLmQPLMJBnfivvyMrah9B3Hp0m1CioM5u8KRCMOYPGHKvpp7y
         /osRzkFo51ojMSqKzYWgUN+NlGr0ZUxAVsNY8SuiZm4Y/ZTiVe5bC+iZ601IwISH4B2n
         d4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514211; x=1793119011;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viOIzDo9krKszOCmVOjeW9f2aQpRArqmnQIoNv00KM8=;
        b=Skal8N1Uv5hbjrLdC6WMHp9aeW+JQ8ZV9liT7AQ67y1tIFU9DPYjVVc3+dADEgvr27
         mttOU0gGyImSlvg9AUlFJPeNfsDEcWO5wH2QgH59dmt/uBRs9XkSyIreT7nv5cbDt3el
         89ix3aST8fMmY5cdJGsPZdRpHqcHIKmY3uVCQCZsAAEL+EqtUm5lyPee3HetkNFjaMHT
         zT/vzmBp7Gh1Wxfq6i3eo4NFIxAWveLG4DQ3M9xjhtJMayPgYbsrcAuJ7CNMtelYjYDF
         wCqIutGNdTJA5EoumrNQ8S313rHLsHUm8YcVxrALRWCIwHI/OeaJPNa8bwnM9eSW8TLf
         jqEw==
X-Forwarded-Encrypted: i=1; AKwUvBywGisepULABg4Od9rU52CpgXUp55rjxzVARwZ0tfueDZbOQhzX+yfKLtkFZjnBapcEcNx2B/TaYCQLtag=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDhy8oo3eQRi57vZG/awSCjTM0Tcg8sJDl1D/zBGVWX92E5NIu
	oudGmu/H6S+sl2V1zadXn8O+7l8GwgFUo29jXOW92OzBDN3vKbAB4jwrjhipxc3kTnO9sB2C4hD
	QzGjhIS4e5w==
X-Received: from dleg9.prod.google.com ([2002:a05:701b:4309:b0:144:c124:514e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4585:20b0:17d:7b45:f91f
 with SMTP id a92af1059eb24-18513b9801amr14365120c88.32.1792514210319; Tue, 20
 Oct 2026 09:36:50 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:36:24 -0700
In-Reply-To: <20261020163640.746159-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261016221700.1282659-1-irogers@google.com> <20261020163640.746159-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020163640.746159-2-irogers@google.com>
Subject: [PATCH v5 01/17] compiler-context-analysis: Avoid unused parameter
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

