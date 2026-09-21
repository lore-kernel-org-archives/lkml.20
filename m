Received: from mta0.migadu.com (out-105.mta0.migadu.com [91.218.175.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E403164BA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970568; cv=none; b=Mfiu6E2xlBrMXtIk5CGiA1hYzPo2ukn9JCv/2m2RIYsj0JcON/rde83dDjZCspoOYuQltTaj44Ai3+XQQB0NtXT3/3oAKea5dUuDMBvDCYbk2BlpVw6WWWu89vPKEXJ5KYr4+Od17Xu9YfQ+csyoCbLUz3yOj2dv69VCUJ4Wf+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970568; c=relaxed/simple;
	bh=PfaHpE1ReZ1v+qkpOG99rma3BnJ5b9o8YklSIsQbmDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pp9UPbbonVIKWgq4MPAmFL4fmUUe8nPfofb/tjI058pr3YGjiF7mAP2a3R1J3SpmkIJC7Nb+81GMeQNy3n66cmpOuE17EoyFEpSv1OIqwZ9KtzdEi9P2FJloNRkn+PqaE2zJDfugapuFFpNHGPbWZq9J12Fdv8xfntAMd8YLRnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EWhPzXWv; arc=none smtp.client-ip=91.218.175.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EWhPzXWv"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PfaHpE1ReZ1v+qkpOG99rma3BnJ5b9o8YklSIsQbmDI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789970564; v=1; x=1790575364;
 b=EWhPzXWvUVnLorbPKvbRGme95f8+50nf2qubpgK5CbqYcyKGyE3YFPrmtKn0clGq2EMRImKM
 HXyIoNFmFrjnHzUJP44fa75CjaajYYxPX7Ep4hsxIV9Bs6cqgA0YVou2eeNgKqBfDhT/tJHPQXl
 eHEPZxWxLZYNp9tbjr2vKCcE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8c663889e002f29c;
	Mon, 21 Sep 2026 06:02:43 +0000
X-Mizu-Trace-ID: 8c663889e002f29c
X-Migadu-Flow: FLOW_OUT
Message-ID: <58fee197-7baa-4507-948e-13b58bc3c6fa@linux.dev>
Date: Mon, 21 Sep 2026 14:02:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/17] mm/zsmalloc: replace PG_private with pointer
 comparison
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, David Hildenbrand
 <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Alistair Popple <apopple@nvidia.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Kairui Song <kasong@tencent.com>, linux-kernel@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Michal Hocko <mhocko@suse.com>
References: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
 <20260920-remove-pg_private-v5-1-bb68b6a21869@nvidia.com>
Content-Language: en-US
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260920-remove-pg_private-v5-1-bb68b6a21869@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/9/21 10:27, Zi Yan wrote:
> zsmalloc uses PG_private to indicate first zpdesc in a zspage chain. It is
> equivalent to check zpdesc == zspage->first_zpdesc. Replace
> is_first_zpdesc() with zpdesc == zspage->first_zpdesc in obj_allocated().
> 
> For get_first_zpdesc(), first_zpdesc is from zspage->first_zpdesc, so
> replace is_first_zpdesc() with first_zpdesc->zspage == zspage, the second
> requirement of a zspage chain, where all zpdescs point to the same zspage.
> 
> is_first_zpdesc(), is only used in VM_BUG_ON_PAGE(), so performance impact
> should be negligible. While at it, change VM_BUG_ON() to
> VM_WARN_ON_ONCE_PAGE().
> 
> It prepares for a future commit that remove PG_private.
> 
> No functional change intended.
> 
> Assisted-by: LLM
> To: Minchan Kim <minchan@kernel.org>
> To: Sergey Senozhatsky <senozhatsky@chromium.org>
> To: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---

Nice work! Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
