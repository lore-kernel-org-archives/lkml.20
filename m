Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483841;
	b=YCV5Bz0RiLF2oNoc/5/Dh5r6xVqT2NgWlf4rcv7B9aX8jsdU9goixd+74KTmlOKP6i/T
	 5ixuPkoxEzd0UZk3oQScqxftD/jO1WAllZeYd1WNVMGLKkx+0ifsCRC0FLzZ7Gd87EMKl
	 BxbCM+zE/BM2gyVdIGqPHhM8zd7JwlrNLE4uQqrncRW8LTFPe+bvDltMwBvrDOwoexoMT
	 dXfoZU1HMd/O16GOppMjPCUIRD8ebl9JR1ce9ahbh1/xdy2YYeBPbVZ9o0sQteUIjWxPP
	 jq+pfdZq8tBZxm7f6LuHHKsUpuXrSvmI1LAAG4EjlZcWcWIILEv5E9RHrtDvB9GwGzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ha0beh8JKKzYfv/K+pKtKWX8urpG8eLvtCtoo4UumEo=;
	b=FmpwT8p6UAzDMjSLraN9ZtmHal1tcVJWAZHj2YxmYQVaKpILPZOUua5NCK0jXY5rOW3k
	 NCRFZ+lMb6PXgWwVR29ibswyXR8A1n6IcbOJ4iloRR6+X0GVmSHZDT5ST8BrOn4eKvf0w
	 OoEqjMD3Otjx3blU7Ss+oqXdC/0jyB6Yb0FxrAbzTNPVrYoWPpSJnSQr8mZBYkSIPdWx5
	 d8474kS4hPNvg1LdTy9zryWFvRgUbl5eAxLRorLCMFxGY1FS+B8NL/ZKRCv/zng79Kr5A
	 8Tho1QG4pvvRuVGNKuoby4N+oEC1yfI7NcNQHobXhdXaSUHFoHf5s7V2aLeXHc65elQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="b/lbyuG6";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A93606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A93606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=b/lbyuG6
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2391496f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794483839; x=1795088639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ha0beh8JKKzYfv/K+pKtKWX8urpG8eLvtCtoo4UumEo=;
        b=b/lbyuG6lR+6vKAU+X1Ta8UHOzjGKSfwK+61U1EPR2UmaqNEpCra4VPtvBGw/3qwaz
         W0xvX2ujFqLmT0memFTDbiydrLTLob65N/sUVxDajbYqsVL73jK9dTzbeRaCe01ty9uv
         foTMLLf06igqgikYzzNqO/5uBg3mY7ARJTuNk7QKkVNN4tSHBaymHpolRLKqh8rmRbFN
         AdmEN5ZpPgSf5G3ryL38KP5znR3lc4YQ8YNFp7w6VTp1Jp7DGYT3N2iPOkCUvlp4S+cX
         UFim998d1Anx6AFYoH4RG9LRq3IVXvMmK1qNX0YDJn8MUar9ScOLvoH6DEPDzPx4Bf/Y
         +Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483839; x=1795088639;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ha0beh8JKKzYfv/K+pKtKWX8urpG8eLvtCtoo4UumEo=;
        b=frFqd8fzdDb4JyIAPSJOkvMaijS8F6gXfC4EobPHiTXwYeliFytbuAxMxxWY718XeV
         Mho5T6+0ZZN6oTcIo3M9+I4wCLAEa6wsybSGb42LO/PzYf29aPoiSNVccou5JSMo97bI
         FpENkvw9//v4x4EuJdMtCNSF8sVsVAJElx5mushtxLoMcZrGKe7jEjEc4Ap+96+UWRVP
         WqHgZZX8eLVHa+ms1H/U+lrnBoBBglJDBAs69L4+hyFGQxzUUNLuyKx4XaTsM/bEUZw2
         fGBZ0jTmGRVU5kda8bKEV88dtqiukHCWeRwpGuiT5FfYkX3pEuIk3DYG/KNSjYaNtJM8
         XRhA==
X-Forwarded-Encrypted: i=1; AL+hErHhro1Fw+qnXqvwvlJSwI7H0ckjAfa+A+ZRxXOZz9b+1uGYmODNBCcjRm18UH4EiTKVuYFzmGdK9GlVLuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FCAf0H2lblt/PFI8Ekg0mNKs5rEJ5v0ZT8RPoGSrq4WkkvqHY
	QyvTEaC+sBSmIG45VPFxrypjx9EzM//13jOhayu20whxmWK23C2t2Km4boAeMjBF8f4=
