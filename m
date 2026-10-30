Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341296;
	b=sc1aEvZUVLzlp+ds5f+uT1qurp7amHYTVka6G108vbDxm08UAX+oVyXKPfQf/9cOcaYK
	 6u0bSRVQV0oQOOrArY747B4/vie/O6dCTZhjw0PHHuyh4rCV+H1eylsL4wwrk06GHKcVx
	 5jBWUqZxSp7dDS9tRJlaxTeebb2Aklc1o2CKQjdIQkbBkVOIRrZMvwL2KlQDi1T0VJoyV
	 Yi6m5S5rx0XF88O0qZCVjb82DT7nz/NDVXsbGSvFiGvbzamb3IqzUa5AH/4wWewQNyu4y
	 jpKbZo1QyKv8ZNzXwZvpn8UACvIPhTIB+kWLPh5p/oAr0f0uhfmEapXlcryDQbvsrPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5+qO4e9aoObV5kHfUDxwiB5My/f+mDNdyNiwUBLcB90=;
	b=oTzPwC1+abjoi/TKfM7il8wtSKrzCIwF+TFurAJoPn3hO6WdgxA1xdYGJWghW/0mFgd9
	 L5drbL4gmT1+x60Fg140Nrz19ZaSIhihh4BpKZNxWYTPlrgoFINaPP5FX2YydS5u51Cgu
	 DJhzelXpkmmlNBdFr+KmiNiZz7fmTL+0C5EYIWuNJ69nKrAwyYuO7jylzIM6+qabrBPL7
	 sQnBKjFsiQlEhdK+8zOC7ty0hKRHCJqA3QRgdq+hsngbPnJsKKOHlvCh3VVoWEoTUzlj9
	 DkH4m7n1g9XCuUQUHPLXi07h5QKEH2tusrLaVBRA+VUG64sujNKWeqENivorBsbitMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwioNr5g;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00124606A326
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00124606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwioNr5g
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so260097f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793341294; x=1793946094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+qO4e9aoObV5kHfUDxwiB5My/f+mDNdyNiwUBLcB90=;
        b=WwioNr5g0fkNHOfXoIjb6acMGFhGrQGJR1BAJxXRmb1p3QzoQyB3jZ9tAnUwLHnJt2
         uP5MGO4BJbsgdm2jHS3ekAJ/N8JoS72Y8Sje9ag9QDi1unxLIWETHevcNmsk8zW9bHcq
         kjBYarALxYbQD62IC/0RBapHeUJVzjsM/3EN3fPj533HjeDBsfpTQKzZam/7UPckW9Pv
         FOQp/68zb6xlmIQXyqwc77hFrdotL1xXqazXftWgsFWk/LOKVG9GskvYwTUMyGup4hR8
         khb+geC4lq2kqtATn7jWGvf8H1vzqmuYrUJF2+FB4+tqooNKPqWU3FZ8pAJva6eUsmTr
         1qXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341294; x=1793946094;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5+qO4e9aoObV5kHfUDxwiB5My/f+mDNdyNiwUBLcB90=;
        b=Ai13CT7DWf1hX+g/sUZg0Vug1U8xOYBfrU31/OW07sHm1qaz5sd6kJHkUBmoce8Cyi
         xEXsWVQizfswq+Go0Lj4tL7GMr8GIXGD+MiUCgyEfQ32dhSs++AuxHvfyXAWVKbas2dr
         opX66kXgC339tSq+vMVjr5EgV9fcI6NvhTIy0UMloij5aPbFWwnZOv+XOqXFRs4fiE3t
         6/cSiXZfA5rJt7OXMUMdO14DKsb/q8ciqMKhesQltT1s571jmza2ttZceKmuBuU7YHyv
         y7RO7G3KEF4fxGFYrosHjsxfnMX0Jxoaor9RfWEB1D3qQM8D13fyPYAcSKrqeL4ooXl2
         Je+A==
X-Forwarded-Encrypted: i=1; AKwUvBxuS7hgfZPnY+ybVSNSD3B76m2vmauCZrqSeHrdXMn/y9BQxUv0fmJxjmfTyAiSpMnxTGdAySneDl02xXA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrn62+E6g1771My2TxDFev2xSKYbLFTnpTnJgo6mQYh9LDH1Oc
	ty8n+BbxGnkpUcwARNLr0DpouhuloW2JyhkwZFCKIPAJTQdtlfRWRJ4Y
