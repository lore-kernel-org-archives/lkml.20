Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BE750277A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739983; cv=none; b=kq3SyVek+ZIvnHi4SGEtX3X4a3oawbKRS2WoHItwwk+HE6Z+MmKaeI8Sg303xv/e+EWRm/YVa3Fh2WPC4VyWzlPxh+6zUzxNNb3m2SbGVr8hNImknN+xtPmS5S4noEgBIBF3gMteGgfMhDWUL9yZnHw05woL4VKGy3pT8uG1ZgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739983; c=relaxed/simple;
	bh=ke3ZCKM47ww6KNrh7xwOWcB9U0ZOh3zBVE7s6lPa5As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INsX2Q6TPNtqWDRui4SGPbLuLgrdDlmseaNbDyT9d1/B/YcLh3Fz5FQhAYUm34gfL68yBNxHwg5px7wFkVbAH2Wo8Kaw+rHgRk3+5kYxPj8/EuM8cri8XX5qbzS9I535Liw+I2uCJTK5uLGOSNaiSUD7283+UnAXlgb7SnifKWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Rg5dgeqC; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Rg5dgeqC"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a222edc62so86238585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789739980; x=1790344780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FSS2u3Aow+SobxUjbVcIwPVLjVRkiJichXhPV/h32Jg=;
        b=Rg5dgeqCBo6iYNpnBxzFVvDaWnDuLnkdFY6tmwnghwRHCpnFgBwgWYkDoJkW45pi+d
         4v+tCJnd0//avbeU9TJxKmJztEtz7Xz0woyUEsJ1AJMKrxVm4nSoDGhVZQ6zL+5Sgyzx
         jchJpxGiAcgmBjlSeGVbJXMJbFqmkMGFd3vnS5BxMFw83luqYtjZBAkJQzWGmZnCMl7J
         g4tuOOPRexHW1N/+QPP+XjrmZlpSgGfL2WBey5N17r19qHzlpDyPtE+Qq8rRI1srpuH6
         rqUpEoGsi+uGinAw3pTU0/mKddzOySUYjXJc7e1b/QX1DlR7geJTZSHygfKmvUJkhDRk
         WsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739980; x=1790344780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FSS2u3Aow+SobxUjbVcIwPVLjVRkiJichXhPV/h32Jg=;
        b=bzvzC01W22nfiVNLXVdusTZNBqzxOyrsm/aNLjmeOb1avH6L0t3WY+D04pyhPGQVsY
         GlPYSLF/R6Sirj7kpWrPlBruyRjzwtS1qOykvbQ1jhCFxkkHTv7DgfC8j4QA11dtSIuL
         wp1MSEGyIUAesaXgslIXvWDvTOw5+e2uQ71/Fo3h4Dvoy3oCE5+65X/QAbENAjjdfFpy
         RHyrvoooSspXp1aTOIi+lRPcu4atDGIMfuqO4QSv8rzC3Qh3j3xX9S+8mOOFjNHLcDPL
         wtNBsWIRKB+X+OfecYKmVG/aWzTwCYReSxByMqbukrayoYAR4VOMpCbGXnVD83lz7Oml
         pLIg==
X-Forwarded-Encrypted: i=1; AKwUvBx7oxNbguSb7s1RPfhlFPqZrIFkVmvwACWhVO7FceOsOiTh6uXspq9MOEgmz73IaQvg0F2rOv78xJPBJCM=@vger.kernel.org
X-Gm-Message-State: AFuF++mxPdvKPmBDk9mMPm0GpY0JHeDrD3NgJ/E1epUvFuHvS1O6rjHJ
	WLxO76yqxZyNxbLNaj8GYo/A5E+QP1pXMLxDZYRTFlqogE48Gak4l9wD40uMrh427pZhDBmHhBx
	si8LH
X-Gm-Gg: AYBFou0ANKZ7K1xewofQmmA0XWfsT5/urgV7yZYyKTA589dVuQ/02qUzK1S5jXpzCMe
	0uEI8xFcsdI+UCzwrQzvshCNLTKwt8D+6Agv3B+Os5NZPfc+8E+P96dGCaj+Pvzr6CW6v+u5LYp
	Yt7t8nly5KzO3DD7up8NsOPpZJAxmzPIyxCmegL1wENZ3ItQOP8aG1u1BZ1DuOepFts3n+yeG0t
	3+0kIgycYHv7UT7OHPzXKUAwrLYWwXg14ZcO8nCGHIADWYEKLHxOZhAJ1C6rnlxp0CNcgMZYPru
	6/SRzKMT1uMSxbMKHddYc5N+L7oEg1aFJ3at3I1QrSc5BokAeUag9ThMAqTSyz/T5OAtqVYQwxx
	kM/i+8wY7KfNUMYZJwXAPJUoVCmAjevfLqj3xM1zb04lD1VzOMnA4e4I1j/PiPZTS3sXlMFgQxF
	k0kBlmxtZnleaXO+VJvWinE9oHtqBoLPrztldFtZeOfcSJlEyhaVYJrQe/rt7FGv6TKzkG5JDJr
	qda+gioDFC1/PJBydEjZoHCh2uK6IaAalBb2rRBr1+9vfjfMg/JkHk=
X-Received: by 2002:a05:620a:8909:b0:933:aa0:bb83 with SMTP id af79cd13be357-93bdc747954mr358888885a.34.1789739980266;
        Fri, 18 Sep 2026 06:59:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0e508a2sm143621485a.11.2026.09.18.06.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:59:39 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:59:37 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, jannh@google.com, pfalcato@suse.de, 
	osalvador@suse.de, hannes@cmpxchg.org, raghavendra.kt@amd.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] sched/numa: do not let VMA PID activity gate
 promotion
Message-ID: <aq1DQfuI2XPJQ54f@gourry-fedora-PF4VCD3F>
References: <20260911001826.2109390-1-gourry@gourry.net>
 <20260911001826.2109390-5-gourry@gourry.net>
 <e2695249-ea36-4a4e-a5ba-22bb5f7299d6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2695249-ea36-4a4e-a5ba-22bb5f7299d6@kernel.org>

On Fri, Sep 18, 2026 at 03:01:34PM +0200, David Hildenbrand (Arm) wrote:
> > -		/* VMA scan is complete, do not scan until next sequence. */
> > +		/*
> > +		 * VMA scan is complete, do not scan until next sequence.  A
> > +		 * promotion-only scan reached the end of the VMA but did not
> > +		 * sample placement, so it does not count towards the starvation
> > +		 * horizon in vma_is_accessed().
> > +		 */
> >  		vma->numab_state->prev_scan_seq = mm->numa_scan_seq;
> > +		if (!promo_only)
> > +			vma->numab_state->prev_placement_scan_seq = mm->numa_scan_seq;
> 
> 
> This is all rather ... messy. I mean, just look at that promo_only() computation ...
> 
> There must be a cleaner way ;)

I tried 3 or 4 different ways, this is the least ugly thing I could come
up with :\

The scan sequence thing is particularly confusing, and numab=3 mode
(NORMAL|TIERING) makes trying to reason about this whole thing really
painful.

I can see about making it at least a bit easier on the eyes.

~Gregory
