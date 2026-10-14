Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5144544606A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014899; cv=none; b=Y4mbk4gV4kFJzhwZl8+Q0IDCjBOlhQvreoH738bUxRHM2AeoSh5m2AEyW6g9awNKhOAuuifcVOFj3x9/HueAF0/iQZYTdzp9RU3WG6WQl4M835WCC1z465sztqir8XfxC8b5uuBAh3y3uM4rjNuA5NitNiT8iwKrSl9wubcKhEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014899; c=relaxed/simple;
	bh=yMukrBATHtbXIjJyDVvtM8O4+eb2xYQkHVtkfkAjCp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwVH/s4QWSqd+RndDNA/p+WLsDFDxFhMRN07NbsypWjpFxIluC3+0GP70TTeBzJDXdOqmwkakpRb09e1YOsYoYGxLBZ41+Vah3p75L9CaPOjopg8/ZFC+95PBsHOSdiobCIBO8ZZBOU8Qi3IPzzH9BEk6CGEmt6zpAogNIU7g4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJ38oXNC; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJ38oXNC"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-887a58523e6so1395762b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792014898; x=1792619698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tl/r+D/W2AcJoY8jPgxUQJOscK/kJH6tWblshAIN4Q=;
        b=FJ38oXNCW5nNn9M/xm+sY/euCorfghiGn/J6B7Ppzs5DjA2q1JEhy6dCO1D1uXkxtF
         nw10DbpnE5udcMaf7FPxKbCwdHLEGpLI44eM+Wu1RRxOAskgrPIRU0WIWJRqOPK/ZBnB
         jgeAHB9qvB8FnQsrG2nwUJj1MYTWdrNuJjubaIKNB9xjDLNi8vjMfc1BbJgV/A/TEj+V
         CpodOxR+D80tr4kf4bvt6cdol/+3EsdjXZEj3jSAylcsLZzJrMbiuTOWDwPYyKmkz5pO
         eJuZy3OxfABf7/rsQ0Zk194oK5fTnmwb3Cp18IpwpiZMzIFhM6tOh2WuBrkIb5lsR6ag
         1h4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014898; x=1792619698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+tl/r+D/W2AcJoY8jPgxUQJOscK/kJH6tWblshAIN4Q=;
        b=XwG4nxA/5VKgptoYHP9M6PKn1EQ5QF8LB+sMYEnGuDy2AXb/Kef5GoNAL6StQOj+dJ
         fnwUu7RpYXIS2g/aKZLGB7dOe0rwuY8yn1Zu+vuWQd650DREGnGBycoFJbwxePV60six
         qSeLnq3F6V9LXnQzHksIU+fSWi3WMRArWe3aQewN8SpMgN5AWWdynmAhcwsbSzb6jxiP
         5/UHiUm3LxeIOiLkdPqcN1S2W9rx43Z3S3xg+f9C5Sk/9iRlGcyIG8czZ2QsYwwZPnvP
         jkt/k2vauxU8tenYljQCaQzG4TJzMUqeHFwCUMhLkiqWhTX6FxKaVvSKR98suR0QpphT
         wCxQ==
X-Gm-Message-State: AFq9FYJ/iiUN4sfC7xKN+OF3HS3G292PIXsvhBOsSYQ9O4ZmRy0HIGJq
	fx0zAAQ/JKgrnjn54jB7gvy3uB6uMdngKy0O5BFDLm5KjXtCu2LM5xNi
X-Gm-Gg: AYBFou0xSn2q1Mila76gXU6+c++xZbHAx6ERmrrxnOehq0PoG4IwIodNxVGTyNOG8pw
	ZygBNrEpQZ5aTyLg8iBJ5b6z7yqmzPaRfkwdlTifHv4OdK683/Me+ttnC2t9RKbpZqlCR9UjIWa
	dm1PHtbaFZLWllQSMzcC6RRlKdvxA8ceRk/ep6ZmL6Gmdj5AkSWEl8WBr/OcS+jHDpSSQFYmdUF
	et4keu+9h0aGwwZ8MekuK60kf2Akg3IchDkaXs1uK/28ViMIavMwel7ym1mEHprBCM5QGYdj0ZC
	UA8pi9ZGH/qlxa9olQUcdyhW9rn5VOFJnkCXrM4naJCT9ee6Gm9x6Ac35Gzl6foIeq5ofR/2nfg
	Zrpyh9pQcbBUU0vfoBT6b3dCdZIBXyOVsjkap91YtaoDfq4TIqBJwSpL7E7aEnIYweoeGNczgwH
	yRwYhfd3MPW28UFIAdHYlfPvs37mwcKGqgnyS1pIBkaRcWWzUpPLTJF/O7YUDuek/fZUIGaEwxk
	jgOpEfJSTpqjvYR0ukMOQHcrP6bBJP4WjErnZTsVW0F//6pOSofldK2t80J8CEUrl9KAGdjigt4
	9joIBkk6Z/DEosfqnsKyeOo=
X-Received: by 2002:a05:6a21:2e02:b0:3e0:bbb8:bbd1 with SMTP id adf61e73a8af0-3e16be52fe5mr13068365637.45.1792014897554;
        Wed, 14 Oct 2026 14:54:57 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (36-232-253-46.dynamic-ip.hinet.net. [36.232.253.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635c552a0sm280624a12.12.2026.10.14.14.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:54:56 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v3 7/8] mm/gup: walk multiple PTEs per follow_page_pte() call
Date: Thu, 15 Oct 2026 05:54:51 +0800
Message-ID: <20261014215451.515-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811025157.1632867-8-riel@surriel.com>
References: <20260811025157.1632867-1-riel@surriel.com> <20260811025157.1632867-8-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 10 Aug 2026 22:51:56 -0400, Rik van Riel wrote:
> +	for (; address < walk_end; address += PAGE_SIZE, ptep++) {
> +		pte_t pte = ptep_get(ptep);
> +		struct page *page;
> +
> +		ret = follow_one_pte(vma, address, ptep, pte, flags, &page);
> +		if (!ret && page) {
> +			ret = follow_page_pte_commit(vma, address,
> +						     page_folio(page), page,
> +						     pte, flags,
> +						     pages ? pages + nr : NULL);
> +			if (!ret) {
> +				nr++;
> +				continue;
> +			}
> +		}
[...]
> +	pte_unmap_unlock(orig_ptep, ptl);

follow_page_pte_commit() ends in gup_fill_pages(), so the pages[] fill
and the flush_anon_page()/flush_dcache_page() pair for every page of
the walk now run under the PTE lock: up to PTRS_PER_PTE pages per
hold, 512 on x86-64 and 8192 on arm64 with 64K pages.  Before the
series that loop sat in __get_user_pages() after follow_page_mask()
had returned, with only the mmap lock held; 2/8 moved it under the
PTE lock for one page, and this patch extends it to the whole table.
5/8 moves the same work out of the pmd/pud lock, with the reasoning
in its changelog, so after the series the PTE path is the only one
flushing under a spinlock, and on arm, mips, parisc and sh both
flushes do real work.

You already mentioned on 3/8 moving the gup_fill_pages() call out of
the lock so the PUD path can share the helper; this makes it more
than a cleanup.  Storing pages[] under the lock is cheap; could the
flushes move after pte_unmap_unlock() and run over pages[0..nr), the
way follow_pmd_mask() and follow_pud_mask() do it after 5/8 and the
way __get_user_pages() did it before the series?  With pages == NULL
there is nothing to flush either way.

Yuan-Hao Hsu
