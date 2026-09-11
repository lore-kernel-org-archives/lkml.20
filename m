Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F9C3E5ED8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153454; cv=pass; b=izWp9iFqknMA11Gi8r6BHSIByAJhGAmVrseathq6YvLy8kah9Zc9CMm/oJmbXIqioR1FOQw5S4lqVTrM+172CfM/28OxfzdZ/fS4db5UBDzxrfLasuPDHzAxasM3DwSu+l0H6IxR9w0m5D/jksz5xVXDp7QW9mtPMx3rEK+wmXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153454; c=relaxed/simple;
	bh=trX+U7XJlu2wfrqosEL7RKHWRz95q3a0XycwYv9NMmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JS88uUy29vKTG+7k02tzzIWFJv7fefoLKDfErTFl75DGlOqUze8SVMWDthxNNNnMryZWBZTg4t7QpPqpjOc+UUAe1EDdsSDkBwIrLWwURiff2BAZDZ/6CiaSe9vwdUBEnYWU8dzRDyiUgaMBbC1tqk4WEAoFKAjz6D0AJOTJDdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=guED+60N; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guED+60N"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495437bb891so6337795e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:04:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789153451; cv=none;
        d=google.com; s=arc-20260327;
        b=NqErWwlqLI4Ipdg/3Y4Amv5te7FVveh8rKvbpf0d0+NBlhFNNdHsbnbWJQKLshB4o7
         c4PqDJRPx3U/vhgWbzYcAFyf4IolR3PaE6N23jl/VVkE7lBFdNxq1fq2/yMbGkpKSGO5
         DdSFxvT6ihDJK+8s8161RC6xBLv+bITtEkLieZ7uoyJ4NUkt3sszl8CX1gfcgVSmgjfn
         jqBMpQbyfjhRlDw7muaQyIIOWnunGYIIFwP/uBMQniVt3NTU6ZiAkoW8Ly/J6B3ReynI
         1sH2igpBiiZ3peXcO2flhxPr9LwCwPhB1BQNFu+UmGvzQ3KBuYa68UpAb0Ro2cU1Ya5s
         nCKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=trX+U7XJlu2wfrqosEL7RKHWRz95q3a0XycwYv9NMmY=;
        fh=tJFJHpDVazkH1fNSvm0vxjbuwduYeS2kWe1t9fCEiHk=;
        b=g7ZHHVe2hucE16jRSh97vGDZtvoJjqgehPcb+bZXxyLdkETCVh19DQyrC8spGpRuMk
         j6KInvxR7xwpxhFugRlF5n9KUEpa6raB0FbLFBnnZ52Q9cVFn01R7nZSGeJ/5Z2MOjtT
         l6zER2CE0iyAF4C/O6L8O+JF9MsKXHe+3UTzhvfpAYI7FOJsZs4AzyidgD8fLasBqAlX
         5JPAoJj+oywWtuFFpJm8/9NXvtHyq9ZaslJnrbw+XQLCG5TMsmZvSWIm7tuwCmt/lBk6
         0MtbcN3WLAHSb6BA47WbrJ3BhTdBqYxumqYft9+5Mfh13mrx6uomkjIDyO2YI+pH6VC7
         7Dgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789153451; x=1789758251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=trX+U7XJlu2wfrqosEL7RKHWRz95q3a0XycwYv9NMmY=;
        b=guED+60N9+7cL2o6r9EPpthdfQPVqZkG1OXjvqUx2o2JRExpILfXtPPkI/X8ey4as6
         dKsiFfySJHOKnLnBILgFwNydmhCWDXyOoqF92TR0943aJzhX0BIkV6Yecc+VoSPME0J2
         ipvhtsAsUsEjH4XSJ06th4871uh4PJ2ht+2CYBWpWd+6NUjcB+3Ph2d4uQRU5pD7+R+g
         /RDfqZbDUhbcOrEUYXpI6beBmfU7zRCiMrcQZtfPT6XYMOkpmhezMwMxDv6AngTeOWA6
         ISYzeB6suuXFsCZ228rNDj3xuNjmc43QN22rdKP6O+QLyIqm2ghaQ7Ze4A35ELA0XFcM
         Fltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789153451; x=1789758251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trX+U7XJlu2wfrqosEL7RKHWRz95q3a0XycwYv9NMmY=;
        b=DhNWXKOnE0exRluL3OVz82YHTcyOdQlc+Fge8qVSb0i/M2yFipdFBeZE2smPKp6SNI
         4HF2H9iyIRS5lqTEepTsGTIYZTZpmZiUeyXddX4cm0Z81x8fiWRzf0/8qCTSmmS4AauW
         oYnh6k2GlSNcVt9UPQfZUWkNgzeWnbumA4wjrYN+/UtlhWrehQT4JBixcytdJz9dCSig
         5bTkhW9am8RL6k76/1xOhqnaLzsmZ6hnlO8zbyU7bYOug5PHr37T0qsR1++sgcJ5igdD
         mZ9NoUAk5SumjWF6ALRMNbqMJTl5bVktXMaskQgGRJ/qSf2vuDDfCEfAVBx7m78EMt+G
         uDgg==
