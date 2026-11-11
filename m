Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371948;
	b=XEQC88kHUIQCYs73N4/MIByM6MCnfwBpdA5UPBlD8eL386oO/ylZMiDN/6ZYMOkYpwCv
	 rsSLM8EFfgwTzMcMmA4EqAgUmmeF60DtVhNSc6anRwJTyy3qIDC4hokPWWt9ch5XduNzv
	 Qz2S/T+Y1wW+h5wb2lVjGQ7szKLCkwSXrMg1SBGaO5nOiVXZ4+IbAma1DAM56HzApaiPO
	 RQV8kFAk8jX8wR472WiYF9HrjEGc3m73CKYkrqoxzpAYjcTVDIvvj38iwp5JnkNyPFsae
	 CusKCHdZrWLYpLZO7YZrrRbP6YIHsC8oUTWM8AKohPJ7ndmQ1bzkZtAO4gnk+0X339Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 User-Agent;
	bh=Lvre1MX6Fv185E+vol1UoVO9hXcj6H5AcuzmOlcLq2I=;
	b=sEdqIxDfoTLOre5IyqEBrRySAUGbtq6G1YgN8hDbHtRX/ey8AjCb98mBEDmJcdx++ysT
	 bo2v7V4MmurRrgmDa6T7BOK4yR+ZgmCFnhmpaIV/8az/YzxFixsTEPDSY3YPhn8IZOlVE
	 Epr6PGyKj6Rly25LI2W0NT59dcbFXuMSQKcicQtiJ99cs927HdtijOXhvOUL5hJfWXuNT
	 81zbaSY/g9MgpAroieqR90b1edOmYV0rPZVMg+w3XhWHyN1fzcEH9MCAxnyh00AxZlcQu
	 7p6cxyDjsJoPKK+Rt4ADrH6x2XbUKqStJHQ7ycFLPWGy0Wg5Vh+2rop/a4BAiPoUmrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=eECpWGJ9;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FF8606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1FF8606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=eECpWGJ9
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so18569945e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794371946; x=1794976746; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lvre1MX6Fv185E+vol1UoVO9hXcj6H5AcuzmOlcLq2I=;
        b=eECpWGJ924HObPFFyjouO7gqCet9STG3qFCHDWXwUcCs/NbCDKmZKn2iE68bPTQPwG
         EI+E49FSi217lovg2wwD62VYHP4xOpgAjg2r0vjQms7NJ4ZUDVj2bKphsGLgDDTZS2wq
         njTGu6O2pXp67LZK2pydFQzSSgvI2DVsFWILU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371946; x=1794976746;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lvre1MX6Fv185E+vol1UoVO9hXcj6H5AcuzmOlcLq2I=;
        b=yayGQ7GL7UIdfIgItm3Kf4nJ6eaYO9gccBBjEd/0EoikbevKBDG31K0jp+vf5ntUtF
         ZgSixAgsS5h8xkwb3o3adJPC4h/ntqIL0Wgxb2a6lkLo0EwcyDyx6h1syxCWZtQy2+1h
         IXLlcPMv1YP/Y5CYq4DAtZjwf7npeF8EBSXAqADuCm2apc3kjZPHnhGK9DkuoBmuL23z
         JNHzzsn8i/eqNDFtaM6V9VDULjSmX01CDwNajmdxew7JJchrtI1rKCAu0TJyczxo//3U
         /2EUdrcRLl+jY1SqmCafwURAeRFbWAmF/fc6W1zzFwP0ZH0OixUUB5c45A9q6zEJkZCL
         9BHA==
X-Gm-Message-State: APuU4Z9bqqGnpLZR0t2MtfHcRuiqNIbxOPEDntJEiBHC56M6F8PGY5H0
	xzEv40/8xSm9mOb8VCf2DzwOU8upQogadeBhB1mpVdbGqXjsjmonForS8tzy+1PwXV4=
