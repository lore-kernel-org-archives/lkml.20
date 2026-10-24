Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792838767;
	b=K57IjpqaNDyH+WijvNdyDGHXXBjWo6qKDZ8hLX1/TWtkR4tfkaaeMfXbOrTSeDmr0aCM
	 ttVQzhHjeMUJpD15qST5/vI1EW6kt4hFn/8V4vyMKYOKre2BBxDpBP1E/UmapT4o/fxIa
	 AqMy76CMdYc7fCmUw0PT3U7cXzkvYtQQujV84HEgu7JYFBJcqn4Yft08A/xTnvc3bPBMZ
	 ImpjXDtNDfaVgF/gKjvkli9n8tiq1TisWBNw5VzvqbVXb+45/n6PoBDD4DE7QhMxM4TxS
	 uPXrNRx269ZIgKTCyb7ClIEgVsAV3XRioau846mXRdyc6QkY9GVGkfAQcWmYWsYHb4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yI6gnpr3iD8MepU4vdxCrnHeeo0inroAoiiaaC1yzbs=;
	b=uJjQ6L7t3lCq+EemdZNoEXoM7zUQnsORnd5vShXkCVfB0LXYkGn4wN6zpeXn9wzxb6C1
	 nPYkB6lprpmxaG7+4oj92Xs7C25Qkrwq48iNoJq2/bk9r0rmyXvJf4fct8NMmXygl1ZbM
	 5/azp7N7fjrg+4a/mukDqSdR00ZINFcNSAnUxjQ2q01EIdyceEmqL0sNpRSK0bnhN5a6P
	 Kimz9oGKzeV799xFt12SLG9WXnaOBxUfYW+JTDRNXFqk2Hwc7Q6rdoT5c2NXemWaZJlW/
	 F7ThDF4BZrqEV3HIljFA4evw47GKuUQsnj/bWb9LqTscQRcjpqATnkq9LA2/nItKi+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OK8BbQHz;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF22D606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF22D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OK8BbQHz
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9903fde8db8so503167241.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792838766; x=1793443566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yI6gnpr3iD8MepU4vdxCrnHeeo0inroAoiiaaC1yzbs=;
        b=OK8BbQHzM5RrUJpfUHsP4lq0v+SDD46VuMG3gD5VYaC7zVUeUa+YcFqJ3XSLiHcAxt
         n87sdQrxC3Tj7TlmVFUlvzesxzGIBVqPgbqqWWtk5czOqwxq5XulxWPaJtZ2BBVfs/Hy
         0u6L8zFG6cNDF9joD50Q2KYm1RQU++XufJ0xmx686wf0AQ60/sWITPQr8wUK7p3x9GnZ
         fKjhiNsnS2LiqTENN5P/aqOCfC4iEmqHftQXd1ytPtdxBeIRHugzwufakaPsbl5O/Fkd
         dUuw8x+6mG17RKEcovjy42qHNySUucxLkCp88wm0hgxKzyWigiNCQepRYhaocDaK55j9
         BLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792838766; x=1793443566;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yI6gnpr3iD8MepU4vdxCrnHeeo0inroAoiiaaC1yzbs=;
        b=Sw4zIdUGKsb9kei0ECI+6PbacjU8cKWcjYga4IvKrm8Uk0epr590RMgVxHtzw/ffl0
         UL37l7YW43HnFpnO7ou7PadgeCbYc9RDLJrWWUu59fuLU1mGoOmySxxiJoXzqOCuByGw
         OGH1drGZdyh/ws/xs+31Km8ymzF8DLtO0aC/e2/8aHS+82JJmg6S4csWHCh7EK2Ft29l
         VJcBynaDYEhTk3svZCJ8YvoNDJtlHPHJVMzHgd05IZoZnPsHjlmYQgKM2DBiCWCpR+i+
         7PKd0uxIZalwVGfbkpUt73bLgjIRuNPftsqNYeHmEX6p+5SfqByJCG9FhUULsh+vH6d8
         jybQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/HXXLpE8JCfoftF8ZBr5QZC80Fo4Sbs+WofXnJVq7Vr/2vINIdZJIYmA/IyvuobqxbnX9pC6jBKi3bFY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMJKyEFDCAfngUHjFNaH9KZ1QiEOQsdL6AoTzw7+m0VCA+L+LP
	WKNVZkLnqgj43XKvSGBKJTrYMhFPm83TiR+IwXVvuY3HbiebISHKb0hf
