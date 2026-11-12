Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794518460;
	b=D/sC/YVGa0RrCJwPU3NSwg4rolRHBakJlfIvVpwVHBNTMhEhqBBxNgumnh2+mrDSINLL
	 AT6siC0t2Lw3ry93hkub2lAYluY2RTjgjKxp0X7Cmi4Fqzg/a3zFt/6eRDTRml+2Zeah6
	 ujU6wudispX83kVb3Keh9qoyVdxDFojXcobugUHPcJsBq32owpvwaU0erEekcTHn8RK+B
	 p6ChqecWrEu/PSseNI7oNbBEd623aGeF+/Rbqe0FuYIPZTeKC1iveW/kLsicxJKJq3xej
	 2qtOJVQcdK7qQpkACCQJxan9gJTInH5rHLoD/ozl3XJrWV64w4YuB0v71fi532GtM5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=3+bQ1zQpnSC2gph5DKJ41cDVxSj9AD/66mgtcKZOk5Q=;
	b=U+BNnT5kDfRBaEIn14r6rc8aVFBUh+Ve+bUMjT5PS9Ox8f/j0Ruz+WFS4CRc5ou7vsvZ
	 apS4QX2pFnwb6b1VZ+VcbWHnmgyjQCdxJr00LB+xoLVn9uVTFzubWSThW7BB4oJ6uOyF7
	 udl3iysOopEa9ojTrgD//2CEfcUKs5/PZkwjoxckXVdgYVZySVyj5aA7MxpeEPi4kn35i
	 Ye5M50SXbwL1RCGmLtoGLwzoM3e6R1gr5N4g/RR4kX93KoGPr0OHZ0zMFL+n0UIWV1+gP
	 yHmlHloeGHm72C1wUKjiHjmZJn0JeRA4E/8SG3zTvA8FxotQBntN3HSIIDzbDgaNuLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m7QtNCmX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31215606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31215606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m7QtNCmX
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e10a70540so90581f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:21:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794518458; cv=none;
        d=google.com; s=arc-20260327;
        b=JCl2aKX3IZkKZEFcaFlvPSPO5Rhxtoh4o1vcwnaF1pP1fptuidZnEJfqEIbgggYqJK
         BCkOl2K5zxndzTGg+5jr0FdpfwV01PSh09owvUC75gL7bVCroDnEsSbR//QoonrO0wdQ
         TNkyrTQw3kPWGrDgGqJVo1cJ/bvJCLvcZ99Mdo+4/Xv3DnA0sokFhf/WMA5J4b3M9k7a
         iVT2M7Amrio1YGHfyS+xztQ9VpLi75hr1MBsAsaToQh3iNGsM/dsrbRVUHpfdQYsbMSK
         Ak7AzdkiQI3UjVkFXlivTyGE4N7JqF2V4WLDQ97YdtNZpa0S6pgNHZ0Bi9DC9OS+6e38
         8kVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3+bQ1zQpnSC2gph5DKJ41cDVxSj9AD/66mgtcKZOk5Q=;
        fh=rJgh4BUHths+y/OHW/XtLDgc853qdnyjelc0Sty7rr8=;
        b=LH9ieRDKVQUeVdZAfHXhyJiTguTe0MB1tLnQOjIKjyWKWD5F4TehDYFYoaa2C56iKX
         Ci6kCLNbfH+z1ekHPsm82C9NkEY0ku+GF7kVEiWHxdkYG8aGvZsuguNEnqh/lQdvRSc6
         dkEYIf/3sska8kZfHE7xlfrwMk9y6iItpvWcoBy2ADeFF6gAIJ/aeTLc0qcahyzTpeZB
         7P+RzdUjVmYw3uCB0i7IynO1UKblhFlucPxzBofRs/XnleJp3j5JcNEV6k5Tgfw2Zr83
         Zo+iI391Z+jttQeSlJxKBRQniTxZH4j7wzMO/AdmU1YPHhFdMxwQc877OmFJJZp8xtyV
         dMng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794518458; x=1795123258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3+bQ1zQpnSC2gph5DKJ41cDVxSj9AD/66mgtcKZOk5Q=;
        b=m7QtNCmXJrY0pmHBOV/LrWFro/YK0Zy1oao/yZh9WD3uPrlrPRcXApQKWfuNstnJ1C
         efKHhNd+pv1Ga0uAgVOBDH3f3Xy+q0Lxn3KTtVrzovg+57dt2dAnvsmkf+sfKoK1N1UL
         KA0bn48dCQAVaBG8YsRIZYr4lQNV6PoAcV93v3yM4RcTJ3sI3l88Ffpewh2w6YMq7prV
         lvUwII2YOTRRjKSyCKbUXURGxhSNlE0rcTS2AVbSjQFArOJqhjx0QcfHD0Ol6YVWUMI2
         tOiQR9Q20JRGYVIi839RqBntL4IAHSha1iKRHX4cbh7i2OCp/i3nNn3Apn/6pKiWSK6q
         kSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794518458; x=1795123258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+bQ1zQpnSC2gph5DKJ41cDVxSj9AD/66mgtcKZOk5Q=;
        b=LR+HOhr83KQc8OMZ3tbtOrFy7UxpDYKHG/eCYmGXmYmV0BJEqulZD27QRLA6F7vbqa
         g6j9v79W629HBgRHar9NIOXzURymqb+hsdy9b0lgG57MXZwhSQvuJGosTAaiJTuoxt2s
         c3SIQmgIx7JLJwcNr7s3p/v0IeLeuOubam39HMgJuO9jJApDMSC6ivScCjTft9Omk6bs
         jnKX27K8ewjm9tsTTyX1XS76rsOfCZYNak1qGiO8UJFKIuFY+pCyeDvMZcSy7MDLQ7Kc
         EDyXv/cIiqOj7I6Wigjs3Kf0yGYxDuIzzD62kFNvjBvzaRiqcUZHiO8GZkKjDMsTjnXo
         VyBg==
