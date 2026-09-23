Received: from out-zbxj-a87.jellyfish.systems (out-zbxj-a87.jellyfish.systems [198.54.127.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6196A368D55
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130709; cv=none; b=JXQv7vy1yhwH9NXRQ4chR+6VXO/ZHDkj96N0TZXA2bRx0o/lM2RaZOs+DiFdM5XH3mZHFIt6lVn/Kz4+weACNCphnKkWLJWSvlFi19Ddij5ms9CLnQFopB7kucKV2uQLDvR5Ms/8bw8Z2tYn2z8vwv7Tfq2Aq/GK67TqtZ1tGYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130709; c=relaxed/simple;
	bh=xVYCl2+ToQhJsfoOk1Efc9VXhWNjqHGapy2zKgaYkh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DajiUsKbsUlIe5nf0aua6pT2uW/qhh3OYDub6gB00VJwcGqLPlpq9xZGdNygofngRIIoPviTq1UNgjHdgB1jmMR+x99ql7E3usRXGhXv7MAWNJZNFhdG8F2SD/5iclV1FLZMS1gzddexVypKNZ+GWlXEUat7dAdaxxGJDE3pHDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=DQ1m2Cq3; arc=none smtp.client-ip=198.54.127.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="DQ1m2Cq3"
Received: from fedora (unknown [120.199.7.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hqLZJ3fkcz8sYH;
	Wed, 23 Sep 2026 02:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1790130697;
	bh=atpMB5sAObGBHnnZwrOzoT8hf1VnqLifryohDjX8lnw=;
	h=From:To:Cc:Subject:Date:From;
	b=DQ1m2Cq3mutHCmf62FSW3M/unrd1lwHkBQARS34Crz9uY49SCD15QOhS9fI975POz
	 kFUV8asMjEoSR8PU6pJIcBAuXRpW6+B96JcoFVSmZPS2TbwSSK6eZgrTNVFjVnpGMn
	 15YWHFNgN5s5y5N+xRr55hL75j/kKUrMkGvBYhrnu9WdEM89ixC31s8KmbCsG3tEXQ
	 U3yW6+nNQEsP5WAOqp8VU+7Wzc3/kkG5EUxiiMB74y75dnbtJySeOAoA9/YaglZstS
	 wZ6q/Y+dIKQJE3PsrXY7IBAO5/QOiW7jugWLwpkHD233D6C978J81S4H31EIQLyULy
	 s/jqhLWjiwYtQ==
From: Tianyi Chen <hi@tychen.cc>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] memblock tests: fix BUILD=32 address conversions and warnings
Date: Wed, 23 Sep 2026 11:31:22 +0900
Message-ID: <20260923023126.1910311-1-hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

Fix the BUILD=32 physical-address truncation and sign-extension failures,
and address the remaining GCC warnings reported during review.

Changes in v2:
- Use memblock_phys_free() for all synthetic physical ranges in the basic
  API tests, not only the maximum-address check.
- Keep the dummy-memory address conversion fix unchanged.
- Use __pa() in tools virt_to_phys() to avoid a pointer-size warning and
  sign extension of 32-bit pointers with their top bit set.
- Initialize end_rgn to avoid GCC's maybe-uninitialized warning.

Clang BUILD=32 without NUMA also passes on v1 (189 checks). The earlier
cover letter only mentioned the NUMA-enabled configuration tested then.

Validated v2 with GCC 13.3.0 and Clang 18.1.3, retaining the default ASan
and UBSan flags and adding -Werror. Both compilers build without warnings
and pass ./main -v and ./main -m -v in each configuration:
- Default and NUMA=1.
- BUILD=32, with and without NUMA=1.
- 32BIT_PHYS_ADDR_T=1, with and without NUMA=1.
- BUILD=32 NUMA=1 MEMBLOCK_DEBUG=1.

Each run passes 189 checks without NUMA or 272 with NUMA, including both
allocation directions. A separate virt_to_phys() boundary check passes
with both compilers in 32- and 64-bit builds; GCC BUILD=32 failed it on
v1 for 0x80000000 due to sign extension.

v1: https://lore.kernel.org/r/20260916161105.2548281-1-hi@tychen.cc

Tianyi Chen (4):
  memblock tests: use physical addresses for region removal
  memblock tests: zero-extend simulated memory addresses
  tools: use __pa() in virt_to_phys()
  memblock: initialize the region merge end index

 mm/memblock.c                            |  2 +-
 tools/include/linux/mm.h                 |  2 +-
 tools/testing/memblock/tests/basic_api.c | 20 ++++++++++----------
 tools/testing/memblock/tests/common.c    |  6 +++---
 4 files changed, 15 insertions(+), 15 deletions(-)


base-commit: 5728d3523f12826a2b180c1c5738f74e33197e14
-- 
2.55.0

