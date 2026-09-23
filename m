Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EFA43B6C9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149508; cv=none; b=ek9AbM7VZ95DOnDYO+ZJVPFR5QZhndgSYqDzI0uz9iXv24I9EVjnW+aA4UPKKgS5NO4yRfH2ugFhHjn5hMZEBlb44ooitubS+Ty2FiQ6EwRcMdCvesXh2CT4XhGJsIVdFGDZ17efAzedQZ6FNqoKaSiOKXmwU/t3YuNCm1U+WXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149508; c=relaxed/simple;
	bh=5kPGnkwKHf5Vj9uekTVIiPSJxentpI2NQNaQR9w0bEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=foiFz+WXcl/I6tcdWyIKPPkz06kj4uAmYz5FdLCqWtWzmfmvIeiXZyZ3AaVAvXn4oGvF/ZX53iOTvX/19g7aT6KiKydqEylS+DFw51WFIshXwwEVv6vHew8w9ip9SQw9IJrUilMpc+AGrcIrET4a4Pn1xTCc4kqiGd6xFC/+iTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=C3aGXNlR; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="C3aGXNlR"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260923074503epoutp025a3ffe4c727a2fe891e0afde7062c4ec~X430yUuV_0828108281epoutp02a
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:45:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260923074503epoutp025a3ffe4c727a2fe891e0afde7062c4ec~X430yUuV_0828108281epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790149503;
	bh=Q0a3Jy2hX8cd9bHF+LBi5EmK52t3iU9A/ipL6ZEZ7i4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C3aGXNlRuhcpJOzFtClfilmOHGcVxrqC8Lxm6bsndGSM5ErAcX8WboHnJ1PsVQ9v9
	 5+bCiaxc3iznC0R1ELPeMTdm1JueCXspqs/rZsD5BcKaw4viCGm8eAGdFhg3dLgyVL
	 C7d2mbdccgUuemPnf5budZSgYVxaY2hEtd6STpV0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20260923074503epcas2p382e280a58b0f579646a0ccb1f20ec214~X430iUQ3g2265222652epcas2p3x;
	Wed, 23 Sep 2026 07:45:03 +0000 (GMT)
