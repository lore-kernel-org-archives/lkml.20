Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676390;
	b=3CB1o4zf0w2Yb1/LqJ2rgGs7r0Va7TiiJ+GkKVa9/ejpfRyduwHSe2cNY+aIP3w3ByJl
	 +aflDqlGKnrdBS8d/1IDvKKNV1LCzWBqJHIUJW70aqNq6dktEZPmlKvd+rf4l+IfKvJMh
	 5wlGTXKTlrJhWBEsPpYIQlMtOOKyEi0PaBfbLxLTEvArQdOycTtmNnUAob2iCOQEQiTbn
	 VVBOu1gkqWupyLlZgqBIxnW0SiP4viS8YLVGOaL+PJ55gPOFyWbO1a3f3jXXOvZ+2PG09
	 uCnJq2iFiAsfOhYQ2CCzIOyhMxZNWrbD2DnCKVsIhcJeKsbxXal1KxR0yMFmLgxR+Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=PhIrUCHACphB3JfI1J33l4nIMBCZM/xcTUwZ3X7IPJQ=;
	b=varKDqFn9I2Mt9emxzyl/GjU5EWLw9ynMCjJ0i5Gb6xtIQ0fIFlb/M0/szhxJqvcsoYD
	 zM30hltclBSA9jGH2FZjLOKKg/Dljk1lCFWG5+sjXOQZaflmYcPn5ruZp3lXHL5EymuSY
	 krflKz0prBLQVZdRr+Kwg30JlG/Xhf+4s7NMePjCOWT+kh2rX/MIQ2mricm42jTR2NUSn
	 xJ08n/NHwGueAc/r2vtEFboqrhHA1c+oTQJYTAtEvmCfh0j96kN1/ijqD8WwMGxzUnuYS
	 q24/YZkfigNVtq6XvQGbGQydi/cpIYjg7fLhh4AslsCnOZcMinov/ecF1WyyUsAeCww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--korneld.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="hK9qvA/2";
	arc=none smtp.remote-ip=209.85.167.70
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4B7606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D4B7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--korneld.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hK9qvA/2
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5ba4284e23eso1085466e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792676387; x=1793281187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PhIrUCHACphB3JfI1J33l4nIMBCZM/xcTUwZ3X7IPJQ=;
        b=hK9qvA/2wkDz3cUz12XiUq5KIVCnZFtzrRy1aK2CJFaMKcZ0PL5Y2oLtSj8bwZiRJv
         8lSDOAiKx4LbBiPx2GC/QiBmUpw0yXDRGIVb0bWKsNdvAlXNrrRGvy3TWqXwykkldBU5
         fusQE4A3NY+RHR2IT6RuHeyVcR0OPGoft1UEx7tilvq6Id3nP/FkRq/cbF3gfH4MQJav
         uf606f6m1eE28YW7vFcPcWtKkEJZLrPKZDDrcFcDB3fhQdCvyHp2pDV/Ix8r2bJluSSi
         CgVoFCDBEA+IjcxD9zWcMSVz5oPtNia5vxKp4aH/eu3GPeiqBsybmxxojeL3cXdqTzrl
         sLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676387; x=1793281187;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PhIrUCHACphB3JfI1J33l4nIMBCZM/xcTUwZ3X7IPJQ=;
        b=p5LNF/Q7ePYQIOqZ8wrlOSnZDiAX7yvJcxPjhLdEAGkoqdEN7i0lnJTOkTNQp/UXVL
         cNIvnp8uLnaSwUAuvq3T0dpjB8zDrawJC6/qEs+ytyYriGm1JmMKAiVusSXooPsC8bNP
         RNUsr28mS7xhTMe2qkYBfsBTtXVoaLIc2uQuR8iw4GlcQfc2RpQF0q3VfX8+ymXbcMDi
         poeLExLnTWpQR1nkCmMGFU9lf3iN6Sz+dHE9nh2WZV0zeQvYAfSPorFnvZ7jIi1m6+rY
         Uk4GX860CCAkZgE83jF4XnGJQivfD+9Y9FMW5GY4LqMWbSaaTFS+9pRSuojEGyx94p5y
         MTFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTQokbgriD0NeEuM40VwtQ/IjgCcMRZSEvnfVjQftk7Po1HW/VOXmljWeCjWuo3VFZQ4VGFArcss7F4IU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPvq3D8JV6OoLVwIY9PeNFPm1G8xwL6h+IR+Hkt5hd3I/PVvvT
	9/DgDsfgPdldlNEMoQb/1uMxTxRvhxOrLpLIP1GH/99KeF0OXEL9ZOMoYC/VVMXKkdPTKM/d/ri
	c9Hu972ZXDA==
