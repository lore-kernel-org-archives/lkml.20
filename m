Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564578;
	b=iHZAotweye9ocybndZ4nKc3efqWEuWzvuJ2IL6R4JZ+WuXE9G4bOtjIxIVmlNHq9M6dm
	 dse7jRosMoB2tr6dDuXLhfC8zlBil1/qG/MVV1Ji4ptexPlK6UTUp4dOmJDqgcIGl2D4N
	 H99crHmFAZwvbYCt51v9byh/TvEyq2kCmsW0n2vzYS4sLaoaHok/lqafQ4XDS0uakPEIi
	 27MM+aUVynF+lZk5whKH3N7kQ5fBxc8KDOdF7ArHy3Q+DuE/CPkqjZU2B5isfI8oFQ76J
	 +zyPN3SDtE4IYUvzpc8q7WwsMr4YOkQ2sV0RdUnkm2/YU3QLxGzCJka8QKqvxrHTnfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	bh=9AqbH8327lnwvg1LioWgbD9Tcq5AbImAQbsNTXyY7Tg=;
	b=1zaSUTsVUYSowKWj53PTp6kX5a8Vm31ttf6z2M9baNAscXAABnzF9661gOuew09CvyEj
	 H5GGItwbmVFBFdrLMu/0kaJi/jeLEPexMd3SOHKI8oLmJ06aDWBPc0u/ta4Lrc7gJXISn
	 piuwNPX5EHONPo1tyPgaTEJUz1aeJx0+Y5xGPj+VP5yGXPCo8Sru+gDX2HUhSf0wCNRwK
	 pN8ZafUy8hSkDa6umanzcD5Y0Avc6zj8K3ysJeYHThUUvMpK9Tci2WTsYiin6HrA+RR+F
	 Pc/SvFw7zwfgw7I0UeXnf0aa3Wip5z/6d6FZM6z2eDUWz8qtJ2/BEviJfra32Wfsx3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GeeQQaCR;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451F7606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 451F7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GeeQQaCR
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so41805ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793564577; x=1794169377; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9AqbH8327lnwvg1LioWgbD9Tcq5AbImAQbsNTXyY7Tg=;
        b=GeeQQaCRmLy8yNLKiifOCH4ov7tMuAcRthbGGMl6HsrHBEg4wO3fC88DreSMXVrQZq
         1VEfVYGgcwp+JtyUQ9vjL3DEHjfcdByEBh+d/0ushYJSN7U1kIk4p3TOmXiWWxfEveH8
         cNJ7wnpVlxnw5lSd0mw8yquVnhuuveJaB4sBD4h/egBXJxPHKuxInkAyLJcGO1eIGGfG
         2N/1lXLq/cEvLDAjiCOpTpHXDA/a0MkkvTo3CbIdnHiPeG4RHS34vESEenY0AraMKoiN
         GGQ+TDoPq92Ak0sc/af9IAZkigJnjF5mWBPb1pW/7ci0JiOSlwfxlVWKjO447wpuWU8K
         oiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793564577; x=1794169377;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9AqbH8327lnwvg1LioWgbD9Tcq5AbImAQbsNTXyY7Tg=;
        b=DIk2y/H/b5J5SCB2IKQylQ/pAB4NEI5JMGzB4khwVVEBIkDixLnPJt64iz1hCGbnJF
         B9QNgJyEErdRJfGoVIDTdt0vqi7KVXyi6rKb6diBlBRFt2h3gBkwgP9vM1vnUb0O3Wjm
         1sOBwnOlm73hnjxbSsUQzrjJ4GpcyC0NalQE2WVh0bQwthT0ojQ0RLlGse4m9mFVLL0F
         94p56KrIrpXBOb0f5uCdfsAc1OYvcfVSKmp7sVrEkJ/kmhN5k1BqJaltQ0/RhZ9TQigC
         1ouyAihNT7i/BmPMdITPdBS6cHTVjYJFwxNMt0VjiJFqCAiZr7+bi7V+A8082176Pnwh
         ehsg==
X-Forwarded-Encrypted: i=1; AKwUvBzOO92MeuX+vfge3UyDv6YUcYCCfHccC6JeO0AKdb97weSLNC2pqVQJMbfYe/ECdU+ljXLcrwWAPzcKT2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dWzJ2noO882sQmBdIKykceDuiZ+nAs2VDQKpEWh1aZ5gljv2P
	jGQ6ifz3O5ll9G33XPFMjOwlDyjlELFQnkGRf2CTK9gpftOfZjoRjZgErwiUv3su4A==
