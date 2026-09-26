Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED7938A72C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790394574; cv=none; b=kXYBgOFnWENb+xHD8q81n2pM3ZPiFm4IcmyfWNSqwrtq9O/RxSEXYdHC6KLei1ilBYv318LXCRkOu1BD0EeCbfORb7DlI/UAsl02EF1YPVpAiVOcAkrRI/PKgtzKoDq540eamFQN1KxlUOvLE+0pnBZ9GCE0spccZ+wAYF6TbsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790394574; c=relaxed/simple;
	bh=dRjSOX0gFUZyLW+TAn4WnqX6VewHhBxbXEOKe6zZPL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/7t/I6AjgJBRZN8SF3weOj9K7yjlyngYGIvlZapsZrKrEoLvlsrwsO+zDdMFMvKc9hMmc9wVzLAE7X4Dt0lSF1Ocnllivsp1vfWbBuosSq3BxMuPfDaBs1Aktf0vkC5S/LIQB0EWzHuPZDlJTXDyibOcl3Ag/AiKvhuE/MdPXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNmu865J; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNmu865J"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso851486f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790394570; x=1790999370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qI8gzoG27aGncFin1uBlOK6ZBd9hIaPKhApyur6iKoc=;
        b=VNmu865Jc9bicoYYCJ6n474ne1xuWoLVgAo6TB41HvyczCleZW0ISjeE49SMGI3DrE
         3rnyZ+gG2bsOukKHkBwJ4pAMFRFEN3WOmlANKUqPC08T5TaDYJOzHvwBCPH/f+8dVvvV
         e4GR38dOW8GkvOk8QtYKEx06Z2inSoYT1maDf82gBGlQmTj36zTzCHp0VUif0tNIEx6O
         PAmTJ9av4EXnkeJIPpL48yvzhOSYs9Y88iX0wTBp6wcHBxoezHTCN0vS2NSOsGT3qa/C
         YwveaB+1pLk7YOBjXErAli6YVLE8qcTYhWc6nCq0krWA9/gElf5605MF5dHp70GpA0NN
         ZCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790394570; x=1790999370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qI8gzoG27aGncFin1uBlOK6ZBd9hIaPKhApyur6iKoc=;
        b=H0XCDHYrfKpsCJf+tTRRHJBmx7UuKJ1KB65xXyZQfulMeM8JlUqq83deciw/DnZ6Vp
         vvdpo0OThF9Hl+KJAjv+xS9XUZPzgl9+TIavh4PJ+PxzdMfkVQSMuVgOoiEJxm+yH1Tz
         75kOPedXh9m6ZvbITK4D7L+BC+GU5evKhNgy/dztuA/bMhcVRER8ndzK0gJMVsf545OQ
         qIyTU4Gozd4dtEAgHNuZVnArR/ke+JHqQ/PSj8910HUb5a14143Hd1mldN+ZEkCooalH
         eAYRNQsqFsy/2gD7PkesmeDRzlMSdtO+c2zW2bIhYdSM8sUhHBdWG4cED8jB5gzRBLDU
         njTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnHCrjPm3ftXJDIXrC6MXUJJYjVnNtOMOCz9dkOulp3IX4gPR6Ojl/rjzLNt028Mk65wAmEtM+Nd59QT4=@vger.kernel.org
X-Gm-Message-State: AFuF++l2g7aESfYjrbPtD5aO566Eh135AFPCoxqOZJGR+qdq9o319UJn
	EKV/+9AKduyGlVO7HgfDWc4lh4hjHbTOjDdOtRtkXMfaqOgB58Z+CjAD
X-Gm-Gg: AYBFou2RqtHL1RKrmNcvSH7jlEhZ54UaNlOZEhNocfEooXUeS5KmFGJ99U+5oBGzV8f
	o5mTSK9xy55dGF/vIucKh4FeEuqZ0lsam0vezQ/bUV9qdmklzWAUG6vioLSqVhjfKNWYWmceGCE
	hV1jLqKHwgzT4xT8uSAbT8GnMz31InJUV+qMZ+s2oM5nMHQvmzLy2F30xjCo32CJG8ASpHvY1Bc
	UDl3cdGvQ3Z8bqdViYj+Q479JR1SWghPu3+XHngTbkSnegmiMKLEICvg4xHDmYp8zm4xbkNMPVa
	WYbJ8xGq7PWoM+LRBh5/GIFX95O4MzfZg0JmLI3mp8e1SHTqtjaATJ7E+LXqmSQr7GrZxBAMEF4
	Sza5w4D8SF5BOuxs2fvDItaBSt8qcE9NKNKUrX9Z3KgXwdoenqgiaE5RGxKODbqhR096xxdYr/o
	vFAL1F6uGYKpQkFqKxBjvuLwXgJp8l4JvpMkFzwDyj8jFadw41f/n+xxii+UoqgFVSPYadFieVm
	qJsalQHp8l/lxnJ362wcVOWXjGPhIuyLw8EEdmIZHRZ
X-Received: by 2002:a05:600c:3b1b:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49fe66c8a1emr145611675e9.2.1790394570582;
        Fri, 25 Sep 2026 20:49:30 -0700 (PDT)
Received: from localhost.suse.org ([37.109.167.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm116657205e9.13.2026.09.25.20.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:49:30 -0700 (PDT)
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
Subject: [PATCH 1/2] selftests: cgroup: Use values_close_report in test_memcontrol
Date: Sat, 26 Sep 2026 05:49:20 +0200
Message-ID: <20260926034923.31718-2-sebastian.chlad@suse.com>
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
index 0ed82347044e..14c0bb608175 100644
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
+	if (!values_close_report(size, current, 3))
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

