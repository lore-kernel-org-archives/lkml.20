Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497677;
	b=kJ18/ZiPcgDPOs890BvHv2CGeD3Zrj7aJG2+zws9o2xijBeOSDB1gFPoazfg91Ee7PyK
	 pnOenwtr88dB+tozZnuvqlCa+kbEB0bJd/rOriith6MUdv7VUiijS87JgtXEQl3UoBYC5
	 mupdbS2IO5V0bvZGOgdZJzDFATbCUoJ7NvPKluKkWHSK065l4wmK7Q6CizLZHUGzWmzOA
	 2Kbs0NWDaVbXig3X2ZGHCNfq+byrtgJZdmZqten+SUP8Mg0UXYBGmqnnz9wMBF6ohBBaf
	 MlobYdSjoEhSicfZK4Ly3FN/r3xRyDqTnrq4CuR7rSgs8l5aD+CJZVBcyTLEf0SXkxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497677;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qc/FkddggsQXkWqjuQ7ShmIqvBdY0rJWnjsmpHmDKcM=;
	b=MLuklw52kZlMxkY6V5G1zuOVqMi8WyQYZmPMWk2gGBQ3NrVJP1T2tDghe4XxZfEnSl4a
	 48+G6knUIVkRYN2frG9qFm5B4KXqnr3LN2XMdTRLnE+E0a3ab4/wZu/cheAG9aOAHRao5
	 riHtRz+mxMCbNxj0ZxErnSn1H7Y9UHxglLDjxL385vokbsskHlosc0pR+LlZDAlyHzFXg
	 5FZV8bES034f5Kbttnnj8iU2zJIsJaGJXudzc7giN93KaASIM6JzyjfWsy4p1bc9EMW6h
	 xkOKGoTKMyLlKlMWE//pUF6yaLvT/Gbkbk6zh4+OoWeJ60+nLPB+nwzY3CaqoY9FZtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SJN3cObh;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58609606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58609606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SJN3cObh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qc/FkddggsQXkWqjuQ7ShmIqvBdY0rJWnjsmpHmDKcM=; b=SJN3cObhFwV81L+nWr2WtsaFyt
	ymD3UNYVlMJCQWhEwUpi7HSCqyGJjIQrBK0UEAZD4VbSSR0PAjkvnb5hWXGG9+veNE9XFKIEmZhc0
	w+6d9T+sNJsXaWXtDhejQk/i1cMIcBgrnaPyXB/Tlk5aXVHGEyqbTrtg893CzIk686LcY02g5Wvaj
	7tPKEoVrkJb4cqZDwOFWGBdYJ53g/F0MK41BJRRHOMiVo2lRMNe+Pjqy/yv3FuGHTxsDXnu1WyM+d
	mybvnDM3A/acDxQ1Jy3xyb8idgwOkohJABiYRwqCKq0LvIAoNir5KjAJO7IGCvK4n5CidwpKOJNKS
	nFiPuZdA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWom-0000000AVLo-29HS;
	Thu, 12 Nov 2026 15:34:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4FBD93005AF; Thu, 12 Nov 2026 16:34:27 +0100 (CET)
Date: Thu, 12 Nov 2026 16:34:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ron Economos <re@w6rz.net>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ruidong Tian <tianruidong@linux.alibaba.com>, mingo@redhat.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, oliver.yang@linux.alibaba.com,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] sched: move stack_canary to the start of the
 randomizable region
Message-ID: <20261112153427.GV1779021@noisy.programming.kicks-ass.net>
References: <20260509035014.2220372-1-tianruidong@linux.alibaba.com>
 <20261106160730.GJ1779021@noisy.programming.kicks-ass.net>
 <xhsmhy0b2ntmh.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <34f2ff11-8156-4c32-91dc-e4576807cf3b@w6rz.net>
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
In-Reply-To: <34f2ff11-8156-4c32-91dc-e4576807cf3b@w6rz.net>

On Thu, Nov 12, 2026 at 05:33:16AM -0800, Ron Economos wrote:

> > ---
> > From: Peter Zijlstra <peterz@infradead.org>
> > Date: Fri, 6 Nov 2026 17:07:30 +0100
> > Subject: [PATCH] riscv, sched: move stack_canary to thread_info
> > 
> > task_struct keeps growing over time. On architectures that compute the
> > per-task stack canary offset from asm-offsets.h and pass it to the
> > compiler via -mstack-protector-guard-offset=, this growth eventually
> > pushes stack_canary beyond what the target ISA can encode.
> > 
> > On RISC-V, canary loads are emitted as
> > 
> >      ld	t0, TSK_STACK_CANARY(tp)
> > 
> > where TSK_STACK_CANARY must fit into a 12-bit signed immediate, i.e.
> > [-2048, 2047].  Once stack_canary sits past byte 2047 of task_struct,
> > the build fails with
> > 
> >      cc1: error: '<N>' is not a valid offset in
> > 	'-mstack-protector-guard-offset='
> > 
> > On RISC-V, CONFIG_STACKPROTECTOR_PER_TASK depends on !RANDSTRUCT, thus
> > stack_canary does not benefit from being in the task_struct randomized
> > region.
> > 
> > Move the RISC-V stack_canary to thread_info, and introduce an access macro
> > to point to the right stack_canary location. Other archs are unaffected.
> > 
> > Not-signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>

Signed-off-by: Peter Zijlstra <peterz@infradead.org>

> > Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> > ---

> 
> I'm seeing this build failure on RISC-V with gcc 16 and
> CONFIG_SCHED_CLASS_EXT=y. The build does not fail with gcc 14. I've tested
> the proposed patch with gcc 16 and it builds and boots (on real hardware)
> just fine. So for what it's worth:
> 
> Tested-by: Ron Economos <re@w6rz.net>
> 
> Also re-adding the RISC-V folks.

Hmm, they went walk-about? Do they need a re-sent? I'm thinking this out
to perhaps go through their tree, given they're actually seeing the
problem.
