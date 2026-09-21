Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC5C4A4990
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001454; cv=none; b=R2Os3npRUS169qnfUpHcSSdunry19lO5eu9vQkbD3hODkcXboY6qxuPlB+BDHrY8YQ6Q6HxJoE/nxEjFVlkXT+gfLesmzS//l/KBuwxSMarLd7uuSrpoA7KhX1NbjHaOyzgRnUfX4DadJ7CHW0eBojYKXt8unkA87R6Iqqzkt5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001454; c=relaxed/simple;
	bh=vu2KvWKFFA3N0wzDMJWi0oZ02CuH0BR9UkXp9PpwQsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLGqmj2Lj1HIgjLvw0ngR/mP0nWq0JGBNeFBGEV0CBhtr2AWedGJDJ3umZFejpr5ESxzCHrs8sBN/2MpZU1acSNZdM4+T8rio+8aqIrY2E+3KucddrZtumKIBpsnHSfq6Y/uUi6CaJ39w1ENNPrceC3qhSPnoRw9uM+uReu5Cug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=gGjAZSOE; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="gGjAZSOE"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76c9deeso38162161cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1790001450; x=1790606250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2vUrOHpknLsQODHI2VwdgOODmPETkIBd14WWg0Q6gUI=;
        b=gGjAZSOEjIaxKx0rdVUPsz0SmRs3cCI08XIo7lwjSMAEXPTKAEcXmZWfEfW9Jht7oH
         7A3f7/UR2wrlWGhIMjUyeXMBZhb5+HiqYfFUa5XaNIDDTPJNjSKEVqr3fIplf2Dh1O4r
         1pSWQgbLLvt78yRTbyF6TGbE6SfDlihfWkHWPU0Me9nFoF2KFgjUy/k3G+sZ7dOCAS0E
         i34EpHTE0RXK+DzLa4XGsx7b26hET134pWpl/hCSYa57CnNu4VhKTr2l0FvCSvYjCBHf
         EpxF/E8EooECmNpNhBWyzFr7BRvmBk3c62TWnATpVP9a87EVkhOh6xZP7zc0OZjDm+AA
         ln2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001450; x=1790606250;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vUrOHpknLsQODHI2VwdgOODmPETkIBd14WWg0Q6gUI=;
        b=vjulYJMP+VePPpXlsdOwGfNTRs58YiYLnup6HExXyKSjCfss4Lh6Ivm2bO7eh/X90y
         n/QSrVGxd9ahR8snibSFwlNY7/zk7V9jwd/T/Mjb8tCYK6wevcjuJCSuRs/OPgcrq26q
         /FY+aB4eWIdVVTZidXVhuo9S+wiXa5HsKKIIcm3roSYON61iwBDgLP1wovqPrepsNes8
         6XxklL7CexxXaYRjolLBU8gCt+/ObObAPeiho+eH5tOM3QZCLNwRPQOZDXMn3oX+Ny5d
         fcXjwPknY8Q58b2bBBFyn5Z9/r8nlZ7++HJiGLIaNkgkEfCsih1SBABo92XdNtFexkoF
         ychg==
X-Forwarded-Encrypted: i=1; AKwUvBwQTHxKgq6MN8vdqLzFHpaH3m3wo0uQ3ZMZNYrrFotxXVbkL57vn5nEo0jAf8FOY85EedTXEIqfLN4MTpk=@vger.kernel.org
X-Gm-Message-State: AFuF++mr2k4kIih5byeOYXsA2PptIyARmtFndRHGG4IZuSg2/pmUVDtK
	wtkLNJvtokn3AVmqJTXLZgvAeGJo4T0td0PWruDo8Ipqb9hvagmOvji40V9jOw5a8Vk=
X-Gm-Gg: AYBFou2P8Sfh/8ZELAEDT0Ngcu1IGljVcUkwSO1kFdbxVfBoNUDMaSnBMqh6N/5lTXU
	rffngwQCp7s+HsXKsF0eys5etoGHIOh7gbrkq7XoUrx6abd7+BlaJdZxCLbOQW3AnELfrNqm2Is
	XytF/U6cLE033ZdlADr03RwvNgn6wco1O/0mmFPVP1C9W2Th7sNnFAhFTUKPIdgOlpur4YIvdvm
	0nhY0tADa+xI2wL6SRwWDI2WABbXiIMAlyRKyTfKFqZ7rBAOI4gDXHKj3XRxza7gKoNGWr7I8DF
	AwQM9ptBQzRJyxM9hxG6+wAzzbUOPSsw+doln7XTu4BncWn9uSXPNr3fy2qoRjZFwu9rzbVgaV3
	45t4+9XeoE0Z+PZn+NkBm2/qLjIVy6P0ohCEM6ti+h95lj0PjkNia5RzliaKs/V8NkOR1nvxlUv
	Nwd16I3hY0SyZB5MSDAU12iQ+OgWX6/na3Y87nDp+WfpgX8Mez0WXEqG9EHhPTJ1xY9/kA
