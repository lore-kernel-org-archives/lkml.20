Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E02E484250
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790373213; cv=none; b=azgRX7NJQkHVcjlnvXMY8m1h/Rz2DCVzbo1bR8D6DfHXVB9f1xy3S2RF1EX8lSFnLUYpEtHjbDktJ4ltaOJF6mli5PMJLiNDlYmQ9KADlIZvS9KaAnbne6lZL1qRu5XIcCKSsKreI4TO5iLTNj2ZczGntg0bW5KKsUfXIEEhGno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790373213; c=relaxed/simple;
	bh=kBHykIA9B5ogeVV0Ds8QGLkMdL7AcZ2GU8m5t3bk8DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdhXfdwxpNp4knF5Uv/0ngmjRjcm/mRSVPEPKADpdWUIhjZyKDfbO2CU6ymuoCEUok9xaunI+MkHO1wdqti21n3bUuvaaNwKLS+/2wmWSnjGQFQ/pR/+eeXMGRtnngC9xIzVnhY/5MelnSrD9OHmdVmJtdM5a9FuSviTJh0gQVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=uwyFVX/I; arc=none smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="uwyFVX/I"
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93c5a837375so73585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1790373210; x=1790978010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TJzCvfxmeFB1cEl2za6t85fQGoyj6ML9WfPxvW5p3nM=;
        b=uwyFVX/IKwJOXkmMdNzAkiaAQ03UyZ1v2ZFmbdTRVO+oicNub/rgWomg+Smwh+m0/J
         SY/Q6k2BJ+LrxWjQzrjB/h0u4wkpLGmAqMFxdxpbU7GGYuK6E79Hnw/GXQX1kp9hHf+g
         S4FP1X60smvEor3805GYFJ47q01UfMytRnJRQCvfuUzWmf9sabwN4htiY8uqTJea+CfJ
         xpC0FPojdJMZ++fxqkAXjKshpo1Ir6r+GGK8B7xYy79/JuZG+A+UUu+1njuEXQHgQitW
         iWFLxxCPG7AD2U/Z33MJkGM5+zPAoBar18KPOHOgX34/oga0+8V31IPCNccpCS8knrKU
         x0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790373210; x=1790978010;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJzCvfxmeFB1cEl2za6t85fQGoyj6ML9WfPxvW5p3nM=;
        b=MEB5lSKNKrnK6z7LC2I86g7OP3/GYacKCFDnbWWHMbnw+MN9vLHbJJF2h4ucCvmIzw
         KirpHyMRzGeem494N0kSbq00wLPMUsl/WMCd9t8Q+IUmxmA2DOY19O9T7HCrN3hzdt/E
         5CJZTArI+tSp8JhEZo85uZo3GlzGOl/fVewPp7+H3UvttSbejO5ZneoSdqdA2QExR/O9
         dlufMc7mlUbfIzrRfEbpB99RQj59HTWXrhHQfjuL2xq3x5F7aP8kMDRS6iYxdJ0DylfQ
         RukVSZ3IAVnFzAG1bVKugNxFsF8pfqeUxGhON6VrVsZ1OcUuCecXLVAkfgy0VFX1X6Ce
         dVHA==
X-Forwarded-Encrypted: i=1; AKwUvBz+pxMwoKXXZXhgveVHb+EivpU6MyOJylYxO7HiR9hngJolWz3LyPWto6p1c4bdPXGdGatDPGc00rbtMgg=@vger.kernel.org
X-Gm-Message-State: AFuF++m5RgTFJrApEsx4ExcaTpkazfQ9rIAhkmzaLYkNd2ZHLtHWsFVH
	OPuVJe58nVeXEVaBhHIlG+iv2t6eIw6CEg5LqDs0+NqwEcUGN4pDyru7wh1Z7T59LoQ=
X-Gm-Gg: AYBFou3uk3Q2tiQ+bL43aJHHPlb/bbWjPpbqet/07Gjjj6UX22At3ZPDFwTEq6DYq/B
	04y4D3br/wswW0WdRGeH2iWPUp63MKy8nE/fdGNPHRwRK1VC0VYHNnqfpFtuWrlmoLrUNB+a0lh
	um0K9rrspllnpJFOkEzeXAPQC/0LVhiWlE9HW1LlgXARzhSu3maONGOVzbUe4cr2WD9uKkBRAdx
	Lp/MKeoThNquOw6ldxcvww+gV+fVfEjvtlhwknNmZvEP05KDnKtLQv2w6roXQX5xBRnlzZzgmRx
	8vWDFUUcX54/dwz0AA9vLcTO5CiYodHbyXwfOk9S/Psqw29QIPUF09UvFU0eQORk1ebV3xdzItS
	cfqBT2sAHTL8Xbbab7DCzs7HAWoTFfJeEPd/YYwxGpiirSKBSNzVe1jk5OIwIoDmL2JVVWXz0OR
	QnWzQJGv1xv+ixK/QmPHhQumBjqX7VV2wkYHEGd67PK3O3eHiTHohIFhGC9LbztyW5+5JspPmps
	U9Pvepp
