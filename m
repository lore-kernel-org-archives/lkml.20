Received: from mail-qk2-f7.google.com (mail-qk2-f7.google.com [74.125.230.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBE551FCB0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651041; cv=none; b=SV3+FJQg2YVYtD6xr5Isap4ofW1gKJNsIK3PBY5O7BBcZcU322zWrzS2CzKdIdGeYIFPZJ0riLud0BfsUoCZuAN54eZvE736sjjxe0G2XNxxmAlJ9wh+aAYFx0w1kzwmBkE+kD40HaKpIiPo+djgd8ze7lQKQFZ2nGKnimpFhGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651041; c=relaxed/simple;
	bh=EcHJeYP5GTKRnI2a1t2aAYXBOzj45/EWftqB3gHbb4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8GI/p9PSyFfmr5Qm5PcRLWYsfnd0mOt8XuCrdElE6QEY5j2qHgWMi2y70MOJx4bWoGzKAmLPXTXLTYkgjVQ/yeDVFpmpLzjpIpTyh6NcgQwTHoVB/D2ZZ3j7NLR9rXygkjX7AX8Hf5VzU33WUFW1Y5y1phgO2QirNTpsAqmXvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=UQoDOtaV; arc=none smtp.client-ip=74.125.230.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="UQoDOtaV"
Received: by mail-qk2-f7.google.com with SMTP id af79cd13be357-936b6f4b44dso46852285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1789651037; x=1790255837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TYiGnhlo+OU9YMA0gh1fz1xutnFRgnBy7GWsxB2kBCM=;
        b=UQoDOtaVI0SJr9CXbXhdLXeYtlWhLYcUS/vP4Vo2olTnIy6E19YJ7w+RKBl9VxfuJc
         /D2EY40fLfegq74MHJOMFOFncyT7pSfcROYaGTCOznwwXm5O4ByzKnCZKU+eqXZ7o6Ia
         r6iijvagH416nEgQCJBeDyrESJmcmYNJbM+FXTgUv+5TD31S18fWMEDebNlJsTstP+Ag
         XZ1zqubtSLWPNT0bwIVQVx6sxt9AEAgqY+iH8Z81ee/eBmKD/epfZwv5/SKO4hejNGeJ
         EXJHBYFLRu0vaF6qlhKmxct5Z33AyEwBXWnbqmOZApBqak9QXFH49+DFuymfKGfX1b69
         4zSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651037; x=1790255837;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYiGnhlo+OU9YMA0gh1fz1xutnFRgnBy7GWsxB2kBCM=;
        b=zl/HZKaMRs8kSms4RinNuMcb7Kbb9IdBbLmReRAdXSE0SlB4L5xLZ9a1w7WzOazzqW
         thh07dSctX2Rra79VuqMHwsS/JhhN/HeqAkpg/dnIs4nw1CmxQYIFLb0s4+sGPBpF4r4
         EAF7fxTxaKLW+62hvpTc6gkuMkbIn3T/OJdmYW/rblGeSuYkxKF/1msQkjUbc6wT3wch
         12M3s7cga4p2/UxZO3oN6gLW3wRBRETQGTO6AeTH2bnBnh1PdI0TlsZSX1ShghO1Gys4
         4ETDKFgG164NisaytXtfMWWDUo39bYS+4pOr3pxSVTmqY9fH4a4bIJW9/e0/vx7P5tRz
         vCNg==
X-Forwarded-Encrypted: i=1; AKwUvBx1oD9AVUwqzYydH0T9H+T2GcXFLdfThvgwnFxeui3GwOb5d9YOYuxJZ57Co+/tHl8VJO8dq91ESbzXVos=@vger.kernel.org
X-Gm-Message-State: AFuF++mofDT7xKaTk/eLk9uO9mZn81npq0hdDjLv4i2S1v96Sqdm66xQ
	CL1XZuLa12hZgUY2R6Rxm45BOcEHCWVPQXsjbB14Z+ViaZBFSgMZLM7qb6RsXpGqwmwpRAImLn8
	zsc2jdPjmzg==
X-Gm-Gg: AYBFou2Ms6i2IXDzHeBX757HD8wnVkMDs/TgkbVDIvrpZOvZXa/ZLfLV2eF5lZgKtkl
	AN0IUoTuRM3HruP92Ir5Cx75IBSgPwkTNYJnTn+ilDL3zaoyl8GzBoiEF4aVRe+w8vA9k0GXxpB
	BX7ylXaq7M5FaomPZdfNDuDdLA/mZ+x3dbRxnpcsWMCU5lQQLDFLPIAbGNEodixGnN2Vx5UVoVA
	UeJ/a60XrpAY53tLn0yFxrqI7ImOh5pCCi1Ews+cmTmESLc25mnIMZmAZ45MACtolU+xf4+bnGK
	0sP7KCNm8Yc/EUbDKDn/NuRsqtozO0WT0MhSQeKqhP3K2PnL+m17NOVktXbrrP+aeoc1ZEo2lwN
	25eMW1PEEEHCsDysq13m/bhSZmL408h9JpfREvL38a6Lnp4mO1iChs+vA+7aMeQbFDVMtsz8T09
	DG/P3HeWMpwANKj6+L5irAMpJ4Haap2cn3UFLBy6gz//8M/BZqoW3y2ZIpGmcdcSBHapnzqQ==
X-Received: by 2002:a05:620a:6406:b0:93b:d7a2:83cc with SMTP id af79cd13be357-93bd7a299f8mr48578585a.59.1789651037044;
        Thu, 17 Sep 2026 06:17:17 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:1f35:22b6:fe30:2a34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7821d231sm463905785a.21.2026.09.17.06.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:17:16 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:17:12 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Baoquan He <baoquan.he@linux.dev>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com,
	yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Subject: Re: [PATCH v3 00/14] mm, swap: extendable swap devices (xswap)
Message-ID: <20260917131712.GA1344@cmpxchg.org>
References: <20260916101929.149106-1-hebaoquan@kylinos.cn>
 <aqrHjfHwyEtRIr5S@cmpxchg.org>
 <aquWKJoP5JLP8Ci7@fedora>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aquWKJoP5JLP8Ci7@fedora>

On Thu, Sep 17, 2026 at 03:31:23PM +0800, Baoquan He wrote:
> On 09/16/26 at 12:45pm, Johannes Weiner wrote:
> > On Wed, Sep 16, 2026 at 06:19:07PM +0800, Baoquan He wrote:
> > > xswap is a swap device with no backing storage. Swapped-out pages live                                
> > > in zswap. Its cluster_info[] array lives in a VM_SPARSE vmalloc area,                                 
> > > and the area is grown and shrunk on demand as swap usage changes.                                     
> > >                                                                                                       
> > > The problem being solved is the static size of compressed swap. Both   
> > > zram and zswap need the size fixed in advance, and neither gives memory 
> > > back when the workload shrinks. The solution should be a device whose
> > > size can scale up/down as per usage. xswap does that by mapping the
> > > metadata lazily instead of reserving it for the whole range.
> > > 
> > > Design   
> > > ------                           
> > > - si->cluster_info[] stays a plain array. Access is still
> > >   &si->cluster_info[offset / SWAPFILE_CLUSTER]: no per-access branch, no 
> > >   RCU discipline, no tear-down state machine, no NULL return.              
> > > - Only an initial chunk is mapped at creation. The rest of the address     
> > >   space is reserved, not allocated, so an idle device costs nothing.
> > > - Growth is driven by allocation. When no free cluster is left and the       
> > >   address space has room, the next chunk is mapped and added to the free  
> > >   list. No userspace involvement.
> > > - Shrink is driven by frees. The free tail is scanned, and whole chunks
> > >   are unmapped once the mapped range is at most half in use and several
> > >   chunks can go. One chunk is left mapped as slack, so the next                                       
> > >   allocation does not map it straight back. A ceiling lowered below the                               
> > >   mapped range skips the half-in-use rule and is enforced at once.
> > 
> > If the swap maintainers prefer the VM_SPARSE route, I'm happy to defer
> > to them on that.
> > 
> > However, from the cgroup and zswap camp, two stipulations that I
> > reasoned out in the other thread[1]:
> 
> > 
> > 1. You must not charge compression space as swap space to the cgroup.
> 
> Hmm, I don't have a stance on this. However, isn't this an issue
> zswap/zram have been doing? It feels like an independent issue which
> should be done separately?

If you have 3 containers using compression space, and two of them have
writeback enabled to a shared swapfile, the memory.swap.* controls
need to work to manage fair access to that swapfile. They do not work
if compression space itself is conflated in.

Right now zswap entries actually consume physical swapfile space, even
before writeback. Charging the space is correct. But the whole point
is to decouple compression space from physical swap space.

This is not something that can be done later. It would be a dramatic
user-visible change to how the resource is categorized and managed.

> > 2. You must make the compression space large enough to be outside the
> >    range where users can hit space limits before hitting memory limits.
> 
> We may need a way to define 'large enough' at first.

I've tried to lay this out in the other thread, and highlighted the
usability issues that result from hitting compression space limits
prematurely. It's kind of your call whether you want to seriously
engage with this or not.

But ultimately it's your claim that a static size can be made to work,
so it's on you to make a convincing case.

> >    That also means not allowing setups where this is possible.
> 
> And the limit is only an optional knob. If the admin does not set it,
> the device grows to the full address space, so there is no space limit
> to hit at all. It already behaves the way you want by default. The knob
> is only for admins who want a ceiling, they can use it or not. I hope
> this would not be a problem for your use case.                                                  

No, I've laid this out already as well.

This isn't about "my" usecase. It's about designing a coherent
interface that works well with a large number of usecases, and other
pieces of kernel infrastructure commonly used in conjunction.

The other proposal in the room needs no such interface. The burden of
proof for adding one is on you.

> > [1] https://lore.kernel.org/linux-mm/aqLi6cIjD2wJwk0B@cmpxchg.org/
