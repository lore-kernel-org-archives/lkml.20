Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.60
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718864;
	b=0zJKvFNxXO+SqGNRuJ8JZwTRtMG0OTURbpzRRzKsM+oW2pysBn5xAhYL+ADdsrU/CRAM
	 278IzZGUJQDjI+gX6ZT6LAaPz0+s1LW0fW/kLfR4BI3g26yuVsaGJtvD1bhiholDaUtGN
	 KZpu4VxEeOaxm5KsHB1E9heYXb5iaE8uFQ1EI2j89i8ru+Qe3FudQ0OXYhTluwJDJ9roc
	 rD1AGQ7gSpkyK1/Z6NPTffGWq8VA83kkqCqI00YG0BV9RZQOjZqV2ASTcqwG0M1Gke/yU
	 iJ21YQeTlNV42yrdYcw/twKZre+AntjU2ii4yuDk3ybychyH349IdwO7Abj9/6FZjcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718864;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=14hcT6F4fj8zJj0gPfB9WiAi+uaybopFKajULVBMQnI=;
	b=OBq88fIoQos0ubhtNfanWeghNTx5Zi89A3FtbKyCeI5xKIbUoY5gdioxefpT0p3VhAr4
	 Vgw3mYVpaEvyTYKNEGbHEyVPK1UxCus67VxYYS1qeCqLUqtid5Wv8t85Oc2I9tUDaZsIu
	 2tW32bjNC0XD48EGV49Xjt8GhXvzDw3M1ZGlS7rGo+w9HiU/PKEae0NnbdaMY5CaqSpTS
	 zlwZCxdgspI7ETTZJoiU+A5aa5w+MUPIVY3xSWrjpEDggOrQ8HhLNQJ1RljJN2uZxjjnL
	 Ti7ziWbu3CYaGSCQa/v64yHvZXnySzcFnl78AkDkFn0wqtuD8yW9XMfxZI2jQrpi16g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ts5HB9y2;
	arc=none smtp.remote-ip=91.218.175.60
Received: from mta0.migadu.com (out-60.mta0.migadu.com [91.218.175.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEC2606A79F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DEC2606A79F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ts5HB9y2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/n6q6+lIX9B5ZuliSLqd+JJa2B0QDGQRcHf36WsHI7Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793718861; v=1; x=1794323661;
 b=ts5HB9y28ZzWXoUo+d+m68JgTc6d40SOeizyYnSAdoBpXnsyKf1HioVJw2sd1J/ysygB1Kx/
 e64gLcGfgRbQFzbr3FKFgzMKXjBuYVURrWLNzVd6xMUrDy71PsneXa7FBxNvenPg4GGPhTAsRVD
 8G1VawouDX2sNWIeVN26sFcM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 198054973b778b6a;
	Tue, 03 Nov 2026 15:14:20 +0000
X-Mizu-Trace-ID: 198054973b778b6a
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Lance Yang <lance.yang@linux.dev>
Cc: Usama Arif <usama.arif@linux.dev>,
	akpm@linux-foundation.org,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	ying.huang@linux.alibaba.com,
	baoquan.he@linux.dev,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	liam@infradead.org,
	ryan.roberts@arm.com,
	vbabka@kernel.org,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com
Subject: Re: [PATCH v8 00/30] mm: PMD-level swap entries for anonymous THPs
Date: Tue,  3 Nov 2026 07:14:15 -0800
Message-ID: <20261103151416.1720617-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004030844.90483-1-lance.yang@linux.dev>
References: 
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

On Sun,  4 Oct 2026 11:08:44 +0800 Lance Yang <lance.yang@linux.dev> wrote:

> Hey Usama,
> 
> Staring at the swap-entry bits across architectures, and RISC-V looks a
> bit off in that regard ...
> 
> With Svrsw60t59b and CONFIG_MEM_SOFT_DIRTY=y, setting swap soft-dirty also
> sets _PAGE_EXEC. A migration PMD then looks present ... so the fault
> handler skips the migration wait :(
> 
> And yeah, this is a pre-existing bug. I've sent a separate fix for it.
> 

Thanks for the fix! PMD swap entries also preserve soft-dirty, so the
same encoding issue affects this series. The dependency note lists
your separate fix for RISC-V with Svrsw60t59b and soft-dirty enabled.
It applies cleanly and preserves the exclusive marker at bit 6.


> https://lore.kernel.org/linux-mm/20261004030312.90163-1-lance.yang@linux.dev/
> 
> BTW, could we also add more checks to pmd_leaf_soft_dirty_tests() so we
> catch this kind of issue early? Setting a swap flag shouldn't make a
> non-present PMD present, IIUC.

Done. The pgtable test now sets swap soft-dirty, checks that the flag
is set, and checks that the PMD remains non-present.

> 
> ---8<---
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 863111c6d4eb..80686e2baaa1 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -762,7 +762,9 @@ static void __init pmd_leaf_soft_dirty_tests(struct pgtable_debug_args *args)
>  	WARN_ON(!pmd_is_huge(pmd));
>  	WARN_ON(!pmd_is_valid_softleaf(pmd));
> 
> -	WARN_ON(!pmd_swp_soft_dirty(pmd_swp_mksoft_dirty(pmd)));
> +	pmd = pmd_swp_mksoft_dirty(pmd);
> +	WARN_ON(!pmd_swp_soft_dirty(pmd));
> +	WARN_ON(pmd_present(pmd));
>  	WARN_ON(pmd_swp_soft_dirty(pmd_swp_clear_soft_dirty(pmd)));
>  }
>  #else  /* !CONFIG_TRANSPARENT_HUGEPAGE */
> --
> 
> [...]
> 
> Cheers, Lance
> 
