Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C561EB5CE;
	Sat, 10 Oct 2026 06:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791614766; cv=pass; b=ty+gwWJkIXyvis1CSS+jT5alrrTMkABc5ZUXftF0DnnFqV5mZf/NjrF7g/mW4Gh0D9zwkcsYDH7DAPgW1faEjkfHHo3lj5otg0EpH6/lWz9x/rFGJSCeTAITpxBZtQNkYWGAf9hVJsW+mxVuFHCl0Q9KKzokjMf7pbg/jcIe9+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791614766; c=relaxed/simple;
	bh=OvD1Qd4VBybxFDyfjCwOUVwBhaJQmRZAwpCTbLZOD0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ELjbvTtQronKN7bD/lraEBUNos1B6ibOdboQqiiYFS60kCE1+GRoSNfZM9Nok0BGbs6Gcr0KugKF837VrzuR0O8cRB4FEPQ7M7+xk5J3bbMLMYxuZTLp4YjJrmzR+Kb1y5DJ4MvLE+RY9HLoFX4WxueOhqZ7xg3EolikBPY/wRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yiyuzhou.io; spf=pass smtp.mailfrom=yiyuzhou.io; dkim=fail (0-bit key) header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.b=c/HimdH/ reason="key not found in DNS"; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.b="c/HimdH/"
ARC-Seal: i=1; a=rsa-sha256; t=1791614759; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=myG2gzBY6IUhpd8aTnUij6ayM8yf+lrwLRuEZ+VBBIgXAIcxkqxIhaBB1YizcyAnxymq7VHoGB4JFc4Aof6qSIhkf9RUTsTst14OKghDY2KvAPVhFzBmJ9rSwNDjo9jV4Tg2gqD8yd1p7CJkJuBtIOiAMNStnTHh35X2FbW3kDg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791614759; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=f00TvRKVl4NKwyYaLv7u/2ca7xd44H3r4On2kzjvgYg=; 
	b=Vaz4xfu5cCWQ2xdK4KEPxwvlnzVAJRigXD1nlDZZRWUZBukEflGa/aOAwlyJlUGTwbzHMybNG1N15NNO9rX3DRTyrPxbbe2y4CL7bLi9Ms34fIrFnVfNNj+i0JyfrjDGFIffmdF5qBP61QZFrecODtQX+ygMKg3zzmA1pjmCs2k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yiyuzhou.io;
	spf=pass  smtp.mailfrom=yiyu@yiyuzhou.io;
	dmarc=pass header.from=<yiyu@yiyuzhou.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791614759;
	s=zmail; d=yiyuzhou.io; i=yiyu@yiyuzhou.io;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=f00TvRKVl4NKwyYaLv7u/2ca7xd44H3r4On2kzjvgYg=;
	b=c/HimdH/d7a+6Tq5gtQqXQ6ShMa+EkVue4H2O+9R3qhoPK/0OHrpUrusTjyvb5jQ
	MHtGFwGJwFCeTDFKzXU40zORRPGCUL++vL1p59tu/PAKaFrKflfz0Am1oNKN8NI6T+S
	q1nrrk4eIe40R883bSBA0+ijCeA6WjbgkAUTeO30=
Received: by smtp.zohomail.com with SMTPS id 1791614758969308.89419048164314;
	Fri, 9 Oct 2026 23:45:58 -0700 (PDT)
From: Yiyu Zhou <yiyu@yiyuzhou.io>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.pecio@gmail.com,
	Yiyu Zhou <yiyu@yiyuzhou.io>
