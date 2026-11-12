Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496613;
	b=BgCafXDR5ema01GG4Bnzr5vGBfCQDLxqZAaYxQaapW2yv4WfnN2laRrdbHKLcH9huky7
	 7ThGjzvnWx+vbQqP8QXW3VexpdL3+4HxeU9s9nBF2sF9eAZ+B+4/fOC8AT3al+att7WQR
	 syr3TjjnhszA6SAQ0ywLfGOd7kKiDtKmXPKTZZ5KqCuOc/E5GUYZtG7Zf6l1+RjwIozeq
	 nGyWirOp0jOTJMm4IlmwKgp4/36I9HctLjjY4/RYdoSkyL/qfb25WLRCBPtjHR6gFI/dd
	 wRZYwAbxUE35WdeiPQ/p+sftsXB31AhQw74RjBTJm07ve8LjB1OD7u+cPqVZyb/BoFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Gvq7UynjcI04qxrVBFRcfaa2pXFRPHXVoB6KooUQP78=;
	b=b5mMi4QPiewiN9ynAydwcHVPkrzhqDLNWMMhoOqF/IKSvhoClmcpE1pkKQk9pT837/uc
	 h6e3CxRReJUUHunEUT9Ws+iY6b0HHTYD0DdIcC2QDG2GAUm2Pc/FYK0lUUOhVzldT5Bu0
	 Lui4Qr9i7Roqr0A3n4+6fJg6TlE2YLUG4OQv6u6LMwBQl3ITAFvL8evQWrOAN8WodJILh
	 PZBFaMIxDeN706SqRgkk0WtLNj9GfngEF6FXXRmZ1C7LhxD/gCozfzTOg+IC1Sgz9a81L
	 OzBhtWRNqxi4J6X7E8yDepKG062uSofUFiPaCCwM4ey9rh0XjjF63eZiwvCwVziFiTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=msvZzu6F;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB74606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CB74606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=msvZzu6F
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b3b31a6290so13023607b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1794496611; x=1795101411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gvq7UynjcI04qxrVBFRcfaa2pXFRPHXVoB6KooUQP78=;
        b=msvZzu6FzYqfWJzVFeAFBYFY0TitTGby6fC79iEB8Q7aKYLrv5XusICDgqvy6q32wM
         mIpoJ7XKBk7NjVeeh/lEOa4IKynBRk/Q/+ICHaeHHHce0HAGNxBGuGBFnmXh3xHWaljj
         0/ltgzyTNYpXkJB/5zhuULG7SX+AZSf7boNMmde7zGd1OtSDUgxsroxqJLDpwvJjMnEA
         YtpHAitFavPa9LFigtUsn4cAIds+zZx3DGj0c60Ide9D51YcedlSIbfOWtwYY7LcmINK
         zGx5bTetGoLgOYBVu3vCG/0GEhkupKcVqq5tGUv9xzGPHjLz+PFOL3GoMpCTmc1/RPNA
         FiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496611; x=1795101411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gvq7UynjcI04qxrVBFRcfaa2pXFRPHXVoB6KooUQP78=;
        b=zjQtDOp6WA70VZQV93pITQsUuXQDG2Kcfd8KSuBxSLIkpFDI5Ui6xOlm8yFQEsJ6wr
         RyTQJcD/PRCJ2kiXYzcHzCCm76bOyfr1eRkWChUSQTGF7AmAVlz1blknSX+tIUnTjv5K
         6S2gaKxu2EM6O/0x79QkExU9hzzpr+AEkH//k7nHZ177kHTefr2QtVhbWJWXr4k3RB71
         G0Fg7CIfdOsDz1Vr+AAikaMWueSAYioNyWj5FSxsoZf2FUoho1cFpU6WSBMb2yboy0s+
         FB8rVcz9AmXbEKbC1Fg3sT1hEybBwjLmcDlP0k6XBIDSuTJNz86tczp+fTx8OdYdJ5zb
         srSA==
X-Forwarded-Encrypted: i=1; AL+hErE7RLR1n9hgIO08+fcvlYMZdKl41wFjA+ELxtAkpprIC1nagqy1W6EBmGBul8bB2NoY2L3JaJz4fdpRAVk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MH7sHEvws+9+XzG5FrFFTTYLw+pOyxA4VP+guFKZbfZMlcd0t
	5bH6TFKDaauexbC8Xg9NbTMtDI81/OVBgI1NFgYCPPDhnqeD77GOboZOp3aAx6Iqknk=
