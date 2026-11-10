Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311375;
	b=Yuo4F1Jx2J51YfSt56TZdbSi1cL5XSXp5WPx5ZFFcE0uwiUXkA2nnLUiUPg3z4lQDbcn
	 aRYqT4aL/hhH4bgZl9f2OGbuOgMOFUqqZpO2MmDVcdxrgLAraxlsHG2RH6K6YctcII5UW
	 sSpAv3cqQ9rO91pWdpKOVFfjbCzn3XnD3uXS/6/LU06ahLpGNnXrmiAV9iRYtlSRjjrjb
	 dgaaLzkvfu8x1OhkeXP+RJdVosmWnT0YzDIFklyR9FuDNvAr9iiIviUpTONIyNGemUB10
	 I3GVL05aze+w4iGnSUKWklrf0+0XEWmbORP4d+VKqeRWJ7yYnT4shMxTG2stzG7tdGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311375;
	h=DMARC-Filter:DKIM-Signature:Subject:Content-Transfer-Encoding:
	 X-Lms-Return-Path:Content-Type:To:From:Date:Message-Id:
	 X-Original-From:Cc:Mime-Version:X-Mailer;
	bh=38/BCZiYFBdrUt+84du0Qf+VwsVgj9AVlbyv2JcWo+o=;
	b=mXVRilgvZZOLF94K2kxhLFyYmvVOJeEt+vT9eHMOVk4s2CiYYI78u7RPhc9te009g3Mf
	 WcSWKKB8hiRaW2nObbINEjW+GgUOqhooTFUmnwRIb+lLLlaD2cwMMSY5jMJJirvk+aHdJ
	 S80QYug2vQcBkEWUF8QbJC8RLjux/H7dSpagc6mPKTksHuy0PNPrgzSwxCOIO8M7vAvIW
	 Gem7y9UKbzWrnGvmzlzpaCDW2jrNetRITxNYFr1CvmkpKPKCDF6DAC9R1pfJbrUw/wLTf
	 PY+WeM4IbAekwtp5KAxE/E/dr3yztB+1Hlpy1+iBN/HrEtNmfAbxlArlAuvj82RYIVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=P9auZXSc;
	arc=none smtp.remote-ip=209.127.230.114
Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EEE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01EEE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=P9auZXSc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794311367; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=38/BCZiYFBdrUt+84du0Qf+VwsVgj9AVlbyv2JcWo+o=;
 b=P9auZXScAkzfKb1iAxOKhkv8KXL+3Sc5fNltGKgq8vM1gYeZe9KWMRYqqlXKcs2cRrkYJm
 HNgtrxfHstm9BjWdQzQoJtwpqamGeAJ7UmcxiSnyBlI/amClShNeJht3xWXBrkmY7+BQCa
 rH98Bc6Jl0ZV6Ae7G7EYxSiB3/HbbaV+9/PkAt1tkLIzGUG3JIzL9KbP7bokDFl5hxuKVN
 IUwWPCfJyU+Zrn7yA1jtfKp5JXRJKOMzkNVyjgpGf5ChSRK9Dr+KEoyVFiRh9OvKWgSViU
 RP6fsqLdwN+kj3h3Vai/Pg764H6SRIlMo1i4ZnSdXWP0CjY+1ooESalQuRtEqw==
Subject: [PATCH v2 0/2] mm: optimize HugeTLB bootmem hugepage init
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26af304c5+65d7f5+vger.kernel.org+lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
To: <akpm@linux-foundation.org>, <apopple@nvidia.com>, <balbirs@nvidia.com>, 
	<david@kernel.org>, <muchun.song@linux.dev>, <osalvador@suse.de>, 
	<rppt@kernel.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
Date: Tue, 10 Nov 2026 19:48:57 +0800
Message-Id: <20261110114859.76343-1-lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2

This series speeds up the fallback initialization path for HugeTLB tail
struct pages during boot-time hugepage allocation, when HugeTLB vmemmap
optimization (HVO) is unavailable or fails.

Patch 1 factors the existing ZONE_DEVICE template-copy operation into
memmap_init_page_from_template().

Patch 2 reuses that helper in hugetlb_folio_init_tail_vmemmap():
initialize the first tail page normally, copy it into a local template,
then initialize the remaining tail pages by refreshing only PFN-dependent
fields before copying the template.

In the earlier discussion, Mike asked whether the same kind of
template-based initialization also helps the ordinary struct page
initialization path:

https://lore.kernel.org/all/akfB6Qe-jKDEMUxz@kernel.org/

I tested that direction as well, but did not see a measurable benefit
for ordinary struct page initialization. The measurable improvement I
could find is in the HugeTLB bootmem hugepage tail path, where gigantic
pages can require initializing a large number of tail struct pages when
HVO does not cover the allocation.

Tested on an arm64 QEMU/KVM guest with 4K base pages and 64 boot-time 1G
hugepages. HVO is unavailable on arm64 in v7.4-rc1, so the fallback tail
initialization path is exercised.

Results averaged over five boots, measured with a temporary
jiffies-based printk:

  base (v7.4-rc1):  318.4 ms
  with this patch:  202.4 ms

This is a 36.43% reduction in the measured fallback tail initialization
time. The temporary measurement instrumentation is not part of this
series.

Li Zhe (2):
  mm/mm_init: factor out memmap_init_page_from_template()
  mm/hugetlb: optimize bootmem hugepage tail vmemmap init

 mm/hugetlb.c | 20 +++++++++++++++-----
 mm/mm_init.c | 34 ++++++++++++++++++++--------------
 mm/mm_init.h |  2 ++
 3 files changed, 37 insertions(+), 19 deletions(-)

---
v1: https://lore.kernel.org/all/20261105120615.16817-1-lizhe.67@bytedance.com/#t

Changes in v2:
- Add a comment for the template-before-copy ordering, as suggested by
  Muchun Song.
- Drop the empty-range guard in hugetlb_folio_init_tail_vmemmap()
  as suggested by Balbir Singh and Mike Rapoport; current callers are
  expected to pass a non-empty range.

-- 
2.20.1
