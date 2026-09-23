Received: from out-2uec-a106.jellyfish.systems (out-2uec-a106.jellyfish.systems [63.250.43.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E06638E106
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131474; cv=none; b=d3ha8r1NHHqIHeePC9s8wkryOFYPRYaYHb758TA1WE719p3WfdmyxrRix5CkN2LVdmHMu8DPdUEVLKaqrWVzMN8L0d+CeeO5T76Qx5bLziOwCIBjqk1utOQrfpacnBSJskSS3h49ydM6Q8UFQxCR18hsBpl/k4h3p23jU3T1czE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131474; c=relaxed/simple;
	bh=1FNXjnkkShKduOmgw1ZZnqtP8QiB8yibQu0OlPMpM2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6ypaeBCo3zCpgj5LDFybsp35wgomXAQ/OQJLwR742rtxG4cwu4jUDLJMapIUrKLV7fiVnVNV9DiA/yUfj5K88ySNy6sMkvTEdGaeTY+L24LHJBEPRxKQWWER+JA7nMDOGDRxtn8HnLN1tAuSuh0+WvPepG7rbqJLCp9SGe6RjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=IwvCtPGS; arc=none smtp.client-ip=63.250.43.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="IwvCtPGS"
Received: from fedora (unknown [120.199.7.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hqLZL28X8z8sYF;
	Wed, 23 Sep 2026 02:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1790130700;
	bh=4NmJHuTnYwRJLDD5IFTn5S7aIbzSeEjEGBUsClZv5Uw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IwvCtPGSL00D6EVhxp68pIUcsDF5v/TCpS02ROzmyWaN25dgQ/w7fM2ZrfdIOyv3Q
	 XE/m0L+SQFLr43XtMEAPrOJxawXXeYRa2aNst48Hm4dtwVm6yk67eJqpC/obEFO/kz
	 qP/PvcvOAgPx2H6lrvK0FaPVSiszRg40gqSyJjOLd20zDBjXPWdpUT+VG1vfeyyr2J
	 TDG59e/VCES1uW4qtNUyumRAvdMOjjpK2e0L3qcRw2VpbugDhWsLIdU6RV02gRk4Xx
	 AndLiO9jGTt945vGT7VWgW8i/nI6P6PqLdKNvqJ7MVH6C/7ILnrJN6W+tG+FQ+01ko
	 pEoYBQNoMcQjA==
From: Tianyi Chen <hi@tychen.cc>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] memblock tests: use physical addresses for region removal
Date: Wed, 23 Sep 2026 11:31:23 +0900
Message-ID: <20260923023126.1910311-2-hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923023126.1910311-1-hi@tychen.cc>
References: <20260923023126.1910311-1-hi@tychen.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

With BUILD=32, phys_addr_t remains 64-bit while pointers are 32-bit.
Casting the address near PHYS_ADDR_MAX to void * truncates it before
memblock_free() converts it back with __pa(). The reserved region is
therefore left unchanged and memblock_free_near_max_check() fails.

Use memblock_phys_free() for all synthetic physical ranges in the basic
API tests. This also removes the integer-to-pointer cast warnings from
the other removal checks. Retain the checks that freeing past
PHYS_ADDR_MAX clips the removed region.

Fixes: 21a233f68afe ("memblock tests: add additional tests for basic api and memblock_alloc")
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/memblock/tests/basic_api.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/testing/memblock/tests/basic_api.c b/tools/testing/memblock/tests/basic_api.c
index 01e836fba488..47bcdcc115a5 100644
--- a/tools/testing/memblock/tests/basic_api.c
+++ b/tools/testing/memblock/tests/basic_api.c
@@ -1730,7 +1730,7 @@ static int memblock_free_simple_check(void)
 	reset_memblock_regions();
 	memblock_reserve(r1.base, r1.size);
 	memblock_reserve(r2.base, r2.size);
-	memblock_free((void *)r1.base, r1.size);
+	memblock_phys_free(r1.base, r1.size);
 
 	ASSERT_EQ(rgn->base, r2.base);
 	ASSERT_EQ(rgn->size, r2.size);
@@ -1778,7 +1778,7 @@ static int memblock_free_absent_check(void)
 
 	reset_memblock_regions();
 	memblock_reserve(r1.base, r1.size);
-	memblock_free((void *)r2.base, r2.size);
+	memblock_phys_free(r2.base, r2.size);
 
 	ASSERT_EQ(rgn->base, r1.base);
 	ASSERT_EQ(rgn->size, r1.size);
@@ -1832,7 +1832,7 @@ static int memblock_free_overlap_top_check(void)
 
 	reset_memblock_regions();
 	memblock_reserve(r1.base, r1.size);
-	memblock_free((void *)r2.base, r2.size);
+	memblock_phys_free(r2.base, r2.size);
 
 	ASSERT_EQ(rgn->base, r2.base + r2.size);
 	ASSERT_EQ(rgn->size, total_size);
@@ -1881,7 +1881,7 @@ static int memblock_free_overlap_bottom_check(void)
 
 	reset_memblock_regions();
 	memblock_reserve(r1.base, r1.size);
-	memblock_free((void *)r2.base, r2.size);
+	memblock_phys_free(r2.base, r2.size);
 
 	ASSERT_EQ(rgn->base, r1.base);
 	ASSERT_EQ(rgn->size, total_size);
@@ -1938,7 +1938,7 @@ static int memblock_free_within_check(void)
 
 	reset_memblock_regions();
 	memblock_reserve(r1.base, r1.size);
-	memblock_free((void *)r2.base, r2.size);
+	memblock_phys_free(r2.base, r2.size);
 
 	ASSERT_EQ(rgn1->base, r1.base);
 	ASSERT_EQ(rgn1->size, r1_size);
@@ -1976,7 +1976,7 @@ static int memblock_free_only_region_check(void)
 
 	reset_memblock_regions();
 	memblock_reserve(r1.base, r1.size);
-	memblock_free((void *)r1.base, r1.size);
+	memblock_phys_free(r1.base, r1.size);
 
 	ASSERT_EQ(rgn->base, 0);
 	ASSERT_EQ(rgn->size, 0);
@@ -2003,7 +2003,7 @@ static int memblock_free_only_region_check(void)
  * Expect the total size of reserved memory to be updated and the counter to
  * not be updated.
  */
-static int memblock_free_near_max_check(void)
+static int memblock_phys_free_near_max_check(void)
 {
 	struct memblock_region *rgn;
 	phys_addr_t total_size;
@@ -2026,7 +2026,7 @@ static int memblock_free_near_max_check(void)
 
 	reset_memblock_regions();
 	memblock_reserve(r1.base, r1.size);
-	memblock_free((void *)r2.base, r2.size);
+	memblock_phys_free(r2.base, r2.size);
 
 	ASSERT_EQ(rgn->base, r1.base);
 	ASSERT_EQ(rgn->size, total_size);
@@ -2086,7 +2086,7 @@ static int memblock_free_overlap_two_check(void)
 	reset_memblock_regions();
 	memblock_reserve(r1.base, r1.size);
 	memblock_reserve(r2.base, r2.size);
-	memblock_free((void *)r3.base, r3.size);
+	memblock_phys_free(r3.base, r3.size);
 
 	ASSERT_EQ(rgn1->base, r1.base);
 	ASSERT_EQ(rgn1->size, new_r1_size);
@@ -2114,7 +2114,7 @@ static int memblock_free_checks(void)
 	memblock_free_overlap_bottom_check();
 	memblock_free_within_check();
 	memblock_free_only_region_check();
-	memblock_free_near_max_check();
+	memblock_phys_free_near_max_check();
 	memblock_free_overlap_two_check();
 
 	prefix_pop();
-- 
2.55.0

