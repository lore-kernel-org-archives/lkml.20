Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825968;
	b=zeXngtep2M8WJwfQXNtszV1fFT9bOSGZ7J96pt0Ggr+OzKenMe/tH6j9LZRicqwIpUe7
	 O3vB6pCoGROxTatzAYPkrU6AoTTVoJ/ZbPuqPWKutXcWSc8T6uehrfCzdKISm7kYbljJI
	 oO7qetWlWT4PfjVmq7axF8lC8zojyKnPWkqY7DPMYNZT/+xxccnoVZ8eCdEyx9OKvQTfx
	 +hycF6TXn7iRP2lAIQI2dfffW6i1IbuGtxiPf1HokcXoJ4uaYjMrYrX0yh6LkUQ9P1SZ4
	 8c5PgT8O6NFxWbCSps+qQ1gCWncPQHrbeMFLhnZIYl66PZklYd4nMDeNbPkhhVN7/Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
	b=occic0dOAchvli3pctaOr6QgQ+aU+o87aTW+6IVM6RGDKPBkf9wV2KAn5aXnboEWuGnl
	 5pQO3CMd/qm8DSdGE1Nkl2PGjqAZLw7xfdUjxirJYFXfwnxiyh0nFKpFd3cBzDhVai0IW
	 JGYEP4+gqTnCvOP8ZHYDWIS33/VV4FVvxh6hp0NELmct949NUpaXe3aUj1R2Zk2Y+tNEa
	 ngJgKOydl3+kSRpkmcr4eG6RTbyu0w3vxhuz6nFFSDVbs+gx+g/TGUtKjlU44BVqdaKoY
	 Gpby9iLkvV3eEoKREzGFezcknQB7dIA7Nic/zwscIhceX+gItida2zVUsUHfNRba9og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dmlG66kc;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A0E609DC9F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A0E609DC9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dmlG66kc
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso3033465eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825967; x=1794430767; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
        b=dmlG66kcRRj0kd/fNUqpkHKLvSrILls9jC5PGoL8OR+Q5fgStJwycq94K/yX2Jxkme
         /+4Dra58WPFZHurtMdz9PoH31FskZ/iANvD0j5Wjx2a1cbWbaOlbj5QwtvGqr2Wzemyd
         tQ0U0V1EWsSZGzmsb6WCor7J/pk70zIixz8lEL9Xy9vXrVfU8hnGzarRjbaAHdauUvEm
         4stMG9HM4MDZKduB783fa8nm7oG63uenQfSrH2gcypnsWMk0vIfvvdp19fik3kyErA6s
         Vc35/XwsYzpRRCMDM9rkD3ggJWU7mDZ2te9BwdDOO86gsjc+SwZx9nK1uY16qRcj0FkY
         egHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825967; x=1794430767;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
        b=L9Yo4Gbk37K1QlceX/dwxF7I/EVnW91UfEHwIxdNyc+5IWBN8YdIotO5rPz9kZppqI
         RFBd8qu22W53210kijDdntoipF3BgoIEAnWtT1cP12fceZy3D7EaCZq+39QQMErlUlWc
         BQ3AXBGcH6YSciQyta3fKfQENxx9Ld+7weMtqFOhuKaDaCoyQg0dkAmrB9jVxLY+Wy5L
         2H638xPwDRlM9p2FnvlQ3Eo+ueX90M2tL+yR9BDOlP7YzHK27RGJojJllvF6/6Tox32+
         VCSD48rKZEe+HFuDfelKzDpEBRftl71mVHZuFbGnslO/J7zOWQNPO3vcdhXh3MpT3YfZ
         +NZg==
X-Forwarded-Encrypted: i=1; AKwUvBxWf+ad31Uky/oFrhilNFsE05Zl5UIJeQUwisv/ASZ6Wdf5OJIwRwvqzh+DUHnfy3O1FALUygik9Jq7104=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i58pp/Pyn1coTeJ2+qvd4goIcbhlGmlJSG62noUqJfx9ZmJjf
	Xobo3s+stgAdeXjpP0TjKcxfFxfmw45QIiKIZrMqReiI+JOcHPSnb7F6bVkINSO/wEZZI79l9qS
	Mg2Ac0HmCJQ==
X-Received: from dyad10.prod.google.com ([2002:a05:693c:834a:b0:369:a832:e377])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:6312:b0:36a:1709:458
 with SMTP id 5a478bee46e88-36a423cce1fmr29129144eec.27.1793825966833; Wed, 04
 Nov 2026 12:59:26 -0800 (PST)
Date: Wed,  4 Nov 2026 12:58:55 -0800
In-Reply-To: <20261104205909.2078411-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261104205909.2078411-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104205909.2078411-6-irogers@google.com>
Subject: [PATCH v9 05/19] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
2.56.0.455.g6c5a503b38-goog

