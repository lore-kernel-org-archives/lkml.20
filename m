Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6E8274658
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519907; cv=none; b=JOh/O5MGbv/kUKx5FAXBCxX+YcTvkd8hV3ryxFqGHLXw8jfGyuAT7BMLCB19KvrSiWFA31CH5m2jh3g3rDsvjLtZywAfDK7W7d7IAwlzq+NiN/42B+N3en/q5ytC65CHofN8V00wm+YeXHw0R/a2QU9e0UgZLMxHdsF2EVEf7sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519907; c=relaxed/simple;
	bh=CIEikly5adBPfI4DC6vpJFIgu0yg2lYRS72GJUddXmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVid5S9qxeOlxRHRvw77ooYtJI3VMc21Gvq4Rn89dViMr2IK4145EkbwGow8InS3YCbDWeJUdJepO4RG84oylqlBEP9mY53tRTnM+K/CDbBQZi02puyP9GjZi5twADydrfzwx64tTFazoN8bghWbn/iXIk2N26g8M/wusqqxQ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DhXYdk69; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DhXYdk69"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so9092965e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788519903; x=1789124703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1rOqG9BbmC32OqlOD3H5WvHopYjdITPBpgRjKKEHgD8=;
        b=DhXYdk69auscKzWs6fzK4RnAlAty1jjv50wFLQMo83mSHr+QJvdy/ZBg8N2XNoxTUy
         qgkCh4+4+NO33t/1dZ4ALQLooUUFkCRazncu/j+TiGpZ+JPOcM3XvvGWotMj6O7nwjZD
         dyuKfdtIi3comBblfmDHIeTqp57xr8R/nrKX5EO/7JGq6Rvd9YSTjDrm95m0uDGls8SS
         D0WbzHZtt7GwWgAunFO6A/ib6PS0X6+nSLE5mZAGkapVe9E2u0EjI9DR21tjVyOpdLsF
         cSjj6pozLHYj8jnrAzx5hUPquLzIM+Y1zzxb6AQbi3c67PLOliizbVP+ZXgF9+aufVnz
         O04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519903; x=1789124703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rOqG9BbmC32OqlOD3H5WvHopYjdITPBpgRjKKEHgD8=;
        b=FSi/LpxtgC4b+szaHnublQr3CHqhHPmteDUJ66CsI1ZWWzboPjCasebHblb2+P0Th4
         6mcE0ziUGVTpYoRJ0Slp0d48EZ6XHDjlDoLEDw6YvPiHPPHZExXNfkIbw5OU17VGDz+o
         tUp7EdcxuKhAhlUmU1UP0B5QEbevaDDzxq49rLNr2jelNzjP1h35WGZKcftzTEOgfggj
         JBQQqWSlLIlwQ5RTH8Ybx/244EBSOAhVlweMHGZH7/ikjm2FTBgW5wGfRgqkcOzdkQ7b
         BjA5uCAcE+mgKdFuXgkg6Pej2cxrdZrscgVFYKDc2GPH3NzpD5/lj/wlBEukOHwL9ipr
         kPZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0mKiKjiHEDRdlzRLPc+8qF+1KNvCkoYvkBHFxRF7JraZQw/SwtFFbICQxJWR90dCTVRlnoY5qHoA8/9E=@vger.kernel.org
X-Gm-Message-State: AFuF++mU7i51BOAJaKtxH9/cEg2xqfaGvCYagdZsZmIW6kqVwHU8Moe4
	L1d3KBAZsz1SuPciCd6Q5dYh3JqHMz1hCCYTMcSkX/itFkMve7rMXImPId5ZzSdgsBc=
X-Gm-Gg: AYBFou3eeT8aukmi8n9AqjVVBzCmbfp2Gjca5aoCPzaXyY73KTOGeOBTRHIzBgE6ChW
	s3pAF326ODK+5ZjqfFuDIJTR+wD7wgSKtpPfUO88Kg6B1Al9WifL5KI+hHkKzbFL75sUWgRwTHd
	VpLF8R9SUVsUevNhRngW8e+8LoCXJFxrmxMpXZIsPsqrU5Xta3qqd4H0cV/SHOSljf58MLhXJte
	j2NEF1Vpr0YfLMZYoVuHKIxBS5pLUA4ThN09Z2b5c64GHew7xeRLmnmRQx9JZtOroa/sjFJzUMv
	flFUqZNFJZW6LHbv+UQuCNgRakOPnZgvOvn2DbcnrpfxYti2Z4R73LyvSd+vQ04NQWfOUskFXlq
	E3mFhCQurXLkpU5ljPSOx0nA1zbVpoKiBsHqns4UJryBRj/HmEIN9LHXFzqWtzEvYPHQJq1jb3u
	rm4OGbvr/kEiSvIoKub8OPtiSgV0Uymc5W2xXpm+lqA/LO19NuVn46N4PQjldi8YBWPKeaIxsXH
	A==