X-Gm-Gg: AYBFou0kH+2vmMNcSRMZ8k3vawWyBEkivkaKEeXAqxppGI3RZY/Pt5e2DkwcfzaBv8P
	vwlXcGgL+QaAZpCbnh1vOs858I8DHgu+rXUXxdaULDFwDpHftrD4Yc77EvczLkDADYdlrVSnsMM
	VGqvJ8qBMidpflfvadfHcZnSQGqoR0KiZlsg5TF/r/vcbGr1ylXDDu25BgFnqUyKpwg8bRCw0P6
	4eIupzwsCz8HAbsX32s+uwAOQJ8p3cLOi+R6UCggU/y/jn6Nw9TZUT0j+L/frNLsjiszPbhDXQU
	Q6bJ5TGg/MaDRUVBZlbmdZhVf6hlB/34noCrIKgea77xrEWvgCd1pmrVXHfJV/Z6FSh/TisSMuR
	UP9qTQBmPeVbHwq7LWBZG+l9270hYU9fbNg3/GVlKButByaFYS6MMQfI9RpVwyzPOnFz9Vbo1G0
	6eRcehwVnhmkh2IvlUSUEde/F+hs26zgFwMQWbg+1BDwjO6ycOzJaI0eRP+GDlbOFwdq86u4ucN
	Zi6n6GxjxX1P+dTuRfWf5zQFuigrBDddEiDFQjZTM7FybNxrZbT66hPfrR3v5AHrHlMoDFRKv8V
	NmZ/4VFZaCYRkKoD2P1LE7O84jXHQcbtcWDztYwv9rxDdzMgl5+TyvvIMdsomcro
X-Received: by 2002:a05:6000:4a1e:b0:48e:7470:9eb9 with SMTP id ffacd0b85a97d-499c89861b0mr10174390f8f.43.1794483839022;
        Thu, 12 Nov 2026 03:43:59 -0800 (PST)
Received: from localhost (109-81-94-245.rct.o2.cz. [109.81.94.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c4e07sm15559590f8f.49.2026.11.12.03.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:43:58 -0800 (PST)
Date: Thu, 12 Nov 2026 12:43:57 +0100
From: Michal Hocko <mhocko@suse.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>, Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Usama Arif <usama.arif@linux.dev>, Kairui Song <kasong@tencent.com>,
	Balbir Singh <balbirs@nvidia.com>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, Peng Fan <peng.fan@nxp.com>,
	Josef Bacik <jbacik@fb.com>, Chris Mason <mason@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Mark Brown <broonie@kernel.org>,
	"Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH 01/13] mm/mmap: free gathered pages before MMF_OOM_SKIP
Message-ID: <avWmfXu39vtp0DM9@tiehlicka>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-1-3d2454362e8d@kernel.org>
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
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-1-3d2454362e8d@kernel.org>

On Wed 11-11-26 18:13:15, Lorenzo Stoakes (ARM) wrote:
> The OOM killer can quickly trigger again after having selected a
> victim. That victim might not have freed its memory yet, but its mm will
> be marked MMF_OOM_SKIP by this point, so the OOM killer will ignore it.
>
> This can cause the OOM killer to kill an innocent process when the first
> might have freed enough memory to relieve the memory pressure.
> 
> Fix the issue by freeing the memory before marking the mm MMF_OOM_SKIP.
> 
> Note that the task which calls mmput() might not be the victim - if it
> took a reference on the mm (e.g. ptrace), it may hold the last reference
> and release it when it calls mmput().

I do not follow the reasoning here. MMF_OOM_SKIP is called after the
address space has been unmapped either by the last mmput or the
oom_reaper (or both when they are racing). Now all your patch does is to
call tlb_flush_mmu which I suspect is to release batched pages. But why
is that needed only for the oom victim and why there was no final flush
in unmap_vmas?

> diff --git a/mm/mmap.c b/mm/mmap.c
> index 7618e72766a5..4cb18b217048 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1313,11 +1313,18 @@ void exit_mmap(struct mm_struct *mm)
>  	/* update_hiwater_rss(mm) here? but nobody should be looking */
>  	/* Use ULONG_MAX here to ensure all VMAs in the mm are unmapped */
>  	unmap_vmas(&tlb, &unmap);
> +
> +	/*
> +	 * Free the memory before marking MMF_OOM_SKIP so a re-triggered OOM
> +	 * killer will only skip this mm if it's already freed all it can.
> +	 */
> +	if (mm_is_oom_victim(mm))
> +		tlb_flush_mmu(&tlb);
>  	mmap_read_unlock(mm);
>  
>  	/*
>  	 * Set MMF_OOM_SKIP to hide this task from the oom killer/reaper
> -	 * because the memory has been already freed.
> +	 * because the memory has been already unmapped.
>  	 */
>  	mm_flags_set(MMF_OOM_SKIP, mm);
>  	mmap_write_lock(mm);

-- 
Michal Hocko
SUSE Labs
