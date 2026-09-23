Received: from out-93wp-a34.jellyfish.systems (out-93wp-a34.jellyfish.systems [104.207.68.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8005363083
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.207.68.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130729; cv=none; b=s2t7SOjvd7UcwSVASUZfSK9urviAsi2SBDi5DGFAJqHkG4WlL0tmzi1riRL7mzZWvpqEdDbY1C1v41KyYA7wRVycpSpzBn5zL0mmUSRZu+aEFpZg49P9tzF8WT2UT9yhRpIbBsepe7xKejN8Eu+fKkueS5yR6jCioXXLGE6UZ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130729; c=relaxed/simple;
	bh=+zpy3l3uQZbtn3EA5tBa12RRyLBX5X8jEzCv9ArKHCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeEq06+Aa530M85nOb9IZEmxTV5sjhrEBTVfDrtHZ8doY22u+ep0xpN3kkehaXDhNkl3GB6vcuW4wuf+LfCCKASrGni1+OWr+2/MeUxB8HKCtXCcqKiiFi3En4IeurkYV3K0Gv91y3/uvWvc/tM63AKjM2LjiwI8HcLP7Maqbho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=G5wmWHGF; arc=none smtp.client-ip=104.207.68.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="G5wmWHGF"
Received: from fedora (unknown [120.199.7.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hqLZP2xcYz8sYH;
	Wed, 23 Sep 2026 02:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1790130703;
	bh=yOXnInNUODU5Lzwbj44QgpGQDJ5UdG0pb1N+gcZ3ygM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G5wmWHGF8x5Fjt8JXLIilAfxBLUl9aQ34u42tdylL7dNFnoM1NAqY0nWyDDx+J9yx
	 fljLl8gdfcAKGAoO9WyBRPyJoNOCD5+BqPI+iyloAdpemuOe4MzU0THBcoz/JBisi4
	 TI8CsTXrHcTHpshU1yOCiiPwYTKWdYSbmza6yeOY5oiEZkb+eoiSajTeC2dkPnAVxo
	 s/k5vnjcacO9S8zSilBs9zOwA7Ar2A+9aRXWn3aagBwiOmWna9bHrvEOEKQUIQ0B3r
	 RlLNzSWPlBYcUGGMBFkZn6CpRIsCU9qQLPkk5IA8lPgRlj965ZI6YmktGqWBm73Fvs
	 z89vhmX/xvmuQ==
From: Tianyi Chen <hi@tychen.cc>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] memblock tests: zero-extend simulated memory addresses
Date: Wed, 23 Sep 2026 11:31:24 +0900
Message-ID: <20260923023126.1910311-3-hi@tychen.cc>
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

Converting a 32-bit pointer directly to the 64-bit phys_addr_t can
sign-extend it when BUILD=32 is used. A dummy allocation above 2 GiB
then gets registered at an address different from its unsigned pointer
value. The low-address tests compare that value against the registered
range and fail once the earlier maximum-address free test is fixed.

Convert through uintptr_t when registering and reporting dummy memory.
This preserves the pointer bits and agrees with the simulator __pa()
conversion and the allocation tests.

Fixes: 284d950dd6b0 ("memblock tests: Add simulation of physical memory")
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/memblock/tests/common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/memblock/tests/common.c b/tools/testing/memblock/tests/common.c
index ac032610a56e..2a248973eb4c 100644
--- a/tools/testing/memblock/tests/common.c
+++ b/tools/testing/memblock/tests/common.c
@@ -67,7 +67,7 @@ static inline void fill_memblock(void)
 void setup_memblock(void)
 {
 	reset_memblock_regions();
-	memblock_add((phys_addr_t)memory_block.base, MEM_SIZE);
+	memblock_add((phys_addr_t)(uintptr_t)memory_block.base, MEM_SIZE);
 	fill_memblock();
 }
 
@@ -88,7 +88,7 @@ void setup_numa_memblock(const unsigned int node_fracs[])
 	int flags;
 
 	reset_memblock_regions();
-	base = (phys_addr_t)memory_block.base;
+	base = (phys_addr_t)(uintptr_t)memory_block.base;
 	flags = (movable_node_is_enabled()) ? MEMBLOCK_NONE : MEMBLOCK_HOTPLUG;
 
 	for (int i = 0; i < NUMA_NODES; i++) {
@@ -115,7 +115,7 @@ void dummy_physical_memory_cleanup(void)
 
 phys_addr_t dummy_physical_memory_base(void)
 {
-	return (phys_addr_t)memory_block.base;
+	return (phys_addr_t)(uintptr_t)memory_block.base;
 }
 
 phys_addr_t dummy_physical_memory_low_limit(void)
-- 
2.55.0

