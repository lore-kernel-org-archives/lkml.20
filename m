Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568517;
	b=ZtAkERYI2+Q8l64mACq3VWf5TwVUvkYL6gfnArDd26/cPGo2OaAIHpi1k8B9Jv1xhOSh
	 09YHT3Hz0DBa1efwHQThXnuLNgliq8jAhdBcMd84m+MCxmqcLL/nrj9DNusRWI0pZ8ZSQ
	 VEZIgS18baWiJCQSsahjhsB2m8DypHrqfeRUeRtox0J1finihj6AeWJnxBVs4aysL+qyv
	 +Ms8/Q/B0q1iizWd+hJMnCloLpuxlz5Kv2OHl//eU0M8R51H2YSxXNU8sztVNSFwsYgva
	 S2jvn5mz/hiy+ukc22tqbyusbaJSvC7A+IipxhWveNswCRk2bJMty5JHXJcefrFA1yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568517;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q2W6HW6t4FD7GiH02r1fl3fKehEEk60q+ai1/oJoOqY=;
	b=JriUgvXLXdX2cu5clZ/4D0Z2itcpZDRxL+MrvRuKYOQAqe+Pc02DP+OVykFOgA4ZNOu3
	 G7aWHnzjQKa910MI0X6Vkk29nZATDpTtpmigafM/OgeZMDzAVcvBFG+a66Ez/lGmBDzKi
	 fVwgk56bKIoFNZ0aqMPrQxr6Q6dmnyfD1dnYTV1SqiajlMxQmcpoDH/8Fzk2Oj36rinat
	 eIXSfHlzmkuDgk9PMk+Jf2I+y9kgtIBXLb0a6RYrh8wM+JxGOhHEdJYjUmrUEkk4cefnj
	 kJLRR89yoT9kUBPdQNaCTmuiK56OZUZCGuj9lBvkZ8bbroS4Fc4MyJHP5VXR+sldHFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RphtZPQG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F821606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RphtZPQG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76201F000D3
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792568516;
	bh=Q2W6HW6t4FD7GiH02r1fl3fKehEEk60q+ai1/oJoOqY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RphtZPQGGFF7jJY7ncIgsi9Y/X/XBdAhf1KdUV3TRt0J7Vc+GURhEXJnNd1iU+XPk
	 Tf+DzqhJahQXexjDD3u+x95VdnpPZhUiDmTnBa2LCNLTITfIKhJWUBoJ5xdGz10Gz8
	 WeQSOdDnbLddYngWYqMC6hA+eOFhETDIq80GlSO6sjztsTqLzAmK4CyA/U8xEh5csc
	 GZ4f/lyVfFD/Gz3s7/wXcr3HmxZ62a8/U2Zw3qTzWAUSuB/yRMhG7lm5mtLik/sP43
	 MVutOdpgrFBFAJaZnWEbXBeVz77TYYxcWooBTzFJjaMOl9KSn9HhQCIAeCNKIES4cZ
	 FO5IpW9Tsym1A==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c263415982eso43148366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:41:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxe+0pXZSaZQIdP2JBO/nrPtXEcArl7XCEpnYyrkBRLN8NP23nBdKab3GItL+fx5SMc4+mbkVZSRlkrOB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJi8uzORIGFGFXyIExZ9kAd1IyUsMA2tqGpAbKQLs7AIDRU+cO0
	5OrIiUQ32kGhaM2u3MzuBYsjgel4QjCu8lsxozQbBfsDvWca16ooa5r0Mfx26N8PrcOwEomwKC4
	+RBRh7112qe+vCDsAqQHP4A701PWXFgMiWV0xB/Gq7Q==
X-Received: by 2002:a17:906:dc93:b0:c46:645f:cedc with SMTP id
 a640c23a62f3a-c46799d0f16mr92139766b.46.1792568515652; Wed, 21 Oct 2026
 00:41:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
 <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org> <20261014195354.GA371161@cmpxchg.org>
 <CAKEwX=Mwc+D+AN-B5T7p=80fqCDijdsiJjd6aN_3YMrEQjyvwQ@mail.gmail.com>
 <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org> <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
In-Reply-To: <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Wed, 21 Oct 2026 00:41:43 -0700
X-Gmail-Original-Message-ID: <CACePvbVbMPZTrD5y=--XgBS+sa4CHb7e4RFTYCbWfzHzVc3vXA@mail.gmail.com>
X-Gm-Features: AclHuK86lyz-XbdDB6Y-j0ii2s8PEPiP-QfZRMCvGYvdiUTKkHpNlLS-aItO5FE
Message-ID: <CACePvbVbMPZTrD5y=--XgBS+sa4CHb7e4RFTYCbWfzHzVc3vXA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Nhat Pham <nphamcs@gmail.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Baoquan He <baoquan.he@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
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

On Mon, Oct 19, 2026 at 5:35=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Mon, Oct 19, 2026 at 5:28=E2=80=AFAM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > On 10/19/26 14:24, Nhat Pham wrote:
> >
> > I'm traveling this week, so it's a bit tricky. I cannot make Thursday m=
orning.
> >
> > On Thursday I'll be traveling back from Cambridge. But hang on.
> >
> > My plan lands on Oct 22, 11:10 PM. I should be home around Friday 1.30a=
m - 2am.
> >
> > I could just naturally join that day.
> >
> > So one day later would work for me.
>
> Would that be too rushed for you? :)
>
> For everyone's convenience, this would be the time slot:
>
> PDT: Thu Oct 22, 5:00 PM

Works for me :-)

> EDT: Thu Oct 22, 8:00 PM
> Europe: Fri Oct 23, 2:00 AM

Ouch, David. If you commit to that, I understand it is very
challenging. Thank you for taking one for the team.

> China: Fri Oct 23, 8:00 AM

Other swap developers: Kairui, Baoquan, YoungJun and Barry, when you
have time, please comment on whether you can make the meeting as well.

I want to clarify one thing: Swap is my hobby not my job. My opinion
represents my personal view as a maintainer, not my employer's. I
consider different users of swap to be my customers. I really wish
some of those impacted customers could join the meeting and speak up
for themselves as well.

Chris
