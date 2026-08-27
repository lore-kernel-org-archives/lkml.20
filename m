Received: from mta1.migadu.com (out-79.mta1.migadu.com [95.215.58.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3584477F1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787840157; cv=none; b=XEJPdw+5hQ7DG5zI/JncyrzRDvDfCcuxAxGLLe0pXqa5GRvmw46QIb7J/zLqwUOJdzm38mRD1dooIxEa0mMMGU1c3rw41c6UKmKDTnM4y2qY/+uPEFUtd2f/t5NkSUFSFAfDur6+W+nykiLGO2cTAB/+aK9AJZGd7QrQ9OJ/lA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787840157; c=relaxed/simple;
	bh=pYxzxiVIv97dsu9o1IPWOaoWIFUoz77FptywMtdz7fA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGYelZUPL3poCxS3V9mFng2Gg2asxmQ4QwXQ2jFmLOV+KPeU0jDE5M85cbChjJtftJ733y2uEw8N/bknI21HlmX9kgVkGs+nVpSW317QqcNEIXQgZ9GfTkWP9Yy1QwdW1EVnH7AaUI1VbVEdqbYXLH32Fsl0QgRx2HXVAFpcJUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iLHX51vp; arc=none smtp.client-ip=95.215.58.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iLHX51vp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pYxzxiVIv97dsu9o1IPWOaoWIFUoz77FptywMtdz7fA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787840152; v=1; x=1788444952;
 b=iLHX51vp3UwAoHMtL4qMUeE9O4wJkxougkvpEwGWxRSJqQY2zE3RTiAOOMO4EDnaOS/c6ubN
 iP3jLdH5AW/pqIUIDr/pQw1dTP4idbgAGd+LdNd3PSt93+u6r8cQh/D7+lpW5YqIYcMcCC0KS9p
 wWnCLTgR3PX4cQ4Ijn8vMhR0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 643b2ed66c62ca54;
	Thu, 27 Aug 2026 14:15:52 +0000
X-Mizu-Trace-ID: 643b2ed66c62ca54
X-Migadu-Flow: FLOW_OUT
Message-ID: <054cf257-f5d6-4041-8c83-902af87c736d@linux.dev>
Date: Thu, 27 Aug 2026 15:15:47 +0100
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
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
 <ao7Nr_FALfP7cTY5@gremlin>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <ao7Nr_FALfP7cTY5@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 26/08/2026 12:31, Lorenzo Stoakes (ARM) wrote:
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
> 
Ah so sorry to see you step down, you made THP genuinely better!

The numbers show the amount of effort you have put in, but they don't capture
how consistently useful and detailed your reviews are, with the aim of
always trying to make the patches and THP better!

Thanks for being an awesome maintainer and hopefully you will consider
coming back soon!

Thanks,
Usama
