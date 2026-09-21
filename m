Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497792C21F7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789952013; cv=none; b=u5SzcF0aBAzZqy4MrKTLXDXBIgcyEC+0PJmqLYp83WhW5kMHOLgn1hRLA7QnmU+doX7yrTOMYlbkx411HQt477+PYi1J71gdEzhQ+GSDc3I9fdL3Q4CCaIosQwTskSdWvMn8vU0+y5iTOVIQHWi/VewRkf3ngal+WUF5z44e+2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789952013; c=relaxed/simple;
	bh=uT3QSlJyDb/QyaIb6RQq4e3wjco3xR5/xUinc0PHAM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgTDqBBfOsYHxt24NXl5G/XZYd5G+vQ03Rnow4Kbm6Rj/j5/q2EeWY264UNd8/FXoLUAh4JaZFovAmwNFztpznew9sDOF91puYlqGFeQip9Vzr/CHdGGmzzKv/8RZWL9ICZ9VLHJ+ylNFfiSSm390WncJh1SP/BJq7W9iny/zvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUmvNjww; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUmvNjww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D561F00893
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789952012;
	bh=uT3QSlJyDb/QyaIb6RQq4e3wjco3xR5/xUinc0PHAM8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fUmvNjwwo7Prlb09QFl/qwCJc9GZ61E7TkXlb8KqsM6v11ueO/rugvSrNKOqgl9wb
	 c0gA4x9DPeE1mvz2vvIoyy7nWOGDBljjy5ncBxydkFD+7kxZkCK510WOPuA8ypZ41R
	 4mQ/hD62inbiL2R5rZ98ggSezMraCvoroY7e2QmmCYQoJ1aLpETfVaJ3JA+kSt1o1k
	 lsrJ/4NnF3xCgql0ARnnrJjyN8bFifYiW5K/luUMkh+2rrgoevmcJXoqz5NKZLZTP1
	 pd50FtZrPLlfE2dDoo2kTvh81y1ZBF1nQF/zOfcmRhcPU5WZ9SOvgBZ1LUEYp1O2E1
	 ULHCYDGx6ZK7w==
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-671563fb8beso2151227d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:53:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycY66RlX0IW57tXQHY/6mpzjsIb2jrPyV3qZymN+uBedot00Ir5mmM4doMmwTvixcKlfO0YXE/ZugXZBM=@vger.kernel.org
X-Gm-Message-State: AFuF++lnNn1u1w0gHEpiBplXhi0rZSFXcPWE/HIMzmGzL53lJiqLAxbm
	Aq9go0IBwRikmJiXxtdnQrvOa4F3yuYdvBNh1B/RYqfOSy1JzHfGJarlPD28M+0zRM3A3Bkh1+a
	dxJmAfo7pKLPH9nx/bgD1Oo5kat4mimbqmhT1klcO3Q==
X-Received: by 2002:a05:690e:813:10b0:671:2228:1137 with SMTP id
 956f58d0204a3-6717fcd026amr1947180d50.44.1789952010724; Sun, 20 Sep 2026
 17:53:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>
 <aqBT_35E-eSoN_zj@cmpxchg.org> <CAKEwX=N4aaq_oD2agTUNrUNXhaYGeQ9vxu+dywFvEFgWFi4uQg@mail.gmail.com>
 <CAMgjq7AfNBUpMamcv29JFzpX=7ApNYVLtPjWT4Sm8cXjSLYL9g@mail.gmail.com>
 <aqU81l1oqGItb-0C@cmpxchg.org> <CACePvbWLHAT5DjC=HidzN10XF5_cnkpxXXDR_yfEJjTY_uDvDQ@mail.gmail.com>
 <e42d8bb0bb13067609e8ff8c858a26ca056368bd.camel@surriel.com>
 <CACePvbXDDDHo0rwkR3Ln4==teQugYP2=5y87J+A48Lagk1X_zg@mail.gmail.com> <da13e0e48568da3ccccc304aeb449ababf085e14.camel@surriel.com>
In-Reply-To: <da13e0e48568da3ccccc304aeb449ababf085e14.camel@surriel.com>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 20 Sep 2026 14:53:18 -1000
X-Gmail-Original-Message-ID: <CACePvbWg3be1KippqraPp6xV0xkrtw0ZAW74tFj8so83+t55dw@mail.gmail.com>
X-Gm-Features: AcwNN1UZiIocWVlz0qgZ7OJFByEl-O8xTB4E1qJAixnrA0sBJyczejwjOKx08OA
Message-ID: <CACePvbWg3be1KippqraPp6xV0xkrtw0ZAW74tFj8so83+t55dw@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Rik van Riel <riel@surriel.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, Nhat Pham <nphamcs@gmail.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 2:36=E2=80=AFPM Rik van Riel <riel@surriel.com> wro=
te:
>
> On Sun, 2026-09-20 at 14:18 -1000, Chris Li wrote:
> > On Sat, Sep 19, 2026 at 3:07=E2=80=AFPM Rik van Riel <riel@surriel.com>
> > wrote:
> > >
> > > >
> > > > For our deployment, we only compress about 7-10% of the system
> > > > memory
> > > > before performance starts to suffer. The feedback loop will scale
> > > > it
> > > > back. I am very curious do you have actual work load to swap out
> > > > 100%
> > > > of the RAM.
> > >
> > > One common workload is a web browser with idle tabs.
> > >
> > > Those often compress pretty well, a ratio of 4:1 is
> > > not unheard of, which makes it easy to fill up
> > > 1/3 of memory with 133% of memory's worth of compressed
> > > memory.
> >
> > You did not answer my question. You are talking about user-space
> > processes (browsers). Do you run your browser in the data center, or
> > is that a laptop workload?
>
> The browser runs on the desktop, but the same
> kernel runs on both.

Interesting. The desktop is having a GUI or headless?

> The things we build here cannot be optimized for
> just one single workload. They have to work
> everywhere.

Sure, but on your desktop or laptop, what is the max amount of zswap
swapout compared to system RAM? It is obviously bounded somehow. What
is the actual number across all your deployments? You don't have to
give me an exact number; something with one digit of accuracy for the
maximum is good enough.

I am wondering why you keep dodging the question? It is just a number.
Do you not know the actual number, or do you not want to share it for
some unknown reason? I shared that our deployment commonly uses 7-10%
for zswap.

Chris
