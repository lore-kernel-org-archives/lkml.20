Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311418;
	b=SaVRTmuuW2OxbhBkbY7ne3h9KI3bcxh3QXABV2Ljt1gPNNOGhLx2amGt2Xvy8+z2irT/
	 ZVjETNPj3cWpZPwiI4hWAHk/J8Qoz3mziFWNoJwXCaikwMD1Mwaep/7ah/EjTNKnKK4ot
	 Z6OD+7TUN9N+BY0mnWdva2h+oAFfufzY9lmw9pv+F+/U5TU2gR51RzNjPyESxAaKKWy6N
	 qfxuPpCplJxDBR4SOd4jBc8e3sWzwGZ8vsdYA4wkssJcKKoo6EVbOQQgbjP96CYmRPazX
	 rTQo+fhPjW4rZfZTRtiY9lP0GEy6MZhi+fhAe8t85s2Ifpsjmhk6pdWAKGFPJur2ONA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311418;
	h=DMARC-Filter:DKIM-Signature:X-Lms-Return-Path:Content-Type:To:
	 Subject:Content-Transfer-Encoding:References:X-Mailer:Cc:Date:
	 In-Reply-To:From:Message-Id:Mime-Version:X-Original-From;
	bh=O7PTjUyc3KTKqk0pH/vhoZcDfD8UpwLbbvm2vjkTKH8=;
	b=ErV3v1iV7N2++TpKzAYmzk++qN6LpPrJid6dLsbc5ji3iKrS/dPh3cpT8ucxhlPg+ZRu
	 rm8TmDc8yDHd2P9km54yK/s/WyIpVGetdjDyXson95nPKolqYk2mO7R+QiwgUdGVpImn0
	 JkjI/eedAMif1Y6oAew0KAMkDIKBXP2dUcM6Pao+jv0YI81s+sElveRLob7TYaHsvBMOo
	 /5glcYR8v+PMOA9zjCwDEG1osAu9xB5yFhOL6hKveG0bvq/iGe0kl7uB92zKKIVGd7l3u
	 eOgmgT7XHj+P3P5pb0gK05s00kHue3ur0ccDWcfFO40AYeR4MK9UQ9mM1OniDaK2KhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=HNCe1CRu;
	arc=none smtp.remote-ip=209.127.230.115
Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77BA606C619
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D77BA606C619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=HNCe1CRu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794311412; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=O7PTjUyc3KTKqk0pH/vhoZcDfD8UpwLbbvm2vjkTKH8=;
 b=HNCe1CRuEG9MNc5tpC4kvFCMx9JA7+Q26Y9Yz0jVqsnbaROSFCaEKy0MLrArFqepGZLM57
 w/j4DWZncgJrNvCDkF/bijYaTPO/cDTg6T2fupHBdw8Hm92Ci1kbaqEXKgJb9rgBFjshdF
 JE2AFivEnCTGYL9i0E0xFbX1dZPsJO69yeBKpdl5c4n7Hwi77RX6vUHMBhK8aZNdo6Pxef
 tJqEjZC2bQDt7DTuXvRwXDv92zx1/mKi6f+36HOStwNwGbY/ifoWwRP43gFM+5sruS4aFZ
 ScUTdnE0kOxAWo3+MoNDvdpWQ/BkvkFd9VggU/skt/zcIQUj85+RnTI270wvfQ==
X-Lms-Return-Path: <lba+26af304f3+9f7137+vger.kernel.org+lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
To: <akpm@linux-foundation.org>, <apopple@nvidia.com>, <balbirs@nvidia.com>, 
	<david@kernel.org>, <muchun.song@linux.dev>, <osalvador@suse.de>, 
	<rppt@kernel.org>
Subject: [PATCH v2 2/2] mm/hugetlb: optimize bootmem hugepage tail vmemmap init
Content-Transfer-Encoding: 7bit
References: <20261110114859.76343-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>
Date: Tue, 10 Nov 2026 19:48:59 +0800
In-Reply-To: <20261110114859.76343-1-lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <20261110114859.76343-3-lizhe.67@bytedance.com>
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

Boot-time HugeTLB allocation has to initialize tail struct pages itself
when HugeTLB vmemmap optimization (HVO) is unavailable or fails.  For
gigantic pages, this can cover a large number of tail pages.  Most state
installed by __init_single_page() and prep_compound_tail() is identical
for every tail page in the same huge page; only PFN-dependent fields need
refreshing.

Initialize the first tail page normally, copy it into a local template,
then initialize the remaining tails from that template with
memmap_init_page_from_template().  This avoids repeatedly doing the full
__init_single_page() and prep_compound_tail() sequence for state that is
identical across tail pages in the same huge page.

On an arm64 QEMU/KVM guest using 4K pages and 64 boot-time 1G hugepages
(HVO unavailable on arm64 in v7.4-rc1), the measured fallback tail
initialization time improved by 36.43%, measured with a temporary
jiffies-based printk modeled after the existing timing in
memmap_init_zone_device():

  base (v7.4-rc1):  318.4 ms
  with this patch:  202.4 ms

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
Acked-by: Balbir Singh <balbirs@nvidia.com>
---
 mm/hugetlb.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 630c96cd1e88..3f6731161d77 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3223,6 +3223,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 	enum zone_type zone = folio_zonenum(folio);
 	int nid = folio_nid(folio);
 	struct page *page = folio_page(folio, start_page_number);
+	struct page template;
 	unsigned long head_pfn = folio_pfn(folio);
 	unsigned long pfn, end_pfn = head_pfn + end_page_number;
 	unsigned int order = huge_page_order(h);
@@ -3231,11 +3232,20 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
 	 * we must initialize them ourselves here.
 	 */
-	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
-		__init_single_page(page, pfn, zone, nid);
-		prep_compound_tail(page, &folio->page, order);
-		set_page_count(page, 0);
-	}
+	pfn = head_pfn + start_page_number;
+
+	/*
+	 * Seed a template from the first real tail page and refresh only
+	 * PFN-dependent fields before copying it.
+	 */
+	__init_single_page(page, pfn, zone, nid);
+	prep_compound_tail(page, &folio->page, order);
+	set_page_count(page, 0);
+	memcpy(&template, page, sizeof(template));
+
+	for (pfn++; pfn < end_pfn; pfn++)
+		memmap_init_page_from_template(pfn_to_page(pfn), pfn, zone,
+					       &template);
 }
 
 static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
-- 
2.20.1
