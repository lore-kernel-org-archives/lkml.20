Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641217;
	b=2yKMSy22fVfI3uPPj21tQkEDiRoERs9MvlsBdKGAjZ0BlVzgnGntI1zupzS8rw2hoWDm
	 Tcuoxrct8sXzun8s+S/WmA/V86dpxCPnFgyI3hjBBqHjsP97nny82zdCO5w1UBaaaoRfW
	 opIYCUPxqqaMv+KCWyyfnMMXJojQjMgH461Vy4uefkJmqE4TWQgF4zcf8exdmHuTklWXi
	 h0PqVXe4sdtKCPo6CznIkbdiyFGg8REtqkV86OS7JNnCPobpiBlkq2a4iDOuBewavGZyV
	 axDL+3ODvNRIP0tX16ZsrxC9BwCPi/01cbsps57kksXQAozkGpBernOirw9aKvuGNJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641217;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pmCm0VY/35PyEXuwvzY8jI/4ezEWltsiR7PLhroRjx0=;
	b=oslyiaJ+TOVvlbCGTWAKse1zDKHBeNzRM9h20cC/3I0E9155y4A/lggXNgKlrjLzgfpY
	 3z8TF8r0VoqQ1rmu+PE/n+D5Co39ivSZg+Qdt6rW0YofNfnLrPi3vyC/yQDuIqUN8O259
	 oLeaWhao17q2ZyXrLlG9VFdPCAx0JHd1lYk5T/2Wb7NGvGyHtOVecPs1IolM4BoaChs2r
	 C+OSA/dxQOcbeE6WFzOS3oAeo5LTbt56IjHXoonAbuMNEdMhfD3aEIrh2+hIlPoL9SKo4
	 bChmPLOuh06mD2xVvxgL3WnirmKAXJmVRY35+mQR1CU/Or9Q0p5aKmTRCIpKVua7XbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF7606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49FF7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so2005343c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641216; x=1793246016;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmCm0VY/35PyEXuwvzY8jI/4ezEWltsiR7PLhroRjx0=;
        b=AsYTV4QsfQssREKJfKah8h0MmVua9ZwD68q4mplN7rJ0R5T1JlXbLl/AKb3M3xlZMe
         kLSz9wjHLhXU4ruIHsj71nG2PfBAtkpWhwO9faa4/19pLKvH4rcAL9lNHxyqEca7k1ui
         qzeDqfe6wMaXVyFkpYzEGPG323hd0e0V5ZlBgWVX5oRUg7ELbyt8IPnedXQRtKBKzhwA
         ZNR/3d8/0Sec6cuLjPSidY04Qa9qiQDpMUmbcxNvRzq0qVIg4qjClyJpABV1rOxUK92w
         v4HEQTkXlPeJOdocHH25/pQR16nByYcsTDxpyfRQxPgv0M4Ugx9S5b3iNMBYX269NfeH
         kDMA==
X-Forwarded-Encrypted: i=1; AKwUvBxBxXnIV9Lax/I7F0/uKH0OeniloxXIv9ZzDdxf6hC81jKOIRKv8WLulv0X94uAc9DmkhwQ/15wZ1IUdK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVbOepbURm11SZPxBqqlG2qJL4gDWiVyTbKmNsoGvRXG+4t0Dd
	hPDEHhoQxCHLmeyHUwHKCiqAP7JxoAwNNFLVWLM6AKl7f2SGCY1V1/Kp