X-Gm-Gg: AYBFou3860m4u32w1ZKBJJzTNfKw3l8lPQTzAL58ZspSJwwNJb65U1XP8qeFYwTcaMB
	09kEWdfMh3Lpn58w9UWfi0BOiXLT9KXxcO2ZD995XSUeEHrh/9rhYSmRhCojwEex4lmmrzGFXE9
	uBUPjX8CLBKgVXFknFb4sPKn/xsd82hd2ZpABLtMRY5vPntynAoZ+ejeno+n0sxRJxOW++GUOqE
	a4MFs+Q7Jzwtbt5oTSgcTbbb44I0YDkrYSOOTymZx+pHQoIvYHcDv8EqADOssLvk40UYHy9KHW9
	Rsun5y/Lh2s5E7BkklskFaiEe4nNMqK14dYAvAACR67XZPmkxYlPV0X8D9A5u1VeouH4Wpu+Mqm
	mCULqz4qA7mf1WESYgU41hQ+D5DnWHkRYOVUNAElULAwLQcB7VaCFpT39rWgDZkWLIqjkzeMuFD
	1Ur+rc+hdG3JmAMvkVd9zIQEKiP6ef/zAlk9sEaGlVHuutN8vCkosAIET6/3EPQrwAbOtbyc4Wn
	XAHIGLy4cYfCG1DqEMAGlWckC+7qBYqQevVbLIEX2R1wRxjZocG0b2SPCPDYLhq45rAsMQfmjfw
	aAGlr2NGIF27AP2RASeu5jQu0DtZlaICshEySw==
X-Received: by 2002:a5d:588e:0:b0:48e:6652:fdc9 with SMTP id ffacd0b85a97d-48e6e4f54f1mr2944668f8f.17.1793341294267;
        Thu, 29 Oct 2026 23:21:34 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bab1a8sm1391597f8f.57.2026.10.29.23.21.33
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 29 Oct 2026 23:21:33 -0700 (PDT)
Date: Fri, 30 Oct 2026 07:21:29 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: hcd: Cancel BH giveback works on removal
Message-ID: <20261030072129.40d0d89c.michal.pecio@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Turns out, we do actually need to flush them, because workers use the
'high_prio_bh' and 'low_prio_bh' members of 'usb_hcd' for a brief time
after all URBs are completed, to track pending completions and possibly
reschedule themselves - see usb_giveback_urb_bh() implementation.

Flushing would suffice if the works don't reschedule themselves, but
cancel_work_sync() is more robust against stray completions.

Syzbot hit this issues twice, but not reproducibly yet. I needed a 3ms
delay in usb_giveback_urb_bh() to get reliable UAF after unbinding an
HCD. The works run in soft IRQ, so they can be preempted by hard IRQs,
on PREEMPT_RT, or in a VM. The latter in particular seems to offer an
opportunity for "unlimited" delays and may have affected syzbot.

HCD unbinding can occur on hot removal of Thunderbolt peripherals like
docks and monitors which contain xHCI controllers.

Reported-by: syzbot+cade843a1e4af0651f5e@syzkaller.appspotmail.com
Link: https://lore.kernel.org/linux-usb/6a8a5047.dbb3a75c.13dd47.003e.GAE@google.com/
Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Link: https://lore.kernel.org/linux-usb/6abb3515.c6a7fab7.e5ea7.0459.GAE@google.com/
Fixes: 8fea0c8fda30129b ("usb: core: hcd: Convert from tasklet to BH workqueue")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

v2:
- changed "Fixes" as per Alan's suggestion
- clarified the comment as per Alan's suggestion in other thread,
  let's see if this will pacify the review bot
- another syzbot report
- more elaborate/plausible speculation on how syzbot hits this

v1:
https://lore.kernel.org/linux-usb/20260823125831.6ea35650.michal.pecio@gmail.com/

 drivers/usb/core/hcd.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index ee19628cd653..88f88e7ba464 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -3053,14 +3053,13 @@ void usb_remove_hcd(struct usb_hcd *hcd)
 	mutex_unlock(&usb_bus_idr_lock);
 
 	/*
-	 * flush_work() isn't needed here because:
-	 * - driver's disconnect() called from usb_disconnect() should
-	 *   make sure its URBs are completed during the disconnect()
-	 *   callback
-	 *
-	 * - it is too late to run complete() here since driver may have
-	 *   been removed already now
+	 * Hopefully no complete() callbacks are running anymore; disconnect()
+	 * routines should have waited for them to prevent UAF of driver data.
+	 * But we must wait for workers to finish accessing the hcd which is
+	 * about to be freed (and shamelessly drop any remaining completions).
 	 */
+	cancel_work_sync(&hcd->high_prio_bh.bh);
+	cancel_work_sync(&hcd->low_prio_bh.bh);
 
 	/* Prevent any more root-hub status calls from the timer.
 	 * The HCD might still restart the timer (if a port status change
-- 
2.48.1
