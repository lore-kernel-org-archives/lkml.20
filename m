Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113119;
	b=Yso9WjqP/D9AnWH0ZzLeHHeavrh+9MpxqG7yzwBL6Z9orV91c1tu4BJ+ixQQUXL0W3Lr
	 1pfb3la3OwD8SzXxubKtt1gNYEKZdhO0Zi2jMK2Ukwz88hBGYs+WGbbk68tdMgFe3OBRn
	 JL2LjVlBE960ZhrlscTIHT21JGZk6SantiZ5HPTrS+29xQjlJHl/Egi6FFkZpYkYbQ86U
	 7eZHgLf1fagnoooRX2Y/ou0kKet7PI5MvlBK6Sg7lBq/tlKDP1gnTYdtqjzDBxIAwJ72k
	 tYhUM38p8B1PIYXjHGVLr3a7qBqQuGeNiphEDcEbjA4uFI3GB08oGcbBiikucJYhrnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113119;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3Xixc/gvdarGboX3N1Au6CnUqYK7gRY+lLRvNXME+cs=;
	b=rY4GuCawpqA71ZVKVxpncER6OjLCEziKao84v8INnLMf3RGTKCD1TuFPrFCAAt81Zhav
	 19icaXY92Tm47Zj1QcuoVXZzRs+IgEaeUc4iurOMUmlrV3skX6miJz8ONavQAoN69fWxi
	 ziondzN2lFg5cHSUpKYgiI3i4jXZ/2RcZ2vUkYc4SIW8vWKj7JVG4/ztxidMVAjC43tcN
	 57X8gPamLXlClTBWeIgmTUNU9zb8f8HDLsJPxI/I4mKAlHQxXOS7+eB48e5fGfHXkc+Or
	 9EDSgagB1MLVsnB4B5GD10Ncl8NVo+lI/oUBSS8FvfiMfOHPHLlO97QVZVa7DGfdXmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="2fBp/P9A";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEA0606A330;
	Tue, 27 Oct 2026 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2fBp/P9A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC901F01828;
	Tue, 27 Oct 2026 14:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113118;
	bh=3Xixc/gvdarGboX3N1Au6CnUqYK7gRY+lLRvNXME+cs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=2fBp/P9AcwhAyAg6Yr19d5h4fzZfXYQkugckmlYBQyI1qQEog+FqABjdrqsa6f4Pb
	 SuFPX3wnNyuqb75EKjU+eaj6XpwE8dAnfvYzUaAqumHlajFw6+EkoqJM+OHP0is9lW
	 qu+ye/1Iw3tDXujCwh+d5ofWg6h3kwFMKOJSBFVg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:56 +0100
Subject: [PATCH 16/19] usb: renesas_usbhs: link URBs with interrupts
 disabled
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
Message-Id: <20261027-llm-usb-v1-16-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2715;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=D9XwehcB1Z6QM0/wpCy29muafgu2DAYoPjh0AR8CaZM=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr/f8Gzy31n22dcbpi/8EuST8G7zEv6bpvLNJmy9j
 ELPrqd964hlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJ7HzAsGBF15tTIvW8J5+E
 hesLZaun7nJ89o9hfu6VK09eTf6k8S19hXF4vzjDbeUlkwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

usb_hcd_link_urb_to_ep() and usb_hcd_unlink_urb_from_ep() are to be
called under the lock of the host controller driver, with interrupts
disabled. They take hcd_urb_list_lock with a plain spin_lock().

usbhsh_urb_enqueue() calls the first one without any lock, with
interrupts enabled if the URB was submitted from process context.
usbhsh_queue_done() calls the second one, mostly from the interrupt
handler of the controller.

The host mode is used on a uniprocessor board, where the spinlock is
nothing. There the interrupt for a finished URB can come in the middle of
the list_add_tail() for the next URB of the same endpoint, and its
list_del_init() leaves the list of the endpoint corrupted. On an SMP
kernel the CPU would wait for itself instead.

usbhsh_queue_done() is also called from usbhsh_urb_dequeue() with
interrupts enabled.

Take the lock of the driver around both calls.

Fixes: 034d7c13a79c ("usb: gadget: renesas_usbhs: add mod_host support")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/renesas_usbhs/mod_host.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/mod_host.c b/drivers/usb/renesas_usbhs/mod_host.c
index f7ef3a9f82a4..0652525d06fe 100644
--- a/drivers/usb/renesas_usbhs/mod_host.c
+++ b/drivers/usb/renesas_usbhs/mod_host.c
@@ -633,6 +633,7 @@ static void usbhsh_queue_done(struct usbhs_priv *priv, struct usbhs_pkt *pkt)
 	struct usb_hcd *hcd = usbhsh_hpriv_to_hcd(hpriv);
 	struct urb *urb = ureq->urb;
 	struct device *dev = usbhs_priv_to_dev(priv);
+	unsigned long flags;
 	int status = 0;
 
 	dev_dbg(dev, "%s\n", __func__);
@@ -652,7 +653,10 @@ static void usbhsh_queue_done(struct usbhs_priv *priv, struct usbhs_pkt *pkt)
 
 	usbhsh_pipe_detach(hpriv, usbhsh_ep_to_uep(urb->ep));
 
+	usbhs_lock(priv, flags);
 	usb_hcd_unlink_urb_from_ep(hcd, urb);
+	usbhs_unlock(priv, flags);
+
 	usb_hcd_giveback_urb(hcd, urb, status);
 }
 
@@ -955,6 +959,7 @@ static int usbhsh_urb_enqueue(struct usb_hcd *hcd,
 	struct usb_host_endpoint *ep = urb->ep;
 	struct usbhsh_device *new_udev = NULL;
 	int is_dir_in = usb_pipein(urb->pipe);
+	unsigned long flags;
 	int ret;
 
 	dev_dbg(dev, "%s (%s)\n", __func__, is_dir_in ? "in" : "out");
@@ -965,7 +970,9 @@ static int usbhsh_urb_enqueue(struct usb_hcd *hcd,
 		goto usbhsh_urb_enqueue_error_not_linked;
 	}
 
+	usbhs_lock(priv, flags);
 	ret = usb_hcd_link_urb_to_ep(hcd, urb);
+	usbhs_unlock(priv, flags);
 	if (ret) {
 		dev_err(dev, "urb link failed\n");
 		goto usbhsh_urb_enqueue_error_not_linked;

-- 
2.56.0