X-Forwarded-Encrypted: i=1; AKwUvByF2eEQUeAjl8XQ48WHej75OXGf913a+CR20uXvsOdMP0W/bbycUGFlwTkzc+IB9vs9yz0ZMYHtcCep0nE=@vger.kernel.org
X-Gm-Message-State: AFuF++k8k9gNlY8Byotoq+d6I+A05pL7KRZ6G6CJ0HwSVDi9wv37PtsX
	iNA6mqXGpwflbnopVqeRsT+fPOdUF73J1DSLBTjq0B5oU1IHyXacUS1w5s+zMLC8YDqT6qvownE
	S0O21ZW549Mgiawvgegaz2exK0gx9gDk=
X-Gm-Gg: AYBFou3W2vhCcDNB2RggjNnRy2/GwM9euGzKqjfneiXU9BEwZoBTfUdT+qVsyiI3+AE
	scremIxJv1aByZBAev3TMjqAmgqHAmmnx+koj8vxceTVWrpaJqRvdaJnsJTQ1RreRUFBBwFCHW0
	Ij/rcDmS8G2FPFYK6iFUwm2Zm9JTYLyqnYO7/sjV32nJBsMsU54CIhK+UzryTWvDCiNyaVsYUzT
	vjcBL/N3EHQjm2hpPOO5WF+PtNVv1QVhOoZBS+BnJGhmAi1knph98h11ucEe/addD4qnLoBOE4J
	cG+RTLmg8OPIQA2JhntSyDzKU/zRkg17hF80E0xaMp+3s8d1p1QGR2s5erX1P7iQYVUykh08hZT
	bbrOVgpuYbp8=
X-Received: by 2002:a05:600c:3584:b0:49c:ff66:7d88 with SMTP id
 5b1f17b1804b1-49d26d7f8a2mr170508775e9.7.1789153450782; Fri, 11 Sep 2026
 12:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>
 <CAKEwX=O8i+OsP6BJXNZNk07hveN9HDT+PoyMTAU6gOc-xp0Ppg@mail.gmail.com>
 <CAMgjq7BQeQQOZMDPFJ+8LS2N4t3x53r6Nm+9o0_pi92oVUgjgQ@mail.gmail.com>
 <CAKEwX=MS-7C96i4tzBijHN=-xuZgny_wQEa_0YjfHzhoNysdYQ@mail.gmail.com> <CAMgjq7B7Mc7vpQN0gBknsSrfZWXdif5L7nU29YskG9mzS-_jsA@mail.gmail.com>
In-Reply-To: <CAMgjq7B7Mc7vpQN0gBknsSrfZWXdif5L7nU29YskG9mzS-_jsA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 11 Sep 2026 12:03:59 -0700
X-Gm-Features: AcwNN1WTqoBlEbiKI6CdE02QFoxhwTxTh-PKBQg_YuUX7rc2TMIFeAiuSkD6Ytk
Message-ID: <CAKEwX=PxZ68_4240DC8HjcqPRE0bQWGmouoqapqqTQ2b0xqpvg@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Kairui Song <ryncsn@gmail.com>
Cc: YoungJun Park <youngjun.park@lge.com>, Chris Li <chrisl@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
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

On Fri, Sep 11, 2026 at 11:14=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> > Would something like this fix it for you? ZRAM users will not get
> > vswap indirection overhead at all, because it would bypass vswap :)
> > Down the line we can revisit this decision - for e.g, if there is a
> > use case for vswap-on-top-of-swapfile. There might be other interface
> > that makes more sense.
>
> Hmm, this interface looks confusing though. you mean tangles vswap
> with zswap through the cgroup's zswap limit? I originally expected
> this to be a problem solved by tiering, skipping certain tiers seems
> much more intuitive. Maybe Youngjun have some idea here?

It wouldn't be confusing if this is something users don't have to
think about at all :) My point is that we don't have a use case where
we need userspace input on vswap-enablement on a per-cgroup basis yet,
so let's just keep it all transparent. From user perspective, they
enable zswap, and it just works - vswap is just an internal
implementation details.

I have discussed with Youngjun regarding vswap participation in swap
tiering interface in the first version of this new design. It's
technically achievable, but we decided to post-pone that for now until
a true use case comes about - trying to cut down as much code as
possible...

>
> >
> > Potentially, but we have many users at Meta. There's a huge diversity
> > of machine types, workingset size, access patterns (both frequency and
> > file:anon split), compressibility, etc.
>
> You can just set the number as 8PB? :)

Sure, but with the vmalloc-array approach, there is more metadata
overhead even if we have not allocated the backing page of the
clusters yet. This will be annoying on the smaller size machines
(O(dozen of GB)) to also pay the overhead of 8PB-swap space metadata
reservation.

With xarray yeah it's truly just a number limit. Put it as big as it is all=
owed.

The "allowed" part brings me to the next point - not sure if you have
seen my other thread, but I think we need to be even more careful with
this limit - I have found another weird interaction between memcg and
swap subsytem, specifically with the refcount of private id. I think
this is another argument for transparency - this limit is now also
capped on architectural (page size?) and implementational (refcount
type) details of the host and the kernel.

https://lore.kernel.org/all/CAKEwX=3DNYoMH8pTKeCvA=3DXHFmmNVMeDz3mxbhp5q6-P=
xSTJ5wOg@mail.gmail.com/

Seems a bit much to ask the userspace to know all of this. Better to just l=
et:

a. the space grow on demand, automatically.

b. the space be limited by an implementation-induced cap.

all transparent to user (until we have a true use case for a userspace
sizing knob).
