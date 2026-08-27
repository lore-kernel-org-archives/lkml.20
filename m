Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3865D4432FD
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842762; cv=none; b=M7pbtc3k7e1yhCFcgRSO/vYKzs7IwBNtXMwcWxLKJqfXJrFvLyJnFc3eiAy4YGaFg3UZCJPvBBoEKPNJQ3B1qXLvA7/SPFfNaQnfZ22uvzSjb3Z6enyC1V+QmK2nxxPn+pMYQ19RQhCAQgabZbEFUV4qG17nhKllWJtN0LikGK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842762; c=relaxed/simple;
	bh=RR+IUy6BeU23gJRdnSXxRw8SirU1x2z1Zv0XN+mlf+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adIADVqjo3xPlLEhJg2LP0UtOU5wX3+fDQagWiZnG8Nv768ugmHUgC71OhnpqUJwCkkd87U4VhGkHBdslJ/zN8wKvOayZDI16jVGDh9vFznJTDJf/RTH2nTnPwQBygmF+HF54FZ2VXXrRpJujBxqJ+3E9jtikq+iT7iigValsEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=lFoZFqjD; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="lFoZFqjD"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8565d77c277so36846507b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1787842759; x=1788447559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d4lPcSEVrhw95aM0IABtxJRmbb0KihXHWFn9jTHO+gA=;
        b=lFoZFqjDq9phDt72Un3JCDMdeZIOtIYGQ3jWW4EYhWYAo5CbPp0QcKiOnE+AJbaaYq
         AYjewtTUfh+eGHC5p6ImFm9/Suxn0PAei/84jTYezOcu6QW30E9jfACTJl3odUB/rzki
         mXWCYw1x4fZuy+MmpstiAfGk3sl6X36ssgJwW9lsGhJpoSk7uYIXCAHFGb1ng5Cc6NTt
         Zts2ACxDcGj2hFRNU3hH5dnRzXIo5r+odb8Gmqkw55/zT0jn53Io4y5DmActQiBp2s0b
         lQ6r9IjvBlj1GWtJt1uv0b+KMPvK7WieOrL7WAbrIMcYwe2XgIao6ZCexzg2yfuP6uBD
         svRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842759; x=1788447559;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4lPcSEVrhw95aM0IABtxJRmbb0KihXHWFn9jTHO+gA=;
        b=osBs++B0AU8SqCGhFATMiNcNVm5+x5SLuuxBKffIrCs3VCeiUsV3o2FuBVs3vhmAT2
         a4eNAWADw1X+2jNFlsa3H0MVM+j2ORfUUZ6HYGVY37tHSsHgVtvxVuOqWxdpcbs2tY42
         7X4/bh5xIYCSn4S4pMoWOR5Rq5B3242sWvY485awt0KYxElDm0ecoZuODH8bQvW/fcZd
         Oe0MX2Y+hybF6BNFU7WsPmaXm9s5RP4nx3ofaEUJJBGOOu+u6DiSMhKnqRGvoQRkVBhI
         7XiZMAaLRYbGEdFhCNWGl29GPcgrUIV3b4H7n/+6exilu1P/gsgR/M/+kP7uSmdj3O1R
         G+jw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1kcCK+PEp9g7JLEZDrBYHY5a/qSq8P0HsM/gd6yAqMa5/oQGGb5IYrymBjAIqeueZPeHkx/6rLbztWJA=@vger.kernel.org
X-Gm-Message-State: AFuF++m5iDsvvXR5pZ2rUUfhSUev5mwA1rVJPfCF49o6gfJ7k+UqwR/h
	ZX9kocI+lHZ4aLI7jQgxPd0RX2hfwEBVFLnAp9hKaM06wLyMMmp8uBVTA/km3MT9y3Q=
X-Gm-Gg: AR+sD13y5k9EZZh8EW0kHhaZjrr/Xlstu0Y+eTrSaLLPMeSBxgK3EMJpuW8uypf3LLD
	MkqAbtfvwx+IzPQiePhT7n80meica2LlGghFYdj60hf1qEcj6DHHwO/2qZu/0GW7+8qolcP2hw1
	FDPzww14LML5ixbMzljbDzj2aRYqBe1aWLJIBLjDU6VPRg3MApFUSxB9aGjQy3izI0CeZg8C26E
	vMNZ78rECJdi3gO0RqutJt3Ijxr/4aOPVp09mxjwFipILwXFLBENlFgitQso9LIy5hH3fDsdygb
	m0xp/3ePv3aUYBd/XM4qqXTPhS31QgCfYnIVB1o2doNrJq3e4Wyic3a26GMqcImnmu+2PVcYT+P
	g5u9qNms9/vK4IG3ebxzJIQGjfK0Q142QzVOEAyNnRyZTsfysXoFJcilLYA2oNOE3KkOQ+G9tOD
	JD79X4i/rQRBvlxPvmL1ryNjXkwgK7M5BbdNFLk8jNf81aXA0vR1cCVJa+8sQ/
X-Received: by 2002:a05:690c:e288:10b0:858:def3:3422 with SMTP id 00721157ae682-858def3356cmr38360687b3.27.1787842759108;
        Thu, 27 Aug 2026 07:59:19 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85b5bc34efasm11365667b3.7.2026.08.27.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:59:18 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:59:17 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-mm@kvack.org, stable@vger.kernel.org,
	syzbot+ced4d9a8cadb5ef3adae@syzkaller.appspotmail.com,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yosry Ahmed <yosry@kernel.org>, Chris Li <chrisl@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
	Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/memcontrol: fix data-race on reading jiffies_64
Message-ID: <20260827145917.GB3004@cmpxchg.org>
References: <20260827025457.116191-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827025457.116191-1-jiayuan.chen@linux.dev>

On Thu, Aug 27, 2026 at 10:54:56AM +0800, Jiayuan Chen wrote:
> KCSAN reported a data-race between tick_do_update_jiffies64() updating
> jiffies_64 and mem_cgroup_flush_stats_ratelimited() reading it directly.
> 
> Unlike jiffies, jiffies_64 is not volatile, so raw reads are plain
> accesses and can even be torn on 32-bit. Use get_jiffies_64() instead,
> and fix the same pattern in mem_cgroup_flush_foreign().
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 508bed884767 ("mm: memcg: change flush_next_time to flush_last_time")
> Fixes: 97b27821b485 ("writeback, memcg: Implement foreign dirty flushing")
> Reported-by: syzbot+ced4d9a8cadb5ef3adae@syzkaller.appspotmail.com
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

Minor nit:

> @@ -785,7 +785,7 @@ void mem_cgroup_flush_stats(struct mem_cgroup *memcg)
>  void mem_cgroup_flush_stats_ratelimited(struct mem_cgroup *memcg)
>  {
>  	/* Only flush if the periodic flusher is one full cycle late */
> -	if (time_after64(jiffies_64, READ_ONCE(flush_last_time) + 2*FLUSH_TIME))
> +	if (time_after64(get_jiffies_64(), READ_ONCE(flush_last_time) + 2 * FLUSH_TIME))
>  		mem_cgroup_flush_stats(memcg);

time_is_after_jiffies64()