X-Received: by 2002:ac8:5e4f:0:b0:532:ca19:afc1 with SMTP id d75a77b69052e-532d8d8a849mr9913591cf.29.1790001450247;
        Mon, 21 Sep 2026 07:37:30 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae511210sm65434551cf.2.2026.09.21.07.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:37:29 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:37:25 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Matt Fleming <matt@readmodwrite.com>,
	Salvatore Dipietro <dipiets@amazon.it>, akpm@linux-foundation.org,
	abuehaze@amazon.com, alisaidi@amazon.com, blakgeof@amazon.com,
	brauner@kernel.org, brendan.jackman@linux.dev, david@redhat.com,
	dgc@kernel.org, dipietro.salvatore@gmail.com, djwong@kernel.org,
	hch@infradead.org, hch@lst.de, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-xfs@vger.kernel.org, mhocko@suse.com, ritesh.list@gmail.com,
	rvvandan@amazon.com, stable@vger.kernel.org, surenb@google.com,
	willy@infradead.org, ziy@nvidia.com
Subject: Re: [PATCH v4] mm/page_alloc: avoid direct compaction for costly
 __GFP_NORETRY allocations
Message-ID: <arFBJdYaRx_iJNDA@cmpxchg.org>
References: <20260905174239.99e31515fabe220aa7d8e6fa@linux-foundation.org>
 <20260910114602.926944-1-dipiets@amazon.it>
 <aqQlUr-1h07G8JWM@cmpxchg.org>
 <8d6a8a63-4adc-458a-b548-a47bf5ff8eb7@kernel.org>
 <aqq8pWI0u1IZNWHT@cmpxchg.org>
 <9f415dc7-adad-4161-b20d-7c3173f50ff3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f415dc7-adad-4161-b20d-7c3173f50ff3@kernel.org>

On Fri, Sep 18, 2026 at 09:05:40AM +0200, Vlastimil Babka (SUSE) wrote:
> On 9/16/26 17:58, Johannes Weiner wrote:
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index 12fac9084c48..c79cc7aa4dff 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -3246,7 +3246,8 @@ struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
> >  			 * reserves as failing now is worse than failing a
> >  			 * high-order atomic allocation in the future.
> >  			 */
> > -			if (!page && (alloc_flags & (ALLOC_OOM|ALLOC_NON_BLOCK)))
> > +			if (!page && ((alloc_flags & ALLOC_OOM) ||
> > +				      ((alloc_flags & ALLOC_MASK_ATOMIC) == ALLOC_MASK_ATOMIC)))
> >  				page = __rmqueue_smallest(zone, order, MIGRATE_HIGHATOMIC);
> >  
> >  			if (!page) {
> > diff --git a/mm/page_alloc.h b/mm/page_alloc.h
> > index b9259deddb59..11714ddca254 100644
> > --- a/mm/page_alloc.h
> > +++ b/mm/page_alloc.h
> > @@ -60,6 +60,9 @@
> >  /* Flags that allow allocations below the min watermark. */
> >  #define ALLOC_RESERVES (ALLOC_NON_BLOCK|ALLOC_MIN_RESERVE|ALLOC_HIGHATOMIC|ALLOC_OOM)
> >  
> > +/* Flag combination from GFP_ATOMIC */
> > +#define ALLOC_MASK_ATOMIC (ALLOC_NON_BLOCK|ALLOC_MIN_RESERVE)
> > +
> >  /*
> >   * Structure for holding the mostly immutable allocation parameters passed
> >   * between functions involved in allocations, including the alloc_pages*
> 
> Should work.
> 
> > 
> >> Unless I'm mistaken about that MIGRATE_HIGHATOMIC part, it seems all sashiko
> >> concerns can be dismissed and then indeed v4 is the better version.
> > 
> > It looks like a real issue to me, but one that already exists
> > independent of Salvatore's change.
> 
> But Salvatore's change (v4, not v5 IIUC) will make it worse because
> __GFP_DIRECT_RECLAIM + __GFP_NORETRY costly order opportunistic attempts
> with fallback will start eating the highatomic reserves too?
>
> In that case the fix for this should probably be part of the same PR to
> Linus and be also stable with Fixes: 281dd25c1a01

Yes, agreed on both.

Sorry for the delay - while poking around I found another oddity in
how the reserves are accessed.

I'll reply with two patches that I think we want to go in as fixes,
whether Salvatore's patch goes ahead or not.
