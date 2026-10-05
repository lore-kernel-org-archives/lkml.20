Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62F32D249B;
	Mon,  5 Oct 2026 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215522; cv=none; b=hAy3L6+GuKJplnv+P3MCwjQtMtNEoN1SqddCCWKNBNlfHKengUnEbf1HhtNuEGu5DUTCspgj+26Y01eDYlOEmELGUYmg9r6CqDIu/WxyCwZ20IZlDSdtiWVvmTbJvMi+xR6uHNRCwy+P5pIve8s3BYr+WVQVUpYIIPgOldquzCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215522; c=relaxed/simple;
	bh=R8UYqtxMk66AWUb8jaZ/8sG4L9L0nHD4I1C7nSYILIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ol7ePvHt+pk+uxppYLCsBoempsSrj0RYWCm+Ck5zIKTT7iy4pH1ad2Ce9zgMdZpeczX2zK0tUxTGC3mq7mOmMTLm2sjbONbmB8Savhd+ZU+QfLNrxL4yg+mIe0Mdumm8lWny25m/H3qHko3IlYorFE5Go+UfWZ2zPus57M1JAqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JW4Da7Vm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JW4Da7Vm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE2A1F000FF;
	Mon,  5 Oct 2026 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215520;
	bh=46ZVVigjyvvAf7dNbGOfKkj9CKPHjaCvDzpMNiRjm98=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=JW4Da7VmLg5UlNJuwwbIPkoXPZG/rObH/E7LS2VKa03p4WdEbCdiagTdNmApWu7bM
	 l/W9xN4LA4ajCb1HbFzA7Cj3hcUP4CFZvaXaV2s1EhLZlQkmeicpmRlkhtR6/Ml7Y1
	 Yqz6yMwHgze5wtsGBt7yzRLywVPJ+HRPc3Mhm1wyJZNDZKkcWWs2bl/Hqm0RiS8zQ0
	 sC5iytUf2VMxZWfZspJI1iIFwqLICZdhSTUIBRQow5TYfkuneF5gx/BVAUmQkytmVd
	 jtW2zP34W4AOqsdbWkvPIpmC6ByqG+wqamIfY16+jjx+6hJugIKDWX6iVdOwFsMQxy
	 U1a8sWhEsaoFQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BBC62CE0ACB; Mon,  5 Oct 2026 08:51:59 -0700 (PDT)
Date: Mon, 5 Oct 2026 08:51:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
	rostedt@goodmis.org, mark.rutland@arm.com
Subject: Re: [PATCH] usb: mtu3: Fix double dereference in TP_printk
Message-ID: <2cec51ab-cb71-4635-b14c-ee38c84f3c9d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260922103756.104846-1-vladimir.murzin@arm.com>
 <845ef1a3-8d85-4007-aa2c-05e59e79afcd@arm.com>
 <315259c9-d7b9-44bc-8896-ecb9429a6eb5@paulmck-laptop>
 <b138ae28-bd90-414c-9e57-c493877c9bad@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b138ae28-bd90-414c-9e57-c493877c9bad@arm.com>

