Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792857415;
	b=AS9g8YiNoPaSA/DZ3zIxOBOCNyDlDc5b80Wmqp2neQK/mxD/ALuIGW864TuJy+N+yrm4
	 oPwyHp4NhChd+8BVv6WrR5CP5Q/cBjXS1MhIvUeRW23R79zcEjbO01cGsN4T6irDYV4aT
	 9ppHZmDxN1D2hb8ofgKjbfbVMODXHhApaoVXPhcXmga1tY94lABiMoblaztTGMDBXgu3W
	 7qsJKz3rDCvudlFoTDiPhTLU+/kI7/qYgzTo074+PVMOzFV8hUyU55OevuHfHQPuhtqci
	 sp7ydM2XGYfbxV+dzbn1y/KgZTpGAsJJY1wjsD9CSnuPiw/4BEOdUUiLpH42hRAHNnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792857415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4IGEtUDUP8hIGn1B6H6glwiRUGb2LO/zEIMANk76MHE=;
	b=xP8fKZovMzEptpHqKvdi/x82P9QJdwVTfYprJ6IJBNF0HvC2/hyNZPZ6c+0KpbmtqeAq
	 RVvYPUT+k22ODuBd0whiof8LeWMf2YlCsLfWdYwvUL9uCcOKUQns54WRgnJaB2nftyf6R
	 s8KuuWuYVSrIAUYdrLZCXWHSk94AGplYxfL8+HYebWFGXZlwqfE5Wk87vG9cWnq8lVuoy
	 rxfTWXFxCx4IlUXHqv7irjNY7MgZgCyr5VRSfFWuKgtSNaTCOnR0o11Gkh6L9k8k9nLXs
	 p5HROIgesbrGsgn/jnZ1Lcdc4/bOgX2kUl9z/1daNftfhPG1NXObtOeWuo7K17ZUBsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="cJ/chxiA";
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4B3606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B4B3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cJ/chxiA
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcb6faf862so1690113e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792857413; x=1793462213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IGEtUDUP8hIGn1B6H6glwiRUGb2LO/zEIMANk76MHE=;
        b=cJ/chxiAGQdCLJ7qIgX4jKU3DfB4TEGMxUrjXMK3Cpc23TyIwLB+pczz6G6eNaItEE
         4IopNSI8HH2LZSX1BPlG+NShrscu+D+4Tdupw7beFLq3wBIIS3BRvi+orn2WW9gUpnuC
         jDyHVIvW3SYt4sb6iOW3Mh8DpFq/T0WVoavGq5sGELjnu3mZsfoDcZrB4XO72nHAO7aT
         0ifhjkq8x/Rtcu7FFdZfpFMXABvAgkTufOTaE6YL8UkY3mpWnx6/gj1GTgl3T1g4t+Fb
         eQSHldZTJGVlABideEsHp/GYLYmMFU3hXzIXGQFkFRLXSpTK0TG6dOCqRLA9YvJMqUeJ
         yyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792857413; x=1793462213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IGEtUDUP8hIGn1B6H6glwiRUGb2LO/zEIMANk76MHE=;
        b=UYT52OzoZB7YscQmY6MmUcbtzpMf5yuYbUVAf528kvf2gREZrlB6qkXmoYzkVtTyNn
         iCM7Jr5/YyvP2y1vmcEmfxu7H5sDj+C8UHZ1OBAPLvj+r8b+Ylc8f4QronwdVV9EQ9uS
         fvmy05c5k2smJLVJgu6FOLvZ7nWLMa0TLJrN7SuN5C6+K9GZyoPdaev9ZpgbtSR9VRtz
         DsHyFnFKkpPZUsyh1hMY9NfcDIghuh9O062CpW3AobsTh4GSAqwJPvXQGIocAahVlnDl
         fXFrrl6S40w0tFqVyBcPeB4ieF5Wcv7AoEDqqW1yJH3G+gtVDjDRI1+079SKiN4iE7oe
         kL2w==
X-Forwarded-Encrypted: i=1; AKwUvBzQV1TNyerBqTdeRDcRXNgFZRvOjqZhbZRkRx7z9lW45OO+NgPaMu/gszSHFLeVZBQ5U684tD2k70cUGDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtale2i280rWkYzc94app+45UNrUBWZKARA7NAkPu9KGjgflMC
	RqTeqi/0EbuqRkyU5n308B21Mc+bXUouwcN9NQuLQ1RnoXn6gI7idtKr
