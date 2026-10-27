Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113127;
	b=dZIMb7Hme/rmpJgBDDEIzObD99uQSLi0gmV4JmCHZKVUNjMWSDIZJHLW52lIjRJ4Vz0u
	 xjtxWERsfkIPnQPrfdUmchIf+hPTlscz3VG3clMjNylFGVF6FdhNIxGfpUpbxMWLkkosY
	 9BzGwejviZRrhl3g0bC8zwWlqJgPor9yupjmZJvBVdj2S7nXXjg5S6Q2o6TEj+vgE77q+
	 XNRn4RE8LJ+gI6BTmrP5qyGHn6eIIKiM7C9Z9R67FNbP9TbR6kn5R2UsPRoZi5oHd4ak/
	 IKM1+HF+mK47sijzALXZUuL6ClU4/4J+xGjaMAVpCHnYfqaVy4prLAq2IOuIovD2LIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113127;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=deTG6dF7njjR2Xf78IVVdbk9aOvuHB2G7ztZTDkl25U=;
	b=EbvyHWxMpEzMX7L0CFExkwjUofEYRTEbqovBQGq7Tq+TXXh71Hhe9FyA/KGYMjtDzSFy
	 Vyx9GyF4DQtQdvSCrJQ/B26qqrQVr7yKqQxs9vZlKczGrpu4sHo5R3asetU10QtyfPDJW
	 mBgcGsS9Xh5s0FayfTKXtthqL7yAa9TUdnfGx11Y8BjgR1uOYe1aGTafz8aJyR+A5/lVi
	 0qaWM6typL2sZvB+oNZF2tDe25MVdcV+0s8755GvmlURyHFbp1mLNj8lXYqi7uEPiIRee
	 1oPXFGnxsF4780ViZPyAIpwwRMbLdIM/XDcAEFnHwrhfEjyMCOSj9lDnP2X/YQZX9HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="NyxBTy/u";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CF5606BA87;
	Tue, 27 Oct 2026 14:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NyxBTy/u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45931F01828;
	Tue, 27 Oct 2026 14:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113127;
	bh=deTG6dF7njjR2Xf78IVVdbk9aOvuHB2G7ztZTDkl25U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NyxBTy/ubgzp/eQUFjeztdkFKGVEjQP3gvo0RimQ+ZqsfGx/OhUD17ILPpGzqFBgx
	 N9hqG9TTwb70K0/7K/qEv03hYbCyZcvvyUKJLL5Yd6ATIZk6D+uUTLokIgz/lqkdN/
	 6wBzN/XFmUqnK/vNtNNK7RkTfFSXaK20u0p1XTHA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:59 +0100
Subject: [PATCH 19/19] usb: dwc2: wait for the TT clear in endpoint_disable
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
Message-Id: <20261027-llm-usb-v1-19-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>, 
 Minas Harutyunyan <hminas@synopsys.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=w+IJrkBhk6T3TrzYklgU1tSAIo2wMB/5iaEiDiuBctM=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr9vK3pjGuT33uNhvlnOa+Ern7yPf16ss37WjZmrv
 zOxW+8X7IhlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJzDjIsGCt1osq1Z/bki4y
 3ftZWKBjXn6G8QPDfC9bfT8+iQ+PjDi/vjq5NJ3n13MmMQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

When a split transaction fails, dwc2_hc_handle_tt_clear() sets
qh->tt_buffer_dirty and calls usb_hub_clear_tt_buffer(). The hub driver
stores urb->ep in its list and hub_tt_work() hands it back to
_dwc2_hcd_clear_tt_buffer_complete() after the CLEAR_TT_BUFFER request to
the hub, which can take up to a second if the hub does not answer.

Nothing keeps the endpoint until then. dwc2_hcd_endpoint_disable() only
waits for the QTD list to drain and frees the QH. If the full or low
speed device is unplugged, usb_disconnect() goes on to free the
usb_device and its configurations, which hold the struct
usb_host_endpoint. The callback then reads ep->hcpriv from freed memory
and, if it is not NULL, clears a bit in whatever it points to. A change
of the configuration or altsetting only frees the QH, under a callback
which has loaded ep->hcpriv without the lock.

A device which contains a hub can provoke this: fail a transaction of
the downstream device, report its disconnection and hold back the answer
to CLEAR_TT_BUFFER.

The HCD has to wait, like ehci_endpoint_disable(),
xhci_endpoint_disable() and fotg210_endpoint_disable() do. hub_tt_work()
calls the callback for every entry, also if the request failed, and
hub_quiesce() flushes the work, so the wait ends.

Fixes: 7359d482eb4d ("staging: HCD files for the DWC2 driver")
Cc: stable <stable@kernel.org>
Cc: Minas Harutyunyan <hminas@synopsys.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/dwc2/hcd.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index d5275cd658d4..a6ee55c494f8 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -1993,6 +1993,21 @@ static int dwc2_hcd_endpoint_disable(struct dwc2_hsotg *hsotg,
 		}
 	}
 
+	/*
+	 * The hub driver still has a pointer to the endpoint. Wait until it
+	 * has called _dwc2_hcd_clear_tt_buffer_complete().
+	 */
+	while (qh->tt_buffer_dirty) {
+		spin_unlock_irqrestore(&hsotg->lock, flags);
+		msleep(20);
+		spin_lock_irqsave(&hsotg->lock, flags);
+		qh = ep->hcpriv;
+		if (!qh) {
+			rc = -EINVAL;
+			goto err;
+		}
+	}
+
 	dwc2_hcd_qh_unlink(hsotg, qh);
 
 	/* Free each QTD in the QH's QTD list */

-- 
2.56.0

