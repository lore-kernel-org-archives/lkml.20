Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595293;
	b=Ps/MbbqIpBn8ysNlRuRUbNZt+LdZOvVeZEkN5m6wecA9E8xNQ1njMmVjz9dJw1p6wElf
	 6uEO2SZyjl3nHVR7j1pqadmS93nPB7pyTZuePtw5KfR3rPm2bb2fSEun1Lk6C0CPYBAo3
	 fEwUrFDrlN/QUceSeo8jHgYJCXLa++iffarcT8a9XyvEiqoy4v1/NOu61KxzRLJv5odoJ
	 1TYxp31z3+naqhFRSBZ9TEIRS1TjjpyWQ95jZKK5kC4QiZIx5WL9QkO3i+Gx9RQqFBoKL
	 E5VWRRkacD4n2F87JqGDeqaPpcfLFs8HujaF2nDLmePVxi6F0SOTuGGDGEZV1bJL/Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8YHSxufeVVJ2VZoAF4/++z3L4gnMTb7J7dwMMqwcWA8=;
	b=jHUNa5Kb1173yUn3btCsNYbZQrUdPz23dWR6Vc33j5uHZqfpWbtVhL6kPmZ23ciEjJ9U
	 HM3/eCdsCZtJd56h+QnxBSvLhuKnh7AAeKrz33Nh/010PmL3MsyIOWe83xtzLSUnT8CzV
	 O8/nIcYFL2adK1mYFqYuEqgC1LfwPR6MvD6iXj89OL1c5LL2ZD+zCTQc3DIDFAb/utNoe
	 QUykkUIT0/pU/rOm9g4X3p5BgltwjhEC4K7m2jx1pSzeSF9GNJFjmUTbirywExek+hMws
	 XY59WoHsG97srwDfnq5i/GTFAiF8bCgw3uwL0wOLfmzPfa1P5wYg49laqTF+EpQOteA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XrGj+8cs;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9341D60A260C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9341D60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XrGj+8cs
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8198a3a54d7so1746894a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792595291; x=1793200091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YHSxufeVVJ2VZoAF4/++z3L4gnMTb7J7dwMMqwcWA8=;
        b=XrGj+8csPaNTSeBqXQ046oZQPOTW7l+lwAvdn0gYkTa9Zh/pDDlA0C33O7StpRRY6t
         u3dhbKWDIY8M1i99LCEGQ60aa1M0pOJRMUxOwqlFDiaALeYKqTzFSTq2JFvRmVJ3Mi7Q
         aUIb3cz5zfMJzWMPHH6t2tyXgFQYjCP6G/aU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595291; x=1793200091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YHSxufeVVJ2VZoAF4/++z3L4gnMTb7J7dwMMqwcWA8=;
        b=fRWIB9jTiN+CHQVGENuPfYH1/QZgQagDjGeUO15LAiVarw1x88PXziO763OIKikuUG
         s+sOQ0vyit7tkcIm1vlmXZShgJ89bE2jIsz3bqfY8Mmm5/sDJHf5Twi9PHQEKJNMn1sj
         cSYLoEsGf2cYjvFKXSmihW60QYiYiDkgfRyvMR6qn0sHMmiq7NHPdrJgSg4CwQIpOh16
         FtdZHeFceR0nKe8DwX28V3Qy7x7Odl00bSFGILhUxk06g4BF7ZAoRmvQ5m/7N/UMNKD+
         c+DYrnRPedSYB31P0yYULSsVTvlgguR8qoQarQ5y21N2Bo6dMK6H2RGvKhMe5O3eQ2J4
         0CDg==
X-Forwarded-Encrypted: i=1; AKwUvBzxFSVzWlVg9Pl3RjPulcYlbZZTXiQm6qCqZ6hEqVZNwvgrPWbOW4Exwoc4/NU0iT4d8WkwFHf6MUEsLe4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZunDBFK+Be+eMdwi61uMfJou/tL7jUV6X7Ahir45/oNBtfihq
	07vN4hMatrHyzUNUmyi326dv1yaaYIrkfIACQZYlk9NE8/bcU5pZ+F/LOAJ3qyrKqw==
