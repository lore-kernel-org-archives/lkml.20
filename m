Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021149;
	b=TMZffBECzi6ZIv8wKlZ5WW/QuSgH07Gc+q8uBAWgK2Frel0uyICkLkas3gVbpOVJq0PP
	 tnDpBj6UMR9uYV/MDfyymlxKaeo+gZRSK+9dPkc5Ll9zHnJlLRxY+gJa5VCvxdR/ICOB0
	 oaB0gsKm6bziQK0F+Nhu0+uNCHfR8PwfSXdRxpg8ZqtuDVzcZ8W7rWw2Po2J9jjEeGV+C
	 SssXhnEjeEsJwZY62tbyRfWOlPnYv9/ok1j3acPjfRS1b4Z1qRbq6D3pgO8E/3iMJw5jl
	 lD4Y/rqzU/Wzx5aBsKtW6T6LW4JLv14ktU/ZM8T26e76WqL/ORCnEyeCKO4yDVodEMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JTZ/P1YmJ6IZNJ6lk8Cg6Zigprwxb6S7rjKWG93e8pw=;
	b=1NfO7M31l9+XDo6f6oWFLyMS0J/Bf8xqDqoPNobJdaPa2zA81IhAuGPa+bcItALYQ0WR
	 ssV0lXL8hunGAKPvn0DiOWcl7RyLkRutDeGhV63rX08JFJLJlJQUeholfP2EbXkni4rfN
	 koCe/VHQ8/TPxfGlCvb48LnUoecCA0d5GqgitNzzFtj6xVlK998j63ooIyo1FA/zAqXyT
	 ZA6uSIQmauxVYeP6jt/bd0dCNzd9wt6ZvTxCfhptU7tf9UaGE5ox8s7YjP1Hju3SV5dOJ
	 WKpYh63I8mIzP9MziqklhD7zzOvMjGQyyFjTL1A78ymgoCl1EowO9hpQeC12tWOYC/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TeC2FOPt;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB9D606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AB9D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TeC2FOPt
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso19237935e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793021147; x=1793625947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JTZ/P1YmJ6IZNJ6lk8Cg6Zigprwxb6S7rjKWG93e8pw=;
        b=TeC2FOPteMhC84ln1XNPf2/uDi0Y1HNEWRFnSOT7TjP9dCtOt9flZwVcpmIH7osh2S
         f4kq+T7b62JMHP9bVv58rt7+W8RN6vJjr4iPpVcodn4j+Xk1X5eBtPopddvTzpYIsxMK
         3FNdwQjuoyg7XvmkqvAeADWLNLzjC0zbNgoNVN0+cfAwltOyftmC81rBukPkIweUTb4+
         G58Jwu1rTaOAWIIl5paP0+PKvr6+i4oCqNSjkpI2Q+g1OyB8CE1k4Lfg2zM+K7BeIy/2
         RRWUX450SDMx7t3w1AddmhUBy0E/491GGDHDYHDoW5vOcuWcMDODhYjAqqZKC0e5unWk
         G7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021147; x=1793625947;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JTZ/P1YmJ6IZNJ6lk8Cg6Zigprwxb6S7rjKWG93e8pw=;
        b=bJn1xmO0/zgnXgWNT6u54SUkVY2caih2qz8Sd8bwj4f0RaNpdm4SOiJaxSVfRorpCY
         W5V06gCDnlvkpWAtZj7COomAzb/V9Dy6AkivY2Ma1Etup5gKJL7XlDIpgfI00uwIsZPk
         l20uozn3lsHiOcNhLcGWkd+7cozwtBqnAsQQh/g19hhasv5BqHEbMD7R8G6m8R9hsNsQ
         bLlUul0hrIR6gfOkVSsRQqahY4/dIxPdS0L5OyywAEFA/Pa3QNk71cU/jBojbuvMJ14U
         P2m4JGcoG5/xuSc1YX8NiY8ExmVi98hOLIzkKAr5ahDgeOBUB6WkqI2IUWgx1abkt4Ge
         86DQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+cSabeS8hx9mgHJ5Fpg7M5rD3WrfvMVrlB1JhVtLAlxxmVZG9ASQYyBKaS1t16RXnUGm0P9b9AJLSRaM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3N2QQm25U/dzwAZHgCbOIqLjvzm73bCXt/IwuDhqB9YSLNcuK
	La/khl2bpiYDUZ+2aDBe+62SejPGJmNl6LO2Sy+G4vjg9y/1KoKAvGPEeK5jN381Vt8=
