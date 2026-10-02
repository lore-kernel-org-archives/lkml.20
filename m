Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155544EFFB5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957162; cv=none; b=MjCcqgbQZ63kg2RafteGcby5LgaKVYmh39GIt/EPWBpesZwWXBC6mx6USaEDEQZcJZcb8eZshat0jGTtWMt8XM+/E2KHRk677tAwLSANeQruMEHL2ZGAb4wcnxgiZviKzot7RxbmTR1n8ya226UePOWKqMP72CrBYPJUAU3yncU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957162; c=relaxed/simple;
	bh=SB1kntjaFhf0yWQMYbxBfxyEA1Te3GhlttY0KUG0GCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qb0DNMRwxtiBFdnV86FIruseCyVs+QRO6Dr8Ppzkrclbw3lDZrR7fsUTYmg2oiS42AmNmwIR+q8j4vmJ6lmclAZRxcE//XclQh+Z1tC3zHYu0j9pvqgLorNu7J88YN3umLYQdZWYBhV+Qt6dwo41RAIyGOFQZtM9SwF7sxOhcF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqSN4l9x; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqSN4l9x"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2e49be254c3so4617725ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790957160; x=1791561960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDVqQr9a+Wa1MAOG9bRmi0jhwnmrOJeH5SzcMrY83Xw=;
        b=aqSN4l9xpEVtc48DNp7ss9P8HF6GIJHm2Iv6iHXkSae6c39H8sSz0b7Ly4dnyIazwx
         tMlJViYx2OaZunPFGp2/IXHVCeNfjU+8gN04sF2NmNHtHNo13dDUj49er07dWtNO5K7f
         /dnJvP9FoQmha9bgovoGh3uRMn+0C+tRsvoG3u0fUfD4T+GdqEOAmnM28uiUU9FbY1jP
         RgN0J6hszNUiaDRlcyD83t+7o+3RmA0EE+btW/KdxxQhkCPD9hkHccHaMy35SsS7MyyM
         RPi/8Kwi7mSlHeOp5gZMJJgzuObZYlF55OMxQec+77FB2b8bbKhJmo6V9lUxR7NhWRdd
         Q+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957160; x=1791561960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDVqQr9a+Wa1MAOG9bRmi0jhwnmrOJeH5SzcMrY83Xw=;
        b=zo4eef9U77FhmU0M8obZ/XoNNGwpw6n28OO1zGdS0Cgnt1yXUVOpSwDTct4kT+HJNs
         0E6br+7m8ZnUZS+PXESn1QOVuYCVX36NNjVacYkuxuLFgKKPtz+PrscQwtqJshQWCPUy
         /uLTI5l3BKVSGVovlpWERMnwek899jbNwi49cKEAImtSrH/h1PhtuiUyWQzniG9902Yn
         U5wEY3xkW4NgukFFYs1QYHJS3+/znx2BA0nHJh6nTQUlwkB3ZLk0XGtOUZbOGWFe4fJ4
         m1XYIO4jmY1BENZ3vvMDLOopQHuKHN3f4kLlPpMzsCR6s+Y2LUoWun8N3G2zlh28Ceml
         CbwQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8zOI7ooIZuRCEiwMcuO+CirEHPwtQ2EhZGAIq4nfVmvMmy9MEvS8wPthO+pij+rwUkeKC9R3EzEtHjsM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIwkE7bT28/l5VyphUz4qV5edolp+EWD3SQ7fa0hyI/uRCTjoB
	zicxVKIEJQC6eZLUlS4aqbfExnIgcXuVL5oTbeNkDBRbPXe/kCNEiCNW
X-Gm-Gg: AYBFou1AdEGP8ZSJoisz7N65ff8JGhenhXoq2u4BAsI24cz1MgZhg97zJ+vRtfv8Vxg
	Ew6JHy+QEHVoYiXBouTGGBcYWCGwidgJzdIUqPW+S1IIcQNC3Tdm4C8wKbGdvbMxXYqfljIZe8G
	Xq1bFBa4IGPha0v6Q5u820YGPSwOQ6/pkAs49/z70lLLrpMRjnWafphfeDaXiD4bhE5KNdC3yFb
	OJ8bYxett4wREV56QFjSjh/A5huhOpgjXo19v0ScszTaP4Pd4SZst0DGF/z9W9/Cz4vp+yXsjpU
	mvGpkt+D7+6FOZxgKpuqx+qpWjK3Le717Y++TNndRSj9HUDAmQsaPupIrcA1Y4vhMo6xOhPHWI0
	7+hJDXxaWNNMNbdzBKMlwcniEoUAp9IDSnYmKbCefXw5hA4hVfwtYL0m6UcyfHej+xLO2kQBVnB
	UHf8Lh51IULG8PZ4W8G2IGvF0yv+o14cC2pguL37LB9R01Io4v0gpvrg0+4VR3wPT54PkywFKA8
	/tqkKxcG8Y+Se4t8RKJkhZ+
X-Received: by 2002:a17:90b:35c3:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a6cead5baemr2914038a91.47.1790957160294;
        Fri, 02 Oct 2026 09:06:00 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cb357sm9375672a91.17.2026.10.02.09.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:05:59 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: [PATCH v2 3/3] mm/memory: merge __vm_insert_mixed() into vmf_insert_mixed()
Date: Sat,  3 Oct 2026 01:05:34 +0900
Message-ID: <20261002160535.661399-4-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002160535.661399-1-ekffu200098@gmail.com>
References: <20261002160535.661399-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmf_insert_mixed() just calls __vm_insert_mixed() with the same
arguments.

So merge __vm_insert_mixed() into vmf_insert_mixed().

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 mm/memory.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 6c1d38eba7b2..bde650e207c9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2991,8 +2991,8 @@ static bool vm_mixed_ok(struct vm_area_struct *vma, unsigned long pfn)
 	return false;
 }
 
-static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
-		unsigned long addr, unsigned long pfn)
+vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
+		unsigned long pfn)
 {
 	pgprot_t pgprot = vma->vm_page_prot;
 	int err;
@@ -3041,6 +3041,7 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
 
 	return VM_FAULT_NOPAGE;
 }
+EXPORT_SYMBOL(vmf_insert_mixed);
 
 vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
 			bool write)
@@ -3062,13 +3063,6 @@ vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
 }
 EXPORT_SYMBOL_GPL(vmf_insert_page_mkwrite);
 
-vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
-		unsigned long pfn)
-{
-	return __vm_insert_mixed(vma, addr, pfn);
-}
-EXPORT_SYMBOL(vmf_insert_mixed);
-
 /*
  * maps a range of physical memory into the requested pages. the old
  * mappings are removed. any references to nonexistent pages results
-- 
2.43.0

