Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C26E306744
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006338; cv=none; b=Dnk+8AQVPfWZfebQBL51WOfLtV+BuDbruYXcluPOCTRCJNsZc6XHM99wZys+41IHLbTFnVeSKxaXQxS/la7ahty0bYGser7AWuul/hxki4tBc6+ysM5fMJ/vDTb13Rji9d2RgT9MRfyUr6PSritKoEpnBywBF6PoiDNPcmBfPLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006338; c=relaxed/simple;
	bh=OLO+jzXikhFs7IArv/n/us8KnV/xU40MQ5N+CqeNGtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CthYSIaFiXrviWipIWniaTUEaDOV6/q1dabxCZm3jkJBJZKCkwuxK8ZSfHmwalZB72IG7tuDIbIo7uSQUtVTPtTDXEdn75AGr2Wbeg789XZrdqFZGFh3ZoIyTp4qhRuzOBiq05I/tfG1g3pJC/HAn8bWd+bVk84sBobJBagkdEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=ibkb26Pw; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="ibkb26Pw"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd3208so30081436d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1790006334; x=1790611134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YMayVPzqy74wYsK2+s0iOp7Kd4xLwxOjegiyzaJMk4o=;
        b=ibkb26PwKeFh8h3IDEl552m7Km68fRBAixjECbFf2TEb7MPOhkmgX6cgYFnZI3DlQv
         99T3tzsPHJf/3lmRDRp3s4m6GA+SU0EwWOmoFTmvz/nyxHQjCDBf0dp23N6bdYsqLqJH
         c+E27S/+C7pJDAtWolMOufPFt3uKNuzqHeU3Ymlv1RUDcWRYK6/CIcM0cabhQbVnfu4d
         Q8bz3C6krLgVpU8fl+9aaQYDgP7gUf2S1alLVk8JPp9DEp7cRO7vlEpDv3GPMmaocugo
         qMwJJOsnK87RYmbi0M34KuAJ1WpR1G9HGWh8MuPMTCuo51e7M6PJ6DjdrQ1sC4AF0d4U
         l18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006334; x=1790611134;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMayVPzqy74wYsK2+s0iOp7Kd4xLwxOjegiyzaJMk4o=;
        b=CPeRS18pOqcsjOy05C1DD/v1gGBLontny4Sjvl3ORMuLn55niHZl47Q6ie6+Gj2Cyt
         rqrxqehdnJ3ZywBr1rn+WPDNVyCb1hwI+/N7KQLL5R0VBUZGvh28mST5X4lbXeQA6aOc
         TsIQKBArnVQySxtA3xomM7v5+T6v5zjCGm1+lde7+Tr7AxK0WF6J1ykWIxngf6U3XIdG
         tlXRWzAY/UvFWxeGzEbV9DogdVwwTdb2E4Dyxsa1PjeWtf+xSQ/DAD0HaWkPzbPgHDWs
         6TQSxyGw4e3kpHyIhoPVkGxALC0qRyRbL4aA+/mCFPCCBnI8vPekoWHvC+yvOfITQwhg
         xuzg==
X-Forwarded-Encrypted: i=1; AKwUvBy5mFelxNpVu/R2ipofN8KhcPfGfFqL1iozS4mENVv/2fs2epurTozwimGFULDNeizPz78Kpp56Vhsvp1c=@vger.kernel.org
X-Gm-Message-State: AFuF++kw9kkOtfUG9mmNhfSCENRt20V3SoimLoQu71gEZkwycdb9t3nZ
	hFEWZEbFlr6EVCD0AVb0z3+OrJ5er4JFfSMMWWlyIoqeVde1i4+yVZfDUU386dJAR8I=