Subject: [PATCH] xhci: give back halted TD when skipping endpoint reset after disconnect
Date: Fri,  9 Oct 2026 23:42:19 -0700
Message-ID: <20261010064407.11030-1-yiyu@yiyuzhou.io>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Commit 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub
disconnect") makes xhci_handle_halted_endpoint() return early when the
root port is disconnected, and commit 7e0ef4332ed9 ("xhci: avoid xHC
endpoint changes after disconnect or link error.") also sets
EP_DROP_PENDING there, which keeps the doorbell from being rung until
the device is reset.

The callers rely on xhci_handle_halted_endpoint() to take over the
halted TD.  For example, finish_td() returns right after calling it,
expecting the TD to be given back once the Reset Endpoint command
completes.  With the early return, nobody gives the TD back.  Its URB
stays pending until the submitter times out and unlinks it.  Every URB
queued on the endpoint afterwards never starts, because the doorbell is
blocked, and also has to time out.

Devices that disconnect and reconnect themselves during enumeration hit
this.  A PFU HHKB Professional HYBRID Type-S keyboard (04fe:0021) drops
off the bus about 300 ms after its first enumeration, while usbhid is
still probing its third interface.  The probe runs in hub_wq, so the
disconnect is not handled until the probe returns.  On a root port the
HID descriptor request and its four retries in hid_get_class_descriptor()
each wait for the full 5 second USB_CTRL_GET_TIMEOUT:

  [57685.006036] usb 3-2: new full-speed USB device number 24 using xhci_hcd
  ...
  [57685.291304] hid-generic 0003:04FE:0021.0017: input,hidraw1: USB HID v1.11 Keyboard [PFU Limited HHKB-Hybrid] on usb-0000:00:14.0-2/input1
  [57711.221083] usbhid 3-2:1.2: can't add hid device: -110
  [57711.221613] usbhid 3-2:1.2: probe with driver usbhid failed with error -110
  [57711.221842] usb 3-2: USB disconnect, device number 24

The re-enumeration that follows can stall the same way, leaving the
keyboard dead until reboot.  Behind an external hub, where the root
port stays connected, the same keyboard recovers in about 300 ms, as it
did on the root port before these commits.

Keep skipping Reset Endpoint on a disconnected or inactive port, but
give the halted TD back right away, with -EPROTO if no error status was
set yet.  The endpoint is not restarted until the device is reset or
dropped, so the ring dequeue pointer can stay where it is, as
xhci_invalidate_cancelled_tds() already assumes for cancelled TDs on
such endpoints.  Also refuse new URBs on an endpoint with
EP_DROP_PENDING set, like xhci_urb_enqueue() already does for an
inactive link, so they fail right away instead of timing out.

Fixes: 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub disconnect")
Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
Assisted-by: LLM
Signed-off-by: Yiyu Zhou <yiyu@yiyuzhou.io>
---
Tested on v7.3-rc6 on a System76 Galago Pro (Intel 8086:51ed xHCI)
with the keyboard plugged directly into a root port, including twice
right after resume from suspend.  On every hotplug the keyboard still
dropped off during the probe of its third interface, and it was
re-enumerated with all three interfaces bound about 0.3 s later.
Before this patch, the same sequence hung usbhid for 26 s, and often
left the keyboard dead until reboot.

 drivers/usb/host/xhci-ring.c | 24 ++++++++++++++++++++----
 drivers/usb/host/xhci.c      |  5 +++++
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ec278a9f9540..82190380831d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -979,6 +979,24 @@ static int xhci_reset_halted_ep(struct xhci_hcd *xhci, unsigned int slot_id,
 	return ret;
 }
 
+/*
+ * Mark the endpoint to be dropped instead of reset, and give back the halted
+ * TD now, as nobody else will.  The endpoint is not restarted before device
+ * reset or drop, so there is no need to move the ring dequeue past the TD.
+ */
+static int xhci_drop_halted_endpoint(struct xhci_hcd *xhci,
+				     struct xhci_virt_ep *ep,
+				     struct xhci_td *td)
+{
+	ep->ep_state |= EP_DROP_PENDING;
+
+	if (td)
+		xhci_td_cleanup(xhci, td, xhci_urb_to_transfer_ring(xhci, td->urb),
+				td->status ?: -EPROTO);
+
+	return -ENODEV;
+}
+
 static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 				struct xhci_virt_ep *ep,
 				struct xhci_td *td,
@@ -993,10 +1011,8 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 	 * Can cause host hang.
 	 * Device will be reset to recover an inactive link, so don't do anything
 	 */
-	if (rhub_port->link_inactive || !rhub_port->connected) {
-		ep->ep_state |= EP_DROP_PENDING;
-		return -ENODEV;
-	}
+	if (rhub_port->link_inactive || !rhub_port->connected)
+		return xhci_drop_halted_endpoint(xhci, ep, td);
 
 	/* add td to cancelled list and let reset ep handler take care of it */
 	if (reset_type == EP_HARD_RESET) {
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a9e47e178c28..491a541b57b0 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1691,6 +1691,11 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 		ret = -EINVAL;
 		goto free_priv;
 	}
+	if (*ep_state & EP_DROP_PENDING) {
+		xhci_dbg(xhci, "Can't queue urb, ep halted after disconnect or link error\n");
+		ret = -ENODEV;
+		goto free_priv;
+	}
 
 	switch (usb_endpoint_type(&urb->ep->desc)) {
 
-- 
2.55.0

