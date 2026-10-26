Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013675;
	b=KJT48LQ1BkqM3MFly3CzkuerG2tTQjNq5Bp/Tg1F15/toXZd++AJs3SKLv+Xuxc6Ecw8
	 GDEFfD3sR0Cqt5H/l3EZM3BAHQch1kF85UialLBZN3MHj9YsjqmBQbenTQpVC909Sms05
	 UOfKhr/rYw0bshb4i8xS5Tz/O4hGEQ5eGBhjZi+OWLiwZ/nAxt7o0dRzSYBU0IpeI4MV1
	 QV8HeViZ7Y2wtGvY/RicRG8/V1j847ArUhfG9xBfvrN8H8o7zdJ1xlqVOs3U5kLoD37zS
	 zsQ4W1VGeOdXevfzvstHIUHBiEzHKi1503wA8L+GZcgLqT4m2Zdyl88uZnEZdqDWSFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013675;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:User-Agent:
	 MIME-Version:Content-Type;
	bh=N8+NqHaT8WqMId4+zcLiP9/gsTgp5OXdEZ3QcQaKSLw=;
	b=VkV0kqZpH3cFjUQ3AJD74BJuuDKZwc9n3OxcWJm59JPk8cMDvTgOkufAqPT/NexLrJ8Q
	 uJ/gB2s3kWL+f9IBujW7iewEChT39fZE2wZuxh0Bd5GJskhdfUDmpz7eqTJ7pW2+b6K/G
	 9SJzyYOcBrFKa4qsCidp/9S1nUNoD6xXlLgohQOHjMn5pA6XtP/84U6kR7iYn2l7RDA5g
	 E4xFlPBsBrr8V74sykmsL9NpO6cGoxso60DBs0VlO0Rg9+1VhQ8n5JOWVFwTMBV9fWKam
	 1ZPTjs+Sx5oXq9fsmpGTzJN6ICYskK9AKV/3lZ1q/0Y9w85ggLKqJgGxfgVE5z0uRYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=O83ZnCHr;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3F4606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D3F4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=O83ZnCHr
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793013671; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=N8+NqHaT8WqMId4+zcLiP9/gsTgp5OXdEZ3QcQaKSLw=;
	b=O83ZnCHrddyGz98UqCxNvSCIA5apbBJIXJqX34ZAia41nhsmvVUKWRTOUHygOX+i0uGe8LDpek77QnO9r9ps1zGXFMCBOOM6bDDzOqyqwF9tIXChUOGmAi8qgBAmUxfZA8QHCDxuaybY3AY4JFBtsnfxajz4+IT9Ei25PnCdaJ0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R291e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XDXPkV2_1793013663;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XDXPkV2_1793013663 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 19:21:09 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: akpm@linux-foundation.org,  david@kernel.org,  Kaitao Cheng
 <kaitao.cheng@linux.dev>,  vbabka@kernel.org,  ljs@kernel.org,
  liam@infradead.org,  rppt@kernel.org,  surenb@google.com,
  mhocko@suse.com,  linmiaohe@huawei.com,  nao.horiguchi@gmail.com,
  ziy@nvidia.com,  wangkefeng.wang@huawei.com,  tujinjiang@huawei.com,
  mgorman@techsingularity.net,  chengkaitao@kylinos.cn,
  muchun.song@linux.dev,  linux-mm@kvack.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/highmem: refuse to copy hwpoisoned folios in the
 !copy_mc fallbacks
In-Reply-To: <20261026025724.1430747-1-xiangzao@linux.alibaba.com> (Yuanhe
	Shu's message of "Mon, 26 Oct 2026 10:57:24 +0800")
References: <20261026025724.1430747-1-xiangzao@linux.alibaba.com>
Date: Mon, 26 Oct 2026 19:21:02 +0800
Message-ID: <87pkww7lnl.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Yuanhe Shu <xiangzao@linux.alibaba.com> writes:

> Where copy_mc_to_kernel is defined, copy_mc_user_highpage() and
> copy_mc_highpage() stop at a hardware error during the copy, report
> the not-copied bytes and queue the source page for memory_failure().
> The !copy_mc fallbacks return 0 after a plain copy instead.  With
> PG_hwpoison set while the data stays readable - software-injected
> poison (MADV_HWPOISON, the debugfs corrupt-pfn injector) or a
> transient hardware error - there is no fault to recover from: the
> copy completes, the destination folio carries no poison marker, and
> the poison is consumed silently, the same poison consumption
> commit 841a8bfcbad9 ("mm: prevent poison consumption when splitting
> THP") refused to risk on the split path.

As far as I know, software-injected poison is used for debugging only ,
so I don't think it's that important.  Hardware poison state in DDR is
sticky; that is, even a transient hardware error will cause a permanent
hardware poison state until a reset.

Therefore, the primary value of this patch should be to reduce machine
checks (and panics) during memory copies.  If so, we should place the
check code before copying.

> Check the source folio with folio_contain_hwpoisoned_page() in both
> fallbacks and return PAGE_SIZE, the not-copied-bytes convention of
> the real copy_mc paths, so the callers take their existing error
> paths: the COW and fork paths fail with -EHWPOISON, KSM and
> khugepaged abort, and folio_mc_copy() propagates to the migration
> core, where this composes with the separate migration-side checks.
> On archs with copy_mc this code does not compile.
>
> The check runs after the copy: a check before it would leave open
> the window between itself and the copy.  A flag set before or during
> the copy is caught, whatever state the data is in.  A late software
> injection cannot have corrupted the completed copy, and a synchronous
> hardware error takes an arch without copy_mc down at the access; the
> residue no flag check, before or after, can catch is corruption whose
> hardware report lands after the last check.  Closing that would need
> architecture support, as discussed.
>
> The fallbacks do not queue memory_failure() on refusal: the flag is
> already set, and memory failure either knows about the page or has
> abandoned it.
>
> Suggested-by: "Huang, Ying" <ying.huang@linux.alibaba.com>
> Suggested-by: Kaitao Cheng <kaitao.cheng@linux.dev>
> Assisted-by: LLM
> Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
> Link: https://lore.kernel.org/r/877bjowf9i.fsf@DESKTOP-5N7EMDA/
> ---
>  include/linux/highmem.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
> index d7aac9de1c8a..f90f0c6204a4 100644
> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -474,12 +474,21 @@ static inline int copy_mc_user_highpage(struct page *to, struct page *from,
>  					unsigned long vaddr, struct vm_area_struct *vma)
>  {
>  	copy_user_highpage(to, from, vaddr, vma);
> +	/*
> +	 * The flag can be set while the copy runs, so check after it;
> +	 * a flag landing later can no longer have corrupted this copy.
> +	 */
> +	if (folio_contain_hwpoisoned_page(page_folio(from)))
> +		return PAGE_SIZE;

Why not just use PageHWPoison()?

>  	return 0;
>  }
>  
>  static inline int copy_mc_highpage(struct page *to, struct page *from)
>  {
>  	copy_highpage(to, from);
> +	/* Same reasoning as in copy_mc_user_highpage(). */
> +	if (folio_contain_hwpoisoned_page(page_folio(from)))
> +		return PAGE_SIZE;
>  	return 0;
>  }
>  #endif

---
Best Regards,
Huang, Ying
