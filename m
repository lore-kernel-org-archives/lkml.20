Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.81.71.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396912;
	b=4nHDqC5W/Z4vuY2u3fo8bUZcuiWHEpsZL0NLx85ub6yLQ2ZeIsP7r+cPysKpe+GhWPlR
	 W9IxxMuscpl/goTMoJKfyOsVejZBi1yWr/yAQaKQXicw5eLflBQD3P60wRmyQYNfpsiIx
	 sEYriUklftNVyP9iHyAsE4hj0zIec/NW5l45C87E3/juub6en2GT1ebTsHeNljnqAkj9L
	 7eWHom+mgQOBdHw/vS4Pn3M9lHOCvvZr6sy5EeImelbvP3BFFx0rsSElrcDbJuHfQRzCL
	 pvj6VvTIWW7vc1PzFeXC8HW0tlIvDEq0nVnJubQdBWIcgd/KYnvvPcc3BHhFlJzsffg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396912;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:
	 x-ms-reactions:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Developer-Signature:X-Developer-Key;
	bh=Ckc84EqrblGll4cu0USqWotlw7a7SUG/myl+FdROgzI=;
	b=37iDkVaffbjwcFDHRp6vaoPO1UzHrvt2t7LSfL4A4VtNUDv0U7q/VZ0ypkhWu6SxYzjp
	 dQHL0BptyhHpfZluoaaNeJiTBEdQmbH6wAzW+Kqzd0kclrlY0jBWmiGg3if6VtZ8RVFWs
	 sdk5Z4ijiHvtw8Gt9+n6bMKCRi4UPUsFqbyE9XTAJQ4yI5WPNekfqPkvbbxUlAzFKIVPp
	 /R2qWEHksuLeHvpfhvLKeY455HIcQKRyM8S5kM4S7jTRYHgdyJJaUA6Pri81V7Hp+sDQT
	 Lgq1j3ysM8e8DRLVuKm6rhjlBU3pKCDXXW+b1buYRuEHm4a7EZQbFycTVCtl5J7EsOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=puzzle.ch;
	spf=pass smtp.mailfrom=puzzle.ch;
	dkim=pass header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211230 header.b=VwvyoPDr;
	dkim=pass header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211209 header.b=kKiQ20Z4;
	arc=none smtp.remote-ip=45.81.71.124
