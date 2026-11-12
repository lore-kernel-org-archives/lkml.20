Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508879;
	b=ZLW6BfmJHbDy76WuPmRbNYAi2TJcXGF/ArIlZ5rVAIfk4qbRfjQuExTvneKEsJ4wMV7U
	 P++llkns2MvUL9WtTj8WceGXkfqUzVYo/sO4KjqYhqelGvYTha7H4xkemQnEWoYubGUTc
	 ZgPNd4rYj/fXbwXPi4Ik/IGQ1WZ3OHxTHLIPVgg9vFwSaZs6U+Tq0BmuyZbc7cdCVYT/u
	 LlcBo81jY9pL22fp/9k7eM0QbDY1pSEJ32BbmGm6a0poPAXVqjj7xyE6Pxfvop6NrM0Bx
	 GcPV57revtRc8AtTOv6FPtCqpzLwdrypSIC0w/SxKgmNlcQJppjozqashSzqGR6yXcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=UiA1ssc1fM8eBuo2DnRY95RNeWhnyd0r69dfKPpEwvw=;
	b=YEw0i7FOzKuHaS9Z2U17nICZaq6itO13ayqgWEnoHP4SFIPDd3nb3akkGX6n8GSLQxve
	 lhcHi/6BCH5UdbE/iRYSTqBFltpfubxvYwX27bAvMPVg93rX2evm7pMk00xoGpOr5biuT
	 iQT//2/u0F+BQmcM2xLXegcppW/ThRtzAjXzz1Q2ExV2/KwZWLFRemX6RyUiMqaAzLPxm
	 1Q61hU8oKDaPdingEcYzfZKW0d39OdAlUXWgHBObjDVd+hMBD3eyR0hAzLPaTAoCIVs9M
	 DRSvb20oNTMUKOfD3BtljfjMzgoR/N4sbr8pdd5PwdFm5znauDvyrXpNhwbKcUOSDVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=kWdD8O8D;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510E8606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 510E8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=kWdD8O8D
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e635220b4so5003885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794508878; x=1795113678; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UiA1ssc1fM8eBuo2DnRY95RNeWhnyd0r69dfKPpEwvw=;
        b=kWdD8O8Dg9JjRQF49RLM+2ucMyabFJdaYcTF6OjPoyCSEQ2RDViJMttopDyTewO1RJ
         Ytd0HE/vu/f8ayqUFYOKPyPHfWzXjy/qGNztZmNLXo78HZUbd3KMih/KClPN8/BDCWl2
         nvak9hgggY7vBZ/rbu3AuQo05ZZ1yxrfOA3IhpLavJy8vl8/lX+IKcmz/sGjlvoqajvH
         tO7IVVnJxCwFmin96jhUpcmSMBUdww4tcAFRgdc7LbGXxgk9OIHzFMdtugcvx9d/3fsD
         N6SACfLuC9Xdsxs8jieSzt4qfCZUo10AebNgTsiw6i1dPJe0W7YIufXdVnNLkqVaN5sv
         PQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508878; x=1795113678;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UiA1ssc1fM8eBuo2DnRY95RNeWhnyd0r69dfKPpEwvw=;
        b=iV+FdUqjCUdELeEM4DjxPmjzAlgI+j3R3OUw9cQAsmK4ceX3x2+KMgCVIDUdYLjWl6
         Z+Cl5VJ7eT8xZ25p4sALj7mo6C0BlOJ538x1wYZ+WiXHyhrsXhcVFeIpxDqwmff9JS5H
         VOuSjks/LIRnvazcnGvwu9EnK7ZyKSxe7cxdWzrH4AQ2Aww9yfdSvQkL8FgIfrk7ejth
         W5elr6e10+ThthNtjl5o+JlY7a5RMAlvuAnVouQv2bK4ElsQANdetTFIO5nv4BjEzExc
         VKH8ScrdKxXdL3hM3adaqgpOHOJ4JR6QzllsLza8+prf9DMeV/DG7I9MuE0IvkaA4SPP
         vinQ==
X-Forwarded-Encrypted: i=1; AL+hErHZqWXJe7oTbjHtRaQxsfI8sUoIua0XBO7LCGHqR4QVSYREqWRpGWrZYkWU5BJGupBufPU9bFaBQW/qSIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zeAfNibxvv41yV2GgW2J40Cyi0dqRV8ByjagS+BgHIfck8cmA
	CRSeIEkWh8n7w4BNno5SJBO2OK7WWedyWOwKfGpY3GfiB5fXPNRtIeAQyXip4weAzfI=
