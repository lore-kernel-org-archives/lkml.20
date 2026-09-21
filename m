Received: from mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B8E3A7826
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974044; cv=none; b=EfgmYjI2rwc+4u8+5it9qF70FK56h87AiRbf+E34HwxMUIFs7ayZOAxQtySJ+4CvGY6MYBsv3ZCLmIMbneOnfLM6ZEI0A6fEklligL5YxIORBzmOPmTdNOmQ9z4ZY+mXo2KQJjgXctgkKa5E8rg0BP1x/2pr/G0ideRU7BhANf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974044; c=relaxed/simple;
	bh=TLZQlQIDzt2OohWOO5wD38jaj3Gdn2F1Ht1VsE34Ej0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7rk5B3EP7yJTSnvbLv1YX4txw2/J1vprBvtIp/grIhIryZNSJU8dYUtZxIlymLcydpTWqoD/tzey9TjM1SL8nVARhWqRDG8LN5eZyt88buufZ87pQAO8jv/4ImpzVXPj2mgZTq2mQoedrmnfTjV7VLT4pP9xQsEOcQJz7QwQGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I6PFtfnL; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I6PFtfnL"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TLZQlQIDzt2OohWOO5wD38jaj3Gdn2F1Ht1VsE34Ej0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789974040; v=1; x=1790578840;
 b=I6PFtfnLwAItmk5ez6jrUL842Fp5IqmdFIy/CLempbTd9dRNLwt0e1m45kgHAwjtXINEYp0O
 Y0Q2roic6ZdTUhReWoIjh7sxlul64e4Ki/jC7lQNY2VSG21brJpeAgfPjvkyCG2+gB6ry4aGB/q
 6in6CziMVVAW4Eh9y8dfa9Gg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6ebfb9316ecf8394;
	Mon, 21 Sep 2026 07:00:40 +0000
X-Mizu-Trace-ID: 6ebfb9316ecf8394
X-Migadu-Flow: FLOW_OUT
Message-ID: <01cfa2f8-753b-428b-932f-470a46221b4d@linux.dev>
Date: Mon, 21 Sep 2026 15:00:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/17] xen/grant-table: stop setting PG_private on
 pages for grant mapping
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Alistair Popple <apopple@nvidia.com>, Suren Baghdasaryan
 <surenb@google.com>, Muchun Song <muchun.song@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Nico Pache
 <nico.pache@linux.dev>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Kairui Song <kasong@tencent.com>,
 linux-kernel@vger.kernel.org, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Juergen Gross <jgross@suse.com>,
 Gregory Price <gourry@gourry.net>, Qi Zheng <qi.zheng@linux.dev>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, Ying Huang <ying.huang@linux.alibaba.com>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>
References: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
 <20260920-remove-pg_private-v5-3-bb68b6a21869@nvidia.com>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260920-remove-pg_private-v5-3-bb68b6a21869@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/9/21 10:27, Zi Yan wrote:
> gnttab_alloc_pages() stores xen_page_foreign in page->private. On 32-bit, a
> pointer to an allocated xen_page_foreign is stored; on 64-bit,
> xen_page_foreign is stored inline. Checking page->private != NULL is enough
> to tell whether a xen_page_foreign needs to be freed on 32-bit and
> page->private is zeroed unconditionally on 64-bit.
> 
> It prepares for a future commit that remove PG_private.
> 
> No functional change intended.
> 
> Assisted-by: LLM
> To: Juergen Gross <jgross@suse.com>
> To: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---

Nothing jumped out at me, feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
