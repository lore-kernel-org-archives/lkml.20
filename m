Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184226;
	b=KpMKEX1RMYxuvyUKrj4U+2G/5rMj3ZGU/HG+zdORQEnc1L2/S1Mt4xHr8lp0KE2Tk1jt
	 y+WvsHmZ49xea8V/TOxv8aYPSma5zbnmGTHhd/JvV+Ymu2yKeV9OxVpSm50xKeuq3l/KB
	 5lLgYdgwc8xDFl70Y7khjb3WuuxFfNILOpvsgqzeqA8sMV2UrkeApNkHIgHv2LbiaMltn
	 zhLPKhK/NNNt4aGC+I1pT1QuhUXlPhMqA7OFbCqWngiyH0ITTn8ZoAtfuL03CXeg0XAVT
	 /qJFwRcaYmroxTQPkNkfz81WZtx1lBbVTH8U1l1YMx2YDvorePrmmF6OkGqYrahQklw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9PEXPx1f1v6I2CjAMNLRcdHwCcztH0pJkRVk37TqP40=;
	b=DhJYZK9/5fA5TSiG88hLJArAC+T+g/pOEaotPoTsFXeTaL6VlbE9Q9Vd61534DgwnH3w
	 7fAVMWCmsiX2Of5WBDZns2YsNfDwLAWXVoX9EpCXyWVqGLR+nUPnP/fmVDaXxKikIPKIX
	 9a3ckb3trYcLP3jRDapTMzjvWfF9lykfJjiWWIul0Dl2L13+U5bJa06FhaN3zcX0VVrWG
	 rA0pc06LlhMMAtD9Y1V2FB6vtbaeDTECrxgwdRqFXMtpSkuJYKRnsxeLAYq8eNorO+7VD
	 eQyF+1HziDk1xaNRAqMrPcviA4hT+w4gzNJ+595IkBrLq3fLecR+apcKKz7uqn+d8ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgz+LzV+;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79794606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79794606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgz+LzV+
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso358928a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184225; x=1793789025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9PEXPx1f1v6I2CjAMNLRcdHwCcztH0pJkRVk37TqP40=;
        b=tgz+LzV+dwEKJDmG74Pr1aGCyv4LebV50v6CwuWqxRNOW1XFP43YJgPlVeyyQEpAbL
         tIIYI7wazhn0HNcl0IUX4DJq9T6YHUoFt6RRDHwg53aoTtO0IJ1FYfEJhU/PNP86qd0R
         WYW49tX9/ZiemyGoOxBVfnXeYMlgVxABNxm+Kk3mvVAacSLf00/NyUglTB6/XGZuXYzN
         aFfS0AHdEtecypjIRHhZXOhJ6S2IXn/YPNmnjKWriJyGuQetBs2f6QRt2VqMC1EPCq2d
         i1YKLh8ssu/KZV+bsxOysgUfq0eiOMkfNCn7AuCzPtEdA4blRTX00rwMC1PuZubvmtQw
         Cy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184225; x=1793789025;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PEXPx1f1v6I2CjAMNLRcdHwCcztH0pJkRVk37TqP40=;
        b=cLx0s0FT+ocbV5KhccoBEDr8SeKPbxAIzw+ALWsDhQvN8V5NonSGhuXmmauBST5VaY
         LXCHqQT4UBR9tG90CymKMZxOlMMQkGrT1ti9RfKxSVJo0GCnwBRUH4a7DFlVI0Ai5WyX
         JGetWKfglGNRz/sTeSr3Hzi5EKk4LxexzL5W1N0WL6w5395Hjft1+iLUvGpUXGsHA2xf
         S27w9fRz/TJle7JSDlFmCBBGy2HsszFRl00EaOf2yhz8SwLGBxY51HX378hJxS5QOClP
         ntT5WJdnsyyU+QlJethEA8K/IyNo2j+0KWzQ7CND0OTFJdGnrRFjzJWyRtIdtiJizhqG
         TOaA==
X-Forwarded-Encrypted: i=1; AKwUvBwmAZo4sqgO/RhqY28URLFR+19oRvmSDqpEuDzPoTEK/VOSyOqK34meKcKuio47mf+7Be6hWeSOkSsNxwg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJC5+Fj4UMCjUYxixuiAWUz+VyyWfJLkc5E6fK1G9VyEL83X0c8
	F0YBgfLcfOEmVPYy7WYKdtGGaiI8Msk2Bp/qi98u3Z7Br7pmi2JAmT6w
