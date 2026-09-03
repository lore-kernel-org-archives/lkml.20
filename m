Received: from mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC29A3F1ABD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417384; cv=none; b=VHl9uD9RyGn0BtKYipcosplJfd2ZjOOZdA0G3Wu0A4SpEbC5zNiKPXMQL91/P3VBAxc7ZW3HBHXw0fSwk4mDPNAo10dl3UmLMJpd3yvvMwLC/EAAMeqNIxJfMIcUJu/d3RyjZkKX2qZB+jAeId1pwf28HIswvCE5BEEAaym1GuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417384; c=relaxed/simple;
	bh=/7zVF87+vSIaxGdnTGi6zl+USr7Ew+xcjHfJdu2PHXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWV9UjIZoJjEFPsa8p2gfB/IiEnrnwLuAWuYMkB0yMixIGcpgo5f1+OucnVTeCng34Cr1z6w07yfxKCwOEP0OtFUTYy6I2kILVBQ2o/VKx9lZ4B1Ggp/6i/Xr72+A+ZbpRNN9ODJL15p9TAojdEzC2Fn2IxZULIIeIlxMHw8Exs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BDPYwWUG; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BDPYwWUG"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/7zVF87+vSIaxGdnTGi6zl+USr7Ew+xcjHfJdu2PHXQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788417371; v=1; x=1789022171;
 b=BDPYwWUG2Z6bRep3T0VLBuuKDahOxIhearwYCB9Uw1og7GYuVlylNKYFuk9DYYcpN79wzQxv
 Jzj5HFC8/TpHPwL4N387Usg237Go+wsjMcy9922gksnD2685r3sFTvRolNcm0p8lyA42w1yhfCR
 2I4StrsLfzGRP/Q1GsSuYBDA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8473698cd31aeb55;
	Thu, 03 Sep 2026 06:36:11 +0000
X-Mizu-Trace-ID: 8473698cd31aeb55
X-Migadu-Flow: FLOW_OUT
Message-ID: <3775da0f-4068-4fc4-97a7-135eb975ec65@linux.dev>
Date: Thu, 3 Sep 2026 14:36:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] mm/sparse-vmemmap: prepare DAX vmemmap population
 for section orders
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
References: <20260831075342.57563-1-songmuchun@bytedance.com>
 <20260831075342.57563-5-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260831075342.57563-5-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/31/26 3:53 PM, Muchun Song wrote:
> Device DAX still uses vmemmap_populate_compound_pages() to populate its
> compound-page vmemmap mappings. That helper allocates the head and first
> tail vmemmap pages explicitly, then reuses the first tail page for the
> remaining tail page mappings.
> 
> Device DAX is being moved to the section-based vmemmap optimization
> infrastructure, but it cannot switch to the generic section-based
> population path yet. Once a later patch records the DAX compound-page
> geometry in the section order, DAX head and first-tail PFNs can look
> optimizable to the generic helpers as well.
> 
> Add a DAX-specific population flag for this transition. It keeps DAX
> head/first-tail allocations on the normal vmemmap allocation path, while
> preserving the existing page reference for reused DAX tail mappings.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/sparse-vmemmap.c | 27 +++++++++++++++------------
>   1 file changed, 15 insertions(+), 12 deletions(-)
> 

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