X-Gm-Gg: AYBFou2lQfmsfwgEMY3/KDKXgvE6Lrq88vHBywMmDcSgr6zWI++UZ6szYwExgkD1WG+
	Vydwjy2EyjBC222P+CRytZFW6D2O8kTWiCWo8Y7+Hip1UKP9yX4Y53buDxtbwJ+zLZELb887fqW
	JLxoSzI2kfpQOMWsBazoyBFC6Fuq3YcEjEe4Mfloec8V4jqUvqjHvGqrJz75auaHVcn7R5G4axC
	Jf+YGZ/1VH36iXl8tQg71twnqFhVz8XqSza9rbCbb6uNYJQnQiLRS1jMM2RRjV+qR17z9XtTMHu
	FWTqAmPQ6m8opP1hHOormLO0w+1CfDMjn5P8YHQwOX02TN3DZKWF4usDxo9AlrmsAsUSpQhiV2a
	EWVkBlFHBYu6dTBbq9h6hlHxQkyoRteJg8gDCNam4tNkDh5jpWetK1Olhgp8BJ03vSvYJ1/XE9g
	EebM9fnyEpP/3hTYiT/mGjJqyMwDRLX5Q6v5ELr/lf0tThEOQocUl6b3MCBWPb3REAmfKEFqeRb
	YhgQ36Z4lWtAdwCXM/WogRPoO/H6Hlwf7kZc19neStx7FwTwdY86xBU2cOuqlqecOBG1onWJ4Hy
	CfArzgJmbPLOiWiLMnTFURLJZPtS2js8RtSGK4/+x9Skehff7PCYyuc6tvg=
X-Received: by 2002:a05:7022:3b86:b0:190:b2a0:7250 with SMTP id a92af1059eb24-190b2a07272mr5289513c88.10.1792641216007;
        Wed, 21 Oct 2026 20:53:36 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm10979489c88.22.2026.10.21.20.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:53:35 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oliver@neukum.org>,
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
Subject:
 [PATCH 2/3] usb: core: Close anchor capture-to-increment race in URB giveback
Date: Thu, 22 Oct 2026 11:53:33 +0800
Message-ID: <179264121348.17277.2207660107714201051@kylinos.cn>
In-Reply-To: <179264120148.17277.68253767316647311@kylinos.cn>
References: <179264120148.17277.68253767316647311@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

__usb_hcd_giveback_urb() captures urb->anchor into a local variable at
the top of the function, but increments the anchor's suspend_wakeups
counter only after unmapping the URB for DMA and running the usbmon
hooks.  Nothing pins the anchor during that window.  If the URB is
concurrently unanchored by another thread -- a driver calling
usb_unanchor_urb() on its own in-flight URB, or usb_get_from_anchor()
or usb_scuttle_anchored_urbs() taking it -- the anchor list can become
empty while suspend_wakeups is still zero.  A
usb_wait_anchor_empty_timeout() waiter then observes the wait condition
true, returns, and the driver may free the anchor (anchors are
typically embedded in driver-private structures); the giveback's
atomic_inc() on the captured pointer, and the later decrement and
wake_up() in usb_anchor_resume_wakeups(), operate on freed memory.

