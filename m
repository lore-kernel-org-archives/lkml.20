Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACAE493621
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551142; cv=none; b=PEId5lX4XS2X/62rXQNeN+xy6b+LVlqh+B4vH3vtWSPbdbmkuQ9I5wxoZFzB3dZZvo7Dm7iNflj9Y8nt4IJ35C1uO21rO5sKA5wYMTAb2ZtFvWys61+4U4BoWuVnD1rWyQDoSFxTZmhzTQjojXoTUA9fswRaUvZQMNJR2baTFQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551142; c=relaxed/simple;
	bh=pSgO8D8VBlexfqJ0c/bp/gYa9Eq3i5ovQsr5KBYuY4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDjOSe3saiRE1lKYP1YASOrDYL3WKOvXDs/bju9MXNoSTzF4h5s0amTzuAyPvI7MpnNhF9FGngKWrW4XqCl0Hr9gZH+6Vns5ZdV4g1gNJA7Do/mJ1jKlq4p23AIe62KZF5LftnEyllHjmbRt4Os53z19gUf6bKXFe5Gz9yASyGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=mx2F1LbV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XmcWBwnG; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="mx2F1LbV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XmcWBwnG"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5BE697A0089;
	Wed, 16 Sep 2026 05:32:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 16 Sep 2026 05:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789551124; x=
	1789637524; bh=zPMRtic/KA0rSWQIkttR+MrY+d6BRRufVKkb5veXeh0=; b=m
	x2F1LbVWRpmYR0FTgvLAxaNn2+T2bxQAAHG6aICs3QArEaVfo5GiLexoOBo62f/V
	7iifFU/Wlb3dqTDwTI4jB3k8zO2Bi4K0qTpZBJaleA/GFI/u2nTm/yJVhBnxB09+
	bwqEwsYRpZZFQjngVASQB3rt1XXtWQNK6FrFr1z7tnpLOKtGK9dGlrD0X+fUlbma
	MoYNxWj+odmyakcZGoVfJoEUb5Xl/KSSu9NOwgyLOrXJ+6gTM89AgLuxmD9F3XZ5
	x2UBwSyaQ9wXYL0YAnL/ZriuA/hx2GAdylI5wrXkkQaHkwQQxUE+1tQBXPhDpYuY
	2T+kxnqLBWFLJ7hed38pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789551124; x=1789637524; bh=z
	PMRtic/KA0rSWQIkttR+MrY+d6BRRufVKkb5veXeh0=; b=XmcWBwnGDwu1l7iHr
	WPdL3luoZRRXDxnJdTlw+a8DWUzav1l88PeG5L5VO/TSqMmntZ4kObtAtL7W2Q5v
	8J/llGpCwdyqYoGo3d/COV8fO5pV+jcAa6lh8j8CCvoCoveWglru3zW3LELtfng9
	XnOepXKQzG/p3mGTPAxrqYSUuWLT071ftZihjIAlIxx6cgszU5zmQw0qJY4UbDbx
	oR6AT4qBrEAQMr1jgQxlsQdKzPsGTIyE4EWKgAoGKiXlWV2WoMp5jsLJAqn3Tk0Y
	syJIDh4BD+zD9+bLZbWkI0DjhoqB5i7O/kq1s7IJPSvp7B1u0NGrcA6W4KrNWH/A
	g1sLA==
X-ME-Sender: <xms:FGKqaslmHM0jgX0bl7djxQhnqRooWNCL8OkZw9RFnHMUbjvzqr7J8A>
    <xme:FGKqanwYATLYV6gNkF_vqE1LiwWve5pUilPWd2ku3xXtq8nkb-gJpDPzpSvJPBOvc
    pBYvJ3YAkKTQWUNylWB8av-BAtHcrsr8PGVuqEcl9I14sFpiOzl30ss>
