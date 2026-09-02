Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE283AFD1E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378336; cv=none; b=T3qXRp1BX2Y6lvcgor/OOq+YjEr2b7uhIactz6l6DiSjC/KH4MyGwaLe6+RR0iCvBa75c6nkdpe4LQZVs1L5TAnDAOb4GwQzrQAOgsidWbsQ1TfsbkqAAnrMORXN8SSLXnZCazm8YVcp/WGBi6rYZJ18naKz2Fn6NdGiZ0xhXMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378336; c=relaxed/simple;
	bh=PjcBpfhFVcXBPs8lEnyLBI90MdqrLbOVRiz3lk594Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YqZ7hAGcOUsSzadH3iPU/PIzGFZ+s9/dD9cGgVK7MddAgPO7v0FdgoxAl5odOu/58KLsJ4uOcIVxqJEIC7FAVhP/CQJtPgzO6oHcet2UbJrCt+Rt9Bl8ntgDPgj3egPQWaFgXMzA6TSnD9JekgTAImp9rw6TDhlIeK+5XFJAH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZaLPNQ/; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZaLPNQ/"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f4f3683fbcso300546a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788378322; x=1788983122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tGCfm32JlUmtMotIy6qoQBTUO4f6h2sqplyq+pgz4JI=;
        b=jZaLPNQ/IT83DvuK2GgDhtnOKpBKBSUJTBIU1PDg+UCQcXOiX2N1Q5H+0WnC5c145m
         H3Tx3qAOmfceAvr2uyND2QpTwe0THqpOly95jVsgpbgzemWc3Zss65FbFuzVfyuw9klH
         +A0mrWdrRS5PlNY1ipa4B+Ghr2Sk71jdlWgv4qxUaKKzPi4Aj87aYZQibb6jl4mTJRe+
         vPZtB/K5+LcsMgP2r2kliFIlOwRnQuU7DAg7DK6Jv+Z4OqMn5reNRJnjLuxykRH3/tYz
         LVzFvl+BfYHpe62U6LMstLwA+5l++r0nFWu+E5KlGas7ntFL6JOezy6DXTcVV6WaIXS3
         ULvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378322; x=1788983122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGCfm32JlUmtMotIy6qoQBTUO4f6h2sqplyq+pgz4JI=;
        b=V3ZaVLNaOemDWGaMts5PkSFoac0xzmxZ2s49SSeGV1DxL3blB2wIUPwVWnBsu4mJvf
         LaGPXh89mBaU9GENLYKXK78je0t7Gk7tEDHJfT52uRb0OR3GSBFEf8jfrlbAU6pWInjH
         I5Gcw2e2p7+vLtA+SbPZcTo/Oq9WfXO92/siNGtgH206aw2QsDGvON9Ply7U7XIgUYkh
         RhKWCD7UpcVTjdNQply0nceTQdj/BqcWpxGssrujjt7NWDPIc89fOU7TprNRcX7nChGB
         Ru/lczRXlALQCcpBpuEcpvJXk3yu6SNbxvoV0TuBBk6tVgan++lzGTzwwAEBZHHD5WZd
         mM1g==
X-Forwarded-Encrypted: i=1; AHgh+RoRNB8uMk2s5n9iXhhYd3fICAz2PhELAKsHikDnWdhXdKJgmXqqFioE3bEt9BivFY9TsFtaPX5KcXxOmkU=@vger.kernel.org
X-Gm-Message-State: AFuF++luUM8FCBCmHuP5VxyuV2u5ziHydtjQgFJqb/21WdEkDrGKII/b
	qJ01Rj8kWBiJ/C4pamRD+zAT60yHJWHWNSwa+Y1AVK9dsMTHR2gXdky8
X-Gm-Gg: AR+sD10DvfLa+2TfPdCaOHnmvHp/ll80m2UI0onaRjnwTkPwpAd0v2L/Lu5wbTaSbdj
	TY1KrisFw2StdRZsCTizJATeek0wS6NVWOz8TJ8acOnmuxZoFB9Clmg6sqNErUKJCoSDgIPL1xd
	LCyCwtGHoCmNFsoSNas8teH9nFrcZYlEs4CCmhE1WpiNAwL/Zbt8kPdSyukXvSIpnJ+Pz+9bAWq
	mVBq/NZtPoCGdKmGTMcbkkP2omEZNjICTQNOCUAv+1IQXBK0Y8yLmqSmL7fIjsVbog+IPLlIavF
	BBzox34NT0n7VuouR7woxhFCAAmuZ2W7vBV8kCJK/0IMmxu9JGYKAPrwcJncp6Nau0qaYaQQpVF
	MNXWFg2veEej/DRiTH6Z1BqiGSjyinDP/JbjMFaCSIgYasqSTUmHRL3hruaQq0HGG7UIUmlx/wK
	6sYrP9k7j6lhQ77vhKYE8DHZxRZ6AVRXPvlpWXiTH7rgakp2ZIGnEgjLbhOTebnztMPdtb3yS5Z
	Hj6UNxLsywL8/EU1ks=
