Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793061341;
	b=pvZgxAK/d8I1Xk21RjihriDR9lngr5LNhvWuB1I0OLVL4B0FLSEGq84r2YW0kgMTfgyE
	 haxruVCy8XRryLE+l985BddR2GarQEX3Y0U//hvQPUe4O09gp+e8Wv2KT4J7cdWl2k5lZ
	 Pvg+LlSwc7iV2k2XHTYDFLft4L2RAwaPH9rM59Z9GCb0Ee9csirZA934bvnvL98f2vyVx
	 nNUJIXSME56HFmvyBGO/z242yQCrS3roJ6LW/K3RaQETaeDKSTMt1b9lABOWNOr+K3JBu
	 lQYzaiPeT/Rf6GITziMVS7wiIuZHh4qUQ6UlT58ccBB6XiQvEa3cvuQJ2vcDNYHE29A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793061341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=YSbXQKziGH609nPdZNcIeIXefaI7EIJS50SrA8uijeQ=;
	b=ks3yqOfKG60IMBVzePBfqiQ8ZuTR0/YTXs5vlLFVbujSVixjessDSWPoJ8lPpnCFq9lH
	 pK5VeMkbGJD6wgDehyIIGPIjJLgLz5iWrErIsMLusPfyRqflJBUcWt5Z16TPcXzWO57PO
	 NYp/GcsnuXzj/RgG1/y0wGHVekTyyUrdn7YznmnmcZvRIq1uSXGZ8NW8hVvMdW0NDGwx3
	 0uSGnCfN+iuxw0nkQ8Sj1mILFb+XCOvk1XaViDhkqIHyboDmnL7Qs3biuiDfrey5r0OFV
	 XV79CfKYqajTuArHaNeWdPKK/X+8ZTv0UVuSEewwsaXKGPgLANtZG9NN/t0q7dFFwGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LHmc3JbG;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F6D606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65F6D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LHmc3JbG
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso31834055e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793061339; x=1793666139; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YSbXQKziGH609nPdZNcIeIXefaI7EIJS50SrA8uijeQ=;
        b=LHmc3JbGEqSIFRVjQjBfyVI6IvY9PbFzivwPCiZwa28AAPW+CHT1PEOVVLGzGQFUwm
         nq++EPd5hQtkZ2XCgj+S44panDF9ZDBh9pk5ou2Zx51miV8FR5dSHOR3WFqy+gS46O6A
         Tls/yCrYIuSbCr/i0AhwX6BT9hOC9a0osT0IwSiAVwp1FtjkSDCa1oZP/6Vo1QTH8/gQ
         HAky0x27B0JpZCm9I/6i5OQO/G9zTXjaAWZOLa6xL9VVjTZO5wkcJFpXl93dxHM24xTf
         jmZ0F79frx0SjrlWBRCpPIWVnaFaxbmrMsfmyMEuTZDxVxshGLswwPrU4TCHow4EMUiy
         kDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793061339; x=1793666139;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YSbXQKziGH609nPdZNcIeIXefaI7EIJS50SrA8uijeQ=;
        b=T6OR2BwjxOd8d1n5hGS2KZJxF5iT1Oq3mdWiACSg5GUTZEOEFksaUldkJvD2n7Pg25
         BJ9KYxFSt+usRyMpX41FPr0lsG0/3UxZLUs6MkGMdwRd231d7JD1SDuMon78AVjFJMmw
         7AbFclDJTfNGHiPio9qQgxSwigzG2oAkT7/+OkoKRDihpmYVf07pZJ12vgWu9vl/fpQu
         BAr7wnj7MIWBX1T03sNQ4Fb6uuqtbjdKRveXl3pqKIlAg2SJywjWuFXhCqyVIr5CZgXw
         sv4F6MALWfpk9QzSi4HZg6c0PIjs3VdujthAKLedlTRJQOgtCbhEd8coMjHFvrzudOMf
         FK3w==
X-Forwarded-Encrypted: i=1; AKwUvBzBma08428WlnXExj1oylOzW67UZJU4YIq2hgfbAjosditELRFMJb/OsTDJR66JmNo3yHttOKB3zzIYR3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRLUl4tDlDU1REi1ZlOhyUbOUxza8ETBp3Kc23NsNVQfpInWoe
	T0TjXOT81diD3aActevxVtfrbgqqA46fakHmJmzVyNQz+NqeVIzwLygc
