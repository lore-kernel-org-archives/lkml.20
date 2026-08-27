Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441833F210B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830818; cv=none; b=tSbi86+/vb6JT2/Eq+CVp4ZQtcCoR8f6wgNoleTsVN0BvCIpcioctdGdMSDxJueZfnh4hYNKNCGJ9dnAtXfYU3gNywmJClcCJYsYFvMGq1+qjhdOwVRmeJXL4Xexkct7edJ+NhoF7PSJnujmNDJDgf3gCJJchu6iozXXBw+rgmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830818; c=relaxed/simple;
	bh=mVZQb/UAW/e8qu9OIDpvgtvcZUEZbUx5AMSRAziBQg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0yAk5m9TW5BtIddbP1pe7ISQW4izQc44xIyk/egXdWNTAZbhTVuW+5Dtk5uIrgbHsw5ltTkkdXNeNDF0UTU5NpNl+DL2TPOlWO51S6S97AhMVHgUq65SIN6aKbWnYdVGT/qZ+QQ9YF8IN+4dzuzQiUvF920SuqZbAie/mFHrLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMGFBTcU; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMGFBTcU"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39266382df6so520930a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787830816; x=1788435616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t1JOPQJp+51uCszh+hJ8mwVKxXA1ndqmwYZcjdWNa5s=;
        b=mMGFBTcUCm0eZQXodPE7WUJyah48hn0BQTQt0+JKDFEQwRyR6w71t3UAXeqBFLMuwc
         fJZp55+uSBKc5//itBeym9hCnuzB+NWxPfyiTDLVI/y/7zpjIQR/qJ0JFnrj0w7HbbOm
         QnGhKM5LQ5p782aKb4U3Q2GjNzkWebPRR+VCkauNI6zTUl4UCoFrGh5UGtu4wWNUSFlr
         y0O6DPzSHbvWtzwY5JEgSjlZ/2GSnPmCufWu8d6wysF07IJbnPHbuXBaTz2n2AkugD8o
         PX5rlU0D5IpOmvMGMAu/v4FsAhP025I1O2iAILJxIcyxawJlxdkl+vK4DQzY2pJql94a
         vsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830816; x=1788435616;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1JOPQJp+51uCszh+hJ8mwVKxXA1ndqmwYZcjdWNa5s=;
        b=o7B9nA8Tfx5oq+NamS7E5s2CtgypYPzD53FbGVKFxwanjuWboOTwX4M9SlIYUNPluN
         DCbidu+aE5U1LePXyltLPdAyo8ea+4+ECke+1qBXxYO9lwcN0jU+BEMHvpu/uxV+zK6O
         /xfcfDEH5v6AjQCijdwJ1CoHAHO2KpB6npmlF30U8BTqpXO1nAJWg+WmnRcWItj+HQkC
         4MMywzBnji6s++r0cUUATt9InaoIatjfrFmS9h/vKRP1VOCS1IGKUOmaNL+d1EX0RCja
         NgKyE8swEwOT+iE7uFcoC/TadRLFITx+w0IUOmqJpcxJrUQoX4Kz//jeQ0zRA9AKjbyQ
         DZgg==
X-Forwarded-Encrypted: i=1; AHgh+RqU8KtD+buvmj6PuoK5DTfarSsQpKexFXaWQTsGQd0zOZIWSSzwRHcLoTlR2S2ddctEhXfbl4ufuZPhmRc=@vger.kernel.org
X-Gm-Message-State: AFuF++npzLfSVjFok9EXoskuUpV/g4kMRMFT85JzfJPmbUt/3O786WiZ
	4kB6HIRaLnd/oYDXZUQXjzAxyE4Y2kHCHBOLxQcnhGekBJN3bG/SFJkd
X-Gm-Gg: AR+sD13jQFFJVsI9pTijB563JtFW2ZjBfz5vc9fLPJNFp+fbKF/8QnUmb4sHaZh4k1p
	BSkU7aYAgCmkZvV8VxNZ2qti8R/vPM1poxHr0PgbAEM8SFSeHrCnHsDHb0A9EvelNzHkpExbhJo
	EiDMwGhoRJa7pLa3L3cQViLvEneBw6H0tMZ3qd5n7nobbKXY6Oc9/i8+HE/cLYIyC6bIQaexZ5s
	pTW379EzsXDPDXAmp/bcSMhH7ipXJANzCYcfKtJKEI1ef3ww05ssA0KpWU0za9LunT5n2fpmSQl
	3u8W3V82IFz35J4u9EkR0FqYC0aD2KnBJmA0F+y7MmuZjPrNWaWfHJJzQs8EQ+6BypsDHnWCj5l
	tcPYHhKi8Sm4mg3vxFxFcgF8c1qpOHm3MehJXx17ZJyow4vLPdkH4HKVQvD2X79qKgNE17GtoG+
	8mSJ8Vq5J0RIrCFZVdDQAzyYVkV7DQLfl2E+dsdqkjSWMD/dM6vmRSUPlw8X9pIWOKcMmHqxVdx
	8HidoYwdviWZf//Zj8mFhwyMrM2U6Xy9/AFxTIGfsuk8CRZyUz4qYeaYXtpTd926Df1fJLT/s9f
	90lCcSOCS7k=
X-Received: by 2002:a17:90b:54cb:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3966d5b7c62mr30914853a91.7.1787830816480;
        Thu, 27 Aug 2026 04:40:16 -0700 (PDT)
Received: from nickhuang (2001-b400-e2da-56f3-9c0c-c5a1-7839-5c55.emome-ip6.hinet.net. [2001:b400:e2da:56f3:9c0c:c5a1:7839:5c55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0d3d7fbsm2475627a91.3.2026.08.27.04.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:40:15 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:40:11 +0000
From: Nick Huang <sef1548@gmail.com>
To: Yue Haibing <yuehaibing@huawei.com>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev,
	baohua@kernel.org, youngjun.park@lge.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] mm/swap: Remove unused declaration
 swapcache_clear()
Message-ID: <apAiG61Phh7ANjzT@nickhuang>
References: <20260827082722.1809702-1-yuehaibing@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827082722.1809702-1-yuehaibing@huawei.com>

On Thu, Aug 27, 2026 at 04:27:22PM +0800, Yue Haibing wrote:
> Commit c246d236b18b ("mm/shmem: never bypass the swap cache for
> SWP_SYNCHRONOUS_IO") removed the implementations but leave this.
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  mm/swap.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/mm/swap.h b/mm/swap.h
> index d077e5893a42..29060a305443 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -344,7 +344,6 @@ void __swap_cache_replace_folio(struct swap_cluster_info *ci,
>  				struct folio *old, struct folio *new);
>  
>  void show_swap_cache_info(void);
> -void swapcache_clear(struct swap_info_struct *si, swp_entry_t entry, int nr);
>  struct folio *read_swap_cache_async(struct swap_io_ctx *ctx, swp_entry_t entry,
>  		gfp_t gfp_mask, struct vm_area_struct *vma, unsigned long addr);
>  struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t flag,
> -- 
> 2.34.1
>
I checked the current tree and only the declaration remains:

$ git grep -n 'swapcache_clear'
mm/swap.h:317:void swapcache_clear(struct swap_info_struct *si, swp_entry_t entry, int nr);

Acked-by: Nick Huang <sef1548@gmail.com>