X-Gm-Gg: AYBFou3kri43FoR5qNNBjCdBYh+yiiJMAnUPXchHmb7GXy546ZFoLa1ixP8hhOleNQd
	GL0zV6rd+u5ocUjCEIJyAE3Io0D8xj1OR4KEytdvOdUrThyyEf3JglMliTeL6gA50i3TKNS08sH
	j7i3eyzjY7QD5O8gDwRJrVkeOXtTWWXOqAPZrbmXu/3oeSEZzGbmDjNKdPc4SSaXy1kmo1u+kHn
	sOw2mhlSU50u3LYj9sHJuRuBqYQuQzbCcwIGwqSVZkcpHglfEoRIVBNvHq4hjvSUbifvENOPI7D
	kmfy79ONYKZA2QSf/AefA9B6ZX4xs2oG00QF/sMFOrLn6t4nlxs3r2WzEE/wyRrRhlAMArf3nzW
	YH1+O2dKAWbXGsJfEEGNPvD6FxbwcsolRbZDR8hd7jDqUeJ5ZpmFtAulTfjo/RoUkV4kWRfftZI
	KLC9W8pmnc3HykAOSxZnILPuiYUtUyKCFN5PLUi+WrtqtXhiWG91PIXRx6zs5u4ZzJbwsKxDcFw
	QBLpA8ZMq7a94qmiIHK1VXJNfDJav7Kjb05GjyaXsur14GEHf/tCnXvHWEcPHvdqe5iOo2LWMSd
	QYp4B+T7WILg1j4JIKvKAdckaMKQEC6VU67L/D56yG/7mGU5Yr0QOPxiQRDyDuifDTHtSfxw
X-Received: by 2002:a17:902:ec8f:b0:2dd:c100:4b76 with SMTP id d9443c01a7336-2eb003e9b1bmr20590075ad.45.1793184224783;
        Wed, 28 Oct 2026 03:43:44 -0700 (PDT)
Received: from KASONG-MC4 ([114.246.239.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c34c27sm19889165ad.50.2026.10.28.03.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:43:44 -0700 (PDT)
Date: Wed, 28 Oct 2026 18:43:34 +0800
From: Kairui Song <ryncsn@gmail.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: roman.gushchin@linux.dev, muchun.song@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/mglru: stop rotating offlined memcgs to the old
 generation
Message-ID: <auHMXBwnwuRwHLmo@KASONG-MC4>
References: <20261028010611.3929937-1-tjmercier@google.com>
 <20261028010611.3929937-3-tjmercier@google.com>
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
In-Reply-To: <20261028010611.3929937-3-tjmercier@google.com>

On Tue, Oct 27, 2026 at 06:06:06PM +0800, T.J. Mercier wrote:
> lru_gen_offline_memcg() moves an offlining memcg to the head of the old
> generation of the memcg LRU (MEMCG_LRU_OLD), so that global reclaim
> visits it first and evicts the folios it left behind.
> 
> Since commit f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of
> dying memory cgroup for LRU folios"), those folios are reparented to the
> parent before lru_gen_offline_memcg() runs, and nothing can be added
> back to the offlined memcg's lruvec afterwards. Putting an empty
> offlined memcg at the head of the old generation no longer serves any
> purpose and only delays reclaim from the memcgs that still have memory
> due to additional shrink_many() iteration.
> 
> Remove lru_gen_offline_memcg(), so that an offlined memcg is rotated
> like any other memcg below the reclaimable size threshold until
> lru_gen_release_memcg() takes it off the memcg LRU. MEMCG_LRU_OLD has no
> other user, so remove the op and update the memcg LRU comment as well.
> 
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>  Documentation/mm/multigen_lru.rst |  4 +---
>  include/linux/mmzone.h            | 14 +++-----------
>  mm/memcontrol.c                   |  1 -
>  mm/vmscan.c                       | 20 +-------------------
>  4 files changed, 5 insertions(+), 34 deletions(-)
> 

...

> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 636152d8c94d..45a2c1021f4f 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4538,7 +4538,6 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int nr)
>  enum {
>  	MEMCG_LRU_NOP,
>  	MEMCG_LRU_TAIL,
> -	MEMCG_LRU_OLD,
>  	MEMCG_LRU_YOUNG,
>  };

I think there could be other usage of this LRU_OLD macro, but indeed
offline is the only user currently, removing it is cleaner.

And everything looks good to me, thanks!

Reviewed-by: Kairui Song <kasong@tencent.com>
