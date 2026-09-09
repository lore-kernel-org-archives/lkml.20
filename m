Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ACF56E060;
	Wed,  9 Sep 2026 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960854; cv=none; b=tnAvgkcRUguD7S3guLb46oSeYT3rCrczbHWKrkqNJa6gIe4VnWWHasGl5feXzgCNjpnQEvrfzG1HbyL9rkXC35J1BNUUZY3c+qdWt/11vFzfXbUDPiNMwT07w2Br4V8yzlM+hvBNDXceGcenyldl0JVH0NerWx9k7C00qyLj9PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960854; c=relaxed/simple;
	bh=OrvYllrBK2goq5sx/36LbcZn+tW1SCL9FKnNbBJmgls=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u9yRRPPpNgCMEeQx7k8TEAO1c/X8ni9//vt3MH5ZA7umQmvOA+0OsPW6yuILD9qTvUOtMr/jLSS0DJBYW50bJSvCQEjXSp2VEdnWB4pcVZGaAThi2y+nGfZ0SkdeJjiVJ8+ZmVa9nxNE8bLjL+Sm3YuAGQgXNsIKcO1AvJwA8QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=WqDZFr9u; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="WqDZFr9u"
Received: from omf01.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 2B0D1140202;
	Wed,  9 Sep 2026 13:34:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id 225736000C;
	Wed,  9 Sep 2026 13:34:08 +0000 (UTC)
Date: Wed, 9 Sep 2026 09:35:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: paulmck@kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
Message-ID: <20260909093524.249c2a1a@gandalf.local.home>
In-Reply-To: <aae79c1c-8738-4b97-b1b9-d82d19d82d49@arm.com>
References: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
	<d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
	<b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
	<aae79c1c-8738-4b97-b1b9-d82d19d82d49@arm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: rnd4j1prtbzncwyiixer7thtxi9wiujf
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 225736000C
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18VMknN6uc21btZSgsWKOeAnPYKLCAHB7U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=5ggOQs90efSn462XtyiL/osgnkDwSr26I6y3yG1sBZc=; b=WqDZFr9uO+FnJAh9UealHRgeOBXoVVGPts3E4Kmc20vBD42tWF8vkeIonqGDVQm2bjGi/ksHra6VtC2xqdX7P1KqQy0CiI5gu9k0xxWqbuKrIwV/PyrC5rYBwlzAndqHQx28uX0T34luf/QBE0cwRBdUBLlrZKdWw4IglJhePvM=
X-HE-Tag: 1788960848-985795
X-HE-Meta: U2FsdGVkX1+Jcl39xj4Cy7PAKTWsN5gXEKO2psDx7x6EuRK+7AcdjaASvffsrCa3fGC2f8QJVigCvVcwZuBxyQBJij821bINXbUYpgu/4DZgryJIYJX58eoi5y+kyanDheWAJvT32HkW2TPqI2uwwzlVZVSbb+qAHf7BRqAuqgHd6vfJYjyh1OW1Z4yN5ofAOg+L2EKa4LCI6/FMQIkZmho+45mPZKDRRcoi596Pl1/hVFWGXgZjoBC6y7fpP8NWE8eZn7cJF1tyRGGzvmIQ4iRrurIsceps9nPbboCATMd8JP5c9bAorHWPNwjtwKeyBCR0q3pOaZrmz/cAZd+eNcraaV1x3dei7sCmEafG7GtCEOzFexrqX19OPksh36p6pRjDLUMnU3/+GVnxAYgHLWefwhzphbdjebWBvsJPNUSL53H9em0ZNw9T94o+c8qi

On Wed, 9 Sep 2026 11:31:28 +0100
Vladimir Murzin <vladimir.murzin@arm.com> wrote:

> I've done a little bit massaging and here is what worked for me
> 
> 
> diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> index 89870175d635..4d4bae25fa1f 100644
> --- a/drivers/usb/mtu3/mtu3_trace.h
> +++ b/drivers/usb/mtu3/mtu3_trace.h
> @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>                 __field(unsigned int, flags)
>                 __field(unsigned int, direction)
>                 __field(struct mtu3_gpd_ring *, gpd_ring)
> +               __field(dma_addr_t, gpd_ring_dma)
>         ),
>         TP_fast_assign(
>                 __assign_str(name);
> @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>                 __entry->flags = mep->flags;
>                 __entry->direction = mep->is_in;
>                 __entry->gpd_ring = &mep->gpd_ring;
> +               __entry->gpd_ring_dma = mep->gpd_ring.dma;
>         ),
>         TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
>                 __get_str(name), usb_ep_type_string(__entry->type),
>                 __entry->maxp, __entry->slot,
>                 __entry->mult, __entry->maxburst,
> -               __entry->gpd_ring, &__entry->gpd_ring->dma,
> +               __entry->gpd_ring, &__entry->gpd_ring_dma,
>                 __entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
>                 __entry->flags & MTU3_EP_STALL ? 'S' : 's',
>                 __entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',

LGTM,

Reviewed-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve
