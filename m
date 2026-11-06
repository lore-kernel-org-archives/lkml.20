Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999406;
	b=WoYMWB3xGAdqYr1KOpsyo9eRFxutqD00Ac79abAwUTxTFY/phBbzE2GEmv2vso80aa+h
	 L85RR3uCBBZ0XSr7Lf7G2WcMVKt2AZFe7C1sIg5rwMPYnBqwGrulvjFc3+fDC2n6k67w5
	 u/i4eJ5B3kNstQWEAbbuEiQ1/7D28QelMKxVbkdeftvRT0Y2JCDNPxaBnsby2kmenkvVn
	 RLgUINXdzMK6dINoMB5kewzxbZoH0BcJW07V+veJZ/1r5fBV/nyOeznedtmS8MyRcJJgL
	 ZWaoKYD62LmEXGnVjjn+KBo9lGZIq3+ahckajxHGG7t7RqS74/Qe22FyFNBYrscFOqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999406;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=To0Z/jX4wfVG9baWyVxWTdD5Be58PFm2uiAc3VkWvns=;
	b=nfH21A7wJZc2BTyBuXmRhtG1E4okCF/Lrtsq8skb4J2P5Spe07ilrSfEwMnyQisPAykN
	 puKdL/HsFFtoaFAve8huW4cc9asJGOyGWo2rXn+wxbhBr0lHY6DKFclcIOSGIEfspGm6K
	 XmUXUtLLmMhlMU+NPW7B605gzVtBEF/V5lmi+69Qnvj/MjKi/9k2QTw5T60c/dXY/QyqC
	 fh/ExuNA9T0ksMI8IRoMOEwzvIS/UTR85KXFvmQmOcKindmz8/NQIzmnpuBC04cpfqpkL
	 /VV9fg4BDCiC3BrnxRe9DSSF9tc8ovuqcdQM5zCMNYOTeNiDliGwzI9T3mcSNK5lZNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Giqjo2Ce;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D46D606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Giqjo2Ce
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E661F0089F;
	Fri,  6 Nov 2026 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793999405;
	bh=To0Z/jX4wfVG9baWyVxWTdD5Be58PFm2uiAc3VkWvns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Giqjo2Ce+NopmhmRaiY5iJk0dFJnI16mLjdGE5rJh4qXwjO9MstWWzlWAn+tYbOFP
	 1XiIOHUZvkhvQU7ULmkIeK1Zg2CvKlvoAG+bWnJAM4EzDNXuLemkGlY1MJvQlakPvS
	 s7ILKN3SE8s2UK2cExOdMo93LqaZwTZj3KP1fC3O0QlHl9eOgFLkmc7gg4+MuPPoRj
	 GC6KoF34Ah4I4vDr2NWoYNbpwXzqICEDQi/IJMtd+weysgskmTHDWVBwil6AZDEODW
	 qLoJzryDTxS/9Z9VoXzNIJoBe784lmQ9oHUBuEC9XOUmRkgQzu9h1zIhvnaaw6Wly9
	 nCYj2DryzOoZg==
Date: Fri, 6 Nov 2026 21:10:03 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	chrisl@kernel.org, kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, 
	linux-mm@kvack.org, chenhuacai@kernel.org, ying.huang@linux.alibaba.com, 
	Baoquan He <baoquan.he@linux.dev>, willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org, 
	riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org, 
	baohua@kernel.org, dev.jain@arm.com, baolin.wang@linux.alibaba.com, 
	Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, ryan.roberts@arm.com, 
	Vlastimil Babka <vbabka@kernel.org>, lance.yang@linux.dev, linux-kernel@vger.kernel.org, 
	nphamcs@gmail.com, shikemeng@huaweicloud.com, qi.zheng@linux.dev, 
	luizcap@redhat.com, kernel-team@meta.com
Subject: Re: [PATCH v9 15/32] mm: swap: share swap-cache allocation error
 cleanup
Message-ID: <au5CJBMUUUnDwbhe@google.com>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
 <20261105183940.2236717-16-usama.arif@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105183940.2236717-16-usama.arif@linux.dev>

On Thu, Nov 05, 2026 at 10:38:59AM -0800, Usama Arif wrote:
> Both post-insertion allocation failures remove the folio from the swap
> cache, restore its shadow and drop the folio references. Factor the common
> cleanup into one error path so additional checks can use it.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Reviewed-by: Yosry Ahmed <yosry@kernel.org>