Received: from mx03.puzzle.ch (mx03.puzzle.ch [45.81.71.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E6C606A32D;
	Wed, 11 Nov 2026 11:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E6C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puzzle.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puzzle.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211230 header.b=VwvyoPDr;
	dkim=pass (2048-bit key) header.d=puzzle.ch header.i=@puzzle.ch header.a=rsa-sha256 header.s=20211209 header.b=kKiQ20Z4
Received: from mailstore02.cloud.puzzle.ch (mail.puzzle.ch [IPv6:2a06:c00::5086])
	by mx03.puzzle.ch (Postfix) with ESMTPS id 5D9E4111;
	Wed, 11 Nov 2026 12:35:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=puzzle.ch; s=20211230;
	t=1794396902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ckc84EqrblGll4cu0USqWotlw7a7SUG/myl+FdROgzI=;
	b=VwvyoPDr5TjEknwcJPrwgJ6p7E0pguE3yYkfp88Av23E19cYTyGiIjE9asm2eAAMpHpI2z
	48qIf4+oNR3hOhY3SDx1yZm5ng5VISIFwWkr/3BICvtG1tSUkxhpKAA/HTF9rBs+cN7v+D
	5lxZjipcZ71+9eU1Tasi1L51Rj6tUDUj29DGLLsz2iyPLc2nw4E61X3FNlfhrm9jLQImpr
	94D2sI2jH/NjeR5rKFIdqb8fwcduV8OgvulJe3QnnCDvuGk2VOTYA7SwZRkzo394m0d6yK
	ufLlwlc4LxxC45Sw3VuyUN9bcIOKEFFdjWH/nTXYu1AJjIJ7E1mHxdVnIRrcfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=puzzle.ch; s=20211209;
	t=1794396902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ckc84EqrblGll4cu0USqWotlw7a7SUG/myl+FdROgzI=;
	b=kKiQ20Z43b6xewiNc+JpZeIQlS5sywYcSwbq7R1n6bc33BpALXlDvc7u7WKeCfM0HsE6He
	1iS/E83OIvaSFWxRoeIhjDP37JBSSY8cBZONdoJOS7Mev7W1C8ofeSqkyo21XYvSvoJp5x
	eqW9XHJEXFNut0+/ZT2dWX9JimKA1iHPkCxojaJ5vb4sxFrxnQ8pDsXGalszb8ANm2cckv
	V1+ONKP9kuEIWcFNZaOnYjc4OYkrMeOTzXK8QnHVy89KB6OiCFq89VHFCdupIFSizq3VSt
	hI7cYXx47Fd9M51z5njA2OBdESMkQXAidKGwHKWSZimy3Z93FzWUuoN9j8nwGg==
From: Michael Grzeschik <grzeschik@puzzle.ch>
x-ms-reactions: disallow
Date: Wed, 11 Nov 2026 12:34:53 +0100
Subject: [PATCH 1/2] usbip: stub: reference count struct stub_device
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
Message-Id: <20261111-usbip-v1-1-da5217ac71d7@puzzle.ch>
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
In-Reply-To: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
To: Valentina Manea <valentina.manea.m@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Grzeschik <grzeschik@puzzle.ch>
X-Developer-Signature: v=1; a=openpgp-sha256; l=9893; i=grzeschik@puzzle.ch;
 h=from:subject:message-id; bh=Dc0wEdyGlUJ5dKrv+6ujVORpXLfHRVkmjaQ5pdpZuFo=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBq9FLkBHQsYP5IY7keOVeNKN1am+XUw7iyjvLMn
 0REZQwVifyJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCavRS5AAKCRC/aVhE+XH0
 qzS0EADDY+wzpIaruqOqNRhdJU0PmBpCtYm2iFPD2M7vrUl381lw7O6reZs0F3fSaL/VbTZdbKT
 75u97GWhSRcH9JOXLgCks2DEYrLOT49tRhx4aCRf1hK//XCnERsWnw7+AwvZvzbRaNgSmagL0n4
 HFc8yuRSAQbDuR2Vx6j5U8PPoi097dDlzeoBQioZeOGMTsuPI6LSSTP11tdZFIMBV5QExL/Ejfy
 HyjZYDsG695m/rPnpGOu6nRHh+3LG/e9gMwY+KHODUp7N0rDEVOhEe3XCkQIP93mvnVuXILm2zT
 yQTd9F9x9IDCEBr/wAV77E9TQ5WTvI4hMnb/7x1yR+R+Q70zJTwq3hD5frjvgW6s1uSQX0F5PKA
 rDJ6xgt13bOyIspXc5oCucqCq7TunkNkapyxxeRrQBPXYY2SIWG+OwA12PJmt7PlanHDojGIZAb
 gyyPE0Bd7ENOhbA9coIhQiV+gTXigMuNeY7mnxZoK8ICXgdMlKc0t//kzVp2s8xZMAqQNst3oyK
 cXRRakPqFJE+EVj+Xz/6tWqMBF5Jn70R3CAwMZ/+6pPvQMAbimjTnb8jyl2dFj/5ABMg9oTmSi7
 h05juM+oYZoKKF+GnHjI6cp/BrUE6umZhmD4mdexC/kloWuiVHvQwHJo9NU3V+d7UtZPG68Hcsu
 YRUVYZzjXTTabjw==
X-Developer-Key: i=grzeschik@puzzle.ch; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64

A stub_device is freed by stub_disconnect() right after usbip_stop_eh()
reported that the event handler is done with it. The rx and tx threads
and the event handler can still use it at that point:

 - The event handler clears an event bit after it ran the handler for
   it. A SHUTDOWN requested while a previous shutdown is running is lost,
   so threads started after that shutdown are not stopped before the
   stub_device is freed.
 - An event queued for the device while another one is handled leaves an
   entry in the event list. Once the event bits are clear,
   usbip_stop_eh() returns, the stub_device is freed, and the handler
   then locks the sysfs_lock of the freed device.
 - The stub_device no longer holds a reference to the usb_device, so a
   thread outliving the disconnect touches a freed usb_device too.

This was seen exporting the serial port of an ST-Link from an
STM32MP1-DK2 on a Kirkwood (ARMv5) host. After repeated "endpoint 5 is
stalled" / usb_clear_halt cycles while a client opened and closed the
port, stub_rx crashed in dev_err() with the device pointer computed from
a NULL sdev->udev of freed memory:

  Unable to handle kernel NULL pointer dereference at virtual address 000000b8 when read
  PC is at dev_driver_string+0x0/0x38
  LR is at __dev_printk+0x20/0x6c
  Call trace:
   dev_driver_string from __dev_printk+0x20/0x6c
   __dev_printk from _dev_err+0x40/0x74
   _dev_err from stub_rx_loop+0x5d8/0xd68 [usbip_host]
   stub_rx_loop [usbip_host] from kthread+0x100/0x120

Reference count the stub_device instead of relying on the event handler
for its lifetime:

 - the binding (probe until disconnect) holds the initial reference,
   stub_disconnect() drops it instead of freeing the device
 - the rx and tx thread hold one each while they run, taken before they
   are woken and dropped when they end. If kthread_stop() reports that a
   thread never ran, stub_shutdown_connection() drops it for the thread.
 - the event handler holds one per queued event until it is completely
   done with the device, through new optional get/put event handler
   operations, which vhci and vudc do not set
 - the stub_device holds a reference to its usb_device again, dropped
   with the last reference

Threads that miss their shutdown now end when the connection goes away
instead of using freed memory.

Signed-off-by: Michael Grzeschik <grzeschik@puzzle.ch>
---
 drivers/usb/usbip/stub.h         |  3 ++
 drivers/usb/usbip/stub_dev.c     | 69 ++++++++++++++++++++++++++++++++--------
 drivers/usb/usbip/stub_rx.c      |  3 ++
 drivers/usb/usbip/stub_tx.c      |  3 ++
 drivers/usb/usbip/usbip_common.h |  6 ++++
 drivers/usb/usbip/usbip_event.c  |  6 ++++
 6 files changed, 77 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/usbip/stub.h b/drivers/usb/usbip/stub.h
index d11270560c24..fa40f349d640 100644
--- a/drivers/usb/usbip/stub.h
+++ b/drivers/usb/usbip/stub.h
@@ -6,6 +6,7 @@
 #ifndef __USBIP_STUB_H
 #define __USBIP_STUB_H
 
+#include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -20,6 +21,7 @@
 
 struct stub_device {
 	struct usb_device *udev;
+	struct kref kref;
 
 	struct usbip_device ud;
 	__u32 devid;
@@ -85,6 +87,7 @@ extern struct kmem_cache *stub_priv_cache;
 
 /* stub_dev.c */
 extern struct usb_device_driver stub_driver;
+void stub_device_put(struct stub_device *sdev);
 
 /* stub_main.c */
 struct bus_id_priv *get_busid_priv(const char *busid);
diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
index abfa11d6bde7..27d1e9c8db17 100644
--- a/drivers/usb/usbip/stub_dev.c
+++ b/drivers/usb/usbip/stub_dev.c
@@ -11,6 +11,42 @@
 #include "usbip_common.h"
 #include "stub.h"
 
+/*
+ * A stub_device is referenced by its binding to the USB device (from probe
+ * until disconnect), by the rx and tx threads while they run, and by the
+ * event handler while an event for it is queued or being handled. It must
+ * not be freed before all of them are done with it: stopping the threads
+ * relies on the event handler, which can miss a shutdown request or still
+ * have an event queued when disconnect wants to free the device.
+ */
+static void stub_device_release(struct kref *kref)
+{
+	struct stub_device *sdev = container_of(kref, struct stub_device, kref);
+
+	usb_put_dev(sdev->udev);
+	kfree(sdev);
+}
+
+static void stub_device_get(struct stub_device *sdev)
+{
+	kref_get(&sdev->kref);
+}
+
+void stub_device_put(struct stub_device *sdev)
+{
+	kref_put(&sdev->kref, stub_device_release);
+}
+
+static void stub_eh_get(struct usbip_device *ud)
+{
+	stub_device_get(container_of(ud, struct stub_device, ud));
+}
+
+static void stub_eh_put(struct usbip_device *ud)
+{
+	stub_device_put(container_of(ud, struct stub_device, ud));
+}
+
 /*
  * usbip_status shows the status of usbip-host as long as this driver is bound
  * to the target device.
@@ -101,6 +137,10 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 		get_task_struct(tcp_rx);
 		get_task_struct(tcp_tx);
 
+		/* one reference per thread, dropped when the thread ends */
+		stub_device_get(sdev);
+		stub_device_get(sdev);
+
 		/* lock and update sdev->ud state */
 		spin_lock_irq(&sdev->ud.lock);
 		sdev->ud.tcp_socket = socket;
@@ -165,13 +205,18 @@ static void stub_shutdown_connection(struct usbip_device *ud)
 		kernel_sock_shutdown(ud->tcp_socket, SHUT_RDWR);
 	}
 
-	/* 1. stop threads */
+	/*
+	 * 1. stop threads. A thread that was stopped before it ran
+	 * (-EINTR) did not drop its reference itself.
+	 */
 	if (ud->tcp_rx) {
-		kthread_stop_put(ud->tcp_rx);
+		if (kthread_stop_put(ud->tcp_rx) == -EINTR)
+			stub_device_put(sdev);
 		ud->tcp_rx = NULL;
 	}
 	if (ud->tcp_tx) {
-		kthread_stop_put(ud->tcp_tx);
+		if (kthread_stop_put(ud->tcp_tx) == -EINTR)
+			stub_device_put(sdev);
 		ud->tcp_tx = NULL;
 	}
 
@@ -267,7 +312,8 @@ static struct stub_device *stub_device_alloc(struct usb_device *udev)
 	if (!sdev)
 		return NULL;
 
-	sdev->udev = udev;
+	kref_init(&sdev->kref);
+	sdev->udev = usb_get_dev(udev);
 
 	/*
 	 * devid is defined with devnum when this driver is first allocated.
@@ -294,6 +340,8 @@ static struct stub_device *stub_device_alloc(struct usb_device *udev)
 	sdev->ud.eh_ops.shutdown = stub_shutdown_connection;
 	sdev->ud.eh_ops.reset    = stub_device_reset;
 	sdev->ud.eh_ops.unusable = stub_device_unusable;
+	sdev->ud.eh_ops.get      = stub_eh_get;
+	sdev->ud.eh_ops.put      = stub_eh_put;
 
 	usbip_start_eh(&sdev->ud);
 
@@ -302,11 +350,6 @@ static struct stub_device *stub_device_alloc(struct usb_device *udev)
 	return sdev;
 }
 
-static void stub_device_free(struct stub_device *sdev)
-{
-	kfree(sdev);
-}
-
 static int stub_probe(struct usb_device *udev)
 {
 	struct stub_device *sdev = NULL;
@@ -409,7 +452,7 @@ static int stub_probe(struct usb_device *udev)
 	put_busid_priv(busid_priv);
 
 sdev_free:
-	stub_device_free(sdev);
+	stub_device_put(sdev);
 
 	return rc;
 }
@@ -489,15 +532,15 @@ static void stub_disconnect(struct usb_device *udev)
 
 	/* we already have busid_priv, just lock busid_lock */
 	spin_lock(&busid_priv->busid_lock);
-	/* free sdev */
 	busid_priv->sdev = NULL;
-	stub_device_free(sdev);
 
 	if (busid_priv->status == STUB_BUSID_ALLOC)
 		busid_priv->status = STUB_BUSID_ADDED;
 	/* release busid_lock */
 	spin_unlock(&busid_priv->busid_lock);
-	return;
+
+	/* drop the reference of the binding, threads may still hold theirs */
+	stub_device_put(sdev);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index 1e9ae578810d..63571b690f14 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -707,5 +707,8 @@ int stub_rx_loop(void *data)
 		stub_rx_pdu(ud);
 	}
 
+	/* drop the reference taken in usbip_sockfd_store() */
+	stub_device_put(container_of(ud, struct stub_device, ud));
+
 	return 0;
 }