X-Gm-Gg: AYBFou3XWtMY4SXVmhoeuepXcn29qtocTGeni1YI58dSR7uCUUrWeeC3L6CjdDm5Z9J
	Ph8c7jbV8odSkWiaJuu35b+1PEoi92dGPBG49TJcabDOZSCHGaT/uNurrsT2JVOqxp+aghZeTTe
	Oz/mWmQVYvai8TfaaYe9WkNAj6J7ZAAywJvGFdLPMpRBqTy4VvnYPg39XOH+45GJWbrBxHjVvfx
	s5h/tLkx8/bj5EX1HyJhltvubW56AT/Kt4bu+wnz3vegcWbrS0utiVnlaHSWvTt9lmWo3Rsdp0/
	0IsMEVj2+GcO6ZLn9BRyQHZs+VmNgLIcC4u7eo8ARZPvgte/1wZ6erYAzwtUbJ5gVmTjDLaoTbL
	pwM4r574rAMM8T7sZd9ZtZjr9Lmxz/rha8HYneJ0kAwYES+B3Vmp1DkfyTSjdlPiIwaTNYQYpQ1
	9N8sw9iO9ZBwETQNRRV7sZxQW6jXbU1mSIuu09CXaUgpIpPcocSI1EC3C5ewstOC1IGT66lu06D
	nPbweRgJFhVzphk/6pc5TYqehF5eajXtw1IxIg1+HxZ0cGB9RTK8Qv/hllB+VjKLmLNWXFdiQIw
	gwzND4IyQHSKpArRlgWCTKJvPHNAGi0cMyffZx8=
X-Received: by 2002:a05:600c:1988:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4a35ac3caa5mr148009505e9.3.1793061338595;
        Mon, 26 Oct 2026 17:35:38 -0700 (PDT)
