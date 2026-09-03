Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96254B541B;
	Thu,  3 Sep 2026 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445282; cv=none; b=DwHk/v58Y6b2/rWF9IzG7GO8BT3FnmDr9+PZOn33vig/vVg+rq9y1Q4nMGpFQvzvVqbJoP3UbkwQwjH0+2UhonPOe4Mp1VF0HAtO1G6unG2c8OGTxSobVqRjdFZhz8DuL/GVPv42XrIUK1FHOSZbSoN3KeKkHKTc0w5Js6SFfDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445282; c=relaxed/simple;
	bh=8cgy1pc2fkrTyDrJzHuyoZDQ7Z0SqVHptzw6x82N5pY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1OvJB61TK9d/5mZBhvIYqwOdDBDLHpd6zLjjZZWzcOuvuNYrLT261zY939HB8d07KD3vveA/wxiwyMAg8HgIjkQKi/s3A0OOUC0cXM78pjEJGobrODIavurt8Ueg6WvliH7B6hZ7q6vNKlNiPPDlrjdk1qIPzhYGWvjyVf+mas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=OeTVx8p2; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="OeTVx8p2"
Received: from omf05.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 0EA638028D;
	Thu,  3 Sep 2026 14:21:08 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 1F52B20010;
	Thu,  3 Sep 2026 14:21:06 +0000 (UTC)
Date: Thu, 3 Sep 2026 10:22:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Chunfeng
 Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: mtu3: tracing: fix pointers dereferencing
Message-ID: <20260903102209.7aa79164@gandalf.local.home>
In-Reply-To: <20260804100531.88576-1-m.szyprowski@samsung.com>
References: <CGME20260804100540eucas1p24c59c891e91eeeeea8032d1c80312ea3@eucas1p2.samsung.com>
	<20260804100531.88576-1-m.szyprowski@samsung.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1F52B20010
X-Stat-Signature: bbffphg7oxa6e7rpsgix55ra4nbtu7w1
X-Rspamd-Server: rspamout07
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/iTf2W3ORymql+pkUYrTwc+8yFoyHdvsA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=yishPGcJ2aBgX8f7/aGf43YSeYKU1vTSOdEz/UOhz0Q=; b=OeTVx8p2lxSQogYJ26E1ZhG3n3KKks5OHbZci2y9SKKWyKD0Rrldj5ZjxLjBpvlDgdpkm5WgLfgbRKajQHCn2eD55bDuEuD4vBO8hpYWi3QdZYLkGtNvz509LeLzEkfa+1qCbnN5wnYFCPj56e/Oqa2C65ipdz0ZqHjz3atyD60=
X-HE-Tag: 1788445266-583183
X-HE-Meta: U2FsdGVkX19X7ugC+vbhQ7lmiL4dr1fOYRS9OljPxV5GOhRyMDiZnXFW++NBw5Xkzwgds5f0z5EsyCnNZw8p/UQpt8MK3ohX44nVVlpxESuwo2n6R7Fgm/2eWaSnr5LaeeW5H62kssDdqx/CngttlxmQiA+OszTXiz8C3KLm830NrLGUsrzz6x/lhTlxQelVPtn5U5OM/0SsHPk/JgA93j84x8gXz7D1aHVfOw91L2ostFcRYo3YllfTi9E8odywsm12vTfc5sjM+gXBJ98r4n6PbSsH4uU52wmAIMpo7PcpVh6V1YOjsJ9xHsyola0bEuLv9WGO65W8TKj++sINsyXY6Z3CnGmfY6irKnL0jdnhD1SZD0sSfSX3/ryfM7N9WQenyaqo4uEcsuyuvDlQ2Q==

On Tue,  4 Aug 2026 12:05:30 +0200
Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> Commit b5cc230af5e5 ("tracing: Warn when an event dereferences a pointer
> in TP_printk()") added a warning then printing an event dereferences

            s/then/when/

> a pointer, because it might be already freed that time.

                                        freed at that time

> 
> MTU3 driver is one of the drivers triggering this warning. Fix it by
> storing also the DMA address in the event structure to avoid

        s/also//

> dereferencing gpd_ring pointer during event printing.
> 
> Fixes: 83374e035b62 ("usb: mtu3: add tracepoints to help debug")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/mtu3/mtu3_trace.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> index 89870175d635..b24c6411a8cf 100644
> --- a/drivers/usb/mtu3/mtu3_trace.h
> +++ b/drivers/usb/mtu3/mtu3_trace.h
> @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>  		__field(unsigned int, flags)
>  		__field(unsigned int, direction)
>  		__field(struct mtu3_gpd_ring *, gpd_ring)
> +		__field(dma_addr_t, gpd_ring_dma)
>  	),
>  	TP_fast_assign(
>  		__assign_str(name);
> @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>  		__entry->flags = mep->flags;
>  		__entry->direction = mep->is_in;
>  		__entry->gpd_ring = &mep->gpd_ring;
> +		__entry->gpd_ring_dma = __entry->gpd_ring->dma;
>  	),
>  	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
>  		__get_str(name), usb_ep_type_string(__entry->type),
>  		__entry->maxp, __entry->slot,
>  		__entry->mult, __entry->maxburst,
> -		__entry->gpd_ring, &__entry->gpd_ring->dma,
> +		__entry->gpd_ring, &__entry->gpd_ring_dma,
>  		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
>  		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
>  		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',

Reviewed-by: Steven Rostedt <rostedt@goodmis.org>

Thanks for fixing this!

-- Steve
