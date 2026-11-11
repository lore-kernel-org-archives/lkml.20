Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389889;
	b=C1MMkWvHsvTjAKVi3IZP0OPrFLkEaeQJsZSjhBHx2iC9v4UsWS3k+UdczqV7QSDa/AS5
	 Wlodfuo493f38Y0KA/sH/NvEL4iTG1oBPP0i1RHNSesflzcNHDBjhjkR10F0nNPCp7wTW
	 tx3VHSYQcmICejWjwxInqx9EvMbkhFdktQVLN90gOz8GDKtkRQ+p/I04Jrqdl2QyzSYfJ
	 +1RtELyk8t7LSIf5KqvVeqyNyPKMzFE3J62eija9CLGyebiVrBOReesj72VJ7wVcCowv0
	 q5IqTvU1nyk83kZ+DoprUTrBDKQO3n2Golw/O69IejsIuDh9YvdWpyJ2EQEZmDG1ihQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nNJ7JQckRH+BEIq6xP+FgdYGraXKkj9NjALFdeEe068=;
	b=SrINecJmLoOVgHJ1S1cHELmsG+qEpfwWi8XzJxojiD4IZxZHsUk3LDDmFXUq632AJHxA
	 55FBPocdkoP3ad/kZ4cmnCPfoPDKXokRrfFAEf8q2dBB7s9j5rWN6UYy/3xnB8sPxH7Mr
	 sMzYAEViFjSHUwmWotAB6ftNs2hTeriIoP+i/jv3nZwN3fu4TgLrV3Yr88xH6cqKaEAAI
	 dDrZIgt3RcA7YWnQxGABHziuhoJo4JoRqh/B9XvXFI8RMDGaUjP10oEf8osTiW0S6uWjP
	 mEHaK28/ICS+JcnWw8T8yXJKjvtPtKbrmhwhR0x8l+h7QIntT6Ske3odBN9uvkRE/2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Hp8TINu+;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E63860A2623
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E63860A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Hp8TINu+
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37071c0f42aso5165760eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794389888; x=1794994688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNJ7JQckRH+BEIq6xP+FgdYGraXKkj9NjALFdeEe068=;
        b=Hp8TINu+StVbWUF9STZfwLttRriFG4m/TTYAn77RmTP7oLZkquAPtP7LDofs0l6YaA
         mXPlO1+FE4H4/APt9LqPOS0nTpcaffuF2gWKMGdl3AfVowWkxWwy52ja0UhNR47UMD+Y
         4j40IXj6fEW45aK8lxNu1G/qBPELv/6Hno8gmS4aaanQb5hJaGZ4m4T6cPO54tLdpr0K
         VsBWhYE12WYodlVzWVPNWM5eoMXBgee/68IdlhFwMsn4fD9WhAhs6Hkpp69nM/2ImCoY
         kI9t8I/N1m32OIEnHE7hjkAHX7GsKZSJPJnve5ZY2Pif67LTxxy+heRKCrEHX3ZsqrxJ
         bY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389888; x=1794994688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nNJ7JQckRH+BEIq6xP+FgdYGraXKkj9NjALFdeEe068=;
        b=hjM8AjVKmhPW+MP7AHLN6+XzBuUC6lh2LfC4FXjbRkOz8m4y2drtA3VjB4ATv5vOF7
         nKWhUdUVDraFeQQS0AM60F4WIzDVHwMy6XBvzQvGhvvxSEVbwNwkkYkSJ/ya67I+3+7U
         bxEo1RgF3J+j+ZE9y+bPHQLTvgG35YI2PDuHK+AcBtVkwl01qwuEXI+ixI8KPYLdgdWJ
         wBuLE+EyM9e6V4F48adAJOcRqLhWdi0Ish4b3z1dserBhUTStu0kEkIM0y5P/nE4VHkq
         UOXNe8NPtcilfaAGydEegSyzHCzTo7wjJ4HJtp916IExkDFy8x48wdlV2AVGkMRBIHTR
         zYeQ==
X-Forwarded-Encrypted: i=1; AL+hErG4cNZiwcFOtFO6VkHGzIRWKBvQ7ysJ5S++v9Uw860V/8XZE9YRg3yqQsi71DZ1HyHcYX829ujXzVy8mkM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ehjHxbL+MEpydHK0BiFnDrrajYcW+wvC6+0AbJVXtt1Ce2DP7
	vsJpohOF+2ZcOgMlX1y1oH5V+0rToRPB1s1pRqat7OY0hEVObKxxH+BCWDQhngJ6zds=