X-Gm-Gg: AYBFou2X9DY55Def5NCDBhwB0pHQnqLAD19CJ+1fvN2jOd5XbqHPV3OXPxO7iw/NKos
	3a28jXmFye9z6SExwtUtQSX0obSqNxSr1VuibPudt8Cea99ggidaaLnHKOHa2UiBHIg9Wv8JRkQ
	H+bXYlnN2G2AyxCHuxxrA8qthwHiSgm9/0u2Z3UdqF83w1+78LsX0vuPJweMYU16eYus/Ot4KaH
	34iTLyHhTeJsyow+4Wif+C+oz716KXpuvz7Bgue1klpl0tGl6i6qxYi7Ym2j1ywSwnvPW1MDK3O
	kOS27c5TlLkS+bYjK+6xBh7IhvKQovT7lwo4S5S/V4uXS5CSxHX0NSbaAWcwFgs1PTuD51HD0qu
	rhQFwGnHyBZBxLNdpA8tShcMQbQKVOUxeuUiAnYOeAAEbKurycTT37Y/IpAHdR2ULo2noMGmahM
	Lf6yAaP/s8gdpVH7jEGec9WrzP+xVEFLmo9FYqeDPyCmOf90WYq8yFM7ufp43o+Dshp7svV+Iwd
	5FgxO/9avoUAZtQQjhMp9B9y2y7Et6yp6MPHn/IaBGgztpI5UoRFFP61SezVw6WxZ9ej4JCdvSL
	uS4ULhOYGE6BbFo5o3Svw8LjZ5qx
X-Received: by 2002:a05:690c:4d0a:b0:8b3:37e3:7515 with SMTP id 00721157ae682-8b3a81a539amr35260977b3.67.1794496610737;
        Thu, 12 Nov 2026 07:16:50 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933c5a00sm72450787b3.16.2026.11.12.07.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:16:47 -0800 (PST)
Date: Thu, 12 Nov 2026 10:16:46 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Dave Chinner <david@fromorbit.com>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>,
	Meta kernel team <kernel-team@meta.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Chris Mason <mason@kernel.org>
Subject: Re: [PATCH v2] mm: list_lru: fix NULL deref when a folio moves to
 the root memcg
Message-ID: <avXYXjSJNOFa5K88@cmpxchg.org>
References: <20261112061231.2469026-1-shakeel.butt@linux.dev>
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
In-Reply-To: <20261112061231.2469026-1-shakeel.butt@linux.dev>

On Wed, Nov 11, 2026 at 10:12:31PM -0800, Shakeel Butt wrote:
> folio_memcg_list_lru_alloc() makes sure that a folio's memcg has its
> own lists in a list_lru, such as the THP deferred split queue. It looks
> up the folio's memcg twice: a fast path under RCU checks if the lists
> exist, and a slow path takes a reference and allocates them. The fast
> path returns early for the root memcg, which uses the global lists.
> The slow path does not check for the root.
> 
> The memcg can change between the two lookups: when a cgroup is
> removed, its folios are moved to the parent memcg. If the folio is
> moved up to the root in between, the slow path gets the root, and
> __memcg_list_lru_alloc() dereferences the root's parent, which is NULL.
> 
> Users see a NULL pointer dereference oops while a THP is allocated,
> such as in a page fault, in khugepaged or at swap-in. tmpfs huge pages
> are affected too, and for them the oops can also happen in reclaim,
> for example in kswapd. The task that hits the oops is killed, or the
> machine panics if panic_on_oops is set.
> 
> The race is narrow: the folio has to be moved up to the root right
> between the two lookups. For example, its cgroup is directly below the
> root and is removed, or has its memory controller disabled, at that
> moment.
> 
> Fix it by checking memcg_list_lru_allocated() again in the slow path,
> like the fast path does. It returns true for the root, which needs no
> lists of its own.
> 
> Fixes: ae64f07a6a40 ("mm: list_lru: introduce folio_memcg_list_lru_alloc()")
> Reported-by: Chris Mason <mason@kernel.org>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
