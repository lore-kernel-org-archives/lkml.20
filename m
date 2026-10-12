Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297043603DD
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791288; cv=none; b=cP7nlEZsKg/Q9mV3CR/EAdLNFxQVEBghmvL1wahzbiDuvnek7OtK7H3PuXQLMW28vqUOpeqn5ekpFLQcfa73dammG8OF+ykgcvIux2OdXvM0kl8e65SRGFyGt/EAQ0+vWhaQdCeDlqQNLlz6bHIMDxjZlh7ycof0WJMPpZM2JRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791288; c=relaxed/simple;
	bh=zEzFs4aKk6Xfzf60TDLNG6YlxcIStOAudSHifCTjPCg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=n3e/zm2Db61maCOekupxELAP6ee4D64hSUYYmyJy+c6/xQdkwqf17tXNyFe3s0jtX+BOZ6QIIcvIxVl9CDLmvZ7+rOl/t2XOsIFjzfBut94IsTbDjMgKWHJXk0Ucoxphf++nisajMJ643+D6+ktL5ce5X1Yn2xpZJyHpQ8m/X2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Hj8vjdrg; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Hj8vjdrg"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261012074802epoutp032255dcaec97118037e6418f7bd608803~duK2tNc2F2906529065epoutp03H
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:48:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261012074802epoutp032255dcaec97118037e6418f7bd608803~duK2tNc2F2906529065epoutp03H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791791282;
	bh=EZiJpBCaQS/Y7CL4+MDT0WahFVz2znoxPYi7A/ivAn0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Hj8vjdrg+Yja/8/9iEiAk0RdM/Z/qwfCviEnZ+dnJvVHRzhouO7oXSj3f/f4hE7IG
	 9IA6Iet4sbk2XZTbHScMhiHlyt1LcXDYv523B+CKYHar6gX+9olI4AL0x/Vp4tJkM2
	 hvJ4ebLwxI065kcpgpi/YuyGnrbPWwTTxIqc2Kk8=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20261012074802epcas2p3606261995aa73d05264f1c9327f03d88~duK2XaKBh1902219022epcas2p3E;
	Mon, 12 Oct 2026 07:48:02 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4j38hf36cYz6B9m6; Mon, 12 Oct
	2026 07:48:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20261012060557epcas2p4ce5468f159a857c5caf2c81b59cc3f60~dsxt4ZQiS1397113971epcas2p4u;
	Mon, 12 Oct 2026 06:05:57 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261012060557epsmtip24e1a01eb464b1c55e1f4e9f4e11a4113~dsxt0255q0647806478epsmtip2M;
	Mon, 12 Oct 2026 06:05:57 +0000 (GMT)
From: Daehwan Jung <dh10.jung@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list), prashanth.k@oss.qualcomm.com,
	selvarasu.g@samsung.com, cpgsproxy1@samsung.com, Daehwan Jung
	<dh10.jung@samsung.com>
Subject: [PATCH v4] usb: gadget: u_serial: fix stale req->dep warn on
 disconnect/reconnect
Date: Mon, 12 Oct 2026 15:01:53 +0900
Message-Id: <1860250540.01791791282424.JavaMail.epsvc@epcpadp2new>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261012060557epcas2p4ce5468f159a857c5caf2c81b59cc3f60
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Hop-Count: 3
X-CMS-RootMailID: 20261012060557epcas2p4ce5468f159a857c5caf2c81b59cc3f60
References: <CGME20261012060557epcas2p4ce5468f159a857c5caf2c81b59cc3f60@epcas2p4.samsung.com>

When DWC3_EP_DELAY_STOP defers ENDXFER, giveback of -ESHUTDOWN requests
arrives after gserial_disconnect(). These stale requests then accumulate
in read_pool via gs_rx_push(). After gadget exit frees the old endpoint,
req->dep becomes a dangling pointer. On the next gserial_connect(),
gs_start_rx() queues these stale requests onto a new endpoint, triggering:

  WARNING: CPU: 0 at drivers/usb/dwc3/gadget.c:1990
  request 00000000e6e350a5 belongs to ''

  Call trace:
   dwc3_gadget_ep_queue+0x158/0x1e8
   usb_ep_queue+0x60/0xe8
   gs_start_rx+0xa4/0x128
   gs_start_io+0x128/0x254
   gserial_connect+0xb4/0x14c
   acm_set_alt+0xa0/0x114
   set_config+0x22c/0x384
   composite_setup+0x37c/0xc7c
   configfs_composite_setup+0x5c/0x88
   dwc3_ep0_interrupt+0x6c8/0xbcc
   dwc3_thread_interrupt+0xa0/0x1284
   irq_thread_fn+0x48/0xa8
   irq_thread+0x150/0x31c
   kthread+0x150/0x27c
   ret_from_fork+0x10/0x20

Fix by freeing the request in gs_read_complete() when the port has
already been disconnected (port->port_usb is NULL), so that stale
requests never enter read_pool.

Fixes: 937ef73d5075 ("USB: serial gadget: rx path data loss fixes")
Signed-off-by: Daehwan Jung <dh10.jung@samsung.com>
---
Changes in v4:
- Check port->port_usb instead of req->status == -ESHUTDOWN to detect
  completions after gserial_disconnect()
- Drop the read_started decrement, gserial_disconnect() already resets it
- Rephrase the code comment in terms of u_serial
Link to v3: https://lore.kernel.org/all/20260727051335.1745955-1-dh10.jung@samsung.com/

Changes in v3:
- Add missing version tag in subject
Link to v2: https://lore.kernel.org/linux-usb/20260727042632.1726391-1-dh10.jung@samsung.com/

Changes in v2:
- Correct the name of author
- Modify commit subject (panic -> warn)
Link to v1: https://lore.kernel.org/all/20260721013509.2327242-1-dh10.jung@samsung.com/
---
 drivers/usb/gadget/function/u_serial.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc666c4f..917fe0a714972 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -459,10 +459,21 @@ static void gs_read_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	struct gs_port	*port = ep->driver_data;
 
-	/* Queue all received data until the tty layer is ready for it. */
 	spin_lock(&port->port_lock);
-	list_add_tail(&req->list, &port->read_queue);
-	schedule_delayed_work(&port->push, 0);
+	if (!port->port_usb) {
+		/*
+		 * The port was disconnected: gserial_disconnect() has already
+		 * freed read_pool/read_queue and reset the request counters.
+		 * Free this request now instead of queueing it, otherwise
+		 * gs_rx_push() would return it to read_pool and the next
+		 * gserial_connect() would submit it on the new OUT endpoint.
+		 */
+		gs_free_req(ep, req);
+	} else {
+		/* Queue all received data until the tty layer is ready for it. */
+		list_add_tail(&req->list, &port->read_queue);
+		schedule_delayed_work(&port->push, 0);
+	}
 	spin_unlock(&port->port_lock);
 }
 
-- 
2.34.1