X-Gm-Gg: AYBFou25YuZLiekong8JR7oBkcGK9ts1tseqDdpywyeeXSvpt4nRIh6NSiKh4CygBDl
	ruGwF2G9w7M5EaEnLA42cYlSfW5PqRUt29fr9ioC80UBJ15Kagb8JWB4gUwcGjW0u/o4p0xkyyr
	i16D3IOOFdKLuKx5cxSoWInzVqPqCZnTD1+qy+/HHEmKsrXOlSLGEc/AWCc6YHXTOVPheeVcSDr
	2/ZKPJrPgGtyZVoboOOCRKRaR9cQP1WGmr/pb09Nndixc+rDnmOZEq6BEw1ez901RjXMgkG2ZAI
	e/zPSEjVMIkE1a70ouXuAGCvSHcgtmix48sJ9nTyduvGsqhBgO8tEbKMYKnfsKgujbS2SEj4IF+
	4/NQhx+9u2nKpZs0MzusbmoaQRrZOGSP7Hla0HEQJRNsusuNFGjQR6UZekmWVyHQvXhnqFlDOrU
	DtHmbc+6v7OmU47DSkLmwcyZ8/4FzljEginVbq+P6HIuSiFGa6Owh6X9o/N0MGkDk4QtfKhccUl
	v3MixEJnLsqbSo3gzZO6X5dchbJeznulp2UvMOVAciH484xuQSVO5xNNSxlDNiIpWzHovXTxnqz
	UAQeMeZ/pu49cYYD+vyWnOD23csMrFjnHWrrVb5jGCrwLtMhHJ3tWgKB5k24vA==
X-Received: by 2002:a05:7301:4902:b0:376:f63a:cb24 with SMTP id 5a478bee46e88-376f63ad124mr1305017eec.3.1794389888322;
        Wed, 11 Nov 2026 01:38:08 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm29016749eec.23.2026.11.11.01.38.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 01:38:07 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miaohe Lin <linmiaohe@huawei.com>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/3] mm/hugetlb_vmemmap: fix deadlock during PMD split
Date: Wed, 11 Nov 2026 17:37:46 +0800
Message-ID: <20261111093747.50048-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111093747.50048-1-songmuchun@bytedance.com>
References: <20261111093747.50048-1-songmuchun@bytedance.com>
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

vmemmap_remap_range() currently walks vmemmap page tables under
init_mm.mmap_lock. If the walk reaches a leaf PMD, vmemmap_split_pmd()
allocates a PTE table with GFP_KERNEL and can enter direct reclaim:

hugetlb_vmemmap_optimize_folio()
  vmemmap_remap_range()
    mmap_read_lock(&init_mm)  <-- outer read lock
    ...
      vmemmap_split_pmd()
        pte_alloc_one_kernel(&init_mm)  /* GFP_KERNEL */
          <direct reclaim>
            ttm_pool_shrinker_scan()
              ...
                change_page_attr_set_clr()
                  mmap_read_lock(&init_mm)  <-- self-deadlock

Since commit d5d8b8662e6e ("x86/mm/pat: Acquire init_mm read lock on
attribute changes to avoid UAF"), reclaim through TTM can enter CPA,
which also takes init_mm.mmap_lock. If a writer is pending, the nested
read blocks behind it while the outer read cannot be released, causing a
self-deadlock.

HVO walks vmemmap ranges whose intermediate page tables remain present.
vmemmap_split_pmd() revalidates the PMD under init_mm.page_table_lock
before installing the PTE table. Use the lockless page-table walker so the
allocation no longer runs under init_mm.mmap_lock.

Fixes: d5d8b8662e6e ("x86/mm/pat: Acquire init_mm read lock on attribute changes to avoid UAF")
Cc: stable@vger.kernel.org
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/sashiko-outbox-206969@kernel.org/
---
 mm/hugetlb_vmemmap.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 6fba3184356c..5852b0a1c479 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -161,10 +161,8 @@ static int vmemmap_remap_range(unsigned long start, unsigned long end,
 
 	VM_BUG_ON(!PAGE_ALIGNED(start | end));
 
-	mmap_read_lock(&init_mm);
-	ret = walk_kernel_page_table_range(start, end, &vmemmap_remap_ops,
-				    NULL, walk);
-	mmap_read_unlock(&init_mm);
+	ret = walk_kernel_page_table_range_lockless(start, end, &vmemmap_remap_ops,
+						    NULL, walk);
 	if (ret)
 		return ret;
 
-- 
2.54.0

