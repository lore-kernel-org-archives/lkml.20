Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195AB42C512
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279203; cv=none; b=Lv+Z40Plk16I7++ad8sgrxMv50kiQfuWVY6lnEbUNzf60eYRM5KsHrTjt9uiCLOsB3qFB+Zmkro9onBPiFxYXs7Q/t/ujDNoYb+bJh5oZuewJbxgBJZYE7FoUgALKsDeUDbcSFuf8rPTO63VVFiHiBiiQTem1ySf9VrH0qfQzJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279203; c=relaxed/simple;
	bh=z2KYWNyqrFo1sCW+OWkoJC7vv3DQjQh5BilYS0IFovQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m8G5RKW/btu5akoGRArmpnWHuA/I+eoXxn3urlID7TfFLYo9dQF9lzih2A5W9mHAyHnv4NcRlQwQBp7IchnPZAweW3F7mHVi3yycFo+blX4PTzpfAz1iv7eZKvpHmM/cv7t9Mn1C6u2x7jm+4rDzociKwCGd1nIAUdA/uAQjc0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ea8KNWJj; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ea8KNWJj"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-46add2afca9so23103fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788279198; x=1788883998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UrvqQXAc4Rj6TaVLaR+TE3DlGs7BEo7vSNB4Ui+eyI0=;
        b=ea8KNWJjEKQpDkI7Pcx3WpY/D8T9MRNttdo9WLjjKjP7Fw9QzMr3VFTCJ/li+2i7e4
         Sz2YtjtC272BYa7yNXLKA+pPu0d1Y5UxyxJ0VnpYE1sSrfGdELqhe0kDxNpHqz0zHKze
         VCsB0N6uVYpgtfmnUsfg8DTJgMxMGnq/tzGKzpsgnWy5ZwO6DxCxTcepTIeATpciqjvw
         qSa3Gt0jNxvmp/YfHTEptU214bytj0UGvbXIPZx7FqOkvNGCzr2YQAy9q+7hUNwRO6RJ
         Gedf5ih8/O5+oyYvrahIzxH4wxEq7mkr8WkLTOhslj9tMJuN10IJdkvL2K02fUZdnolR
         Mc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788279198; x=1788883998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrvqQXAc4Rj6TaVLaR+TE3DlGs7BEo7vSNB4Ui+eyI0=;
        b=oG2oqw5FLR+juGNDbroi+K/6rBwj6qNOw8Qx8PLiI1bcPjSZDb3N+sQ1uLGNfa3DD8
         SazRyqgerfR9K8yxX020QXP7Hj4Ew6i90CjRcYJMby1WZFgoHyuqpWjJiLM7t/bRSDVC
         MzXvpU5vuIImX12Qq99uMLIo1EYg3jRQLqR1W37rXUKJU3Vn82WLxf+HO2APFc6R44S8
         V3J3dqCbPP84OSOXVZ8EzSMgmXvpRMaV5IzgAC3e3VtyhuoXjcVV/d4lkLpuoMVDjq3R
         9GRE1GZ66j6oFWWQmzy/syoBmokRTKBzD7Q4TWSFzIvSPBba3qSs7If51G6FoIjoyITE
         nPuw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5G6/rt3Tk69nXRXSwoPzcf8QW5zJ9P3xAV1Ibcyugb9SksCiOIKexDAMT7KFbbwOm1GxHlpM3CHZBPhI=@vger.kernel.org
X-Gm-Message-State: AFuF++mVFB25XODOKIi2lywLxNDz5BENLzRNdw7vSol+zhpIQeYQNcp6
	HXzGkUyzyfqSf/+cNBR/tF8RzCY//HDAQH35M/+pRmesxEsDiE0aLt1D
