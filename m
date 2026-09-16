Received: from out-2uec-a106.jellyfish.systems (out-2uec-a106.jellyfish.systems [63.250.43.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38458368D65
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575854; cv=none; b=FN1TKxng/Qmav1ybTE1w4B7R46kWesailBJhtc7ZwPcdENE4AF4S1yp+TrAHLcs14x1d6/D32C7ZefyErHWMPJFiqkKnRkaUODZCSUGwSwCVtOwZggXd0/bq0h4C+hM8DJ+RkGFjQ2cu02DwHistwK7+UTaVdqkUUzKhD19VJ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575854; c=relaxed/simple;
	bh=84xYv0u/kz58jR6KVTozEeIz9GIED2HJv/7qq0V1YTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwnnIKSp9b0QGHRV1cSKcHzA6K/f0QaGimAarR+GUlxLWeZ9pbEHw64/Ie6rBg8x6GDBSK5fEoYC4iAtGwA9x3y/Oa6MDrOd0Vrt315Abv1iw9hS3lyiR9Tc4Y698AgBmSxxttYLN5tN+MyuuBAwyf7Q7e+WEPu3pa/CSW8n0rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=XgObANkY; arc=none smtp.client-ip=63.250.43.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="XgObANkY"
Received: from fedora (unknown [117.147.120.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hlP5L51yBz8sXL;
	Wed, 16 Sep 2026 16:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1789575081;
	bh=LCqoXqzY/l2yf0K3cWyQLdt7Osw2JWTjs4N/s2OK0JQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XgObANkYFXECzxCScFkjtwE5q4sLYByt+lsLlpzM+ipo2nW/ZBsmSYqyM/NISCXs8
	 JgLExKMucXFgr1iJxJEWGEb2l1fEBJjbGaYGiValturszHmyJXTYVEQ3crt9QRV0Nx
	 M9Kg/4I4K+nwoHAMJ2ePUKD4eIp0OiTkD5eIM+DpFp5kRWMq9p8+z5JlDWQfptMS8G
	 wms3BflkQ5eR7Zx+KMdkgXBSJ8hMObMbhBclmPTISfq3VphaQVOhacesLqSi5pP3oX
	 Z92xjmYTBcBLIUrzevMA1+0YYxcFvxMElx+Il563T1uigX3jKfaxZovpcxvAV1w1Oi
	 BRdqgHibuxSLQ==
From: Tianyi Chen <hi@tychen.cc>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] memblock tests: use physical free for the maximum-address check
Date: Thu, 17 Sep 2026 00:11:04 +0800
Message-ID: <20260916161105.2548281-2-hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916161105.2548281-1-hi@tychen.cc>
References: <20260916161105.2548281-1-hi@tychen.cc>
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

Use memblock_phys_free() for this synthetic physical range and retain
the checks that freeing past PHYS_ADDR_MAX clips the removed region.

Fixes: 21a233f68afe ("memblock tests: add additional tests for basic api and memblock_alloc")
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/memblock/tests/basic_api.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/memblock/tests/basic_api.c b/tools/testing/memblock/tests/basic_api.c
index 01e836fba488..dfca0153b6b1 100644
--- a/tools/testing/memblock/tests/basic_api.c
+++ b/tools/testing/memblock/tests/basic_api.c
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