X-Gm-Gg: AYBFou1WuMmHtEIqEHcuWCNRc60ar+2Df+tPTgPWRJlbnWCF2754BKcUII4uJev4xNk
	prlDiaLL/3EzsdHPSJD73KFDrelricascYALibxT8asPDmx9nDt8m4sZza6hKbdAG0n9qt605Mv
	7uhVhNxRd5pttegOSVtMAxf1jN4cBV51YwxsUmeZ8G/BsC5hBwD1JmMwTyjThtA7VKmp9KR6BFn
	+iz2blwWyLr5eX5S1JAzJBhEKJMHsfN2u7tkFzaFwNV5eKW8eFBqdhZ+cy0h1euJh9RMKwiXtqM
	jvIZdIt182KSMUZXBV9A1JKzLhARjFVyoLupQMhtt6ZdZ9S3IxYAr6zeJdpSzKe751bpypEcdTH
	wY/K7c2ALroOb29AAi7LMRYzL2ydy9tQHVGbQANu0YrD/k1TscWTi5XLjzAJMYCtMYxxcNBzsCN
	TUMXhh64L+QtQSy2e9lELJ4rdxCxYy3SsqpBhrE/5tAQrgqTAtZSLc27ImJFz5KNYwh1bl3BQYU
	ZENt+ZR4c7kbQ7psopqzAPLePQLwfRl9o3M8cGTbA0QVxFOvGkeppnCe0xvVhNsN1VaUivsPV8E
	RzS+dwjFvzYOYr8PH2AtUNLN4Hsds/T8DR8GtDyp5Jt4DNznP94wuTB/rGZIqEsBIe4qS3yAKJ6
	JJ6WMKhXp6vJVEHI75elGO5v0uND7SG+m/JKXAg1QgL5PMdREejF4pTEvXQJNVRekNZm94h8xui
	/U/kkrODBgieS31zY3seKm45yTmfwo2O5VPmSotRpKHC3Y
X-Received: by 2002:a17:903:2acc:b0:2e9:73e0:2a6e with SMTP id d9443c01a7336-2eb019ace41mr24556695ad.17.1793564576851;
        Sun, 01 Nov 2026 12:22:56 -0800 (PST)
Received: from [2a00:79e0:2eb4:9:6dde:d2a6:8d93:5cfa] ([2a00:79e0:2eb4:9:6dde:d2a6:8d93:5cfa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8441a5ecsm11128450a91.2.2026.11.01.12.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:22:55 -0800 (PST)
Date: Sun, 1 Nov 2026 12:22:54 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
cc: Andrew Morton <akpm@linux-foundation.org>, Harry Yoo <harry@kernel.org>, 
    Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Johannes Weiner <hannes@cmpxchg.org>, 
    Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
    Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
    "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
    Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
    Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
    Gregory Price <gourry@gourry.net>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/2] MAINTAINERS: move SLAB ALLOCATOR under MEMORY
 MANAGEMENT
In-Reply-To: <20261101-maint-page_alloc-update-v1-2-27e8c246b13d@kernel.org>
Message-ID: <2d819627-1f3e-140f-81ba-626d58ff917e@google.com>
References: <20261101-maint-page_alloc-update-v1-0-27e8c246b13d@kernel.org> <20261101-maint-page_alloc-update-v1-2-27e8c246b13d@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 1 Nov 2026, Vlastimil Babka (SUSE) wrote:

> Following David's consolidation of several other MM subcomponents, do
> the same for the slab allocator.
> 
> Rename the section to MEMORY MANAGEMENT - SLAB ALLOCATOR and move it to
> remain in alphabetical order.
> 
> Remove Andrew as M: to signify he's not the primary person for picking
> patches in this subcomponent. get_maintainers will continue CCing him on
> most patches via the catch-all MM entry. David prefers not being added
> for mail volume reasons.
> 
> Indicate the primary integration branch (slab/for-next) in the T: entry.
> It will now be integrrated via the mm/linux integration tree.
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Acked-by: David Rientjes <rientjes@google.com>
