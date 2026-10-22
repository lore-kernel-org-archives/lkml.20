Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641206;
	b=vzafVdWWVj8XN7OtkJTUykVs8QsupBmmaHpXkQF6oRT+5jp4ehvmjqy93v3BbxiMs1qa
	 iJJQFHlASNYf1dDHmSOCxWNnw3cBXN5uRpV8K4wqK2sXQmdWx6nrJh4zvs18EKCjWMUfA
	 GhMHJl9qbUjQvPb8VOemW7fn4I66gpqtFzn6xTjWiIp72VUWge+WifNUmaGJpNdSUcvXb
	 uyJA8yBCPyeR0mme751X6dkQ7unu2jfgrOfXxRjORdNqCy1UceCqTe0gmg3QoJbkrPInF
	 aWKwuZVj69JymoidUc7iDDIfDn3AxNh5zjGdOXOt7kfySN2d6/msQuHmK8+/YRBjPkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641206;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=AYxNwlYjoI2/uyAaF5PFCrzANhHSTAvl+pCJ088T5bY=;
	b=ZDvvKfGdFHHUQQiCcfYUUBQzVWgT/rIBIOpNBF1oB4tw+IbopnJBg/VsPV8HX/8dZYAb
	 HL8XWt2ueequx2XfSqj86ScILXfC0dPZHSIuOktG0LPG4E28mzjm/5HHSakoybrqa7zGp
	 GkcoCU/M1KeUV7caSnS6/lQRKu7MJO0evagHlI7dDNrp1rWgRMB08CXiAHiiOuATxMCNH
	 ztNYAAkRrqC5+z7YA9DxoeGsMBan+/ul9/+QZsEzGJVkiJFhCXW4qjunnadfu06PiKwGW
	 2sOB7CzH9H21T8sKOoy4obSEd8TUOHBfuPcbikOJ5qdp1ReUU0m1Wsp3J6tmA3FuXwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C5A606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6C5A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15943c9c005so1681505c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641205; x=1793246005;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYxNwlYjoI2/uyAaF5PFCrzANhHSTAvl+pCJ088T5bY=;
        b=tw2gh+Dw2X8iN0YGMYpH/hJN35l0dgeRALSqyS6A5XhztqSLv4iraKc+tgpGJYXgdN
         f0RnjzkB3p1I4di+AYIxWVF0g76H0hEux8XSvyvIMcVnula1kLPpmtvXxl8ZGVSZyyD/
         Imm8xHhPxfjGOM18rrGQ1HcyT1J5vEm8hidOuek0sqbgTiLB/mo+S2ilXVDcCfXZ28TS
         TJMerskqybQszIWPMOr7oUdOHZB5O6WnENv1pUSw2eoO9lGbXwWvzFYpPOhyCENgnAUH
         MPnpPxp/z3XcNa1kLptPs9AfG2IRYWHh5FSvOs6LP2BUEeAW5yJVeMoqR7te0pMPRNX+
         LqnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwn5bSj906rfiYjsD7dMH4XmkecB2Rck4gUvdcjKU0MG7lHvCPBZoU86QntuwYvnIkmpOkr1abBGBa8V4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzKJ7u91fzbUmmGGO1D9e+yggFlPwZv2yYJPb5ug1NEnnbis6z
	wBUCtUdaLuYUcq05ahcp6D16TVf2th7PEQrFgHI1FaFiImYrH4XtyZmp
X-Gm-Gg: AYBFou1NTa4vvRXCsFiF5ZmFmdKTB7tzwn9FJKY6/i4H6BaNJzfF5tm4XjNH45ORZHB
	z13NUOwYCRr1SsXfVXFNXQkU+1drTj0OKuxPqF8PzVKvd30EIcNHqGlEF7oeYz6cjeWYG3eCvmG
	PLOFLeChBq9/XTrfh/FFhj8UMOHxvJqSZDr4IilEV9GFJjwKeLtFsve9Rl5m6Ly3CG3oR9USe4Q
	nW4SRopKoWsQwI1MMskAcsQzehJq5CbzlSOadbnZrVIy9cqSjWl2Uvs5m449izI9tquceH/ACM1
	+B3GxSFtYRWX5E1YdTH5EGqEyHARBknQjJd+8qert/JH67Wvfs9FD1riuImE7Bo5az1F3uvboHu
	9vCQOacfUED2/Ulkr/ND4B+pEFzwAY8S00pvB52A0Hv4ZAZJ+2yM2WnQrI7WEKD2s9ac6lSOwdz
	vKWtJFjG9AmBVeTx4oSSfXqWa4AVOjcLKA4PLwj7zXZEJAaT7a4BpID7NCgKd/LjFZQYGzIi0Iz
	nPFCCzqof+P+zdlBKY+PSy4d7816a40jQ3tA87cagrwQNjWu5kUGvObUY97HdFv7xJzoRgYLvju
	9hdNVtZOjiQFBWkRxn/Cb0GA8PFY5j87dnAV95bDp9W4EH0j75Vtb21cRUA=
