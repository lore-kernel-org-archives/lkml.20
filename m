Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118791;
	b=Wm4ToKhnPn1WkpQsw4G0yBhY1Qe7wKA1M7MWHcPWJhF+4D9o5qNzqAAuK2wXKmkze9B6
	 JERJpalORoojx67kb53oU9M5hWj/d0PMsOXr8zvkYkL4gKIymYuUnjbBJsZutg32szudh
	 8Yq9NET92YfeO1qL8A/TQ35BiLi2ekDYBIjDSSv9ywAsoqs2IP8nF2K3/YF30ClvClnsd
	 u0g+9SsBfnoKwlrm7EJZsYJt8fovHWWVeuZt4iCkKZ6PrT/I6czgIHsa3WneMsdlZv+YQ
	 VHQqnS+2SaiCmlFoaD0CtHil6B2pskk+a4+mB9HRWzrFI3RcFnP5AGFiSW5xFFtgijQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118791;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Lines:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=zJ8Huurfnr0mEQVuAkk40Peu6SGowRfl621KVisIYpw=;
	b=f6V3EkfUxy6O3GNNWC6IX140r/sRV27bjTydXYM7SzYQR/x/k7AW+BL2dUyoniQhKLS+
	 cdOnu6ENRJo/ImpPm/LziBuIZPR5yWUPXWcQktOKBBxs2Maelev6FVZNrrXabH0Vss/K2
	 oG7DrwDSoWVuOC/SEejuk8Qswd1D9KOY85OESF2xUGXIG1Va+6etSfyMdmXCxiW2Niz6c
	 I9OlKu3pO+vEiEp/wAksqUGOykoAFIIFmdAxfZ4VUCuIDvi8mLZp07OZMozbPOSXVjMd2
	 mXu5zmNJQ/YKJvBioEWsnZWcMi3QjFh/d4Mhl6mG7+WyVH8NKXfmJA0WdHZ6fuEECrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ho5lLhuZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6267606A333
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ho5lLhuZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58EC1F031E2;
	Tue, 27 Oct 2026 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793118790;
	bh=zJ8Huurfnr0mEQVuAkk40Peu6SGowRfl621KVisIYpw=;
	h=From:To:Cc:Subject:Date;
	b=ho5lLhuZ+FrP2B+n4hDFTOHPU/3WQKYoBRQCrWlh1YNUnN9uWkhSUeb4IFeAh1B/w
	 o3jq/xq1YnU8Px1rcZ/a39HvPI7ey1Y3WR32E+WuGjTw9LmSj6JjNb+JSt2Enf05FW
	 Gz2+aWz3rxO2cWIXed/REgAZZksLg+983HRKubY8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com
Cc: linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] most: usb: don't use a NULL device on disconnect
Date: Tue, 27 Oct 2026 17:33:08 +0100
Message-ID: <2026102707-diploma-clubbed-ea4f@gregkh>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=IQd26tdjuAkjDFD5eJqJW0k7JAf2+GYEEEmnWZJfZ58=; b=owGbwMvMwCRo6H6F97bub03G02pJDFkPLrl0/45nMNTzml0YbxN22svvzIxpT+3ZTmgwRcZfX 9RZb7CqI5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACayy4NhfoKopOTnhpKuXN1D VbNbpu2/f/+5HsM8WyaOly0WB/omXV9p5z7TsCWp33omAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Josef Bacik <josef@toxicpanda.com>

hdm_disconnect() clears mdev->usb_device before it stops the link status
timer and the work which that timer schedules.  wq_netinfo() does not
expect a NULL pointer: it hands it to drci_rd_reg(), which dereferences
it.  Stop the timer and the work first.

The interface stays registered until the end of hdm_disconnect(), so
hdm_request_netinfo() can still be called and arm the timer.  Shut the
timer down, rather than delete it, so that this has no effect.

wq_clear_halt() has the same problem.  It is only cancelled when the
channels are poisoned, by most_deregister_interface(), and cannot be
cancelled earlier since the URB handlers schedule it.  It takes io_mutex,
like the code which clears the pointer, so test the pointer there.

Fixes: a4198cdf0c34 ("Staging: most: add MOST driver's hdm-usb module")
Cc: stable <stable@kernel.org>
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
Cc: Christian Gromm <christian.gromm@microchip.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/most/most_usb.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/most/most_usb.c b/drivers/most/most_usb.c
index 6437733afee0..9485f5a51f5f 100644
--- a/drivers/most/most_usb.c
+++ b/drivers/most/most_usb.c
@@ -735,6 +735,10 @@ static void wq_clear_halt(struct work_struct *wq_obj)
 	int peer;
 
 	mutex_lock(&mdev->io_mutex);
+	if (!mdev->usb_device) {
+		mutex_unlock(&mdev->io_mutex);
+		return;
+	}
 	most_stop_enqueue(&mdev->iface, channel);
 	usb_kill_anchored_urbs(&mdev->busy_urbs[channel]);
 	if (usb_clear_halt(mdev->usb_device, pipe))
@@ -1108,14 +1112,15 @@ static void hdm_disconnect(struct usb_interface *interface)
 {
 	struct most_dev *mdev = usb_get_intfdata(interface);
 
+	/* hdm_request_netinfo() can still be called, and arms the timer */
+	timer_shutdown_sync(&mdev->link_stat_timer);
+	cancel_work_sync(&mdev->poll_work_obj);
+
 	mutex_lock(&mdev->io_mutex);
 	usb_set_intfdata(interface, NULL);
 	mdev->usb_device = NULL;
 	mutex_unlock(&mdev->io_mutex);
 
-	timer_delete_sync(&mdev->link_stat_timer);
-	cancel_work_sync(&mdev->poll_work_obj);
-
 	if (mdev->dci)
 		device_unregister(&mdev->dci->dev);
 	most_deregister_interface(&mdev->iface);
-- 
2.56.0

