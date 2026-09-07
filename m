Received: from out-2uec-a98.jellyfish.systems (out-2uec-a98.jellyfish.systems [63.250.43.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293BC4CCDFD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 01:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788744042; cv=none; b=mUP2i+WQAdZtlQvIVrplRIfXDMYTPHcd4j3Dx3GVUCNCvz9Q3heLlvH85E2QPB0cb2srNKWNZE0KHFwrFLQGhDgLh+gd36bhSNfEW5Vg0t8ootKGIC3SfzeKrh+0hONil+3RAv6K8v4zqf9wjT97CkMyv7d6eelkl9s+x9eXqis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788744042; c=relaxed/simple;
	bh=k7i3KBtVKmqUdkmRcqIOFiVsSo+Bui7ac5IlPUpn4g4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7ofux8uZetkjdmCVFwDTagJJYDjV8KlBDpReUnu20/hkEv1ZNrrL4s6TBIEO1SEKS/aM4hXLos3BQ7rsOBiTjIBSDv7PnOzVT5sjl2nc4PQ8AaMX7ASXMZIHHmpspqBsKpVZXnh6vfRDIZpzqkmzE+TVyZ8MtFE8s5Y7u2QEKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=jlH7kWS5; arc=none smtp.client-ip=63.250.43.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="jlH7kWS5"
Received: from 192.168.5.3 (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hdTll5c2Jz6tlq;
	Mon, 07 Sep 2026 01:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788744037;
	bh=/BhB8kBxt+StZvcY4KWOzj5LwCM7hEqB3jFqFsqshSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jlH7kWS5skDnhiS31iqUSJZjGySerBKY9Fvytx/7uapbvF3odxkFdh+9qGa3PuBC4
	 htaU6nzdYXcmY0XzV/cTM4HhH90q1fQRE/eHssDDxqp+sE+xe+I5HesQgHbBGBF6ev
	 IlqQMym00YkQ24ZWDIqjAvgpj+tvJPp2HWjKjl9DZ8OSnvPOhQ9cKscN5tI2+7Nu6F
	 VQLaAoOF3KHnqP1G/5A8k8faH44NzJx//Wzxbq+FSzqIH8SbFfZIcM2vVZDAZavqKE
	 ZNqjhGdMkZOC1+7OLE1M3hwV550P6ktiYEP+NhxgSYo9WBZjoiGkNIlUqnYDwWjMjN
	 x3kQ+um+UUyBQ==
From: Tianyi Chen <hi@tychen.cc>
To: rppt@kernel.org
Cc: Tianyi Chen <hi@tychen.cc>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] memblock tests: cover low-address allocations
Date: Mon,  7 Sep 2026 09:20:31 +0800
Message-ID: <178874362959.1415955.18132997964995947947.memblock-v2-0@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906144011.848898-1-hi@tychen.cc>
References: <20260906144011.848898-1-hi@tychen.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

Model a low allocation limit within the dummy memory registered with
memblock, then exercise memblock_alloc_low() in both allocation directions.

Changes in v2, following Mike Rapoport's review:
- Clarify why the limit splits MEM_SIZE, the region registered by
  setup_memblock(), rather than the larger PHYS_MEM_SIZE malloc buffer.
- Explain why the malloc-backed base still needs alignment.
- Describe the boundary in terms of the last usable byte and clarify
  that reserving low memory succeeds; the following allocation fails.
- Update Assisted-by tags to the required tool:model format.

No allocator or test behavior changes from v1.

Validation with the existing Makefile and ASan/UBSan enabled:
- Default, NUMA=1, 32BIT_PHYS_ADDR_T=1, 32BIT_PHYS_ADDR_T=1 with NUMA=1,
  and MEMBLOCK_DEBUG=1 with NUMA=1 builds passed.
- Each configuration passed both ./main -v and ./main -v -m.
- A separate BUILD=32 run still hits the pre-existing
  memblock_free_near_max_check assertion in basic_api.c, also seen on
  the baseline. This is distinct from the passing 32-bit physical-address
  configuration above.

v1: https://lore.kernel.org/r/20260906144011.848898-1-hi@tychen.cc
Review: https://lore.kernel.org/r/ap3LTQlKTpDbAEJZ@kernel.org
Review: https://lore.kernel.org/r/ap3NJsaG10rLDVpd@kernel.org

Tianyi Chen (2):
  memblock tests: model the low allocation limit within dummy memory
  memblock tests: cover allocations below the low address limit

 tools/testing/memblock/Makefile              |   3 +-
 tools/testing/memblock/README                |  14 +-
 tools/testing/memblock/TODO                  |   5 -
 tools/testing/memblock/asm/dma.h             |   6 +
 tools/testing/memblock/main.c                |   2 +
 tools/testing/memblock/tests/alloc_low_api.c | 148 +++++++++++++++++++
 tools/testing/memblock/tests/alloc_low_api.h |   9 ++
 tools/testing/memblock/tests/common.c        |   6 +
 8 files changed, 180 insertions(+), 13 deletions(-)
 delete mode 100644 tools/testing/memblock/TODO
 create mode 100644 tools/testing/memblock/tests/alloc_low_api.c
 create mode 100644 tools/testing/memblock/tests/alloc_low_api.h

-- 
2.55.0