X-Received: by 2002:a05:600c:3508:b0:49c:fc6c:be02 with SMTP id 5b1f17b1804b1-49cfc6cc032mr25392865e9.25.1788519903187;
        Fri, 04 Sep 2026 04:05:03 -0700 (PDT)
Received: from localhost (109-81-91-122.rct.o2.cz. [109.81.91.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf771e9absm62865535e9.9.2026.09.04.04.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:05:02 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:05:00 +0200
From: Michal Hocko <mhocko@suse.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: Miaohe Lin <linmiaohe@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ye Liu <liuye@kylinos.cn>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] mm/memory-failure: convert process iterator to
 for_each_process_rcu
Message-ID: <apql3JZ3dryCzJtz@tiehlicka>
References: <20260904083001.553587-1-ye.liu@linux.dev>
 <20260904083001.553587-5-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904083001.553587-5-ye.liu@linux.dev>

On Fri 04-09-26 16:29:56, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Replace the manual rcu_read_lock()/rcu_read_unlock() pairs combined
> with for_each_process() loop in mm/memory-failure.c with
> for_each_process_rcu().
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  mm/memory-failure.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index a8b03e2920ba..63a2ff08ee33 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -555,8 +555,7 @@ static void collect_procs_anon(const struct folio *folio,
>  		return;
>  
>  	pgoff = page_pgoff(folio, page);
> -	rcu_read_lock();
> -	for_each_process(tsk) {
> +	for_each_process_rcu(tsk) {
>  		struct vm_area_struct *vma;
>  		struct anon_vma_chain *vmac;
>  		struct task_struct *t = task_early_kill(tsk, force_early);
> @@ -572,7 +571,6 @@ static void collect_procs_anon(const struct folio *folio,
>  			add_to_kill_anon_file(t, page, vma, to_kill, addr);
>  		}
>  	}
> -	rcu_read_unlock();
>  	anon_vma_unlock_read(av);
>  }
>  
> @@ -589,9 +587,8 @@ static void collect_procs_file(const struct folio *folio,
>  	pgoff_t pgoff;
>  
>  	i_mmap_lock_read(mapping);
> -	rcu_read_lock();
>  	pgoff = page_pgoff(folio, page);
> -	for_each_process(tsk) {
> +	for_each_process_rcu(tsk) {
>  		struct task_struct *t = task_early_kill(tsk, force_early);
>  		unsigned long addr;
>  
> @@ -611,7 +608,6 @@ static void collect_procs_file(const struct folio *folio,
>  			add_to_kill_anon_file(t, page, vma, to_kill, addr);
>  		}
>  	}
> -	rcu_read_unlock();
>  	i_mmap_unlock_read(mapping);
>  }
>  
> @@ -635,8 +631,7 @@ static void collect_procs_fsdax(const struct page *page,
>  	struct task_struct *tsk;
>  
>  	i_mmap_lock_read(mapping);
> -	rcu_read_lock();
> -	for_each_process(tsk) {
> +	for_each_process_rcu(tsk) {
>  		struct task_struct *t = tsk;
>  
>  		/*
> @@ -653,7 +648,6 @@ static void collect_procs_fsdax(const struct page *page,
>  				add_to_kill_fsdax(t, page, vma, to_kill, pgoff);
>  		}
>  	}
> -	rcu_read_unlock();
>  	i_mmap_unlock_read(mapping);
>  }
>  #endif /* CONFIG_FS_DAX */
> @@ -2288,8 +2282,7 @@ static void collect_procs_pfn(struct pfn_address_space *pfn_space,
>  	struct address_space *mapping = pfn_space->mapping;
>  
>  	i_mmap_lock_read(mapping);
> -	rcu_read_lock();
> -	for_each_process(tsk) {
> +	for_each_process_rcu(tsk) {
>  		struct task_struct *t = tsk;
>  
>  		t = task_early_kill(tsk, true);
> @@ -2303,7 +2296,6 @@ static void collect_procs_pfn(struct pfn_address_space *pfn_space,
>  				add_to_kill_pgoff(t, vma, to_kill, pgoff);
>  		}
>  	}
> -	rcu_read_unlock();
>  	i_mmap_unlock_read(mapping);
>  }
>  
> -- 
> 2.25.1
> 

-- 
Michal Hocko
SUSE Labs
