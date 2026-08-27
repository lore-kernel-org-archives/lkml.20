Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBFB2D0C8F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841408; cv=none; b=EexlzcFWRstvQTETx4t6YKtYhyanoSmOhYHCx9YqFwRaBknR36Plwr6uGlzdExtOVYE12bkVvpEpPiaznvxY+ryV+F9qd5gY7JCuwEY4r6xdGXYIfitnCycmV1OrvflU8eys/TTjWIJtHKrWK8XucRFwfkeMyx9i21XXuZr45Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841408; c=relaxed/simple;
	bh=RheyTJieL+r8y+ouRJO5ivATZuzeOWsgJhbXID/htog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsX7uRZyiKtdAPOwug8VaUgry/j31SYfm1kaCn6hkqSAa6N21GrKvbNWP7bOA3JkQoIeAaEqQyYKznck77bqkE7g9IWzPi8+YMpjPUybQm4rb+a+dMfYeeYNssicuhSvKTt94A+DUn17XolxromV0HgZLVCM5rl+vrbLhvgKmhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=eWQUpkdy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fil9/Yl9; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="eWQUpkdy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fil9/Yl9"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 885C513801F4;
	Thu, 27 Aug 2026 10:36:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 27 Aug 2026 10:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787841401; x=
	1787848601; bh=a8Hy4YJ+WnWdSGIVPU2j3CskGmM3nG/le/p7/8k1oIE=; b=e
	WQUpkdyIoTuVlvw6CHssbWyzbhw9pDNgrIwJrvmq+WFzHyH4zwkTVXxsWcR9R3U+
	gbdmwHSkzI7mMyogViyReou/BO4ZF6/gAC/kjbkZ7vXTBKDOYXryyceb1COPcLlf
	xx8Ur4K1FsofFpIJSdF4w8u0BtjHcgsqOXEt/3RwTOs0t0mZ5tqDSReDr7elFMaC
	JqrSGD8M/57bg5YcawRSTxD2o/KDVxrdvt5LobcgssAY6tRGFiY7a+4AgRCkifI8
	c1WnCliiZRxuKwUTUhjhlebrDWMuvXi7uzp05c7ML9PbKajF/5eeNOwcL4J5qunJ
	bOrCmAEgbUuXj89+BprYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787841401; x=1787848601; bh=a8Hy4YJ+WnWdSGIVPU2j3CskGmM3nG/le/p
	7/8k1oIE=; b=fil9/Yl9fdf+BVXh60B0g3atpC4na1gwYVafsJrX0cKnUvO8Fj0
	nCjJklqkxRKZoZUOApZyp0PNhQNreN8Xe2D5wg5+414E7JMgmC9RwedgAas0Lz9T
	XoillEKsfW9ocm9S9k3mL6+CUk6oxJiJnsipWnRrjjGWKTgrJE2ICZFcFKuuc36L
	aAOrh+U9rdzoWbe56YagPFT2EmVwZgpVrWKeQHsP/+m9KAPK11LCzNUlvX6sg2Mz
	EACG08zEAr/ltC0dGKbTOWsyyXsKF7JHX1VHCOHF6Jx0QzzPDs6oATSvWtwb6D4o
	7QKO9OtSaJe8mU1x0gZUpC+TJpmHvzvVYGQ==
X-ME-Sender: <xms:eUuQajy_8lVw-mjT_dlN3l8bZOMMgkin4fbWaOQIWzGUTYclYVXePg>
    <xme:eUuQatTb5wJB_RJwguPJg75tSCfP9Yw22qIXAPmpEFvvbJQksHJVOIaSqTPpealTk
    ARu5sVJagqrN9bLPVAvl1z0wN8tbhgG9itNnZ1nxtCQP24t-9Tkt8Y>
X-ME-Received: <xmr:eUuQahrG470Lq1b_gW4pxCFnuZHkOA-gA5Sh3cNH7SzueqPvAQMvmya5_Dg>
X-ME-Proxy-Cause: dmFkZTErUJQUVhkPKiqkOcN97ogpHmISM08edx6pbjBW9kaOnTmBSwYErevqtyjNmHVNQV
    WtEj5qaE7OZejpVw+11lQe24wQYQO3n7gcSMB3M9cwcJL9PQQQQXBQxAEY8QQX3zzlMAbV
    F0/GTC5zuLYBZfpO/j6rOdBYyG3nLr7J/+jf0lEq6zlH2iRlrqYtafGTbURoJwq1sw/Vos
    6zLQK10XMSRPvbzp8Jt8gDvkMRwouBZRqYWgq9VQsca2hGV7Qnr+tUSyUnEmP/I4+ANAW8
    BOgTwjdf1cmX+koJoy+Igh8D791vQ8Jqr3NlRg0bLBswtvsdLSltp8+8c92wcGXhU4rEVc
    20Ez4JwsEsEUT8x8nGCXkQ1si+p1hnQC5Y0Sc5NuIKPpP4Hf6wkFjfB/BSqM8MC78nhxZT
    y2bpAWz1OaZBzF7j0zR115CfrBDoxOQoDs13rUWvqQOM4rCIEi6DJV0sY6mj0f5vv/B9Jd
    bjT+05UTyk2/ZQWGS12RRm0u/jTw5y8GvDNDbOUUsVRaKNGcjFNvVqJbls4ldsShYyTAla
    py0fIVqDhNkwUY7ngKcH6Vhoo0FV8NKRTFHPDDkfqeo6COO0L8+QBsxT/985Fju35HLAHB
    C/q8Z4RE3CJfEgnoniMUqH7szN1ozhanQJHwaaXocpQMQfqn7QW/TdnjGXIw
X-ME-Proxy: <xmx:eUuQalvR0stlA8xpKyuVvx3x11HtLQyX2zUnjNtaXoZtB33dRQDIww>
    <xmx:eUuQauuaYOXfH1Pt6XD8buemfRfm-DN9UNo8L8ZRKs06rV65yjL6Kw>
    <xmx:eUuQahrLI4reIbIKjYWAi1bXXnYWHNT_5e0L6hy1IQpNhwv7QfQFyQ>
    <xmx:eUuQagG7HPQcvKxdT3zgAcoqlq6fEdkEE11p4nwiP8OiykQ6Yf9CuA>
    <xmx:eUuQauKvGAmRsBuBFBfm68W8EiX8UNXNcsELKBFTf7q_oF1KhihCanBE>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 10:36:40 -0400 (EDT)
Date: Thu, 27 Aug 2026 15:36:39 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: kasong@tencent.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Shivam Kalra <shivamkalra98@zohomail.in>, Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v3 02/18] mm/huge_memory: fix rejection of swap cache
 folios with a mapping
Message-ID: <apBK55hfvYtGDpiB@thinkstation>
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-2-9b43f5163238@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-swap-thp-cleanup-v3-2-9b43f5163238@tencent.com>

On Fri, Aug 21, 2026 at 02:55:15AM +0800, Kairui Song via B4 Relay wrote:
> @@ -3886,11 +3889,11 @@ int folio_check_splittable(struct folio *folio, unsigned int new_order,
>  	 * TODO: this will also currently refuse folios without a mapping in the
>  	 * swapcache (shmem or to-be-anon folios).
>  	 */
> -	if (!folio->mapping && !folio_test_anon(folio))
> +	if (!folio->mapping && !is_anon)

Just noticed, !folio->mapping is always !is_anon as folio_test_anon() is
encoded in folio->mapping.

>  		return -EBUSY;
>  
>  	/* order-1 is not supported for anonymous THP. */

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
