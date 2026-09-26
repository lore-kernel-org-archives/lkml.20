Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFF5388E6B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790394577; cv=none; b=T9ZCY6Amv8uMJG65G9U37J1NE/ePr6mZSXvFYpwDimdFJh13HaRGlo8UBQjHIR8t0AAX0gytak78thxNNbnyLpbn25XsVv2Gve0C5H/BbpkcFt+8ZKnPzzqHoFnxPWQjK+v0BQHRuUw/cJ66yUKLrAHjnATKBHtPanpW7DLo+jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790394577; c=relaxed/simple;
	bh=4YVUr/SAhTBwjT0Go/F6m/FF9CaDGjuXGtYk+bGqmZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Be3mL/um4MryVPbmiscLTaY37uHktlFehWiYJbmSK4zu0mizgqhCFHHM3fPwmRY3PaZtnsHDggNV2/g/5DrGzVlYrySSXls8YIjeNT5I4vK+pa7dyV9MxBIUcDcG+MWbdDS7QbhqUO30pptQ3xhSoiDOnadFSheftp1k9GVl5j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFhDRQYM; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFhDRQYM"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so14364325e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790394573; x=1790999373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5exqyQhzafqyOFiRdxT6ffSBUlENs1lok/PR/m34+0M=;
        b=iFhDRQYMxHPXVYysuKqZmASu4GbBRpGnivIUJsSu2a5yDZ5qclApZQlpqo1KjMei7C
         lUE4r/w27MieIcfwJuNg3LS6/kl8XV85C3lphXODQPp2/xykOZrOCxoHdQl+t1aStbDs
         vqI2TjwU2aXBeNAPytTDfPqh3AnAAlfAj9b2QJ90ZFuyLYleo+TVik9G5M65EvH+CLq5
         IVmd/ZufR34laQKhp8wXDY+naCj/7YzPVKnzh4bnF10ZZaWxDcSBbhM9MWiS4EMH+7/k
         IuUG6S82nmaQoJHKqIH+QwKsHgOLGFSO9Y6V8qVj2PixEosa4X7uuiwZUAQtHClSXFZ0
         dL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790394573; x=1790999373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5exqyQhzafqyOFiRdxT6ffSBUlENs1lok/PR/m34+0M=;
        b=ZVVFyvQ9AgJYFlYJqRsQPcmEAS9yLixMpPD06w7f1V0DXzh4uJD9EwfIcn5fxDHZkc
         R7RA+uQ5iD/dwBnKA9NEGu2ff+NgPiPUxidEHrxEupeHDybCQ0vxcsljnfrO5C5wKkLq
         P3npnQLQgqF+4aGvT1L9cAA4cns2tCWj/984z3Z2t64uevq8TyACDVpP4S6xjbwCHbY8
         ykC1wOcFTcNw5uAJGOw3YUfq6lvj1qWxftueW4b9M7OJdin/PwGIyJO74XocVyYt0w6P
         xkFU6YH5wSpH6F61s1BGBvDBRfLsoI35OJlKvy1ftUa8n2cc23NoS8eP86P+8AjqFOUe
         /N/A==
X-Forwarded-Encrypted: i=1; AKwUvByf+IXHBLYPpX7GU85ZLyA0DpxoaVhemSmANaOc+0amqsKJD8Te3WrBFEDlOgDWkFa28LOPlizCq4sYMzY=@vger.kernel.org
X-Gm-Message-State: AFuF++l5AuC1/ivVC6UvgBnz/J/AlMfILTTajSKy8cYN1K+v/0H/SWdb
	OyhtlnbmebOuDtkjbaS8yPlfFm00cRXP1ZDgtEtbxtcRsZvr69IDo/JN
X-Gm-Gg: AYBFou0ZS29GeFp96RUwr9kOBQvHCPxxQ7a0DcgiPVx5sxeyVaAPRvN5l7zI6LwnOIj
	8Pw+PqvnukbosX+TxbJ1p7CQsx9CiRMsiPmU3O+4WsobaS8xs3lx5Blg4Dq8Z72Rrek9yuuG2ZT
	1A70ncuy+zWBB1Q8uUWMFVFDaDrN7iCy+RaXqoQaN6+R7YT+29cZ+iw3eWqyBf2GK5LEhdOpHrr
	Wl4oFDKaiBn7+VF7a+AlggburHlHITjQJvPLp8RansVApR+8CtBWjRrNp7GucyoDcMbrDxp1Vc6
	dnAqJ1xLZZBsjGNZjroulacCbQUstxy9NnJiuy+GvUXU9XUx3iGFCZNtYbM0Znq+nrVFgQXIXOE
	2t9AgALT/fT/dRzEvKF7sy8AL+6czE2gC+otFdB3aJe8H/gCGYLdCIy6mS4vnB92mORzq0NC0Yf
	JIPGy1ci5lkHy/n1O/y/aQLUHcAB0U25+vWDYLTrhe+ArxVkhVoRKRufR3T2dVW0MlhbBLTY1HO
	PGr7KsGtQz4Xa4ZQYBUI7yWWJ5CLN/Xr0BjGmPd1/DP
