Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602684;
	b=dNsNOgaFfIqTe3GRiCT5RvHqB7NLkWyxHBY+5YYGyG84KSXdW8OU/gGzVwhDT2qqDkmC
	 PotzN8r+ahJO7KheT6NVL9qpIInwPteetM+R1p2eSuyBlswJA+IiUcqnC/xlmS4caZeyg
	 Tx+vubNhPrDR/ggLYhjFYfM5QMsIrH2X1SgUzLUnViB2xl+HadIQSNkOLjTAflLx/W5BR
	 tNgFez7O+sGmoO0AspEpZfOQqz6xnZJWk1VhEireYmlrTcyzD9FOIl6WBYV4xX4DeWYoZ
	 zej+iEh6oDjwD2hsW3W0ZjpnPvyuJ0dQ2Eo4WlbAL+qUts5pvgR+v0GowUEizteEnOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=qxTFTtf8V6FF42iRmNOHdvJNuQcB3RcU8GW6u8RfjpA=;
	b=fP54DzaG2dHkS1AgZkS9Zq0l6QzHypsh9Z6C7kTAz0SfufrXebdGTDAdWzmoiyejzr/m
	 2JqDa6uLkYAjPwdSQKOKDzP4tN071dOXwF4PQp92e9YAKX1FosmM3K22krWRoyd3dmBXV
	 o238nkGKs7EXsDYc8Fxz1BQfnIGsTwCdYXAU6Zq7I7mrijz3aPgKRTp5c3gjEc3DFEglR
	 TJIewBQIaR0VOztoAQAHdcLqIZViLXwtno6wn+MtNE1JYk54uKsH6pEn7R/lGpErImZsP
	 18Fx/Y49KI0deTem1rr44+Y1jNOId89zip5VjjPyGxAq+5Fs7JKTVJIvEg3mi9DA+NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="cRD/JdmM";
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6327606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6327606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cRD/JdmM
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so826188c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602683; x=1793207483; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qxTFTtf8V6FF42iRmNOHdvJNuQcB3RcU8GW6u8RfjpA=;
        b=cRD/JdmMX3CkUtEnuTfeUvxDCO3zy30tqwynMZdClCobMLCdQdU5d6PwDa8KoQYJoC
         xrsw1T3RKxI7NOhDrdIXjx9V4Mh/6HCwDqmFOET80Sdo4rqdbr2hjtGMm8GI9LNbfiQz
         4Efm9lioKBTO2g84k0/X+XuiU8LtWjaBN2AMJoYrKM0MxFbzotsPKw4KjbHNKQq+52nH
         gFYlKVVCEjtzHQUg28tvqZA7duiUZ/l9j0OjK69fGBJC3+CORkEZx3ke2i3O5MNVnQhO
         w+Sr/yFoExsU+Dm2UaeeKGYNt/66ceMNA9P/5YbI7fLOrL6iK9FRAc8SFmmiMJz9Ev/j
         6y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602683; x=1793207483;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxTFTtf8V6FF42iRmNOHdvJNuQcB3RcU8GW6u8RfjpA=;
        b=lkNy/S09TFTrCrwZ+NT4jyirRiPxIzBtqETuhCWF1GCYNIQfIQ5VWf9OB2xYXCfKfK
         LazQDNRLaplcVK1Iz4PTT53pQjgUcBBW4/LLye3HxJYQ//Q8SI1pVoszYmT8iYJyN6Ms
         CtnbuA4BSgu4nkINa0gTk2WSJ+gyK+nx9n3IEqeRU+gDRspRhnpSDBGT1i6IZqH7QWW9
         jsIy2gZCGc1O2M2ATmCbEvz35ZO+CdmZGJkW6MRurNhgO0bgA8c+HKg/wn3/JCTccR3a
         j3lrsEEaORhgLBj4qOYe4HCtaGTG+or9FCRn496KzMTHsQwyrQMdlQx5MvGn+WpX8nmO
         2o4Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0JqaaFvF3sWhnP5Cfo+QfAM5pZiz9f0z8nxhWZ84QpxYhzwlXN5q59kRO+Nh+3DRBJfIPa+q7ff0+D3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXacxo9eDwzgb7umaOrTHzwbQSAWAIMXgmzi+n0F5V4+E78een
	DXcCvkM3vWX5qGYf5vHZtNctWSyS2UaUSS8Ns5jMvFnC62qtWRjUDy+XCfzWlKM8ogdNwOvjls0
	OwSoQQKN7TA==
X-Received: from dldz1-n2.prod.google.com ([2002:a05:701b:4181:20b0:191:2838:ebe4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:906:b0:14a:8cff:fbb8
 with SMTP id a92af1059eb24-190a6adabb9mr3548333c88.28.1792602681890; Wed, 21
 Oct 2026 10:11:21 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:31 -0700
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
Message-ID: <20261021171044.155240-6-irogers@google.com>
Subject: [PATCH v6 05/17] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Align tools/perf's Clang thread-safety flags with the kernel's
scripts/Makefile.context-analysis by adding -Wthread-safety-pointer,
-Wthread-safety-beta, and (when supported by the compiler)
-fexperimental-late-parse-attributes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 3eb8d095cda0..b50702bac53c 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -64,7 +64,13 @@ ifeq ($(CC_NO_CLANG), 0)
   endif
 
   # Enabled Wthread-safety analysis for clang builds.
-  CFLAGS += -Wthread-safety -DWARN_CONTEXT_ANALYSIS
+  CFLAGS += -DWARN_CONTEXT_ANALYSIS -Wthread-safety
+  ifeq ($(shell $(CC) -Werror -Wthread-safety-pointer -Wthread-safety-beta -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -Wthread-safety-pointer -Wthread-safety-beta
+  endif
+  ifeq ($(shell $(CC) -Werror -fexperimental-late-parse-attributes -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -fexperimental-late-parse-attributes
+  endif
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
-- 
2.56.0.218.g1ec904b173-goog

