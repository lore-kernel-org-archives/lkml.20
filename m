Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D5556B874;
	Wed,  9 Sep 2026 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960794; cv=none; b=GfHLeh8OnnjTro26AIITFVZfPqFoym3va6PKwOLbKBDJMvrzkUR1FEgoGjPvu9bjFVRWR/0U//ycDL+gHb1BBuANaECTrFxKQX7rgVN5QJkK4VXqM/ll/VRnACkBde+t5Xgx4BXQDxiKDcKDF+KLFF+WXaa+kAX8uyEuTOHaCTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960794; c=relaxed/simple;
	bh=BYoIY0AaNvDwgXGdo58UYWm5M68ku9+Fbguma3mu5pA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mnyx306+eC5qY3wzzfwATrx5SeqMUtncVCFaxCjaxA2s6d4AOk6Yfv79BcakG6wE4sK+QwqdA1ihiYF6KVAUD/R35p3+8ModVZQsDAzD/vy6uSSxUijuQwPt4F50esZM7xtVOgNVHK8VN/7PeJGijucZCsWgK8qnhO6wp33fOtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=nBKNU3zi; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="nBKNU3zi"
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 3A8951401D7;
	Wed,  9 Sep 2026 13:33:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id 416CB17;
	Wed,  9 Sep 2026 13:33:01 +0000 (UTC)
Date: Wed, 9 Sep 2026 09:34:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
Message-ID: <20260909093417.4880999e@gandalf.local.home>
In-Reply-To: <b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
References: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
	<d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
	<b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 416CB17
X-Stat-Signature: ucw1wfijz1nyu7w3kdiubbb4pkxth68c
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19a3meWRnz42A6ERwxaHbVQ+a4s7tr1NQo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=Lat+kLIoSC3PF+K12F2gYq7T2bw5eZWy3BBymoZ7v6Q=; b=nBKNU3ziaeHVl/53ridU2Pt8tb3C707obqZqeVDCZdZVt4k+nPpWiyTlLgR30ehkcZIz6S56b8RI1xscglemO2dgZC/ggqZguNYfWI/G6bNLUguluXR7YvxiRWisrWpcajkn0d/pVTspeVoQKdk2ti7I73DsZ6DqqvAqRdB99Ug=
X-HE-Tag: 1788960781-683136
X-HE-Meta: U2FsdGVkX1/qTTl/bHqRqkmbLb44FYq4tDTYnMJRiEpawvBcvaU2GcA2veKGHVK5HEpsXJZqeqcdk+SUQILB1mOsh1rhfokpE3FKPLzeQnStq8L0mo9f1zsaSYexb2G21IFz76PBv2sYJmFxqhQERtK1cgaMrNE6qpCpqq1NbhdgL7Oqy7tAf5VVEtFrsNA3DAbeRN3QRI8cxSZtEXM9LwqJbaEpeqFBqzaTri8hdrjogpT1YYVKYI7MjFVbZSKwusoSxit4iqhNpW2Z6C+wx9UR6CS2owmnUCZdV3q+fCpR8F9/VasHLTO5j6uKcKN3HcKCboP1+Ft/AQILDBZzX3I65JZfU3e5

On Tue, 8 Sep 2026 11:08:33 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> > > Apparently, the code should instead create another entry in
> > > TP_STRUCT__entry(), and do the double-indirection TP_fast_assign() instead
> > > of TP_printk().  But simply removing the offending double indirection
> > > in TP_printk() gets this splat out of the way of other debugging.  
> > 
> > Indeed, splat has gone after applying the patch.
> > 
> > Thanks
> > Vladimir  
> 
> Does this less hacky patch do the trick?

Nope!


> diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> index 89870175d63561..6477ad3ddc66f6 100644
> --- a/drivers/usb/mtu3/mtu3_trace.h
> +++ b/drivers/usb/mtu3/mtu3_trace.h
> @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>  		__field(unsigned int, flags)
>  		__field(unsigned int, direction)
>  		__field(struct mtu3_gpd_ring *, gpd_ring)
> +		__field(dma_addr_t *, gpd_ring_dma)
>  	),
>  	TP_fast_assign(
>  		__assign_str(name);
> @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>  		__entry->flags = mep->flags;
>  		__entry->direction = mep->is_in;
>  		__entry->gpd_ring = &mep->gpd_ring;
> +		__entry->gpd_ring_dma = &mep->gpd_ring->dma;

You are still saving the address of some memory into the ring buffer.


>  	),
>  	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
                                                                        ^^^^

That %pad dereferences the pointer passed to it.

>  		__get_str(name), usb_ep_type_string(__entry->type),
>  		__entry->maxp, __entry->slot,
>  		__entry->mult, __entry->maxburst,
> -		__entry->gpd_ring, &__entry->gpd_ring->dma,
> +		__entry->gpd_ring, __entry->gpd_ring_dma,

That will read the address saved in the ring buffer and dereference it.

Remember, the above TP_fast_assign() logic gets executed when the
tracepoint is triggered. The TP_printk() is executed when the user reads
the trace buffer. That could be seconds, minutes, hours, days, even months
later!

You can't trust that the memory you are dereferencing will not be freed
when the user reads the trace.

The original patch is not hacky. It is actually the correct way of handling
this.

-- Steve


>  		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
>  		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
>  		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',

