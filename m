Received: from mta0.migadu.com (out-132.mta0.migadu.com [91.218.175.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4CD38A71F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632937; cv=none; b=tuWJHYax0deAxEpbKEWYgcoluYuMWHKyy1YRSHrj7uDnEXw8/TT1DQTA8x9czmmoCs2zbURIJrWWKAqiMoF7VDhGhBiLQNWvyEA+/ZcYG33MIZp71vHs+3dxGDKwfhFcdf39ZdXAWzipZ/Zk8NvGVVEue/ONnQGoofRRzM4KkwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632937; c=relaxed/simple;
	bh=qeGk3zdozLcG9Sl7yQQPW4sC6MwYHbHe3QIG6n9Q47s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pHN9ttpX5gux9RIG9qAmjcgMzY5XbbtpqGi3A3g5jY7QduO7wpJmlINyzqoleDGhSZiyFcyK+bz+xRwXFsJleBrXsT/FO0JEjhImbJr0OYe16VGTFrcCAgDm8MRZp7V2R9TEGlz8ef9gxS2bhfG/x9cvCjyYGi/fCSOSS6ZE4TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qRqOE7sA; arc=none smtp.client-ip=91.218.175.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qRqOE7sA"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qeGk3zdozLcG9Sl7yQQPW4sC6MwYHbHe3QIG6n9Q47s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789632933; v=1; x=1790237733;
 b=qRqOE7sACV1CyL5htRmuRCMISU5rt3w0+Drrmfv7A/P99mM7RzIEcjfPUcNnFoUkmNg8DUeD
 4NcpBbCIgAqFlZBthxBAowiuaa8pe1XDoNlsFsIjn/PPbmsgKCaMfGi2aykFgvhNvkmCVnr6VB5
 FUUMVlp96FogY9ZoheiciW70=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f48e50a38c1503ca;
	Thu, 17 Sep 2026 08:15:19 +0000
X-Mizu-Trace-ID: f48e50a38c1503ca
X-Migadu-Flow: FLOW_OUT
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Priyanshu Kumar <priyanshukumarpu@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kaitao Cheng <kaitao.cheng@linux.dev>
Subject: [PATCH 0/2] memblock: Remove unused exact nid allocation API
Date: Thu, 17 Sep 2026 16:15:02 +0800
Message-ID: <20260917081504.30426-1-kaitao.cheng@linux.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series follows the removal of the unused exact_nid argument from
memmap_alloc(). That change removed the last in-kernel caller of
memblock_alloc_exact_nid_raw(), leaving only the memblock simulator
tests using the function.

The first patch moves the applicable exact-node allocation tests to
memblock_alloc_range_nid(). The second patch removes
memblock_alloc_exact_nid_raw() and drops the exact_nid argument from
memblock_alloc_internal(), as all of its remaining callers allow
fallback to other NUMA nodes.

The investigation cannot be extended to removing the exact_nid argument
from memblock_alloc_range_nid(). CMA passes true when reserving per-node
CMA areas. Allowing such an allocation to fall back to another node
could leave the CMA area's recorded nid inconsistent with the physical
location of its memory. KHO also passes true when allocating per-node
scratch areas and requires those allocations to remain on the requested
node.

Since exact-node allocation remains a required behavior of
memblock_alloc_range_nid(), deleting all of the tests in
alloc_exact_nid_api.c would remove useful coverage. Preserve the
applicable NUMA tests by making them call memblock_alloc_range_nid()
directly with exact_nid set.

Some tests cannot be preserved unchanged because they exercise
memblock_alloc_internal() retrying below min_addr. Unlike
memblock_alloc_internal(), memblock_alloc_range_nid() treats its start
address as a hard boundary and does not retry from address zero. Remove
those tests together with the now-unused TEST_F_EXACT dispatch from the
shared allocation tests.

Kaitao Cheng (2):
  memblock tests: Move exact nid tests to memblock_alloc_range_nid()
  memblock: Remove unused memblock_alloc_exact_nid_raw()

 include/linux/memblock.h                      |   3 -
 mm/memblock.c                                 |  44 +-
 .../memblock/tests/alloc_exact_nid_api.c      | 454 ++----------------
 tools/testing/memblock/tests/alloc_nid_api.c  |  20 -
 tools/testing/memblock/tests/alloc_nid_api.h  |   1 -
 tools/testing/memblock/tests/common.h         |   2 -
 6 files changed, 42 insertions(+), 482 deletions(-)

-- 
2.54.0 (Apple Git-157)

