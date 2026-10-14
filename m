Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4AB55D89F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997950; cv=none; b=uJ7l64BP7SSQkwtgpYIkhh2r17hJPH39kP8XDEhlOWZTS9bFC1TACFtlQDr0YPs83eWhCIf3cXIvAXZravxeNmry2adirUwhDYSjbdWVi/2kzMzPh2L+UrIDSKcx7M5E+uwG7+Yco6GuF4cX2W24HcVii6F71l7dFN9sP8r+FLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997950; c=relaxed/simple;
	bh=vuRDYKdQemt3XtMpCgKYhueeS8zqwIHAtvoLZdzwe1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AkGSy5pynYyrS43p4ibaS9DwQ7+LBGHKzanSKErBn/Qsyd8D6h0ZXxnHQUMSaliMqiJ2kOY3rVLgGSckUEpcU3qN2DG+0cTofM3TKA+WE67Tl8+KMJDeDxgIxjhVo+G3jXDaOPlOK4nUwFwMQJEkaSA9JS47taOnMeVKujxWuug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UP0d10/7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UP0d10/7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD5C1F000C8;
	Wed, 14 Oct 2026 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791997944;
	bh=ghheLVaJ/gX6nEonLl9gHN6oOmaGkKtSAgsx7MmKQ3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UP0d10/7ajJS7uDLbamTgU+u3mYlInh1ovqKT9AsZnSfLXL86NU5zXtC6bucBOFmj
	 x8bTEPjZigb7Uoyp4/1Ml8bqcnGi68WfEA1HxEyb75ziiRBiHqf74r4I9io0+/X50d
	 QfF6bYbrGTaLnJOMnpPFW1VsmoHrrMYUEpP62QNpwxvmayXJilUZpmUe+L0h17q09D
	 HdQK7UO28IWCXXIf3BIXMd7yADj3SHGRZWCkEm66K7uNS1WHL3huReMn2BD0gaGZQz
	 XaQABApnybxpv0NmBmOQW7KgonSK8wsYrvtrl1HB1eaq62iIlp5vHPovvSxXOv2Fv3
	 qgu31KRDDqP4g==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 78FF0198003A;
	Wed, 14 Oct 2026 13:12:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 14 Oct 2026 13:12:21 -0400
X-ME-Sender: <xms:87fPauR2qh6wpjajOfP3uTiSlFKQaI_kIB9c8qC86zn_MP-wVi696Q>
    <xme:87fPavs12tDoc9VHQmgaEfnczZhhShtwu10LezhoTWiYy_CTSEL84GFvy7WDlALks
    wbXt2OEccPiSi5RaxbL446D-wF-Mxecvs4moCw6-tnxUAdyIhMBSec>
X-ME-Received: <xmr:87fPah8arimKiYMTEZFX7DmcYeyhtT0rzL9vTbibn-JBrRhtI-5wOW3lPgU>
X-ME-Proxy-Cause: dmFkZTFwiWz5xia+xtfntThlm+O9tjGeMfOg5p/zL8VYVtsXULwc8jTBr08jVHcQEsbhxK
    TMndqLDMMqjXpLlrcd2DNZw/axYZ8/70s9fvQ++ndGURDbYnj9+jE2pWTYgDyBIy7T7c+g
    1FLBAJg8ViAMIIR0WeG0kvIsAspTPwKIIiDbhgldWlfNpOyYl1MvyWfNinOTpMZ090jALU
    i/RcA+fWUVj+1PXpLp5EB/t8KfPsMi6C8/Rktwnc+ddxJOjK8acgquDVoYbmvcpcPF5ZbL
    fP/sPU/D8T1xJDgjYxA59CqeA0LY0DgbH9ErVKg6G21806a9Ona+7e7I9CP057PccJyjlb
    RJunY59V05jTYe7Q7N4LTguEDLhUxjZiw+9otdXTimDDyUnj/gBdnPlQgwkrbck+IfIPYW
    82hBftchyULhlpGWaSd1L2FLS0pGRNApT7nCyS5XHIeZ0QXGmAH7sRzsYz2X38IrI1Tkml
    qSo6jIEdsQYRTZnc0y2csIkaVRTjJEo0YqabWJqMGbr3SvFF2BsTqncd7voLfHu9wXlF1X
    FIX2YhqHwn8wvI7aJ4OvzR5Avh4OYZgSiqs8jHyLD4H6twj8GOLejLN13KV054UXgAZ7bi
    Ujr5U7D9yHzErSrTQhcNGLi/7VORFxIACHkANoSzwQlIiuc3HePCeVucyR1A
