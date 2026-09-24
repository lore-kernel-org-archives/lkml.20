Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FB3439F73
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280999; cv=none; b=fiHgLdnv12WqBKbUffnqalryIzobMPIlUdIueZBsrHP9vlHAd6XD4IAnhOpPj/RiEB8Wv0Mqh/ONiJN5Ge3tybibhmpeNMg0+dn1LzGEE2jC/c+jgpcKyaGLF8Zq4aXWE9lJ0o0ZKya00GeodJDfKdWOvw7aLMPHk1aBpaKRZXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280999; c=relaxed/simple;
	bh=2wH2gjfAFykx3AnQ4m3Mv/Cv23ewq1StEc/E/nViiDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p4ZKT4iATA0iVUvXIi8jVLkS47dKuW+SYdwdmRDpyDquh/miRDievtWtqLGuSlHbsnaGym5/qPJQ6odC+AYhY6ab4HEM2rx7FU+luvIUnK33NGLB23KHYic+Oo1U/c0T2T3N33NGCz/cnN+uHAHYmnyNblU+BIgm2Qo2UG/ppt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlwNVI9s; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlwNVI9s"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso1625855e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280994; x=1790885794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNbMPD2l6k45HjCSlVyW5ug/N5eQ+jTGtlCh88p1xFw=;
        b=XlwNVI9s7EmE4gckRMx5bxIFyosDxNJnGHh2iUzG2PJt6/akXL5vEeZ66jDVUxv+CA
         NKWn95N0HLI+/wJXjQa3iHK/tT5Iqu9pMDZVlp5oyO/WrScEeTcVQadHngmDzTendDn1
         dp4d72Z7mst2O1f+sA905g2SmSh2KJGTBto+IRfW6nePANfqegq4XwGB44DHzpwwAwCM
         fUmAeiAzFoeiOci82BiIxpVsxZp9aoA0CqPv2Mttqck36fD+/yomOs99sk1K0rU/d9x4
         chV6akEwQrYp66MMbCanTNrvE027JEYbx2Q/bW6Mvb1+3sNaXCwOtn/1ErF7yokC+KQL
         GYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280994; x=1790885794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wNbMPD2l6k45HjCSlVyW5ug/N5eQ+jTGtlCh88p1xFw=;
        b=2piIPQV4hfuMQyzbGYPP+OECDoI13RNyDnVTFBjHEjX1PMP99jUvnltCgc5HSSnYBe
         311jvjJO7iaZPE1J5rU/GMGh79KWQFZBpxvCba2DkDmtCEjW2mD+zQB6FcXrVgYWlmhC
         EYgnATTnbHdz/imyJnwOHaq9pyxJrMRVmfICyAEf1pogcWoWbAWmUHR3obaSiezgwE7/
         cXLwbnZ8K5Gwy/C1YQEagLt5YY7aJjpvTnbX1/WP4WSQcFgkmihH5FcqPIlcklkjF7rs
         s5L3XfXb2I82ycEHkOr/c5rOCYC6nPqnVDMhEFCjfY0Ip6yHSkiSW/WdQFP/5n2FcioF
         KdnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDvKkq1eBDmyIV/Ly6dawUGvSyWq5HFbqzjkHgf954ROuQk5t3vv/3sXPBzhBGMiL5Rwp9c7PWZews4sk=@vger.kernel.org
X-Gm-Message-State: AFuF++m5VC5WUAiI9zCB1633ZQhQiXw3VXkoMSR7/OjlOUH4fmD9WsCp
	PxgZDh8roao0ack7nqGHK6MBjqmprhFcc9uqA7HahdxqciIzpiPi+HRbK5o7WnlT
X-Gm-Gg: AYBFou2WgciuLWy5oL9kp2w9gzNwCPR7XruwUmeoVSmC3Gr9Um4V4nJVcaNsIiwtaO+
	2vH36kibyf1/CjryYWE2n9Jkn9xkpnUs/bWamPcPc4RXgwdN5I0rfxxizek3vSgxjrEHWGJkGm+
	Rz3r01lnDa/fho2UrnG8fNM44s5Ulj+yBEeZtDdNSQiXGAgZG7p203tFj8L85b/3ls1dCoOYnQn
	HQ0UV/QxGBsjHRNctCKBokdzOb6q49b9I6GmlwV07H5j6Cf55YsAkTWU6KDxK0i9axj+f5Nahmz
	PKG8JgR9Rc7lRZqhtp5nVqdVPQ0Xe0H7ZNYIdn3q/vBKz7Fak02SsgnDd1SI9BtRYnKWO+LILBx
	AnZN+ITdLY4BWLV9TZKWEhqN5/MtCoXdicQLqJHW0BVOSMwKexM4c8k+QQHQlPS2ubXcQ7TC0Qc
	PSnSHjQpbGWGcHqM+rxs9pCcYbs7tfFxaXRkNjwoX2Mj8EDLwIS/TUECk9WHTYFcab2iXGNUMuG
	q81me8UVRl1OsBAFRYqLDKaCd0Dw6OTHm9hrwKioXQLrpju8U7Jt76lCBjv0f75K1lepeN4MEUT
	PTcjOfYznYlNOF49y4LCcf4AP7W7iKfs3i6KMrG4h/WbkxU/+h0OjSFg7aRNxzGOmxjz2VbgbV9
	LU1etAJGO950SCrXS33XawkE=
