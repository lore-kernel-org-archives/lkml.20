Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB064908CB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714179; cv=none; b=FhV73FyZxasY4u8mW2bsUJRpyS0Anx8QGD1rmsTP0JhTtF/uYXwfoK9lcE+MKyX//PoXGBUgMjpKTO0Ut67HpAEZEJGfN7IiNIRFPa8eXVrj/VXKc/Yu5GvpcOBDtc8OcNMWLjo8i1kDNgROhY+bOj1X09gW0NKPCXYnP2g+w8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714179; c=relaxed/simple;
	bh=ZFnRB/ALKf9PhoJD8/OJ2xaBBdzDNWPLgcoOEc91zs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OMBTG7pLTskplc36GYJ8oJFhfgiciK5EL/w1hBxpUwLD6syn2gLkjtGELX1BfcWkx95NxZGKYTbWLmr3GAs/1zxBUzHp6qFmIiLoZuxa3LOAbPXdYNmSxoXSMh1DwhEQWAZ4+PP/lbkijTRoe/mma+2HOxxKdr1Whh8IwD+loBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kEY6r5vk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kEY6r5vk"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77F3E168F;
	Thu, 17 Sep 2026 23:49:30 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 509543F86F;
	Thu, 17 Sep 2026 23:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789714174; bh=ZFnRB/ALKf9PhoJD8/OJ2xaBBdzDNWPLgcoOEc91zs4=;
	h=From:To:Cc:Subject:Date:From;
	b=kEY6r5vkmWKUNDIpDyr2erwlyN6mIyLWgr3Oxcy6Z4hhq7Go8JXT483Y9iGmBSjFJ
	 Kw0hCbtygsgTI96bcdhUEGrJbgr9/10dAz6flqQdmmm1scG/r6rFbFURz5MLycy9jv
	 9n2t6rWnTRu8Oi1WbVxNwdxeENyzYeOF74lJk9no=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: Constify arguments in default pxdp_get()
Date: Fri, 18 Sep 2026 12:19:28 +0530
Message-ID: <20260918064928.793742-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generic MM default pxdp_get() helpers fetch the values contained in pgtable
entries via READ_ONCE() without modifying them. Just make their arguments
explicitly 'const' for some additional protection.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v7.2-rc3 and builds on many platforms. Some earlier
discussion could be found here. Platorm implementations for these helpers
could convert into these "const" format later if required.

https://lore.kernel.org/all/yjqldpl7il6uqfoqrszaopchqthhlffssprmlqjkljvpkbpwkt@zetb5hyvllsl/

 include/linux/pgtable.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 2981e386da7b3..f09a91ff5833b 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -490,35 +490,35 @@ static inline int pudp_set_access_flags(struct vm_area_struct *vma,
 #endif
 
 #ifndef ptep_get
-static inline pte_t ptep_get(pte_t *ptep)
+static inline pte_t ptep_get(const pte_t *ptep)
 {
 	return READ_ONCE(*ptep);
 }
 #endif
 
 #ifndef pmdp_get
-static inline pmd_t pmdp_get(pmd_t *pmdp)
+static inline pmd_t pmdp_get(const pmd_t *pmdp)
 {
 	return READ_ONCE(*pmdp);
 }
 #endif
 
 #ifndef pudp_get
-static inline pud_t pudp_get(pud_t *pudp)
+static inline pud_t pudp_get(const pud_t *pudp)
 {
 	return READ_ONCE(*pudp);
 }
 #endif
 
 #ifndef p4dp_get
-static inline p4d_t p4dp_get(p4d_t *p4dp)
+static inline p4d_t p4dp_get(const p4d_t *p4dp)
 {
 	return READ_ONCE(*p4dp);
 }
 #endif
 
 #ifndef pgdp_get
-static inline pgd_t pgdp_get(pgd_t *pgdp)
+static inline pgd_t pgdp_get(const pgd_t *pgdp)
 {
 	return READ_ONCE(*pgdp);
 }
-- 
2.43.0

