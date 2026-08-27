Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE483E49F7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819900; cv=none; b=TjHFICHDU02kZmlDQ/bZ0a0niYWxZdBUO6ob+zSOuREdehoiivKiWj7KNEB8YxA0IshFSzF8XUmhQjKWv7cdrxz77iFJHw1CFfJgYFVfn9sgkKrp52Bc1O6BxOQVvNtnUOP6qySd6Jg0sGFqgFFOuZEKxQfaVEjqeEGrFAMdvG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819900; c=relaxed/simple;
	bh=fYTN9rXnoXktOjn8nAdtEOoyT9pEio9tFP/qs6Vafo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DYJeNJkQngo6jkjZFQy5Y746amN8gi2QgGuviq/tdMXZGqCZuSI5fTHeXHAwQhyNRtUDBQ3tDNBBffYmUdNwwgTyUxYbTCSh0DllwiqNLTk7rPjqJRcAAPpzcV7mWiZCXdN1qMew4M+WuSlUiwxsKTJtAkbOxvYK+25kmj2ei6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=he2igmL3; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="he2igmL3"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787819894; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=S0b5mtUWJPOlKR5LLS2V3xdKfgJHqZzr0zXFS4YHIDs=;
	b=he2igmL3qqakWP0fEx0CMX31xH7mKEmlay+joCxHNqSKP64CRE81Kue43JF+XPZ162RmQ+xMlZ959ulMMMVpoiJfq89qJE5brtqVThYHNt6CdbwJqgUQA5c98R71AgAkJxnyOiu2glE7qjADbveU/evrVhsVQ+kruNjDoKa9yas=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R881e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0X9jAnny_1787819892;
Received: from 30.74.144.120(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X9jAnny_1787819892 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 27 Aug 2026 16:38:13 +0800
Message-ID: <25baffdb-fd65-489b-ac9b-94e1ad676eaa@linux.alibaba.com>
Date: Thu, 27 Aug 2026 16:38:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
 <ao7Nr_FALfP7cTY5@gremlin>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <ao7Nr_FALfP7cTY5@gremlin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/26/26 7:31 PM, Lorenzo Stoakes (ARM) wrote:
> Since it's 2026 :) I asked Claude to look at my time as THP co-maintainer:
> 
> 	~107,000 words of review across 948 emails (in 279 distinct
> 	threads), counting only prose you actually wrote — quoted text,
> 	signatures and attribution lines stripped. That's a full novel's
> 	worth of review commentary.
> 
> 	Along the way you handed out 194 Reviewed-by and 15 Acked-by tags,
> 	and your longest single review was 2,404 words (mTHP collapse
> 	support, v12 — the khugepaged/mTHP collapse saga accounts for most
> 	of your top-10 longest reviews).
> 
> 	Estimated review time: roughly 300–500 hours, centred around ~400
> 	(i.e. ~7 hours/week for 14 months).
> 
> 	1,615 THP-related emails in the window: 948 reviews of others'
> 	work, 278 replies on your own THP-touching series threads (~31k
> 	more words responding to review), 382 patch emails, and a handful
> 	of MAINTAINERS bits. Busiest months: March 2026 (131 review
> 	emails), June 2026 (113), August 2026 (111); quietest was December
> 	2025 (5).
> 
> Think I can be happy with that!

Hi Lorenzo,

Thanks for your great work as THP co-maintainer (we all know THP is one 
of the busiest subsystems in the MM :)). I am glad to work with you and 
very much appreciate your review comments and suggestions.