X-ME-Received: <xmr:FGKqagxxqCPKIu0YsKQjGeuWCDRPNZJQlAu5qjz0EPW9KhITFlv6E5DeRTs>
X-ME-Proxy-Cause: dmFkZTEOpyDQEfQMjLyldXBPAs1OiAaYjuycA/zprc2XA0sZE/gLY53LzRl6wisjmJsNcj
    shXh7L3amtO3W7Dj4gJ1brhV8efHSvbbvvisq8qNCVrU/hVVqWW2fJ8EDoeL9EfJt8J4fa
    r63UA+S0A+UN3c16swmwWrTj5sK0gOy7RYH1CN+xe4D6TTQ1ncSXBFkweWqSBfk0S52Say
    Dntsl8DI3TlZwS0igZd1iO+ltDo9n3qHIbwcYcvcbVUlu6Rxag/XK6s48+7ZTTYlI2aJe4
    hkL/jN/KxntOAh39VLdXeraBW39brB+PkStvfnz0wMlwqVlAhF3nsCCzTv21LQWeSF/idU
    l90nh564IAY/gtWrLk+kl+aUclafmy+2TTeoiPxsUwjQtvuB08Yj7GKIp/DEv79v7HQN2z
    4Oz0r6NYLbgfbR4716KqKJZYkbkDiTYm1lvYjbArOgZqUc/9QdfhHsq4iQ4GCbUKeFKvRZ
    6NVlkYGPjQqi0+SmjTazQrIoAQ+tAE4n9wxGKXs/bv5faKSlnIBkz/UryooHKvu2weMhM9
    KdWzoEYl57Ubj2Z2xRHcJZK9oMdIWueTYTTybq1xGHVkdw9j5PlfHhipBuv4iJM6EEzLZZ
    e+u2F3O9EPCJU+a0r3eoVM63sJU5MRxU3/TdAD63s/H2Bl0X2JFaeTNy/YkA
X-ME-Proxy: <xmx:FGKqau_C_kUNAldv3wUdin_PzWBbywSdQKIYpgxnccycbcKFAaAPug>
    <xmx:FGKqao9sr7M8lyflJHSd5zh973DwCuxJilHvtyJdaYY7RtKP2t757w>
    <xmx:FGKqapdONtDX79aAV5mv4ZTKDz_osshX7GR-xVzHUE8POzpqCyqipg>
    <xmx:FGKqass_jiHiQ0wSCB2KJEyAZMXdzf92253YXnInDwZIV-oyP9vk5w>
    <xmx:FGKqannvFIPVgJq6e0IsolLrc9SlZCLFl3YHmAyn7VHFzKPEPiXI2CvF>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Sep 2026 05:32:03 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
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
Subject: [PATCH v3 06/12] mm/collapse: drop the collapse_possible() wrapper
Date: Wed, 16 Sep 2026 10:31:33 +0100
Message-ID: <20260916093145.4022188-7-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916093145.4022188-1-kirill@shutemov.name>
References: <20260916093145.4022188-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

collapse_possible() only forwards to collapse_possible_orders() and turns
its mask into a bool.  Its three callers can test the mask themselves.

No functional change.

Assisted-by: LLM
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index cb08789b2d38..62bafe509bb7 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -512,17 +512,11 @@ static unsigned long collapse_possible_orders(struct vm_area_struct *vma,
 	return thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
 }
 
-static bool collapse_possible(struct vm_area_struct *vma,
-		vm_flags_t vm_flags, enum tva_type tva_flags)
-{
-	return collapse_possible_orders(vma, vm_flags, tva_flags);
-}
-
 void khugepaged_enter_vma(struct vm_area_struct *vma,
 			  vm_flags_t vm_flags)
 {
-	if (!mm_flags_test(MMF_VM_HUGEPAGE, vma->vm_mm) && hugepage_enabled()
-	    && collapse_possible(vma, vm_flags, TVA_KHUGEPAGED))
+	if (!mm_flags_test(MMF_VM_HUGEPAGE, vma->vm_mm) && hugepage_enabled() &&
+	    collapse_possible_orders(vma, vm_flags, TVA_KHUGEPAGED))
 		__khugepaged_enter(vma->vm_mm);
 }
 
@@ -2857,7 +2851,8 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 			cc->progress++;
 			break;
 		}
-		if (!collapse_possible(vma, vma->vm_flags, TVA_KHUGEPAGED)) {
+		if (!collapse_possible_orders(vma, vma->vm_flags,
+					      TVA_KHUGEPAGED)) {
 			cc->progress++;
 			continue;
 		}
@@ -3170,7 +3165,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	BUG_ON(vma->vm_start > start);
 	BUG_ON(vma->vm_end < end);
 
-	if (!collapse_possible(vma, vma->vm_flags, TVA_FORCED_COLLAPSE))
+	if (!collapse_possible_orders(vma, vma->vm_flags, TVA_FORCED_COLLAPSE))
 		return -EINVAL;
 
 	hstart = ALIGN(start, HPAGE_PMD_SIZE);
-- 
2.54.0