X-Gm-Gg: AYBFou2qtDAGXdmELf4IPALuGb1cK9YdCYAK88IpGNBVevqrUgGvxoEXybCWkn2y495
	c0qZzaQjonvIKJBX2YWD7S7gcdwXnrSPFETmUSi/t/LmQ7kmUDth+Y4qfkk8V29jJQf58rpVpuK
	EknwFuKzxt55KlAqTlDoBqedMuZjDWyQTqa5XDAbKejLJaKiMabaD/SUU0IfOfigfNWYhm/c/sT
	U5raR6X3ZITijiHTAAgUFaZ9nk/vI1eEjNQwT93A+NDT4EOiRJa8udzs3WtN35w6EsRHvsHnGHL
	z3lAQqKA+0JpExaQSV80YKLFy+Tp8rX7GK4B7sfhnGz/l+BFp2JcBmj61KwPTdNn60v751bV3GW
	GX8kXsO4lU4BO8J0sqo+bzLMgVkRZL4S2lgXPuaS2JUAOz2E/rm4tX4tTLpvTjSjwgOwActnkDG
	EqnIDRekH0fmA0u82yALKLiAxtXTjQXQrAfkol516wPs65PI9h4VRCWOKjmfVKdGVUM7pvU0u/v
	HISkq/mcBWl4RbIywkX3VH8yTmG2QWoBojJLgQPXCodJFQWl3G9iFfNWYbkz/k21IVXXtYVIOGJ
	v9iVXR28GCgQf/EuXh5eDwaMk5eDrLs7TXj4b08kBr3q
X-Received: by 2002:a05:6808:6614:b0:544:9281:a3a9 with SMTP id 5614622812f47-5535626991amr1261042b6e.19.1792595291615;
        Wed, 21 Oct 2026 08:08:11 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b400bd39sm2023922b6e.6.2026.10.21.08.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:10 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Raul E Rangel <rrangel@chromium.org>,
	stable@vger.kernel.org,
	Anirudh Rayabharam <mail@anirudhrb.com>,
	"Brian G. Merrell" <bgmerrell@novell.com>
Subject: [PATCH 2/6] usbip: vhci_hcd: complete unsent URBs locally in vhci_urb_dequeue()
Date: Wed, 21 Oct 2026 09:06:57 -0600
Message-ID: <20261021150704.3129446-3-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021150704.3129446-1-rrangel@chromium.org>
References: <20261021150704.3129446-1-rrangel@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an URB is enqueued via vhci_urb_enqueue(), its vhci_priv entry is
placed on vdev->priv_tx until vhci_tx_loop() moves it to vdev->priv_rx
in dequeue_from_priv_tx() and sends USBIP_CMD_SUBMIT.

If vhci_urb_dequeue() is called while the URB is still on vdev->priv_tx
and vdev->ud.tcp_socket is non-NULL, vhci_urb_dequeue() currently sets
urb->unlinked and queues a vhci_unlink entry on vdev->unlink_tx without
removing the URB from vdev->priv_tx. This causes two bugs:

1. If vhci_tx_loop() has already exited after an earlier send error or
   been stopped during connection shutdown before tcp_socket is cleared,
   the URB remains on vdev->priv_tx. When vhci_device_unlink_cleanup()
   later runs pickup_urb_and_free_priv(), which only searches
   vdev->priv_rx, the vhci_unlink entry is freed while the URB remains
   linked on ep->urb_list with urb->unlinked set. Subsequent calls to
   vhci_urb_dequeue() from usb_hcd_flush_endpoint() fail with -EBUSY at
   usb_hcd_check_unlink_urb(), leaking the URB giveback and hanging
   usb_kill_urb() in D state forever. (Stopping new enqueues on shutdown
   and draining non-unlinked URBs are addressed in the next patch.)

