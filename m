Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88C237BE75
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790401922; cv=none; b=TToX1/F3Lolp8Huy8uBgMRKPtsxL3IQtpoVk4X5b1ZnuBjcuF1jB+n6TGhtar+OnXe929W4btYbZ5zcY9eeSRZ5/DlrAWxEqLRshc79urab3lnKcVNvF+9xXduwv7a/h/4wSAsdSg8TLzOeYAckyfOR4T9qSwpD6KOrFE5bXhZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790401922; c=relaxed/simple;
	bh=tWXmnir3aF9HZ+kf5/3hY0M3VXhh0dKm46bCuC6qUT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPx0rME7pxEUY9CdDkBzV8CaKj2KP408YreYvpvYp/88n0S65AAf3/4MvcDwLP6jmkYsj63FtKcQ5/GCpOsb6urqJHck8jiGNsSfrdxU/BbOEEVPuKZgDZ6H7tmdx4yyS8f9tVXd1CNtt9aYl2YHe67kYSMHHNrnfIA+eRGlauE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XI2QF1mG; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XI2QF1mG"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-488885c3844so96979f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790401919; x=1791006719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi4dRtWZ8QVTscHUglSUHWaqYAQ6yrmnxvkOKTaKUMQ=;
        b=XI2QF1mGG/t18OHANjvdz6ONEx5kDBGyV6zb+HVqRD/DHFcCJwPV0yjI/y0M0IN/fY
         5WbGFc42Mv36r4GC0NjbUsHA/dSh/cKca5v8Onz9snaQV4cf71PXiVcdAK4+4RNJQEoL
         NrfquA16e9i+4LSdFWTXfeaghdSqe+0nIW7+PfZKwBsoXHxnZDdM3uEmkvRyXysfYI4Z
         2/eayRu5U3KzzhCY4EQb/yZwn7os+3os9hdvKXVo0jpT9DNa2+YAopoO1xsFZ17pV5DO
         k5utq6CpReUlEk4EUyAT4JqpWe4W/WyGy7orekQfBKw6rLvHBr3SRanM8IYx8CLmjTwq
         CH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790401919; x=1791006719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yi4dRtWZ8QVTscHUglSUHWaqYAQ6yrmnxvkOKTaKUMQ=;
        b=0GWp+linDrizOVWmO3eN7ICMDqPUaEu61EV7c8XQbF0DzjQMPhuV8zot3LpIqS6JrE
         f1VRtHavR3VioTCzC0PoAXSFkj5eknlAntvPvRj7fpF1ZMGzU52qz1bsIQ88ZrA7HQB/
         Yq/9CFcR5DzmJnsOaS3xk6yplQGbCSvaOWw987OEALCts86QgD5LS+u3DA9LPAEY7s8/
         /di3ZkM9EUCptFxkfNvoYQVCoalxCoXEZzRTRXeXWyPMLj1HbacMObu4kk0N6BX7+nfL
         gGiTZNf1Ou97tQnzk2Q7o+9kEjdLTFY6FC8aTNp2oXernr4ZgUSRhWjrHK76pjGLeaoB
         dmHw==
X-Forwarded-Encrypted: i=1; AKwUvBygEu06dsz6icmZaz8Qvgwah1sqnQxspbCkTBSDlYEHBuu8mRegdYiM8o0HH5uc+EgaCkDzuKYuPQWwvc0=@vger.kernel.org
X-Gm-Message-State: AFuF++kX/O3nIyI5QJEoXkO3BHvruB0/q0cHTqCP/kJdlBkfuY/XiQny
	ptnK+YsQiBLtok4lgdBqjMl+0vcLf5Xc1oEykv+CltvJsi5sQDJvQHiS
X-Gm-Gg: AYBFou1KzmlWKe0Mylpp6jjUJnl/E4XIp7MNSQepGkG6lkB3M4sF8q2qPEpMXk+LFTy
	/QpZhBHNudBdtaxb2vieRyl3UtfndPJwR1YqLjNKeSuN28BExLU/ocLtzaBSTqp0V91AEq0Xta1
	lk2y2FnNvM0hhOWKQ4AvIHEmGYS6Cfj6cem+esiJhEVvCV12b2yoPaqOu5GEWgjF825qEH5I2rg
	WHFwvmgX8aBJ+UmBgnM9bE9T0HSisF3ttt44xixZARysvtHqNImFq+cWcgXJbOVEoic8knKose/
	z1KcMZL8M3JL0rMjbnYIdEA8FmPNaDqzDKH1frcFDcg2KL+TtQDnhGLxLoeXglzSBPnsSYqCMdC
	h/N1Hd56GkGgRrBflvsiRWyTX8LZcoXtK1c3fiErdRG0OHgFtelnDzQ5xNVzbIBk7APZyXCOybQ
	1NV358ayu0pIzl9sJMBcRyAj/0O9CxwLn3mKcxfVSqeE6wBOOzGMfXhqwuxoob43NhiyBoh83cB
	Xf+Mf9jxlLm87DpT6t8aDSjwZk5BLiGxg6B/9nOLEG3