X-ME-Proxy: <xmx:87fPagbS0kPhq1sI-wjJ-ZzQuUj3075uzsEJv5b-zKhPbj4Ln13JFA>
    <xmx:87fPalqDvCcoOr1PXadOHyHc3n-fVyoocUucQmsZq1nYAabWWW_qMw>
    <xmx:87fPagZlZwnvJQNRGa7T6bY23o-6I_hJqINTFzAHo4wFcosHgUR7PA>
    <xmx:87fPag6H8IX72uOiUxu_mv2fQ3_6nt3X_HEwp0Oh06CSg9H8TfI1Vg>
    <xmx:9LfPajSswidL2XP8AWvl-aPQRT4koNflxR3nWaIze57AAdtLVwtIwDoa>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Oct 2026 13:12:19 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v5 8/9] mm/collapse: call collapse_file() from collapse_single_pmd()
Date: Wed, 14 Oct 2026 18:11:41 +0100
Message-ID: <20261014171145.3292736-9-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014171145.3292736-1-kas@kernel.org>
References: <20261014171145.3292736-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

collapse_scan_file() reads the page cache to decide whether a table is
worth collapsing and, when it is, calls collapse_file() itself.  The
caller cannot get between the decision and the collapse.

Move the collapse_file() call up into collapse_single_pmd(), so the scan
stops at the decision.

Two things change with it.  The writeback retry re-runs collapse_file()
alone instead of rescanning first; collapse_file() repeats the scan's
checks under the page cache lock anyway.  And mm_khugepaged_scan_file
fires before the collapse, so for an accepted table its status reads
SCAN_SUCCEED; what the collapse made of the table is for
mm_khugepaged_collapse_file to report.

Preparation for splitting a collapse into a scan under mmap_lock and a
run without it.  The file scan has to stop where the anonymous one will.

Assisted-by: LLM
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 60ec7e80d554..89a4c3f5a91c 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2737,13 +2737,9 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 	else
 		cc->progress += HPAGE_PMD_NR;
 
-	if (result == SCAN_SUCCEED) {
-		if (present < HPAGE_PMD_NR - max_ptes_none) {
-			result = SCAN_EXCEED_NONE_PTE;
-			count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
-		} else {
-			result = collapse_file(mm, addr, file, start, cc);
-		}
+	if (result == SCAN_SUCCEED && present < HPAGE_PMD_NR - max_ptes_none) {
+		result = SCAN_EXCEED_NONE_PTE;
+		count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
 	}
 
 	trace_mm_khugepaged_scan_file(mm, failed_pfn, file, present, swap, result);
@@ -2774,8 +2770,16 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 
 	mmap_read_unlock(mm);
 	*lock_dropped = true;
-retry:
+
+	/*
+	 * SCAN_PTE_MAPPED_HUGEPAGE is work too: the page cache already holds
+	 * the PMD folio, and only the PTE table is left to retract.
+	 */
 	result = collapse_scan_file(mm, addr, file, pgoff, cc);
+	if (result != SCAN_SUCCEED)
+		goto put;
+retry:
+	result = collapse_file(mm, addr, file, pgoff, cc);
 
 	/* Dirty pages are worth a writeback and one more try, if asked for */
 	if (cc->policy.file_writeback_dirty && result == SCAN_PAGE_DIRTY_OR_WRITEBACK &&
@@ -2787,6 +2791,7 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 		triggered_wb = true;
 		goto retry;
 	}
+put:
 	fput(file);
 
 	if (result == SCAN_PTE_MAPPED_HUGEPAGE) {
-- 
2.54.0

