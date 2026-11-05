Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880403;
	b=uGNZnsKbq76VxptZFIt6pIZofjBZbz9YXjnW3ctAxM+Gs/sXvYb3XU5w5UzSE3Xh8Wg0
	 oiDtVg0Sn5EK0Pxn1DbCKcH1HskCJ/z4hXIu7Y+gwz1AOrNQ6GitBD65gsSGvyrzZb3RP
	 hjcIuPtv1wSaVyNeXcl79BdkcBcKNA4gl2H5+WP/ijGkImPpRoDkIuG7qmJ9EDoMo3/mA
	 iALSDH6TlNMwl0VXUszKW7pJ27KmIJdFl8JrGZ5yP7HGFLE/xoY3vXPeIedUD7CM/YUqJ
	 N139vwSe8EgioAnfBNyEvarKDb1dcZIUpElMB4I8I4suMgX7iOhdbzmciFclHFAIgcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880403;
	h=DMARC-Filter:DKIM-Signature:X-Lms-Return-Path:
	 Content-Transfer-Encoding:Content-Type:Cc:Mime-Version:
	 X-Original-From:X-Mailer:To:From:Date:Message-Id:Subject;
	bh=F2Dj1yflI9lMbHlyR4uYrdt196P5usgq/G7TmvVEXEE=;
	b=08+agBNckqqn2UzKH8f3hib9wZYNz+8nJZWamWMWqxM+6oFnQnv0KZnIT5RfJxYS927L
	 f0ZLGRJnQk9+fYJ5ezDogC80QYxfAZMpQJE5iR/HaH8Io8rpZOwB3heou8mcFHGqJ51bZ
	 z+cE92KVu8iZ1vC+Imkpg5JPVDX9FKyQyuPXDVA2WLXGg3yxXAxtpNIcLlBZP4Mg1EZ7q
	 YNqnlAPe42l7iPKk9JiGyb5hByPPdFj81NGtS1eVp1GmO1E1+iif3cb3uoFxGRfIVXPI4
	 KIm4hksU3++DDKe/OANbyaCn3aeg6lxi8rbuXca5mGNoBV3phUp8Px80zTpl0AHUOEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=IC0BVDBU;
	arc=none smtp.remote-ip=209.127.230.114
Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0995606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0995606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=IC0BVDBU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793880396; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=F2Dj1yflI9lMbHlyR4uYrdt196P5usgq/G7TmvVEXEE=;
 b=IC0BVDBU1YVxcV4CB1HjqP36Ym0X7BE/y3UauVeUI1wjAejdk1itEfAcsvT8vmHCvC2bY5
 6DipCSiBtnCxJNjL1rraJNtz0CCylNcWVLUsFo8Py6yb0/rZczodL7VuMnqaxp7TLFD3Eg
 fw74LJ+pB5daUR6yJTvnsYHt8UO2YTyxE+Aaf+RhEBddIVI0hq/aTWP0xoN8+xyAVD4xVD
 Xm1UIsgXEbJcs36eu1LhP+0/keBsbu0dQnXxUQG4uYw0jlOHl38m0rdkpdjsdDxN8nxwIL
 v8oB4r5uxSvDHqGY0SQ4uwVKxIa2dNE/J48PhVZeVZDrAu34Ccv/Uw6MSx4h2A==
X-Lms-Return-Path: <lba+26aec714b+538bc5+vger.kernel.org+lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
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
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
To: <muchun.song@linux.dev>, <osalvador@suse.de>, <david@kernel.org>, 
	<akpm@linux-foundation.org>, <rppt@kernel.org>, <apopple@nvidia.com>, 
	<balbirs@nvidia.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Date: Thu,  5 Nov 2026 20:06:13 +0800
Message-Id: <20261105120615.16817-1-lizhe.67@bytedance.com>
Subject: [PATCH 0/2] mm: optimize HugeTLB bootmem hugepage init

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

  base:             318.4 ms
  with this patch:  202.4 ms

This is a 36.43% reduction in the measured fallback tail initialization
time. The temporary measurement instrumentation is not part of this
series.

Li Zhe (2):
  mm/mm_init: factor out memmap_init_page_from_template()
  mm/hugetlb: optimize bootmem hugepage tail vmemmap init

 mm/hugetlb.c | 23 ++++++++++++++++++-----
 mm/mm_init.c | 29 +++++++++++++++--------------
 mm/mm_init.h |  2 ++
 3 files changed, 35 insertions(+), 19 deletions(-)

-- 
2.20.1