Received: from [127.0.0.1] (smal-20-b2-v4wan-173097-cust1152.vm20.cable.virginm.net. [77.97.36.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm597853985e9.1.2026.10.26.17.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 17:35:38 -0700 (PDT)
From: Filippo Falezza <effeffe99@gmail.com>
Date: Tue, 27 Oct 2026 00:35:35 +0000
Subject: [PATCH RFC net-next] net: qrtr: Wake the system for userspace
 packets
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-qrtr-wakeup-v1-1-42b0a5816ff9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNz3cKikiLd8sTs1NICXXODlOQ085RkC1PjNCWgjoKi1LTMCrBp0Up
 Bbs4gsbzUEt281IoSpViIguLSpKzU5BKQmUq1tQCz6zUngAAAAA==
X-Change-ID: 20261027-qrtr-wakeup-70dcf7dc853f
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Filippo Falezza <effeffe99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793061337; l=9511;
 i=effeffe99@gmail.com; s=20261022; h=from:subject:message-id;
 bh=RoFuzO2Bwr6iEMKLrxcbqbCMH3fjrF/rrycmcstcfcs=;
 b=PMrYkvalp8S4Kl2u+HzuZEnyES1xZ36cNyCCXoBQnZ8283FdcywwTjqQE0Bmv9GMt5BJu5CUi
 XNssrYn/1daBLKNav+eFfsukOQc7O6/tdtLwQ/IcLm4aPlSY2Iohae4
X-Developer-Key: i=effeffe99@gmail.com; a=ed25519;
 pk=7PPwl4QILojrh+ATB5QOpvXVmmoxaxyLQhrLRLWEL0I=

On Qualcomm phones the modem reports an incoming call or SMS as a QMI
indication over QRTR, which ModemManager or a similar daemon reads from
a QRTR socket. While the system is in suspend-to-idle, the GLINK
interrupt that carries the packet still fires, since it is requested
with IRQF_NO_SUSPEND, and the packet is queued on the socket. Nothing
reports a wakeup event though, so the system goes back to idle with
userspace frozen and the call rings out unnoticed.

The transport cannot decide this on its own. Reporting a wakeup for
every GLINK interrupt aborts most suspends, because the name service
and in-kernel QMI clients such as ath10k's WLFW keep talking to the
remotes while devices suspend. Reporting only once the edge is
suspended (in its noirq phase) misses the packets that arrive after
userspace is frozen but before that point: on SM7250 a call and an SMS
that arrived in that window went unnoticed until the next wakeup.

QRTR knows who a packet is for. Let an endpoint name a device to report
wakeup events on, and report a hard wakeup event with
pm_wakeup_dev_event() when a data packet from that endpoint is queued
on a socket owned by userspace. Control packets and packets for kernel
sockets do not wake the system: the kernel handles those while
suspending anyway. Decide before queueing the skb, since the socket
owns it afterwards.

In the SMD/GLINK transport, use the rpmsg device of the IPCRTR channel.
It is wakeup capable but disabled by default, and userspace enables it
through power/wakeup for the remotes it wants to be woken by, typically
the modem.

Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
---
Hello there,

this RFC lets a QRTR remote, in practice the modem, wake the system
when it sends something to a userspace client, so that a suspended
phone notices an incoming call or SMS. I'm sending it as an RFC because
it puts a wakeup policy into the QRTR core, and I'd like to know whether
this is the right layer before going further. I know net-next is closed
for the merge window; this is for discussion only.

I ran into this while bringing up mainline on a Motorola Moto G 5G Plus
(SM7250). With s2idle working, the phone slept through every call: the
GLINK interrupt fired, ModemManager's socket got the indication, and the
system went straight back to idle. My first attempt reported the wakeup
from the GLINK SMEM interrupt once the edge was in its noirq suspend
phase, since reporting every interrupt aborted almost every suspend
(the kernel's own QMI clients talk to the modem while devices suspend).
Logging the suspend phases showed the hole in that: a call and an SMS
that arrived after userspace was frozen but before the noirq phase were
delivered to ModemManager's sockets and never reported, and the phone
only noticed them at the next wakeup. QRTR is the first place that can
tell a frozen userspace client from a kernel socket, hence this patch.

For comparison, the downstream kernel this phone shipped with registers
a wakeup source for the QRTR nodes 0, 3 and 7, hard-coded, and reports
a hard wakeup event for every packet from them, control packets and
kernel-socket traffic included. Here the remote is chosen from
userspace through power/wakeup, and only data for userspace sockets
counts.

Keeping it opt-in matters for another reason. Any user who can open a
QRTR socket can ask the modem for frequent indications, so with wakeup
enabled such a user can wake the system from s2idle again and again
and drain the battery. A single event doesn't keep the system awake,
but it does end each s2idle. That is why wakeup is off by default and
only root can enable it, per remote.

I tested it on the phone on top of next-20261021, with a udev rule that
sets power/wakeup to "enabled" on the modem's IPCRTR rpmsg device. Five
idle suspends in a row completed without an abort. An SMS woke the
phone after 90 minutes and again after 9 minutes in s2idle, an incoming
call woke it and rang, and with pm_test=devices an SMS cut the 60
second wait short. The modem's EFS requests to rmtfs wake the system
as well, which is expected (rmtfs is a userspace client) and matches
downstream. While the system is awake, ModemManager's traffic counts as
wakeup events too; it is harmless, but it keeps the wakeup source's
event count moving.

Three things I'm unsure about and would value opinions on:

The rpmsg device of the IPCRTR channel as the place for the
power/wakeup knob. It is per remote, which is what userspace wants, but
it's a transport detail; a per-node setting in QRTR itself would be the
alternative.

Whether to report only while a system suspend is in progress, rather
than for every userspace packet.

The MHI transport (PCIe modems in laptops) could set wakeup_dev the
same way. I left it out because I have no hardware to test it on.

This exact change was tested on the phone on top of next-20261021: an
SMS woke it after 7 minutes in s2idle, a call after nearly 3 minutes,
and three idle suspends of up to 21 minutes ended only on the power
key. The patch applies to net-next (734bef548a96) and builds there
with W=1 for arm64.

I wrote this patch, ran the tests and drafted this note with the help
of an AI coding assistant (Claude Code). I have reviewed the patch
myself, and the results above are from the phone.

Thanks,
Filippo
---
 net/qrtr/af_qrtr.c | 18 ++++++++++++++++++
 net/qrtr/qrtr.h    |  4 ++++
 net/qrtr/smd.c     | 14 +++++++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index e7b3647424b8..5481652cb0ca 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -5,6 +5,7 @@
  */
 #include <linux/module.h>
 #include <linux/netlink.h>
+#include <linux/pm_wakeup.h>
 #include <linux/qrtr.h>
 #include <linux/termios.h>	/* For TIOCINQ/OUTQ */
 #include <linux/spinlock.h>
@@ -460,6 +461,7 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 	size_t size;
 	unsigned int ver;
 	size_t hdrlen;
+	bool wake;
 
 	if (len == 0 || len & 3)
 		return -EINVAL;
@@ -548,11 +550,27 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 		if (!ipc)
 			goto err;
 
+		/*
+		 * If userspace is frozen for a system suspend, nothing reads
+		 * this packet until something else wakes the system: an
+		 * incoming call or message would go unnoticed. Let the
+		 * endpoint wake the system, if wakeup is enabled for it.
+		 * Kernel sockets (the name service, in-kernel QMI clients) are
+		 * served while suspending, and their traffic must not abort
+		 * the suspend. Decide before queueing: once queued, the skb
+		 * belongs to the socket and may already be freed.
+		 */
+		wake = ep->wakeup_dev && cb->type == QRTR_TYPE_DATA &&
+		       !ipc->sk.sk_kern_sock;
+
 		if (sock_queue_rcv_skb(&ipc->sk, skb)) {
 			qrtr_port_put(ipc);
 			goto err;
 		}
 
+		if (wake)
+			pm_wakeup_dev_event(ep->wakeup_dev, 0, true);
+
 		qrtr_port_put(ipc);
 	}
 
diff --git a/net/qrtr/qrtr.h b/net/qrtr/qrtr.h
index de2de69a6199..089302323310 100644
--- a/net/qrtr/qrtr.h
+++ b/net/qrtr/qrtr.h
@@ -4,6 +4,7 @@
 
 #include <linux/types.h>
 
+struct device;
 struct sk_buff;
 
 /* endpoint node id auto assignment */
@@ -12,6 +13,8 @@ struct sk_buff;
 /**
  * struct qrtr_endpoint - endpoint handle
  * @xmit: Callback for outgoing packets
+ * @wakeup_dev: Device to report a wakeup event on when a data packet from
+ *	this endpoint is queued for a userspace socket, or NULL
  *
  * The socket buffer passed to the xmit function becomes owned by the endpoint
  * driver.  As such, when the driver is done with the buffer, it should
@@ -19,6 +22,7 @@ struct sk_buff;
  */
 struct qrtr_endpoint {
 	int (*xmit)(struct qrtr_endpoint *ep, struct sk_buff *skb);
+	struct device *wakeup_dev;
 	/* private: not for endpoint use */
 	struct qrtr_node *node;
 };
diff --git a/net/qrtr/smd.c b/net/qrtr/smd.c
index c91bf030fbc7..e3b2b67dfcce 100644
--- a/net/qrtr/smd.c
+++ b/net/qrtr/smd.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2013, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/device.h>
 #include <linux/module.h>
 #include <linux/skbuff.h>
 #include <linux/rpmsg.h>
@@ -68,10 +69,20 @@ static int qcom_smd_qrtr_probe(struct rpmsg_device *rpdev)
 	qdev->channel = rpdev->ept;
 	qdev->dev = &rpdev->dev;
 	qdev->ep.xmit = qcom_smd_qrtr_send;
+	qdev->ep.wakeup_dev = &rpdev->dev;
+
+	/*
+	 * Packets from the remote, such as an incoming call or SMS from the
+	 * modem, may wake the system. Keep it disabled by default, so that
+	 * userspace enables it only for the remotes it wants to be woken by.
+	 */
+	device_set_wakeup_capable(&rpdev->dev, true);
 
 	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
-	if (rc)
+	if (rc) {
+		device_init_wakeup(&rpdev->dev, false);
 		return rc;
+	}
 
 	dev_set_drvdata(&rpdev->dev, qdev);
 
@@ -85,6 +96,7 @@ static void qcom_smd_qrtr_remove(struct rpmsg_device *rpdev)
 	struct qrtr_smd_dev *qdev = dev_get_drvdata(&rpdev->dev);
 
 	qrtr_endpoint_unregister(&qdev->ep);
+	device_init_wakeup(&rpdev->dev, false);
 
 	dev_set_drvdata(&rpdev->dev, NULL);
 }

---
base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
change-id: 20261027-qrtr-wakeup-70dcf7dc853f

Best regards,
--  
Filippo Falezza <effeffe99@gmail.com>