X-Gm-Gg: AYBFou3Lwb4HwMINUqjmRZ7HoYSqflIC7bIqUElPHN/IyjfpqPPhEUF9S6pOgbpCBm2
	gQF3bBJ9J8O4V2tZGM1dHEwveb4F2HAtxBmLkm7cljMfVAHVJ/KsicEDoqwLxLithzw4sxHXROG
	j+m2N1sT5Ic+xg42XKeJgOr4yvXsQ+JV3+3vcKcPXnWhE2J1FtdZZcGrVJL9gkDGvC0a6WkcOGG
	daevvlaucdC3WPIMlS33vJc4/DSMs4MeEAy79t4b5wInZApeKCusewxrmASmP30NCH+HFyfbh07
	H+1k2/ICpx+xOGLnEwLGBRASPh46cnu/s1Yttsj45ooOaMvKIVgwT2KY/12F8cvXcozGQge6Bho
	58PaG70V9FS5t8gfWk3jFkgqmKFw5BeJXcybR2PHFoFe0wJ6jCdKRe61FU2uaK3STgrzeZLisAZ
	YwXlJHhCfgrISwT4O7j/grLv2JYWEsgeOVYMkrvan1fGf+m8frGuR1dNrziQuMoLjluJHEELwvC
	vXOClhA88VJEPqFzTKdlqXCHuuciDkcNl3XoQ4LOx85tmNwvN4yRlhtGcA0Ff81gevLAJmfpPA4
	T4PQzArUFQYEduIwLvPxykkLk5YJgFpmzgwpcuXLJ4qsEnGRGp3qSAnx63gCamX2l2TXt0ML2uP
	QKzGyUiw=
X-Received: by 2002:a05:620a:472b:b0:93e:f9ba:690f with SMTP id af79cd13be357-9494bc84c75mr45006885a.73.1794508878117;
        Thu, 12 Nov 2026 10:41:18 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c3600adsm4935085a.42.2026.11.12.10.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:41:17 -0800 (PST)
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
Subject: Re: [PATCH 13/13] percpu: queue the balance work on an unbound
 workqueue
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Usama Arif <usama.arif@linux.dev>, 
 Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Glisse?= <jglisse@redhat.com>, 
 Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>, 
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
 Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>, 
 Chris Mason <mason@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 "Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>, 
 "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-13-3d2454362e8d@kernel.org>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-13-3d2454362e8d@kernel.org>
Date: Thu, 12 Nov 2026 13:41:15 -0500
Message-Id: <179450887590.482102.12180028123925629664.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 18:13 +0000, Lorenzo Stoakes (ARM) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> A burst of small atomic per-CPU allocations can fail with -ENOMEM while the
> machine has free memory and idle CPUs, as atomic per-CPU allocations are
> only served from pages that are already populated, and those can be used up
> before a worker gets to populate more.
> 
> Consider:
> 
>     caller on CPU 1                     kworker bound to CPU 1
>     ===============                     ======================
>     allocates 8 bytes, which leaves
>     one empty page and 4088 bytes
>       schedule_work()                   woken, waits for CPU 1
>     allocates 8 bytes, 1023 times
>     next allocation: "no space left"
>     gives up CPU 1                      populates pages
> 
> The allocator keeps a few empty populated pages in reserve, and the work
> item pcpu_balance_work refills them.
> 
> pcpu_alloc_noprof() queues the work item using schedule_work(), so only a
> worker bound to the CPU of the caller can run the work item.
> 
> The issue is that the caller keeps that CPU - a task keeps it for the rest
> of its time slice, and a softirq keeps it until the softirq ends.
> 
> In that time the caller can use up the reserve, resulting in an atomic
> per-CPU allocation failing.
> 
> Fix the issue by queueing the work item on an unbound workqueue so that
> another CPU can populate pages while the caller keeps allocating.
> 
> Fixes: 1a4d76076cda ("percpu: implement asynchronous chunk population")
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ ljs: tweaked commit message, comment ]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reproduced with a cpu hammering atomic percpu allocations with preempt
disabled. Results are pretty cool.

In about 1 second of hammering allocations with the full 13 patch series:

                        Base       Patch
Successful Allocs      1,188      131,072 
Failed allocs          4,097         0
balance worker runs      0          169     
successful retries       0         4,096

Micro-bench obviously, but pretty stark difference.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