On Mon, Oct 05, 2026 at 01:07:18PM +0100, Vladimir Murzin wrote:
> Hi All,
> 
> On 9/28/26 19:21, Paul E. McKenney wrote:
> > On Mon, Sep 28, 2026 at 02:11:42PM +0100, Vladimir Murzin wrote:
> >> Hi All,
> >>
> >> Gentle ping... spat is still present in v7.3-rc5
> > If no one else wants to push it, I can do so.  I gotta admit that the
> > resulting test failures when I forget to apply it are a bit annoying.  ;-)
> > 
> > 							Thanx, Paul
> > 
> 
> FYI, splat is still present in v7.3-rc6 :(

OK, I was thinking in terms of pushing it into the upcoming merge window,
but I could be persuaded to see if Linus will take it this week.  I have
one other commit I need to push anyway.

							Thanx, Paul

> Thanks
> Vladimir
> 
> >> Cheers
> >> Vladimir
> >>
> >> On 9/22/26 11:37, Vladimir Murzin wrote:
> >>> Paul reported kernel splat:
> >>>
> >>> [    0.000000] TRACE EVENT ERROR: Event mtu3_gadget_ep_set_halt has double dereference in TP_printk: &REC->gpd_ring->dma
> >>> [    0.000000] ------------[ cut here ]------------
> >>> [    0.000000] Event mtu3_gadget_ep_set_halt has double dereference in TP_printk: &REC->gpd_ring->dma
> >>> [    0.000000] WARNING: kernel/trace/trace_events.c:420 at test_double_dereference+0x144/0x14c, CPU#0: swapper/0/0
> >>> [    0.000000] Modules linked in:
> >>> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.3.0-rc1 #15247 PREEMPT
> >>> [    0.000000] Hardware name: linux,dummy-virt (DT)
> >>> [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >>> [    0.000000] pc : test_double_dereference+0x144/0x14c
> >>> [    0.000000] lr : test_double_dereference+0x144/0x14c
> >>> [    0.000000] sp : ffffc80aa7633bf0
> >>> [    0.000000] x29: ffffc80aa7633bf0 x28: ffffc80aa7c0f047 x27: 000508b58019388f
> >>> [    0.000000] x26: 0000000000000003 x25: 0000000000000007 x24: ffffc80aa5fceff8
> >>> [    0.000000] x23: ffffc80aa7c0f05a x22: ffffc80aa64edfe8 x21: ffffc80aa7c0fce8
> >>> [    0.000000] x20: ffffc80aa7c0f047 x19: 0000000000000013 x18: 0000000000000001
> >>> [    0.000000] x17: 6572656420656c62 x16: 756f642073616820 x15: 746c61685f746573
> >>> [    0.000000] x14: 0000000000000000 x13: ffff000139d90000 x12: 0000000000000045
> >>> [    0.000000] x11: 00000000000000cf x10: ffff00013f546428 x9 : ffff000139d90000
> >>> [    0.000000] x8 : 3fffffffffffc000 x7 : 0000000000000001 x6 : 0000000000000001
> >>> [    0.000000] x5 : ffff00013f4e6440 x4 : 0000000000000000 x3 : 0000000000000000
> >>> [    0.000000] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffc80aa764a700
> >>> [    0.000000] Call trace:
> >>> [    0.000000]  test_double_dereference+0x144/0x14c (P)
> >>> [    0.000000]  trace_event_raw_init+0x37c/0x5d8
> >>> [    0.000000]  event_init+0x34/0xc0
> >>> [    0.000000]  trace_event_init+0xec/0x588
> >>> [    0.000000]  trace_init+0x24/0x6e0
> >>> [    0.000000]  start_kernel+0x4a0/0x8ec
> >>> [    0.000000]  __primary_switched+0x88/0x90
> >>> [    0.000000] irq event stamp: 0
> >>> [    0.000000] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> >>> [    0.000000] hardirqs last disabled at (0): [<0000000000000000>] 0x0
> >>> [    0.000000] softirqs last  enabled at (0): [<0000000000000000>] 0x0
> >>> [    0.000000] softirqs last disabled at (0): [<0000000000000000>] 0x0
> >>> [    0.000000] ---[ end trace 0000000000000000 ]---
> >>> [    0.000000] TRACE EVENT ERROR: Event mtu3_gadget_ep_disable has double dereference in TP_printk: &REC->gpd_ring->dma
> >>> [    0.000000] TRACE EVENT ERROR: Event mtu3_gadget_ep_enable has double dereference in TP_printk: &REC->gpd_ring->dma
> >>>
> >>> Which also observed by Mark and myself.
> >>>
> >>> The splat it result of new check introduced by b5cc230af5e5 ("tracing:
> >>> Warn when an event dereferences a pointer in TP_printk()") which
> >>> correctly catches issue with %pad dereferencing the address saved in
> >>> the ring buffer. TP_fast_assign() logic gets executed when the
> >>> tracepoint is triggered, however the TP_printk() is executed when the
> >>> user reads the trace buffer which could be seconds, minutes, hours,
> >>> days, even months later and nothing guarantee that __entry->gpd_ring
> >>> pointer will still be pointing to what it was when it was recorded.
> >>>
> >>> Fix the issue by capturing immediate value of gpd_ring.dma when trace
> >>> point is triggered.
> >>>
> >>> Reported-by: Paul E. McKenney <paulmck@kernel.org>
> >>> Tested-by: Mark Rutland <mark.rutland@arm.com>
> >>> Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
> >>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> >>> ---
> >>>  drivers/usb/mtu3/mtu3_trace.h | 4 +++-
> >>>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> >>> index 89870175d635..9aaa167d69c1 100644
> >>> --- a/drivers/usb/mtu3/mtu3_trace.h
> >>> +++ b/drivers/usb/mtu3/mtu3_trace.h
> >>> @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> >>>  		__field(unsigned int, flags)
> >>>  		__field(unsigned int, direction)
> >>>  		__field(struct mtu3_gpd_ring *, gpd_ring)
> >>> +		__field(dma_addr_t, gpd_ring_dma)
> >>>  	),
> >>>  	TP_fast_assign(
> >>>  		__assign_str(name);
> >>> @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> >>>  		__entry->flags = mep->flags;
> >>>  		__entry->direction = mep->is_in;
> >>>  		__entry->gpd_ring = &mep->gpd_ring;
> >>> +		__entry->gpd_ring_dma = mep->gpd_ring.dma
> >>>  	),
> >>>  	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
> >>>  		__get_str(name), usb_ep_type_string(__entry->type),
> >>>  		__entry->maxp, __entry->slot,
> >>>  		__entry->mult, __entry->maxburst,
> >>> -		__entry->gpd_ring, &__entry->gpd_ring->dma,
> >>> +		__entry->gpd_ring, &__entry->gpd_ring_dma,
> >>>  		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
> >>>  		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
> >>>  		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
> >>> -- 2.34.1
> >>>
> 
