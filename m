Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113079;
	b=mfoKLxGLSg0H3uAuLJxpS9/fL5oi0RSCYJE3po/7Ixwo9X/sIUCSt+/f1ojEdX9fz6uJ
	 83CcKaIwyKSV9+zcv5AqppMPkLqanJFbWeS2TrEhKIK7psYAqyZUD4/KjkBhQzINtJtfx
	 +FljzPOzCOkF+qkSsq4rtnPCG0PCLi1OsITK12Iaho9gfYbHGT/ilGEhmEMh/WniqSCXq
	 Bf1rdfuMxGZbiZBRp4iAPAgB1BFR6vas+9xiZaUEAwLpx+QPY1dbNu5vAS7u3Z18eGBCI
	 5pxVFDULyJoTWTVB7jCLKj0em9SrhCDdC6xK3R/zKxfjDlp48r55WqNyHLZMzzPPPBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113079;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=I1shV1sl2ohupoS37vOHazzL5paqcty1mTG8cjOD20A=;
	b=GmFOAwhKDOUNaZtRbbev6Y/Na6Lv0SLIZJA5hYLNdCVQtfxL4WMgze4sYxSipQmLQTiY
	 s+X6fUjmyuHb0deRlW6Wel6wGAcifK4YDUuZ8jDkJiY45XMYWk2yDgV/tPs5PTQKwlea/
	 v0F3obwka+cBgTCCWU/b4IGP7tqx09tJZpYFSxyI/DR9WQZRyiSfPC3mOpCRAz3DMadXY
	 UI9vHkqzXQrO/hioXz77MgcMYVB7bqYVYx3hRBYbE0jUt9IGHD6R7EM6AHfNPcLJ8gnoe
	 1bVMdjLx27ygdOHZZmI3U0BSHoSIJTAjjYz+4uhMqT5KEDRtb7fgH/gVqdx7OS4w4Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=LOQPBEgH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63393606A32D;
	Tue, 27 Oct 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=LOQPBEgH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8140D1F01828;
	Tue, 27 Oct 2026 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113079;
	bh=I1shV1sl2ohupoS37vOHazzL5paqcty1mTG8cjOD20A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LOQPBEgHiCjTez2GXgXAQ6lx6wYqUCdzxI04nPfjOzXRBLOFPZw0DcfoEUCRpL6pn
	 XfIT59kJupNZO/tvF0U0nWB1QszcPeUo0ibA2pAOwpwjopJRoLd05iXv4CinU3BgHR
	 39xKKjI0SVmnU5/wHLSBOWDu/AwbwsqQBUvztR1Y=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:42 +0100
Subject: [PATCH 02/19] USB: core: signal the end of an sg request last
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
Message-Id: <20261027-llm-usb-v1-2-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=4280;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=Mxgi4X+5VxJNFw8BT0Sl3aw+EjmSwE9O76rAwa4ugBc=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr9bMqnL3FZHKo8l9EVvdlvZL9UWj60y2t1X7ogeF
 p9sM1+yI5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACbiZMAwh7u//s1+O/aDZbPP
 KbMIxr5/NbHmB8NcMZm17rs5u5ZtF1ny9H26d57Ws/pKAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

sg_complete() and usb_sg_cancel() call complete() with io->lock held and
unlock afterwards. usb_sg_wait() does not take the lock again after
wait_for_completion(), so it can return while the other CPU has not
unlocked yet:

  CPU0 (giveback)                     CPU1 (usb_sg_wait())
  spin_lock_irqsave(&io->lock)
  io->count--
  complete(&io->complete)
                                      wait_for_completion() returns
                                      sg_clean(io), return
                                      the caller reuses the request
  spin_unlock_irqrestore(&io->lock)

The request is the caller's. gud_usb_bulk(), sur40_process_video() and
usbtest have it on the stack, so the unlock writes to a frame which is
gone. usb-storage, rtsx_usb and vub300 call usb_sg_init() for the next
transfer, so the unlock hits a lock which was just initialised again.
The window is a few instructions with interrupts off, so this needs
something which stalls CPU0 there, like a preempted virtual CPU.

Note that the count reached zero, drop the lock and call complete() as
the last access.

This alone would open another window. After its submit loop
usb_sg_wait() takes the lock and calls complete() itself if it finds the
count at zero, also if it was the last URB which brought it there. It
could then return while sg_complete() is between its unlock and its
complete(). So far the lock kept the two apart. Let usb_sg_wait() only
complete the request if it has URBs to subtract which were not
submitted. Then the count reaches zero once, and only who brought it
there calls complete().

Fixes: 056ad39ee925 ("USB: core: Fix free-while-in-use bug in the USB S-Glibrary")
Cc: stable <stable@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/core/message.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index a738d03c23ea..204fbfd8171b 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -465,6 +465,7 @@ static void sg_complete(struct urb *urb)
 	unsigned long flags;
 	struct usb_sg_request *io = urb->context;
 	int status = urb->status;
+	bool done;
 
 	spin_lock_irqsave(&io->lock, flags);
 
@@ -520,13 +521,16 @@ static void sg_complete(struct urb *urb)
 		spin_lock_irqsave(&io->lock, flags);
 	}
 
-	/* on the last completion, signal usb_sg_wait() */
 	io->bytes += urb->actual_length;
-	io->count--;
-	if (!io->count)
-		complete(&io->complete);
-
+	done = !--io->count;
 	spin_unlock_irqrestore(&io->lock, flags);
+
+	/*
+	 * On the last completion, signal usb_sg_wait().  Its caller may free
+	 * or reuse the request as soon as it returns, so this comes last.
+	 */
+	if (done)
+		complete(&io->complete);
 }
 
 
@@ -753,9 +757,16 @@ void usb_sg_wait(struct usb_sg_request *io)
 		if (retval && (io->status == 0 || io->status == -ECONNRESET))
 			io->status = retval;
 	}
-	io->count -= entries - i;
-	if (io->count == 0)
-		complete(&io->complete);
+	/*
+	 * Whoever brings the count to zero calls complete(), once, after he has
+	 * dropped the lock. If all URBs were submitted this is not us, even if
+	 * the count is zero by now.
+	 */
+	if (i < entries) {
+		io->count -= entries - i;
+		if (io->count == 0)
+			complete(&io->complete);
+	}
 	spin_unlock_irq(&io->lock);
 
 	/* OK, yes, this could be packaged as non-blocking.
@@ -780,6 +791,7 @@ void usb_sg_cancel(struct usb_sg_request *io)
 {
 	unsigned long flags;
 	int i, retval;
+	bool done;
 
 	spin_lock_irqsave(&io->lock, flags);
 	if (io->status || io->count == 0) {
@@ -804,10 +816,12 @@ void usb_sg_cancel(struct usb_sg_request *io)
 	}
 
 	spin_lock_irqsave(&io->lock, flags);
-	io->count--;
-	if (!io->count)
-		complete(&io->complete);
+	done = !--io->count;
 	spin_unlock_irqrestore(&io->lock, flags);
+
+	/* Don't touch the request after this, see sg_complete() */
+	if (done)
+		complete(&io->complete);
 }
 EXPORT_SYMBOL_GPL(usb_sg_cancel);
 

-- 
2.56.0

