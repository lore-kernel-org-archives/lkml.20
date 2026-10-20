Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506305;
	b=pM2n3wQuXWa6wknSc2Uu4uajmzT1JtluEWRb0/K8thezK1Vd7iZ3EkB4CsoQ+mfEo/ZN
	 iipcfdX1FhuIWI+mByWRsR3WNqI2NQ9VHgd6OOipr7UZ0DYWcQ0G7oDgoS3RHDZQPoQtm
	 u0Nw/HU1ImLcBb29wXTTaqpSqBIvOTJVj0zXkweeYJX/dF8c14pL0TfB04wXhl21eplZk
	 wCzXCHOyGmIN+K6wJwlVwE7S86iaq4N6HgnmNvMaHONWuhCloCDFp5unJ+ewDXPlcJzt0
	 A/SjfhpFp4tZMhkF2KG9sffbWMoL51/3YBsWqUcjWbew6ImJ08dkoRniNgQGY+folXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=B4KgMKGJExw2NIRAFHLCe3T3gCFWPlSlhOpBnCMSFXI=;
	b=jxwXsjQL3H0mDEww3CoVoPSBnHXS5ol85y8566f7uxZtN5n8XdluA/T8TAYmvD2+i/Gy
	 pXCGhv0ZePuC4pgxHoBUlsJWPBGqtCorsyXTzafFBs6CRZJ/4wCMDidvuuzSoKYarqFC9
	 prXFjhiclzKf3LxCFtq7e2/j3uwrKRxHgUdNmuHb8JNRuGP2h5j+6eQypcNvso6JxJaS0
	 dcOBU1xuiFYhY10KqHA2aLBFtZz+8alGxv+3EE44hzKfwz35RiK4LkXKTKQpS1gzRTED+
	 FevPWYPPLWnubPaXBdXfMoJ/oqcjzu/qkLY1cKzLRnz5T6/+ZEB0Hi8q9tZ3xkoyJDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bS6KFzwa;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036D6606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 036D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bS6KFzwa
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab7b8e6fc2so375587a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506304; x=1793111104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4KgMKGJExw2NIRAFHLCe3T3gCFWPlSlhOpBnCMSFXI=;
        b=bS6KFzwavUcNiOSPpe77g0j447VzmfSCy8X4mBurYxhyqxMySHXpqozViwljV5Ux0g
         JvNpNyJRFL/e3+E8khJl7JoFei8hhyYlAOobKEoz0dnKEKEpHVR1HDSCb/VvsB1gXx3e
         /LsZD28O4H/xRVd+Pt8+f0rMcifNs0wvYFJJf+GjqByZp/VS7nIChdyOVWf2s4jpwe9/
         woD+T7v4tHGQuhcLopEnTaKE3Zvr+GAUW9a9pfKDXUTJQJ8rcACNpxFGx4uF9ZNaTyzT
         uucJWA54e7ASvAvTLGuuemp5iC2yukK0YSea6ZkZSki3jgdbVOP3cn7T2aPTM+Zi8tD3
         ROZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506304; x=1793111104;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B4KgMKGJExw2NIRAFHLCe3T3gCFWPlSlhOpBnCMSFXI=;
        b=juwvziO55f9MOuYKMhILYr9O6cYEu7QvTPuOXmw31PxXzDHlVuFcjqvGhhFxZQ+xXv
         ci+H6ZpVEZn/jZMvVn3cH6i/ITL/zAiNgJTXES7dZMKKJBbJ/+8KCob7QlJck9d3lsXi
         3zY26//ZrAJctIezqj5/oEbR90coddH6H9AF3RPFZwy5O0kI6YtMG2PvGdDYblvzAwyn
         RVzJkO0LY/MI3Ot2M42EE4VWi3W3NnzCNEwIkdGufVZtg6ItJdlh9Egs2Me+sD6vuv96
         4aG5p1qclQEt+NTect7Hqc8519FDILmxKe9sAKkv3j2qy/fkelvW4qOE4yQUBJLjUEbt
         BqYw==
