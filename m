Received: from out-2z4y-a133.jellyfish.systems (out-2z4y-a133.jellyfish.systems [198.54.127.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641F64D6C3F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575110; cv=none; b=sFcP5nBjPZFKRzMbodPClkKv1mB94qh0dIPA9MuBkwBrhhmW39rMtCriknRE7ykhZHIQ7dxSIyc2NmtOK5v0ecz/36VhwwnPzPvexmcbEiLmlI45B8elJZDU795Ho0pC89vXFbn+mPqI5FK6yZoDubKGAd1kRxxQ9BFGU14dkOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575110; c=relaxed/simple;
	bh=+zpy3l3uQZbtn3EA5tBa12RRyLBX5X8jEzCv9ArKHCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HqAYEcnZz6DWPmUtDBeWUjziFnYmP1LB7fbzwRZ+9ZniHCXsIsPkAUbNT1gsY+gZ2wOq/7A5YerCbx2UILwZwNqxkH/QfiJpNWoxwVqQdpIJprcNcibALJOm4FFkEJtq0sjy90hPnewjH3NjkyMIuwquDWwsazx1dHq9H+0tmC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=WPwqNqrk; arc=none smtp.client-ip=198.54.127.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="WPwqNqrk"
Received: from fedora (unknown [117.147.120.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hlP5P70Fcz8sWt;
	Wed, 16 Sep 2026 16:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1789575084;
	bh=yOXnInNUODU5Lzwbj44QgpGQDJ5UdG0pb1N+gcZ3ygM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WPwqNqrk70w9Mi1PTiVb6REraDWc5644Q4DVFs1kz+uY3u6Fcrf++JlERFNRShvl8
	 p94/jBTEY1XFb/FCt5frxY04pDZM56TdIcGoI+/+xTPsJ+RO5ZJEoxZIYg38Qr21zD
	 6PPKoactrpEXzt1jPgi1SNYr1/W9lJ4nxoiPG4YpE3AUQL+FNTF+FifTenzEdLpVi1
	 2PwHMujfmISna+i6IL23zs82FG/Hxqe76iLEQpE9T9oA3q5gRJI8vQl1x+jT0rGmjl
	 IKlBgrMX/y0hzV8987QPdQoUepqTOb+1Qd0GluEWkfjzd8kzPuv2CEtYEPMP3Z5LCU
	 q2keh9ePG9kYQ==
From: Tianyi Chen <hi@tychen.cc>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] memblock tests: zero-extend simulated memory addresses
Date: Thu, 17 Sep 2026 00:11:05 +0800
Message-ID: <20260916161105.2548281-3-hi@tychen.cc>
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

