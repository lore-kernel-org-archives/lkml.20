Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5729937F8DD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241504; cv=none; b=EHgDKoxOTfMu5b4+DLWZcRx1tIMcUGB773unYCMnuMuYC1pPuNM1yGbbmn17S6vdCyIv2l69UaZUad79ohPoVy0VkOONEaWaYb2IScHuqKkTbF13//vs9jSoeDOgY2bn9HK7/tLZYqejnFFQK3d73Ih7aGxwiLquJmluaA7Jwl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241504; c=relaxed/simple;
	bh=tmJo3rjw0Sr3OV0lC41Li6x3+cmR1t0LVTih0JfnMfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Re3g/+vamH8UJeOt4d/2U0t3uyKx7gKKO1psFX2PaS/11q1Qwv2LaKY67f+UvO0uZx1CCAzZ/jA5GHZdi2M8XQNSTbobICY4ZkOCMzqG0pk37EF2dvbjDZJKRrjbZOAASKXGX4fVcMRVk+y5HALO7Xtdrc3AxR1HnHvyYpv6bHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mxQNKj4W; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mxQNKj4W"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D512F1AED;
	Mon, 31 Aug 2026 22:44:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B6B9A3F85F;
	Mon, 31 Aug 2026 22:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788241502; bh=tmJo3rjw0Sr3OV0lC41Li6x3+cmR1t0LVTih0JfnMfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mxQNKj4Wb0AEhmFu9i0suaBsQYFruZECm4SWTseJP7rcY2W3tIcJc2YI9lEycAGbN
	 ZsPZbxPAQokrm2WN4mK1Ud3PO6iU7lcQ+kcXpB4dNkc5H19R67JsXBZnnUMZTQD+38
	 NeY2MAeNqKc1GX+dQ6Zfqt+VNWjlIMJLzoHmT2n0=
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com,
	chrisl@kernel.org,
	kasong@tencent.com
Cc: Dev Jain <dev.jain@arm.com>,
	riel@surriel.com,
	liam@infradead.org,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	baolin.wang@linux.alibaba.com,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	pfalcato@suse.de,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com
Subject: [PATCH v2 7/8] mm/memory: use set_softleaf_ptes for uffd-wp markers
Date: Tue,  1 Sep 2026 05:43:54 +0000
Message-ID: <20260901054358.4049095-8-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901054358.4049095-1-dev.jain@arm.com>
References: <20260901054358.4049095-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use set_softleaf_ptes() to store multiple uffd-wp marker entries instead
of open coding the batched setting.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/memory.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 7ce8413a8117d..8c45fb25fd8dd 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1737,14 +1737,8 @@ bool cond_install_uffd_wp_ptes(struct vm_area_struct *vma,
 	if (likely(!arm_uffd_pte))
 		return false;
 
-	for (;;) {
-		set_pte_at(vma->vm_mm, addr, ptep,
-			   make_pte_marker(PTE_MARKER_UFFD_WP));
-		if (--nr_ptes == 0)
-			break;
-		ptep++;
-		addr += PAGE_SIZE;
-	}
+	set_softleaf_ptes(vma->vm_mm, addr, ptep,
+			  make_pte_marker(PTE_MARKER_UFFD_WP), nr_ptes);
 
 	return true;
 }
-- 
2.43.0

