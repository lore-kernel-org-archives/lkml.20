Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369324;
	b=2SqabwCFaB3rHYq26iqdjRgAlAm0B9eG+/eLGoEnk/Dx3vh6poLt12AoTGFNM8oMbfPc
	 DxxDEL8GbGEBdPoe6I+Fz3OIx9+0FkyEJQnEdy+GPerShtdVhRg1daDrE3/IWma/q6O2h
	 sE8ZpnaALtUZ8Jw/b8SY/MjWsr5MNNuhYrW7vrc2siHmsf5ZI5DQL+XGuQowlu3SMyoYJ
	 oZlDtLUnZyo5X2xbeBT5ejYVSqIr4TzMRBKmEwHMWXhuroln4za07vHtbaTtKO7Mdb51E
	 +RigtBxix8HnN8LsbjoWv0n//jmVP+ATpBC11tVZ7b/8tUiJehW/FK8Dc/BjL+YQcdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HwaJdDbl3ziEIlNq+4GJpu2/q8X3inKh6ZLd1kzHiJY=;
	b=PLuD9+h9OBhLeLXnX1tJv1HSgcKIcBugcTwFnDKaU1MJdPV1i6W+UfdLZ29KJouskz7f
	 Lk9b8dWu5I4V51VOz+aXgCDK0CbAFnd28pIyGHGXen9+qcQJ+9uPY+sdjnJ5+odNwwrcp
	 7zOgzQmZzzXszmIj+i2CY6k8wkFwtLYqvFpRabwK8Gk/koNmq9KIuUer4QWjgEs589m0p
	 o3sd0NENxoUjiCUoG3kOYwG5o7td4QUNkQMy60TE3HFwknCRQs+Qf47Vt0fDtvhgCmwOY
	 W2Z8tvOYkfkc/nXX9Vngp7sFkhFoZJvCXkivnma3uUP1L0Fqe1iOV/9jyFjfp8Zxdfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TxIW3gwH;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D545606A336
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D545606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TxIW3gwH
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2eac4877accso2681885ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793369323; x=1793974123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HwaJdDbl3ziEIlNq+4GJpu2/q8X3inKh6ZLd1kzHiJY=;
        b=TxIW3gwHLdyhPOlNxgyQNeJ9qFfPmfQE67LBTo2H4W8SHByn6f7YumAcGyQUYRPzOZ
         hWVMsA5HmjUhMu5IuvY0OpbIvNrWoNpDqF3AK3q5ReTvbuWKrB/Fh+fDMxJ1JncMJ+OS
         MZ/in/8735nqC7xoujW81sghdkKZjEmm9gaVe+T7zk5xukHg5CMcunWfJ9S2evxJCZ34
         gQd+Ub8LJD2dBpOiimmJL+9XGancwqYg6SikSMAWyAJzI+5chktjUpbzVOXv+uKT3ZvY
         fH/BhHT8OTLOgsTS+JNWDjnnEZr86P0ykb6cW5oNKl4GKXGw4leayXH3t4koArCS0vge
         i+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369323; x=1793974123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HwaJdDbl3ziEIlNq+4GJpu2/q8X3inKh6ZLd1kzHiJY=;
        b=qkdz4YYzXGU46GhlYa8LVCnn9Crroo1N0kueh2GFfANMuzJ9lCL85uPPfg7PuJLwLK
         7Hmv6wdZCMp9U6qMpXJAe83o07WJNHAdnAQSJLsTSZn0Fudu5+DuOGOSstSnfmJpH4Y6
         sdOo0LcG9JQMxg7Db0z8BwV/IVfL2agsvFcEbMHXl6ZgXuEvf9g/QtFjQSLM7W9Uh+Au
         eYPNvXYcLJ5k7h36XuP9si58ryrqPgKxEdYNN36qlGsx+PBsHcM6Mo0gcBSzrJ3MIt6Y
         /N0yO8ZQP/gl3o89isby2dAc1TVSW50XmCApI0azzc6G4oiImxl3FB2Pitf9z4U/I6fH
         OYkQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4Wtp1hasd714a827PJUhZIMH8RM5ngTu1cUYYrT/GMkFxZhiNT6Gjx5ibhBk+OlcKB+WaKacIIOJRUGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF0Nlfm8o+U1swYbnK6EVXxWDrZg1mYIPU3Zce1yb78o0uixAw
	TLDWIutlSLc8/1TB9hV1oBK8RBMg2RSJ4xyshY8F3AS66knXWIKRNfOnX2crcI5SAZI=
