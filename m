Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984075540A0;
	Wed,  9 Sep 2026 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966881; cv=none; b=fpRzlrE8fjxyUM+jOfJY+xUpPYNZwp39W0D6eEEHC5G++rlSFpphmWZh+5+FznhFD+mR9iIs+VRMIzdccoAQkb8Zj7+N3gaMokbtn/D2DB3yx00eRzaSlHJgFy/dYvHJRZnsYB5Eneo3LWB+d2acysOWAom2OqebpI487eXUNWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966881; c=relaxed/simple;
	bh=8npCBXpMMx72O1FVfnTCPtoWEDyS6khmpjvCDK3R0LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8yEtF2k0U55jXrq4hjr1VjsaQar9i6444UmAF97p56KqhpTee3cGK1p4QGDJCae1d/zdRgxo9MjqEgFCN/9pGgfZdQOM1Xp4d6m61LWdsu8YXRHAeUdqqoO78anYQHPxl6nKIfOg8OUvMvfQ4DGfIiIQkYrcCnJYtWmO8+VW3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvP3xlxO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvP3xlxO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1311F00A3A;
	Wed,  9 Sep 2026 15:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788966880;
	bh=SWWl36l+kSSIfXjjs43bn9G6WA3Ypw8Y0smzTmvKDFk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=fvP3xlxOqrifu76NmZO+YiYlUB2RhQulCVFW4MwwwwErLJsE20TGGcMoSMbDRT4et
	 hfsOTdOwuCswBL9oBjrqq5eTZwmtrWp1IwbKLxz/zeu48S6zSBwyVfFJd6H/SZfhoY
	 SdwAeLboV3BtSWW8L+xSH6SvdXBGeFIBAhyqTRNVDEwd1tj2QBC2tgLEveywRhxunQ
	 c6wSgnawqWxr0A1QOofuXLNbBRw6g+f/xbGyOc/OlKceDnw5nDxyJSEgmMPlyMta2T
	 Hyb5vfiER9UdQrZDRMeojskYlF0SVYQRAC7zuaEUQMegi86Pn7l/aArvLIr88/3c3i
	 hSD3V62ornSOw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4ED71CE0850; Wed,  9 Sep 2026 08:14:40 -0700 (PDT)
Date: Wed, 9 Sep 2026 08:14:40 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
Message-ID: <0e929dba-7ff9-4d3e-800e-4a77dbd84c8b@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
 <d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
 <b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
 <20260909093417.4880999e@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909093417.4880999e@gandalf.local.home>

On Wed, Sep 09, 2026 at 09:34:17AM -0400, Steven Rostedt wrote:
> On Tue, 8 Sep 2026 11:08:33 -0700
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > > > Apparently, the code should instead create another entry in
> > > > TP_STRUCT__entry(), and do the double-indirection TP_fast_assign() instead
> > > > of TP_printk().  But simply removing the offending double indirection
> > > > in TP_printk() gets this splat out of the way of other debugging.  
> > > 
> > > Indeed, splat has gone after applying the patch.
> > > 
> > > Thanks
> > > Vladimir  
> > 
> > Does this less hacky patch do the trick?
> 
> Nope!
> 
> 
> > diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> > index 89870175d63561..6477ad3ddc66f6 100644
> > --- a/drivers/usb/mtu3/mtu3_trace.h
> > +++ b/drivers/usb/mtu3/mtu3_trace.h
> > @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> >  		__field(unsigned int, flags)
> >  		__field(unsigned int, direction)
> >  		__field(struct mtu3_gpd_ring *, gpd_ring)
> > +		__field(dma_addr_t *, gpd_ring_dma)
> >  	),
> >  	TP_fast_assign(
> >  		__assign_str(name);
> > @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> >  		__entry->flags = mep->flags;
> >  		__entry->direction = mep->is_in;
> >  		__entry->gpd_ring = &mep->gpd_ring;
> > +		__entry->gpd_ring_dma = &mep->gpd_ring->dma;
> 
> You are still saving the address of some memory into the ring buffer.
> 
> 
> >  	),
> >  	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
>                                                                         ^^^^
> 
> That %pad dereferences the pointer passed to it.
> 
> >  		__get_str(name), usb_ep_type_string(__entry->type),
> >  		__entry->maxp, __entry->slot,
> >  		__entry->mult, __entry->maxburst,
> > -		__entry->gpd_ring, &__entry->gpd_ring->dma,
> > +		__entry->gpd_ring, __entry->gpd_ring_dma,
> 
> That will read the address saved in the ring buffer and dereference it.
> 
> Remember, the above TP_fast_assign() logic gets executed when the
> tracepoint is triggered. The TP_printk() is executed when the user reads
> the trace buffer. That could be seconds, minutes, hours, days, even months
> later!
> 
> You can't trust that the memory you are dereferencing will not be freed
> when the user reads the trace.
> 
> The original patch is not hacky. It is actually the correct way of handling
> this.

Very well, "git revert" followed by "git cherry-pick" of the original.
Or someone can feel free to pull in the original from earlier in this
thread.

Either way, thank you!

							Thanx, Paul

> -- Steve
> 
> 
> >  		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
> >  		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
> >  		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
> 
