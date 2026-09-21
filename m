Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB9E4CA27E;
	Mon, 21 Sep 2026 16:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007298; cv=none; b=pnfuQxRzHxpiO0/sP0VAL8VTI6lnOu0sIZ3go7p2xI3Udarfdnmcmad+DKgThEb9wCsfkt3S/SmWEoWCwYWcOcUxpe3F6mX1LB7eZ4xvdU0ryVkoLdNrAX4ABrSeunOjD/wjp0Ot85GEY1bG1lbQDCguHjyCXds759N0RqY2eUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007298; c=relaxed/simple;
	bh=bCEjgRaOdgMSdftRlwhkCy9n2S+ipGQM7mlawP8clYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIzHT3JP7/EXfYkpiUnA06OpO6ayI0Ohrxnb2o4BU/KDwi3LHQXNzqe8KoY2e6RRYcIPEFo+N9ZFYUTgk02TQtWbBNAeadhRvXC0al9HNKfg9UdfNzYW0x6NwJU83CBRNO5E6RLkh2XnyHe0PxrqkUlhgw67nxOgTSKURPzC3XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMpZMiQe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMpZMiQe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510A71F000FF;
	Mon, 21 Sep 2026 16:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790007291;
	bh=KwVSnrq/0OzzhhquleWQYxz0k/Km6R1PQFNFBtSLym0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=EMpZMiQeitfuWmbUNAH3sknwQ5FqmGj1a/BYuC1ImAHhQwo3Mx+7Z0H+q3mNl5V6N
	 ftBNUhl1hBqxqhmvHUpvZ/UBaEM6qkFwiOfPusvtkUIt9DYjPDQKnnEDhuixMtvVp4
	 Ge8fPRm9ib9NsT5FB45B+oyRw3sVsN+N7g432LezpUaYZEkGKA5lzLFRA0r5+dxr+G
	 zPWCW7oWGFSvirRzoQYTqUIjbjhSGn0cxlpXYyz4ICkjewpnazPrdjLvCxbcji2uJW
	 M6IWwD6ypQVm00g7O60kdpFsfcllqxVM++C+f+Z5uoyqaU81iCAD0ESiSGkV0Yxbvz
	 qHO2m0tloeNew==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 24D1DCE086B; Mon, 21 Sep 2026 09:14:51 -0700 (PDT)
Date: Mon, 21 Sep 2026 09:14:51 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
Message-ID: <297673dd-6bcc-471a-9db0-980da3242339@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
 <d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
 <b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
 <aae79c1c-8738-4b97-b1b9-d82d19d82d49@arm.com>
 <20260909093524.249c2a1a@gandalf.local.home>
 <arE4jcn4dCD9gos_@J2N7QTR9R3.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arE4jcn4dCD9gos_@J2N7QTR9R3.cambridge.arm.com>

On Mon, Sep 21, 2026 at 03:00:45PM +0100, Mark Rutland wrote:
> On Wed, Sep 09, 2026 at 09:35:24AM -0400, Steven Rostedt wrote:
> > On Wed, 9 Sep 2026 11:31:28 +0100
> > Vladimir Murzin <vladimir.murzin@arm.com> wrote:
> > 
> > > I've done a little bit massaging and here is what worked for me
> > > 
> > > 
> > > diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> > > index 89870175d635..4d4bae25fa1f 100644
> > > --- a/drivers/usb/mtu3/mtu3_trace.h
> > > +++ b/drivers/usb/mtu3/mtu3_trace.h
> > > @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> > >                 __field(unsigned int, flags)
> > >                 __field(unsigned int, direction)
> > >                 __field(struct mtu3_gpd_ring *, gpd_ring)
> > > +               __field(dma_addr_t, gpd_ring_dma)
> > >         ),
> > >         TP_fast_assign(
> > >                 __assign_str(name);
> > > @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> > >                 __entry->flags = mep->flags;
> > >                 __entry->direction = mep->is_in;
> > >                 __entry->gpd_ring = &mep->gpd_ring;
> > > +               __entry->gpd_ring_dma = mep->gpd_ring.dma;
> > >         ),
> > >         TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
> > >                 __get_str(name), usb_ep_type_string(__entry->type),
> > >                 __entry->maxp, __entry->slot,
> > >                 __entry->mult, __entry->maxburst,
> > > -               __entry->gpd_ring, &__entry->gpd_ring->dma,
> > > +               __entry->gpd_ring, &__entry->gpd_ring_dma,
> > >                 __entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
> > >                 __entry->flags & MTU3_EP_STALL ? 'S' : 's',
> > >                 __entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
> > 
> > LGTM,
> > 
> > Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
> 
> On v7.3-rc4 I still see the splat Paul reported initially, and the above
> fixes that, so FWIW:
> 
> Tested-by: Mark Rutland <mark.rutland@arm.com>
> 
> Steve, I assume you were expecting someone to send the above as a full
> patch.
> 
> Paul, do you intend to send a v2, or should Vladimir send out his
> version as its own patch? I assume you're happy with a Reported-by, if
> he does that?

I figure that Vladimir's patch supersedes my hack, and so I would be
quite happy with Vladimir sending a formal patch with my Reported-by.

							Thanx, Paul