Received: from epcpadp1new (unknown [182.195.40.141]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hqTWz3FVDz6B9mN; Wed, 23 Sep
	2026 07:45:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20260923073843epcas2p120eba7035d037f820c1621710e46eeb1~X4ySsSI8E3185531855epcas2p1N;
	Wed, 23 Sep 2026 07:38:43 +0000 (GMT)
Received: from ubuntu (unknown [12.81.221.204]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260923073843epsmtip2c9da43ac0b4e2951a90b3f67e6eeb58f~X4ySp8HxP2834028340epsmtip2N;
	Wed, 23 Sep 2026 07:38:43 +0000 (GMT)
Date: Wed, 23 Sep 2026 16:34:56 +0900
From: Daehwan Jung <dh10.jung@samsung.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:USB
 SUBSYSTEM" <linux-usb@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>, cpgs@samsung.com, cpgsproxy1@samsung.com
Subject: Re: [PATCH v3] usb: gadget: u_serial: fix stale req->dep warn on
 disconnect/reconnect
Message-ID: <973576304.21790149503446.JavaMail.epsvc@epcpadp1new>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <229c67e8-aaa3-4898-981e-d15844895b77@oss.qualcomm.com>
X-CMS-MailID: 20260923073843epcas2p120eba7035d037f820c1621710e46eeb1
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----2-A87u3RbSrJ3XvU_rY9Iz3CwCKX-wh1tRaDlfrw5UdaQK4O=_709df_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260727051638epcas2p11f7b91e0be7604331bfe0f46beef9ce1
References: <CGME20260727051638epcas2p11f7b91e0be7604331bfe0f46beef9ce1@epcas2p1.samsung.com>
	<20260727051335.1745955-1-dh10.jung@samsung.com>
	<229c67e8-aaa3-4898-981e-d15844895b77@oss.qualcomm.com>

------2-A87u3RbSrJ3XvU_rY9Iz3CwCKX-wh1tRaDlfrw5UdaQK4O=_709df_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Sep 22, 2026 at 11:37:55AM +0530, Prashanth K wrote:
> 
> 
> On 7/27/2026 10:43 AM, Daehwan Jung wrote:
> > When DWC3_EP_DELAY_STOP defers ENDXFER, giveback of -ESHUTDOWN requests
> > arrives after gserial_disconnect(). These stale requests then accumulate
> > in read_pool via gs_rx_push(). After gadget exit frees the old endpoint,
> > req->dep becomes a dangling pointer. On the next gserial_connect(),
> > gs_start_rx() queues these stale requests onto a new endpoint, triggering:
> > 
> >   WARNING: CPU: 0 at drivers/usb/dwc3/gadget.c:1990
> >   request 00000000e6e350a5 belongs to ''
> > 
> >   Call trace:
> >    dwc3_gadget_ep_queue+0x158/0x1e8
> >    usb_ep_queue+0x60/0xe8
> >    gs_start_rx+0xa4/0x128
> >    gs_start_io+0x128/0x254
> >    gserial_connect+0xb4/0x14c
> >    acm_set_alt+0xa0/0x114
> >    set_config+0x22c/0x384
> >    composite_setup+0x37c/0xc7c
> >    configfs_composite_setup+0x5c/0x88
> >    dwc3_ep0_interrupt+0x6c8/0xbcc
> >    dwc3_thread_interrupt+0xa0/0x1284
> >    irq_thread_fn+0x48/0xa8
> >    irq_thread+0x150/0x31c
> >    kthread+0x150/0x27c
> >    ret_from_fork+0x10/0x20
> > 
> > Fix by discarding -ESHUTDOWN requests immediately in gs_read_complete()
> > while ep is still valid, preventing stale reqs from entering read_pool.
> > 
> > Fixes: 937ef73d5075 ("USB: serial gadget: rx path data loss fixes")
> > Signed-off-by: Daehwan Jung <dh10.jung@samsung.com>
> > ---
> > Changes in v3:
> > - Add missing version tag in subject
> > Link to v2: https://lore.kernel.org/linux-usb/20260727042632.1726391-1-dh10.jung@samsung.com/
> > 
> > Changes in v2:
> > - Correct the name of author
> > - Modify commit subject (panic -> warn)
> > Link to v1: https://lore.kernel.org/all/20260721013509.2327242-1-dh10.jung@samsung.com/
> > ---
> >  drivers/usb/gadget/function/u_serial.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> > index cdd1dfc666c4..97ee1b9cb065 100644
> > --- a/drivers/usb/gadget/function/u_serial.c
> > +++ b/drivers/usb/gadget/function/u_serial.c
> > @@ -459,10 +459,22 @@ static void gs_read_complete(struct usb_ep *ep, struct usb_request *req)
> >  {
> >  	struct gs_port	*port = ep->driver_data;
> >  
> > -	/* Queue all received data until the tty layer is ready for it. */
> >  	spin_lock(&port->port_lock);
> > -	list_add_tail(&req->list, &port->read_queue);
> > -	schedule_delayed_work(&port->push, 0);
> > +	if (req->status == -ESHUTDOWN) {
> 
> Can we make sure this happens only if gserial_disconnect() is already
> executed, maybe checking for port_usb would help.> +		/*

Hi Prashanth K, Thanks for the comments.

I saw read_started = -16 when this issue occured. That's why I suspect
gserial_disconnect() resets it before. We can check port_usb instead as you
said.

> > +		 * Discard shutdown completions here while ep is still valid.
> > +		 * Returning them to read_pool after gserial_disconnect() has
> > +		 * reset the counters causes stale reqs (with req->dep pointing
> > +		 * to the old ep) to be queued onto a new ep at reconnect time,
> > +		 * triggering a req->dep != dep WARN.
> > +		 */
> 
> Nitpick, please rephrase this with content related to u_serial driver,
> we dont need dwc3 driver related comments here.
> 
Okay, I will modify it.
> > +		gs_free_req(ep, req);
> > +		port->read_started--;
> 
> read_started would be set to 0 by gserial_disconnect, so reducing it
> here doesn't make sense. Moreover it might cause underflow in next

You are right. It's better to remove that decrements read_started.
I will remove it on the next version.

Best Regards,
Daehwan Jung

> reads> +	} else {
> > +		/* Queue all received data until the tty layer is ready for it. */
> > +		list_add_tail(&req->list, &port->read_queue);
> > +		schedule_delayed_work(&port->push, 0);
> > +	}
> >  	spin_unlock(&port->port_lock);
> >  }
> >  
> 
> Regards,
> Prashanth K
> 


------2-A87u3RbSrJ3XvU_rY9Iz3CwCKX-wh1tRaDlfrw5UdaQK4O=_709df_
Content-Type: text/plain; charset="utf-8"


------2-A87u3RbSrJ3XvU_rY9Iz3CwCKX-wh1tRaDlfrw5UdaQK4O=_709df_--

