Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113122;
	b=nb17DtmlEEJ8sDP32LvgsIvBMIN+xzm7qv31aQf78pxm77c5MNvBh+/tgqIILnn8L2Lt
	 O9kSYroasUEZD4fBUJxw3xZ1LQEldiibbrsqYySRBW7ljjGMHzT7502XzJJ3ns1DxN+9j
	 YoXPpR4fZ/iELok0CyFvgb4WN65/lf7dX85INagQGIjCciYe1AXpu/ap8yZYg2IV/yuBB
	 ZCQszE0hGlpjEXem9urBvPvRTWX9s8AYV94iNTbYi2SmU+ZCanIMpld8M57xAcmXavdeS
	 ME8ZE6H73bTiatS5oP0cPFepMvgOmBaqtCAk4KGsUSuJhJV6CUxIlo5VvelPgnaiThQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113122;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Ds8uehTRoY65cqY0xybRDx8XtbOjA+7wpbB11nDAZaU=;
	b=WtXaTCuNG3SpZX3ST7ORsvso7sLBdfY33/U9gV4RbwFintBDCdDTBytjR/UknG6rlD/f
	 bOkA9MoUSV83z7jLyYzgeL4vb3gvni3ojelPhXCB9ueVaPmVN7igAY4wgb0RoL2Ucl29S
	 PeRT2UqRSnV7Dvqu3Sr7uqZO/Ks+6SC9H/rqiOBSSHo8h9YQ2gEkMR5b0YrEyA57WGcjr
	 RT8KTgKPeFeuX+ZUmBeNKru6vU08+E5f8XLfw7ajVCbQc8753tdurp0K5ny9hPe0vG6/Z
	 sUWPdSAV7ssCwUOMOIvHxGH5RWxXYbxQbWAFpnfY2yh8Vny5YeR96twCkB3XLTGG2qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nnpU7aMd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC53960A6F7A;
	Tue, 27 Oct 2026 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nnpU7aMd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B141F01828;
	Tue, 27 Oct 2026 14:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113121;
	bh=Ds8uehTRoY65cqY0xybRDx8XtbOjA+7wpbB11nDAZaU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nnpU7aMdJjpohEQLXfyN5prmv/7oBwvUN3Mb6kUMEnaIwgnD8t7xQe/i5rdlwF/iO
	 hRdKQ/iXlQ6ra/zep/yZwOxNgbK7TKK+yYvwAM7qUoFFXiMP9NqqpH9shXN8yi2mVd
	 L6nsmhsi+IxMx5V4sp6uemphIjw3iYPCEQ55w2tI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:57 +0100
Subject: [PATCH 17/19] usb: renesas_usbhs: unlink the URB if it is not
 queued
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
Message-Id: <20261027-llm-usb-v1-17-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2175;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=dSVea7KCyaZ29wVhYJWM04RWBgzhOAZzFiuroncGjxQ=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr9feqVSoeC4fvq9jq4VD5km7gt27Cw896DN7OqMR
 23yF2a87ohlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJWLQwLJjxW6F2y1XFpLeL
 zKd81Hqo7j3j4XSGuXIPPq2Z2Xrh8W63A/OPJuVv6zX3WwMA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

If usbhsh_urb_enqueue() fails after it has linked the URB to the
endpoint, it returns without unlinking it. usb_hcd_submit_urb() then
reinitializes urb->urb_list, and the owner may free the URB, while the
list of the endpoint still points to it. The next walk of that list, at
the latest when the endpoint is flushed, uses freed memory or does not
end.

No memory shortage is needed for that: each isochronous URB is refused
with -EIO, after it has been linked.

If the failure comes after the pipe was attached, that is not undone
either, and the use count of the pipe never gets back to zero.

Fixes: 034d7c13a79c ("usb: gadget: renesas_usbhs: add mod_host support")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/renesas_usbhs/mod_host.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod_host.c b/drivers/usb/renesas_usbhs/mod_host.c
index 0652525d06fe..bdec4eaf3402 100644
--- a/drivers/usb/renesas_usbhs/mod_host.c
+++ b/drivers/usb/renesas_usbhs/mod_host.c
@@ -987,7 +987,7 @@ static int usbhsh_urb_enqueue(struct usb_hcd *hcd,
 		if (!new_udev) {
 			ret = -EIO;
 			dev_err(dev, "device attach failed\n");
-			goto usbhsh_urb_enqueue_error_not_linked;
+			goto usbhsh_urb_enqueue_error_unlink;
 		}
 	}
 
@@ -1020,14 +1020,22 @@ static int usbhsh_urb_enqueue(struct usb_hcd *hcd,
 		ret = usbhsh_dcp_queue_push(hcd, urb, mem_flags);
 	else
 		ret = usbhsh_queue_push(hcd, urb, mem_flags);
+	if (ret < 0) {
+		usbhsh_pipe_detach(hpriv, usbhsh_ep_to_uep(ep));
+		goto usbhsh_urb_enqueue_error_unlink;
+	}
 
-	return ret;
+	return 0;
 
 usbhsh_urb_enqueue_error_free_endpoint:
 	usbhsh_endpoint_detach(hpriv, ep);
 usbhsh_urb_enqueue_error_free_device:
 	if (new_udev)
 		usbhsh_device_detach(hpriv, new_udev);
+usbhsh_urb_enqueue_error_unlink:
+	usbhs_lock(priv, flags);
+	usb_hcd_unlink_urb_from_ep(hcd, urb);
+	usbhs_unlock(priv, flags);
 usbhsh_urb_enqueue_error_not_linked:
 
 	dev_dbg(dev, "%s error\n", __func__);

-- 
2.56.0

