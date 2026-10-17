Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B8F48095E
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792235487; cv=none; b=OziosN+Befs6nNA0+0LwU8xXPgRUMZ6e6SGoPF7R6EOZMVKgvfqyxW0Q84hDj2v8G+9Ef0T9raeyGsoHSKywhqOmA34yku1hZXUAZ5nC+0RJ68HogUMDBFf/pbvniAnf0lCNe6vSka1oJsTKDRpG6p7kH0M8rliNCej0XJjIzAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792235487; c=relaxed/simple;
	bh=FXpl+aOb8ZxqdMza6huuGxKQd5fQg4/v+NznngJK6Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VbRCtDlo5RCbnNKdxBklxNnjBNwvle61aeRkKLJeHvqiL+2E/40KNFBc02yqsDUWILQLbIAmuviv47gDvBQwFPxhiztjXk/+i9atSvLtRamCMrSDsLzTxzL57V4gHut0t2xr/0b8b/I27JeAZckJ/UHcytWOvqL9ojuaIhPnN5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpMzd4Fz; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpMzd4Fz"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a89f92d7b3so128228a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792235484; x=1792840284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JcF+DRWasibANQc8YNZXnJ99HscJ7q/xfWKQy6h+B9g=;
        b=XpMzd4FzbShpMX9xL2Lg6X26Bpk637HW4XS1VxztHs+YW+/JnLgq2CRmhdw+51ctS0
         EY9N57UAjaGfaaUv2Fn27ElbSUWYppxU0S3znjFi0w/58LuojO9KoivpFj8etXCMHHaA
         iOI6XAYb1+2dE4BGdyWl1Whrh0cfzNk2J6E9CAcJPwP/zD26RLqhyv6rRxFZ+MWmV8ro
         drEsMs4NYiU7SzUpWSQ8oTBkG92tpAnoE7JjLgLxFqZCh3inUenBN4SKHeJbtQ2q3yC5
         OtvhrIRyDYifXR+8RnGyF7iATDa1Bi41tVQbc49FX5JwUKxjOH2kBwUrhpkUrC7cDSIb
         jrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792235484; x=1792840284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JcF+DRWasibANQc8YNZXnJ99HscJ7q/xfWKQy6h+B9g=;
        b=w28WONAZgxKB6DLDQf4X8HTUyBjBlKdtV+cy0AH3XRuVJ39g1FAxiAAbrsO11LKRWf
         CL0h/knsk0VTSjLT81GUWY4IjDhOUa1k8bxl05sIyZyL232wMLfVR0JLL+rmuhkaL+Am
         XO/Ud3v1ngzwmvXlegr9WWvkBoTQAwQZ1BV9RFyRKcWGHZM8M572V74h7+5Bu5KHjQ2A
         +lE6Qi+iNfGnuYSFEvAIOGaiNiSzBPc0z+kirlKLvEd8i37UgZtkdyKVfi6zRgGxuqdl
         5kbdl7dS8Bi7dD/6nSZIjljQsjxjp16sNUlQfnxKrcVda7ZYYOLQ0iaLUD4rct9nDmsA
         2flQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdOYg96oJjG0ZD3Hkw/wzEOuH1SdbsqhGTmeMc/zvcwtgu6ja1dwrBNhPjPgRU+IzqHQXZboeF4WAjIE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwIFNzQVz+Ue67unJQaI6P2+jX2aG1S0ZHlE/ULwEyB6/EB7yg
	X6VE6/oe/+IzN0MPAtG8BKInbS31KOaoCXLoPx0Z3a+vZz5mhse9oZyZ
X-Gm-Gg: AYBFou3nkooCORZNMya6SLe2Ndphbx0IkOdLrUgS6VemPOpIRr55gidYz1fA6IcxOam
	ZDi/gM8DtvJ5RvDRKL41R5Cb6j81RqbTIYw2VJbdFOnLSUyU5iHotiUjYUpSLr3iMWU1D+Yh2+F
	UJeHv8mUeBcaZpXpQmA0fQ55Y1nLr4tyD1v0Wra/eqsqB/W8W2unDDzJADHiNdf2ouca4KVFhrV
	9jVYd+081JKM28SGVWTzWhl56G5QysfB0qcml9bG20Cn/GJCyy/8SpwLtGVgC36dqrVUKS909Ya
	I2effLCqjJepclwYQ40FeSvL+dCNPo4VLs32ZDX2E6Z54V7cmpUf6VOi6W06ajvtUzN8+CFGMhe
	h6DQ0lAGTVDZpJUMX2ShYw+sNOX38U8FMfg5oUakQc72Sqj3+GVvyhcMmR2GJw20MlWuQe+stjz
	jHQdiUnGBYUDoB0VQ4vEGZu6xrJdWGOZOjnQZ0Uwtr7N5V47vBnjUJkM2qmIdCe8wvbQMpdREoA
	vzKXOOAw40oDk3PlQ66Y9E=
X-Received: by 2002:a17:90b:582d:b0:3ac:9e5e:d1a5 with SMTP id 98e67ed59e1d1-3acef14590amr3620466a91.6.1792235484304;
        Sat, 17 Oct 2026 04:11:24 -0700 (PDT)
Received: from MELOKC-LAPTOP ([61.171.228.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947cf9a5sm12813154a91.15.2026.10.17.04.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:11:22 -0700 (PDT)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: xhci: fix EP0 context leak on virt device allocation failure
Date: Sat, 17 Oct 2026 19:11:13 +0800
Message-ID: <20261017111114.1135-1-anferneemelokc5@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When XHCI_EP_LIMIT_QUIRK is set, xhci_alloc_dev() reserves an endpoint
context for the default control endpoint before allocating the virt
device:

	ret = xhci_reserve_host_control_ep_resources(xhci);
	...
	if (!xhci_alloc_virt_device(xhci, slot_id, udev, GFP_NOIO))
		goto disable_slot;

The reservation is normally released by xhci_handle_cmd_disable_slot(),
which calls xhci_free_device_endpoint_resources() for the virt device
found at xhci->devs[slot_id].  xhci_alloc_virt_device() does not install
the virt device when it fails, so the Disable Slot completion handler
finds an empty slot, returns early, and the reserved context is never
released.

Each failure leaks one endpoint context.  Once num_active_eps reaches
limit_active_eps, every new device is rejected with "Not enough host
resources" and cannot be enumerated.

Fix this by releasing the reservation when xhci_alloc_virt_device()
fails.

Fixes: 2cf95c18d506 ("Intel xhci: Limit number of active endpoints to 64.")
Cc: stable@vger.kernel.org
Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>
---
 drivers/usb/host/xhci.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 7f7babe9d681..8b9a6f88cca5 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4278,6 +4278,15 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	 */
 	if (!xhci_alloc_virt_device(xhci, slot_id, udev, GFP_NOIO)) {
 		xhci_warn(xhci, "Could not allocate xHCI USB device data structures\n");
+		/*
+		 * The virt device was not installed, so the Disable Slot
+		 * completion handler cannot drop the EP0 context reservation.
+		 */
+		if (xhci->quirks & XHCI_EP_LIMIT_QUIRK) {
+			spin_lock_irqsave(&xhci->lock, flags);
+			xhci->num_active_eps--;
+			spin_unlock_irqrestore(&xhci->lock, flags);
+		}
 		goto disable_slot;
 	}
 	vdev = xhci->devs[slot_id];
-- 
2.54.0.windows.1

