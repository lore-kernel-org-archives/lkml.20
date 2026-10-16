Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3D057F737
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171879; cv=none; b=WeBNKAwfviE6hou+18Xo/KwyYR4BOlZHm3ZSyOaAu288QqU4OTa9QCeo0ZOcITt0zlxL5R7VolaTUI5bnx9iSPcWtuaeb+yLiWbMj4PXPZsPw+Ia6RIX8uSDiAkFYHTF8zeXOIObFE6O9L6eGG1ofusnQeWbBvXkXP4tm2NVCzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171879; c=relaxed/simple;
	bh=wrvIrrRxxCxbjC5y19PcJbeqSjug7uXwZUzwZWAtOzg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XMLQ91k8nu6s7f0hF0eZf4dU7+7dupNuiR5W5+/Uf9cbgqGKWG+2gFVp8R2MJWwaFv2Zmi3S+zxpuy1jloUe28Vccf1ydKG42rRdaeM4JjowalpFc92WT8JPRjYZ7efqaEuZN6SoVGPTQ3nSkZ4WRWS2ilzEaFxEeHAzAzrUXoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I9FOVSIY; arc=none smtp.client-ip=74.125.82.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I9FOVSIY"
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-152d1363a29so320448c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792171875; x=1792776675; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viOIzDo9krKszOCmVOjeW9f2aQpRArqmnQIoNv00KM8=;
        b=I9FOVSIYQUT00SaPdUhzRmq1rK4SEHUUF/leIAiajrrORfFAvVMJhIcDqgRbvGRJ4o
         lfEUOrdCMQnB2xtEJJ5UGStiT0SfTirfpjWM2a02p+hq0Dz8kyFrzcVGh36m2pEX0LwG
         N5vnzbj5tz7B4pKRjmyYaETMKOcX1cYdTzYn4iLeIECNOXdLpWEG3LsvF+L06xJhctwQ
         NUiWzBq7x2br+Q7wWKx63XWMm52bdHz5QYOE3G7GfjEgK15zsz7iXrNRtDcMEBu5qsM3
         jVPGI/zssV8Jm8H7gkm4zVBL0fdXoe3uCaH13hUD4eokK8mVj0lYCvRjx1dvOSzeXJb5
         w8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171875; x=1792776675;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viOIzDo9krKszOCmVOjeW9f2aQpRArqmnQIoNv00KM8=;
        b=XIyJOnLRcvAVTHZc0i2uIsDc40dzQsV0BsNfDitOL5iQyngYcyncwDumq7A7+n0/jQ
         0S5GyspLAWKfWSp1xsbLJE023c4/rsNDB88aQz3AmOSwsQR9eTh19QtBC+ki5tYt1DqT
         OqYgYRHY/bPQRcn5z4eKcKnBbQ8oPKrFT2VPngCkPlwk44qWxWk49+uhnpDhfdy8TWPN
         x/1wkZ/RPbZ1ODFeeUYOIjA8BonuFLJRlNkvTFypksQWJ3mjISOrh1I23YDR/66sadKa
         ReVbT93h0ciCM4gvEvdZ2Zv92B0xopck1xegrtA5gsU0teWBi1MGU1PuL8qmP3kWGk9t
         0SbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaspFeB1RVfB+zBxshLfOVEx0YmiYvpdae/WmPvhJ+KnIWOxMcc+eETNLbWv055pWbHhE08NPyqEgV8SI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7yEmaCFwJXvTkWegelaa6OGQZsRnEv50+uyMP2X9AuGu0WL3z
	qDeKxdIv1+HlNG1bFepHSCx4xfZHQ6mqgdR+GN9aEUXyWOyFj6OPoKB8NlCFf//nqUGqQydDW43
	QQDlZ/sst1A==
X-Received: from dlbtp9.prod.google.com ([2002:a05:7022:3b89:b0:16c:8019:50cb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2097:b0:14d:c9e:a356
 with SMTP id a92af1059eb24-18511ad8b0emr658014c88.12.1792171874071; Fri, 16
 Oct 2026 10:31:14 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:30:50 -0700
In-Reply-To: <20261016173106.679725-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013222622.1822619-1-irogers@google.com> <20261016173106.679725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016173106.679725-2-irogers@google.com>
Subject: [PATCH v3 01/17] compiler-context-analysis: Avoid unused parameter
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