X-Gm-Gg: AYBFou2mjeZmJYk4cV34+hWusiHEQZVyHwHhNswMg7SS83WNmp2hDx50j8HzeZHbaeD
	/pyF98oSVs7C3vwG8w9exgfqufgpDzWUdF5ME8qNwiEDCMV1CTbsphqSwT2TrLFtI9qF3F/UAnR
	pMlE1RZcRUjdKzgEfoZqK0SnyrMwUcOqwiZ8Rf9LsWbiCQ834CiOum0SWJT7ILxe33l6s6LAVSm
	lfuGRXbi3w6cncyfuruLd3FPVaRfd2pa2JW4P7M40ZxNgGMCNVi4N++nO5XFAxsYkOJsw149KM9
	TNbdBlVbqAfRmaTdEr3Z0jDQ48fRxtgAv9TWjyHCnB1TbWyOFvjJTsW2DO7mWUcMc0zx0cenBya
	bRhmyAEXxYSU9NImt/9fkibTB7it6S8SJEdtmNeiTB6rQzIBvyjCpMr/Kqxvj1D/LHYafC2oikW
	nOJ7tEyEELr3xQ34XCom+3Os2pdpDtfaheyke1rIkTP7ChYqzYKeEjxXfUNfpfy8d2qpgDbnmSW
	/Fan0h4IJNidPDZAqggcAiCVo+ELOzYF04IY3k0WQTrFVX6aqC+pmc0KtKne2wzt1u6hA==
X-Received: by 2002:a05:600c:a306:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4a4fc8cd1edmr72049405e9.25.1793021147467;
        Mon, 26 Oct 2026 06:25:47 -0700 (PDT)
Received: from localhost (109-81-20-177.rct.o2.cz. [109.81.20.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e11bsm232464125e9.1.2026.10.26.06.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:25:47 -0700 (PDT)
Date: Mon, 26 Oct 2026 14:25:44 +0100
From: Michal Hocko <mhocko@suse.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: hannes@cmpxchg.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, zhengqi.arch@bytedance.com,
	akpm@linux-foundation.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm: memcontrol: fix NULL pointer deref in
 high_work_func() on dying memcg
Message-ID: <at9U2HvyUP-iYOCt@tiehlicka>
References: <20261023222313.3979455-1-tjmercier@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023222313.3979455-1-tjmercier@google.com>

On Fri 23-10-26 15:23:13, T.J. Mercier wrote:
[...]
> ---
>  mm/memcontrol.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index a05d9a8baa1b..84f4a8fd4d16 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -2457,7 +2457,10 @@ static void high_work_func(struct work_struct *work)
>  	struct mem_cgroup *memcg;
>  
>  	memcg = container_of(work, struct mem_cgroup, high_work);
> +	if (!css_tryget_online(&memcg->css))
> +		return;
>  	reclaim_high(memcg, MEMCG_CHARGE_BATCH, GFP_KERNEL);
> +	css_put(&memcg->css);
>  }

OK.
  
>  static void high_irq_work_func(struct irq_work *work)
> @@ -4463,6 +4466,8 @@ static void mem_cgroup_css_offline(struct cgroup_subsys_state *css)
>  
>  	page_counter_set_min(&memcg->memory, 0);
>  	page_counter_set_low(&memcg->memory, 0);
> +	page_counter_set_high(&memcg->memory, PAGE_COUNTER_MAX);
> +	page_counter_set_high(&memcg->swap, PAGE_COUNTER_MAX);
>  
>  	zswap_memcg_offline_cleanup(memcg);

Should we simply disable_work_sync when the memcg is going to be
released instead (mem_cgroup_css_released)? That should both prevent
the run reclaim_high during the memcg shut down and and also avoid
plaing with limits to work around.

-- 
Michal Hocko
SUSE Labs
