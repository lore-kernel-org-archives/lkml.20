Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB12B5304B7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066664; cv=none; b=ajE3nL8u7ctAzV/77Y8rVkXUm0GO5uz7xuxcAUWuGTKvh8qT0LiAGbY/TG8vHrm9dwQax6rMOxOagKkHgTjnxYcQ9EX2unK3qIpVBGnBm8b8wz1WdgXbnToURIgdihIZhiq43gXrwWnrRutgZ8Gkke7TQYNwWF9zyF/E9RIfGlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066664; c=relaxed/simple;
	bh=xXXTEawloLm41fSAr5nA62b6IMDJx8mcRGgEviHUn7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g9Ac1c0DPqcqxs1YS1Bx6zWGTr4gc8IiHd5ud2/evZTrsdFquWYN75l8Q0I1FXSEdeh4KcrMDMJRc1BLQ1Q7gOXkMDqaDDcdvidV3aMgnpk335kh9SG3poTYg8g45XsKGFeGh+81t/N7nrWfMKQE04h5QXKF+KWeC/T28Ki9ZH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6Qbj74a; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6Qbj74a"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-39b2ad83680so1597893a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066662; x=1790671462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7DrDy5k1cF63oZDGZmuZpMhR9CRSHaszqjBOE8wOFU=;
        b=g6Qbj74aXhCxwVIr60cEpjp2MIsAuspVjPGX/obpAPohs2/gbavWzDU//JEs3UGcN7
         zjk10VwwOJ9qDE2riMWk8cXrV6VM1Srpp2N8T2MdyDAl6ymXBBIFMjQ38sRKyoEHwDNw
         yDlGvA7KPoYVzslrtWf+VA6lvKwTFbgG5mihFWTyA6qAVPOptgeqLOCflvzmyC5vhqpe
         wp1IjHPr2snU0GkuhtP1t/KVchWaew6g3ep4AYV9UHRAzbcsZ53LBafB/eOGr1DAg9vW
         a5fQ1ZgKWsoMfryBkXYo8CW9tup/Nz0cs1zPO+M+cVV2vnUqCuVERIBCjvyMqrsfzbYA
         prTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066662; x=1790671462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7DrDy5k1cF63oZDGZmuZpMhR9CRSHaszqjBOE8wOFU=;
        b=Iezep/orl2PgF38RDhIFdiyPOvE6/nNKGp4+c8/MeCl3m5vUGv9/QCNmanNBAs1Nrm
         g6BILkm6KnHIJVbG2UGqLgZTs2JlcNa75h3MRw7GE4mABl5Z49ozow16tmFly4pK42nq
         AX8PCrRAU07XIG6WuYlJqQcmGJ/1PIsfnNoJRKM/DNMwQtwCAmsQEFZsIdIbmq0/r29x
         lgwVL2Fi4fgXH7mFy/j19CYPkhD+yUsigz3sQ2pUU9OGZaD5BoNJVxrvxRQcMZ8WkaC3
         8iiQubP2XWGiTCqK6kDsC9TViX+bZTuHSLb26dKKdfPSW3xYQvY7QN/nF3TT35eAq9Ss
         K/Dw==
X-Forwarded-Encrypted: i=1; AKwUvBxcv9+C8fzrtkC8iA6N4uAAGgWN5dIfX9H0f0jMvmFNadKxdVV7wQY59jBowY580m08EoNvsxvrTIMr52Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kHS+JczjpmLQWZVjt/CyL8vakiXxWiAiRvgQyzPWdrfDB5pl1Y
	X+dyv6gDravO/zjOsIDpgDPGOeuXwc9m0zte69pNa5Nn0+jPA5KSQOmY
X-Gm-Gg: AYBFou3LOrevR90WKWj8BixqtVOagEa9/oBpmuMxaRXCdahb5ucf3BTGM6RYce79Xoe
	26ewURh/jIa3g/DPihpFKPGrNJnO6YaRdamezWByUVG+66EzstcWqj4M5766YsuMnvyjQNuli55
	bcabY/CCJiM6lrz4DvLG5+VDC+9w5aKuzvtyRXKZd7TCyC08ePskLyFY1V1kpqWACJu45kzw5/7
	qRwD6h6RUNhLMZjl3U8LaiBwRNqcZC5lDgjVYWwwbHZhSFREpFG4eH5JfJvc5jUkTEuWeScBU9O
	GCiAGoYhqzB0dEOlmrFL71OKfBonbjXx84+vTug55zck+ra3bNJpaUSOlAgt9nkuqraYA/Jqa/O
	5gdmtf+vAERe6uJjyfTy+7UFl3WGs09O2TAZhSZDbR9rHQHTxYUHnoHR1cih0jN7NsXX8LxISF8
	slS5VV/T/kNNZV8mZRlOaopsAEP8n32DuhCwgQxr11MnR7jHK9i/1WuRYCiGSGP23CiBCUy0bqs
	lqbegW7LmI=
X-Received: by 2002:a17:90b:2ccb:b0:39e:6a81:c921 with SMTP id 98e67ed59e1d1-3a0731e1df7mr452432a91.20.1790066661956;
        Tue, 22 Sep 2026 01:44:21 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:44:21 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v7 6/9] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Tue, 22 Sep 2026 16:42:53 +0800
Message-ID: <20260922084256.1515554-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem to decide whether a
reserved area should be included in the kdump vmcore. Non-dumpable
regions are later marked MEMBLOCK_NODUMP;the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

The dumpable flag is also used to check /memreserve/ entries for overlap
with other dumpable regions.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 49da515859f2..99c0f3ccc297 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 90937dc7c627..d7bfc38ac762 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -567,6 +567,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0

