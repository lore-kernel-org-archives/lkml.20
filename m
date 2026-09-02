Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8053F0AA0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357466; cv=none; b=g3D9ch4XFVecP+W942VVvbx2hJyzX7Gq9Olyq2C0/vXRMJgaRlIt8t0WUOLbVAfGQsFMdbBPc5zeFedgpjSxIgDH8jh1BihMwexVEx703lIqm5UquqlgXoAvekxp2YBJDb7/lkF6QgWrIj2cnAmOhbC3DFj4/jsdyLdFXyQrARw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357466; c=relaxed/simple;
	bh=5ffPCRKimNoaUlduGEiFmE08fCzJzUZzmiBxAnVf3vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQhlk573lk78qA6GD5GmQWHE/bXo8noZ/bmlkpZPzIyglpWBKzbpq1WoV2xhVCnOss+rA6mDI6V+euQDQiiCsfEXzSLeYVK/jVDHMT7IaigmbQrlKq6OpURJRQHBzR7OdpbF2AXV9M6JIwCcGVU7tf3D6592on9Vla4zDmyJ5Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gAnZjAMT; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gAnZjAMT"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53031a57d7fso12444711cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788357463; x=1788962263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rYK9s4U82KWdve9IP4Oc1+xC+XsNRFYBGYpYPqFEM9U=;
        b=gAnZjAMTUsCJYSiQDR9p99Sbtirs3g/Z9CufoDzA7vZRrddBPyE4wJ+I/m8QqtPf7X
         LwedupH/x0lnNroOOmwbxpMth8R2f9D3XvGV8X0hqf0u+NlI6369QaMQdUU82gi59wmg
         Q5k4E0sN5GmaGE23KRNAVNwBGThbBJWbtIKKI7NvK8F5lu63pI2d4A+lNLfM2kNbgStR
         ZZYHLoHjYfksYSURmiVKZkO0kRGHSX0yGt7iEIgtFTE0NZKstJNqd0wmd01wwz1BbXIv
         6K/6d3Obi9P9IlhOy8jiAs70m4zoIFUJyrnWFyclM7DsXkn0LmwJuWjP/WGL/cGcKycg
         ra8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357463; x=1788962263;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYK9s4U82KWdve9IP4Oc1+xC+XsNRFYBGYpYPqFEM9U=;
        b=gi4Mu6KgCS+aVPVMKm1hHZXraFOI4qWpmkJJiHocvIA4M/uBiVjkXpOXC5lmjI65fv
         y9WzpVq8sKyRwIzbJRAtpYUGD4LvhDZXMRPC5GqM1P8ZE4PKQMDNZwqMVepYvXqgFPqo
         Msf5zVe6aXJqwTKSi8cJ0f0ZCK3So6kZiyN13rrp1fMuH+/UVmyH2ABY6I+scUz63PXy
         XsppzqDcRMkYrofv87pNOMuBMnlhql6ROMBXqspG07qjpwh74NlJTzr/SrcDsp8rZxha
         5tYGp5gjZPXr68wrC2nelcL8xbptDjgwY3PZS86B1rRqGih893Coq+C2Jramsaj7tI4T
         awcw==
X-Forwarded-Encrypted: i=1; AHgh+RpHHjmu3izHq/nuAN19Fj3GLSCfAiP7MkCSeoduk/SxvsoN3NI5Js+FdwzrLEXAO8CTurMZPJ9Ue0MiGQg=@vger.kernel.org
X-Gm-Message-State: AFuF++ml/OEorV3Prkse/12qk6FheJc5OgKjmiNN0b8Re3SsjrU/x8im
	m2sxHowJE/kbw/zADcXq1uQXihZvJOG0DPi8rQN+ZNfjNLb28tnEKboLE/FezQnsEgQ=
X-Gm-Gg: AR+sD12gJWvALNo02a4/2YqmCJjjPyKGogVql4R2CqDnG7Q7SYdvkIQXda2KOwT3BZW
	pICnKWjlg8wZClOvas7cubc6dXETj4PAioWOiA5H7yyuDHLqhZZV67eJNa569x3hSXW4u17eokT
	Uhdw4zRNbKb3lW4kgyYV9FwrSc69vF21yr2MHsBDh9rFJgWK4F7/Xc5U+DQbxMzOHYZ5+Htee4n
	3QvuElsTQAFV6zNMD8o0OVHMY4TOKsZpw6gn6Y3Mmc4EslzceDaD+mT/dP/UzUpn3Sq71bpz3Lv
	pp9cf7yhfg+FP/E4JX3VDwNh4yzzvYNRRPS3VZF/2quXF1fNRsJpSDveitkIMVOPZ9dWdVjuPVC
	Up/Vo4aZWGV+qtJTKAgJqEmpJIbp19Bx9ZaLbD+RXWFhzRx7SJg37SHjevlqgtEbWT0tJe/ewlR
	ViJ6zak2/HJwDBI6U1NSlwh18zlNCy5wEQu2AcLW3CsZHfYvtJDQODwFn1KrhRfI64tXy4AG/X2
	/x1wNwSIwYD5/jFmzjnC8FMZKNkcEFjWEAmG67vNEit
X-Received: by 2002:ac8:5748:0:b0:52f:f59f:2b2a with SMTP id d75a77b69052e-53036d15de7mr52617031cf.32.1788357458008;
        Wed, 02 Sep 2026 06:57:38 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331dd0c0sm19014241cf.19.2026.09.02.06.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:57:37 -0700 (PDT)
Date: Wed, 2 Sep 2026 09:57:35 -0400
From: Gregory Price <gourry@gourry.net>
To: Liu Jing <liujing@cmss.chinamobile.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mempolicy: fix div-by-zero in
 alloc_pages_bulk_weighted_interleave
Message-ID: <apgqvt8iIt-a6j2Q@gourry-fedora-PF4VCD3F>
References: <20260902090412.16445-1-liujing@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902090412.16445-1-liujing@cmss.chinamobile.com>

On Wed, Sep 02, 2026 at 05:04:12PM +0800, Liu Jing wrote:
> In alloc_pages_bulk_weighted_interleave(), if the iw_table contains
> all-zero weights for every node in the policy nodemask, weight_total
> sums to zero. The subsequent "rem_pages / weight_total" and
> "rem_pages % weight_total" trigger a divide-by-zero panic.
> 

weights can't be zero and we just fixed the rebind race

> The function already guards against !nnodes but not against a zero
> weight_total. Add the missing check, freeing the locally allocated
> weights buffer before returning.
> 
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
> ---
>  mm/mempolicy.c | 5 +++++
>  1 file changed, 5 insertion(+), 0 deletion(-)
> 
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -2697,6 +2697,11 @@
>  	/* calculate total, detect system default usage */
>  	for_each_node_mask(node, nodes)
>  		weight_total += weights[node];
> +
> +	if (!weight_total) {
> +		kfree(weights);
> +		return total_allocated;
> +	}
>  
>  	/*
>  	 * Calculate rounds/partial rounds to minimize __alloc_pages_bulk calls.
> 
> --
> 2.43.0
> 
> 