X-Received: from lfjj4-n2.prod.google.com ([2002:a05:6512:24c4:20b0:5bc:e5bc:7495])
 (user=korneld job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:158f:b0:5b8:f271:264f
 with SMTP id 2adb3069b0e04-5bfa1c43ab8mr2145106e87.45.1792676387137; Thu, 22
 Oct 2026 06:39:47 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:39:11 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP8R2moC/x2MQQqAIBAAvyJ7TsiNNPpKRFRutRcVBSnCvycdZ
 2DmhUSRKcEoXoiUObF3FVQjYL9Wd5JkWxmwRa1aREnZUl7S42z0IZBdDr6l0V2P/WC00hvUNES q+t9OcykfEjgkOmYAAAA=
X-Change-Id: 20261022-evdev_syndropped_fix-76352587616b
X-Mailer: b4 0.14.3
Message-ID: <20261022-evdev_syndropped_fix-v1-0-b5400740e1f7@google.com>
Subject: [PATCH 0/2] input: evdev: Fix how SYN_DROPPED is generated
From: "=?utf-8?q?Kornel_Dul=C4=99ba?=" <korneld@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Kornel_Dul=C4=99ba?=" <korneld@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

This series fixes two issues discovered while working with a gpio-keys
backed device on Android. In short:

1. When a gpio-keys backed device is opened, its initial state is
   immediately reported.
2. Android issues EVIOCSCLOCKID right after, before reading any data.
3. evdev flushes the queue, enqueues SYN_DROPPED, and caches the current
   time as the device timestamp. Notably, it does not enqueue a
   SYN_REPORT.
4. When the next real event is reported by hardware, it is enqueued with
   the stale cached timestamp and a prepended SYN_DROPPED.
5. The whole packet, up to the first legitimate SYN_REPORT, is then
   ignored by userspace.

SYN_DROPPED needs to be issued after EVIOCSCLOCKID to ensure that any
partially read packet is dropped. At the same time, evdev only defines
the batched events() callback, not the single-event event() one. All
events in a packet up to SYN_REPORT are written to a client's queue at
once while holding client->buffer_lock. The EVIOCSCLOCKID handler takes
the same lock when flushing the queue. Therefore, EVIOCSCLOCKID cannot
inject SYN_DROPPED in the middle of a packet while it is being written
to the queue.

Based on the above, I believe that the best fix here is to emit
SYN_REPORT right after SYN_DROPPED.

Patch 1: Always follow SYN_DROPPED with a SYN_REPORT.
Patch 2: Stamp the SYN_DROPPED+SYN_REPORT events with a timestamp read
         directly from the clock, bypassing the cache.

Signed-off-by: Kornel Dul=C4=99ba <korneld@google.com>
---
Kornel Dul=C4=99ba (2):
      input: evdev: Always terminate SYN_DROPPED with SYN_REPORT
      input: evdev: Read clock directly in __evdev_queue_syn_dropped()

 drivers/input/evdev.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)
---
base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
change-id: 20261022-evdev_syndropped_fix-76352587616b

Best regards,
--=20
Kornel Dul=C4=99ba <korneld@google.com>

