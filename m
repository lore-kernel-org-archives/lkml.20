Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44997471414
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932259; cv=none; b=q9VzmEmOfE1sBo6WCp3WeIhtICnfkn8G7YpBb9PR/F8fLhduu4pAGUcK+J54AwsMCcKQvK2uPjyBYyIusYzS7wTVTEVonRRWfa3F4NdJdbdE20Rw2MvceETW02M3qrkTCJK8CyUdyhNnrEhM4vpshE7YO4x/1qAIg9Jrg80lriY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932259; c=relaxed/simple;
	bh=n5k+dWI3lRv9NRT76P3YVDPaxmE5UNSqmRsjYyzx4Mk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GO80wM4QoK9JNhPndkoz/WARZsmGhPKR6jrUAyeQVlrpNDbyYyr0W8dbNdOXFn9iWv+/g2jVvbJEZ77jYEbNY3GYGfEFq/4FMp7vO0YuHR5r1+lVNKJiJtPqjaroj9efujv3iSvbib52iLpXOOg+1DJHJIDhaE1MQCjmPh5moM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCZ3ZSsf; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCZ3ZSsf"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2dd05994cso12549965ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932254; x=1791537054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nr+lcidngyc0ulTQrlYku4smM8GtiOinATZrrJ6f6Ao=;
        b=gCZ3ZSsfZfCRUj+aTZ4COIApor5mVBFy+B8P7WnvlUJ3/URvfuO+khWbPQe/mzwuNL
         CNjFphFGB352DdVQG75MLaxCcouoOAEQpWbKRLQIVzDQbS4QCKPExf0nOIO/59yr5vbA
         deNBq8zdiL1Uv9mVqHYqxZuTITgwk6a/qG12ZEz+4SYO7TfeuJjhjBYmCZWINPFihRNz
         m1atiFw6rGOcnrQNY7zlD93ixWiWxhhsUQXDSWz5gL4gcGhqPrpWJkaoid3Ys1YAN0D/
         KBlHKrdg5deJZu2ogabiYA9LsmK6OpvsG1XCezcpSP94KHUuLJqKa5isEQSAaCCpe3CS
         njvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932254; x=1791537054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nr+lcidngyc0ulTQrlYku4smM8GtiOinATZrrJ6f6Ao=;
        b=Jw8DwXM783L+3P7DZqv4GP40wudAvDNFA56zHDPuoXSBCsUbWhIg70PLcHYUPjpfJo
         cnpfN5dEDqkE/Z0ibIqYwtF7jeVzVAdpQkHDJbxr2Cs4DW5Y4wEVgLAfcu44yds55FD6
         OlDhsVsy15/xZbnZRsxPyFS6jQRjYKG9Tg+IDwvq9gII49YWVGeoEJQEG1gQZeTQKgDv
         It8IBFz+hJ0VlLeYK6/QZOrzrm2xQr8IP0v6Gudhd7yGZrvNk0+H4/AhkbsK2hfgsPqQ
         1DFBs4n8CDPXrVfI877Qb1O8wpIjvkrF8KiP85L0rgKaUVezYmEV6gBvUMqBK8Qq/JTj
         Z/jg==
X-Forwarded-Encrypted: i=1; AKwUvBy9JThkqY6vzqfNRmDyqAJXSv7XGlLE6LpbIAXQyQVCPwiRV+J5zJmXVm84fMrovou95eF09we+ICUjnD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYInwxIQUB3I6Ug7rd0AcUKBOST6c3gh+mxfUlksGbX28wpOZeJT
	PD4f1YMVeHDt5wub4u1egaS68DU5xNg/rYuXs+1Mv4lVO/FegjepMjsL
X-Gm-Gg: AYBFou2LhltwRVswudz0+zeFrRSMEGnAsm6cwLgTXPnzJzq66XFvSBO7Io1Pi4OIMLf
	We6rkMFveb72vyjyjBTMPOBGg7E/UoOSx9x11niUE2DPv5k8cGnqlR71STyKAtVo35VFqQ54ezO
	8cbcE6sMR8T+QfBPLNmtk8n0CqM4+N7iiG86t6PwSvBCM1wk3tjjFoA6dO8c5eWl8l4wP46Dyq6
	pLf70PrcLPameEETdZy2IrWPRnR7y337ZXpkxphnBtkbnaja6ZU1yqN3SaHHvYYPzn9R3wTlHcm
	H3ecWDiOTI02p44a5wEhmQUGVQE2zuEaAQ3livrO6GN6RR9+MCr0t73wZqxOWmVME3tnQuxS2IA
	xAEv00X7gp3xeJKGF8Tgn5oIX5XE2pYal/idsAuW3yUR5uQUD8N/HHsftyrWX5/5Lvd73hziGzU
	DEzSEBjh2OmTUI8818pKg000DgJnV/7dEkOMhf/+gK70y5lHdVh7Ag7u5HZscwGBJhowQzzzInj
	op3WMqgiLq9O6ZN08a/NKie4nvmNAqK
X-Received: by 2002:a17:902:d98c:b0:2dd:5363:3219 with SMTP id d9443c01a7336-2e49b4e303cmr20733295ad.20.1790932254082;
        Fri, 02 Oct 2026 02:10:54 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:53 -0700 (PDT)
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
Subject: [PATCH v10 10/10] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Fri,  2 Oct 2026 17:09:47 +0800
Message-Id: <20261002090947.869220-11-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002090947.869220-1-jiangwen6@xiaomi.com>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
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
index 4acd1ec27604b..3555dc3794e4c 100644
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