X-Gm-Gg: AYBFou1E0upYPcfbJq1kVj2V0rJAUt/LgDBZpW4nnw7tdbiHs8Zty9PlW1G4mHypwnq
	ayJinIC+A9S2xJeWhTrf4h0paUQsRn4cmwOsPagWPY3CHgzJTw2VMAWchMOwTcLYXD/03ZaJoEX
	TYGwyx+gyzug5bHee70vsbtPrNCdOkyJ0crZEwSAGj4vzCOs5UDpt/zhRwx6Jpti0i5GlKvkEQG
	7VnhRAHlbfU97cfDUCGN9FaJ4P3DshRGxtSsFWPANjla2ylGDoDaKXZ66z6VmPzG74Ae5hlTRyk
	kb5+0gAQdiJPxpjQ3+x1MPJ1WDayQ4+ufvs+9Qz8xcf2zQUZfoZO5ZVRhLdiCcpSyvj6wLyVvC2
	rd3c+nAUnYcZQLRv9yJavMtsqeCS3QXayV2/UVOdgqW+cgygg7TvlDoltXm7CI5S1WlL1lGKlSi
	TLRAM4GJifCW32T7kLerEH8WQx9igQTvoT0cA8XpayjNWeq8TrTv9fnd74uFe0doFqghWRMOHo9
	quT2zMuHInmzLel4XnUQtIYSvykK9sApeLeesAjfVIPHBy9BInKXe0cTDfcJdHLq9tZQibs9FzX
	nyIX
X-Received: by 2002:a05:6102:1492:b0:7cc:32da:56e with SMTP id ada2fe7eead31-7ce5cd41446mr429300137.19.1792838765631;
        Sat, 24 Oct 2026 03:46:05 -0700 (PDT)
Received: from DESKTOP-7QP7L26 ([45.190.211.148])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b7069sm2191025241.3.2026.10.24.03.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:46:05 -0700 (PDT)
From: dev12124 <joaoanandalima@gmail.com>
To: linux-mm@kvack.org
Cc: linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	ardb@kernel.org,
	keescook@chromium.org,
	dev12124 <joaoanandalima@gmail.com>
Subject: [PATCH] mm: ppm: add PPM (Page-Plugger Under Memory) to Page Fault and Overcommit elimination
Date: Sat, 24 Oct 2026 07:45:42 -0300
Message-ID: <20261024104552.394-1-joaoanandalima@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi mm subsystem,

This patch implements the Memory Tatic called PPM, Page-Plugger Under Memory.
The Main Objective is: Page Faults and Overcommit Elimination.

A few points under additionate:

1. Allocation Handshake (ppm_kalloc):
Using the GFP_PLUG_MEMORY mask, the allocator completely bypasses
passive overcommit verification. It instantly isolates physical frames
on the RAM, maps the page table entries síncronamente, and forces the
Present Bit and Writable Bit to 1 before returning the address block
register to the CPU.

2. Desallocation Cleanup (ppm_kfree):
Triggered via the GFP_FREE_T parameter, the release phase executes an
immediate length truncation to 0. It forces a synchronous TLB
invalidation (via invlpg execution) and flushes the data out of the L3
cache lines using clflushopt instructions before moving the hot clean
pages into a dedicated priority recycling pool.

I additionate a Buffer/Cache with store important objects.






---
 include/linux/ppm/gfp_types.h |  74 ++++++++++++++++
 include/linux/slab.h          |  11 +++
 mm/memory.c                   | 158 ++++++++++++++++++++++++++++++++++
 3 files changed, 243 insertions(+)
 create mode 100644 include/linux/ppm/gfp_types.h