X-Gm-Message-State: APuU4Z/bhN5LzZ7KQbyXIucx3QxrpTyMokhX2rrHea0pZqoyFc4mIrq9
	7UPhxV+eOEYbz/QHoGzL9A2OV8nugKRWIlubwVm3g3qU7+oAaGMTjTNyOdLxSzW5HUKLYF5/tQG
	bfiXUiFG8ze26W+wn/2v6EhMPbuK4ugU=
X-Gm-Gg: AYBFou0Dz6jmUHnUXwhXT/uUNUZrxQukAZ2yT0jdA5t410YUt4/QogGKUn+yVpdDraN
	78BIu9xl10oe+7uj2puvK/tkbgqC68fXK/FaStyxBlojH3CzDaF1adEEh01jVIHUPT9/s6FHA4Y
	F8soBXX47Qhoyd0nIbgs8a/sspHzxwu+uFWsxqmYuDb6SzwJtyph1iSurZPK7kDJdCEDleHBdVe
	Mu/GpuCyUjnpfxegRc7mLUIheF0/hfwJFnjwHfdXeanTdV75K5WnRIpeQFH8rxd9QI6UpXs4N0b
	3pRAvE3/MqiSDIksMJcr01c/4ao3a/ao8zxKPezuLVd338ryu1ZWS/0HUkHgr5P5QPdP5kBjaMp
	BqmjlYzRyGSLPhIMLN8FLEWY9R8QpBCWlHdowGmFOkY+zAwcb2e+sFSwYofHTsG1TSaksk6Pp1c
	923UtGThcmcgdG7L7o5Sw0NjAScL4ZLuof0e2cPSQ=
X-Received: by 2002:a05:6000:4553:b0:492:d8c2:7fcc with SMTP id
 ffacd0b85a97d-49c7316495amr847969f8f.11.1794518458411; Thu, 12 Nov 2026
 13:20:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260813-migrate-rmap-batch-v2-0-3c5424c555c7@amd.com>
 <CAJnrk1ZkhvyGLUyZrf_gA3XBv1XTfHArGOMgqr=5XbSCBJHz4Q@mail.gmail.com> <2ed65a57aaa676a59651abd671f18dc9b55f9195.camel@amd.com>
In-Reply-To: <2ed65a57aaa676a59651abd671f18dc9b55f9195.camel@amd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 12 Nov 2026 13:20:45 -0800
X-Gm-Features: AclHuK8puMc590udg5ez_riNBORT-fzpcDwPqPA6P2g1nr93_9dn3rTPcwxK2Vc
Message-ID: <CAJnrk1ZjM+cs1XH=fhmGW1-EtthW52hoqxua1dw43mopXCW6pA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] mm: batch rmap walks during large folio migration
To: "Garg, Shivank" <shivankg@amd.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kmanaouil.dev@gmail.com" <kmanaouil.dev@gmail.com>, "rppt@kernel.org" <rppt@kernel.org>, 
	"weixugc@google.com" <weixugc@google.com>, "byungchul@sk.com" <byungchul@sk.com>, 
	"rakie.kim@sk.com" <rakie.kim@sk.com>, "vbabka@kernel.org" <vbabka@kernel.org>, 
	"harry@kernel.org" <harry@kernel.org>, 
	"ying.huang@linux.alibaba.com" <ying.huang@linux.alibaba.com>, "riel@surriel.com" <riel@surriel.com>, 
	"david@kernel.org" <david@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"matthew.brost@intel.com" <matthew.brost@intel.com>, "surenb@google.com" <surenb@google.com>, 
	"rientjes@google.com" <rientjes@google.com>, "kinseyho@google.com" <kinseyho@google.com>, 
	"Rao, Bharata Bhasker" <bharata@amd.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"gourry@gourry.net" <gourry@gourry.net>, "ziy@nvidia.com" <ziy@nvidia.com>, 
	"usama.arif@linux.dev" <usama.arif@linux.dev>, "dev.jain@arm.com" <dev.jain@arm.com>, 
	"jannh@google.com" <jannh@google.com>, "liam@infradead.org" <liam@infradead.org>, 
	"mhocko@suse.com" <mhocko@suse.com>, "ljs@kernel.org" <ljs@kernel.org>, 
	"lance.yang@linux.dev" <lance.yang@linux.dev>, "joshua.hahnjy@gmail.com" <joshua.hahnjy@gmail.com>, 
	"apopple@nvidia.com" <apopple@nvidia.com>, "fvdl@google.com" <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:37=E2=80=AFAM Garg, Shivank <shivankg@amd.com> w=
