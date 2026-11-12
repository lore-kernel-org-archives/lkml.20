Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482926;
	b=KReP2wgUYAkgsOZKrDCamRGqhoycsQPPtDEtp3rlFspWxBL5w75H8KIyEDc351noz65v
	 i04HL52xeMKfq2mZyskevgOsDmh9dfsM3LjzyPkiu/VAUrXqgP2sZiSGcNKAtK5sU6fzc
	 F4MiZo9ZEnHBzqKEQDkU8QnRps5mqI0TME8178r9j0hvm3bu/Vhb3x39fkWUvR0a406h1
	 ZWEspkZ6Wa97RE6KPlRBoVtfARLkpfYgCrgn2jonnI4WjAx0s/vvciEP8tCMgldhuANxz
	 ZViSpCJOJR+MUjjSNjgfu0r1PBvtnBr/voqEP+9ilTKi182SniIzwJBXIE+TVGSM3FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482926;
	h=DMARC-Filter:DKIM-Signature:X-Lms-Return-Path:X-Mailer:
	 X-Original-From:Mime-Version:Content-Transfer-Encoding:Content-Type:
	 Date:Subject:From:Cc:Message-Id:To;
	bh=UAn57X8Noov8dIFs+auheT8K0Vbw2KyihjU2R8Ks96U=;
	b=LdlVvCXYnb9BxMmcTaJlF/nNuN2FzYPeNLzXi/y7iF6SulZRqHbom1MLPrpf7FL0j7Eb
	 c7rQlFUxds5z9OgnN5GX60tdZ3nLfm44hM9maQ+lcXyQYSajXjgcLb+MJLCl7TeN30ySH
	 ogVIUhKK8VaveYyyfM2dcwbJ+QTx7kAiGiMwLQLbxPaIVMeStUaB3N6+DykkPxu8UZvbv
	 Og2PETkc9kwg0v9QBRAnkquNLDPqXMEeGQkvOItB0nhFTRcTmE6mPAy+q7y2f/RHAR/Gf
	 KIu43/ThaDWLO3r00b/h0/Fd3bNMufNBZVj+Kja90rFyOOoinEblmNSAuUGOir6/OMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ivtlcE18;
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5785F606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5785F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ivtlcE18
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794482920; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=UAn57X8Noov8dIFs+auheT8K0Vbw2KyihjU2R8Ks96U=;
 b=ivtlcE18Fyc/nNk4cxwLWTtHXseGvVBWbIQp6WMjMdXP6ss5Zut8HYwY9Pku6VRiUk+Zae
 sCTwc5z1PXLFMVSviRr2LXHz9oqqnrn/ogYepzKUK6sEye7WYg3MujuTLVrZZLNDGPVC/j
 suPsyuy68eq+2RaPYmOXfdYR8sumxU7Z+X9RV49bXVA4DFOHgMXWzrRMee63WwViAmfro4
 NtNgP0Sq3nj88dQxNFayde9JbICa7jtZlocL7X26RpzbcR95A0d3YbDcs0K1mDTjwhAeF1
 n9xD8UddJ8WiU0UOikCYvWjTLR4yqt0yvuYt2L+MQnOjen42O7NUyxfIBDeadg==
X-Lms-Return-Path: <lba+26af5a2e6+173a2c+vger.kernel.org+lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
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
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 19:28:14 +0800
Subject: [PATCH v3 0/2] mm: optimize HugeTLB bootmem hugepage init
From: "Li Zhe" <lizhe.67@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <20261112112816.55095-1-lizhe.67@bytedance.com>
To: <akpm@linux-foundation.org>, <apopple@nvidia.com>, <balbirs@nvidia.com>, 
	<david@kernel.org>, <muchun.song@linux.dev>, <osalvador@suse.de>, 
	<rppt@kernel.org>

This series speeds up the fallback initialization path for HugeTLB tail
struct pages during boot-time hugepage allocation, when HugeTLB vmemmap
optimization (HVO) is unavailable or fails.

Patch 1 factors the PFN-dependent template refresh from the ZONE_DEVICE
template-copy path into memmap_init_refresh_pfn_fields().  The
ZONE_DEVICE path keeps its memcpy_nontemporal() copy primitive.

Patch 2 adds a HugeTLB-specific copy helper in
hugetlb_folio_init_tail_vmemmap(): initialize the first tail page
normally, then initialize the remaining tail pages by copying that page
with memcpy() and refreshing only PFN-dependent fields in the destination
page.

In the earlier discussion, Mike asked whether the same kind of
template-based initialization also helps the ordinary struct page
initialization path:

https://lore.kernel.org/all/akfB6Qe-jKDEMUxz@kernel.org/

I tested that direction as well, but did not see a measurable benefit
for ordinary struct page initialization. The measurable improvement I
could find is in the HugeTLB bootmem hugepage tail path, where gigantic
pages can require initializing a large number of tail struct pages when
HVO does not cover the allocation.

Tested on a v7.4-rc2 base with 4K base pages and 64 boot-time 1G
hugepages, measured with a temporary jiffies-based printk.  HVO is
unavailable on arm64; on x86-64, hugetlb_free_vmemmap=off was used to
exercise the fallback path.

  arch    base      with this patch  reduction
  arm64   360.8 ms  256.0 ms         29.05%
  x86-64  171.0 ms  165.0 ms          3.51%

I also checked memcpy_nontemporal() for the HugeTLB helper, but it did
not show a similar optimization to the PMEM/ZONE_DEVICE template-copy
path.  One likely reason is that HugeTLB initializes tail struct pages in
per-hugepage chunks, while the ZONE_DEVICE path is closer to a long
streaming initialization over a device range.  In this HugeTLB fallback
path, the measured x86-64 result was better with memcpy(), so this series
keeps memcpy_nontemporal() in the ZONE_DEVICE helper and uses memcpy() in
the HugeTLB helper.

The temporary measurement instrumentation is not part of this series.

Li Zhe (2):
  mm/mm_init: factor out memmap_init_refresh_pfn_fields()
  mm/hugetlb: optimize bootmem hugepage tail vmemmap init

 mm/hugetlb.c | 23 ++++++++++++++++++-----
 mm/mm_init.c | 11 ++++++-----
 mm/mm_init.h | 11 +++++++++++
 3 files changed, 35 insertions(+), 10 deletions(-)

---
v2: https://lore.kernel.org/all/20261110114859.76343-1-lizhe.67@bytedance.com/
v1: https://lore.kernel.org/all/20261105120615.16817-1-lizhe.67@bytedance.com/#t

Changes in v3:
- Share only the PFN-dependent template refresh.  Keep
  memcpy_nontemporal() in the ZONE_DEVICE helper and use memcpy() in
  the HugeTLB helper.
- Copy HugeTLB tail pages from the first initialized tail page and
  refresh PFN-dependent fields in the destination, avoiding a local
  template in the HugeTLB helper.
- Restore the empty-range guard in hugetlb_folio_init_tail_vmemmap()
  after Sashiko reported a valid powerpc 8xx case.

Changes in v2:
- Add a comment for the template-before-copy ordering, as suggested by
  Muchun Song.
- Drop the empty-range guard in hugetlb_folio_init_tail_vmemmap()
  as suggested by Balbir Singh and Mike Rapoport.
-- 
2.20.1