diff --git a/drivers/usb/usbip/stub_tx.c b/drivers/usb/usbip/stub_tx.c
index 4ffd342250b5..44b3e870456c 100644
--- a/drivers/usb/usbip/stub_tx.c
+++ b/drivers/usb/usbip/stub_tx.c
@@ -446,5 +446,8 @@ int stub_tx_loop(void *data)
 					  kthread_should_stop()));
 	}
 
+	/* drop the reference taken in usbip_sockfd_store() */
+	stub_device_put(sdev);
+
 	return 0;
 }
diff --git a/drivers/usb/usbip/usbip_common.h b/drivers/usb/usbip/usbip_common.h
index be4c5e65a7f8..dfacd8530db8 100644
--- a/drivers/usb/usbip/usbip_common.h
+++ b/drivers/usb/usbip/usbip_common.h
@@ -280,6 +280,12 @@ struct usbip_device {
 		void (*shutdown)(struct usbip_device *);
 		void (*reset)(struct usbip_device *);
 		void (*unusable)(struct usbip_device *);
+		/*
+		 * Optional: hold a reference while an event for this device is
+		 * queued for or being handled by the event handler.
+		 */
+		void (*get)(struct usbip_device *ud);
+		void (*put)(struct usbip_device *ud);
 	} eh_ops;
 
 	struct kcov_common_handle_id kcov_handle;
diff --git a/drivers/usb/usbip/usbip_event.c b/drivers/usb/usbip/usbip_event.c
index 0e00c2d000f8..eea9a71f0eac 100644
--- a/drivers/usb/usbip/usbip_event.c
+++ b/drivers/usb/usbip/usbip_event.c
@@ -94,6 +94,10 @@ static void event_handler(struct work_struct *work)
 		mutex_unlock(&ud->sysfs_lock);
 
 		wake_up(&ud->eh_waitq);
+
+		/* drop the reference taken by usbip_event_add() */
+		if (ud->eh_ops.put)
+			ud->eh_ops.put(ud);
 	}
 }
 
@@ -163,6 +167,8 @@ void usbip_event_add(struct usbip_device *ud, unsigned long event)
 		goto out;
 
 	ue->ud = ud;
+	if (ud->eh_ops.get)
+		ud->eh_ops.get(ud);
 
 	list_add_tail(&ue->node, &event_list);
 	queue_work(usbip_queue, &usbip_work);

-- 
2.53.0

