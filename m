Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA92F4A2615;
	Mon, 21 Sep 2026 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999254; cv=none; b=O0jkRmhDlO9z0x4RK4kwNNi5QNNlyu7XrONW91xYVHP4MK4dduoD4wscJKaeFxqRc1JCkUCF1OnGWpP5LZU0cA3Wg8fyz8Ust7qTSvuixBUL25i8zHAfvYWGDfK1y0+53VMQj+naxEFbj2fssHZ6SaCjjyksjBEZDVMlicOd+E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999254; c=relaxed/simple;
	bh=196CWRrTsBXNGEh3O1halF0+Yb/A+7t5R7xVTmSSTuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p37uEWGmNlS6vftKSBO+5WS5uoXRuVdS9Ah0xtWKICmaYH3OJSbXwy5k4ApIwMjwDVNvXysNgfbDX/T+UDPz2eM0QGo+gVs+jcyke6W9iZEiRxr4ZOPnhHp42rRZYLLJDvkOh6fAwpetvTf7gqMo10VzbX1kiFWEpTpG34t6SD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RIH1OhFf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RIH1OhFf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A6651D13;
	Mon, 21 Sep 2026 07:00:48 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A03C33F528;
	Mon, 21 Sep 2026 07:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789999251; bh=196CWRrTsBXNGEh3O1halF0+Yb/A+7t5R7xVTmSSTuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RIH1OhFfFFabunQv0YPirHG+CsJ71/CgYQj6MJ4sSGsVQuJMZyLB4jJmRSzQ1LE2K
	 rDCaxiiaeeqFrS4tkZ+PYRwgV01eC7wlP+F6GgTQZZnRsOz7ERB9k7nxd8o4rA2K2p
	 j0e+0RpvqbHK5mmk+msSNDIq0m0LAKukZXJLpUeI=
Date: Mon, 21 Sep 2026 15:00:45 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>, paulmck@kernel.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
Message-ID: <arE4jcn4dCD9gos_@J2N7QTR9R3.cambridge.arm.com>
References: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
 <d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
 <b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
 <aae79c1c-8738-4b97-b1b9-d82d19d82d49@arm.com>
 <20260909093524.249c2a1a@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909093524.249c2a1a@gandalf.local.home>

On Wed, Sep 09, 2026 at 09:35:24AM -0400, Steven Rostedt wrote:
> On Wed, 9 Sep 2026 11:31:28 +0100
> Vladimir Murzin <vladimir.murzin@arm.com> wrote:
> 
> > I've done a little bit massaging and here is what worked for me
> > 
> > 
> > diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> > index 89870175d635..4d4bae25fa1f 100644
> > --- a/drivers/usb/mtu3/mtu3_trace.h
> > +++ b/drivers/usb/mtu3/mtu3_trace.h
> > @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> >                 __field(unsigned int, flags)
> >                 __field(unsigned int, direction)
> >                 __field(struct mtu3_gpd_ring *, gpd_ring)
> > +               __field(dma_addr_t, gpd_ring_dma)
> >         ),
> >         TP_fast_assign(
> >                 __assign_str(name);
> > @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> >                 __entry->flags = mep->flags;
> >                 __entry->direction = mep->is_in;
> >                 __entry->gpd_ring = &mep->gpd_ring;
> > +               __entry->gpd_ring_dma = mep->gpd_ring.dma;
> >         ),
> >         TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
> >                 __get_str(name), usb_ep_type_string(__entry->type),
> >                 __entry->maxp, __entry->slot,
> >                 __entry->mult, __entry->maxburst,
> > -               __entry->gpd_ring, &__entry->gpd_ring->dma,
> > +               __entry->gpd_ring, &__entry->gpd_ring_dma,
> >                 __entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
> >                 __entry->flags & MTU3_EP_STALL ? 'S' : 's',
> >                 __entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
> 
> LGTM,
> 
> Reviewed-by: Steven Rostedt <rostedt@goodmis.org>

On v7.3-rc4 I still see the splat Paul reported initially, and the above
fixes that, so FWIW:

Tested-by: Mark Rutland <mark.rutland@arm.com>

Steve, I assume you were expecting someone to send the above as a full
patch.

Paul, do you intend to send a v2, or should Vladimir send out his
version as its own patch? I assume you're happy with a Reported-by, if
he does that?

Mark.
