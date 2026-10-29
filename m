Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267082;
	b=3tXP0l72gEggj5BZ7egVle72kl2NGyAx/RCD5JA1ICA3bcy/tWeRHa4UCcNb4c3yMaj/
	 +NwCxVNV8/NFFwqAT5lbx1TKUfciNOT5uTFCYxA0Z0ZDMDN+errjCVOVJVvuIUpSgweol
	 NKmyCFHTLtF0BisVNw/vwxKnZ3JQeMTKQdaVOX9nNOgOVmBCr88m/yxD3LHY+w2Kkuv9w
	 pjYlp0rfxg7T3OGxCj8/NnGMMXHyxkqhRvab3OzBsqfmbpLyh1B41n+3+a7EmVy31/6RX
	 E17OIilWsET9mdPWwoueamSLG/nvG5tGmh3B9EJ+02ZEo9YBBaE6pbt01uK6D9UP/aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XB5wy8uf7FyauSpZxvm0L4wuvw+kVmeWTT3Ttyk8h0A=;
	b=2cCiw/+/oYU0BTHGipvJq5WYGh3wxL7yFngZH/KbjGpfM4XU4Tx0Ccck5nEYbREbf4xQ
	 zPqCd63n9MSErGlr1Q0NcZcgiyx6N1H1F+XkmsTAXeinP+ehBfIgsToJCSqreg/sKSHtE
	 1ybsvHRw43UAFU+6w0BMbPv7FktiDaCzcsL13G5xqyR8PBvGam3xGRnSgsNFN7h5uva4t
	 LoTDB+GROAXPeUfWLiKmwpXHpQir3u3N8YRarvea4DHDyKRgUAD3FrOoqid2BVcu9lQCB
	 vS1QSyZrsehJgDhAuA4m8AzZYE7hGHHGbe3oe5i6viyazeRrcMmgDNdxrWmUfazVEjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dIfdgFtB;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A93606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A93606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dIfdgFtB
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so17942405e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793267080; x=1793871880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XB5wy8uf7FyauSpZxvm0L4wuvw+kVmeWTT3Ttyk8h0A=;
        b=dIfdgFtBPMLRamF68EyIRlEICj9q4kb42Jffqes2SFNWzyCNmCJvC8B0i2maza6Uw5
         PdkkcIjbfldyfBT2kHfRFEohr8FqgSQfqKdRT8fvITjZjmUNQQWmcNVlJ4KxvSqfGsKA
         9XnBgNd7l4aLO04juHA44YpcWfJmTtfb2c8mQVh6pSvCsT55zjxNMC/mVTmgmL3vymGK
         RcSkkcSgasSRmgJG0p8qUuagAq9M1RlIn6zUnl6IWRYcCdUDrkA3bvIGkrW5EXsvYW2M
         BPKsb1+7op8EPOfiwHRSci830GZs/eACD+txguFouPbEo0SFPfNtBtA0m4/fbLsWI7qY
         MzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267080; x=1793871880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XB5wy8uf7FyauSpZxvm0L4wuvw+kVmeWTT3Ttyk8h0A=;
        b=tFqS8aT8U/tCDxOGuwIjCmwyVEnzJgGKjyTgrUWnwfRGe5WwLRZmr3q6lpjtaR7j32
         ydtO7rY/X1LGeEtAmWdvfMiQF3T43LgckTMsFiuVKxbJr1V1Sl8Ks9Xu0k1XfXzsZe7o
         TtLZauUSENzGdahDU1SSlr2ZsyFMorBsF3/Itnxlaiuo6bEkJ3Lj9wDLD/7YyX7YKo83
         WLNkfNjHL0J8OxHDS3ggxp6TzzWa0PEPfGHm2FKOwyfrZPfoNtH2R0vanqmZZo9vDrVH
         nmn5JcyeNFE0QyW4JNxTzIRCn+MW1vqfLRnQIMDGaH/62S/5oBB4wrpb5h2Bt8P1bifE
         6PVw==
