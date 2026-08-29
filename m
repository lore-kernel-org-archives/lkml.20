Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9618418A33
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788023495; cv=none; b=bYJYf/lTn4jzL1V87poamzzdbNgeDI8UNHCaCjRrj0XPoQuS9ztOdDhUbN3r18W8MxrWDfzebcEbeWcpY6/e6cUEmBP8IQuFR/iSmnVPX3tUR1z1lAkOcjVA9C5ohL/+EI20RQEPcdXKVVjCPNoyfEEKKk8ZEHllnPbyOZ30h7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788023495; c=relaxed/simple;
	bh=09G5ajLvFpZOOIkdo7Sg8P/+evqJXvwDjub93wjWV/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRpn/X08hiLjj10zdzcsMHly4Io/UvrM5c8y9CNAgIJECM9CZjeTcyD42YLxHOuVDzua2lUMPxLoJ/s1wDvJbB6bbzBKW2twM7wO3XfsC+JeK7BODh9teapVX0YP403eLIX9Q9IamQsbSffnQ5P0u2YOZvqBaPgBJqmxw+P2o6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPNbpUt8; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPNbpUt8"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48431648f33so317115f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788023488; x=1788628288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5m/rmCWnwafcoVS/zA/mPp2kr4G2N0WDNX9qd9eijg=;
        b=bPNbpUt8mPX1rNt4NkeriHxcbwiFCVYzZpuzruRgssJ7JVqTVRsWrwPDHtZSLxV5Oq
         /WM0aD/GsRbiLgwQj4miJq1cF+nhE6anTb8+w24Bdlqx6zS3OMCJp32r3w43PvpqlgEx
         kat7XLZYQ7G7z0oP323Y9JCJeDPNicDz+nv5Yg4V9PUhuCHZu58dxXzp9SzbemhKPO41
         PK6IVnrs5ih8/jWWlOpeNuFxbzdkSP21KhQq24HhbyBkAqMQwMvYUNP6mj7mS3/rAh0D
         Tz33m14iEPiBzQLYKT5gnggoYXsh31/IUPpmqhND9Qeu3xyqHJzFI3RuYx7iuNViPf02
         +/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788023488; x=1788628288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5m/rmCWnwafcoVS/zA/mPp2kr4G2N0WDNX9qd9eijg=;
        b=jEmkk9j+FL7/5NfPjSh+oFhC29kS9bEODe/zR5xDGk13vK4zSCnfQ8w1sE62hF569e
         FMfzIc91fiOjJtJAG9pLuFkKy55YoZGttybQi4s7b7NYyEX/s3KLLoVp1JnIkhRyo9qP
         QXTmCV9Iy4iOTXN4r9/KlyG2NYkmVmIpzNNrYRl4mfUgBURT5pU/KlcNuTSeiBHkwhXu
         NOEj9d1iRbNAwe2FnLW+0oXXHfAFwJY58Ymp6O9MlCX5m73ScL+hPu1+djOyz3PqD2Mg
         spV63aztrs1/9SRyV7CD1NRSUReqDPWNF+1LA0tuRXZNaDupj3pKwUu0uSdeZGmy2yqp
         a0Ng==
X-Forwarded-Encrypted: i=1; AHgh+RqWA6HFII++is7DBFZDRpV3D6/HdffPERTE1JiHZWdmbzBmGMh1XwaO8irFhBCSWgVNhy416EdG7gQIUB0=@vger.kernel.org
X-Gm-Message-State: AFuF++mFudi/JRraMfDmE22FIFb3aUmBqHNJ63hVpRc4PC8VZ40GkpJJ
	xi2adlUu1E2qxAEEcodaCDnp4tuznNskrHyHe/A5+RZ8ugL1SbCeCJnR
