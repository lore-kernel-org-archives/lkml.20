Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C354EFFC9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726576; cv=none; b=QRJVnmVSjCV9Nk74NctpZSuJfV+O1v3UufJrVOuiCng6cbeeblmMQZpevxmRdjPKkZCceHbt0On7CtBck0vO3QeI6aIM+Regm4fpQNo93HGH5sDrDf5tRyo5o1jr84ym3UTYm5Vw58WWDX6L9+Vs0bEd/VdtGGvn3bW+22hqLbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726576; c=relaxed/simple;
	bh=oeg+2SthTjAX5vvQkkw8GYaT5PaHvidVh1hE8KnwORA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPCh1RaehO1yLXK5g4d7xEa3IMp5gYkrlGPnY+mpfru1XrSl0GbfIguy62+eK2PigXHTJvaA206FUQkJNrA0pS44qD6VpTXS5mCc6iZBsOTLK31h/chvhaiXYtMsv4WWDZ40/y7vjIxg2qo93nOpUWzH1pOw+2erwdfyUJ7NZAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4cbWMx9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4cbWMx9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED75F1F00899;
	Fri, 18 Sep 2026 10:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789726571;
	bh=j/KT8CaYVgENoBnBehwFNNAA7M86YyAVDRxMUHoxzJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g4cbWMx9ITaRMwD4Iu1jVvbSRZ65VkM0tg+J8eCoN956MJDTnJ0/1ZQUSH9LcwT/A
	 +CxUwJ966rSJWrD16IlVMX19HMSOI5geKsZLCb2t8A/aAnOXtbWYe4EH97d2UpYLkK
	 owJ7KvLvllOvV0U7PT8Sh+gzSGxwufszw3euaBqrwaIl4cNjOVOtYPFO5MNNY5FI25
	 QAL9avs+4qTBSPHHRgXTT6Js0y2of5Mo4wqiShbN0Ubqz8Liz/yMce9TsdjTOgMMT7
	 QR7aE0oJBx76N6ddp1iyfOEr7+9+7SdqZV55irtHUGSty0tvBZdXivpeVQqHKI1x4x
	 C7v0LtJZiDR+g==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 47B4C1980047;
	Fri, 18 Sep 2026 06:16:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 18 Sep 2026 06:16:08 -0400
X-ME-Sender: <xms:ZQ-tagGxIKryv0h2kKRf1N5IxcObfzeZQquU4u8pgjJMF2-FXW57hA>
    <xme:ZQ-tapPCwPqMptl6cL6ZKg5UEsC11N0svDYmC2DIkkqM0QR8YhTqOug8tEpdxkkLu
    KhJ4alpO-2c6Q6_ZryBuCQBVcOZro0vqjmxnNLh6iZ6GXIPJVbE-wxD>
X-ME-Received: <xmr:ZQ-tanfxPiOfkESC8Zkp3KfuW4d0rANv9mKp0dzReQjvygyXQMyFc9oweek>
X-ME-Proxy-Cause: dmFkZTEOZ5mh9pB2mQkbLNd/JVewrfyReYbYsYpHX+sU1E7TAzA2X02sav7XGPmJwjEopb
    gSm3mcRSvQfrNRQx+gl1o3R5mVBCbrzb+9xfcqyiKQGuFhyGMbALNgGogqO0dXHunRbFXv
    hBE65m88QBe1DTtGHOoTdVCIfiy7LwWjgqUF1VT+qmajYRigSj9gU7BFtCmwpxBXQFtfqK
    +tlrMyqw/O/fSMUPgKKYSqT6ge07Wo+3EslpWQuRVDoLAVwNkHI5kjC608Md7H7yxtjaq6
    IkUSrXO69POCdqg0HYisCpvJlOHIXqjW/gyjGk0JvIwaVgyOJOiq0Eaav1BsIe0j5Cbelr
    Sd13dADcWzOptfOTmRhSRoxboaDFljwqHs1R5Y8AxuGaz2h8SSIUpsTnw/G0HNY9ngY05t
    2yFZCeDgWit/VKF9OzuSTH1y7Lb+7MkroNYTFIqhRaVD8N7C/hxhdaqu2cQhc8XyzLhTH7
    Zn/DyzZZh3wmz62/Tqljx1WmFL5Kxu50uzU8tV2xvQHdtEkGs9IaoMFCkFR/nvox0A4WUh
    znnqZ/C8yAcPjK7vx3zLis4sazkYBCPUqapifkheiIm0Z8+nVqKK89oh/B3hBtV+cFP9mn
    MGwGfDnFl31+37BpdLplVB/PHCk/cli1iZzLLkud763iPJpdb2B8a0OzP6dg