X-Forwarded-Encrypted: i=1; AKwUvBzJ9a4/oltr0uOaohWL4t2DSGH+cckmyAdE69OvO7He31KzsT/wP2PopvYySvmCIsXb2CDg3ImgfcmQKEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJu//MOSbI4vDq0ncxhHb5AMSn81Hcuujk41DuQWehsVCH6bial
	FDEPPAm6DyxdsZ8NPmQd++dzeFrCeEd97V2kPKuW/vC4MSkDFx6XM/1Na89xXW2mzVM=
X-Gm-Gg: AYBFou1j7T+bZJowJdpqPUflq08ie+xm0gehuepCC7ohL6V07cqEyEsK4alE5VQfrCq
	emmSCoPcaHBX5LWyR9G6vBHZ2rsQAC9oRD6W+ZVTFZj7EPsAXfdofOHA1dwkGuS+j4lALD/NyRy
	+Z6/ndHlHxd07HLPPzywKJybL76zYPlvASEOrED6jPH590EaUebLv7LS+blV0PPvLPSPHTQpfZx
	vZAyd8pF3YBn6vvmNQ9DYxHj4JwELJz/nfB+oLXou8Dmo3rG5tvC4HDVzp9Gk/2aK5LqL2VOwbu
	QRPusxtSSI6ZKXWPjFYibhY0/oyTmRYUOA0zSvl88YTXXsYzqoh0n3HMNAmy+X2F7Yj3pweyHqL
	/nm8dAIIDNg9nFRIj3pVxaWJC4/pZpxTdKPOKfUGVpcxf9LwiqPetEJ8OciXvqu94tIvUEFkC7C
	QLzIGZxIN0OwhjBfwrrrF6ScTHx2QOKUcYLdVzAXvvnXf6QHrJMG34fnIhuvASHq5Vx5yCqV2Tb
	gPhEfEPvyVI0R995pAGAvzg5e/ydT72dn3uOqfxA6n4bH4ip50GKtf/yH9z7ytrAz2AW640y1lF
	qe50sQpBfpx237wD+3C+ZORlW4fE61Lb7mUt3jO/8B3ewAp3cS2zPJUsUAdaFu+L
X-Received: by 2002:a05:600c:4f89:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4a966f209d9mr110155365e9.20.1793267079846;
        Thu, 29 Oct 2026 02:44:39 -0700 (PDT)
