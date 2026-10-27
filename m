Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100727;
	b=N8fYsUjWfrPb+gcBLF1kE1cjkr3SVed4XDWxR0qQeCRgdUM0Y2BRvkplOcj8Czc+xgvE
	 u9/EOsrcxdPaZKBZf9829c0y1SjdvD0R36iK7BuUJIthyPTKrnAVclOfdXk/cKGvX/OEG
	 E7sDpJBxS/ZaYOs3pGJmo/8Gje/lGtzLTV9KwkU4RD/se1e0/DRkdKacLZJ0vmlLBa64k
	 gDJ/S7eEvHbVe86AJwmXyVqRjEogeHBtYDBQUKgsCwP1bcRSXW4XrUmGf5fRrA1qqhco2
	 yZp2zr7/Sl+853JjYbftkS8wMiAnlaLmfwkvP7excR5/d4DTgkZY34pzn29OugREb5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=RdtQZXTbTiwwiCOERJQ/97tzbS8/zwPttXhgydj9WAE=;
	b=uhRYOAlbvGGFgWIsUrV5Vpp/Bf/uyPJz2mU+bmzp9A9PvqfAS6Kr34zlgANnJKAc/28X
	 mMT3zpekmLcRBbttlKorrGsvs5tmf1yCGCZteRGxnfo5Bh1doMCW7pRlTCdRE8JANbXyX
	 q8ErT7tym5q7MO35O7J5AOhtO16vVndP6N1seQpVs3qzIBMGjcU/3stYmQXU9QkYULqXL
	 SZJEv+wAyxHuDfImpBRFzs3qJbu5Lh6TjB4lxk3j7AtcuIRWp07AryXzD/FSl0w5HZYby
	 AoqLciMBNH47GFnIhWR57lAD8dO0CoVfX6IiNi1umqeLxIe+eZ7rIxavqyQRpMTZqVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=cgfTCbTQ;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1891606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1891606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=cgfTCbTQ
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93f269e335eso417863785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793100720; x=1793705520; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RdtQZXTbTiwwiCOERJQ/97tzbS8/zwPttXhgydj9WAE=;
        b=cgfTCbTQmgi08aq2EjQsJm84RLxzKfeSrSncAhWv2NxWX34D7zUPtFtjWMQCiG2lNz
         LKRkbYTvkqDwivjWQebhYClwp7BfdOjYotfdcAe6tniOWVw7k8fAg56bQNOsgF4gx94X
         d20jgGsA1d70pT/ktkr62L7A74iYyBwby2/bfs2tSvCH7mY2QTawa74oI6voEYGqV6OI
         8rSdwqhWgQiasbfVzvgo63SYfMT1NbHhQ1/PQ2nfhliNkl+kZRl82vbFKj+E1JeWrKIt
         IUeSRgq08JEj6mGtd8VckmSE/yaCQU0ZLGmJidqLDHnSJmfljMnUOv+RvWlnqtDMjqhj
         GSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100720; x=1793705520;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdtQZXTbTiwwiCOERJQ/97tzbS8/zwPttXhgydj9WAE=;
        b=DwQDN4OaEyR1y2//50cBr8nAnc5ilxa3pJ4ab2qJBtIGT6k+lf2hJ2diWrU1/IysTz
         DgT9lBjtxPj8cuYVxM8WNr4ZAIVWOfxVCAfXDvJaLEcg9FQcF0stc9lU7fQQfWH/WfU4
         mBu3GHoJud5z3VyqAcsAtbiOQStWRBA5uE1mK9wDFyxwVT5P9KbxLqLFwXuHamFsSJt2
         MLK5zUuJt9dxc+hlVr3FkVvK87DE+NyfX5AGGgTdQU3+Sq+Ce3GxxXRSa7NrgqMZytlh
         fSsId6kkX1yYyuBQ5bf4af88DMZRj/OeWGndWNYEaxy7KtD2fRzhVIk68j7k/ysc6ot/
         M5Bw==
X-Forwarded-Encrypted: i=1; AKwUvBzSFSs8tBtMhOA9uzAnkBQvcfma6vjmb4C8SeTldO6YIGuXxpnXufcr/pS62f2z21ABWdMA6BtPatsrPSQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx8/iiHVPFfUfFni62KcmY0gNDsrCkvTjTsy2F7E3YdPWccZJG
	AyTkO3PuE/WsbTyNoJlHhcsV9qzSuO6xBS4ZcrlvZ2CGyHNKsIaYKruOmWwv+nRNlXY=