X-ME-Proxy: <xmx:ZQ-tauRwIkLHqj1L467Bw30Hy_TY6Ucyh7C75AthiPARTxQWaqWEgg>
    <xmx:ZQ-taje-zhreKVT4W86R-AqECG2DKfevDzfEslp9OEMLR3ci5MksFQ>
    <xmx:ZQ-tamqteojjLfi81zol6s00R9cXq67OWMGgM21BMtLwdu2jl6x8KA>
    <xmx:ZQ-tasfNETwnaPmzNebKa_4hhBm_p9R7n-pOgKOkf-pBNyS6ykVTxA>
    <xmx:ZQ-tamkALkLOudePJ9_YHh8dGlhuak0gKwAjGtxByFQDL41RFucFSYLB>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 06:16:05 -0400 (EDT)
Date: Fri, 18 Sep 2026 11:16:04 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: david@kernel.org, akpm@linux-foundation.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/huge_memory: disallow raw PMD mappings of the
 huge zero page
Message-ID: <aq0PRa5SM0E8zjCY@thinkstation>
References: <aqwPHfWhKGty-Q_4@thinkstation>
 <20260918025214.89109-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918025214.89109-1-lance.yang@linux.dev>

On Fri, Sep 18, 2026 at 10:52:14AM +0800, Lance Yang wrote:
> 
> On Thu, Sep 17, 2026 at 05:03:09PM +0100, Kiryl Shutsemau wrote:
> >On Thu, Sep 17, 2026 at 05:29:48PM +0200, David Hildenbrand (Arm) wrote:
> >> On 9/17/26 16:32, Kiryl Shutsemau wrote:
> >> > On Thu, Sep 17, 2026 at 08:10:10PM +0800, Lance Yang wrote:
> >> >> vm_mixed_zeropage_allowed() validates zeropage insertion into
> >> >> VM_MIXEDMAP VMAs. No in-tree user needs to insert the huge zero page
> >> >> through vmf_insert_pfn_pmd().
> >> >>
> >> >> Return VM_FAULT_SIGBUS if vmf_insert_pfn_pmd() is asked to map it.
> >> >>
> >> >> Link: https://lore.kernel.org/linux-mm/f76beaf8-351a-4b22-b362-a945a5e1af6a@kernel.org/
> >> >> Suggested-by: Kiryl Shutsemau <kas@kernel.org>
> >> >> Suggested-by: David Hildenbrand <david@kernel.org>
> >> >> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> >> > 
> >> > The patch looks fine, but don't we want to cover the same for non-huge
> >> > zero page in vmf_insert_pfn_prot()?
> >> 
> >> Why would the zeropage be a problem in PFNMAP mapping?
> >
> >Nothing enforces that it is read-only.
> 
> No in-tree user inserts the zeropage through vmf_insert_pfn_prot(), so
> rejecting it there should be fine.
> 
> Something like:
> 
> ---8<---
> The huge zeropage is reclaimable, but a raw PFN mapping does not pin it.
> A PMD mapping of huge_zero_pfn can therefore outlive the folio.
> 
> No in-tree user needs either mapping, so reject both with VM_FAULT_SIGBUS
> rather than risk making either shared zero page writable.
> 
> Link: https://lore.kernel.org/linux-mm/f76beaf8-351a-4b22-b362-a945a5e1af6a@kernel.org/
> Suggested-by: Kiryl Shutsemau <kas@kernel.org>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