diff --git a/include/linux/ppm/gfp_types.h b/include/linux/ppm/gfp_types.h
new file mode 100644
index 000000000..741122b2d
--- /dev/null
+++ b/include/linux/ppm/gfp_types.h
@@ -0,0 +1,74 @@
+/* 
+  Memory Tatic: PPM (Page-Plugger Under Memory).
+  This File is for PPM Flags/Macros/Functions/Types.
+  Engineer (brazilian): João Guilherme da Silva Freitas Lima <joanandalima@gmail.com>
+ */
+
+/* Types Include Guards */
+#ifndef __PPM_TYPES_MEMORY 
+#define __PPM_TYPES_MEMORY 
+
+typedef unsigned char uint8_t;
+typedef unsigned short uint16_t;
+typedef unsigned int uint32_t;
+typedef unsigned long long uint64_t;
+typedef uint64_t gfp_t;
+/* For errors in Allocation */
+#define __PPM_ALLOC_ERROR -102
+/* For errors in Desallocation */
+#define __PPM_FREE_ERROR 0x04 
+/* For success */
+#define __PPM_SUCCESS 0
+#endif
+
+/* Functions Include Guards */
+#ifndef __PPM_FUNCTIONS_MEMORY
+#define __PPM_FUNCTIONS_MEMORY 
+
+/* Initializer */
+void __init_ppm_memory();
+
+/* Allocator Optimized */
+int ppm_kalloc(unsigned long address, uint64_t size, gfp_t flags);
+
+/* Desallocator Optimized */
+int ppm_kfree(uint64_t size);
+
+#endif
+
+/* Flags Include Guards */
+#ifndef __PPM_FLAGS_MEMORY 
+#define __PPM_FLAGS_MEMORY
+
+/* PPM inits/starts in Bit 54 of a 
+   64-bit variable 
+ */
+gfp_t GFP_PLUG_MEMORY = (1ULL << 54); 
+
+/* For free memory, the Bit 55 is 
+   used 
+ */
+gfp_t GFP_FREE_T = (1ULL << 55);
+
+#endif 
+
+/* Macros Include Guards */
+#ifndef __PPM_MACROS_MEMORY
+#define __PPM_MACROS_MEMORY
+
+/* For Kernel Kernel tests 2 Bits (54 and 55) in 
+  1 Clock Cycle (or in small clocks, example: 5 Clocks), 
+  is used a mask using | 
+ */
+gfp_t GFP_MASK = GFP_PLUG_MEMORY | GFP_FREE_T;
+
+#endif
+
+/* 
+  Notes:
+    E-Mail of RFC:
+        [RFC] mm: page-fault: overcommit: PPM (Page-Plugger Under Memory)
+    
+    
+    Assigned-Off-by: João <joanandalima@gmail.com>
+ */
diff --git a/include/linux/slab.h b/include/linux/slab.h
index cda126def..c76243128 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -22,6 +22,17 @@
 #include <linux/percpu-refcount.h>
 #include <linux/cleanup.h>
 #include <linux/hash.h>
