Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFD947B423
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365055; cv=none; b=ogEyKitAy1m4NIIN5Twq82NmiYZ4QQufvlYSbUSzLoMWzSSXfWX9DU81ku5oMr83R3MZ1oJ31QQgHx9RatjaW3cyJw8qLVb4trPxXNy5Z7TqvmF3yNk1KBNp+erEoDOIgNy6rX07pXGUgVkznXgbH0b+TQD5vn5pvuRPsRQPnLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365055; c=relaxed/simple;
	bh=+Ju91HUYCrAJkLFhcR6F8nncRnW05DqCyv+NaE3hbFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nUe0U5EFfgU19xjopm8/Ycf7NUKTQEdvWA2AvGYel6yzIkxZjiX4LfngzIfDABeBdxDWy30r/kO9jCb+AYhVtkj2D0XXIQyInbE2J4BJ6OGSScYDHhDb2vzFd6PuFNoIebJDrZ9hLZTVc32pW5y30hm3Vtp4S6oKUgVCHJnK0Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pBtJytxx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pBtJytxx"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e5fb79cefaso5509545ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364885; x=1791969685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TuYCd8BtK0Pu5eXwDtQHw6mxURWuNtr5LMlu4gmWNag=;
        b=pBtJytxxVIeFK0fqUjwxH1aN2z3DA6w4utFE407zOA3ugcuEcZqk/6ESZd1SDm0wcA
         LcRTURb0hCiOH/k8XGNLflY98adYEtJM9rCqmI9UfwUL2P8EZQmSYdzPAOkvCMlB/eVN
         QRTWzrnNCQHYY/OnWjWQQv0hD1LI6b4BP4BC0Pt2jlxssii1qCy82Cp6vBejCIA92rMp
         5odSy75ie9IwKpclMbuAczmnE4IJ1puknTaPur3Qg+tIqahYqkvIrDUGdvUA3RQVX2Kc
         Bt4YG/6AjWmW1LA55bwHb/V9TSLV4MiW2HylCOXb3OHgB1NvI2O3GXagiTjgyIIjzDUp
         p1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364885; x=1791969685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TuYCd8BtK0Pu5eXwDtQHw6mxURWuNtr5LMlu4gmWNag=;
        b=hMlii2YRrQhPo71asLc1WoI+1Kd/FKvyBUqigQwq4fdGMpo21gQNQyEaT5nAjPZi6N
         4Ooa+bQZ1uuhOJNV1e3FP8qpM90NQsPOMGLYfQ3S6WJ7uPL01YKB3d5XP9WDNBHjK4sJ
         1A/B5jBq8IYIczzoSr3FpQYHmYB0294D3ldj1l5DVBWdjjdYE0PB6cnhjEunLm1rIw6k
         /xLxgiRT/yKTImEexDy7r7UVG/oq0w5LJD7YZCcIHi55pTndjdfn/ru+vUcXUhe0fW1r
         NqYxowfpoxZ9uyRYvtKzNyBDtz7n4bxDYCmNWbc8UHMa/gy5JgF2fTVWYfYpzpxWuXOn
         XihA==
X-Gm-Message-State: AFq9FYLceQajyrLEW8UcSFqk0B0W7WQKQ/qy58yTZHIKeoXK6AM3Pd9a
	JLXIWXcsQrPJA7Tb3ofCjszlarXzB0Ms2nMG57EUF8JtHDU0c1VUfMa5
X-Gm-Gg: AYBFou3mP5oKp2m0TF2Dvqxfc5t6MfAIFP4OHlvDXWlZ+g+tXuv3YJR3I4UnEz4qwXB
	W+2qeZGADCB/M4M+Qbo1Uo9HzkOg3im/0A9/DBXYZG7VMSqYtmI+83U/CloRqUyiLZmqN++N9y6
	Sh8tc5CqdfKVqtShohOji3bwmIUdfhNsB5kGBqXiXZ5u7FYkJVlkb2xWK4OgtHoM1m+KgZXWRQq
	zQBdkJPPnJHbPbP2fv+VyP8pETHpfBR9Q9YvHsbFsHQImx4LtB2IVij4SR2LTPOnqte3mcYsh5I
	x6wsu/JqcLzmlKOx8wR5ggHpnFKAg7asmpPXPxAGWDT4sBkpqJlbmVUllWbfLnzSgGfATc0p8TT
	/QzW0gxP1er0/jo2lQvOVayR3odpTsAo6q4Q34lLaDFVtsh8kk6/+p+GsiMRCCUjceRki7iSkZ0
	DssThiRv1xGphXcmfDALnQyVT8QeA8YGMZ5EDc10IC/su6JQu9+UnO338wjh9uSo2y6Thr3vTDZ
	dfbLEcNxqHwwvxbHGLb5gkRb8l//MmhPe/GFYSb
