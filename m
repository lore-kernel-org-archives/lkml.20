Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397155;
	b=whCR1zPhC4i7r5jmew/lO8yCe08FVvcYoLHOr90EiWQmF/gOcOdknUryRz2yvi8QD3mg
	 WYsPhcJOhdRydb4LGFcD9bnm8Q0TXl8aBa9LkVIinPmgf2fpLfAAZeYFADNIzPAAxD0xG
	 gBjYYWcGjPmnh6VSY8oOdABDbOL/IDbX+7I82N/t0h8CQwCain7CXjo4qh/Y7iQ60aUYu
	 ngXgDFoaukAKK/5sr4dUykV9FGrEz0t3vP6yyzUM6cX/up27V5/nQ4yo5j94VQAh4xewt
	 XaMEiddDv+HuUwTFu5vUFCpY+W4GWfcmMiNwHOhNgKdGDEWe/AUWN7q+iT6RRrWQWFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397155;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=sm9PXJr5TIiyZl5zOIT5PuR1aDglg76Y9OqldJz8H9E=;
	b=h2txOat5WVnpsVBSrwsZB36bvfXRrRFejjkSnfceLokRBNdNKHYnD3FzN0ZnlvWz9U5c
	 OXGfsf+xZdeLw08xXlT17XA7S7A9VUcngpymK3wKMC0ElbAFCBEzhZKybmoqHbBPG8Lki
	 Aik9OkqW83bsvDJj7pPqnCexezUrIIYbgpymx3ME28B/93AqvweTnRzTafrxIheHT1DwV
	 00aUN3eNLRr3EX8ESa72jufogOHLpRRv2HqHplIG3OicbVQVPFkXRAwC1pHujwk/gbGpo
	 VbZxCvjj2z5rgJZCgjeHHDQML3wr6ObUz89IqByqNUbN+MEBrDWBsWp5LasjaDdWSEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="i0Eu/+F3";
	arc=none smtp.remote-ip=95.215.58.136
Received: from mta1.migadu.com (out-136.mta1.migadu.com [95.215.58.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CC0606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6CC0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=i0Eu/+F3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4Mq5z6I5/MSe2xUzwOBENm+Vhd7unCO4r5C+7Fe1rDA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794397151; v=1; x=1795001951;
 b=i0Eu/+F3b/9EIe3orqhl3IDtDiqj4w5mYalWC3I9BI2zzPkKVtmddwZ2out4xDtscItFvv4Z
 zw1nVFvdEnGmaBICuCkqy+b/02u54VlQdV1xPlQBGtCfHJA+z+BLwF0Smp5dKKDBTxDw9iHv6Ua
 wc4mCiMli/81WCRU8/mACUy4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 48df2cab8c88d833;
	Wed, 11 Nov 2026 11:39:11 +0000
X-Mizu-Trace-ID: 48df2cab8c88d833
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	apopple@nvidia.com,
	byungchul@sk.com,
	david@kernel.org,
	gourry@gourry.net,
	jannh@google.com,
	joshua.hahnjy@gmail.com,
	liam@infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	matthew.brost@intel.com,
	mhocko@suse.com,
	pfalcato@suse.de,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	kas@kernel.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev
Cc: Usama Arif <usama.arif@linux.dev>
Subject: [PATCH 0/3] mm: fixes for THP migration, swap-in and device-private smaps
Date: Wed, 11 Nov 2026 03:38:28 -0800
Message-ID: <20261111113904.650722-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains three fixes for existing THP migration, PTE swap-in
and smaps paths. They were extracted from the work on PMD swap entries
for anonymous THPs [1] and can be merged independently. Sending this
separately as requested by Andrew (should have sent them separately
anyways, my bad).

1. Avoid a folio reference leak when concurrent MADV_DONTNEED clears
   or splits a migration PMD before the device migration split helper
   acquires the PMD lock.

2. Prevent PTE swap-in batching from mapping poisoned subpages of a
   large swap-cache folio. Include the subpage scan helper with this
   fix so it can be applied on its own.

3. Account device-private PMDs using mapcounts in smaps, matching the
   PTE path. Shared mappings get proportional PSS, and exclusive
   mappings are counted as private.

[1] PMD-level swap entries for anonymous THPs:
https://lore.kernel.org/r/20261002095503.3585565-1-usama.arif@linux.dev/

Usama Arif (3):
  mm: don't PTE-batch a swap-in over a hardware-poisoned subpage
  fs/proc/task_mmu: don't read young/dirty from a non-present PMD in
    smaps
  fs/proc/task_mmu: account device-private PMDs as present in smaps

 fs/proc/task_mmu.c | 12 ++++++++----
 mm/internal.h      | 15 +++++++++++++++
 mm/memory.c        |  4 ++++
 3 files changed, 27 insertions(+), 4 deletions(-)

-- 
2.53.0-Meta