X-Gm-Gg: AR+sD12OBfl4/QAEHmDi3D71Q9NhGoq9vC1OxSNKYQXWaHj+K3Eia2J/urEaDtJmW8E
	bKB0vYU8BsGLhaRpL+OAnJwEp3eStNfEbeB0LBFP6cjRuWtAS8sScvVVv83LojWR6/Edu+c+pZT
	tN6tiZbBRigcYFJP8YlROLVObtQbMbRRjWR9YX5U4GzHTVFmWciq06I7BWhkzcp6V0khoW2ga6B
	ZjYin6gvcMjI6FBLskoMhElNVeetP7FlC5zoe3snPfHj7h603P1+JEQCLI/urilbY1s+JaNlDNh
	WWOJiLtB0Yjz3YtyLHw6z2WAjOHIr7//+YYb20cIFiEWrEKGF0jAKDcd4bPgFut4+M8WjBzNO2h
	ZiX5x4BqJ1Dvx96sBYrTKQZueqGoJygoAv5bJ5fi2o7R0TXFbNPu6h45R8ihRORyYfvIPR6lodj
	8SyeHABZ/m8qIhjFMymYau6l48d/4zzN/iM2KgXdeW2pr0MSHKm05s19dN+tiBXU3S2dEYHIZGt
	eyT+6Pv6w==
X-Received: by 2002:a05:600c:c4a7:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-49cca26ceeemr113194285e9.0.1788023487985;
        Sat, 29 Aug 2026 10:11:27 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4cef:8600:c993:2682:3ff:b27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c7cfsm154861105e9.11.2026.08.29.10.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:11:27 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v3 1/2] mm/memory: simplify error handling in insert_pages()
Date: Sat, 29 Aug 2026 20:11:12 +0300
Message-ID: <dd3a672c858b38c7525541b19a919e120c4e5a0e.1788022178.git.thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788022178.git.thnkslprpt@gmail.com>
References: <cover.1788022178.git.thnkslprpt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize error return status to zero and then set it as needed at each
point of failure.

Assign -ENOMEM explicitly when pte_alloc() fails as the pte_alloc()
macro returns a boolean.

Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/memory.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 9cbce5c90bff..2561dc6bdde6 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2565,20 +2565,22 @@ static int insert_pages(struct vm_area_struct *vma, unsigned long addr,
 	unsigned long curr_page_idx = 0;
 	unsigned long remaining_pages_total = *num;
 	unsigned long pages_to_write_in_pmd;
-	int ret;
+	int err = 0;
 more:
-	ret = -EFAULT;
 	pmd = walk_to_pmd(mm, addr);
-	if (!pmd)
+	if (!pmd) {
+		err = -EFAULT;
 		goto out;
+	}
 
 	pages_to_write_in_pmd = min_t(unsigned long,
 		remaining_pages_total, PTRS_PER_PTE - pte_index(addr));
 
 	/* Allocate the PTE if necessary; takes PMD lock once only. */
-	ret = -ENOMEM;
-	if (pte_alloc(mm, pmd))
+	if (pte_alloc(mm, pmd)) {
+		err = -ENOMEM;
 		goto out;
+	}
 
 	while (pages_to_write_in_pmd) {
 		int pte_idx = 0;
@@ -2586,15 +2588,14 @@ static int insert_pages(struct vm_area_struct *vma, unsigned long addr,
 
 		start_pte = pte_offset_map_lock(mm, pmd, addr, &pte_lock);
 		if (!start_pte) {
-			ret = -EFAULT;
+			err = -EFAULT;
 			goto out;
 		}
 		for (pte = start_pte; pte_idx < batch_size; ++pte, ++pte_idx) {
-			int err = insert_page_in_batch_locked(vma, pte,
-				addr, pages[curr_page_idx], prot);
+			err = insert_page_in_batch_locked(vma, pte, addr,
+							  pages[curr_page_idx], prot);
 			if (unlikely(err)) {
 				pte_unmap_unlock(start_pte, pte_lock);
-				ret = err;
 				remaining_pages_total -= pte_idx;
 				goto out;
 			}
@@ -2607,10 +2608,9 @@ static int insert_pages(struct vm_area_struct *vma, unsigned long addr,
 	}
 	if (remaining_pages_total)
 		goto more;
-	ret = 0;
 out:
 	*num = remaining_pages_total;
-	return ret;
+	return err;
 }
 
 /**
-- 
2.43.0

