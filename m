Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897A0372ED5;
	Wed,  2 Sep 2026 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336625; cv=none; b=VH5+13Dh2VXhIaIqZyYzEXPi+zMf1Dfi47zbpWBWysALSNl+8a0VmpdlBccJdwj+xiQ+wOsKAl0T83mwXs5SlU7stbUDifKS5KdGbfqLYw7FTIb3DItG5NCuOpxOg+TDZjCNAhuxzrx8tw9Y8YDbgTKm96UurQPXLYBNtjM83k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336625; c=relaxed/simple;
	bh=imz99qjPfClBv1E3O3cktFq/iVLC1z7ujP/fL4/cNkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SKPdCRLx338qFLrf1IoSajKTb5N7iUy61yWdj/fJ6x5KnSxCPGo9R8JW0CaU/MEY2senAMHa3wrc0k4pOdrQnUxAUQBZnBmu+pdaXn/Ag73pUVBteihEq945D+xrIBeDGiDWvCeG4sLCQfBYmFGiMYlplmZkzh3MhVGJjZBmCyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqUVp1h3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqUVp1h3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D104D1F00A3A;
	Wed,  2 Sep 2026 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788336624;
	bh=0ftR3FpdlIwIFCE7dSgyrcheyGcD9O4EpeQS8wDPSIw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TqUVp1h3Jl+ZYjaLmC4RG81QROEerifB85tiYh/wEobkksJ2pi8btGDLfUgyBXIuU
	 loHmu24hu49LpJBqovidkSvrXIOohJ0KVN/T9BP9mtSmw21SSlAZ67ZCvoU+MNwdHj
	 48N0sdSaI3QqRshkPpr6niTzcxOa7q0LkuAMRsRze+Uc58Q4tpgn5zNhg5kE15RxWB
	 nsUc5MMUYcG/j0JxUPBgGYb8bDP8PLOSzxAYcVpJ2gMd6HTtGCE52Y8wian+0+Ghj8
	 aPMQ6Hhw9cRFe8djd1yHORt4WsGScJcD+RBlGnuiAJZMZHCFacqAUf785z9Yr3lErq
	 3/ZqTjF++iVjw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Wed, 02 Sep 2026 11:10:11 +0300
Subject: [PATCH v2 1/2] docs/core-api: memory-allocation: add
 k[mz]alloc_obj() and clarify kmalloc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-docs-memalloc-guide-v2-1-218c1a4dcb80@kernel.org>
References: <20260902-docs-memalloc-guide-v2-0-218c1a4dcb80@kernel.org>
In-Reply-To: <20260902-docs-memalloc-guide-v2-0-218c1a4dcb80@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 SJ Park <sj@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-Mailer: b4 0.17-dev

Since v7.0 the most used memory allocation function is kzalloc_obj().

Update the memory-allocation guide to describe k[mz]alloc_obj() family
and make kzalloc_obj() the first answer to "How should I allocate
memory?" question.

While on it, clarify description of kmalloc() size limitations.

Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Acked-by: SJ Park <sj@kernel.org>
Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 Documentation/core-api/memory-allocation.rst | 30 +++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
index 0f19dd5243239..823f7fa57429b 100644
--- a/Documentation/core-api/memory-allocation.rst
+++ b/Documentation/core-api/memory-allocation.rst
@@ -19,6 +19,12 @@ Diversity of the allocation APIs combined with the numerous GFP flags
 makes the question "How should I allocate memory?" not that easy to
 answer, although very likely you should use
 
+::
+
+  kzalloc_obj(<VAR_OR_TYPE>);
+
+or
+
 ::
 
   kzalloc(<size>, GFP_KERNEL);
@@ -139,10 +145,13 @@ allocate memory for an array, there are kmalloc_array() and kcalloc()
 helpers. The helpers struct_size(), array_size() and array3_size() can
 be used to safely calculate object sizes without overflowing.
 
-The maximal size of a chunk that can be allocated with `kmalloc` is
-limited. The actual limit depends on the hardware and the kernel
-configuration, but it is a good practice to use `kmalloc` for objects
-smaller than page size.
+Since 7.0 there are type aware kmalloc-family helpers that let you safely and
+conveniently allocate a single object or arrays of objects with kzalloc_obj()
+and kmalloc_obj() and their array versions kzalloc_objs() and
+kmalloc_objs(). These helpers only need the type of the object that should be
+allocated and the count of elements in the array for the array versions.
+
+As of v7.2, vast majority of the memory allocations use kzalloc_obj().
 
 The address of a chunk allocated with `kmalloc` is aligned to at least
 ARCH_KMALLOC_MINALIGN bytes. For sizes which are a power of two, the
@@ -154,9 +163,16 @@ Chunks allocated with kmalloc() can be resized with krealloc(). Similarly
 to kmalloc_array(): a helper for resizing arrays is provided in the form of
 krealloc_array().
 
-For large allocations you can use vmalloc() and vzalloc(), or directly
-request pages from the page allocator. The memory allocated by `vmalloc`
-and related functions is not physically contiguous.
+`kmalloc` always allocates physically contiguous memory and the maximal size of
+a chunk that can be allocated with `kmalloc` is limited by `KMALLOC_MAX_SIZE`,
+which matches the page allocator's MAX_PAGE_ORDER limit.
+
+Internally, the slab allocator differentiates allocations of different orders
+and delegates larger allocations to the page allocator, but for the users of
+`kmalloc` family it is entirely transparent.
+
+For large allocations that do not require physically contiguous memory you can
+use vmalloc() and vzalloc() family.
 
 If you are not sure whether the allocation size is too large for
 `kmalloc`, it is possible to use kvmalloc() and its derivatives. It will

-- 
2.53.0