X-Gm-Gg: AYBFou2CyIpCBbZ03IihjNtGHH7sYaQtG3qg2tcBjBnHjYj82tgVvS7a9cBXWi4SWt+
	jVAqZ75MT/GPnDQq2izMHX2klolUhOxJWQ0qLvpfciEQQMXGdFpv3ksQqwf4kYlEvHnsU+If03+
	cTdmRvNenMMfPVpRxhvf9BAVC5aiyTMiIbOyU4fNEN7AoEUvc5E/AEpjhK0iDkfrg3pUhzIGWrx
	AvApv4nJYW675nu1ffp1XMRFt/YPr8RotOONIB0YOIWBxnKg8Ma2E5Yj1qVwDTvxgc/2MMuocnu
	V8j4ERQoMdWiwp+RTXagATQZ/U4tWzUy4VkEHtQ6Eb6r1Uca1GdQED4efnHXIZYZJRKHVmki898
	Y1BzQtd5UpjwtcLPz0w9fwMgK4Pfo+V+40jnWsBM7f6dyfhNcCdS8Qqc15AgPax3y8Op0ihMk6x
	pn/w7yT5gf6/OxB/wWKlFnE+yHnyLxiuB2yyGn3jfh38/9XwlYcSel1a0LmQMoHBNGOeHD7K3ov
	PgUbf4=
X-Received: by 2002:a05:6214:27ee:b0:912:6067:f517 with SMTP id 6a1803df08f44-913fc979c79mr11430666d6.46.1790006333775;
        Mon, 21 Sep 2026 08:58:53 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a86f62sm70283746d6.33.2026.09.21.08.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:58:53 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:58:52 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Matt Fleming <matt@readmodwrite.com>,
	Salvatore Dipietro <dipiets@amazon.it>, akpm@linux-foundation.org,
	abuehaze@amazon.com, alisaidi@amazon.com, blakgeof@amazon.com,
	brauner@kernel.org, brendan.jackman@linux.dev, david@redhat.com,
	dgc@kernel.org, dipietro.salvatore@gmail.com, djwong@kernel.org,
	hch@infradead.org, hch@lst.de, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-xfs@vger.kernel.org, mhocko@suse.com, ritesh.list@gmail.com,
	rvvandan@amazon.com, stable@vger.kernel.org, surenb@google.com,
	ziy@nvidia.com
Subject: Re: [PATCH 1/2] mm: page_alloc: do not give all non-blocking
 requests reserve access
Message-ID: <arFUPOi6gadAvD3E@cmpxchg.org>
References: <20260905174239.99e31515fabe220aa7d8e6fa@linux-foundation.org>
 <20260910114602.926944-1-dipiets@amazon.it>
 <aqQlUr-1h07G8JWM@cmpxchg.org>
 <8d6a8a63-4adc-458a-b548-a47bf5ff8eb7@kernel.org>
 <aqq8pWI0u1IZNWHT@cmpxchg.org>
 <9f415dc7-adad-4161-b20d-7c3173f50ff3@kernel.org>
 <arFBJdYaRx_iJNDA@cmpxchg.org>
 <arFBWvzXPYrKuIYi@cmpxchg.org>
 <arFFKGrpPwtTkoCi@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arFFKGrpPwtTkoCi@casper.infradead.org>

On Mon, Sep 21, 2026 at 03:54:32PM +0100, Matthew Wilcox wrote:
> On Mon, Sep 21, 2026 at 10:38:18AM -0400, Johannes Weiner wrote:
> > +++ b/mm/page_alloc.c
> > @@ -3246,7 +3246,9 @@ struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
> >  			 * reserves as failing now is worse than failing a
> >  			 * high-order atomic allocation in the future.
> >  			 */
> > -			if (!page && (alloc_flags & (ALLOC_OOM|ALLOC_NON_BLOCK)))
> > +			if (!page &&
> > +			    ((alloc_flags & ALLOC_OOM) ||
> > +			     (alloc_flags & ALLOC_MASK_ATOMIC) == ALLOC_MASK_ATOMIC))
> >  				page = __rmqueue_smallest(zone, order, MIGRATE_HIGHATOMIC);
> 
> Would this be slightly neater?
> 
> static inline bool may_access_reserves(unsigned int alloc_flags)
> {
> 	if (alloc_flags & ALLOC_OOM)
> 		return true;
> 	if (alloc_flags & (ALLOC_NON_BLOCK | ALLOC_MIN_RESERVE)) ==
> 	    (ALLOC_NON_BLOCK | ALLOC_MIN_RESERVE)
> 		return true;
> 	return false;
> }

I tend to be hesitant with single-use abstractions, but no objection
if people think this is better.
