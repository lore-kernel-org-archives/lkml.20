Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794129805;
	b=SJpx11VHXlOXprFc3aau9cJT/8EBxVblEHSEyBvxSIOZ2eOdXOdksdeFTi5ZLWzW5JA8
	 ifDl9o74ZpqS/zr2vqY8O3S+0IgAiEJ8zLyjiOmiahqVneG2n9+Ut8BMzqPl1KXiNdzqV
	 lJjg4o+P0L3bPWrCsyQNnFQZVQXsjfhKfIZgSMmUQDxTqsUNQD/skmWhK0r4m7WwUamTt
	 frogkjFKlnczzMfJmzpTn2JM+FrKbtax73cL3grvYMQ/CxCzKsqLir0rwZNdWCkY4F9B0
	 iDoyyvi5AJlkJiW7zWm+t8n27W/OrY6xOsKMlHAhA6vDYUCYgz34YN2Xxn2qE6gaSXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794129805;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5XXct/mS8QSJCzfaXHvfDvD/GjABqbPTOqaOMdXOtqQ=;
	b=KgKjcBLvOIP0UqB9Yd3O/1Cb6SY8hzU1vZ2mwlSUoYq/TxL9CVIywOGKPtI2qL4vKrOu
	 9FTzg5AcqaLMD0q8m2FVNyjC25392o2/ALt2KVLm2Q+BHiCxvrOrlW8QWwJBSAL4ISupc
	 SmogrrBHMGQDe/swOdOLVzCLCaLcnR09ftb6VVI7Yj4b+nm0JnxJljajOF/tfD4duWcHM
	 QXce21zmXS+gS7k5eyMGz0yqQzIdb8BdDhSoMQv9KFm4+lJzjhu3GrFgd0XmgmcaaG5fW
	 Mg9Lw8AzLe3jwUP9AhY9xIY3ECVkcjRNF+NgYP5NF++SLnOF0Mflsb63XpVduJO8OtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K82No4gD;
	arc=none smtp.remote-ip=91.218.175.245
Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC07606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DC07606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K82No4gD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5XXct/mS8QSJCzfaXHvfDvD/GjABqbPTOqaOMdXOtqQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794129802; v=1; x=1794734602;
 b=K82No4gD/U0EDL8G5b0U3E/LJ/m2ZvtIurq4uACX0LgP99VkFG0/tl/mLp9yB/4+LZc8Oqyx
 y91WHpBUYPqB+EC56RlWaLqSTWEwxtt9cN3p4O9UVS6Ss8cvT+MH9gSuujZ94cxLHGxpsZP3usU
 bGtGN4oEaj5k9niDGR5r6uZ0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fe3ad667d8daeff1;
	Sun, 08 Nov 2026 09:23:22 +0000
X-Mizu-Trace-ID: fe3ad667d8daeff1
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	qi.zheng@linux.dev,
	hughd@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm: don't allocate a page table under RCU in do_set_pmd()
Date: Sun,  8 Nov 2026 17:23:15 +0800
Message-ID: <20261108092315.89639-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261106-khugepaged_set_pmd-v2-2-d2457b5e377a@kernel.org>
References: <20261106-khugepaged_set_pmd-v2-2-d2457b5e377a@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Fri, Nov 06, 2026 at 01:36:13PM +0100, David Hildenbrand (Arm) wrote:
>do_fault_around() skips PTE table preallocation when the PMD already points
>to a PTE table. A concurrent collapse can then retract that table and
>clear the PMD before filemap_map_pages() locks the new PMD-sized folio.

Right, having a PTE table when we check in do_fault_around() doesn't mean
it'll still be there later ;)

>filemap_map_pmd() can then call do_set_pmd() with an empty PMD and no
>preallocated table. On PowerPC hash MMU, do_set_pmd() then tries
>allocating a PTE table to deposit. But filemap_map_pmd() calls
>do_set_pmd() under RCU, so allocating from that context is not good.
>
>This race became possible when retract_page_tables() stopped taking the
>mmap and VMA locks. Previously, those locks excluded retraction while
>the fault was in progress.
>
>Add a may_alloc argument to do_set_pmd() and pass false from
>filemap_map_pmd(), so we can fail with VM_FAULT_FALLBACK instead of
>trying to allocate.

YES, just fall back and let the regular fault handling take over after
leaving RCU.

>This issue should be fairly hard to hit in practice.
>
>Fixes: 1d65b771bc08 ("mm/khugepaged: retract_page_tables() without mmap or vma lock")
>Cc: stable@vger.kernel.org
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>---

LGTM1

Reviewed-by: Lance Yang <lance.yang@linux.dev>

Cheers, Lance
