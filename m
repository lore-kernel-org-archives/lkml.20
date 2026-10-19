Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97DB3E49C8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409466; cv=none; b=qS8R9iKbb2+L7Ks+LNVJe5je/ipDBl+1hEn5ovTEM1C2Jpwqoqh16ExjcUlnLP/gJySYkMWxewJaicjM/N4y4QQ5BE+O3PuLrvm94MKN1ybiZqBPYQe5GlZPGDPNuwSgZ98HGIY+49QBmbYBI6El6/QT84SCL2GyUsLw4de3DMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409466; c=relaxed/simple;
	bh=60NRdnnALyVw7SO5ru5N9ydAb+hg83KllVV4HdxnR5U=;
	h=To:Cc:Mime-Version:From:Message-Id:Content-Type:Subject:Date; b=cdgC8fYOfciOARd3WlRH24wR/w2+an6xZdd5i6H7VON/tzvyvZPptTmG177ZXci5BuVlRFfMTb+bBDH6uRXcFSg4bzReCrFPD2tzETcOglXxW0nNbkBLOiGVh34SdNRW6dIxcotuOXAddMFHf/xSyC1myNY3BgxQtu6tPEj2XXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jbTZpGmS; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jbTZpGmS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792409456; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=DI7kK83J4MCMLzyHSrOcI7YxD9ZT6Sivdf3ckBQTOXY=;
 b=jbTZpGmSuB6PI8K8hQBxeU8k774coYmL/rjNCthoQXbTJ7cIXrapP0UNLTw1ukigqNQxAW
 +Cg1dysJHhTz79AqnRzDsedIGxRnL/sJoh1vgwr1l9s//R8n32GXIDjS3xwwDoyUv5nCqk
 IeIVW8aed1n1FVxkAfcxJOacyUuimPCHUxuQXXp316yNwJARElHDV++xQmGITInAp4R7PA
 1VAsCMVYVI/6pblvC9/VqZ/62UImgYPydpyFv4yb+fFkORjQlPV7SWCvMVapkXufuEC9Lz
 QwIUUVKm30wjfF8C0eSD981r6H55YUV2MsVqZWC/ieZO+CfB3EmMJJhROf03Og==
X-Lms-Return-Path: <lba+26ad5ff6e+a35c4b+vger.kernel.org+lizhe.67@bytedance.com>
To: <muchun.song@linux.dev>, <osalvador@suse.de>, <david@kernel.org>, 
	<akpm@linux-foundation.org>, <rppt@kernel.org>, <peterx@redhat.com>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <20261019113034.97690-1-lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH V2 0/3] mm/hugetlb: fix mremap bugs
Date: Mon, 19 Oct 2026 19:30:31 +0800
Content-Transfer-Encoding: 7bit

This series fixes a few hugetlb mremap bugs.

Patch 1 fixes the return type of move_hugetlb_page_tables(), so large
hugetlb moves cannot be truncated when reported back to the generic
mremap code.

Patch 2 disables hugetlb PMD sharing for UFFD missing mode, because
UFFDIO_POISON can install PTE markers that must not become shared PMD
page-table state.

Patch 3 fixes the recursive i_mmap_rwsem deadlock in the hugetlb mremap
path by avoiding the destination PMD sharing allocation path while the
mapping lock is already held for write.

David Hildenbrand (Arm) (1):
  mm/hugetlb: disable PMD sharing for UFFD missing mode

Li Zhe (2):
  mm/hugetlb: fix mremap move length truncation
  mm/hugetlb: fix mremap deadlock when PMD sharing is possible

 include/linux/hugetlb.h       | 18 +++++------
 include/linux/userfaultfd_k.h | 13 +++++---
 mm/hugetlb.c                  | 56 ++++++++++++++++++++++++++---------
 3 files changed, 60 insertions(+), 27 deletions(-)

---
v1: https://lore.kernel.org/all/20260930064308.58159-1-lizhe.67@bytedance.com/

ChangeLogs:

v1->v2:
- Add a fix for the newly discovered move_hugetlb_page_tables()
  return type issue.
- Disable hugetlb PMD sharing for UFFD missing mode.
- Rework the mremap deadlock fix to zap the source range and let the
  destination fault path populate or share the PMD lazily, as suggested
  by David.
    	
-- 
2.20.1
