Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0302E3DA7D1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821861; cv=none; b=tAs7aKbBdZJu0UuDLDIDUFr+UvUJC9guleDzLkpsaObjPUDffill3EM9VFn3+uHuPiO0qoABu7CIxPgR2N4FyNjzTjaKQXvJiftb6Stv9Cab/6Ktr4y5QYSeR4AkR7ihQHEuqFejwJTSH+o8h2BV6kmAV6mip0iVLnpSISR6v5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821861; c=relaxed/simple;
	bh=LqgdIrtJQQneXjCqqx/hAKf/sXya9n253v07jls08PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPGt8ag9F6ESPs6/Ww28pgvQNbU0ZMxtM1TEaJi2vkTUeXrZ8QX8xaz+wcOl4B/tOltz1ky9T2R3yOqwss3V6wDZI0WfrxJjboTaOXG1NqGN5omx9Sz+niB2cRvlXPawAGZnK4EttM1+3ZVbLR1A7AE960hQLv03qg3s4m89rEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRvgfzhw; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRvgfzhw"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso1627886b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821859; x=1788426659; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tu2ly/KH2dLnBZR31VNk1zmOFGKKWjw22JUwhd3exbg=;
        b=nRvgfzhw01M/waXXz4U2CUUJb582RTjmoQ7wb8JkYCZbfGirukmyuLma+5+zVsOa1/
         LGEN4KwiCihviA6L4B1ajk4kwvCSHjppPHMiDajmL4cwAaVNT67KQb8kUvM+vkMcKWa9
         dyyqWrYDpDVfVp5UfQrxnmeJgAUsm/7IJGqHtB5FOs5UiSWgEv25hVSd7QKjOAhAP5zW
         5SR5ublVcJ7OtVB6cHNTW7Vapoqdczopsg4K1qFGbJeNsvDW+DHNdykDTt8+DaWhc+Xr
         onaGJ3CBmnsqf354Ns4eOqRUHz9npIOVPNlhCswsgYbpTs5Z2jd2yyrvTrw0WLI7+nyy
         J71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821859; x=1788426659;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tu2ly/KH2dLnBZR31VNk1zmOFGKKWjw22JUwhd3exbg=;
        b=VADfw74p+hzyjY4j9tHA6FCd40RzTA1+ASDZD9kioyrscMeZFyIvaaDOI89/kJ4WBf
         HPtpCJh2YxrXfL6Lmj9a+iQ+879/ZVMvcX+9JXrpDul323PMYu81bhWu478DfDBL416k
         pmnG6bzqAK23uq3fYlbUSwz53/b9fs2gyKBIggMbaE0ORwfjaQW1UicFFbICgvT8quoq
         pZeIPx3JmQhWxx4aqGzCPeBeq7GWdeKoMwQ/F0CeBkYhF8OBnb69UpTKbapn2xxbvXwn
         DRRZbpTzVCWbzWXVXn4wqZQ5deSRH92vqtDMnGhVrEFEVMedK0fJA8CmB9CNgsLzlJDi
         opHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSC0z+AOcVC5LRdbttCzZ1o7fv8ycxzueNLGbqzZEYdHJLM8Gcw2J7ovoNGETIyoOE6WUTgQqSzC20Om0=@vger.kernel.org
X-Gm-Message-State: AFuF++nNO8GCCuI8TNsEwb1DWkIDdPuSxSp9z0HB2mQQORGlvvqIVIMI
	iNNCtRTixAInbPXQzAfs9FThK3oKZ5kfX4IbOTGpPPJYyLmtwENzKdav
