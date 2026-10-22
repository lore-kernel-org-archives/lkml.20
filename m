Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792640804;
	b=MaNDIpfBL62T3SnNmAPuERT+dhVY0Pu2eUT1BXCDfpgCICXbW6B07gC2E0xwk5mi398D
	 AH7TfU/+5s6z9cwgJYYrapENOfbx/4L9EEkHren/H4+8k1SJ5jLn4MBd8KXXFY/7vG2LS
	 6cgyEWZfLiNRFAoD3rF3tCqSXDa5CJtjOAKtOCi6/y7kpNvvUr97NTGDdV5WRBVLYYr7y
	 xS0BQsaCZrfM6/uhN+HKVsgTv7Ch8nZtxDpabLXwJLKbpYtVAsi95i8Vie6Eg8tshCcbV
	 QQB394qgrsZWtk9IzRDfFPXAlwYcm2ddgCAdIg6d5N+Rj2+lA2/PE48BGKmO+8fMA9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792640804;
	h=DMARC-Filter:DKIM-Signature:Content-Type:From:Subject:X-Mailer:
	 Message-Id:X-Original-From:Date:X-Lms-Return-Path:Mime-Version:
	 Content-Transfer-Encoding:To:Cc;
	bh=ak9Yt3ZKqjQZ+ffqqFAUaAH76ucdHQO20qi5tefMZ84=;
	b=oRLkubLxFqz7XHBb73te/CkrrNv8Afp1rx6iWRWvqQ0NOadkTQysOSF4DQZd0diOnMwW
	 5BAHHR7tAj7K1wRZ+rxa8RBFKD9Epbn7/XfJPcWCBWVGhHfZDEDTB35pbaoCvAathv5SC
	 41ARnrzm06Ds88YPAP6+HBqQWBJPwXmX3SzZiYOGZIa7/bOHiyqUuQWCpRSWSJQq8X3NM
	 XcKUuz0bqmLUF4zYibcjBYzDHOLFE8hQEr6u7C3cGpPn4llOTHeqddfY3fNuhcV7jq/B7
	 og8OAlkiXOMPNxU1tkiahtEd0m8EwteZ6xb1H7Lif+L8CkZ612D2p3YmIwXIV7+xbOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Z4uUibQp;
	arc=none smtp.remote-ip=209.127.231.111
Received: from va-2-111.ptr.blmpb.com (va-2-111.ptr.blmpb.com [209.127.231.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6750606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6750606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Z4uUibQp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792640796; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ak9Yt3ZKqjQZ+ffqqFAUaAH76ucdHQO20qi5tefMZ84=;
 b=Z4uUibQpim97ZcwRaWnxU7OlePKIYM+IHwZdxlf0JMpI19y/oamd0KcZFzRD8bcVanqerC
 8T7CLEKYY6uyCUPUZAly0q3ZUc8dAbVXtVNyrBEgqLl6olEIr2kj9AZJfaLDvATBh4cUjc
 cWroOIRPKrEl1Rr+yBZUimB4a+y/xC1AfprvDOehziXGjiL+/nAtHJXB+jtdKLJjv++wOv
 bdZFsT7Ay1EekZ4w/gpI/G8lhXmDBrZqLzxzNaWoH7VLUDPMTgudXBoxvk6MWCOFwwebVa
 KK0YsmRO+QKB5w2Q4El625gLJ2ERRk1uV0aRP34dFBMpUgUySmWb7c8up4XCxQ==
Content-Type: text/plain; charset=UTF-8
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: [PATCH v3 0/3] mm/hugetlb: fix mremap bugs
X-Mailer: git-send-email 2.45.2
Message-Id: <20261022034543.51226-1-lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Date: Thu, 22 Oct 2026 11:45:40 +0800
X-Lms-Return-Path: <lba+26ad9871a+8733b7+vger.kernel.org+lizhe.67@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: <akpm@linux-foundation.org>, <david@kernel.org>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <peterx@redhat.com>, <rppt@kernel.org>, 
	<azpijr@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>

This series fixes a few hugetlb mremap bugs.

Patch 1 fixes the return type of move_hugetlb_page_tables(), so large
hugetlb moves cannot be truncated when reported back to the generic
mremap code.

Patch 2 disables hugetlb PMD sharing for UFFD missing mode, so
UFFDIO_POISON markers cannot become visible through shared PMD page
tables.

Patch 3 fixes the recursive i_mmap_rwsem deadlock in the hugetlb mremap
path by avoiding the destination PMD sharing allocation path while the
mapping lock is already held for write.

David Hildenbrand (Arm) (1):
  mm/hugetlb: disable PMD sharing for UFFD missing mode

Li Zhe (2):
  mm/hugetlb: fix mremap move length truncation
  mm/hugetlb: fix mremap deadlock when PMD sharing is possible

 include/linux/hugetlb.h       | 15 ++++------
 include/linux/userfaultfd_k.h | 16 ++--------
 mm/hugetlb.c                  | 55 ++++++++++++++++++++++++++---------
 3 files changed, 50 insertions(+), 36 deletions(-)

---
v2: https://lore.kernel.org/all/20261019113034.97690-1-lizhe.67@bytedance.com/
v1: https://lore.kernel.org/all/20260930064308.58159-1-lizhe.67@bytedance.com/

Changes since v2:

- Add Cc: stable@vger.kernel.org to patch 1, as suggested by David.
- Use double-tab indentation for move_hugetlb_page_tables(), as
  suggested by David.
- Disable hugetlb PMD sharing based on the userfaultfd context instead
  of checking individual UFFD mode flags, as suggested by Mike.

-- 
2.20.1
