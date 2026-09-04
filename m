Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D133B058F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519875; cv=none; b=XcF7r1ASpSEVASGJQbgKnb3ZlJfJq2nFi96a3MLXfJtVNmg64wS+623G12stgbxG0CsPG+lBVMGrKGpahCcwGfGDagG75WXWwNswgab15hRr1aF/ssUxWNmq4QS4ED+rwdNiB51flQNYTZJRBdrH5zDIIddpRESSwbLCEhr7OlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519875; c=relaxed/simple;
	bh=/cYKXayTvt4+K1v+cHgZdnEtdx/W3ZBjoxwxc7aMA7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RP9/HZv/T/angaI5L4IBRAsh9imnpBy84RQK5CBMXM6NCLvEkffyBMnfPP+mebImbVo1kTQ++H/guUNjMBdrnpv+fsw3kYHoJAXEI/Ni6NMMDC3/Pqvw3p7JOL7LMTj3WEpUysm4WoPV3VO+BrrJq+cezAbJC0tGO3L9P98Ofbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KpRgvR0Z; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KpRgvR0Z"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so9426095e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788519872; x=1789124672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ba0WVI8S/qZuXrDRnwRxY/dvGyBoVl56jflNJMJpGxI=;
        b=KpRgvR0ZwQL5mq5k4a3EIflWGb+u6pcz3g4S3wDi/c2gpz8kFAa3LZYDJCSj2QlSXP
         GIAoho3NLBVM4a93n1M9poRpN0rl+ruSw54fL1lsURy8XMWq21ps1ubU5Nge58T2XYGv
         REXHU2f65FR3+sRqoD2uiJm2iWheDD1y/zg38O8UDbgY5mcxFT24un5XNQ0Vqx4cQNdb
         jgR+DoL7ZObKH+NkgisRI9Ju9IbBDUyNgAmDo9q8XwtjAmLkJvRy4UKIi4muSQLQ/OTU
         tNJ0OIpFxHh7O2FdzAG0JbAl3I7tQ3PEjK6DHEnoNtSCwsuahPRsk7mCMricld8Wr8H8
         samQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519872; x=1789124672;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ba0WVI8S/qZuXrDRnwRxY/dvGyBoVl56jflNJMJpGxI=;
        b=TXeXnckjn8mWymgkPRLwac7BGaNY6JM8/qOk+YevMTsUeHP/73zKYm56uDWVDOOioI
         49bvA1E5m4FaMXZbVTBgBsxQS7vtshjFE2n0wBmtfW8DQVdAut+F/sUdPhUl+6aYc5dQ
         4j/LCgk6aw0+c+IXS/+Wa1ZqGqrhLZSgOUsNkfTaOm5AM/1azZnyfLz2KiK391NYoWy2
         96qegbB6lal0wy5IZMdU8+vHu2jQ2cjvT0miZiqCRotK/nXJaOWeeRC9s7wMVK/QhyBQ
         oj70dfmnqHnYwOUbwZWv19AhvO26bfcFFenFKHtp6LUfw7Rq4xPwLe97ouOgwRbZHntn
         J5OA==
X-Forwarded-Encrypted: i=1; AKwUvBypAAOyRsrYWxu1EAFIyAImFdj8NffTan1vYjE9fTs8yHdFA8qqySVjmtKhGZbitS8JP9C8Qnhgpvz0XiI=@vger.kernel.org
X-Gm-Message-State: AFuF++lKf/s322kyRvc4mY+2t5jkhd3092GhQq/AobQKzhu9X9/MSiFY
	ayfdc5S3pVl+GfLHri9SXKtvZ1olM3NiXAB+dsAZh/2VXCcCmFDTNFJzGJV377aaauA=
X-Gm-Gg: AYBFou3xWfeeAj7/0eFNdFp4dI6+3yogVp+wQ5KKGc7fAbz9QeAhqVN7Bw+DGJpVyRG
	nSxp/X4OVxjACT58a4Q+GGEIdFX0dmNk68ib/E4xmN7KxRjKw5p1QB1hb5hmheeyHSrP7ylSOHJ
	4+dJezd6iwvDjnDaJpJJULuOCKA7DPInbZy/jXCTO121Da8Tj7vF4VyUd0qZF12OPXJAH7hl7iB
	FWu6Wxc1X3A883k3EhZndz/oYl8NvdjNY9i9er78psda8qvy5E2qcQfDJ91UfrJdUH4LKXfPfjx
	NhOubJDoOp43wYdPKfleRtnX9YZc30TxgDLbaVu+Fsv6StmbaQnPQqlQ1H8CgTx6Y5ZO3wdHyXQ
	yntyj/Ey3HcU3geo81t41WGZrx3poU6ueSKnPMEJT7c//0BF1h1CoL0gX3OcuiHaX2OsXHxsXlE
	mcX24LDBLRcUKg7Iwm1PNLAFaT7iIoz1r5sGqxHTHtr3MK9eD1NSJ1tb6Q36rbrXcxYEUJoNEa0
	A==
X-Received: by 2002:a05:600c:8b05:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49cf82787camr51743595e9.15.1788519871896;
        Fri, 04 Sep 2026 04:04:31 -0700 (PDT)
Received: from localhost (109-81-91-122.rct.o2.cz. [109.81.91.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm142910265e9.15.2026.09.04.04.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:04:31 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:04:29 +0200
From: Michal Hocko <mhocko@suse.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Ye Liu <liuye@kylinos.cn>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] mm/ksm: convert process iterator to
 for_each_process_rcu
Message-ID: <apqlvearwGfs4A3_@tiehlicka>
References: <20260904083001.553587-1-ye.liu@linux.dev>
 <20260904083001.553587-4-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904083001.553587-4-ye.liu@linux.dev>

On Fri 04-09-26 16:29:55, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Replace the manual rcu_read_lock()/rcu_read_unlock() pair combined
> with for_each_process() loop in mm/ksm.c with for_each_process_rcu().
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  mm/ksm.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 49d48d1e0998..fa5e4c47fb1b 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -3280,8 +3280,7 @@ void collect_procs_ksm(const struct folio *folio, const struct page *page,
>  		struct anon_vma *av = rmap_item->anon_vma;
>  
>  		anon_vma_lock_read(av);
> -		rcu_read_lock();
> -		for_each_process(tsk) {
> +		for_each_process_rcu(tsk) {
>  			struct anon_vma_chain *vmac;
>  			const unsigned long addr = rmap_item->address & PAGE_MASK;
>  			const unsigned long index = rmap_item->linear_page_index;
> @@ -3298,7 +3297,6 @@ void collect_procs_ksm(const struct folio *folio, const struct page *page,
>  				}
>  			}
>  		}
> -		rcu_read_unlock();
>  		anon_vma_unlock_read(av);
>  	}
>  }
> -- 
> 2.25.1
> 

-- 
Michal Hocko
SUSE Labs
