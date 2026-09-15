Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BE71A9F8C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470662; cv=none; b=e8Q0tV3enNLQp4dPeNfrDDxeV6hZ5/RF8a3IiOIcGsJ7enxE1hJSA2ioVsFLEUmcnWrt9etXTWlt/Mt0p2O2yNuesPr0YOPhCbHL9YI+eWuWC4gzeUffdJKYeW3LDucPjIuhz8ZjTC+C64SB+t92rlpP7PAGkwhHICp9RuDBFbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470662; c=relaxed/simple;
	bh=ir0L29C6fFoPjNIa6MAc7k/IUY64cJgNQt+AFmowvqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hENkPBQNuyJMg4mRVPuwKOsG4GM/ktOGSCnFEY5GjDU3VEQ6yWXbfUeV0KDd875z/rqQVAXHCKKw5QLvc8yc+FxIzWC7G7indWconH71+nsSaR0m70L8wpmL6euqHmq9GC+IQNVEDnDMFH+0ecNqJadsQSpOqzPwig//DXaYm4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=dQ74nI3u; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="dQ74nI3u"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789470657; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=WPWQIQn9lzFADUkfAvG7LmOwfRtCnNUmSA0rdT2Romc=;
	b=dQ74nI3ugGP/q8WO+6UgVcAOYIuQ2hvoqoXO1Qd//a8/FdqHhOY84eJrcDf6i1Y1VYn9a7w1Ho1AKq/dFrk+sh6Nw57j70Mymrr6FcmKnLynULPB9eO16xjzvOHyZ9XdCqw8br7iLxXFVt7rpbtKkZCH3Bs2Db6pzUZAEwL6Bw8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XB1OOqh_1789470655;
Received: from 30.74.144.126(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB1OOqh_1789470655 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 15 Sep 2026 19:10:55 +0800
Message-ID: <8781712e-e635-4879-bde7-2109e1ef88c0@linux.alibaba.com>
Date: Tue, 15 Sep 2026 19:10:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] mm/collapse: work out the orders a VMA allows
 once per VMA
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 "Liam R . Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>
References: <20260910120238.2529819-1-kirill@shutemov.name>
 <20260910120238.2529819-11-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260910120238.2529819-11-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/10/26 8:02 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> The scan asked collapse_possible_orders() for every PTE table, for an
> answer that is a property of the VMA.  Both callers walk a VMA a table at
> a time, so let them work it out once and pass the mask in.  It is only
> good while the lock that produced it is held, so madvise_collapse() takes
> it again after every collapse.
> 
> The mask is then sampled once per VMA rather than once per table.  A thp
> enabled knob written during a walk takes effect one VMA later, and cannot
> widen a collapse: hugepage_vma_revalidate() tests the order again under
> the lock the collapse retakes.
> 
> Assisted-by: LLM
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
