Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6785648034C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938754; cv=none; b=OTDvpj4vTbPpHBKEW0KLWky0H8jUjLYxPYY4l82izX1UX1YTDBmH3yXQqr7dCRf7ys+hwT44K/iojEWB/BnQtHnBbEepoZEvdO9bB+Sx7bDq+/VVkeNd/71+PYb957IKz5Sehh0cmJMqT7H1+9naqsdyBorQ57SVmngnnmFyBFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938754; c=relaxed/simple;
	bh=WtuiDepOz9W3VaHZfpjSCBOb9A0w14pkNltuTswNRrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKeKJA0xQArQ2UcYTm1iF50R8GHmAdnyWdL4lsIIeQ+/Vmmk/mHVIU2tpyOufpVARt897bQLjw6ZMULn1EKcqocd/KO4PCqDtaDF6crqyahJL7ae2DfN9e9byhD0qDg3jtXEuNSNe0rRGmMJl53A84D8wRLx4+BHCHLm1oygNeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=FhOipFt2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="FhOipFt2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so41517615e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790938750; x=1791543550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4GHouJUETudk7W8FKV7BoRzP5pX7CtTfk1pyabxXaf8=;
        b=FhOipFt2stScke91j043fqbTow55h8pQVX6siiheRm4KTgzOIs22Nwa0u99Op9JBOu
         mcHIu8neazRuOIxMTdX9y5K618XqiuUYC5bjn3pETFg0NRanMA8pVG7DBqMct9Hr/ANh
         W8Oajvf1xr5N5FTcdNuKRVDN0d/1amYVB51zs0xGthEL4917F+uMQsQFL6TLDIPGwxvY
         msG63WIxCxFjcTQn8/pbXyyc04x4qeqlQMZ2Y2R+mk1nr8fNokxi2cCxf0HMLdSYarIC
         imR0t+ZRN4y52edT/tTwccYr3AdkFXuJPqO+B/7D/DEspMD8YX0Y+yW4FGjJU2jwEyHQ
         HCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790938750; x=1791543550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GHouJUETudk7W8FKV7BoRzP5pX7CtTfk1pyabxXaf8=;
        b=a60ppWwzyYpfvAa9EJEm8GxCs4iQCn/CMTzkeOVQRe3UNETMqHMYvX58aMWxAE8oTN
         8KfUdCz2Fa4SMooSI2UVRAFBO6ZGQpPUAl4aA+riL75W2L9Y2tOGBOjgKjZLXFxFOyOj
         jSreJ6+1fO7LCuTFBYkCAYsWsgYL3rTUInkfc9vtmKbfliFfglYugrb9XFA/4wa4DgCS
         eLfDj1M99Rwu2RPEerKqSPjaqT8ptvTBGT+RfweIbdWvD/qxn9kuJZe0pHFk7EchYV7a
         A96F3BCrmrFHa/6h+SKRApBvu7xdtaBFPwdJSNJgzMQyBOStVuv1tDR6fRHeTzBhYAP2
         ng2w==
X-Forwarded-Encrypted: i=1; AKwUvBxHckLYO4YPCCFls93PLpYb+qYXoq9IA3cHuhKSY4KutZ2jL02Uw9paoYMtz3wiqeR4F3y6RMABPUmrFGc=@vger.kernel.org
X-Gm-Message-State: AFuF++lRPKlr1qWCfDux42zBI1Looczyr4LmO8y5q/w46yDWDrQ6SIzM
	UtwwO8WUWtvd8T4mY7j0JXtvqBy/ZEP/za7qdei2/lB2z2Pm7wZpw8sC+CiVJibbbs4=
X-Gm-Gg: AYBFou1EId4rxnC8Oqx9CQMjPCloqSPMsgLx7f0z5Vopxb2MDICcJKN71aR4QV2zJ5X
	ze8qolNFIw4DuRUFesMLywaANkd69VQRoqs8vguz/PLAz5J660nesUvkXop3czppOgnazNJP0Cs
	k6v90xmF/xnaIfxOTHC+vjvOsFOrsqQQ2991Ue6LaoNXQhCN90IiicPfWhU1jlpWVHWV8FUWeec
	DdMOOYgC5Fe1cNU7N4i68GKERRkCfNfyrXsAVnYN0mTN9wA1VK8nU9wbcokCLgWLJz0bD7qNcZe
	wl23v+Cc21Qu5ot5cWDcLiVa93FVRxQiUTBQNrp5BMknt8fh6IQ/mtuiwR/pGZnapWNSgD8c+X7
	vxM0iS944Kiq1nAWIPpfq8MTkm/+Ul5p+4elX+ZBwGCu7ROJTRgVMBxVr/r2z75tGJ2ug16T8gK
	dGp85/0RvzKSSkZuHcnus4ywBolipaTaKZfnOnpnJFS6uS0kEYClORERqtxXx+4+L8TRA=
X-Received: by 2002:a05:600c:4ecf:b0:49f:cbf1:e765 with SMTP id 5b1f17b1804b1-4a027458e05mr46243305e9.0.1790938750421;
        Fri, 02 Oct 2026 03:59:10 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::6:adcb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104d64sm4717627f8f.29.2026.10.02.03.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:59:09 -0700 (PDT)
Date: Fri, 2 Oct 2026 06:59:08 -0400
From: Gregory Price <gourry@gourry.net>
To: Brendan Jackman <brendan.jackman@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com, 
	hannes@cmpxchg.org, ziy@nvidia.com, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, rppt@kernel.org, baolin.wang@linux.alibaba.com, 
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com
Subject: Re: [PATCH] mm/page_alloc: let the bulk and folio allocators carry
 alloc_flags
Message-ID: <ar-OLuvDxoCXXKh8@gourry-fedora-PF4VCD3F>
References: <20260914155115.439742-1-gourry@gourry.net>
 <aqgjUJWVUS_nx20i@gourry-fedora-PF4VCD3F>
 <DLUANOHBUP9C.14W0G57BHYIMF@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLUANOHBUP9C.14W0G57BHYIMF@linux.dev>

On Fri, Oct 02, 2026 at 11:52:22AM +0100, Brendan Jackman wrote:
> On Mon Sep 14, 2026 at 5:54 PM BST, Gregory Price wrote:
> >> Brendan this will conflict mildly with your ALLOC_UNMAPPED work,
> >> because you add an init_alloc_flags call in alloc_pages_bulk_noprof :
> >> https://lore.kernel.org/linux-mm/20260726-page_alloc-unmapped-v3-20-6f5729aa9832@google.com/
> >> 
> >> I wanted to pull this out ahead to try to deal with the conflict.
> >> 
> >
> > Sashiko pointed out some issues that arise from rebasing on the recent
> > ALLOC_NOLOCK work, and in a quick review I found a similar slow-path
> > fallback issue with the NOBLOCK patch separate of this patch.
> >
> > Brendan, if you're alright with it, can I pull the NOBLOCK patch out
> > ahead into a 2-commit series and I'll add the small fixups?
> 
> Hey, sorry about the silence I let LKML pile up rather badly, it's been
> quite a month..
> 
> Yes I am totally alright with this (glad to see you went ahead).

See: https://lore.kernel.org/linux-mm/20260923211041.3127588-1-gourry@gourry.net/

for the RFC that pulls everything out ahead.

I figured out how to make-do without it for the first go-around of
private nodes, but it would still be needed (in some form) if mempolicy
support makes its way into the private nodes series in the future - so i
think we should still discuss it.

~Gregory
