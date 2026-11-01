Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793514053;
	b=kAQe62dK/NRuxvva7v4NRBUuywdq8q0H7AW4xMY4XFn9tTKejPDS1qGdKZ/ydaXwC10N
	 AQ59xqnaLwIwDbMWmyoYb+7sYM+colMLLbhqyRtiY41I4d+HeML45mBRP3saSEbLLUdC1
	 JK30FIftYpT3D+UXgn6Ps07C20TkF1qIQ1t1v2ojVsJ+OpogHDNGbh0eLOs26bdVwpSzA
	 kagwIBj40TM5UgCjkDIthc5Je59v4qasF98pZvBa8LaXFgNh+k0FJ9Y3ssTRiwCj2KQ8O
	 L8u2CDo352IOjbouqUeSvlPwyTlXLAjBGkgMnvXknXoOYtMJF4DeDsOe2YVHg46PuWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793514053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=qdpAw2CeVyl2O4/SsZKsGMa/ZVARBuLoVGSK/7j1CNs=;
	b=nDMkSS5SwNglGTHGO83JRAgRbdJqojyxG6GRbYbiPCRd8SPmU9zrbeqg1OmNolMuofR8
	 pq2oe07hdIF/5zVp2IeMI6+UxkropYs5wdbaEJWj0G/SNMdhNJV+2zxsc8rI4FF9wRHlO
	 mC7/1mu/YlSl51EDhSwnLv5K2CR1qN5AxJk6+cWJ8Ecbm/U7aFNNraSOdQKmYs5zqATxg
	 hxtfiXV0fe8lBMMJI018gs0hSzAflOKl5KP02tWVLYHfjq7omk0Ef24Noa+vmlLTOC888
	 faR0vvEzdf6s2GJGYXDGhWjGnfNMn6iKj1Nab5Mkhbu7KonzKViCkik7loXhkKftZ+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VmB0NE1S;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137C2606A334
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 137C2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VmB0NE1S
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b0d864826cso1491359c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793514051; x=1794118851; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdpAw2CeVyl2O4/SsZKsGMa/ZVARBuLoVGSK/7j1CNs=;
        b=VmB0NE1SK1dSZHehZEKpYbNRGVAGQoG9sQbszpc9MIBSgSAjM/pPWk3zq0OiAMzo4P
         aXpZMJ1fu/qHOu4kKnjuHertLWFdhPNWWX4AmRNuu6UImMXGGcdtIGQMsnvpV5Sbtr/q
         5J5Wburg8odMV/IM93Fq91sk6QaDHFBU3aOXdY/lTAnPPejMCw0ztL2fvvYxB1n56ZPy
         a77OdHFYhf912lAi/ZosyYVBgmvlv5B7ky5ESj24tW2XqkmCnSWXBpUm3DUSQe9SsJxC
         ng3ES16VGTLfidOgfPLDyGWmR/ey7i6XpFQw+suc1PhoSmKpAPn9QAkJrGJ3ZX+Q2ini
         T/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793514051; x=1794118851;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdpAw2CeVyl2O4/SsZKsGMa/ZVARBuLoVGSK/7j1CNs=;
        b=XJyedeePU+U+imURzwi7YQLzK0uThVPQW+v2GTjsuGVgOZlorAKZmT9cb+oVHnVKyz
         8YP+v0o0PTFsZHR3gvLHRZEm8aqpmrfqlo2JWOnOBbjCszN3qbi8LN0SVDvy3n7knuDO
         ebQ4/lHgyR2ARXR8+KOKx7F+Y350wEW5aPkXW9T/ShPh0r2XjhwQpa/ajRjco7ezHbZw
         P+0Jc3JadPg8E39tsXpN4srNr+66TlZPXG8iK052kamVgLgdDXhVAzHBvGLgBQ7fD/t3
         UmhwgV0j5mf45WAKamHIe18eoc9wDd81rJ7BlVzNOWSPE+wDOrXYW3VVYEHv5KEobC17
         deMA==
X-Forwarded-Encrypted: i=1; AKwUvBw4YykPAKBuSefpjlkfj+Vn3h4g1Ct2qheOTLQ/vTlueWXfUHGhll7ccBJnBPgDI043LhsGR22WZRfYzTU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtdfHesLcisvsiqoUW6lJ/faQcLih4eRROaEz0IWFStja0fLyV
	qxND86VQ8n3TUehtHkXcVlYC0rCS4Pujbhli0UB3WSqoFfS8LDrUl2NiEQ96mjE53OAmMzhsD5v
	2XxoO5HedbQ/YjGNV0DseY/AmMw==
X-Received: from dlbrx13.prod.google.com ([2002:a05:7022:170d:b0:184:6cc9:b13c])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:3a06:b0:1a5:1c15:9ea3 with SMTP id a92af1059eb24-1ac5ac4b77amr10797606c88.17.1793514050726;
 Sat, 31 Oct 2026 23:20:50 -0700 (PDT)
