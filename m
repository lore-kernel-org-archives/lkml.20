Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501459;
	b=S+dmb+OA9p/1pSDbJIyQTgsS5MuKGE1NEd22MYy/64QPVITdoiZSRmRtyiTDiJdVxbQs
	 zF4Eok9/uSAA3atmdxT5iOyicVHaR5OU6EmfCylLwjx23EagDe300Gg7zuCPpQPBsOiRf
	 Gc8Ie/hzoEvDIE6vKQAF+YKgc3bwwc6Epg3OZghbSE/kj+Gt+xte16dXmCG1629gMtzDq
	 Sh4cT3/QTN3XAIptFqNHiNLEc2LFFCsliGlrxrSXUzQYUv/t3frmlBFDzkUnW3qciImCk
	 XXT39TLcnKMr6V8uvlrHk5PcmBDCeSTPOKpp3KgOwDtBzfG2a0wvycxq/9bzvizOW+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NR5Eep1LUhJlSTDXQHVSks9fTKnm7uJPdvevn9dGzuo=;
	b=ty5sWbr93NKTkZsDMXK+JLvZED3UmWaWGarDT0mqdFAWVjJg4rjuMxVnTdVFlArqsYjQ
	 UR3eiilhwcKRq2urKIJh7uMEVbxt0bAIaFJUuGO360POgg+JGKybc8k87sA2RWCZCVZFD
	 rq2lVktlbhTBpmZTQEM5ZU1eCDNQCw+FuFbZuzKmkg8CYaeX0RG5IGUUL7xBVZ+QKEG5j
	 UoIE/5HiKAUXuY2vuUw3DphUUfE0bFBGmT8cZhrqNkCQBxYpDZ4ehmAdAApQM0gRDbG2O
	 +VLVjcFnsD6JmH6wxosWA7sEMk6MZuj9M0EP4X5XVFS1ID6dXMaVLf0t3wOwYoxf3dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b="H8U/ip7W";
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB89F606A897
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB89F606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=H8U/ip7W
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b37c7d767aso496247b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1794501457; x=1795106257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NR5Eep1LUhJlSTDXQHVSks9fTKnm7uJPdvevn9dGzuo=;
        b=H8U/ip7WEvqbqQ3o0UpL9vP/NolWnMCbKtK/4K73O8hRgZCwVrYCwi5Ojy45bfBubG
         03sYOQox/XUYYYSiQLws3JxXMGtk4GrlDAnqRLwPiIAvARHYPmGAMscaTTMmee1w1Abf
         TKBAkTUpXBzLcQi0O03ahXhbWDneMS3zqvrrLc1/x9McGgewWyCDsyxbXht3IeBVCORZ
         7UAK+c2sWtU1KV/cQiIlq7F2gqQo4GD3t/2QBxNwoLzhiyfJ4k8d967ZjDwgPWJCy5i3
         HyLk9NGInDjXn64urZdq6cHGGcuUfpw0iC9Zm/m2xcmUFtduwoLx9/5EEm7jv739ep6N
         aKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501457; x=1795106257;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NR5Eep1LUhJlSTDXQHVSks9fTKnm7uJPdvevn9dGzuo=;
        b=iFtiKMg7JNjP8x82Mk/sL27SH8P8Nv7duZxOPawNaR+UTZHMTR3r2Mr+CCq8W1PRla
         dPAJWzMXXhZdI+/rIjs7Tcao66sDAMX7DCEuypOi6lVQdWtOc5pZBt36ScmUm1zpfo9w
         xAEGj24o6Os7aDRktx1u5G8J3TuBA8epiRe5rWqPi5nYGegSzDXuo9cSJBnVeSI8h2uy
         NS2/MF4RI/uQkDtQavtK/taDWAoEF2llrFwam6+U0kZhJmOeGksokoiLCM568/HmIGMs
         uw1B5c9Ng3CfGVKqo6NANZWhOml6JncvNKyRQNmta0o7yhh/lf1jpWDf65FkKdraKNFF
         Jn0A==
X-Forwarded-Encrypted: i=1; AL+hErFTf2d5rdab29Oz8LWa11Ze32zFay0U0PPK8QEk0pwehmAIRWJ0g98f6CZl0ckYiCP1MpOuHjuW1smVnnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7hNh+LnpNqAnG+X2iMh0fZqBnfzyETn9wDTLT9BNFX/SxwM49
	swXC2K/MLXhkoQPxAMnCOrfYmbVql/DGweS52oBmuA+4Bm1Zan4zgoqa+d9UyAE+AIQ=
