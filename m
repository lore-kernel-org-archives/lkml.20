Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485816;
	b=cV9t0mUzR43KSJ3p2So/3+G2OKOiumHggIHo4A1nSpuOIo3RYgJgiZvuzXijXw5JHnI7
	 Af8u0U4ppKiN0+6bYtiGQm6PE4lRJtJXnHbs8GJ1zv8ht+llholtfenqI/CEo3WbgzqGw
	 3mWrBxzkMLXeVHRhj+SHZ3WGhuUIAu1i/7L3LKr817FUxAosHvsND7GcE4Guj/ZZNk1Bi
	 MTQK4RWEnigi/+iaCJxn3uZipG3Q0C5wu4C2sVuZv7MPjB2mpTFIhvih5Tl9jMMEqf0Wj
	 y2sJCvj1qR4IOQ+GYApXfO0/n9Td25P0mKr5hzRoV2v3iEKxG8NPzTPwS+KD4REWFeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fkghkLc+UM+Ih/ovzmI/ipH5f/tVvmlQK1TTNKFCOPA=;
	b=RjoymWf4sUR2THwCRgkhrMe5pQjTKOSTr0XHOgdok1MQcf5/yqMpyUcjgZRpTkBvm3JN
	 WzJVZzrdGUqhtO8YYSyR5zhoU+jd5s7vKhJoIqqyv+d8U5kz4kO1LheZkGfqnfDzMVhd8
	 1kYJFP3/jSAeZ1z4PYz2LJyulw+ya2wlAXHZ5UGYh/rYgTPpVupjHJs9bw6MMMf9q63V+
	 RfkS4H0fEnZjyAt4ZMuA1KecQMfC2PtlidACjneFY9oqZp/igSd2IAc1cI8PvgNoXs7wB
	 cmC4f/Xr1ogEmMS7Jy9up9a8Op9A938epME20NbxilnCYfiC8tmoRvtSSQ4w34ENkhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ts/cjWzl";
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB78B606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB78B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ts/cjWzl
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c40f29667e6so629652966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794485814; x=1795090614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fkghkLc+UM+Ih/ovzmI/ipH5f/tVvmlQK1TTNKFCOPA=;
        b=ts/cjWzlrAw7OVLBUOIKgZpVdV7kRCggPRRQvRvK3ob88hBdtgDIfVh8WAEFyn/77E
         oaCfu9v0N4vPrrHq8J34loLHqhfrjaksB7PdedglyvM8clsKLtRVbdfJtwSDBEbs5mC4
         gkrJr+qUvrAY4b+C0zoHWKn6qEOAXMv/XPAsgBVAvGUPlgkEDna+m9sUmSBm+VF248iu
         iERfLAuwDYPRqf5xzWJL0SYBD8ZRn0RNyVxgxzXdCZ2z0vGuZ2irrLqyWnfGa7sANdxS
         X5xFac8Tu+TZQD4fSxT0MF6WLu6C7O1QP2guETy389GQEN/CXZbKhmNEQzxh28H0jB+S
         c2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485814; x=1795090614;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkghkLc+UM+Ih/ovzmI/ipH5f/tVvmlQK1TTNKFCOPA=;
        b=gL4G8EoqEnqXECLTHb5MjNVkIIImpWLdkAqJxp7VCKN3SsuS6ZbyANK1+x9GgrgCOC
         BysYlhK4alse6CuiAToydt83842+Fwl5CoEzpMcJlQ24eljC4UGEzI7phlmUNLqxrlIO
         FUQQphgq6I6EcpEO9HuEP2j9yc/Sj1vFTsxWikdEMQj0WWkXPXdsIH2iZAFaN9EyhhI5
         3caFUsdfLxhE506pIB5MJjC7trg8iOSmwCNxR3pV3LLQmmWZwwc0gV1AhvX7d7+XXAWg
         ECj8YmTlu5KR2Ha+v1raQgXkcCYWJFCs+yVA24+4Venuesx7R86Co9wLjltzyQiGYqLN
         irUg==
