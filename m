Received: from out-2uec-a106.jellyfish.systems (out-2uec-a106.jellyfish.systems [63.250.43.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1CD208D0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998469; cv=none; b=qyJMPNWTyGcvsJLfg2Q/rfDdpSkGXqSOMgHuZtPtfOpobu6KhBpsbUyu6XNUSMiE8fUsTCRB9vDvHbJGgK6g6XcHvvJCRbg0dUQrSDWOnvcKY3WJVBqmetUnfM1TDuzEaQga/vBPjg9xtiBjkvGCw8uh5HMwKKLY67QnEuDNA9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998469; c=relaxed/simple;
	bh=cmdeFGh4pcdhnjRYo0LtmFBgSqBg+S1H68J/5n9IbUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fjj2nUokcAVMR8vtMuzwJe64G6kWEpgCipNX0GZXNTih8aFyxHx3D64OnjsLWdtm+cllrW66ebM3HzCvgiU7+cqBjFyuC3B9BHmYWxQVo7SqDcxnOrS+fko3CTCSFxK7pNVNec+VcmNkgX+NBO3SkuFd/+Q1+2b+S1LmGmccUQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=a9jIM5nT; arc=none smtp.client-ip=63.250.43.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="a9jIM5nT"
Received: from 192.168.5.7 (unknown [23.142.132.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hgHk55JQSz6tmK;
	Wed, 09 Sep 2026 23:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788998128;
	bh=T7jd44gstMNeWdAHdpYwxJzLjuFnV0LDcX+sE500ubQ=;
	h=From:To:Cc:Subject:Date:From;
	b=a9jIM5nTa3UtzmDc+kqmLj5+pq3c9Y2ff4yr75Bs00QT0Ro97NRjPG/oJs49cshDz
	 SjGlj7dIiKJWhZ40CYre31lJuKzgXF60iHXLhQNyazzn365iekR2txbjTkY1NwR+sE
	 CgyKZE4jvDNt7COpdXb3UrP5nshXvi/dTWgEKeLjVv/5/PITuetL4TVTDUl/1j/buh
	 73+cLDhnQkBDDhGVOsvmwk6+bIWV5f3FKqp3e2CirpwLzK3Otsq39DfpsjH39GpyfR
	 OUjWiwqPMDtVtYfYNHyN7cN6k4iHF3eLbbMyP0NECtcYlHz7NPRy2tK1U4kWcAKRuH
	 2121/wgboGZCQ==
From: Tianyi Chen <hi@tychen.cc>
To: Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	hi@tychen.cc
Subject: [PATCH v3 0/2] memblock tests: cover low-address allocations
Date: Thu, 10 Sep 2026 07:55:22 +0800
Message-ID: <cover.1788997523.git.hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

Model a low allocation limit within the memory registered by the simulator,
then exercise memblock_alloc_low() in both allocation directions.

Changes in v3:
- Describe the low limit and simulated RAM alignment directly in comments
  and README.
- Use Assisted-by: LLM in both patches.
- Start a separate thread for this revision.

The pointer casts remain unchanged. With BUILD=32, pointers are 32-bit and
phys_addr_t is 64-bit: the tested compiler sign-extends a direct cast, while
the conversion through uintptr_t zero-extends it. The direct casts also
introduce compiler warnings, so this revision preserves the existing
conversion behavior. There are no executable code changes from v2.

Validation with ASan and UBSan enabled:
- Default and 32BIT_PHYS_ADDR_T=1: 189 tests pass in each runtime mode.
- NUMA=1, 32BIT_PHYS_ADDR_T=1 with NUMA=1, and MEMBLOCK_DEBUG=1 with NUMA=1:
  272 tests pass in each runtime mode.
- Both ./main -v and ./main -v -m were run for those configurations.
- BUILD=32 builds without warnings from alloc_low_api.c. Its runtime still
  hits the pre-existing basic_api.c memblock_free_near_max_check assertion
  before reaching the low-allocation tests.

v2: https://lore.kernel.org/r/178874362959.1415955.18132997964995947947.memblock-v2-0@tychen.cc

Tianyi Chen (2):
  memblock tests: model the low allocation limit within dummy memory
  memblock tests: cover allocations below the low address limit

 tools/testing/memblock/Makefile              |   3 +-
 tools/testing/memblock/README                |  12 +-
 tools/testing/memblock/TODO                  |   5 -
 tools/testing/memblock/asm/dma.h             |   6 +
 tools/testing/memblock/main.c                |   2 +
 tools/testing/memblock/tests/alloc_low_api.c | 148 +++++++++++++++++++
 tools/testing/memblock/tests/alloc_low_api.h |   9 ++
 tools/testing/memblock/tests/common.c        |   6 +
 8 files changed, 178 insertions(+), 13 deletions(-)
 delete mode 100644 tools/testing/memblock/TODO
 create mode 100644 tools/testing/memblock/tests/alloc_low_api.c
 create mode 100644 tools/testing/memblock/tests/alloc_low_api.h

-- 
2.55.0