Received: from localhost (109-81-92-234.rct.o2.cz. [109.81.92.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80286fc6sm60488145e9.15.2026.10.29.02.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:44:39 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:44:38 +0100
From: Michal Hocko <mhocko@suse.com>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH] mm/vmstat: annotate data race in
 zone_page_state_snapshot()
Message-ID: <auMVhhCC5Ap5pdh5@tiehlicka>
References: <20261028100549.70689-1-hui.zhu@linux.dev>
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
In-Reply-To: <20261028100549.70689-1-hui.zhu@linux.dev>

On Wed 28-10-26 18:05:49, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
> 
> KCSAN reports a data-race on v6.6 which also exists on mainline:
> 
> BUG: KCSAN: data-race in zone_page_state_snapshot root/klinux/./include/linux/vmstat.h:232 [inline]
> BUG: KCSAN: data-race in allow_direct_reclaim+0x150/0x290 root/klinux/mm/vmscan.c:6328
> 
> race at unknown origin, with read to 0xffff9e0575410740 of 1 bytes by task 209280 on cpu 15:
> zone_page_state_snapshot root/klinux/./include/linux/vmstat.h:232 [inline]
> allow_direct_reclaim+0x150/0x290 root/klinux/mm/vmscan.c:6328
> throttle_direct_reclaim+0x1c4/0x480 root/klinux/mm/vmscan.c:6402
> try_to_free_pages+0x177/0x590 root/klinux/mm/vmscan.c:6466
> __perform_reclaim root/klinux/mm/page_alloc.c:3966 [inline]
> __alloc_pages_direct_reclaim root/klinux/mm/page_alloc.c:3988 [inline]
> __alloc_pages_slowpath.constprop.0+0x3b3/0xdf0 root/klinux/mm/page_alloc.c:4395
> __alloc_pages_noprof+0x28a/0x2d0 root/klinux/mm/page_alloc.c:4794
> alloc_pages_mpol_noprof+0x181/0x470 root/klinux/mm/mempolicy.c:2270
> alloc_pages_noprof+0x7a/0xe0 root/klinux/mm/mempolicy.c:2347
> io_mem_alloc_compound root/klinux/io_uring/io_uring.c:2848 [inline]
> io_pages_map+0xb9/0x330 root/klinux/io_uring/io_uring.c:2892
> io_allocate_scq_urings+0x231/0x300 root/klinux/io_uring/io_uring.c:3933
> io_uring_create+0x29c/0x9c0 root/klinux/io_uring/io_uring.c:4091
> io_uring_setup+0xb6/0x100 root/klinux/io_uring/io_uring.c:4203
> __do_sys_io_uring_setup root/klinux/io_uring/io_uring.c:4230 [inline]
> __se_sys_io_uring_setup root/klinux/io_uring/io_uring.c:4224 [inline]
> __x64_sys_io_uring_setup+0x66/0xe0 root/klinux/io_uring/io_uring.c:4224
> x64_sys_call+0x1816/0x1d90 root/klinux/./arch/x86/include/generated/asm/syscalls_64.h:426
> do_syscall_x64 root/klinux/arch/x86/entry/common.c:51 [inline]
> do_syscall_64+0x70/0x2a0 root/klinux/arch/x86/entry/common.c:81
> entry_SYSCALL_64_after_hwframe+0x76/0xe0
> 
> value changed: 0xdd -> 0xb6
> 
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 15 PID: 209280 Comm: syz-executor.13 Tainted: G S ------- ---- 6.6.89+ #1250
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
> 
> Found by KCSAN testing on an older kernel; the same race still exists on
> mainline.
> 
> zone_page_state_snapshot() sums the per-cpu vm_stat_diff[] deltas of all
> online CPUs with a plain load, while the allocation and free fast paths
> update the local delta through this_cpu_cmpxchg() and friends.  Those are
> inline asm, and page_alloc.o is excluded from KCSAN, so the writer is not
> instrumented and the report is of unknown origin.
> 
> The race is benign: the function already documents that the result cannot be
> exactly accurate, and every consumer is a reclaim or compaction heuristic
> that tolerates an estimate.  Annotate the read with data_race(), following
> commit af1c31acc853 ("mm/vmstat: annotate data race for
> zone->free_area[order].nr_free").
> 
> No functional change intended.
> 
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!

> ---
>  include/linux/vmstat.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
> index 5b31d8e7ae405..9df3587a29685 100644
> --- a/include/linux/vmstat.h
> +++ b/include/linux/vmstat.h
> @@ -236,9 +236,15 @@ static inline unsigned long zone_page_state_snapshot(struct zone *zone,
>  	long x = atomic_long_read(&zone->vm_stat[item]);
>  
>  #ifdef CONFIG_SMP
> +	struct per_cpu_zonestat __percpu *pzstats = zone->per_cpu_zonestats;
>  	int cpu;
> +
>  	for_each_online_cpu(cpu)
> -		x += per_cpu_ptr(zone->per_cpu_zonestats, cpu)->vm_stat_diff[item];
> +		/*
> +		 * Access to vm_stat_diff is lockless as the result is only
> +		 * an estimate. Use data_race to avoid KCSAN warning.
> +		 */
> +		x += data_race(per_cpu_ptr(pzstats, cpu)->vm_stat_diff[item]);
>  
>  	if (x < 0)
>  		x = 0;
> -- 
> 2.43.0

-- 
Michal Hocko
SUSE Labs