X-Gm-Gg: AYBFou2BS6YGEizhWEaNIhWCeXWOQ1S+d4l1roq1p+v99W8O35ASuxjChEMeHCIlQ6S
	jO0oByXDAUBwG5FF0fG22Fl3rH05XJ6Ddk3f8PASXHq7VUkrP1XRemHUSLeE/Th16WLt4zcTU3W
	fDWFtNwEeeQvU4/orVOzNJYzgD9vCUd2yEdxn/kEIZdz6Kshv9yVnjjnVe8Gh/sxboC29prDEWg
	SAQZUnMq0izTBRMAOPbpRzNnB25UR2b8eSBvJIGpNnzsb6vC/vpyR8HX1R47aOUAcakeZloAFyR
	7Edbg5Op6BaZ7czW8+UU8LBEuln451DYTL34hLKg1UVOWUoXNDwmn/aNLo29NoF0XHT0AiDhML6
	atae2s50M3V7MiZDdxnRulqmyNmpdHD+sOy6AjI2SwoxbAmsAe73+IQWuS0iNRkHanH4ycoPt62
	1uG2c12E2br7OrjCHXBOamhrz0b/j9kWo7Kv4sDClVMRIV3BC0wvvdhAzsGTEYQFWtutWENOFXS
	JnYjb/2KGa2hY0JvOMV/qkLFSwMoiBrwRnKhFqZw9h4Ssdz9dS1WCdYoNFBlU57JYndyH8rG7LC
	0WmY0lvJjL/ocy3sNy+wo1tXLqv0ACrAJZdUfBPV7jAiLUiBgz7TCdWkYo3FFHouuc98YVRR7dq
	s3FvaTQ==
X-Received: by 2002:a05:6512:128d:b0:5be:51d0:e355 with SMTP id 2adb3069b0e04-5bfb719e481mr754446e87.11.1792857412423;
        Sat, 24 Oct 2026 08:56:52 -0700 (PDT)
Received: from x870steellegend.lan (95-25-165-240.broadband.corbina.ru. [95.25.165.240])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7d7d6fcsm459298e87.20.2026.10.24.08.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:56:52 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Tejun Heo <tj@kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH v3] usb: core: hcd: flush giveback work on stop
Date: Sat, 24 Oct 2026 18:56:14 +0300
Message-ID: <20261024155614.2732-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023174015.54793-1-igorpetindev@gmail.com>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
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

When an HCD is stopped/removed (either during module unload, driver
unbind, or an error path in probe), pending URBs are unlinked and
completed. However, for root hubs or HCDs with giveback done in BH
context, the work function usb_giveback_urb_bh() may still be executing
on another CPU after __usb_hcd_giveback_urb() drops the URB use_count
and wakes up waiters in usb_kill_urb().

Since the caller may immediately free the struct usb_hcd via usb_put_hcd()
after usb_stop_hcd() or usb_remove_hcd(), the running worker accesses
the embedded giveback_urb_bh structure in its epilogue (e.g. clearing
completing_ep or clearing the running flag) after the memory has been
freed, triggering a slab-use-after-free write detected by KASAN.

Ensure all giveback work has fully completed in usb_stop_hcd() by calling
flush_work() on both high and low priority BHs before deallocating.
Also remove the misleading comment in usb_remove_hcd() claiming
flush_work() is unneeded, and document the queue emptiness in the
usb_stop_hcd() kerneldoc.

Fixes: 8fea0c8fda30 ("usb: core: hcd: Convert from tasklet to BH workqueue")
Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspotmail.com/bug?extid=a5b220cacb0618384d5a
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
v2 -> v3:
- Remove obsolete comment in usb_remove_hcd() regarding flush_work().
- Add comment in usb_stop_hcd() explaining why flush_work() is needed.
- Update kerneldoc for usb_stop_hcd() to state giveback queues are empty.
v1 -> v2:
- Use flush_work() instead of cancel_work_sync() as suggested by Alan Stern.

 drivers/usb/core/hcd.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 8e8a5f59b319..f403795b17ba 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2773,6 +2773,8 @@ static void usb_put_invalidate_rhdev(struct usb_hcd *hcd)
  * usb_stop_hcd - Halt the HCD
  * @hcd: the usb_hcd that has to be halted
  *
+ * The two giveback queues should be entirely empty when this runs.
+ *
  * Stop the root-hub polling timer and invoke the HCD's ->stop callback.
  */
 static void usb_stop_hcd(struct usb_hcd *hcd)
@@ -2787,6 +2789,13 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
 	/* In case the HCD restarted the timer, stop it again. */
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	timer_delete_sync(&hcd->rh_timer);
+
+	/*
+	 * Even though all URBs have been given back, the work routine itself
+	 * may still be finishing up and accessing the usb_hcd structure.
+	 */
+	flush_work(&hcd->high_prio_bh.bh);
+	flush_work(&hcd->low_prio_bh.bh);
 }
 
 /**
@@ -3059,16 +3068,6 @@ void usb_remove_hcd(struct usb_hcd *hcd)
 		usb_disconnect(&rhdev);		/* Sets rhdev to NULL */
 	mutex_unlock(&usb_bus_idr_lock);
 
-	/*
-	 * flush_work() isn't needed here because:
-	 * - driver's disconnect() called from usb_disconnect() should
-	 *   make sure its URBs are completed during the disconnect()
-	 *   callback
-	 *
-	 * - it is too late to run complete() here since driver may have
-	 *   been removed already now
-	 */
-
 	/* Prevent any more root-hub status calls from the timer.
 	 * The HCD might still restart the timer (if a port status change
 	 * interrupt occurs), but usb_hcd_poll_rh_status() won't invoke
-- 
2.47.3