X-Received: by 2002:a05:620a:4398:b0:936:cd75:8f91 with SMTP id af79cd13be357-93c43c44d65mr740709185a.12.1790373209889;
        Fri, 25 Sep 2026 14:53:29 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c44653c8bsm277775485a.3.2026.09.25.14.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:53:28 -0700 (PDT)
Date: Fri, 25 Sep 2026 17:53:24 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Gregory Price <gourry@gourry.net>
Cc: Kairui Song <ryncsn@gmail.com>, Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>, Rik van Riel <riel@surriel.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kairui Song <kasong@tencent.com>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Barry Song <baohua@kernel.org>,
	YoungJun Park <youngjun.park@lge.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Wenchao Hao <haowenchao22@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Meta kernel team <kernel-team@meta.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-doc@vger.kernel.org,
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arbtVBEKm5IJTH2j@cmpxchg.org>
References: <7ee199ddee81bf8026688def82f78ad9db09be9e.camel@surriel.com>
 <CACePvbVA+DnDJprMx3qOrGb98y1ORQ-LfaENy_Btfx3uW=E4eQ@mail.gmail.com>
 <f3ca71f1c561f28a341de0e5a1b3f24bd4da3201.camel@surriel.com>
 <CACePvbX5Oy98DygLZjC=Z03Lqb0nk50_OEKQCT9svbQOOwwDew@mail.gmail.com>
 <CAKEwX=Mv+tnL8K4rfPuof6mKaLQp=tqR_qjtKrtY0-5L85FLfw@mail.gmail.com>
 <CACePvbUF2QQMh_GiCNQn-RTmZNkkLWkmaHSYzdQwv2fupjNQiw@mail.gmail.com>
 <arUcil9kxUPiymXI@KASONG-MC4>
 <araKDOz5bce52oyg@gourry-fedora-PF4VCD3F>
 <arbJ1LTzc7H4GL27@KASONG-MC4>
 <arbgZ1OGndQAsXJc@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arbgZ1OGndQAsXJc@gourry-fedora-PF4VCD3F>

On Fri, Sep 25, 2026 at 05:30:03PM -0400, Gregory Price wrote:
> On Sat, Sep 26, 2026 at 04:44:07AM +0800, Kairui Song wrote:
> > On Fri, Sep 25, 2026 at 12:11:55PM +0800, Gregory Price wrote:
> > > That shows up as stalls and PSI pretty quickly and can be dealt with
> > > by monitoring - but I can see the desire to just have them OOM.
> > 
> > Right, monitoring is less effective from somehting that is directly
> > in the kernel.
> > 
> 
> Well.... I think this is probably an organizational philosophy.
> 
> We are pretty solidly effective with PSI + proactive reclaim keeping
> our machines chugging along nicely.  I think this is where a lot of
> confusion is coming from - because the PSI data is very effective.

There is also that we usually don't add convenience things to the
kernel for what can (easily) be accomplished in userspace.

The job of cgroup is to contain and isolate workloads from each
other. But you're not hurting anybody else by overshooting into
compression. It's a lateral move within memory.max.

> > > > The second one is a policy change,
> > > 
> > > Disagree.
> > > 
> > > If zswap does not charge a physical slot, then it is correct to stop
> > > charging the counter based on the historic definition - it just was
> > 
> > Hmm, but the historical defination is the logical entry, no?
> >
> 
> I think this is the entire debate, right?
> 
> Historically I think it's clear that it is a physical slot, from the
> time it was proposed it was talked about in terms of consumption, and
> Johannes' original definition even said "physical" (for some reason
> this did not make it into the docs).

Yes, it's physical. Cgroups partition physical resources.

That's the whole reason WHY cgroup2 doesn't have memsw to begin
with. It's not a resource. CPU cycles is a resource. RAM is a
resource. A swap partition is a resource. A NUMA node is a resource.

"Unique page table entries" is not. That's a metric or a constraint
that you might find interesting for your workload. But it doesn't have
anything to do with partitioning a computer into containers.