2. On an active connection, if an URB is enqueued and immediately
   dequeued while vhci_tx_loop() is in vhci_send_cmd_unlink(),
   USBIP_CMD_UNLINK can be transmitted before USBIP_CMD_SUBMIT for the
   same seqnum. The server replies USBIP_RET_UNLINK for the unknown
   seqnum while vhci_tx_loop() is concurrently building or sending
   USBIP_CMD_SUBMIT, racing on urb->hcpriv or leaving an orphaned
   USBIP_RET_SUBMIT that tears down the connection with
   VDEV_EVENT_ERROR_TCP.

Record whether an URB has been dequeued from vdev->priv_tx into
vdev->priv_rx via priv->submitted under vdev->priv_lock, and complete
unsent (!priv->submitted) URBs locally in vhci_urb_dequeue() without
queuing a CMD_UNLINK request. Because vhci_tx_loop() drains
vdev->priv_tx in vhci_send_cmd_submit() before entering
vhci_send_cmd_unlink(), any URB with priv->submitted set is guaranteed
to have its CMD_SUBMIT sent before its CMD_UNLINK.

Fixes: 258c81b341c8 ("usbip: give back URBs for unsent unlink requests during cleanup")
Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
Cc: stable@vger.kernel.org
Assisted-by: Gemini
Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 drivers/usb/usbip/vhci.h     |  1 +
 drivers/usb/usbip/vhci_hcd.c | 14 ++++++--------
 drivers/usb/usbip/vhci_tx.c  |  1 +
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
index 5659dce1526e..4a62f89b89c7 100644
--- a/drivers/usb/usbip/vhci.h
+++ b/drivers/usb/usbip/vhci.h
@@ -55,6 +55,7 @@ struct vhci_priv {
 
 	struct vhci_device *vdev;
 	struct urb *urb;
+	bool submitted;
 };
 
 struct vhci_unlink {
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 3196ea80e7c2..7fadb41c01fc 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -925,20 +925,18 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		return ret;
 	}
 
-	 /* send unlink request here? */
-	if (!vdev->ud.tcp_socket) {
-		/* tcp connection is closed */
+	/*
+	 * Give back the URB locally if the TCP connection is closed or the URB
+	 * is still on priv_tx (not yet picked up by vhci_tx_loop), so no
+	 * CMD_UNLINK is needed.
+	 */
+	if (!vdev->ud.tcp_socket || !priv->submitted) {
 		list_del(&priv->list);
 		kfree(priv);
 		urb->hcpriv = NULL;
 
 		spin_unlock(&vdev->priv_lock);
 
-		/*
-		 * If tcp connection is alive, we have sent CMD_UNLINK.
-		 * vhci_rx will receive RET_UNLINK and give back the URB.
-		 * Otherwise, we give back it here.
-		 */
 		usb_hcd_unlink_urb_from_ep(hcd, urb);
 
 		spin_unlock_irqrestore(&vhci->lock, flags);
diff --git a/drivers/usb/usbip/vhci_tx.c b/drivers/usb/usbip/vhci_tx.c
index 32e6fabccf72..997db6cfa382 100644
--- a/drivers/usb/usbip/vhci_tx.c
+++ b/drivers/usb/usbip/vhci_tx.c
@@ -40,6 +40,7 @@ static struct vhci_priv *dequeue_from_priv_tx(struct vhci_device *vdev)
 
 	list_for_each_entry_safe(priv, tmp, &vdev->priv_tx, list) {
 		list_move_tail(&priv->list, &vdev->priv_rx);
+		priv->submitted = true;
 		spin_unlock_irqrestore(&vdev->priv_lock, flags);
 		return priv;
 	}
-- 
2.56.0.212.g129ede20d9-goog