X-Gm-Gg: AR+sD13kIq55k2bzS980i2GiKDyu41TXQz44zys4DX4FJXCE/SNUSlH7Dfqx9fLPQwt
	Hz40lIEnK8GcFHWIVolztRj+E7qV7qz/9TR7v7CKLcAYbXtIf+eQ11WGJFFGAcsgWhg76TVR1l1
	nre59m2a2gF9n5UHxw1/aOGlghh3RpF1o+l2bCJNuXFjYlsHpx9JcXZ5hcLGbbugKYJK8rDEb3f
	HarX+IB6A6xoprY+5hl5qOVwRkQshtvE0bm7NPiNZ92WPw7pHkRlVR2EILaEUZqXd3HIjJUwBq/
	QqQjS7Go7ZjNSTQI2zIGGp2Twqo173fWK5BTmhBKxo1MfuIvq3tuaacF5pV/AZqsrrbZw4B9Azf
	g8mV0UYBw0U7RkSe/E+BABQfSr2bMVg+lImrGw5KgjbJVRttczAs5sqrgVtGI0m9aR2ouNs0VB0
	cCVwVBeSFle9c8yE/F9eSQ/oeZ+BLPGd3WhghoFbF4ON5NP+MzFG7Pg+D/l9e0GcjjNXPwmg+36
	I+7Q16wblbwaZVq4aMgYvG1O7YUIYMB+6I=
X-Received: by 2002:a05:6a00:2914:b0:84e:f90e:492f with SMTP id d2e1a72fcca58-853729a9f0fmr26681240b3a.7.1787821859257;
        Thu, 27 Aug 2026 02:10:59 -0700 (PDT)
Received: from KASONG-MC4 ([43.132.141.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535a7c2570sm1860103b3a.17.2026.08.27.02.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:10:58 -0700 (PDT)
Date: Thu, 27 Aug 2026 17:10:54 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, 
	nphamcs@gmail.com, baoquan.he@linux.dev, youngjun.park@lge.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] mm, swap: Fix potential NULL dereference when
 trying a sleep table allocation
Message-ID: <ao_ybL9yRO_pHphW@KASONG-MC4>
References: <20260820115505.20027-1-shikemeng@huaweicloud.com>
 <20260820115505.20027-2-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260820115505.20027-2-shikemeng@huaweicloud.com>

On Thu, Aug 20, 2026 at 07:55:02PM +0800, Kemeng Shi wrote:
> The root cause of this issue is because multi-tables are updated in non
> atomic context. To be more specific, the issue could be triggerred as
> following:
> 
> swap_alloc_fast         swap_cluster_populate()
>                          /* Try a sleep allocation */
>                          spin_unlock(&ci->lock);
>                          swap_cluster_alloc_table()
>                           rcu_assign_pointer(ci->table, table);
> 
>  ci = swap_cluster_lock(si, offset)
>  cluster_is_usable(ci, order）
>   if (!cluster_table_is_alloced(ci)) // ok
>  alloc_swap_scan_cluster()
>   cluster_scan_range()
>    __swap_table_get()
> 
>                           /* free table when more table allocation fails */
>                           ci->memcg_table = kzalloc_obj(*ci->memcg_table,
>                                                         gfp);
>                           if (!ci->memcg_table)
>                            swap_cluster_free_table()
>                             rcu_assign_pointer(ci->table, NULL);
> 
>     table = rcu_dereference_check(ci->table, lockdep_is_held(&ci->lock));
>      atomic_long_read(&table[off]); // NULL dereference
> 
> Fix the issue by making tables visible at end of swap_cluster_populate().

I think you mean "end of swap_cluster_alloc_table".

> 
> Fixes: 2fe7a6f5024b8 ("mm/memcg, swap: store cgroup id in cluster table directly")

Hmm, wrong commit id again, should be

Fixes: b197d41462c2 ("mm/memcg, swap: store cgroup id in cluster table directly")

> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
>  mm/swapfile.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 615d90867111..4561c864f806 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -466,8 +466,6 @@ static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
>  	if (!table)
>  		return -ENOMEM;
>  
> -	rcu_assign_pointer(ci->table, table);
> -
>  #ifdef CONFIG_MEMCG
>  	if (!mem_cgroup_disabled()) {
>  		VM_WARN_ON_ONCE(ci->memcg_table);
> @@ -487,6 +485,12 @@ static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
>  		return -ENOMEM;
>  	}
>  #endif
> +
> +	/*
> +	 * Make tables visible to cluster_is_usable() after everything is
> +	 * ready.
> +	 */
> +	rcu_assign_pointer(ci->table, table);

Hmm, but for the error paths above, they will leak the new allocated table?
