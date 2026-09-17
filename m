Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9889E3EF66B;
	Thu, 17 Sep 2026 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636867; cv=none; b=FsQNs+HgOvFx7Ic1cGBAVVigUJg15n02oQrSXCSgd/YOdAST2mfidh5QGmgJVZXa+a1x8xWFIUilvibhmB9G2NCdrrbuIHxxI0oByxowLc98v1Dr06lgCnWhGPQQFR4iEFOC4si24Rw9NEpcqy2EFVwoQQS0w2FkcjvZT+4Sdxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636867; c=relaxed/simple;
	bh=Z+lXhEyf23OR2DhsJeSt8IZPrTRjH8TFzH4FD3NoGqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gk5UD5T5x+xFkCoB0xUtgJRqyuKNwTmd1WHtzb5ceDtZrDry59Z3ipIpF9ql80eNx69cjPy81AIAqOrH6i8bWjvzKAwR8abb9TU97Lo5rGS3bgTiSMrzSZJysvOw37k8k8sWIIRQjdQySzhVkhR0d9ajkhFPYCKVJCrvBxt2QG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsCczny+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsCczny+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AFD1F000FF;
	Thu, 17 Sep 2026 09:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789636866;
	bh=+lZzDFlxX/qVCaVB45kg2QRgxtQ9oAG+1qTOWZYcMP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EsCczny+7qIoZg9X25IIIf15Q3rgwyinkDrYQqFLxdXtNwzshlx8+eDvg4hMMM9SB
	 kSW/9JqA+ioqE/6mlTMtmcXBW5jlKLaZqr6oI+rm14s6hHAkc7uVh4LuklzM7n+jPf
	 JEkf5CZniH2PfZ+62wsnjLXOqjMVhmebMa4Ti0dOnS81++sRHEoz9X0Bf+91P6FrBj
	 +IyHsrKcibGCGPGlfQTZVfJvNSgDPQc6x/ZPikbW1+GTxWBVA2xWwtklh/orikypsT
	 YiXjGCtzipfUYooOG1JVKLaxtImrn/VLcxSvW6dS3txPY9bOEFzVllQug3fojFMhWC
	 wtHB1TAmfIFaA==
Date: Thu, 17 Sep 2026 12:21:00 +0300
From: Mike Rapoport <rppt@kernel.org>
To: 758910018 <758910018@qq.com>, Helge Deller <deller@gmx.de>
Cc: Zhenghui Hao <zhenghui.hao@qq.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm <linux-mm@kvack.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] init, hugetlb: fix early parameter ordering
Message-ID: <aquw_N_dSUDy2o1G@kernel.org>
References: <20260917062837.558251-1-zhenghui.hao@qq.com>
 <tencent_0490E1CAA4336214AB70F813325F3020A608@qq.com>
 <178963086483.2200502.14463144472620315064.b4-reply@b4>
 <tencent_B4700AD229B1E6D517FC751924185FD3BB07@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_B4700AD229B1E6D517FC751924185FD3BB07@qq.com>

(cc Helge)

And please don't post on the Linux kernel mailing lists!

On Thu, Sep 17, 2026 at 04:53:49PM +0800, 758910018 wrote:
> Hi,
> 
> > Since parisc is one of very few architectures that does not call
> > parse_early_param() from setup_arch(), I think an easier fix would be
> > local to parisc.
> 
> Agreed, that is simpler.
> 
> Whether a fix is needed at all depends on the answer to your second
> question.  If hugetlb is not needed on parisc anymore, there is nothing
> left to fix and I will drop this series.  If it stays, I will send v2
> with the change inside parisc's setup_arch(), keeping 2/2 so that the
> same kind of ordering problem would at least show up in the log.
> 
> So I will wait for the parisc maintainers on that one.
> 
> Thanks,
> Zhenghui
> 
> 
> ---Original---
> From: "Mike Rapoport"<rppt@kernel.org>
> Date: Thu, Sep 17, 2026 15:41 PM
> To: "Zhenghui Hao"<zhenghui.hao@qq.com>;
> Cc: "Andrew Morton"<akpm@linux-foundation.org>;"linux-mm"<linux-mm@kvack.org>;
> "linux-parisc"<linux-parisc@vger.kernel.org>;"linux-kernel"
> <linux-kernel@vger.kernel.org>;
> Subject: [PATCH 0/2] init, hugetlb: fix early parameter ordering
> 
> Hi,
> 
> On 2026-09-17 14:55 +0800, Zhenghui Hao wrote:
> > hugetlb records its command line parameters from early_param()
> > handlers and consumes them later from hugetlb_bootmem_alloc().
> > 
> > Commit d49004c5f0c1 ("arch, mm: consolidate initialization of nodes,
> > zones and memory map") moved that consumer into mm_core_init_early(),
> > which runs before the generic parse_early_param() call in
> > start_kernel().  Architectures that call parse_early_param() from
> > setup_arch() are not affected, but on parisc the parameters are then
> > recorded after they have already been consumed and are silently
> > dropped.
> 
> Since parisc is one of very few architectures that does not call
> parse_early_param() from setup_arch(), I think an easier fix would be
> local to parisc.
> 
> And there is another related question more to parisc maintainers: do we
> really need hugetlb on parisc these days?
> 
> > Patch 1/2 moves parse_early_param() before mm_core_init_early(),
> > together with jump_label_init() and static_call_init() so that the
> > "parameters may set static keys" guarantee still holds.
> > 
> > Patch 2/2 makes this class of ordering problem non-silent.  It cannot
> > fire once 1/2 is applied; if you would rather take only the fix,
> > please drop 2/2.
> > 
> > Not tested on parisc hardware.
> > 
> > Zhenghui Hao (2):
> >   init: parse early parameters before memory initialization
> >   hugetlb: report cmdline parameters recorded too late
> > 
> >  init/main.c  |  8 ++++----
> >  mm/hugetlb.c | 14 ++++++++++++++
> >  2 files changed, 18 insertions(+), 4 deletions(-)
> > 
> > 
> > base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
> > -- 
> > 2.53.0
> > 
> > 
> 

-- 
Sincerely yours,
Mike.
