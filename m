Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F1E47D44D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156676; cv=none; b=U8e+tMKRW54+Uy057rHA/kGnOWCbAsxaBHXpL0LX+Pye9i1NXkTJEXiHQsGnZhKlX6II9lR1i1AsQniHiunITNiN4McjxGZ7RYHdN8/0eAouB+gkZB+l1GttRiPvKmiI56OxcJYXbm5Eop7lBWMzs5iAqkqYapPc4G0sOOkO5KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156676; c=relaxed/simple;
	bh=aK7qUen+NyX1GNayTzmaSYy015S35Zl3Kwbf2q2lZnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLRQnIgW/l/kTti4dcXjCZsGptP9qctVwvDV5pJN7NCCmiCRMlQx6isvjNy1sVlgOW529cLBx9pwlHp4C5PHj0o23rVUyXlevx17J9fEXO+zBflXCl4FT+5aP03HeBe4jlmOrH5cdsER7EFQ/rowjWSV1EYHgi4svFDUFggttsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=UyDiUGhx; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="UyDiUGhx"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9196d8543cbso23403536d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792156665; x=1792761465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eCoaTxM/vxVZVMtWCyBRil1iHn0bt6ZcqZozloqgfQ0=;
        b=UyDiUGhxkP0Nr3d9yMgfNBz+IB6muQrMKgRkADhW0BE4bmbo7eu5Q3JJkspcT9gojF
         9SiDTrvIs7DLLbTazrAJMZws7SJYEiyh+VRVHyEZJxJI/2XgPUcWwChvIvFeIYVAhmY2
         t4MoRtRnbKUuMR0g/E2IEaKO0TupVxBl6qon5SJrl6xL9T1DhFzYQj0h2CfZrInh6Tcr
         yNTAS4PzZBhjyooPZxIwH8RutobNH4MO6vzRqN+QnbPhjTgoH71dj0829+OJvTX0q6CS
         +dhjei4ywQ48pxyuhnsvQQbzfQHFVdJVr+2f3ty63nPUXTGFS/neW8jqqP/Qdkt3TNSK
         WBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156665; x=1792761465;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCoaTxM/vxVZVMtWCyBRil1iHn0bt6ZcqZozloqgfQ0=;
        b=Q7T8gfTVRFVzbPHSKb3cE8vEBlp7FU82FjJGcFfqogo1PybEZOgHC7YArgLeyjm+bm
         8sl3G17dCsSIxcWbzyCX3gKoQAIyx4gSU722TWTqpzSHLlbdskYvEnKPgb83sQc3JKMN
         eHKamm3Qz7dIbgU+2Fav98wO9D5DLthJoD/gzx1+f+5k6NlhBC435FeedohLSGebHJFO
         WUnuUYvWHONMDkFPTUZNkuqQHZ2T8TmloQ5w73vyQ21Wrm+DBlpabfS0ShwfTywFI7sL
         yThyDz6EkHwIsnqtZQGYiM1ipapWCfeUHLnZEzAj49hqrSBOTl1FReXfukVHvTRBH1ig
         HrOw==
X-Forwarded-Encrypted: i=1; AKwUvBwx/CwcJJ+YVx2psR7VKkSuhf3Nz19Dwmtx2GHnCFRob1AyDZq6TA1m8jaCAtqeRe+f3xBnzJBf2eAh878=@vger.kernel.org
X-Gm-Message-State: AFq9FYKj88VkL36A4X3Lt4MLw3Xwr7cFlwHpqcy8LErMzbfeybJCZHWN
	19mnOJQbKt3gD8uQchigswSmrUz5iyxKwL5RyW+onlVJtrkJ6lYnwFGRmOqHS6IJKW8=
X-Gm-Gg: AYBFou33sWnIt8SbdMJkYJwmPZpOzQGbQWeuIqEVi3VEjQZCLV6PyiKV9X9M6ImSGNX
	PJAFoEMLb7OSe8IGhsz618DCG++Z8g177tV2AZgt6SUBydF6uNI+tTY2o46Uku0PFseAVxz3l6V
	S3bbu0XQFt0VEsvXWGHRGhTnmWcZH4uM9hDy68kiu5sfOkuDAoDfpi3eSCN1KIznEm2kstujRSf
	oBw24A+OgVHnsETOV3s1uYm2neTRcy4say+gWfTindmc4kkPne9nenPL1C19JW+TXDwI1o2QaLL
	GEMFS0lagdtpdjf4jC27Q1vwalR/vdlLujlHHK5v1FHJFWsthE95FKgOCVUxLchAWkMH6oLIK+u
	4x/+ZfI1CPb9kNXpsa82bxgpramHmDcRmviWiCrSepQvh9zpPQTktGQuh6rr89h4qycywwuPFSo
	YCoALUDplAQFN0wDDN/TMCqzSf859mcrJH/D8GCXx/TtSlHtvqj42ntr6FdDO5eWruqUxsCyeSf
	UrgCyEMaoPH9bqr47zSAk+AFtnybG0DblMkrrbDB0SoXjYYLulO9i1fQ+jtLH3sfw==
X-Received: by 2002:a05:6214:2b8b:b0:917:a253:4f8f with SMTP id 6a1803df08f44-91b55577090mr362058926d6.40.1792156665348;
        Fri, 16 Oct 2026 06:17:45 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb0961csm22365796d6.30.2026.10.16.06.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:17:44 -0700 (PDT)
Date: Fri, 16 Oct 2026 09:17:42 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, ziy@nvidia.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	ying.huang@linux.alibaba.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mm/mempolicy: convert mempolicy refcnt to refcount_t
Message-ID: <atIj60f_iMYCl7I6@gourry-fedora-PF4VCD3F>
References: <20261015231322.3392551-1-gourry@gourry.net>
 <b64e2b5d-d880-4ea9-ab2c-c04a0963427f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b64e2b5d-d880-4ea9-ab2c-c04a0963427f@kernel.org>

On Fri, Oct 16, 2026 at 09:54:33AM +0200, David Hildenbrand (Arm) wrote:
> On 10/16/26 01:13, Gregory Price (Meta) wrote:
> > struct mempolicy uses an atomic_t as a pure reference counter.
> > 
> > Convert it to refcount_t so that overflow and underflow are caught
> > by the refcount saturation checks.
> > 
> > This silences the atomic_as_refcounter.cocci warning, which started
> > matching __mpol_put() when it switched kmem_cache_free() to kfree_rcu().
> > 
> > No functional change for correct callers.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202610061946.Bx22ZFrw-lkp@intel.com/
> > Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> > ---
> 
> Wondering if we want a Fixes? If this only fixes cocci warnings I guess not.
>

That was my thought.

> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