X-Forwarded-Encrypted: i=1; AKwUvBxmVT4CIDr+0L0c7icAFchyAEW1e2q8ASXPuem9eqbKlAr16uZqTdFRWoOlrxa2IHzQR5dQ4xgGgoVfOl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjTdUm97Wzv+FpDbhPX9EDJykxZ86ePHM+Z2zm9yI5rIN2BPJ+
	siAq5UVS48miBJNQXdAMLkw/z3Enmqntvtz+wylr6gbXFlGp8yRyDLta
X-Gm-Gg: AYBFou1X6pW0EBsOW3x5v/R62szptFlymW+FFl0JgUuc4uMhh2oPD7CcM6YR3dcPYdI
	s04DTluZrPpulcv8meJOSls1iSKSCUENr7tPd7VIb6IX2Y8wxvqgN1j+pvevW9LsjR3qpZDHiAL
	L9s8+XfROOmrERIJnAqTQUmJ08KSAh9dSQV/k4DM09g6wat7pHEUKvEGNC8XBUQrIA8K73xDMqG
	UuR/caszEyrnvZCDxsQd50MSKE/9ziOCaDP+R9ObldcVACWvEL84BLV21L/UlDVMeh4urwjR/56
	rtdS9gxpaeV9Spx9xOZLAfcTRnhiBjoMP/KRXPx7cuNLTmNE1rc88tKdO3VLk6Vb0HlflP2uQbl
	bxgqsx1WdGuhrHtO7eCTy8vNxGwjpRLozyC9KbhRcR/DiDxppjXEdf1Lcir+ZNNMDHKkfcflFv4
	4uDtjUYQmbDoA6GuKxdi0HIrs4kTq2CDKcKMk9Kn34dyFuV8Q1Tc7w4685ArHKdRuhlCS6dTe8+
	hvxaHrGj4hMaxYpnA2j4aWx0WHJDkfZNBr0kzJ5WyLOLvsz0co/PRQIZJi3xwL8M57vMspjcCR1
	cOM2jz1Q
X-Received: by 2002:a17:90b:28c8:b0:3ac:77a2:18b1 with SMTP id 98e67ed59e1d1-3aceefbae48mr15921906a91.5.1792506303983;
        Tue, 20 Oct 2026 07:25:03 -0700 (PDT)
Received: from [192.168.31.234] ([183.193.19.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60f90a6bsm3570784a91.13.2026.10.20.07.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:25:02 -0700 (PDT)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, stable@vger.kernel.org
Subject: [PATCH] usb: musb: fix double put of gadget device on setup failure
Date: Tue, 20 Oct 2026 22:24:57 +0800
Message-ID: <179250629747.20696.17364135141613638741@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

musb_gadget_setup() calls usb_add_gadget_udc() and, when that fails,
calls device_unregister(&musb->g.dev).  But usb_add_gadget_udc() already
releases the gadget on failure: usb_add_gadget_udc_release() calls
usb_put_gadget(), i.e. put_device(&gadget->dev), in its error path.

The device model documents the same rule in the kerneldoc of
device_register() (drivers/base/core.c):

    NOTE: _Never_ directly free @dev after calling this function, even
    if it returned an error! Always use put_device() to give up the
    reference initialized in this function instead.

The extra device_unregister() therefore runs device_del() on a device
that was never added (or was already deleted) and drops the reference a
second time, causing a refcount underflow.

Drop the redundant cleanup and just return the error; the UDC core has
already released the gadget.

This issue was found by manual code inspection.

Fixes: 3301c215a2bb ("USB: UDC: Expand device model API interface")
Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>
---
 drivers/usb/musb/musb_gadget.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 016d3f3fc1e0..4bc4270088bc 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1794,13 +1794,9 @@ int musb_gadget_setup(struct musb *musb)
 
 	status = usb_add_gadget_udc(musb->controller, &musb->g);
 	if (status)
-		goto err;
+		return status;
 
 	return 0;
-err:
-	musb->g.dev.parent = NULL;
-	device_unregister(&musb->g.dev);
-	return status;
 }
 
 void musb_gadget_cleanup(struct musb *musb)
-- 
2.54.0.windows.1