X-Gm-Gg: AR+sD10tXcF91sRWnrcfufi6p0R7nSubRKgYoft5FLnWJ3/Gzo3kdOdlasPpOdq99Ye
	KUgRxXlvcmFBVDAhmua+BepO27fuwlLhNng2ujMiCE8yRcvBu6kdX7+Lu4b9bgtK5i6z5k9+jHq
	WZNSP8bQB01lxWUT1xwlggDBCtk7iv8y2iNpssVC1dIMkQURl4EOP6fDhzvmcQGlS7a//mnXXU4
	cmYZSTiTmtQkK7ZTDOSRHAWSQbmzVxel69UqPAA9XlzvxfoJiTr7tCYcGxdKlI5rQWa3d6H9xwu
	aKgWKzuY3izZlCTeQbdT+dvVgIP3+IHZyfJyCiCLlor+3a3h7OF3Ija8+ZYu26wlL6cpofYm3u+
	Z5fCJ1L3xpa+fYdfyCYx2bdYsf3xrtp0bQ8S1vZQqBheVeQQ52NhSroxF9bwRoizzR373xtEawQ
	trgtmtvvDYhC+ZgYCUwjaM9vjYUqIvf8aLOOGGKiAFHhI+9oVhnf3xgvf8Yr+wQMOP7TGvgzE+N
	f7U1yWpN37RMQLk999OordAyHUA//g=
X-Received: by 2002:a05:6808:508c:b0:4b2:8da1:3be4 with SMTP id 5614622812f47-4b398124cc7mr41327362b6e.9.1788279198361;
        Tue, 01 Sep 2026 09:13:18 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:28::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b3a19949c1sm11563412b6e.10.2026.09.01.09.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:13:18 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>
Cc: Chengming Zhou <chengming.zhou@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	cgroup@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] selftests/cgroup: Skip test_no_invasive_cgroup_shrink if zswap shrinker is enabled
Date: Tue,  1 Sep 2026 09:13:16 -0700
Message-ID: <20260901161317.3468233-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test_no_invasive_cgroup_shrink selftest checks that when a cgroup
has zswapped out more pages than memory.zswap.max, that it does not
trigger writeback for other cgroups. To do this, it compares the
writeback count in a control cgroup and makes sure that it is 0,
and compares it to the writeback count in a aggressor cgroup who
does expect to see writeback.

When the zswap shrinker is enabled however, there is an additional path
to zswap writeback, which can happen independently of reaching the
memory.zswap.max limit.

The writeback counter cannot distinguish between invasive noisy-neighbor
driven writeback and the zswap shrinker work, so the test becomes
invalid.

Skip test_no_invasive_cgroup_shrink if the zswap shrinker is enabled.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 tools/testing/selftests/cgroup/test_zswap.c | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 9c5bd503c3f73..6f9b5c631d030 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -20,6 +20,8 @@ static int page_size;
 
 #define PATH_ZSWAP "/sys/module/zswap"
 #define PATH_ZSWAP_ENABLED "/sys/module/zswap/parameters/enabled"
+#define PATH_ZSWAP_SHRINKER_ENABLED \
+	"/sys/module/zswap/parameters/shrinker_enabled"
 #define PATH_ZSWAP_STORED_PAGES "/sys/kernel/debug/zswap/stored_pages"
 
 static int read_int(const char *path, size_t *value)
@@ -446,6 +448,16 @@ static int test_zswap_writeback_disabled(const char *root)
 	return test_zswap_writeback(root, false);
 }
 
+static bool zswap_shrinker_enabled(void)
+{
+	char value[2];
+
+	if (read_text(PATH_ZSWAP_SHRINKER_ENABLED, value, sizeof(value)) <= 0)
+		return false;
+
+	return value[0] == 'Y';
+}
+
 /*
  * When trying to store a memcg page in zswap, if the memcg hits its memory
  * limit in zswap, writeback should affect only the zswapped pages of that
@@ -461,6 +473,16 @@ static int test_no_invasive_cgroup_shrink(const char *root)
 	char *zw_allocation = NULL, *wb_allocation = NULL;
 	char *zw_group = NULL, *wb_group = NULL;
 
+	/*
+	 * The shrinker can write back zw_group's pages despite not hitting the
+	 * zswap limit. Skip the test if the zswap shrinker is enabled since the
+	 * test cannot distinguish invasive writeback from shrinker work.
+	 */
+	if (zswap_shrinker_enabled()) {
+		ksft_print_msg("zswap shrinker is enabled\n");
+		return KSFT_SKIP;
+	}
+
 	snprintf(zswap_max_buf, sizeof(zswap_max_buf), "%d", page_size);
 	snprintf(mem_max_buf, sizeof(mem_max_buf), "%zu", allocation_size / 2);
 
-- 
2.53.0-Meta