X-Received: by 2002:a05:7023:a5a:b0:143:6080:668f with SMTP id a92af1059eb24-190a6adc7b9mr4481368c88.7.1792641204525;
        Wed, 21 Oct 2026 20:53:24 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm10979489c88.22.2026.10.21.20.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:53:24 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oliver@neukum.org>,
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] usb: core: fix three use-after-free windows in the USB
 anchor protocol
Date: Thu, 22 Oct 2026 11:53:21 +0800
Message-ID: <179264120148.17277.68253767316647311@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Anchors are usually embedded in driver-private structures, and several
anchor API returns -- a non-zero usb_wait_anchor_empty_timeout(),
usb_kill_anchored_urbs(), usb_poison_anchored_urbs() and
usb_scuttle_anchored_urbs() -- license the caller to free that memory.
The wakeup protocol backing this license has three windows in which a
URB giveback or unanchor still touches the anchor after the caller has
been told it is unused:

 1. The waiter's condition check and the giveback's suspend_wakeups
    decrement plus wake_up() were not serialized, so the waiter could
    return while a giveback was still in flight.  Reported by syzbot
    repeatedly since 2019; patch 1 references the two reports this
    analysis is built on.

 2. __usb_hcd_giveback_urb() captured urb->anchor at the top of the
    function but incremented suspend_wakeups only after DMA unmapping
    and the usbmon hooks.  A concurrent unanchor could empty the anchor
    with suspend_wakeups still zero, so the waiter returned and freed
    the anchor underneath the pending increment.  No syzbot report is
    attributed to this interleaving; it was found by extending the
    analysis of patch 1.  Patch 2 folds the capture, the increment and
    the unanchor into a single anchor->lock critical section.

 3. usb_unanchor_urb() and the giveback read urb->anchor and only then
    acquire anchor->lock; between the two the anchor can already have
    been freed.  This gap is as old as usb_unanchor_urb() itself and
    cannot be closed with a reference count: the first dereference of
    the freshly read pointer would have to be the increment itself.
    Patch 3 therefore turns the wakeup protocol into a lifetime
    protocol: the lockless anchor reads run in RCU read-side critical
    sections, urb->anchor is published with rcu_assign_pointer(), and
    every return that lets the caller free the anchor holds a
    suspend_wakeups pin across one synchronize_rcu() first.

Patch 3 changes contracts, stated up front:

 - usb_kill_anchored_urbs(), usb_poison_anchored_urbs() and
   usb_scuttle_anchored_urbs() may now sleep even on an empty anchor.
   All in-tree callers already sleep (they sit next to usb_kill_urb()
   calls).

 - usb_wait_anchor_empty_timeout() returns 1 on success instead of the
   remaining jiffies, and a successful wait -- including one with a
   zero timeout -- pays one RCU grace period.

 - The cost is one grace period per successful teardown exit.  On
   x86-64 real hardware, 100 consecutive successful waits on an empty
   anchor cost 3.1 us per call on the base kernel and 8.2 us with this
   series, about +5 us per call.  Callers that wait once per batch
   (zd1211rw) or tear down several anchors at close (btusb) pay this
   per anchor; it is small next to the URB I/O these paths bracket,
   but it is the price of the free-after-return guarantee.

No fields are added to struct usb_anchor or struct urb, and no driver
changes are needed.

Testing:

 - A QEMU/KASAN attack harness reproduced each window separately
   (deterministic arming for the two giveback windows, a forced free
   inside the read-to-lock gap for the third) and verified that each
   patch closes its own window with zero reports under identical
   pressure.

 - The full stack also ran on real x86-64 hardware with KASAN kernels
   built from the same base.  The base kernel hits every probe: both
   deterministic windows fire within 100 iterations (hundreds of probe
   arm hits), and the natural-race variants hit within 2000 iterations
   with no arming at all.  The kernel with all three patches runs the
   identical workload with zero reports -- the attack still executes
   there, its probes arm hundreds of times too, only the windows are
   gone.  The zero-timeout contract probe (empty anchor, timeout 0)
   returns 1 as documented.

checkpatch: 0 errors, 0 warnings for all three patches.  Patch 2 keeps
one CHECK for an extern prototype in a header, matching the prevailing
style of that header.

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>

Hongyu Xie (3):
  usb: core: Fix use-after-free in anchor wakeup protocol
  usb: core: Close anchor capture-to-increment race in URB giveback
  usb: core: Close residual anchor read-to-lock window with RCU

 drivers/usb/core/hcd.c |  10 +-
 drivers/usb/core/urb.c | 303 +++++++++++++++++++++++++++++++++++------
 drivers/usb/core/usb.h |   1 +
 include/linux/usb.h    |   7 +-
 4 files changed, 277 insertions(+), 44 deletions(-)


base-commit: 22430ae5d90ab288b0ee2ad99ae941f4a666b694
-- 
2.32.0

