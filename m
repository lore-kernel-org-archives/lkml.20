Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF7F2F7EE8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789967095; cv=none; b=jcv1B8tnimN/WyJVE6DyHJ3k6R4X0rd7yT8uJwWpa3NQOWHveoRpWlRk08rcUnbgRICkdTmfk/zWnj8SkARSMuuQBkNCYD/LxQz02rMNBYoLX8+fT9Cvju8P3CfC/9+P5EIUXl6xrfrhdoWNUjTdHLH1pAKu0fHsIyt9DWG2fYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789967095; c=relaxed/simple;
	bh=SxZcuc9GcxETuDN4Dem/i05+97xrgTmNCvTtQ/Y7enc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=CxDYmRbku2DkuvpRDEi6ODSokc9wxt0fXkwYRk1xuLvuQLK05PVqVeBBG6yG9gHPGJ44Apvzja9tagC86eb/sBtuMccCJfj4DZtTedb742Rr9WlKB3rpgVyVsZJYQbu+sj1opZ2dJSqB1yyOhHkV682Gn9cOZLqjf46qW1ORH90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZeaCbRe7; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZeaCbRe7"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260921050446epoutp02bf98f71336076cac9973cb1fd18ebac9~XPZTOJn0m2888028880epoutp02f
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:04:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260921050446epoutp02bf98f71336076cac9973cb1fd18ebac9~XPZTOJn0m2888028880epoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789967086;
	bh=d0QjUqvmVUNs1ggaTfEs9R1PKNgZmXcKBNFogy3IWTE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZeaCbRe7BTgzeOVxeUDTrR5h1FOeEjPxf5na0sXhC9iovBvJuyeTP8eo9P1lqyLO4
	 +W4W8Q920Xmui6UXLCjqqfWlq1JV6XhnXZC2QrQi8Sbq8BW+I6LQVLNDsay8YB6lFu
	 1PPOzPD9Ngvw6jIrtvJWZCIu7PamOgyT1521+tUQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20260921050446epcas2p342dc4bf247be022411c56129f74a0f52~XPZTC4xBi0320303203epcas2p3x;
	Mon, 21 Sep 2026 05:04:46 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.202]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hpB3x4ySPz3hhT9; Mon, 21 Sep
	2026 05:04:45 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20260921050445epcas2p3615e4d6e209fbe40545e0ebac7a43a68~XPZSKskOl3096030960epcas2p3o;
	Mon, 21 Sep 2026 05:04:45 +0000 (GMT)
Received: from ubuntu (unknown [12.81.221.204]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260921050445epsmtip2a9809c58f286c64510ac656725fe903e~XPZSJCI5Y2089020890epsmtip2A;
	Mon, 21 Sep 2026 05:04:45 +0000 (GMT)
Date: Mon, 21 Sep 2026 14:01:02 +0900
From: Daehwan Jung <dh10.jung@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usb: gadget: u_serial: fix stale req->dep warn on
 disconnect/reconnect
Message-ID: <aqimTFTUGIjijeVY@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260727051335.1745955-1-dh10.jung@samsung.com>
X-CMS-MailID: 20260921050445epcas2p3615e4d6e209fbe40545e0ebac7a43a68
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----rcuXGdnugs8S4waa-1E6HIXGjxa.6k2zyxtbMQI1gQTmk2wj=_525ee_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260727051638epcas2p11f7b91e0be7604331bfe0f46beef9ce1
References: <CGME20260727051638epcas2p11f7b91e0be7604331bfe0f46beef9ce1@epcas2p1.samsung.com>
	<20260727051335.1745955-1-dh10.jung@samsung.com>

------rcuXGdnugs8S4waa-1E6HIXGjxa.6k2zyxtbMQI1gQTmk2wj=_525ee_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 27, 2026 at 02:13:35PM +0900, Daehwan Jung wrote:
> When DWC3_EP_DELAY_STOP defers ENDXFER, giveback of -ESHUTDOWN requests
> arrives after gserial_disconnect(). These stale requests then accumulate
> in read_pool via gs_rx_push(). After gadget exit frees the old endpoint,
> req->dep becomes a dangling pointer. On the next gserial_connect(),
> gs_start_rx() queues these stale requests onto a new endpoint, triggering:
> 
>   WARNING: CPU: 0 at drivers/usb/dwc3/gadget.c:1990
>   request 00000000e6e350a5 belongs to ''
> 
>   Call trace:
>    dwc3_gadget_ep_queue+0x158/0x1e8
>    usb_ep_queue+0x60/0xe8
>    gs_start_rx+0xa4/0x128
>    gs_start_io+0x128/0x254
>    gserial_connect+0xb4/0x14c
>    acm_set_alt+0xa0/0x114
>    set_config+0x22c/0x384
>    composite_setup+0x37c/0xc7c
>    configfs_composite_setup+0x5c/0x88
>    dwc3_ep0_interrupt+0x6c8/0xbcc
>    dwc3_thread_interrupt+0xa0/0x1284
>    irq_thread_fn+0x48/0xa8
>    irq_thread+0x150/0x31c
>    kthread+0x150/0x27c
>    ret_from_fork+0x10/0x20
> 
> Fix by discarding -ESHUTDOWN requests immediately in gs_read_complete()
> while ep is still valid, preventing stale reqs from entering read_pool.
> 
> Fixes: 937ef73d5075 ("USB: serial gadget: rx path data loss fixes")
> Signed-off-by: Daehwan Jung <dh10.jung@samsung.com>
> ---
> Changes in v3:
> - Add missing version tag in subject
> Link to v2: https://lore.kernel.org/linux-usb/20260727042632.1726391-1-dh10.jung@samsung.com/
> 
> Changes in v2:
> - Correct the name of author
> - Modify commit subject (panic -> warn)
> Link to v1: https://lore.kernel.org/all/20260721013509.2327242-1-dh10.jung@samsung.com/
> ---
>  drivers/usb/gadget/function/u_serial.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index cdd1dfc666c4..97ee1b9cb065 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -459,10 +459,22 @@ static void gs_read_complete(struct usb_ep *ep, struct usb_request *req)
>  {
>  	struct gs_port	*port = ep->driver_data;
>  
> -	/* Queue all received data until the tty layer is ready for it. */
>  	spin_lock(&port->port_lock);
> -	list_add_tail(&req->list, &port->read_queue);
> -	schedule_delayed_work(&port->push, 0);
> +	if (req->status == -ESHUTDOWN) {
> +		/*
> +		 * Discard shutdown completions here while ep is still valid.
> +		 * Returning them to read_pool after gserial_disconnect() has
> +		 * reset the counters causes stale reqs (with req->dep pointing
> +		 * to the old ep) to be queued onto a new ep at reconnect time,
> +		 * triggering a req->dep != dep WARN.
> +		 */
> +		gs_free_req(ep, req);
> +		port->read_started--;
> +	} else {
> +		/* Queue all received data until the tty layer is ready for it. */
> +		list_add_tail(&req->list, &port->read_queue);
> +		schedule_delayed_work(&port->push, 0);
> +	}
>  	spin_unlock(&port->port_lock);
>  }
>  
> -- 
> 2.34.1
> 
> 

Hi,
This is gentle ping. Any comments would be appreciated.

Best Regards,
Daehwan Jung

------rcuXGdnugs8S4waa-1E6HIXGjxa.6k2zyxtbMQI1gQTmk2wj=_525ee_
Content-Type: text/plain; charset="utf-8"


------rcuXGdnugs8S4waa-1E6HIXGjxa.6k2zyxtbMQI1gQTmk2wj=_525ee_--
