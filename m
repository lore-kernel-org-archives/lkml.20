Received: from mta0.migadu.com (out-194.mta0.migadu.com [91.218.175.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FCB302753
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789826057; cv=none; b=iCR49N/jet1Z/K6bgdMvdDq5lQPYUHexQ6luJUWXZi69VGYwgotd9huO/0lo7Fa+CkEVF0i6s1/l7xA+ACwFi8FM9cJPefGREt8quNQLslonxwsi0edAn2zGB5YWU8oL7ZDGUkmbSalFD50RoWAMT2Vlsr2UqG34iv32Q6IG9Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789826057; c=relaxed/simple;
	bh=NvPx8OfXlBjTydmRGXNV9+CIy/MtUUq+PQTUgas3+4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y40mnYs/SKkHeUEBuCJYvABM5ShQqgQhLEoZcGr5E47r7XLYbXxKkqCP86hvlgkTM+G2nGt8CglOisawmsjAqZHyNxX2wpreIcJyT9YFMFqs/tFmrqvXhMGqBv+KkZmCorPBsP/eWWp6ycZCu8ViU7cdixHOSORceZRZe4BckO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZTG3CoCs; arc=none smtp.client-ip=91.218.175.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZTG3CoCs"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NvPx8OfXlBjTydmRGXNV9+CIy/MtUUq+PQTUgas3+4I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789826052; v=1; x=1790430852;
 b=ZTG3CoCsa9r3QMVkwNds/OYUf/TlyIdu8tIG0g/oUNI0b0qb9CyVJ2MG8jL4qRzia+u8bscs
 7p1IooO8Aqd4Fc0DMJNhdWJPRm5DwcV7OFiahImZjBssyMVnS42EjbZIa5oYsrfRlPZW6VEXUAn
 Pnm4oOr72qMeqZ5SCIxIdO4k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 51be81c82004f823;
	Sat, 19 Sep 2026 13:54:12 +0000
X-Mizu-Trace-ID: 51be81c82004f823
X-Migadu-Flow: FLOW_OUT
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>
Cc: Priyanshu Kumar <priyanshukumarpu@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH v2 3/3] memblock: Remove unused memblock_alloc_exact_nid_raw()
Date: Sat, 19 Sep 2026 21:53:27 +0800
Message-ID: <20260919135327.74089-4-kaitao.cheng@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260919135327.74089-1-kaitao.cheng@linux.dev>
References: <20260919135327.74089-1-kaitao.cheng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

memmap_alloc() was the only in-kernel caller of
memblock_alloc_exact_nid_raw(). After removing its unused exact_nid
argument, the function no longer has any callers.

Remove memblock_alloc_exact_nid_raw() and its declaration. The remaining
callers of memblock_alloc_internal() always allow allocation to fall back
to other NUMA nodes, so remove its exact_nid argument and pass false
directly to memblock_alloc_range_nid().

Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 include/linux/memblock.h |  3 ---
 mm/memblock.c            | 44 +++++-----------------------------------
 2 files changed, 5 insertions(+), 42 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index aa845f488327..01a2dea5aa11 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -412,9 +412,6 @@ static __always_inline phys_addr_t memblock_phys_alloc(phys_addr_t size,
 					 MEMBLOCK_ALLOC_ACCESSIBLE);
 }
 
-void *memblock_alloc_exact_nid_raw(phys_addr_t size, phys_addr_t align,
-				 phys_addr_t min_addr, phys_addr_t max_addr,
-				 int nid);
 void *memblock_alloc_try_nid_raw(phys_addr_t size, phys_addr_t align,
 				 phys_addr_t min_addr, phys_addr_t max_addr,
 				 int nid);