X-Received: by 2002:a05:600c:3e07:b0:49f:d6f0:6f24 with SMTP id 5b1f17b1804b1-49fe66cab70mr70945335e9.2.1790280993575;
        Thu, 24 Sep 2026 13:16:33 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-adbf-6901-3138-76b5-e9f7-b9cf.310.pool.telefonica.de. [2a02:3100:adbf:6901:3138:76b5:e9f7:b9cf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm144818795e9.12.2026.09.24.13.16.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Sep 2026 13:16:33 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bijan Tabatabai <bijan311@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mm/damon/core: preserve the quota passed to damon_new_scheme()
Date: Thu, 24 Sep 2026 22:16:13 +0200
Message-Id: <20260924201615.4478-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260924201615.4478-1-kmehltretter@gmail.com>
References: <20260924201615.4478-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_commit_ctx() first commits the running context's parameters to a
temporary context for validating proposed updates. When
damon_commit_schemes() creates the temporary schemes, it passes the
running scheme's quota as the quota parameter of damon_new_scheme().

damon_new_scheme() calls damos_quota_init() on that quota before copying
it to the new scheme. This clears the running scheme's effective quota,
feedback input and charging state. Even an update rejected with -EINVAL
loses the running quota state.

For a size quota, this discards the bytes already charged and allows the
scheme to use a fresh quota before the reset interval has elapsed. For a
goal-driven quota, the consist tuner loses its accumulated input and
restarts from its minimum input. A time quota loses its throughput
estimate and falls back to the initial estimate.

Commit 60bd24f272d0 ("mm/damon/sysfs: test commit input against realistic
destination") introduced this problem in v6.19 when sysfs validation
began committing the running context's parameters to a temporary context.
Commit b90408ef1163 ("mm/damon/core: safely validate src on
damon_commit_ctx()") later moved that validation into the core API,
exposing other callers including DAMON_RECLAIM and DAMON_LRU_SORT.

Sashiko reported the same side effect [1] on the RFC of the core API
change.

Copy the quota to the new scheme first, then initialize that copy. Make
damos_quota_init() return void, since its return value is no longer needed.

Fixes: 60bd24f272d0 ("mm/damon/sysfs: test commit input against realistic destination")
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/20260702212143.0CB6D1F00A3D@smtp.kernel.org/ [1]
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
 - Explain the running-context validation before the constructor side effect.
 - Clarify the quota parameter and use "commit" for the context operation.
 - Point Fixes to commit 60bd24f272d0 ("mm/damon/sysfs: test commit input
   against realistic destination") and drop the stable version comment.
 - Rebase onto mm-new. No changes to the fix logic.

 mm/damon/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 4687b909d42c9..f76333f26de22 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -734,7 +734,7 @@ static bool damos_quota_goals_empty(struct damos_quota *q)
 }
 
 /* initialize fields of @quota that normally API users wouldn't set */
-static struct damos_quota *damos_quota_init(struct damos_quota *quota)
+static void damos_quota_init(struct damos_quota *quota)
 {
 	quota->esz = 0;
 	quota->total_charged_sz = 0;
@@ -744,7 +744,6 @@ static struct damos_quota *damos_quota_init(struct damos_quota *quota)
 	quota->charge_target_from = NULL;
 	quota->charge_addr_from = 0;
 	quota->esz_bp = 0;
-	return quota;
 }
 
 struct damos *damon_new_scheme(struct damos_access_pattern *pattern,
@@ -776,7 +775,8 @@ struct damos *damon_new_scheme(struct damos_access_pattern *pattern,
 	scheme->last_applied = NULL;
 	INIT_LIST_HEAD(&scheme->list);
 
-	scheme->quota = *(damos_quota_init(quota));
+	scheme->quota = *quota;
+	damos_quota_init(&scheme->quota);
 	/* quota.goals should be separately set by caller */
 	INIT_LIST_HEAD(&scheme->quota.goals);
 
-- 
2.53.0