X-Received: by 2002:a05:6000:4b19:b0:488:8882:d504 with SMTP id ffacd0b85a97d-4888882d749mr1189407f8f.10.1790401919190;
        Fri, 25 Sep 2026 22:51:59 -0700 (PDT)
Received: from localhost.suse.org ([37.109.167.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm12317560f8f.1.2026.09.25.22.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 22:51:59 -0700 (PDT)
From: Sebastian Chlad <sebastianchlad@gmail.com>
X-Google-Original-From: Sebastian Chlad <sebastian.chlad@suse.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Sebastian Chlad <sebastian.chlad@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] selftests: cgroup: Use values_close_report in test_memcontrol
Date: Sat, 26 Sep 2026 07:51:47 +0200
Message-ID: <20260926055152.1684-2-sebastian.chlad@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260926055152.1684-1-sebastian.chlad@suse.com>
References: <20260926055152.1684-1-sebastian.chlad@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the terminal tolerance checks in test_memcontrol to
values_close_report() so that a failure prints the observed and
expected values instead of failing silently. Also report the
"memory.current < size" check in alloc_anon_50M_check().

values_close() is kept where it is used as a loop or retry condition
(waiting for usage to settle in test_memcg_protection(), reclaim_until(),
the reclaim retry loop and the socket test), since a mismatch there is
expected and reporting it would print spurious failures.

Assisted-by: claude-opus-5-5
Signed-off-by: Sebastian Chlad <sebastian.chlad@suse.com>
---
 .../selftests/cgroup/test_memcontrol.c        | 25 +++++++++++--------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index 0ed82347044e..8882c7faeb32 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -200,17 +200,20 @@ static int alloc_anon_50M_check(const char *cgroup, void *arg)
 		return -1;
 
 	current = cg_read_long(cgroup, "memory.current");
-	if (current < size)
+	if (current < size) {
+		fprintf(stderr, "memory.current %ld < expected %zu\n",
+			current, size);
 		goto cleanup;
+	}
 
-	if (!values_close(size, current, 3))
+	if (!values_close_report(current, size, 3))
 		goto cleanup;
 
 	anon = cg_read_key_long(cgroup, "memory.stat", "anon ");
 	if (anon < 0)
 		goto cleanup;
 
-	if (!values_close(anon, current, 3))
+	if (!values_close_report(anon, current, 3))
 		goto cleanup;
 
 	ret = 0;
@@ -241,7 +244,7 @@ static int alloc_pagecache_50M_check(const char *cgroup, void *arg)
 	if (file < 0)
 		goto cleanup;
 
-	if (!values_close(file, current, 10))
+	if (!values_close_report(file, current, 10))
 		goto cleanup;
 
 	ret = 0;
@@ -578,16 +581,16 @@ static int test_memcg_protection(const char *root, bool min)
 	if (cg_run(parent[2], alloc_anon, (void *)MB(148)))
 		goto cleanup;
 
-	if (!values_close(cg_read_long(parent[1], "memory.current"), MB(50), 3))
+	if (!values_close_report(cg_read_long(parent[1], "memory.current"), MB(50), 3))
 		goto cleanup;
 
 	for (i = 0; i < ARRAY_SIZE(children); i++)
 		c[i] = cg_read_long(children[i], "memory.current");
 
-	if (!values_close(c[0], MB(29), 15))
+	if (!values_close_report(c[0], MB(29), 15))
 		goto cleanup;
 
-	if (!values_close(c[1], MB(21), 20))
+	if (!values_close_report(c[1], MB(21), 20))
 		goto cleanup;
 
 	if (c[3] != 0)
@@ -603,7 +606,7 @@ static int test_memcg_protection(const char *root, bool min)
 	}
 
 	current = min ? MB(50) : MB(30);
-	if (!values_close(cg_read_long(parent[1], "memory.current"), current, 3))
+	if (!values_close_report(cg_read_long(parent[1], "memory.current"), current, 3))
 		goto cleanup;
 
 	if (!reclaim_until(children[0], MB(10)))
@@ -691,7 +694,7 @@ static int alloc_pagecache_max_30M(const char *cgroup, void *arg)
 		goto cleanup;
 
 	current = cg_read_long(cgroup, "memory.current");
-	if (!values_close(current, MB(30), 5))
+	if (!values_close_report(current, MB(30), 5))
 		goto cleanup;
 
 	ret = 0;
@@ -1006,12 +1009,12 @@ static int alloc_anon_50M_check_swap(const char *cgroup, void *arg)
 		return -1;
 
 	mem_current = cg_read_long(cgroup, "memory.current");
-	if (!mem_current || !values_close(mem_current, mem_max, 3))
+	if (!mem_current || !values_close_report(mem_current, mem_max, 3))
 		goto cleanup;
 
 	swap_current = cg_read_long(cgroup, "memory.swap.current");
 	if (!swap_current ||
-	    !values_close(mem_current + swap_current, size, 3))
+	    !values_close_report(mem_current + swap_current, size, 3))
 		goto cleanup;
 
 	ret = 0;
-- 
2.51.0

