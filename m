Received: from mta0.migadu.com (out-159.mta0.migadu.com [91.218.175.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1558D3AD539
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974714; cv=none; b=kcpWmYpaTKqtsCoyMiU+dqIW4+ow5UmFcK3bgfqOPg554oZKpDMtfSMNchRKZY74bjgwxEnst1X6FXhkR8SAzNnGn29tAlS+w6ZBYPF1pTMJ4Z7sS6981sG9EbrjKYpnDgEsAJFC8BpL05TuwnN4GIkGjQ5PWAmWxGt0irDo8ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974714; c=relaxed/simple;
	bh=jUNOmZ0oFx/hBNFyItuSBJqhemn5jF3nsNF7Wwmgjhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYuqf+qtGnt24U+wf1FuptGdeeD1MtDgOTtoihaGQSJMnJ4qZEtsTEkgLX8DUcCwKjDLnQDSkPsgW3pEXoMLGZKOrWtyutNpgIKj2eNzJa59xJpaQWTNn6OSJMf2/q9LzIe1nfID5nY+oIgwebYT7ERfKY6vQo/XTEyt02NH0xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BJJyXSzo; arc=none smtp.client-ip=91.218.175.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BJJyXSzo"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jUNOmZ0oFx/hBNFyItuSBJqhemn5jF3nsNF7Wwmgjhk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789974710; v=1; x=1790579510;
 b=BJJyXSzotVgiLcZgED4T/dWIm68LgLBKQ3fB+a9l6bKwTB5hgokjUxg5aJJ8/OqRwfE3kHGG
 xJirjP34De9jplyml8EcSDUAHhrPh1ryd8E4VJ/FXj4rJR8anXSDxpG/y2DehY/5ne/Yrrkg7tE
 PEPlV3xu5wbemoWt/fYn2F1c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 50fa2f7f8ad12771;
	Mon, 21 Sep 2026 07:11:50 +0000
X-Mizu-Trace-ID: 50fa2f7f8ad12771
X-Migadu-Flow: FLOW_OUT
Message-ID: <397d6fa5-a5a2-40ba-9d0d-d0ddc6bd1c35@linux.dev>
Date: Mon, 21 Sep 2026 15:11:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/17] mm/hugetlb: use direct assignment instead of
 folio_change_private()
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <kasong@tencent.com>,
 Oscar Salvador <osalvador@suse.de>, Muchun Song <muchun.song@linux.dev>,
 Nico Pache <nico.pache@linux.dev>, Michal Hocko <mhocko@suse.com>,
 Lorenzo Stoakes <ljs@kernel.org>, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ying Huang <ying.huang@linux.alibaba.com>, Gregory Price
 <gourry@gourry.net>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Qi Zheng <qi.zheng@linux.dev>, Alistair Popple <apopple@nvidia.com>,
 Dev Jain <dev.jain@arm.com>, Usama Arif <usama.arif@linux.dev>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 "Liam R. Howlett" <liam@infradead.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
References: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
 <20260920-remove-pg_private-v5-5-bb68b6a21869@nvidia.com>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260920-remove-pg_private-v5-5-bb68b6a21869@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/9/21 10:28, Zi Yan wrote:
> folio_change_private() should be used along with folio_attach_private() and
> folio_detach_private(), where adding and remove ->private content requires
> folio refcount change. add_hugetlb_folio() simply sets folio->private to
> NULL without refcount manipulation. Change it to direct assignment to avoid
> semantic confusion.
> 
> It prepares for a future commit that remove PG_private.
> 
> No functional change intended.
> 
> Assisted-by: LLM
> To: Muchun Song <muchun.song@linux.dev>
> To: Oscar Salvador <osalvador@suse.de>
> To: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---

Nice cleanup! Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