X-Received: by 2002:a05:600c:8b4c:b0:49e:8184:f63b with SMTP id 5b1f17b1804b1-49fe66f3a68mr132693255e9.16.1790394572642;
        Fri, 25 Sep 2026 20:49:32 -0700 (PDT)
Received: from localhost.suse.org ([37.109.167.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm116657205e9.13.2026.09.25.20.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:49:32 -0700 (PDT)
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
Subject: [PATCH 2/2] selftests: cgroup: Report memory.current shortfall in alloc_pagecache_50M_check
Date: Sat, 26 Sep 2026 05:49:21 +0200
Message-ID: <20260926034923.31718-3-sebastian.chlad@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260926034923.31718-1-sebastian.chlad@suse.com>
References: <20260926034923.31718-1-sebastian.chlad@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

alloc_pagecache_50M_check() fails silently when memory.current is below
the 50M that was just written to the page cache. This is the check that
can trip when the page cache of the test cgroup is reclaimed under
global memory pressure, so print the observed value.

test_memcg_high() runs the same helper with memory.high set to 30M and
expects it to fail, so reporting there would print a misleading failure
message on every passing run. Split the body into
__alloc_pagecache_50M_check() with a report flag, and give
test_memcg_high() a quiet variant.

Assisted-by: claude-opus-5-5
Signed-off-by: Sebastian Chlad <sebastian.chlad@suse.com>
---
 .../selftests/cgroup/test_memcontrol.c        | 27 ++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index 14c0bb608175..d3b9295aad75 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -222,7 +222,7 @@ static int alloc_anon_50M_check(const char *cgroup, void *arg)
 	return ret;
 }
 
-static int alloc_pagecache_50M_check(const char *cgroup, void *arg)
+static int __alloc_pagecache_50M_check(const char *cgroup, bool report)
 {
 	size_t size = MB(50);
 	int ret = -1;
@@ -237,14 +237,19 @@ static int alloc_pagecache_50M_check(const char *cgroup, void *arg)
 		goto cleanup;
 
 	current = cg_read_long(cgroup, "memory.current");
-	if (current < size)
+	if (current < size) {
+		if (report)
+			fprintf(stderr, "memory.current %ld < expected %zu\n",
+				current, size);
 		goto cleanup;
+	}
 
 	file = cg_read_key_long(cgroup, "memory.stat", "file ");
 	if (file < 0)
 		goto cleanup;
 
-	if (!values_close_report(file, current, 10))
+	if (report ? !values_close_report(file, current, 10) :
+		     !values_close(file, current, 10))
 		goto cleanup;
 
 	ret = 0;
@@ -254,6 +259,20 @@ static int alloc_pagecache_50M_check(const char *cgroup, void *arg)
 	return ret;
 }
 
+static int alloc_pagecache_50M_check(const char *cgroup, void *arg)
+{
+	return __alloc_pagecache_50M_check(cgroup, true);
+}
+
+/*
+ * Same as alloc_pagecache_50M_check(), but silent on failure, for callers
+ * that expect the allocation to be held below 50M.
+ */
+static int alloc_pagecache_50M_check_quiet(const char *cgroup, void *arg)
+{
+	return __alloc_pagecache_50M_check(cgroup, false);
+}
+
 /*
  * This test create a memory cgroup, allocates
  * some anonymous memory and some pagecache
@@ -735,7 +754,7 @@ static int test_memcg_high(const char *root)
 	if (cg_run(memcg, alloc_anon, (void *)MB(31)))
 		goto cleanup;
 
-	if (!cg_run(memcg, alloc_pagecache_50M_check, NULL))
+	if (!cg_run(memcg, alloc_pagecache_50M_check_quiet, NULL))
 		goto cleanup;
 
 	if (cg_run(memcg, alloc_pagecache_max_30M, NULL))
-- 
2.51.0

