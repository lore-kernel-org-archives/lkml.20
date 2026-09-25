Received: from mail-pz2-f30.google.com (mail-pz2-f30.google.com [74.125.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AA043F8C9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790367986; cv=none; b=tHeTZ4pkDoyB517gpYtmh/yudVRCmiol4hFEDslUoO3MAkf/bHMHrMct8dzSJehSm+IeyhIjc5W/s09nR2ZpxXdFGm9h9zy8KtkececLm7PjDGvg+HdLUPLK8615Tdp4AyK3z7M/wCFJnNI5VvG8oTvd/TrdFGjA/fxkWQukOLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790367986; c=relaxed/simple;
	bh=pLWvLgyzJJJqRJXGy0wrLLfUtbLFMrmx5MOMy9q32N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lL4w6ZLwWjgafQ7k2bIIG1aD7GsZTZSV/LuC4uNMvTDj8DzpNPAsPhUpv1xk7mI88RA5IkdH2/uJUImgPQ+aGxfBf5n4PrqQ8HlB55q5sspbva1GxQaqKL4a0ukbUeXKj18/h+OfRDNNMZ5D1baat0nxnQzZ/YKhs7Pkhp6AWZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hszJJ5AC; arc=none smtp.client-ip=74.125.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hszJJ5AC"
Received: by mail-pz2-f30.google.com with SMTP id d2e1a72fcca58-880fcd3790bso322047b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790367984; x=1790972784; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UTHOStho6nRPPrwayEo907rSZvPmwPMNwiUqVSkI8tY=;
        b=hszJJ5AC0xMm4DeciTdFlWq8eiJQ5yzUvUjWhxjHdgE8ja242jDd51bxHtAtBUN5+c
         WVPx0AzpuHYnfkh3ZTECMPcigZsWaUtuH4YozTcrjMPlzncr35PxpmmCv5pVe8c628uJ
         97Gq1Du8f8rf7SzixP7z9bU2JsavCU34KNycpVMKHRxvkydMpFqHpBuEgBxAKOFopXI5
         6g1n1qL/BkcNhxiq/YlB9axR05c8rdEPbU1Rf2o+fEGdflxO4ptA0EuD+OpDh91AeCg/
         7z4+LRPv85EULwAOar7yl3oDtYgd/9FlhaD12VsWzUE959BavgF6s3IMFznofKShx71j
         TxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790367984; x=1790972784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UTHOStho6nRPPrwayEo907rSZvPmwPMNwiUqVSkI8tY=;
        b=B1lN0QzncZiAWmqQuY2Hi5VtMiIzBNIFsEYUvYcXu6ns/CXV1ygM+6eiXW2ArIZVC8
         kEijn94SLp4Fmx6HDWtsWJHIkrtHCtpUhnLcaXBdpQQbcNhjN2B/Z5nVpxaAZdUjrolL
         F3F5HfXVromX+NtBdLvxEkkRXRAXPc77RNvM6huXdpfbMqtb5gCqU2BN+ysQv7GDZy6+
         i0a1drDNqNKdSQLCvAMfs8MVkUo2GX2pZlsylM7DpM0VAAVcX0JIkS9+rPBQb4hm13fg
         wnR9qQnQOzy7ujcnOR7yo1EbTenv+JaUWQj/Sepa0UiSv3ayGYUU4hbcPuV1+xgwvcu9
         Jeog==
X-Forwarded-Encrypted: i=1; AKwUvBzmGb/fr52VY7PUvi8DQIOsqNTDLtNfrzJS633mhayvF4zCEofE+1bXdda7NbLcw6zxDlBh6JaPfzufTck=@vger.kernel.org
X-Gm-Message-State: AFuF++kX2mVJwhaq4uw9naN+aHOqBI3kx6qzZ8n4NtD22G0M0RqYqUCr
	jQZ9yZkHQx1Ufoie6ZtuutNns6SAxqPpa/WuWrgG2Ch0uL6YWM4zm5Nk
X-Gm-Gg: AYBFou1J7IMTInok0ArN0VlTDY/kTswuEO6AwphuJU68v2DG7hRXqPeGTYNcLdDh9wz
	HA1Tr9HCK6QCQRNKGcvpFkbhMrTp8jn7K7GLay9TNqk+dUWdwom9c4NaT4dfI6btGJAwiPl2jeQ
	uemvi3ZGgngA4WlRyuXXfBq5/GRo5OEARVN0kShe5jnG0W6/stIlv3/GyNjQ31j5UK4THDf/S20
	iE0Z8DPm6Wy3Sp2Wvfq/rkQr59vg/TGIjncMOE6vHzOdNfUXrjofJ3LeLaVzrMWdgX1Lr2C/u0U
	b9yL+B4oHuuR6u1cCn+x2/p/e3PKHu0pIayzYk1WREdx8DBDmhMFhL22SIg8QdSScf0MRB0wsH9
	QrVLk06saWY/K82Byir1BBIvAjuIp60splHCEI/8qDwCok/5ObEf8HMLWay8WKUZtoww5ZFmfQA
	pNruACGpur3rEXZZ+QkyqjIpCHWY4y01s4cU6tuRYxqLukfe27rWUtd2V4uGT1HPLbnR6aNCZJ5
	PWJoUTvUGfSHyKliFAYlYKtCFMegrBPzMft05M=
X-Received: by 2002:a05:6a21:8286:b0:3dd:a006:7b32 with SMTP id adf61e73a8af0-3de0e8943e1mr7946963637.49.1790367983822;
        Fri, 25 Sep 2026 13:26:23 -0700 (PDT)
Received: from KASONG-MC4 ([1.203.116.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc790c80e62sm1265849a12.28.2026.09.25.13.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:26:23 -0700 (PDT)
Date: Sat, 26 Sep 2026 04:26:13 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Chris Li <chrisl@kernel.org>, Rik van Riel <riel@surriel.com>, 
	Baoquan He <baoquan.he@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Gregory Price <gourry@gourry.net>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Tejun Heo <tj@kernel.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arbTTKE6nYWlNCLd@KASONG-MC4>
References: <aqjpYHbZ14A8xRtK@fedora>
 <CACePvbUwTxcMPVK_1GAz5gPDdh0BV9JZSnKXaUFLqDHBzBmPQg@mail.gmail.com>
 <7ee199ddee81bf8026688def82f78ad9db09be9e.camel@surriel.com>
 <CACePvbVA+DnDJprMx3qOrGb98y1ORQ-LfaENy_Btfx3uW=E4eQ@mail.gmail.com>
 <f3ca71f1c561f28a341de0e5a1b3f24bd4da3201.camel@surriel.com>
 <CACePvbX5Oy98DygLZjC=Z03Lqb0nk50_OEKQCT9svbQOOwwDew@mail.gmail.com>
 <CAKEwX=Mv+tnL8K4rfPuof6mKaLQp=tqR_qjtKrtY0-5L85FLfw@mail.gmail.com>
 <CACePvbUF2QQMh_GiCNQn-RTmZNkkLWkmaHSYzdQwv2fupjNQiw@mail.gmail.com>
 <arUcil9kxUPiymXI@KASONG-MC4>
 <CAKEwX=PXRB35bUL1=O4Bgx9A7aD4izZZ3dcEcCuMBBhBrMv7fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKEwX=PXRB35bUL1=O4Bgx9A7aD4izZZ3dcEcCuMBBhBrMv7fg@mail.gmail.com>

On Fri, Sep 25, 2026 at 09:54:25AM +0800, Nhat Pham wrote:
> On Fri, Sep 25, 2026 at 6:15 AM Kairui Song <ryncsn@gmail.com> wrote:
> >
> > On Tue, Sep 22, 2026 at 09:44:37PM +0100, Chris Li wrote:
> > > It seems you are talking about a different topic: the vswap charging issue.
> > > There is a golden rule that we should follow: don't break existing
> > > users. At least with the same persistence, this rule should apply
> > > universally.
> > > In the swap tiers discussion, the UAPI was such a big deal that we
> > > couldn't implement new UAPI. On the other hand here we argue for
> > > liberally changing user-space visible behavior.
> > >
> > > BTW, I already shared that changing swap counter charging will break
> > > our and others' existing deployments.
> >
> > Hi all
> 
> Hi Kairui,
> 
> Thank you for your thoughtful response! Lots of food for thought for me :)

Hi Nhat, thanks for the reply!

> >
> > Just for reference. Maybe a seperate counter, tiering, is a better idea
> > than changing the swap counter?
> 
> I think memory.swap.* is never meant to be used as the "offloaded
> footprint". It is incidentally correct, because of architectural
> limitations: zswap/swap cache/zero page usage leads to real
> consumption of real resources (physical swapfile).

It's not that "incidentally" I think? TGhe defination from the function
level seems pretty clear, folio_alloc_swap -> charge. A logical
limitation.

> 
> But I understand your concerns regarding the missing observability of
> the "logical" footprint (i.e the "offloaded size"), and how that would
> hamper legitimate use cases.
> 
> How about a vswap counter that tracks the vswap usage? That would
> provide the "logical" view. Userspace can then monitor and act based
> on it.
> 
> I think that should cover both of the situations that you (and
> Johannes in [1]) pointed out:
> 
> (1): With memory.current and this vswap counter, you can kill any
> workloads that violate the level of overcommitting that you set out.
> 
> (2): For us, we can use memory.swap.* counter to provide isolation to
> the physical swap space, which is a real, static resource that can be
> hogged.
> 
> There will unfortunately be changes in userspace programs/scripts that
> is required. It's unavoidable. We're adding a new behavior. It's the

Right, but usually I think adding new things are generically considered
better than breaking existing things, unless the existing things are
either just metric, or really broken. But memory.swap seems has a pretty
clean definition and implementation, and usage?