diff --git a/mm/memblock.c b/mm/memblock.c
index 22d14a637f24..51f816ce0cd9 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1659,7 +1659,6 @@ phys_addr_t __init memblock_phys_alloc_try_nid(phys_addr_t size, phys_addr_t ali
  * @min_addr: the lower bound of the memory region to allocate (phys address)
  * @max_addr: the upper bound of the memory region to allocate (phys address)
  * @nid: nid of the free area to find, %NUMA_NO_NODE for any node
- * @exact_nid: control the allocation fall back to other nodes
  *
  * Allocates memory block using memblock_alloc_range_nid() and
  * converts the returned physical address to virtual.
@@ -1675,7 +1674,7 @@ phys_addr_t __init memblock_phys_alloc_try_nid(phys_addr_t size, phys_addr_t ali
 static void * __init memblock_alloc_internal(
 				phys_addr_t size, phys_addr_t align,
 				phys_addr_t min_addr, phys_addr_t max_addr,
-				int nid, bool exact_nid)
+				int nid)
 {
 	phys_addr_t alloc;
 
@@ -1684,12 +1683,12 @@ static void * __init memblock_alloc_internal(
 		max_addr = memblock.current_limit;
 
 	alloc = memblock_alloc_range_nid(size, align, min_addr, max_addr, nid,
-					exact_nid);
+					false);
 
 	/* retry allocation without lower limit */
 	if (!alloc && min_addr)
 		alloc = memblock_alloc_range_nid(size, align, 0, max_addr, nid,
-						exact_nid);
+						false);
 
 	if (!alloc)
 		return NULL;
@@ -1697,37 +1696,6 @@ static void * __init memblock_alloc_internal(
 	return phys_to_virt(alloc);
 }
 
-/**
- * memblock_alloc_exact_nid_raw - allocate boot memory block on the exact node
- * without zeroing memory
- * @size: size of memory block to be allocated in bytes
- * @align: alignment of the region and block's size
- * @min_addr: the lower bound of the memory region from where the allocation
- *	  is preferred (phys address)
- * @max_addr: the upper bound of the memory region from where the allocation
- *	      is preferred (phys address), or %MEMBLOCK_ALLOC_ACCESSIBLE to
- *	      allocate only from memory limited by memblock.current_limit value
- * @nid: nid of the free area to find, %NUMA_NO_NODE for any node
- *
- * Public function, provides additional debug information (including caller
- * info), if enabled. Does not zero allocated memory.
- *
- * Return:
- * Virtual address of allocated memory block on success, NULL on failure.
- */
-void * __init memblock_alloc_exact_nid_raw(
-			phys_addr_t size, phys_addr_t align,
-			phys_addr_t min_addr, phys_addr_t max_addr,
-			int nid)
-{
-	memblock_dbg("%s: %llu bytes align=0x%llx nid=%d from=%pa max_addr=%pa %pS\n",
-		     __func__, (u64)size, (u64)align, nid, &min_addr,
-		     &max_addr, (void *)_RET_IP_);
-
-	return memblock_alloc_internal(size, align, min_addr, max_addr, nid,
-				       true);
-}
-
 /**
  * memblock_alloc_try_nid_raw - allocate boot memory block without zeroing
  * memory and without panicking
@@ -1756,8 +1724,7 @@ void * __init memblock_alloc_try_nid_raw(
 		     __func__, (u64)size, (u64)align, nid, &min_addr,
 		     &max_addr, (void *)_RET_IP_);
 
-	return memblock_alloc_internal(size, align, min_addr, max_addr, nid,
-				       false);
+	return memblock_alloc_internal(size, align, min_addr, max_addr, nid);
 }
 
 /**
@@ -1858,8 +1825,7 @@ void * __init memblock_alloc_try_nid(
 	memblock_dbg("%s: %llu bytes align=0x%llx nid=%d from=%pa max_addr=%pa %pS\n",
 		     __func__, (u64)size, (u64)align, nid, &min_addr,
 		     &max_addr, (void *)_RET_IP_);
-	ptr = memblock_alloc_internal(size, align,
-					   min_addr, max_addr, nid, false);
+	ptr = memblock_alloc_internal(size, align, min_addr, max_addr, nid);
 	if (ptr)
 		memset(ptr, 0, size);
 
-- 
2.54.0 (Apple Git-157)