X-Gm-Gg: AYBFou3zcNa8BklDFp8ykZYZx/dNrhDv/x/AxYWcJdU7RQcKCH7IfOR6qKAKF/hlJ4w
	BTFxaxpCpU2ixvFtweSiD7tkD/8s99xqLMIo8W5dZSOCNsn/4n3a1csWy6nD9A0VLaGWeH/5pVl
	jV4ORcrRRpvNGdB4cbVrWoitxceFToUHyhMrx0+zz10mdJYvZKe5zO6O9iU6JndSlKFPzk09JiW
	TrCXsVhmQ7d+czUxOlmawmdTxQiwVNBlDyGV2+4Mp/Ot/MHczhgBOrTK8qlK3fZPvztPWyH7hnl
	H58dW6hPHUM15kWTJGNcpGLYt2dAJnHl0xatuWN8sxdhy9adayZiQvyXcKe8ULwnfRFmO+nUJaO
	aEBbSXRSUbjXQKOljBfeEbUGlzgu/jlrCGuUkrTFe00OM1V+SzLmH1ms9FbVwcIUHnCYR+2IqDK
	HR0Scw12qH75hUlhHBUNDwEbmGyNIpOudnrRb9RwcPMfYEVczBR53mQ4QXYftzFAAdPhj6Rks4D
	anK3RErNGXDGTMEZSOALYG0XT09ZFn3dmpfMJg8Q2vGvi6kHsx+wKhxyUNrM9wGYU4sRLJ5GCCO
	JxnH/zD+sjuX3rqvB7drOlxuWhTxPY5BCJ+6MxLzkkwEg3LDfHlZ
X-Received: by 2002:a17:903:1a8b:b0:2e9:401f:f0f8 with SMTP id d9443c01a7336-2eb364e9f6amr24067465ad.53.1793369322301;
        Fri, 30 Oct 2026 07:08:42 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm7601795ad.62.2026.10.30.07.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:41 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 2/4] powerpc/mm: drop powerpc vmemmap_can_optimize()
Date: Fri, 30 Oct 2026 22:07:18 +0800
Message-ID: <20261030140720.1256062-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030140720.1256062-1-songmuchun@bytedance.com>
References: <20261030140720.1256062-1-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PowerPC no longer needs an architecture-specific vmemmap_can_optimize()
override for DAX vmemmap optimization.

Whether the optimized mapping can be used is now decided in the
architecture-specific vmemmap_populate() path. When PowerPC has to fall
back, such as on Hash MMU, it can simply clear the section compound order
there and disable the optimization for that section.

Drop the radix-specific vmemmap_can_optimize() override and rely on the
generic checks instead.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/powerpc/include/asm/book3s/64/radix.h |  5 -----
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 10 ----------
 arch/powerpc/mm/init_64.c                  |  1 +
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 8452a2714cb1..df67209b0c5b 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -351,10 +351,5 @@ int radix__create_section_mapping(unsigned long start, unsigned long end,
 				  int nid, pgprot_t prot);
 int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #endif /* CONFIG_MEMORY_HOTPLUG */
-
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-#define vmemmap_can_optimize vmemmap_can_optimize
-bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
-#endif
 #endif /* __ASSEMBLER__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 2924604fbb38..63f369d296b4 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -978,16 +978,6 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
 	return 0;
 }
 
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
-{
-	if (radix_enabled())
-		return __vmemmap_can_optimize(altmap, pgmap);
-
-	return false;
-}
-#endif
-
 int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 				unsigned long addr, unsigned long next)
 {
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 0e777d7dc332..509cc4190db7 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -282,6 +282,7 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		return radix__vmemmap_populate(start, end, node, altmap);
 #endif
 
+	section_set_compound_order(__pfn_to_section(page_to_pfn((struct page *)start)), 0);
 	return __vmemmap_populate(start, end, node, altmap);
 }
 
-- 
2.54.0