The previous fix ("usb: core: Fix use-after-free in anchor wakeup
protocol") made the waiter's condition check and the decrement/wakeup
side hold anchor->lock, but its guarantee was deliberately scoped to
givebacks that had already incremented suspend_wakeups: the
capture-to-increment gap remained open.

Fold the pointer capture, the suspend_wakeups increment and the
unanchor into a single anchor->lock critical section which re-verifies
that urb->anchor still names the captured anchor, so a giveback that
lost the race against a concurrent unanchor performs no anchor work at
all.  From the verified increment onward, a non-zero suspend_wakeups
keeps waiters from freeing the anchor until
usb_anchor_resume_wakeups() has finished with it.

What remains open is the few instructions between reading urb->anchor
and acquiring anchor->lock inside the new helper: a concurrent
unanchor plus waiter return plus anchor free would all have to fit
into that gap for the lock acquisition itself to touch freed memory.
This is the same residual exposure usb_unanchor_urb() has had since
usb_anchor was introduced; closing it entirely would require a
lifetime protocol change (reference count or RCU) for anchors, which
is out of scope for a bugfix.

No syzbot report has been attributed to this interleaving; it was
found by extending the analysis of the previous fix.

Fixes: 6ec4147e7bdb ("usb-anchor: Delay usb_wait_anchor_empty_timeout wake up=
 till completion is done")
Cc: stable@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oliver@neukum.org>
Cc: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/core/hcd.c | 10 ++++++---
 drivers/usb/core/urb.c | 47 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/usb.h |  1 +
 3 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 8e8a5f59b319..f221425fec0a 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1630,7 +1630,7 @@ int usb_hcd_unlink_urb (struct urb *urb, int status)
 static void __usb_hcd_giveback_urb(struct urb *urb)
 {
 	struct usb_hcd *hcd =3D bus_to_hcd(urb->dev->bus);
-	struct usb_anchor *anchor =3D urb->anchor;
+	struct usb_anchor *anchor;
 	int status =3D urb->unlinked;
=20
 	urb->hcpriv =3D NULL;
@@ -1641,8 +1641,12 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
=20
 	unmap_urb_for_dma(hcd, urb);
 	usbmon_urb_complete(&hcd->self, urb, status);
-	usb_anchor_suspend_wakeups(anchor);
-	usb_unanchor_urb(urb);
+	/*
+	 * Capturing the anchor, suspending its wakeups and unanchoring
+	 * must be atomic with each other; see
+	 * usb_unanchor_urb_and_suspend_wakeups().
+	 */
+	anchor =3D usb_unanchor_urb_and_suspend_wakeups(urb);
 	if (likely(status =3D=3D 0))
 		usb_led_activity(USB_LED_EVENT_HOST);
=20
diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 3afd184c9b32..c78f72bc7cc0 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -14,6 +14,8 @@
 #include <linux/usb/hcd.h>
 #include <linux/scatterlist.h>
=20
+#include "usb.h"
+
 #define to_urb(d) container_of(d, struct urb, kref)
=20
=20
@@ -205,6 +207,51 @@ void usb_unanchor_urb(struct urb *urb)
 }
 EXPORT_SYMBOL_GPL(usb_unanchor_urb);
=20
+/*
+ * usb_unanchor_urb_and_suspend_wakeups - atomically unanchor @urb and
+ * increment the suspend_wakeups counter of its anchor.
+ * @urb: the URB to unanchor
+ *
+ * Used by the URB giveback path, which must capture urb->anchor and
+ * increment anchor->suspend_wakeups atomically with the removal of
+ * @urb from anchor->urb_list.  Otherwise a concurrent unanchor of
+ * @urb (a driver calling usb_unanchor_urb() on its own in-flight URB,
+ * or usb_get_from_anchor() or usb_scuttle_anchored_urbs() taking it)
+ * can leave the anchor with an empty urb_list while suspend_wakeups
+ * is still zero, so a usb_wait_anchor_empty_timeout() waiter observes
+ * the wait condition true, returns, and the driver may free the
+ * anchor before the giveback gets to touch it.
+ *
+ * The verification of urb->anchor under anchor->lock makes this safe
+ * against racing re-anchoring, because "urb->anchor =3D=3D anchor" and
+ * "@urb is on anchor->urb_list" are changed together only while
+ * holding anchor->lock.
+ *
+ * Return: the anchor, which the caller must later pass to
+ * usb_anchor_resume_wakeups(), or NULL if @urb is not anchored
+ * anymore (a concurrent unanchor won the race).
+ */
+struct usb_anchor *usb_unanchor_urb_and_suspend_wakeups(struct urb *urb)
+{
+	struct usb_anchor *anchor;
+	unsigned long flags;
+
+	anchor =3D urb->anchor;
+	if (!anchor)
+		return NULL;
+
+	spin_lock_irqsave(&anchor->lock, flags);
+	if (likely(anchor =3D=3D urb->anchor)) {
+		atomic_inc(&anchor->suspend_wakeups);
+		__usb_unanchor_urb(urb, anchor);
+	} else {
+		anchor =3D NULL;
+	}
+	spin_unlock_irqrestore(&anchor->lock, flags);
+
+	return anchor;
+}
+
 /*-------------------------------------------------------------------*/
=20
 static const int pipetypes[4] =3D {
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index a9b37aeb515b..362bfda497cc 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -20,6 +20,7 @@ extern int usb_create_ep_devs(struct device *parent,
 				struct usb_host_endpoint *endpoint,
 				struct usb_device *udev);
 extern void usb_remove_ep_devs(struct usb_host_endpoint *endpoint);
+extern struct usb_anchor *usb_unanchor_urb_and_suspend_wakeups(struct urb *u=
rb);
=20
 extern void usb_enable_endpoint(struct usb_device *dev,
 		struct usb_host_endpoint *ep, bool reset_toggle);
--=20
2.32.0