X-Received: by 2002:a17:902:ea0b:b0:2df:8ff9:5160 with SMTP id d9443c01a7336-2e6005633d5mr12205635ad.34.1791364885451;
        Wed, 07 Oct 2026 02:21:25 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:24 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v8 02/13] mfd: nct6694: Validate the USB endpoints
Date: Wed,  7 Oct 2026 17:20:51 +0800
Message-Id: <20261007092102.3768818-3-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007092102.3768818-1-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

The probe reads endpoint[0] of the current altsetting without checking
that the interface describes any endpoint, and the bulk endpoints used
for the command transfers are never validated. A malformed device can
make the driver read past the endpoint array or submit URBs to
endpoints of the wrong type.

The interface exposes several interrupt and bulk endpoints, of which
only EP1 IN, EP2 IN and EP3 OUT carry the command interface, so the
endpoints cannot be looked up by type. Check that the expected
endpoints are present with usb_check_{bulk,int}_endpoints(), and take
the polling interval from the interrupt endpoint actually used.

Define the interrupt endpoint by its number, like the bulk endpoints,
as the pipe macros expect an endpoint number rather than an address.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- Also validate the bulk endpoints. Keep the fixed endpoint numbers and
  check them with usb_check_{bulk,int}_endpoints() instead of looking
  up the first endpoint of each type, as the interface exposes several
  interrupt and bulk endpoints.
- Take the polling interval from the interrupt endpoint actually used,
  and define it by its number like the bulk endpoints.

Changes in v7:
- New patch.

 drivers/mfd/nct6694.c       | 29 +++++++++++++++++------------
 include/linux/mfd/nct6694.h |  2 +-
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index 308b2fda3055..b9526b22754c 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -273,13 +273,25 @@ static const struct irq_domain_ops nct6694_irq_domain_ops = {
 static int nct6694_usb_probe(struct usb_interface *iface,
 			     const struct usb_device_id *id)
 {
+	static const u8 bulk_ep_addr[] = {
+		USB_DIR_IN | NCT6694_BULK_IN_EP,
+		USB_DIR_OUT | NCT6694_BULK_OUT_EP,
+		0
+	};
+	static const u8 int_ep_addr[] = {
+		USB_DIR_IN | NCT6694_INT_IN_EP,
+		0
+	};
 	struct usb_device *udev = interface_to_usbdev(iface);
-	struct usb_endpoint_descriptor *int_endpoint;
-	struct usb_host_interface *interface;
 	struct device *dev = &iface->dev;
 	struct nct6694 *nct6694;
+	unsigned int int_pipe;
 	int ret;
 
+	if (!usb_check_bulk_endpoints(iface, bulk_ep_addr) ||
+	    !usb_check_int_endpoints(iface, int_ep_addr))
+		return -ENODEV;
+
 	nct6694 = devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
 	if (!nct6694)
 		return -ENOMEM;
@@ -318,17 +330,10 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	if (ret)
 		goto err_ida;
 
-	interface = iface->cur_altsetting;
-
-	int_endpoint = &interface->endpoint[0].desc;
-	if (!usb_endpoint_is_int_in(int_endpoint)) {
-		ret = -ENODEV;
-		goto err_ida;
-	}
-
-	usb_fill_int_urb(nct6694->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_INT_IN_EP),
+	int_pipe = usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
+	usb_fill_int_urb(nct6694->int_in_urb, udev, int_pipe,
 			 nct6694->int_buffer, sizeof(*nct6694->int_buffer), usb_int_callback,
-			 nct6694, int_endpoint->bInterval);
+			 nct6694, usb_pipe_endpoint(udev, int_pipe)->desc.bInterval);
 
 	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
 	if (ret)
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 6eb9be2cd4a0..a5ad7be47bf9 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -10,7 +10,7 @@
 
 #define NCT6694_VENDOR_ID	0x0416
 #define NCT6694_PRODUCT_ID	0x200B
-#define NCT6694_INT_IN_EP	0x81
+#define NCT6694_INT_IN_EP	0x01
 #define NCT6694_BULK_IN_EP	0x02
 #define NCT6694_BULK_OUT_EP	0x03
 
-- 
2.34.1

