Received: from mail-qk2-f37.google.com (mail-qk2-f37.google.com [74.125.230.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEA32C027C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789834096; cv=none; b=nb8PQ+N7p4p2WIrCXoTwtynav0ewisu7Jg4tOwP+aOD9kVYdZu8Ha8+Pm2xrdzUVekZWZENlq7sMawyifhZStkzACqo76xuCdRQmbDgdDwWPMlNUTi/Kvt/FQoULlJrGWvO4uejLw72fGaLpY/3cU8wdYumID2kWBSFOL2eTx4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789834096; c=relaxed/simple;
	bh=EI5XLXPHTu/1vw3/pA66slomIjIqbs5I6JK37l78UKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/aC0xc+Apz01Q05OoloNoqzMcDhgJiq2WA6rYf/wq0NUa88WHDeCkIVH6VYT6Ik6tjOEhTEMCOETp9/2pZlz4KmqoY6ifFCRKnYjw1uplDcBezmY6p6AqZxQUu+ckOrZZrD0Nj5v/lOfm2XP5xpSPZU5zJJPAJGx79Of+OBqGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=krq+7ktc; arc=none smtp.client-ip=74.125.230.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="krq+7ktc"
Received: by mail-qk2-f37.google.com with SMTP id af79cd13be357-93910cc46c8so201544785a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789834094; x=1790438894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1ENvgPhr2wkBzngQIEflRDSjK2asd8jt545To7DKdg=;
        b=krq+7ktcJcLLxzPRR2XcRReeNPXnRQBlfY9D40yyZ1PoX6XqQrfVMQRq28NOhZu6nQ
         FxAEeEKHKoKC17VcAaJzcjBbqe6O4vOuJ7EmwhUAST8h+1YtrJjvUmcDNxetxKfQXa3X
         biLGbSMuG+EL7fNpdY70fn8l27CkAwtKZKtMEJTgUEeDSHuleryxJYC8naTW+CAeE7py
         jgow3/h5bieabnxtLl83h0WUXlYGVAycLao0fowUOk+1c6R8mtiaUAipg7MHO7ycoN1S
         DvRzj24bu4eKH+2TDkG3BUy8mGeRiAXTsCSpBPbQZtHZh7aD+fBOImapVUPz9QPYHpYP
         ZUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789834094; x=1790438894;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1ENvgPhr2wkBzngQIEflRDSjK2asd8jt545To7DKdg=;
        b=RaSpzow65tcExTqyyZHzrF1yAAvSZMsj2j7/fe877srVAkra2sxr874WabzpFARQtm
         M/6pXCoee1IRZeE+kl/sO0HHiCWY9Fgh3bvFgF81r/EVElReDHCL605GQVXIX0Xep0I3
         FEboCQRYG4zQR/ks+TEPC4ETHQGZ6U4xWEUWIPdzqwTbPE31MH+xCcQsQ8gQOq+RLfFs
         SwJp53dbcSVREiQPV/VYyiv5Y+LFmldjbEVjXQRTWgLzRqKF9LSA2AuL5KsJdGDu0vhX
         8EJkYJEyz4XLRJfhZPLvhEwcpjkwQtarXskA8GlgLHEJP4tYzi2U+GCbhLsj25Ttxis+
         o1fA==
X-Forwarded-Encrypted: i=1; AKwUvBykBamBOScyug4b7P8X7z6sXhAgO6RVS9BfAO6TvMWHHyP+zQo12x8M9FpZhCwTQ5rGohWJ9d7mn7vsXjM=@vger.kernel.org
X-Gm-Message-State: AFuF++lUN/qL8Kc72I0GkqDULDqdokvOZAk5CDD5ON4JIFhBY4t0d2+0
	mMCvCi8Ku1jtBNP/RhGhPrKvCxockiYJtYvo3ihWkFi8UGw6V9v+WNPk+3l3mUzK+2Y=
X-Gm-Gg: AYBFou3gPMMPAZ7riagmLWuWtXcYwUbUBKuXctTQrbmaTNsXU5nv1Ncj2bI0HNLtZDI
	5aXgM15Vi8hNdi34VxJ/D4G98NgTeH0XZtYVLUu8ajJpC12jw68GwkBrHT5rh63xsAICq05DylC
	Ih6Cn6/X/OhI+QJwsuZYYOMG/zBjJk1ABngxbdxhfwidWJgDwdkLs0icynD7fqhz8OirhmHwJ7T
	oeeUY2CQe8z+2C31xpSBpN8WeOiSAhwu8F6CBUnEds5Nm5s0rG3CwUsNw2+GGuhugq2/BOHJP0b
	veuFlpyZAP6kZSobXj3hOMqzGJjPqK0QSE664V9gXDmqmozwI/gettBdx2RUec5XcJYDG6CsbzD
	HIM3fGSetv6/Pm+7x8+UmDLelmXzBV/eRaHOPyTfxY1iNuKNXzwUqagqjMnQCneNCp8nkm3hwQO
	a22k0nW5d4LT6a0iHNMPPEsy1Ya5gIYQCW35agpmXQjBZsvs0n5vWm4AS7MXEaSnf2xXMHGyUrv
	8cJD++Ee4TFwEGOdz6e4xdEQgwXvATMKO7KA3+Ei6rQV4CPqNAAU9s=
X-Received: by 2002:a05:620a:371e:b0:939:10dd:9c01 with SMTP id af79cd13be357-93bf5731121mr233734485a.38.1789834094077;
        Sat, 19 Sep 2026 09:08:14 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedb05a2esm213660485a.33.2026.09.19.09.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 09:08:13 -0700 (PDT)
Date: Sat, 19 Sep 2026 12:08:11 -0400
From: Gregory Price <gourry@gourry.net>
To: Chris Li <chrisl@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Kairui Song <kasong@tencent.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Rik van Riel <riel@surriel.com>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Kunwu Chan <kunwu.chan@linux.dev>, Meta kernel team <kernel-team@meta.com>, 
	Linux Memory Management List <linux-mm@kvack.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F>
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora>
 <aqLi6cIjD2wJwk0B@cmpxchg.org>
 <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>

On Sat, Sep 19, 2026 at 03:45:03AM -0500, Chris Li wrote:
> 
> I found this new concept of "compression space" very confusing to me.
> Can you explain the swap behavior and problem using only normal memory
> usage reduction and latency without introducing a new term or new
> metrics?
> 
> The normal user doesn't even know what compression space is, let alone
> what makes it transparent.
>

Sure they do - it's the amount of memory consumed by compressed data,
including the metadata associated with it.

converting Johannes statement to diagram:

>> Compression space is not a separate resource. It's page tables,
>> backing pages, and swap descriptors. It's just MEMORY. 

                          Page Data (PD)
  [page tables][                uncompressed page                  ]


                        Compressed Data (CD)
  [      recovered space     ][pte][swap meta data][compressed page]
                              |                                    |
                              |---------compression space----------|


                        Memory Pre-Compression
 |[  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ]|


			Memory Post-Compression
 |[CD][CD][CD][CD][CD][CD][CD][CD]-------- free space ------------|
   ^----------------------------^
         Compression Space


It's actually really confusing to represent this space as a traditional
swap device - built on the assumption of a pre-defined size limit - when
that size limit has already been defined (the memory itself).

Baking any kind of pre-defined limit *into the infrastructure* (whether for
an optimization or ease of implementation) is what requires users to know
what compression space is.

Even using memory capacity at boot as a limit is wrong - hotplug exists.

> Why does the user need to care about compression space again?

They shouldn't need to, that's very much the point.

~Gregory
