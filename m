Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CB647CA6E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217045; cv=none; b=sBMCFa3oCpLGnedQ6ED4Z7YAxF8hnsCYI7XC+t6Q+hniP2lylHvEpIlnpvI5DRwUxJkG+B75GqY1K5wISE0RN5c8mXSlbYD+6GutBLkak47mHYkMHRn4/Yza+D9DaB5hl1PieJG3OUqPN6hic/XHDuXbWVIpr4IVhGLEzTahjzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217045; c=relaxed/simple;
	bh=eLqv+lkX6bdqEC8uIn+bLdLkhKWAHHUUkudP6LkLSno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m8fYRaW+jFkGdZ3rXxdc0MZb+n9j8ft8e3NR4jhLtIp4kgxIujsxruJMYFB5In3JAKKN5o0aXBaETt3R9kqZXIG6otsRaJ23P009Orcz9js6YhOzUBZYFNWTPsJu+/awjor59IISPlIE1IreFgNAUbu50Z/jxbRjxgY44obgP/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7dG3GES; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7dG3GES"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so334554a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789217044; x=1789821844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fd0BG/EWunOB+q7PV/ZVh026vIj4CU3m1NzQ65Z0ygg=;
        b=k7dG3GESBFVAk96N8V7Dkdf/w3ccIB0WXf6fGi2sgqsogIx8hU+5ufBXgzYDxS+gSl
         M0a8SOz5pFykkvErtxA3iPgYkYuTBxIAuPg3E2maUYYNWhNslfJYceXhhfky8iwa98/J
         K2V36acEEtEoIaonaZzrCVpq45eYZI6N+Lr1pMi1xZwsgr0Zthk1Zke88EWG5OorH1eq
         tR/Qx1Bdr1ij3oSHBUi1j+QfiYMDov8Lz3unhdh9wUb+WJkHq5IzDWMHXN1nb2U1bFNR
         Zohqno7r1v/pJvJg3NPMWbnoDWyYdoefNP28r5mf4Wfutz17bSFLn9/2YJLqs3+1dUwm
         zDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217044; x=1789821844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fd0BG/EWunOB+q7PV/ZVh026vIj4CU3m1NzQ65Z0ygg=;
        b=ryg9wztyBPR8goWtntdLHO/gYIyNLt+LrsF5Z8WRKX0QeW9vvPJM11rIpcDC7ySVDj
         woiOOV5ZZWcdAd50R/AGGYjRMjLOl/kc7kJJkCTU/UwEpeQrGFJ2DWP5pCFeJ0lDe3Gk
         F/SkdxObnQ1XxzT4yvnidsXKKuWLYZ3hVejqzDtRbonqyAP9y9rMVEO7PIHOpNCUjZCc
         m+bmTIuv2Vhc0rHse/RzDi1zl/B4bJ2bja/jrvxPjNbkI0a6XYvgb7FrRa54IYwjllyQ
         PjRhu0IZwUVHr8skLSTqZa26V7Rcnv2wQJYFL3LplJ29xwLEBelGddgOObQiydEq6rqo
         Z19A==
X-Forwarded-Encrypted: i=1; AKwUvBzh34E5xpYPqJFr6vsd8IZKOQ8PVEXt4Y8NrE3qwQ9tjWB/RYvxUUlt2MUK45rWJwvq+0HYzQYtk8AQZ7I=@vger.kernel.org
X-Gm-Message-State: AFuF++ks/uNCSTpWYkY4/tykjqB+E2FIaioqWjXZHZjQ8yDR1FjrRH1M
	7/ICtyNaeFTVzygy5yNNWPMzUUt3S3SwCK+9yP4PwpZ2JklrPEY/D/Gp
X-Gm-Gg: AYBFou3qAPGUevY3Lqz5ah/50zFp0WkO7VEdjkxqhb8O+OvRB9CmoGJCp602LuNSgZw
	z7kZSBRk5gOmUpjonVA1ANdA4Nx7qk11hOaBva60bzJnomVvGVF7/iAjo/6w9s1Rk6+dy5izE7z
	s3A5L/AXRsjGuPum60Qj53J48hyiMfTBjEkgf2k6Z0mj+FJmJuyBEOCKj54iuVZHQvJE72Er7DE
	7RxWzn+g7/kOK/+MTMjfscdYRUr0QLamn1n52jJGidNSw7lSRUTyDtAZrU9C8pjnFlvEYIKoWa+
	S2T+SkYgqfTBXI296fFPWrZk6M7RjUH/OkTb1glIWdsZaWGNHtuElJXUBfaGL7/GzUNgrjHNyly
	U1UPKMkheyTyyC8n6KnwFMYcWlYL/85PS9d1UJgjpz1ld+yVVKxLjLxcl1RdNcuysBe3IVWvWcp
	ZNH5I4kKnotj4KGr2JZLOT1hKrlMYtTVcXCwsb/UtvIpGoTendrXyIqO415VIiFt4Vr+kBO3rXZ
	/O5
X-Received: by 2002:a17:90b:57c6:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-39dbbeb57a5mr5027381a91.7.1789217043584;
        Sat, 12 Sep 2026 05:44:03 -0700 (PDT)
Received: from celestia ([2402:1980:8858:8cc0:7bda:d54a:257:22ec])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95713602sm10294840a91.11.2026.09.12.05.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:44:03 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: 
Cc: Liew Rui Yan <aethernet65535@gmail.com>,
	SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] mm/damon/core: add short circuit for temporal-goal schemes in damos_adjust_quota()
Date: Sat, 12 Sep 2026 20:43:12 +0800
Message-ID: <20260912124406.96535-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using the temporal auto-tuning algorithm, the effective size quota
becomes zero once the goal is [over-]achieved.

In this situation, damos_adjust_quota() still calculates
quota->min_score for it.  However, this min_score will not be used in
this window, because in damon_do_apply_schemes(), damos_quota_is_full()
will always returns true, preventing the scheme from being applied to
any region.

Therefore, add a short circuit for temporal-goal algorithm schemes to
early return from damos_adjust_quota() before calculating min_score.

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---

I tested with virtme-ng + perf on a Proactive Memory Reclaim workload;
within measurement noise (~3%), no measurable difference was observed.

The purpose of this patch is to reduce unnecessary operations
(calculating min_score).  But, I'd like to know if this patch needs to
demonstrate that it provides better performance before it's merged.

---
 mm/damon/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index ce8c6f99106e..fdcea989f0e0 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3320,6 +3320,8 @@ static void damos_adjust_quota(struct damon_ctx *c, struct damos *s)
 
 	if (!c->ops.get_scheme_score)
 		return;
+	if (quota->esz == 0)
+		return;
 
 	/* Fill up the score histogram */
 	memset(c->regions_score_histogram, 0,
-- 
2.55.0

