Received: from mail-pj2-f19.google.com (mail-pj2-f19.google.com [74.125.227.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80764483B9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144987; cv=none; b=efM5TR7H6J/Pag5fq7ODUtNveiFgzL6RrR4UJUzH+AWJrI2UNplvM6vEYsj7nevLiAmD0T8kOtVsUvl2u4ZwcQKMcaKUGQwFy9OW3Zi9gIMXtRT+FfjjmAB4M1I4Kuthxfm+cDU7mHpR1+WL5tWsD8bjR/tll5i5YwemLqKW1cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144987; c=relaxed/simple;
	bh=bspJBmRxLS4qW3UQTFV0QVGd0Nf0mf04koeOIwHSQFA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PopbwOA9vpz+JYA4UxafmSQ0GGqbeg3bGi+WttLwZOSATZkbFBVkFQ1uiH5FPkysuC79J5eW2O854qgZYvcowItzygNCRRcIy4hswwO13OL8sxbwFawCKpbWUlTzwCVJvrFDuSwDFzbGSRRUl9UuvU5kdavYc5Qyq87lymEYWpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G88Z+KwI; arc=none smtp.client-ip=74.125.227.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G88Z+KwI"
Received: by mail-pj2-f19.google.com with SMTP id d9443c01a7336-2db18fe433fso2719975ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144978; x=1790749778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qz31YaIUZL0HkPkLOInD8YA56WfSRIuJpUh6x60MqwE=;
        b=G88Z+KwIzih7XULAfpBP2PFtsokNa3be8ORhSfBVtcfGN+5Q6Zz5gX+A+yNsrzv3MP
         cqzeHKMhkZ2EaPESf8rygH+dxipQu21ZlVKj7wssRFlKlOvlG8vkzGs7JjfviWNJoS8w
         PuHphWdcAVEdd3hR78lyhcINfP9e9nQsQYax1YurP/x5+eFa0YirKvBulLfaTtFpkMGI
         Gn/ZKXPMl4KczvaxhW4PcynC20Gp5KqqxpIstyTeUg5zdTl1B1YsAfs09eNPHHE69st6
         gMFggSVr+/1diAIss8BIKPiSLjbyiFsH0A2qpVXOaasMHYcbu9AJGOcthfEx4S0ddiI9
         ZP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144978; x=1790749778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qz31YaIUZL0HkPkLOInD8YA56WfSRIuJpUh6x60MqwE=;
        b=QP+4XORPIaoBiuuD4LpYu1DjrrpP801RzRKxTLuLeBrKC+Y4HXfRsfCauZOhqqDPiN
         tubYIGXQtyHjQh9zE5ZXt5xBBvTiqaZIS2kvYz3xHOB35o478G6jIYgMz6l4viRpKp42
         usNq+5sPjzYQ5bD5Tzo1uMD/NccUuTgxt5fYHZ4bWSkFzTLlfgMCALKWIfZGV1ecitP6
         hMrwYwyGPTo6ceDrgzaCb/3YMbiw1DQC+QvpTH8CjgOAahbEqgmzWKV2HtUbaO7HQJOz
         Xq86piWIj6qAcA/cMpiL2zXwHr+0CW1bxYPEzfnuQD6bV7yfrONpig9XKntEX4HrO0Hr
         e6ig==
X-Forwarded-Encrypted: i=1; AKwUvBwPyaUHDl85sfaQO0GmP+WM116iQvGHJ9QqRxpmpt1+fH+3vp1iw5PDWD2M41/KyYkTvwVKvpVCmGAf1QA=@vger.kernel.org
X-Gm-Message-State: AFuF++lCV2iVGnz8x7O8r42yBQ3zNznXyBNIpa18J7SkWV1iOpfezzqA
	kMnq090X9qOBfX9Ob+/qbVKrWLrmTamrDpzeonbhDyjvgXzjNWB4HWiC
X-Gm-Gg: AYBFou1KEALzXn1wALiJRpIWY3hgQzR4WCKNBKnl1p/sQXol2QjQ9tBNg00lqfcKOQ1
	+3RLZZMvqRChyVgbCbMDpuh9K7rwb6R7zLNrx9ekz/E8bjkRkWk6fvuBbo8XoBQ1P+dudiUzwLi
	Xi5X/fdKVPVkG2A6H5o+xCixPL5ooiRh2VFsRIrto1ZMH6rfKkPyF9556Fqwlphg/END8TFpKbu
	zV+fMk2kY8qKYAKIIfxAtWgg8gypqlbUeaFZnBa9h8X4GgiGm10/txnkozJWffs5lhgEMmToAZw
	Uintn65Lr4tkxZ/Qi9ogl9LrEZ3mGEThY93b+tevc2ZBvVEhNPcsxb8BlJj8yl9naMSueEjKjlp
	xL3v4FiqvjEfeZFFAkgWPQ/r9z/Z5T3KbP7AZWcKJGE3ybgY9Zbjib4a1v9BoXKYZidcsNlWYG6
	WsafoLd9e+XmXYINTN6iRAUN+QoTzHm92RYEtg6/lMNscrqKXxHGQ3ROSgVoKF72XWmSvOJQ7uy
	B4R3XuTD5C8nOgyYEsf+g==
X-Received: by 2002:a17:902:d483:b0:2dd:c053:c20b with SMTP id d9443c01a7336-2df69ddf0cbmr15391165ad.39.1790144977728;
        Tue, 22 Sep 2026 23:29:37 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:29:37 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
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
	ryan.roberts@arm.com
Subject: [PATCH v9 10/10] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Wed, 23 Sep 2026 14:28:32 +0800
Message-Id: <20260923062832.479455-11-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
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
index 37cddb7f45a4f..1a3b191885024 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3328,6 +3328,14 @@ struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
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
@@ -3655,6 +3663,30 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
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
@@ -3693,7 +3725,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = vmap_get_aligned_vm_area(size, flags, prot,
+				__builtin_return_address(0));
 	if (!area)
 		return NULL;
 
-- 
2.34.1

