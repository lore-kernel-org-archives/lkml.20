Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854012;
	b=YQF4vfpYDIt9j68pUZpeB/j0Xua1qd1z7YtGebzNphyJlHz0pbI2uYKAwhIUIhm5W5pC
	 0ZhHWP74YpzKvf//Q8EkmWPB/xMQJf+wg0F20/PgBICO2Zi3zncKbHvuMnuHCKuecmozC
	 FIOxsHBpfO3n9d3JOupALMX7X1rcmSLXTP55O1X+hi/O5Xz3BwJIcMwa7p9jE+mqVOZnH
	 FaAPr8I1feWSAyYsW9SS5VcbmZmpBUfEecwqIwjv051RjjRrPmquKoG7ml64si+qY8fzP
	 eki6+aQjEBy+9PT4dC3KD5zdGE4BRGa1diJ3HyL6jSpWEmCt325JVMEKC8BrBIe1Jfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Zf1hqnxgUUaXyC+52Twk933Fjs/9VQ8uLC08DreXCRw=;
	b=01fpEvdw6tTDXUOopEvN6VQht/fPc5x3FucNWGuKtA4XZlARkW1nc+w7E3R9C4IbzahX
	 VD7xamZe5+B7b7a5bTaZdb9rCJZVsiopF0+Tg57lrLm8+XhCGt5oDsM6s6vQXB9XLAkw2
	 57fcxV2bVWw7413j/htRBnql/Us85Y4FGPnzNfxVCsWmVSIUP0LzAzRGgq8lGMiq3+S0H
	 ynYTUMW8dnQl3TQrKUCpK/dPk89ahqvq9q9vwEUtAcyVnkfVdDi8S/XVYT/BkPYMgM7/L
	 c7igYU22BBvkuCmGZblCIVK3G3qftG+OYAaaXObj6K50A2ZlKQJ81X3BIVbFP1jl7Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQww79+A;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA80606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECA80606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQww79+A
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-847ac7ccd85so2984583a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854011; x=1795458811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zf1hqnxgUUaXyC+52Twk933Fjs/9VQ8uLC08DreXCRw=;
        b=UQww79+AcALvW1dj0W1OsDNLiDRMYe7F+ykqbHn2PY7/l3tGkUNBQWVfd35Ox2NVoK
         hWcV/85omatpF2td6QBVB7vUyo4uxKJgrfKM71P7WRdKkdQMrkSK7g9FUNXkowQ29JPu
         m7H3nvf8Amp1vXNCuud1FhHbSJmhR8d4NWL0zVdoe5UiDc43BfXpMCS3Eh6J4rBCFa7H
         naFM+9+myGA2Oy/0s/CfHOJstRK/a7Uz2tsELjLpmcMCtgcqMGFRbYo7WRzT4dQLl/i5
         pW70+bDTLaYrc5KJPzDaIEX0kydgCdPyirGE114SSgYONnh2D8wnDv2tcTEGIiFNZNLO
         R+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854011; x=1795458811;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zf1hqnxgUUaXyC+52Twk933Fjs/9VQ8uLC08DreXCRw=;
        b=CEr+fxglwaBVNTAPp7vhWiBSpkE+JBIPyMCA8B94ZnvG+lh052JKQJmrb9OOEwTbal
         Ie7hjpu+0m1e/Df3OZrEXYeSrv9zpPbTe5aiS1rlkCGu47Z5MwGTD2muIQ6TT/nhvcDT
         m7KcAQqoYAqMlJzX87ddpL64PKwlveStscwDdGueJauoTRFH585Do0XiRi+PI9za+igb
         +cxlr+zkPO9+4WNT4J7ewVjlQj+FD5ldazvhOaVpk1wEwRDMOgcLCPLel2i5RTjqXWue
         rm9VCYwNI4XR37Q+QUvk1M0NvZpZSPbijLpLorl8pnnwkan9So/Fzx/OlLmw2stn88Zw
         HZ6g==
X-Forwarded-Encrypted: i=1; AL+hErHXgz5w6dpJid2eVt6zMLjVRESvvqenMpYhkoGh3GmAmR4fCmpIUtXfyvoNfGztndvqAIBI8soMSxC8xUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z86KoZDYFUo8WxJQ0Nn38CgPBQCpPaD25x2NZ6B9DZH4L5O0mBc
	vFPdBza7fOGwfx/W1yA3y7MDuJBeY1eHNjyjy6iE3Wu4OnwG2o6r62Z5