rote:
>
> On Tue, 2026-11-10 at 16:08 -0800, Joanne Koong wrote:
> > On Wed, Aug 12, 2026 at 9:24=E2=80=AFPM Shivank Garg <shivankg@amd.com>=
 wrote:
> > >
> > > Migrating a PTE-mapped large folio currently walks the folio's rmap
> > > one page at a time. It does so twice per migration:
> > > 1. try_to_migrate_one(): Replace present PTEs with migration entries
> > > 2. remove_migration_pte(): Restore migration entries to working PTEs.
> > >
> > > For a folio with N contiguous PTEs, each walk repeats page_vma_mapped=
_walk()
> > > and the associated operation per subpage of the folio. (256 iteration=
s
> > > for 1M folio).
> > >
> > > This series enables both walks to process a batch of consecutive PTEs
> > > that map the same large folio and do some refactoring and clean up on
> > > the way.
> > >
> > > Performance:
> > >
> > > AMD EPYC ZEN 3, 2-socket system (1 node per socket).
> > > move_pages() migrating 1 GB from node 0 -> node 1, throughput
> > > in GB/s:
> > >                        batch-         batch-restore
> > > folio     vanilla       restore-only   + unmap         restore%   res=
tore+unmap%
> > > 4K        2.96=C2=B10.15     3.02=C2=B10.14      2.99=C2=B10.17      =
   +2.2%    +1.0%
> > > 64K       5.99=C2=B10.10     6.12=C2=B10.08      7.65=C2=B10.16      =
   +2.2%   +27.7%
> > > 256K      6.48=C2=B10.09     6.67=C2=B10.08      9.23=C2=B10.14      =
   +2.9%   +42.4%
> > > 1M        6.76=C2=B10.10     6.98=C2=B10.10      9.74=C2=B10.19      =
   +3.1%   +44.0%
> > > 2M       10.50=C2=B10.20    10.44=C2=B10.16     10.67=C2=B10.21      =
   -0.5%    +1.6%
> > >
> > > In plain migration, the folio copy itself dominates the cost, so thes=
e rmap walk
> > > savings are only partly visible end-to-end.
> > >
> > > When the folio copy is batched-copy and offloaded to DMA engine [1], =
the copy is
> > > no longer the bottleneck and rmap-walk batching translates into much =
larger gains:
> > >
> > > This series + [1], DMA Offload on PTDMA (DCBM), 16 channels:
> > >
> > >                     batch-copy                      dcbm+restore
> > > folio    vanilla    -offload(dcbm)  dcbm+restore    +unmap          (=
rmap batch impact)
> > > 4K       3.05=C2=B10.13   2.76=C2=B10.11       2.77=C2=B10.12        =
2.74=C2=B10.09
> > > 64K      5.85=C2=B10.11  10.66=C2=B10.27      11.56=C2=B11.45       1=
7.55=C2=B10.56
> > > 256K     6.26=C2=B10.08  13.64=C2=B12.73      13.68=C2=B10.16       3=
4.76=C2=B10.57       (2.54x)
> > > 1M       6.58=C2=B10.08  14.25=C2=B10.07      15.27=C2=B10.77       4=
4.28=C2=B10.27       (3.11x)
> > > 2M      10.61=C2=B10.24  65.26=C2=B10.96      65.25=C2=B11.65       6=
5.66=C2=B10.87
> > >
> >
> > Hi Shivank,
> >
> > Are you planning to send a v3 of this series? My reason for asking is
> > because batching the unmap also fixes an existing issue where when
> > try_to_migrate_one() unmaps a PTE-mapped anon mTHP one PTE at a time,
> > the folio looks partially mapped partway through and gets flagged for
> > deferred split. My mTHP underused shrinker series [1] makes this more
> > common since every underused mTHP split will now go through this path,
> > which makes this bug a blocker for the series. More context can be
> > found in [2], which was my attempt to fix this bug, but then David
> > suggested we fix it in a better way by batching, and Zi pointed me to
> > this series.
> >
> > Thanks,
> > Joanne
> >
> > [1] https://lore.kernel.org/linux-mm/20261103212004.1356327-1-joannelko=
ong@gmail.com/
> > [2] https://lore.kernel.org/linux-mm/20261109220958.2071687-1-joannelko=
ong@gmail.com/
>
>
> Glad to hear this series helps your use case.
>
> Yes, I'm working on v3. I slowed down on it because it depends on
> Optimize anonymous large folio unmapping series [1], which hasn't been
> merged yet.

Thanks for the context.

>
> If it helps, I can send v3 sooner, addressing the v2 comments, rebase
> on the current tree, and split into unmap-side and restore-side series
> for easier review.

That would be great! The unmap side is the part that fixes the
deferred split issue for me.

Thanks,
Joanne