Date: Sun,  1 Nov 2026 06:20:48 +0000
In-Reply-To: <20261101062049.998160-1-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261101062049.998160-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261101062049.998160-2-almasrymina@google.com>
Subject: [PATCH v2 1/2] vfio/pci: pass FAULT_FLAG_WRITE to vmf_insert_pfn_pmd/pud()
From: Mina Almasry <almasrymina@google.com>
To: Peter Xu <peterx@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, David Matlack <dmatlack@google.com>, 
	Shuah Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	stable@vger.kernel.org, Ankit Agrawal <ankita@nvidia.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"

vfio_pci_vmf_insert_pfn() is the only caller of vmf_insert_pfn_pmd() and
vmf_insert_pfn_pud() in the kernel that hardcodes write=false instead of
passing vmf->flags & FAULT_FLAG_WRITE (unlike drm, panthor, and mshv).

On x86_64, normal MAP_SHARED | PROT_WRITE VFIO BAR mappings usually mask
this bug because vma->vm_page_prot already has _PAGE_RW set. However,
when vma->vm_page_prot starts read-only, insert_pmd() and insert_pud()
with write=false install a read-only huge entry without calling
pmd_mkdirty()/maybe_pmd_mkwrite() (and similarly for PUD). Subsequent
write-protection faults enter wp_huge_pmd() or wp_huge_pud(), which call
vma->vm_ops->huge_fault() to upgrade the entry in place. Because
vfio_pci_vmf_insert_pfn() passes write=false, insert_pmd() and
insert_pud() see !pmd_none(*pmd) with !write, do nothing, and return
VM_FAULT_NOPAGE, causing an unrecoverable infinite write page-fault loop
and host CPU soft lockup on the next userspace or KVM guest MMIO store.

In practice, vma->vm_page_prot is read-only on a writable MAP_SHARED BAR
mapping in two situations:

1. Userspace soft-dirty tracking (CONFIG_MEM_SOFT_DIRTY) when a process
   such as CRIU (during pre-dump/checkpoint), a VMM live-migration loop,
   a memory profiler, or an unprivileged process holding a VFIO device
   fd writes "4" (CLEAR_REFS_SOFT_DIRTY) to /proc/<pid>/clear_refs. That
   clears VM_SOFTDIRTY on all VMAs (including VM_PFNMAP) and calls
   vma_set_page_prot(), stripping _PAGE_RW from vma->vm_page_prot for
   subsequent huge faults.

2. Architectures where shared writable mappings start read-only for
   software dirty tracking, such as arm64 without hardware DBM
   (CONFIG_ARM64_HW_AFDBM off or FEAT_HAFDBS absent), where _PAGE_SHARED
   sets PTE_RDONLY | PTE_WRITE and pgprot_noncached() preserves
   PTE_RDONLY on MT_DEVICE_nGnRnE mappings until pmd_mkdirty() clears
   it on a write fault.

This bug was found by code inspection while auditing huge_fault handlers
and reproduced with a VFIO PCI selftest on a 2 MiB-aligned BAR mapping
after writing "4" to /proc/self/clear_refs.

Pass vmf->flags & FAULT_FLAG_WRITE to vmf_insert_pfn_pmd() and
vmf_insert_pfn_pud() so write faults properly mark huge PFNMAP entries
dirty and writable.

Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
Cc: stable@vger.kernel.org
Cc: Ankit Agrawal <ankita@nvidia.com>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: David Matlack <dmatlack@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index fcbb2da860e2..204d959086e9 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1745,6 +1745,8 @@ vm_fault_t vfio_pci_vmf_insert_pfn(struct vfio_pci_core_device *vdev,
 				   unsigned long pfn,
 				   unsigned int order)
 {
+	bool write = vmf->flags & FAULT_FLAG_WRITE;
+
 	lockdep_assert_held_read(&vdev->memory_lock);
 
 	if (vdev->pm_runtime_engaged || !__vfio_pci_memory_enabled(vdev))
@@ -1754,10 +1756,10 @@ vm_fault_t vfio_pci_vmf_insert_pfn(struct vfio_pci_core_device *vdev,
 		return vmf_insert_pfn(vmf->vma, vmf->address, pfn);
 
 	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) && order == PMD_ORDER)
-		return vmf_insert_pfn_pmd(vmf, pfn, false);
+		return vmf_insert_pfn_pmd(vmf, pfn, write);
 
 	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PUD_PFNMAP) && order == PUD_ORDER)
-		return vmf_insert_pfn_pud(vmf, pfn, false);
+		return vmf_insert_pfn_pud(vmf, pfn, write);
 
 	return VM_FAULT_FALLBACK;
 }
-- 
2.56.0.385.gac671c819a-goog

