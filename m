Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794889648;
	b=ayXc4pOBw2/knCDoKJy308Wa7Gca96uJcFypRz+Z+GZJNNmg8VEqeS+gmt11aHc3T3gI
	 MtRZ3NWeTOwSoMLncvh++eA1NfNjUTAL127+4/Cp4NP1RZtrUTQoIPcVwMsaESexj96lc
	 Wds8uPdkp2vwTL/wGi01j0zrEq96uu2N++lDigcHSg37723jLwQEd3MwrMlEhOBZkU8Cd
	 mqzx/EY8H/XxPogL3iOhad2mMkxz7uX+bEUjyD4mBvIQnF9cI2ZGMBKCj4QSNNQgxUwia
	 kT5BNhs/yNMnms+vwy4GQwdyJdZG6iEhhMk5tvjUL6K2S1HFqnwaoik0/OH+B6LocEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794889648;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2zmCg2Oecp7ztUG+EKti0RUYQInlo6S9bwE8WEcIlQU=;
	b=qeSWAtSg+g/bF3Y1K614bpcrduPoE9Pu23MRrXOlzGAcF53b9jiyrUnue2LLMXcAkdrN
	 VLbZ2HghnUE8w4QRkA1F0MQJAryi0ynMLP3KCWT7PuAEN/jbHh1vTLLxQVFet0FS2BX4i
	 dDrv8lNySoUBV3srQtv4FJDRsCJairjLTv51w6OgJ/45UdCeSeTfps3cfEMR8GTldFo85
	 quKn8yPKCNV4Wvrn3f12UqUxgQT8JyKsxvsbi3R5KPTeabdHuvKe0vK8dsl7Rbn+frj+t
	 vlskQ2LCNMl0H/ipigH/wGfUMwUu3aAB52vASm6SIrvvaaSdqYnrZDJGBMzqC0e6F1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b="tiGY/6R8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F289606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=tiGY/6R8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571C81F000C4;
	Tue, 17 Nov 2026 04:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794889647;
	bh=2zmCg2Oecp7ztUG+EKti0RUYQInlo6S9bwE8WEcIlQU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=tiGY/6R88Xv6tkOElYGGFwbeGFw56Z2EvbMoJl+3gqynhYYcvmMNvHPjyJIeLDlPg
	 lccFyWVb8L0IspShQx9GxDurBHXRIvCa77GqslLcfx5ngrAnEWJhgKDgnnvdbVigFs
	 b1VD33rJvReWLpzMlxkCQMWbpYzdOngY/5Klb2iY=
Date: Mon, 16 Nov 2026 20:27:26 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: david@kernel.org, ljs@kernel.org, riel@surriel.com, liam@infradead.org,
 vbabka@kernel.org, harry@kernel.org, jannh@google.com,
 lance.yang@linux.dev, qi.zheng@linux.dev, baohua@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: synchronize with PTE table reclaim for all folio
 sizes
Message-Id: <20261116202726.b6690f9038557df945f8b007@linux-foundation.org>
In-Reply-To: <71980310d9bf1bf9733ea0e4b772635e1b2bc5c5.1794886401.git.baolin.wang@linux.alibaba.com>
References: <71980310d9bf1bf9733ea0e4b772635e1b2bc5c5.1794886401.git.baolin.wang@linux.alibaba.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 11:40:22 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:

> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped
> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can also race
> with concurrent page table reclamation via zap_empty_pte_table().
> 
> page_vma_mapped_walk() is used by many functions including try_to_unmap(),
> try_to_migrate(), folio_mkclean(), pfn_mkclean_range(), remove_migration_ptes(),
> page_mapped_in_vma(), and mapping_wrprotect_range(). Except for try_to_unmap()
> and try_to_migrate(), the other callers do not perform post-walk accounting
> checks, so the race has no observable impact on them.
> 
> For migration, the race can cause unnecessary retries. For reclaim via
> try_to_unmap(), the race can cause failure to reclaim a folio that is in
> fact already unmapped (as shown below), which may cause cold/hot inversion
> (e.g., in MGLRU) and increase refaults. In extreme cases, failing to
> reclaim unmapped large folios could even cause OOM in theory.

Thanks, I've updated mm-hotfixes-unstable to this version.

> Changes from v1:
>  - Update commit message per David.
>  - Add reviewed tags from Qi and Lance. Thanks.

Confirmed - no code changes here,