X-Received: by 2002:a05:6830:488f:b0:7f4:3902:3a26 with SMTP id 46e09a7af769-7f899b8d376mr1482293a34.1.1788378322092;
        Wed, 02 Sep 2026 12:45:22 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:17::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f74f9ec644sm2999492a34.24.2026.09.02.12.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:45:21 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Krush Chavan <krushchavan@outlook.com>,
	"Chengming Zhou" <chengming.zhou@linux.dev>,
	"Tejun Heo" <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	"Shuah Khan" <shuah@kernel.org>,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v2] selftests/cgroup: account for zswap shrinker writeback
Date: Wed,  2 Sep 2026 12:45:20 -0700
Message-ID: <20260902194521.3652178-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test_no_invasive_cgroup_shrink selftest checks that when a cgroup
has zswapped out more memory than memory.zswap.max, it does not
trigger writeback for other cgroups. To do this, it compares the
writeback count in a control cgroup and makes sure that it is 0,
and then checks the writeback count in an aggressor cgroup who does
expect to see writeback.

However, when the zswap shrinker is enabled, the victim cgroup can see
legitimate writebacks not triggered by the aggressor. In some Meta CI
tests, we have seen this failure mode happen.

Instead of checking that the victim cgroup has 0 writeback, compare the
writeback values before and after the aggressor runs and check that
the victim cgroup did not perform any additional writeback. Note that
this can still lead to probabilistic failures if writebacks take longer
than 5 seconds, but this should fix the systematic failure case.

Fixes: b5ba474f3f51 ("zswap: shrink zswap pool based on memory pressure")
Reported-by: Krush Chavan <krushchavan@outlook.com>
Suggested-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
v1 --> v2:
- Instead of skipping the test when the zswap shrinker is enabled,
  compare the victim's writeback counts before and after the aggressor
  runs, as Nhat suggested.

 tools/testing/selftests/cgroup/test_zswap.c | 28 +++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 9c5bd503c3f73..1ac7790727757 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -20,6 +20,7 @@ static int page_size;
 
 #define PATH_ZSWAP "/sys/module/zswap"
 #define PATH_ZSWAP_ENABLED "/sys/module/zswap/parameters/enabled"
+#define PATH_ZSWAP_SHRINKER_ENABLED "/sys/module/zswap/parameters/shrinker_enabled"
 #define PATH_ZSWAP_STORED_PAGES "/sys/kernel/debug/zswap/stored_pages"
 
 static int read_int(const char *path, size_t *value)
@@ -446,6 +447,16 @@ static int test_zswap_writeback_disabled(const char *root)
 	return test_zswap_writeback(root, false);
 }
 
+static bool zswap_shrinker_enabled(void)
+{
+	char value[2];
+
+	if (read_text(PATH_ZSWAP_SHRINKER_ENABLED, value, sizeof(value)) <= 0)
+		return 0;
+
+	return value[0] == 'Y';
+}
+
 /*
  * When trying to store a memcg page in zswap, if the memcg hits its memory
  * limit in zswap, writeback should affect only the zswapped pages of that
@@ -455,6 +466,7 @@ static int test_no_invasive_cgroup_shrink(const char *root)
 {
 	int ret = KSFT_FAIL;
 	unsigned int off;
+	long zswpwb_before, zswpwb_after, zswpwb_target;
 	size_t allocation_size = page_size * 1024;
 	unsigned int nr_pages = allocation_size / page_size;
 	char zswap_max_buf[32], mem_max_buf[32];
@@ -490,6 +502,14 @@ static int test_no_invasive_cgroup_shrink(const char *root)
 	if (cg_read_key_long(zw_group, "memory.stat", "zswapped") < 1)
 		goto out;
 
+	/* If the shrinker is enabled, try to let the writebacks finish first */
+	if (zswap_shrinker_enabled())
+		sleep(5);
+
+	zswpwb_before = get_cg_wb_count(zw_group);
+	if (zswpwb_before < 0)
+		goto out;
+
 	/* Push wb_group memory into zswap with hard-to-compress data to trigger wb */
 	if (cg_enter_current(wb_group))
 		goto out;
@@ -502,9 +522,13 @@ static int test_no_invasive_cgroup_shrink(const char *root)
 		getrandom(&wb_allocation[off], page_size/4, 0);
 	}
 
-	/* Verify that only zswapped memory from gwb_group has been written back */
-	if (wait_for_writeback(wb_group, 5000) > 0 && get_cg_wb_count(zw_group) == 0)
+	/* Verify that only zswapped memory from wb_group has been written back */
+	zswpwb_target = wait_for_writeback(wb_group, 5000);
+	zswpwb_after = get_cg_wb_count(zw_group);
+
+	if (zswpwb_target > 0 && zswpwb_before == zswpwb_after)
 		ret = KSFT_PASS;
+
 out:
 	cg_enter_current(root);
 	if (zw_group) {
-- 
2.53.0-Meta

