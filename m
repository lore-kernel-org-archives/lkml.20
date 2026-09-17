Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4293546DE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623053; cv=none; b=ZMQzkAY8fhoAGfe4vJjUi4REUNu3Mni/uzpQ9Kt+eNH5cG4RVUpnj3hcHL4K4yzaUTbuYvXTZH1GCiCFGX43T47F85+n+tXjkjJJv7tODK8G18oebJvA1JTIYUD1y1GlpcPoWWL8zbrdc38NsiBnJ5lY/UeaOy+ykT4jXnH596o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623053; c=relaxed/simple;
	bh=x7tKdQKG0sWWcxPRX+uUg1aYDnd/OPPFByjyr1enwkU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cL2cJeoEHpDw3C4Wv2VBvu8wrOIF2ksQ3AyX+RNU5VVd0lxKVkAHZz7mFHHuY84mYddCLAvKtcxaxdK3IGQVqYdashdM7zQJqhx3MXzTOb6s9uewvgeDMQnr++rA669oRmyhiApYZcDLx2KV9EOdsFVKJOwwnq7ohdy4bUW4YFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggCgWO7r; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggCgWO7r"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fdc579daso4584705ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623051; x=1790227851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8rYVhg/v6BbsXS7Hdm4I0mlpI54bk8irnJCIlnxFJI=;
        b=ggCgWO7rVrOciBHAnAwhiTPaAF+iPfbXMiik5N9TXTVDgbmSWi8GkVkjb0T8aul798
         BLgLCXLyHJtgOBXiPEjA4eUfj7IXZ64ak3UmUrYLQ7myHCOibsRZ+QdHYVLK8dKxZ0nv
         j0yHep/LgblNlstKNohfypQlGTwqneuvNsRK7iq4d1QoWb35nLbNwVivo4RiQDq5Em/C
         Kb8fpPDiMKuF0svgVShkieTqw2iN4ccO1IwPZ3AXlNKpJQz8yFu+eQ3J3AEyBOWD/vVd
         VvUPna90+iXSCOneYxV5AgR+hP3yFFtAU8RrbMH0YCqigpArFqJVO595n6ZIPVNlfq5v
         wqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623051; x=1790227851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/8rYVhg/v6BbsXS7Hdm4I0mlpI54bk8irnJCIlnxFJI=;
        b=oU3INVGYefxj+2bNkeQg5z8II8ncc50x6a1EPDIXPrvxsU3tBAuNNj6k0Ms/0f7P9V
         z892AkYjiOev17GHw/Ef5MP4r56qyjbJJGA+nz0hxyxssNV3oaeCrOm9eLWVXOzML/K/
         3b0NCOQht1OxK0vb5Ckki/8KhG04mTTVyH/p0y2meE334DkC778sYPmHcj6kEQN8dKrZ
         fkq/+hCotwEGdxMdNaqzRihEz/RIwBIY9UL6OigIvhgW+YDKy6TRwqfhEf8os8wqamix
         hdK9u6+dNpbBX3AUb++wO8ELwgHIJl0O00BVdB65gK6pn69zqPR7gdoRT/D1ALkXRhzD
         SGiA==
X-Forwarded-Encrypted: i=1; AKwUvBw/KI4oJcfD5MZDf5zBXpt/IfGTY5hROiQ7orL5dLhNihn/J8k/lApE/MVziZmggbBUjBeWyZMnmfO2p5Y=@vger.kernel.org
X-Gm-Message-State: AFuF++k/uivkOdoE/qw35Pf5cyCu6BEUvwQwtjb+LFYSDztgWm4xBKlH
	99DKwa3JXADWxspFbdQlJ066lcAgyHpd5v3sWgu0EumG/R1EryqSNJ1E
X-Gm-Gg: AYBFou1HmEnxcwRJ9wVU4Cu2rR4fAWBBITHuJCowSqMhDpIFVUCUZ4+p3yeCh930yV5
	Xv/lQPLk3tLrYMwpeLJlS9Oslb6poxFoCkoHetaEXej4Uix99PAOar5VAYoHiNn17rHJA/k+gkc
	77wRN+Z+y3zbKw1yWnqsNv5EuhNMTV8tFPdiPQKrQ519Q59Ji2U12s/yn0V7V6M358yVoKi3JkT
	LnVA6zoiKEsWaS/kNO9t/v1LEE9B5oA05da7VUqJKVteZ59u8b/kUZjIrwP8jer6jrEj4vh9aZ4
	xshbvN6eoLBXYlvNqS2RdK2ohgFBWaG4ZoT02XS79Ju5/AB3DV5zPLZIhhW70xS3pqTuUitVrAE
	5pvqSCn6w8gAOdyN/aBird6g60k6lo9z0ZFCk+bP+KwH591gttkZrmZcdt0sFgkOB7fu8yU19jD
	jats6eMZ4uqxIo15hRfZvoLS0PkXJdK9z6L+5O2NAQF4n/pNQKXUo9dBmbPOSGCISScCq6eyXj7
	W2pa44kiLswWJ8U5WXy3Ml6YKmZcCdLpNUImF8=
X-Received: by 2002:a17:90b:2b4c:b0:39d:f024:c7ec with SMTP id 98e67ed59e1d1-39e1e484b5emr13289860a91.16.1789623051007;
        Wed, 16 Sep 2026 22:30:51 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:30:50 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v8 10/10] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Thu, 17 Sep 2026 13:29:33 +0800
Message-Id: <20260917052933.188679-11-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

Try to align the vmap virtual address to PMD_SHIFT or a
larger PTE mapping size hinted by the architecture, so
contiguous pages can be batch-mapped when setting PMD or
PTE entries. We do not expect any significant overhead for
this.

Add __get_vm_area_node_aligned_caller() as a wrapper over
__get_vm_area_node() to simplify repeated calls with fixed
arguments.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 mm/vmalloc.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bce2d2c09f546..84413def1d771 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3306,6 +3306,14 @@ struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
 				  NUMA_NO_NODE, GFP_KERNEL, caller);
 }
 
+static struct vm_struct *__get_vm_area_node_aligned_caller(unsigned long size,
+		unsigned long align, unsigned long flags, const void *caller)
+{
+	return __get_vm_area_node(size, align, PAGE_SHIFT, flags,
+				  VMALLOC_START, VMALLOC_END,
+				  NUMA_NO_NODE, GFP_KERNEL, caller);
+}
+
 /**
  * find_vm_area - find a continuous kernel virtual area
  * @addr:	  base address
@@ -3619,6 +3627,30 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static struct vm_struct *vmap_get_aligned_vm_area(unsigned long size,
+		unsigned long flags, pgprot_t prot, const void *caller)
+{
+	struct vm_struct *vm_area;
+	unsigned int shift;
+
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE) {
+		vm_area = __get_vm_area_node_aligned_caller(size, PMD_SIZE,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	shift = arch_vmap_pte_supported_shift(size);
+	if (shift > PAGE_SHIFT) {
+		vm_area = __get_vm_area_node_aligned_caller(size, 1UL << shift,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	return __get_vm_area_node_aligned_caller(size, PAGE_SIZE, flags, caller);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3657,7 +3689,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = vmap_get_aligned_vm_area(size, flags, prot,
+				__builtin_return_address(0));
 	if (!area)
 		return NULL;
 
-- 
2.34.1

