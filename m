Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB233AFCEC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427262; cv=none; b=k+Bgof1+nZj+ffOjXIclxMnpWgY8kWYuoXL8eM21fReRAa0Orqr4TPvBBwLoHfq6tuGe8LQQ19e2S9wFcbNQCS6AUzV7wDkP4PB1P+7v11c9KLpg8Z0JHcRK+WOmDWdBfnuC7TxKTFY0EplCOYmbdz5Eg3WcmNxpkzzeb3a91ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427262; c=relaxed/simple;
	bh=nxX35LxcjgacV+R939jpl04lrCLqvNCtemY8bv6zG8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ng8fpxfITgaoTWVGxWkgNBW8NaFiszJ6ATbmRf2qzgRXVSZcqP0DAl8cgbDir+cdcvj+Nc7yM4MU38bows4hT9z42lDpel+ihYByaA2Cm4fsDaY9WHKlj9rmUyv2wQxDZdfJD8K3p07od1jvBMsOPneKxy1MTcfP8M41q8Wwucc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mT78I1gF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mT78I1gF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F011F00A3A;
	Thu,  3 Sep 2026 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788427260;
	bh=R58VpJgoXa38uUjUSX0dFmlVfqjdjenKtXhLCcCh34E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mT78I1gFIY4l4WwOgJH7IieNz0sn6nIuBxmmWb3IyS/Mic/VyR47jeWT0UemhLBUa
	 lRbZdGhDE2zSzr7DaWqqQLtoGUQfdKckmB/8wBvY5rWRi4ed0Wn+HCJuTQl3uDx/zm
	 3a1con5c7Eb8RkywRL2qLIFxohlyLZvZpntWOzWcIqNDf4vHwtOXM3D7rblgOnvvja
	 sSme+E9Kv/MA4YfeqImXUQpOxNsfMxLKND+i49gTTDw1ieTM2cycEnWKeRlHUIOZfR
	 IMAH8aGv9LL60jzFAH81CjVa4mrqHve3323I9WwMeV4ItZ/ijS3UyCzDhc2bOIypsF
	 h2BdPR38VizVg==
Date: Thu, 3 Sep 2026 12:20:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, usama.arif@linux.dev,
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org,
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, luto@kernel.org,
	peterz@infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
Message-ID: <apk775HfHg_DXpiW@kernel.org>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com>
 <5026dbec-0b71-4408-a78a-484a4b8e77dd@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5026dbec-0b71-4408-a78a-484a4b8e77dd@intel.com>

Hi Dave,

On Wed, Sep 02, 2026 at 01:59:15PM -0700, Dave Hansen wrote:
> On 9/1/26 08:18, Xueyuan Chen wrote:
> > +static inline int set_direct_map_ro(struct page *page, unsigned int nr)
> > +{
> > +	return 0;
> > +}
> 
> I still really think the stub here needs to return an error *or* the
> thing needs to just be void and tell folks that they can't know whether
> it worked or not.

All other stubs return 0 here when an arch does not support set_direct_map.
I'm for keeping them all consistent and fixing that technical debt as a
whole rather than creating a one-off here.

-- 
Sincerely yours,
Mike.