X-Gm-Gg: AYBFou0SuRafGDH0tq/Q21TdehkKMsq47mdt586WvuDjkoAuBrs3mozXc0kVU6HyFlB
	DBrEpBN3HnVu0uh6Okwcg26gqc8DvYeJsh+CFyE0c/9pCPEEDaT6GkU9eEnHNCGG9hpg+kxwAUd
	n53zLorUfiDt2NVSSlhul90P3TzEakX7Vs+Qz5mr9AJhwksPLnRLjb2of/firPZ/DoaMistPn1l
	Bcp4SK2YJqKrchphwMZ86q+oi6JcyQhDB9HcfQUxel9zozFYuB7yvRR0N5vwhBfQ+7ib98lM79w
	EFqeMxCfkVz02MG+sp28t5Xh3im8RRGpFpxibvB5aKNus9eE6N9WxItirDTV6lVaWqfV01Rfvtc
	dc+x6/RPEGmNjJWKlpEjYBrVaNqNnImFav1biVX+vbESha+kFomoLKNaEg/FREV75jyciGrQMRa
	6v97rlujVtlHXQHnOAojkNKQqEKDIJBESnguvpemPKyNkrwgtWvPGi5MiAB/0ub3kj3uxME/CAo
	UQC4v98O3Lvu34VAiYcbB/cBSnK+LVuqoax9fZ86cMyFJVp3MZ5lICEjHueze+nAmxgSJJwOgL5
	DWHzlDjp2h4PHZwi92jHXbDHWPmNqIv/zSgtui53FjpJfpMhHT5oYxdjB+hL
X-Received: by 2002:a05:6830:640e:b0:862:c685:84bf with SMTP id 46e09a7af769-862c685924amr3847900a34.4.1794854010849;
        Mon, 16 Nov 2026 10:33:30 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:42::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862ae607cf4sm6939137a34.18.2026.11.16.10.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:33:30 -0800 (PST)
Date: Mon, 16 Nov 2026 10:33:29 -0800
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, apopple@nvidia.com, 
	byungchul@sk.com, david@kernel.org, gourry@gourry.net, jannh@google.com, 
	liam@infradead.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, matthew.brost@intel.com, mhocko@suse.com, 
	pfalcato@suse.de, rppt@kernel.org, surenb@google.com, vbabka@kernel.org, 
	ying.huang@linux.alibaba.com, ziy@nvidia.com, kas@kernel.org, hannes@cmpxchg.org, 
	riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com, 
	baolin.wang@linux.alibaba.com, Nico Pache <nico.pache@linux.dev>, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] mm: don't PTE-batch a swap-in of a folio with a
 hardware-poisoned page
Message-ID: <avtMXFH75SJFpQjZ@devbig011.atn3.facebook.com>
Mail-Followup-To: Usama Arif <usama.arif@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, apopple@nvidia.com, byungchul@sk.com, david@kernel.org, 
	gourry@gourry.net, jannh@google.com, liam@infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	matthew.brost@intel.com, mhocko@suse.com, pfalcato@suse.de, rppt@kernel.org, 
	surenb@google.com, vbabka@kernel.org, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	kas@kernel.org, hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, 
	kernel-team@meta.com, baolin.wang@linux.alibaba.com, Nico Pache <nico.pache@linux.dev>, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
	stable@vger.kernel.org
References: <20261116063624.1382944-1-usama.arif@linux.dev>
 <20261116063624.1382944-3-usama.arif@linux.dev>
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
In-Reply-To: <20261116063624.1382944-3-usama.arif@linux.dev>

On Sun, Nov 15, 2026 at 10:34:56PM -0800, Usama Arif wrote:
> do_swap_page() checks PageHWPoison() on the faulting page, but the
> large-folio batching path then maps the rest of the folio without
> looking at its other pages. A poisoned page that is not the one being
> faulted gets mapped anyway, and the fault that would have reported it
> never happens.
> 
> Skip batching for such an anon folio and let each page take its own
> fault, where the existing check catches it. do_set_pmd() already backs
> off the same way.
> 
> Leave a freshly read folio alone: it is not anon yet and can only be
> mapped as a whole, and falling back would free it with the poisoned
> page still in it, which the retried fault can then get back from the
> page allocator.

LGTM!

Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> Fixes: 508758960b8d ("mm: swap: entirely map large folios found in swapcache")
> Cc: stable@vger.kernel.org
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  mm/memory.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index d477a4f986bc8..51e72fb40655f 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5158,6 +5158,11 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  		    swap_pte_batch(folio_ptep, nr, folio_pte) != nr)
>  			goto check_folio;
>  
> +		/* A poisoned page in the folio must take its own fault. */
> +		if (folio_test_anon(folio) &&
> +		    folio_contain_hwpoisoned_page(folio))
> +			goto check_folio;
> +
>  		page_idx = idx;
>  		address = folio_start;
>  		ptep = folio_ptep;
> -- 
> 2.53.1-Meta
> 