X-Gm-Gg: AYBFou3HV14KMhCC6vCaO8dAW+91hqiJ361MRp/x4bEZtJrZwPWblWT8pq6F2ird++/
	TXfaunMIkSFjpWGfpeFfU7NMGsIQ5Ek8Zgmkh0yFEO96FFu7xsUsR40j1Q0lWZVnK9rAz9Y+EaP
	7KiNdxgi+ypYaQOKnPk53k66JXAeN9byAkE41nqjdmZ6cZ3iU7pCdcEMmexC40EIuqffo8Zkfff
	23t0ipXVwWv/xXx721VyhXbZZhemxc7XsuYPBYHLXt+0PF0YpqC0nH933t0WScUlmwvIUPeTtBE
	gIGLd7LU9JWVYL6NCw6ZvwZ6V0FJsCNlylWObisJ5T9wPQqXPUzKeJ3g1A/qkPy8/BB8zQJ+Gb1
	fkDpwshvsq2kGRTwrfG50ON0dQUbhvD3UvCRzqNo26ydqHRjpVM8sovAAgZn+HLpr1/LBnSG/gs
	hOonYeleqsVMMxmh1GM8vUDbhm63UF1OL5BsSdKIG43U62RcIvQrz0Lh2pphWtU6cJYuD+hG7lX
	Rus5NiqLvq26A6+IgjFfMTQUHA0Au50oQjAICIoq1j31iZZAHI4l+xc8i03oEqYhcZyjpKk4MGe
	Ckzea/OMkpQ/coyvXBsbkTQKPvOIi+9SXkt1TUl2hEJE5QfJ
X-Received: by 2002:a05:620a:4556:b0:93e:5cf8:e5aa with SMTP id af79cd13be357-940ef9380d4mr1524401485a.61.1793100720515;
        Tue, 27 Oct 2026 04:32:00 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a6d598sm99588996d6.3.2026.10.27.04.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/6] mm: fix pfn walker races with memory offline
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, 
 kernel-team@meta.com, akpm@linux-foundation.org, vbabka@kernel.org, 
 surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev, 
 hannes@cmpxchg.org, ziy@nvidia.com, linmiaohe@huawei.com, 
 nao.horiguchi@gmail.com, ljs@kernel.org, liam@infradead.org, 
 rppt@kernel.org, osalvador@suse.de, muchun.song@linux.dev, 
 iamjoonsoo.kim@lge.com, anshuman.khandual@arm.com
In-Reply-To: <01d7d54d-0047-4eb6-a1d2-5b3f113f26cf@kernel.org>
References: <20261027042204.3741307-1-gourry@gourry.net>
 <01d7d54d-0047-4eb6-a1d2-5b3f113f26cf@kernel.org>
Date: Tue, 27 Oct 2026 07:31:59 -0400
Message-Id: <179310071902.664110.12994053710961856591.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 09:57 +0100, David Hildenbrand (Arm) wrote:
> On 10/27/26 05:21, Gregory Price (Meta) wrote:
> > Several pfn walkers check that a struct page is online, then use it
> > after memory offline has poisoned it (CONFIG_DEBUG_VM) or removal has
> > freed the vmemmap.  Five of the races crash the kernel; the sixth leaves
> > an offline spinning with the device hotplug lock held.
> 
> I have roughly the exact same list of AI garbage fixes here from a certain company.
> 
> And I consider this all extremely low priority.
> 
> So this is something to discuss throughout the next months and do it properly.
> 

I actually have a reason for these fixes other than "bot said bad".

We leverage ballooning and hotplugging as VM memory overcommit tools
and are finding that some of these race conditions crash them with
large MTBF.

While most of these are insanely narrow, they are not as unlikely to
happen as you think. A vCPU can take a vmexit in these windows much
more easily than a host can take an NMI or other interrupt.

Thankfully none of these (or the other series) appear to be obvious
security issues, but they are stability issues.

I have a reproducer for every single one of these (and the other
series) - but a handful are unreachable due to a 2-statement read
being emitted as a single read by the compiler (which can be undone
by a targeted compiler flag). Those were included for completeness.

--

On properly - I have a follow up series that fixes the zonelist walks
structurally, but it uses SRCU-fast on the fast path. The catch is that
PowerPC (and i think others?) don't SRCU-fast without atomics, so they
take a performance hit.  (It also doesn't help us for backports)

I've been weighing that solution over never freeing and/or prepopulating
zones - but this also results in performance impacts (leaving dead zones
in the list forces the allocator to walk them for no value).

-- 
~Gregory