X-Gm-Gg: AYBFou0csYKrvV+hMN+OJpNjkCB5iWwmh6BsJu8M90BZ+0rsB4k+Dc9l/o9V/ZFzmoY
	ZkHdW4BTUdSY6EIlArUWKneXStZDKiMGZQpotkOfLkS95U7NPnaBwmv3ySPg0KnyGjcDR0woriG
	7U9dok5yj+X3Mitl6QI66OswEHAgoy4Y00EbwFnxA8FpvMYL0utCnKUtmPHH6scTGUL+Rrcdnu3
	mzFKOgCCPyLx0mchRgogMUGsKJii3Oot0YSIcGE8OCt77EXK9gDQ5nO6G+klFjdKKB5Ki3nbK6l
	6Q+CkEsXaamOVGCYDeHSSmFlSvlEjokSgunbr0z9w8XlO+lctGqLDR8XDpgmvbIGqCG9gIx4nCC
	1GrIYvrar5k3YEQ1aUk8VO0yOWEWb+PutX+9NWNIMtt3YdKS2AShiq2eaqHgJ38i2vAMGZACHAc
	rrA8JynVfhnKCs/3HxCf0PZ0aTvHst/H3AQzOx/eADCV7ThS+hmyuEMF0FUoiF/CJL7z5cPtqh9
	0RU2PDlmPnDFQyfrljor0j7Si5tZsSZOGaXtCBWuZoSxv03AiFO5FOHbdKva0CjZoxX46lgszWx
	s2K9WLfXpQ9mAcUYuryEP2JlIZpkQOa0R4GEugc0wTZxREppGdeD/sQXIC+4vfZKbq6Q6L97kWu
	xMuxT1jqc6phnQO8KFGFDzS+b6eoQI/YM9GY7P+fxhlXY7laoPfPARawP0aSjuX3BSBKk38apew
	WxzDP96+sQil2ZX8kDBydAbBzpwSGG4GyC+8wVTiSGT54DwcEBL5PN
X-Received: by 2002:a05:600c:4f15:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4ba093d4aacmr18204945e9.35.1794371945737;
        Tue, 10 Nov 2026 20:39:05 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm124440165e9.15.2026.11.10.20.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:39:05 -0800 (PST)
Date: Tue, 10 Nov 2026 20:39:02 -0800
From: Chris Down <chris@chrisdown.name>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Mark Rutland <mark.rutland@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: [PATCH] arm64: hugetlb: Prevent write fault livelocks on stale TLB
 entries
Message-ID: <avPxZjjdBIlM_8_g@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

In Meta production, we have had tasks get stuck in a fault loop while
using hugetlb on arm64. During my investigations I found that affected
tasks share a private hugetlb page.

Looking at the stuck task states, I found the following ordering:

  CPU0                                 CPU1
  ----                                 ----
  read page
  [read only entry cached in TLB]
                                       write page
                                       hugetlb_fault()
                                         hugetlb_wp()
                                         [reuse folio]
                                         set_huge_ptep_maybe_writable()
                                           set_huge_ptep_writable()
                                         [flush local TLB only]

  write page using stale entry
  hugetlb_fault()
    huge_ptep_set_access_flags()
    [entry already writable, no flush]
  retry write using stale entry
  [fault indefinitely. well, that's not ideal!]

The reason is that when a write fault makes a non-contiguous hugetlb
entry writable, it only invalidates the local TLB. However, another CPU
can keep the old read-only entry, so its write will fault even though
the page table already permits it. hugetlb_fault() then finds nothing to
change and leaves the stale entry in place, so the same write keeps
going round in circles.

This is particularly bad because, if the kernel is copying to user
memory, the retry stays inside the kernel and the task can't act on the
pending signal.

It can even remain unkillable while holding locks across the copy,
resulting in further failures. For example, a read into a hugetlb
buffer can hold the pipe mutex and block other users of the pipe until
the loop ends, causing cascading lockups across the machine.

To fix this, when a write fault finds nothing to change in a
non-contiguous hugetlb entry, let's invalidate the local entry.

Fixes: cb1fa2e99955 ("arm64, tlbflush: don't TLBI broadcast if page reused in write fault")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 arch/arm64/mm/hugetlbpage.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 8e799c1fe0aa..ff1f53e435e1 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -429,9 +429,24 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	VM_WARN_ON(!pte_present(pte));
 	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
 
-	if (!pte_cont(pte))
-		return __ptep_set_access_flags_anysz(vma, addr, ptep, pte,
-						     dirty, pgsize);
+	if (!pte_cont(pte)) {
+		if (__ptep_set_access_flags_anysz(vma, addr, ptep, pte,
+						  dirty, pgsize))
+			return 1;
+
+		/*
+		 * Another CPU may have made the entry writable without
+		 * invalidating our stale read-only TLB entry. To avoid
+		 * indefinitely faulting on this entry, flush it.
+		 */
+		if (dirty)
+			__flush_hugetlb_tlb_range(vma, addr, addr + pgsize,
+						  pgsize,
+						  TLBF_NOWALKCACHE |
+						  TLBF_NOBROADCAST |
+						  TLBF_NONOTIFY);
+		return 0;
+	}
 
 	if (!__cont_access_flags_changed(ptep, pte, ncontig))
 		return 0;

base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.54.0

