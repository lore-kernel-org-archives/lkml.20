Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC9C4AA1C2;
	Mon, 31 Aug 2026 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189194; cv=none; b=BvGoEfTLMSWAqvqSmcYeWxDykc7QHhq4rda+Q/9lSfXWUYntG4al+XpJlgx9R4hIR9ZzhpJJr359K5J33wfD9aCgcUV8EhSbu6ao8DrrLS1g+tklvfg+xO/MyP5SCqjZDU8tLuV2aVG6y5hMNGUAMy0shmKAZBLXRqYPgr/wJwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189194; c=relaxed/simple;
	bh=blfFfRYtE7ZzLPJHJw0Y8DQb+sgWw/wLEN3PO9eeURA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BdJ86UAaLPw9zu71s2ALDhT6ccykTVWKRTghqMO6NG38I+CnyWsrxsFf0wLgse5CfOs5bPLRA/eN6bJdEYp7lOFml8iSTAPTLnsUmp99N+ae/i+rvz9DqRJp0w0IX1IiHFrmayAR6VedwstKepAKa4Yacyu7e8q88R43DJKQWd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EkqpdoSr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkqpdoSr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363E51F00A3D;
	Mon, 31 Aug 2026 15:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788189192;
	bh=ualF5+awGlDHLbOLG+wUlZuM4jd8jJfoQcPc7XMxhaI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EkqpdoSrLqrqJ+56jtIOkn0qQ5pYUzgkYbPaxtjasLmfcWU1udj5IEWVdg3ZSpHKz
	 /KCIqnl3daGW2Hi603OV1Bf7sifJEDj14cdAgZQ70tYdaPdV9sbHFZzGWdASQFvyHh
	 /qbzX2J379Fh8QCaEsGzunE0L/B7l9DCrMaVs4tuoH77I+l0Dq7B6L9IEAGSOD5uUO
	 Ucbh1XtkiNia6/hmDhMxjLLM06QDEWo2ZzXE3GqWaL9bI4j+TwWHG4gtM4ZVfEv1v5
	 JP09edUxkx6nI9Fg8a6vWVs4v9rlGM+oCg67G+Xga94HFpyFaRiqaN3ZYC80Cz48ml
	 GzqyvjbE0oD3A==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Mon, 31 Aug 2026 18:13:01 +0300
Subject: [PATCH 1/2] docs/core-api: memory-allocation: add k[mz]alloc_obj()
 and clarify kmalloc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-docs-memalloc-guide-v1-1-547718c274c1@kernel.org>
References: <20260831-docs-memalloc-guide-v1-0-547718c274c1@kernel.org>
In-Reply-To: <20260831-docs-memalloc-guide-v1-0-547718c274c1@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-Mailer: b4 0.17-dev

Since v7.0 the most used memory allocation function is kzalloc_obj().

Update hte memory-allocation guide to describe k[mz]alloc_obj() family
and make kzalloc_obj() the first answer to "How should I allocate
memory?" question.

While on it, clarify description of kmalloc() size limitations.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 Documentation/core-api/memory-allocation.rst | 30 +++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
index 0f19dd5243239..8ecfa4d35f4f5 100644
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
+a chunk that can be allocated with `kmalloc` is limited by `MAX_ORDER`, the
+same limit also applies to the page allocator.
+
+Internally, slab allocator differentiates allocations of different orders and
+delegates larger allocations to the page allocator, but for the users of
+`kmalloc` family it is entirely transparent.
+
+For large allocations that do not require physically contiguous memory you can
+use vmalloc() and vzalloc() family.
 
 If you are not sure whether the allocation size is too large for
 `kmalloc`, it is possible to use kvmalloc() and its derivatives. It will

-- 
2.53.0