X-Forwarded-Encrypted: i=1; AL+hErGmyutoRO3jAsRA6nfvUMVMBNsybqr/YBv/l8+wbBMRBh6Eg1CGhJF/TtRJTXEALP8H9gEzbUovRRqU/L8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jzvMwJpviqjP/ircvi1Zcb1X1HAwGczzlFzJ8oCbe1E9O9jWF
	ATyezs9ktdLGETY8STanlz4YGy0Wf01gHKU2fL+UJtAi0aIksrdH2dGm
X-Gm-Gg: AYBFou0GDu9XOcoIBm1bZOc9hcnK5MZumMRlsC4XqYRsUKHmMjj7Nr0peu4iWHL4ydm
	oC3JpNypf0Q77Ark9Lel2hRJGJz10/eD3tQnn/Y/bKGkwr2RueChyCoFrZfnDY5Rwc8oAC649De
	/CbAAdaFv6sAnTlAAZZ9F/czsjweOco8/0r+BYH/i95Jf0RmSPgZ/tcCAt/bU5jxh2xAh6e9v2j
	8MSSeP54xuPQ/RJ/OLubAcdIReq+NGiLzVqPNsql7tFUJu1LbmCDLQnE1fSSgIF7tAy0aTjb2JG
	Ht7lV2fOJ4lRfqfYI9IbYe7yFINA9AMzH4opZXe/ZiMd9R2viCbymSNe7igEcPhyE0FirhfTWOz
	hRZ70nto5UevsXxmhtEtDs+h3TMbqln8VqqBCG3Vc8cnV0u6cBOEXr6hhun6sBrxkX4qbg/D9Ud
	6v/YwszLB4+/ehfUt5E0Gc8ltFwEqghDCSs18YPiLnaO0dKjRch+BxFfNzHs4p7FxGSW0Z2JsIl
	+b/x9qMzHPTZOQ775LsJR/FvidxQzPWfVjDr3eOnkhLpLwg5GYkwTPV7hEDy3B8d7uU5A==
X-Received: by 2002:a17:907:3d0a:b0:c42:4750:8d33 with SMTP id a640c23a62f3a-c5066b46008mr455415066b.28.1794485814178;
        Thu, 12 Nov 2026 04:16:54 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a618abesm330293966b.50.2026.11.12.04.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:16:53 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 12 Nov 2026 13:16:50 +0100
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v4 6/9] mm/vmalloc: only flush the cache after the vmap
 succeeded
Message-ID: <avWuMhLKno4LXNe-@milan>
References: <20261110112546.261415-1-hao.ge@linux.dev>
 <20261110112546.261415-7-hao.ge@linux.dev>
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
In-Reply-To: <20261110112546.261415-7-hao.ge@linux.dev>

On Tue, Nov 10, 2026 at 07:25:43PM +0800, Hao Ge wrote:
> vmap_page_range() and __vmap_pages_range() call flush_cache_vmap()
> before they even look at the error code. A failed mapping is never
> used, so the flush is pointless at best.
> 
> According to the Sashiko review it is worse than pointless on UML:
> flush_cache_vmap() there is flush_tlb_kernel_range(), which syncs the
> PTEs into the host OS. Flushing a half-installed mapping therefore
> leaves host mappings behind for a range that was just freed again.
> 
> Only flush when the mapping, and for vmap_page_range() also the KMSAN
> metadata, is fully set up.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 0565cbfe325c..3f98056f8c7e 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -369,10 +369,12 @@ int vmap_page_range(unsigned long addr, unsigned long end,
>  
>  	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
>  				 ioremap_max_page_shift);
> -	flush_cache_vmap(addr, end);
>  	if (!err)
>  		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
>  					       ioremap_max_page_shift);
> +	if (!err)
> +		flush_cache_vmap(addr, end);
> +
>  	return err;
>  }
>  
> @@ -758,7 +760,9 @@ static int __vmap_pages_range(unsigned long addr, unsigned long end,
>  	int err;
>  
>  	err = vmap_pages_range_noflush(addr, end, prot, pages, page_shift, gfp_mask);
> -	flush_cache_vmap(addr, end);
> +	if (!err)
> +		flush_cache_vmap(addr, end);
> +
>  	return err;
>  }
>  
> -- 
> 2.25.1
> 
Like Suren noted, vmap_pages_range_batched() should be fixed also.

--
Uladzislau Rezki
