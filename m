Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65552C237C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787832259; cv=none; b=kIsvSV+2IyZD26zTUj/AgVUbovPNte7BYfYa1fvlJTwrr2vb6upfOpzOLohPQLqiKX0GekBfVLTpa8KwQ1Efd/IJPn+7fagm9h5nYOHvp92pqQEY37eFoM8mHNKBEBqRQKqsFMEd0TR/QQfd/eYk2KF/cxms98OPQJDYRsErzdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787832259; c=relaxed/simple;
	bh=sisPV8gzEpPlKpghtjt/eOx5vsk5qM8t0MCPsEmqUhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a84u6KtR0CLQw5mDthJNNiE5lifCFAcEgN607xFXJurytmAydNkg+l764Eh8vuWSd4CrcrHlGwa70wxSSCmgDsz68vwdsHVIdJpsy20whKO892LpxIjdXhJosNNxLjlKejLZX11GGUJAb1+pJEt2QEAy71pP1mvEVdfdC1vdP7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ptc/ttcQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ptc/ttcQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so8316675e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787832256; x=1788437056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GP97XYSOxAd4mwkEh8pXHynZ3Zgb6dcRm0VHZ16u2ys=;
        b=Ptc/ttcQykigA1DF/F2r5O7S/7kxd/H7gnsic9BADBJlWlM586l+y2xqLMgdmDrX5K
         PBiqR8ZwsqEw+bO6z8YcpN6FUapN7EwSaCm2XM9IQAobM5HzN/cuwwTQMgS0Hk8+snhI
         ebUt7Ir1LW9S53JZKPADNbanBCOI+gGWiAMsiRbB9b+CCFZLtQYzSteFGKDk1iCjLc94
         8vPKBd+WhxfgYoRInnOMnAnn+kUIoQzxbjxxwoRQ4Ef0rcK5xA+ltPNIxLtX8f+5EP35
         v9Kprc5fIIVlYhLAL78L1/vSBFQgTHXlhi65jIcKhK/ZVJVvy/WqZlvEtdtAcCKEa/d4
         DMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787832256; x=1788437056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GP97XYSOxAd4mwkEh8pXHynZ3Zgb6dcRm0VHZ16u2ys=;
        b=Nh9imX1CnMVEuKR5hEEyx/2MzIZaIEO6dZ5yQfF2UNAGg9cvOMBeXVKtLgoBU/TaUb
         9YsymFS5aO93GT5ntxshqt0SEEDKBhSRxsHokFvI2B2pN7XDKLkkcuABBwDW33m1QWsj
         Finr3Ifduy81C5dG2z6IskkgfpkqAIUHdoY9ih29wPWYg0ymW3trel5vbCoEt5jwqjJ6
         QxOPToBfTYzQ4Btp88d7U8VypBTK6bqa3RGD2LQPanq9VLGBgNMbnkvo/W896BB4H6TM
         1+G+s32oxybO9XuqInc17nEMGl2jvSEUgmNDWM0dauohgnOupZ510lGps/utjtVlrZyg
         3vnw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1q9Al9ELBszE6CXxYTIT8+hoze3FTOvUM5eP0tHwmdaG8eWanPhBabeXnrj2pBK4UnWwSMS3VIBGWtSU=@vger.kernel.org
X-Gm-Message-State: AFuF++k1M75ZSUpWyuWv8qcnevOs0ixcquoD7SoA+HnA1y4ib2dmdVlN
	K70f+zTRNBhVcVmVqa477IYNzUvm6vRYqN4zI2Hu59civL0Jq/9xijH+ZjQfc8rzi2g=
X-Gm-Gg: AR+sD12tkFOBWtIrxVscI5LI9TOQaUmeB0Yyr+Tm5nTvZzkPHgy3eMbKZun3kyhvT6a
	XIxfHiA+qL2UlXJXL3EV5jE8snXUlj8CYNjvJ+XtQs7rqTqSXey9X521gOT+T54l/7q8hnopPXJ
	gvNVJjs7SbCx0Zi2izBuq4NffP0NsUn4z3I94EHwaeLQ8MyduWVxwRJb0kMzX4CGH8PVIVD/MsF
	meXy1FDRLMgDe21/4fL5IuR1ZxMqFXOJnYPdYUSVzSROEyVehNBTgpiNwm04WLjdp61vTfXQgcI
	PLrR//mq8DcdmTxOWN963wuE3XXXnVrxUEdTWBPAlzlwaYDS0w5dIr2YTSgHugPsRHyy1wmXlm1
	0jqUzeS3qyBvjm211aAtrRvPHpyPB2jYPDw5A2rE1LzSmaO3jmu9N+lRLL2/R8I0Ignkgr/cVvo
	0AeNJqJesd0WnJ8EivR4bE82fkJkt+qfQa8URwSSYIwuHDZT0cU70CUVZmgHJfqL6dGHDo+gobz
	qsjKarVIn7i
X-Received: by 2002:a05:600c:3513:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-499dc82c0d7mr166799585e9.12.1787832255539;
        Thu, 27 Aug 2026 05:04:15 -0700 (PDT)
Received: from localhost (109-81-32-216.rct.o2.cz. [109.81.32.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dc134sm8549762f8f.20.2026.08.27.05.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 05:04:15 -0700 (PDT)
Date: Thu, 27 Aug 2026 14:04:13 +0200
From: Michal Hocko <mhocko@suse.com>
To: Hao Li <hao.li@linux.dev>
Cc: hannes@cmpxchg.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, akpm@linux-foundation.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: memcontrol: treat disabled memcg as kmem accounting
 disabled
Message-ID: <apAnveXHmeQlKJnU@tiehlicka>
References: <20260827091813.22327-1-hao.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827091813.22327-1-hao.li@linux.dev>

On Thu 27-08-26 17:17:50, Hao Li wrote:
> mem_cgroup_kmem_disabled() currently only checks whether the
> "cgroup.memory=nokmem" option is specified. However, kmem accounting is
> also unavailable when memcg itself is disabled.
> 
> Check both conditions to ensure the function accurately reflects the
> kmem accounting state.

It would be really great if you could describe how we could end up with
the inconsistent memcg enabled but kmem enabled and what kind of effect
does this have.

AFAICS the inconsistency is possible and it would lead some wastage but
no functional problems but the changelog should be more descriptive.

> Signed-off-by: Hao Li <hao.li@linux.dev>
> ---
>  mm/memcontrol.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 1ebceade4021..b28f6165c354 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -132,7 +132,7 @@ static DEFINE_SPINLOCK(objcg_lock);
>  
>  bool mem_cgroup_kmem_disabled(void)
>  {
> -	return cgroup_memory_nokmem;
> +	return cgroup_memory_nokmem || mem_cgroup_disabled();
>  }
>  
>  static void memcg_uncharge(struct mem_cgroup *memcg, unsigned int nr_pages);
> -- 
> 2.54.0

-- 
Michal Hocko
SUSE Labs