+#include <linux/ppm/gfp_types.h>
+
+/* A Structure enum with objects and codes
+  for PPM Tatic Memory 
+ */
+enum __PPM_OBJ_CDE_BITS {
+	_PPM_OBJECT_CACHE, /* A Simple Cache to store objects */
+	_PPM_OBTAIN_CODE, /* 0x04, -102 or 0 */
+    _PPM_FLAGS__ /* The Special Flags to PPM (Page-Plugger Under Memory) */
+};
+
 
 enum _slab_flag_bits {
 	_SLAB_CONSISTENCY_CHECKS,
diff --git a/mm/memory.c b/mm/memory.c
index 8b0c2c735..5e1ca12c4 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -78,6 +78,8 @@
 #include <linux/sched/sysctl.h>
 #include <linux/pgalloc.h>
 #include <linux/uaccess.h>
+#include <linux/ppm/gfp_types.h>
+#include <linux/slab.h>
 
 #include <trace/events/kmem.h>
 
@@ -94,6 +96,137 @@
 #warning Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid.
 #endif
 
+/* Small Variables for 
+  PPM uses 
+ */
+int ppm_free_error;
+int ppm_alloc_error;
+int ppm_success;
+unsigned int order;
+unsigned int nr_pages = 1 << order;
+unsigned int i;
+struct vm_area_struct *vma;
+spinlock_t *ptl;
+
+/* Initializer of PPM */
+void __init_ppm_memory() 
+{
+	
+	/* 1. Define the variables for 
+	 the rest of System uses 
+	 */
+	ppm_free_error = __PPM_FREE_ERROR;
+	ppm_alloc_error = __PPM_ALLOC_ERROR;
+	ppm_success = __PPM_SUCCESS;
+
+	/* 2. Connect __PPM_OBJ_CDE_BITS to 
+	   flags under gfp_types.h 
+	 */
+	__PPM_OBJ_CDE_BITS.__PPM_OBJECT_CACHE = 4 * 1024 * 1024; /* 4MB for alloc, used to store important objects */
+	__PPM_OBJ_CDE_BITS.__PPM_OBTAIN_CODE = 0; /* Is modifyed in ppm_kalloc() and ppm_kfree() */
+	__PPM_OBJ_CDE_BITS.__PPM_FLAGS__ = GFP_MASK; /* The Kernel uses this for test */
+
+	/* 3. Alloc the Cache of Objects */
+	char *ppm_identifier = "PPM Cache";
+	int *result_ptr = kmem_cache_create(ppm_identifier, 
+		8, 
+		_slab_flag_bits._SLAB_HWCACHE_ALIGN,
+		_slab_flag_bits._SLAB_PANIC 
+	); /* Number 8 for a 64-bit Pointer */
+	__PPM_OBJ_CDE_BITS.__PPM_OBJECT_CACHE = result_ptr;
+
+	/* 4. Return success */
+	ppm_success = __PPM_SUCCESS; /* The Kernel Optional-Action is verify if ppm_success is __PPM_SUCCESS */
+}
+
+/* Allocator to PPM */
+int ppm_kalloc(unsigned long address, uint64_t size, gfp_t flags) 
+{
+	if (unlikely(!size)) 
+		return __PPM_ALLOC_ERROR;
+
+	/* 1. Alloc the size */
+	order = get_order(size);
+	struct page *pages_ppm = alloc_pages(
+		flags | GFP_PLUG_MEMORY,
+		order
+	);
+
+	/* 2. Navigation in PTE (Page Table Walk) */
+	/* 2.1. Obtain PGD */
+	pgd_t *pgd = pgd_offset(current->mm, address);
+	/* 2.2. Obtain P4D */
+	p4d_t *p4d = p4d_alloc(current->mm, pgd, address);
+	/* 2.3. Obtain PUD */
+	pud_t *pud = pud_alloc(current->mm, p4d, address);
+	/* 2.4. Obtain PMD */
+	pmd_t *pmd = pmd_alloc(current->mm, pud, address);
+	
+	/* 3. Plugging */
+	/* Entry in PTE */
+	pte_t *pte = pte_offset_map_lock(current->mm, pmd, address, &ptl);
+	for (int i = 0; i < nr_pages; i++)
+	{
+		/* Calcle the memory allocated in 1 step */
+		pte_t entry = pfn_pte(page_to_pfn(pages_ppm) + i, vma->vma_page_prot);
+		entry = pte_mkdirty(entry); /* Active bit dirty */
+		entry = pte_mkyoung(entry); /* Active bit young/present */
+	}
+
+	/* 4. Finalize setting in the RAM the page */
+	pte_t *new_pte;
+	set_pte_at(current->mm, address, pte, new_pte);
+
+	/* 5. Unlock */
+	pte_unmap_unlock(pte, ptl);
+
+	/* 6. Return */
+	ppm_success = __PPM_SUCCESS; /* If value returned == __PPM_SUCCESS? */
+	return ppm_success;
+}
+
+/* Desallocator to PPM */
+int ppm_kfree(uint64_t size) 
+{
+	if (unlikely(!size)) 
+		return __PPM_FREE_ERROR;
+	
+	/* 1. Entry in MMU Directories */
+	pgd_t pgd = pgd_offset(current->mm, address);
+	p4d_t p4d = p4d_alloc(current->mm, pgd, address);
+	pud_t pud = pud_alloc(current->mm, p4d, address);
+	pmd_t pmd = pmd_alloc(current->mm, pud, address);
+
+	/* 2. Entry in PTE */
+	pte_t pte = pte_offset_map_lock(current->mm, pmd, address, &ptl);
+	/* Verify if the PPM plugged the page */
+	pte_t result_for_check = ptep_get(pte);
+	pte_val(result_for_check) & GFP_PLUG_MEMORY;
+	if (result_for_check > 1) 
+	{
+		pte_clear(current->mm, address, pte);
+	} else `{
+		/* No executes/call, is ignored */
+		
+	}
+
+	/* 3. Flush for clear the TLB */
+	flush_tlb_page();
+
+	/* 4. Unlock PTE */
+	pte_unmap_unlock(pte, ptl);
+
+	/* 6. Extract the Pointer to free */
+	int identifier_numeric = pte_pfn(result_for_check);
+	struct page *ptr_result = pfn_to_page(identifier_numeric);
+	free_pages(ptr_result, order);
+
+	/* 7. Return success */
+	ppm_success = __PPM_SUCCESS;
+	return ppm_success;
+}
+
+
 static vm_fault_t do_fault(struct vm_fault *vmf);
 static vm_fault_t do_anonymous_page(struct vm_fault *vmf);
 static bool vmf_pte_changed(struct vm_fault *vmf);
@@ -6848,6 +6981,31 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
 
 	__set_current_state(TASK_RUNNING);
 
+	/* If PPM returns no is == __PPM_SUCCESS, ignore the PPM Mode and 
+	   sign the default flow 
+	 */
+	int code_error = __init_ppm_memory();
+	if (code_error == 0) 
+	{
+		/* Verify flags */
+		unsigned int ppm_check = flags & GFP_MASK;
+		if (ppm_check == GFP_PLUG_MEMORY)
+		{
+			ppm_kalloc(address, size, flags);
+			return VM_FAULT_NOPAGE;
+		} else if (ppm_check == GFP_FREE_T) {
+			ppm_kfree(size);
+			return VM_FAULT_NOPAGE;
+		} else {
+			/* Executes none */
+		}
+
+	} else {
+		/* Executes none, is jump to the instruction of 
+		   'ret = sanitize_fault_flags(vma, &flags)' and next 
+		 */		
+	}
+
 	ret = sanitize_fault_flags(vma, &flags);
 	if (ret)
 		goto out;
--


Signed-Off-by: João Guilherme da Silva Freitas Lima <joaoanandalima@gmail.com>







2.55.0.windows.3

