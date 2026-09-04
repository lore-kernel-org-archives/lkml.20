Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF22E37A829
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547037; cv=none; b=Rs/PwnG8C3BiQMGlKsbT50f1zhvECgpPI7QXPx5TfVAVxapIn0y8ZOAThXFazt5Lj5RwXE29AMpCyGiQcO3EL40RrJrDbYX9Rk5tclmvEJVndexQgbWrffFI18C63hooW2LiKJVF+NKC0OG3vO7tXWB4aJ/clMlp49qGDwNbVDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547037; c=relaxed/simple;
	bh=9OizNw+hgrpcrtMrjmo/Q42tnd6hiO2d6YxBTG31b2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjoiH7HU6g17Lki/Fr6trWLVGxLDVorJgzornj1yAy8wPTcliGVNA7GeaR+WAkpWK8Wx7sLcG/Qzl0HjZNM9SxGF+hU8uZ0Bmw5gQvzpQdMrxJfLilSu3eRHvpDdy4VMvKY+upE94WDinM75V97hkEUY3+Pt8esJ5ug0df3gmxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=CJdaVFIh; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="CJdaVFIh"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66fa996e65bso2598995d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788547034; x=1789151834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EYrVETvRvxY5BVpkhPjtzdiUc0wbZQ7Wsx0WTj7855w=;
        b=CJdaVFIhuntKxgWQYRjP8p9Uep5QjCzbT9IDqTq2W66nm3pY8nV1tf/TfASse3DUR0
         GZMIO6YCn5v6yHLl/OaFUZrhDJNzmLc4M6RjiadiKecQh5RbfMuITqFgkZLMHp/RjVaG
         hmHU8bk9HeaSS20wp768XosUD8UNgB0nb+tRIfxUf7ZBYHaA52bt/Kzwa7gWOKzJF3WZ
         gSZINxyx1bOYfUneAcZV8qO8AZnSPe/9jO6YAASaq2ERShBWZVYNAm2wZmK3J3a69rma
         MFP5kjsySDq8WWS/Xmc5Kbiu5GUsxZEJ0FJ0+6qr9nolb6JrxrfMdortIWNk/bwIOXjE
         gUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547034; x=1789151834;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYrVETvRvxY5BVpkhPjtzdiUc0wbZQ7Wsx0WTj7855w=;
        b=TziQ81NYPFZntBcMDcK7ERgTG08b637io2HQ2gd3jRAHLFNHu4GO2kNbPkP2usm7rw
         Aw6yI+xN+IvsUiN584OFKH2hH6Cg2lOnoKGE+JM+AknStiHCC9M4pmrlx5ZDatsukaSX
         SEU2OdicQaaOLmpoQp9nYGSjNAJHJmJNb3ZBBAA5KHU4daT9Q9Xb/V0Q1lp7Nzf8Psqy
         WD4Tzfs6Jk4zKd8oUNgoqLlPi8qOXen6jtem/y2Vvuro1vd50effTPs5Vb30iYrWk3um
         YCWmHMhFisW4++4tzx+WGmnLKxu6EBssvUrR1Wsh7hiwD1nJhsYNKzu9gev4leNJ00h8
         ITTg==
X-Forwarded-Encrypted: i=1; AKwUvBxLvxTMihcgdvrsMBjOB9ttFHsiGsbu09uUUZkpP6ZIOl27C1vGXohNSzVdlP/xpmXktvphdH5dW0lW+i0=@vger.kernel.org
X-Gm-Message-State: AFuF++mRdQlQzE5jSI10AapvArN8HNIdXv0LMpNot08os1+Wf72l+z+X
	gabPBCC9Vif9uiASTba4D1BjOpSZnbjKYWkCckCzxPJIqOn+WvYti10V2EEVkE8zbvY=
X-Gm-Gg: AYBFou3k9+vNhLYaaYMRzS0/ikUBBML43MnVxvUpLboe+rq0ALdtHXc7eJjUJLjpRLZ
	0Zj9PBeaze4jdYYiHAdxWpt7WnbpPEbLtOFVA/2GQVyAneSC4B3jLTzLTYerwXCTB4CwATpb6s2
	+ZSJsevoi5y9wzLiguDPnoCcqWH/QzPctXqcY4x8ziuH1A6hwzs9/WEjPjua+AB87S9Hwg+rlzg
	ruHC5sTNGc21npktW81g+dj2ej6Xp8M4+Gho+Nnk0J1++apqv+wlrHjj0zWWBwkjT7B3ml9QBC4
	wafHdo8x1PFc3DoRNnNjOwXIyzWC/9jh4RGMXBFNwbgqnXtICuhmOE6CWT3BvAngu9nUMnyYxbJ
	3JLX+KpIyvMrt/lD7xqegV8iOcFSqT57YyZfMDf+uBjpz0x3G/Z2h19jrNwQ68xfx5xwOK/nmHd
	qXy8ykVRK+B7E9SLdKizUHF+QYzWqBmQpD14FRwwVuVvD/jQSZwjR/qfz7dcX4
X-Received: by 2002:a05:690e:250d:10b0:66f:8d5a:e091 with SMTP id 956f58d0204a3-66fb59585bdmr525152d50.13.1788547029035;
        Fri, 04 Sep 2026 11:37:09 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714a979199sm24242077b3.29.2026.09.04.11.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:37:08 -0700 (PDT)
Date: Fri, 4 Sep 2026 14:37:07 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: David Stevens <stevensd@google.com>
Cc: Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v2] memcg: Don't call schedule_work when no spinning is
 allowed
Message-ID: <20260904183707.GF6641@cmpxchg.org>
References: <20260904173145.2028377-1-stevensd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904173145.2028377-1-stevensd@google.com>

On Fri, Sep 04, 2026 at 10:31:45AM -0700, David Stevens wrote:
> Memcg charging can be done from any context, but calling schedule_work()
> isn't safe from an NMI. If memory.high is breached from a context where
> spinning isn't allowed, use irq_work to schedule the reclaim work.
> 
> Fixes: 3ac4638a734a ("memcg: make memcg_rstat_updated nmi safe")
> Acked-by: Michal Hocko <mhocko@suse.com>
> Signed-off-by: David Stevens <stevensd@google.com>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
