Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950048;
	b=Losk0mURam0W4KIDEpw6HbbW3faYCUDIMbDwINmAPB7vQJ9Fc8GXccsB432Bt7GoRecE
	 U4wuhqbfWxHNMjg1Jzvs6HozjLGOnqHG3GBPXrKJMCqJ0cZoRrWL6OwM+5bxtYyFLO4p5
	 2Jp/T91K4aPAAkbsPtShgYYhCAHEexdSWrSdtZTeDW8uCu+OHhKecIVWdoP9OqmRUKk+z
	 XVf/hsT5/XBSVx8azUKxOOvHyahhh1YxbtKhrD/6EkFmVaT3HvgrAsUnQ3Zk6ouE+LhaC
	 4VJ7QoErHYRmMq0/BkRaC3YiUp7RtWPUKkjcrezz9xY3pgjEYnIIxsrGy+P59NI36Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950048;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=3RNZWA4Vw9nvvnFumtjjNtTb4RFaUcDB/rCF/xLRA7k=;
	b=UZJt5RDDT749GQcLRnv7tvDiiHVe6X5yQLfzDQOMn0UbTZQIdTYGiSAhKNhsctAyUoeL
	 QKjTYrRCKSipkR643qeKdNzzR/1i6mFKGXIOIdFuduPLCTOwZy1+pX9oxWcCncHJ82Gkt
	 0ek8aTvQaLPy5kGiMN1b6fIWr02p/rxUIKV6KbS3If17E/zld8ZL3N9C9TJTHbXlgLm8j
	 ZYRMazgvJjzIjmA/LFET/yM64smGDFJqnMIwRIUsxI/e2oWN0XcI7z/uwh2ZDVrdI5Cre
	 hbJUfTYdwbQT6FbdRAKYyl7+9ymh9nhkdfu4JPDaNY/SYTzpeyUA8xlL9QPxFboh/Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jqs8+H7i;
	arc=none smtp.remote-ip=91.218.175.198
Received: from mta0.migadu.com (out-198.mta0.migadu.com [91.218.175.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C43606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32C43606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jqs8+H7i
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JEPOtefzw+ZIKLKGXFOvsCze207bnrZQqzXanSKG5k4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792950034; v=1; x=1793554834;
 b=jqs8+H7ipL2rCVjv2KfyGevaTnRgSXzxJNvdmh8xNS0rSuxyt38jbF3CPUAP/Sy7n/ikX9nW
 ntVExNRq36W/xZVM7Z6HoP6Z6E/K2hnGjV7rpqEuzJLvPHio1K3eGLgAjwJK2JIfbP45Dgh6ryK
 UNKwF91MISUSVdDuuuRlpacA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id c2b717936bb992ce;
	Sun, 25 Oct 2026 17:40:18 +0000
X-Mizu-Trace-ID: c2b717936bb992ce
X-Migadu-Flow: FLOW_OUT
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Subject: [PATCH v2 0/2] MM: Tighten control over zero-page remapping
Date: Sun, 25 Oct 2026 11:39:45 -0600
Message-Id: <20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM7QpAQBCF4VvR/La1Jra4FUmWwZCPdpCSe7f4+
 XQ67wVCjkkgCy5wdLDwMntgGEDdV3NHihtvQI0m0pgoG6tRprLl80CFttUGKcU0NuAvqyM/fLm
 8+C27Haje3gbc9wNdCsU7cAAAAA==
X-Change-ID: 20261025-b4-ksm_fixv2-2bf062e92946
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Yu Zhao <yuzhao@google.com>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Usama Arif <usamaarif642@gmail.com>, 
 aarcange@redhat.com, "Nico Pache (Red Hat)" <nico.pache@linux.dev>
X-Mailer: b4 0.17-dev

This patch series fixes a bug in KSM where the pages_to_scan limit is
bypassed and the policy (use_zero_pages) is ignored. It also gives users
further control of the zero-page remapping that occurs when a folio is
split.

Commit b1f202060afe ("mm: remap unused subpages to shared zeropage when
splitting isolated thp") added unconditional zero-page remapping when a
folio is split. This was sold as part of the underutilized shrinker, but
has a larger effect. Since this commit, all splits do this zero-page
scanning and remapping, even if the user has the underutilized shrinker
disabled.

This unconditional zero-page remapping was also problematic for KSM, as
when KSM would try to merge a page, it would split the folio and the
zero-page remapping would remap all zero-filled pages to the shared
zero-page bypassing the use_zero_pages policy. When the user had this
feature disabled, KSM would then waste cycles scanning these already
freed pages, causing little progress to be made, and KSMs performance to
degrade.

In this series we also gate the zero-page remapping behind
split_underused_thp (the sysfs for the underutilized shrinker). This
provides users with more control over this behavior, while also preventing
the KSM bug when it is enabled.

V2 Changes:
- Dropped ksm_is_running() and its EXPORT_SYMBOL_GPL (Lorenzo).
- Replaced the v1 approach with a narrower check:
  introduce current_is_ksmd() to detect ksmd and only skip zero-page
  remapping when the split is triggered by ksmd itself. This avoids
  disabling the underused THP shrinker's zero-page reclaim on VM_MERGEABLE
  mappings when the split is caused by something other than KSM.

V1: https://lore.kernel.org/all/20260609114619.144416-1-npache@redhat.com/
RFC: https://lore.kernel.org/all/20260508170509.640851-1-npache@redhat.com/

Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
---
Nico Pache (Red Hat) (2):
      mm/huge_memory.c: skip zero-page remapping when underused THP shrinker is disabled
      mm/ksm: prevent zero-page remapping during ksmd-triggered THP splits

 include/linux/ksm.h | 6 ++++++
 mm/huge_memory.c    | 3 ++-
 mm/ksm.c            | 5 +++++
 mm/migrate.c        | 3 +++
 4 files changed, 16 insertions(+), 1 deletion(-)
---
base-commit: a2abad0d7f453cc9902fc8bf7b871db5563a652c
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm mm-unstable
change-id: 20261025-b4-ksm_fixv2-2bf062e92946

Best regards,
--  
Nico Pache (Red Hat) <nico.pache@linux.dev>