X-Gm-Gg: AYBFou3q1GWXIwxJtcQjC1+8brvdItJDYO2lfxkUkdaGeYMlMOq8S954BP8BsYd0oCp
	8XdGfHvrTMV+R+mbbl41fTK4tvY3RMkxzdc/qF03iP5hpADdggaN9DtmcCxrrQrAfaR+3YAj9JN
	g2qb6KKTPnOdUqoUQ1o31BQQYfhUAamFA8ZhPibLMuMe5Z4rEvUFBBAPcJ0o0ddjyBw2TMKGLEo
	WO4QvsBncE//ypBRQ4JKghd5QIVo9WOZEcanY5Xk39oyDU2QNBfM9OCm+Ozou47jt8mdYL908we
	nIwslZDd5DEP7NsA3ZD8MA9u0koLqBpLN4Qddh3POFRVqYWhzGfImixlunG9m8FwLWjhJkirilN
	rbgT5QBeosMGvhBWxa+tOQYXLZTCtRy40K3Flep94dmOpSyaFyZgUH5XmZCS/ehyPg3Fv4IH7iu
	rGNBMb8qyahUGmElSp7G1rHske6PSrAtGW6X5opyi8gi5nqRVIUPIkSLd8Z43851RDURDP3wm9T
	Cr9DEuV70ejxLENsk8njoNqLKO8Bl/qXFlJVZNEdVZw1AooCwSzyyLVaOEeW80E/+odN7zerp/O
	47q6FLPQbZQEcAe8eHdGTBxERFfC
X-Received: by 2002:a05:690c:c50d:b0:8a9:e801:231c with SMTP id 00721157ae682-8b4aa23ff6dmr726747b3.20.1794501457648;
        Thu, 12 Nov 2026 08:37:37 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39340e374sm73746277b3.28.2026.11.12.08.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:37:35 -0800 (PST)
Date: Thu, 12 Nov 2026 11:37:31 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Gregory Price <gourry@gourry.net>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2] mm/page_alloc: only skip kswapd nodes below their
 kswapd watermark
Message-ID: <avXrS168bjq0Ilgy@cmpxchg.org>
References: <20261110224432.2347606-1-joshua.hahnjy@gmail.com>
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
In-Reply-To: <20261110224432.2347606-1-joshua.hahnjy@gmail.com>

On Tue, Nov 10, 2026 at 02:44:31PM -0800, Joshua Hahn wrote:
> Commit 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to
> NUMA restrictions") makes get_page_from_freelist() skip any node with an
> active kswapd on the first pass through the zonelist, so unrestricted
> allocations don't immediately consume the memory kswapd is freeing.
> 
> But kswapd is also woken for high-order requests. With THP defrag set to
> defer, each THP fault that fails on a fragmented node wakes kswapd at
> PMD order. kswapd reclaims a batch, wakes kcompactd, and sleeps until
> the next failed fault, so it stays awake much of the time even on a node
> with plenty of free order-0 memory. This means those order-0 allocations
> get directed elsewhere.
> 
> This was observed on some Meta production workloads running on 2-NUMA
> systems, where processes with a preference for node0 allocations
> continuously allocated order-0 pages on node1, despite node0 having
> hundreds of GB of free memory.
> 
> Only skip a zone with an active kswapd if it is also below kswapd's
> target watermark.
> 
> On a 2-NUMA VM with a 60G node0 and a 20G node1, with THP enabled=always
> and defrag=defer, I ran a process that prefers allocating on node0.
> With a fragmented node0:
> - Before the patch, 68% of pages were served from node0
> - After the patch, 100% of pages were served from node0
> 
> One remaining gap is that since this uses kswapd's own threshold,
> unrestricted allocations can take what kswapd frees above the target
> watermark. The current code already lets such allocations drain from the
> high to the low watermark while kswapd sleeps.
> 
> One potential solution, as hinted by Johannes in the discussion from the
> original fix [1] is to add some kind of fudge factor (for instance,
> wmark_pages + high_wmark_pages - low_wmark_pages).
> 
> But in tests that I ran in a VM where the allocation demand outpaces
> kswapd, about 4% more pages landed on the busy node and kswapd reclaimed
> about 15% more, but kswapd still finished and slept. So let's hold off
> on the fudge factor until it becomes an observable issue in workloads.
> 
> [1] https://lore.kernel.org/linux-mm/20251001164131.GB1597553@cmpxchg.org/
> 
> Fixes: 19c5fb83f2a4 ("mm: page_alloc: avoid kswapd thrashing due to NUMA restrictions")
> Suggested-by: Daniel Hodges <hodgesd@meta.com>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

This makes sense to me. I agree with Gregory on changelog brevity, but
the fix looks good.

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
