Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82414B486B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873224; cv=none; b=WveYAgYBuI380Qnch9IshY2h3WNoOg+rlNT5yLj7yooZBvHufrfgbTxN911uHzxs5mf5spR35ymeYfNyuqEFfEfOJ8b72BmAyjtp8z7ERQTMmWYGcVYvhpx5mZCwBUGUWSoCIRMFk9deOnqOwI7WkMwssb650wq3AktP5v6n8Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873224; c=relaxed/simple;
	bh=VIsUhK5OkSROG5eFSvmZnb/wTuPuytrUiH5wxuWr8Wc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wu1lZLeajLBjrJBlLuGvAnjC8SZU6T/Q/xBhzwkLhy7CueCac2ifvy52zdLlzrZur5hwQ662OB7bGXCDeGQxiIjYTq+tkTDlTn1Lt5XpULR6f5b/wutyhWTfdgzzvm/o9OUrydAPJtUYWgoFh2P5wW1ChJdRDklObDGWYMv0QzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnb+gF9C; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnb+gF9C"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac397836fbso399746a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873222; x=1792478022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhwyrLo3nugAHu+/mjnfuhNK77ERkWaoh4yz+8v/dy0=;
        b=cnb+gF9C3J5ci3INifrrE/ox0PgN36bdtZneTaWpKw8K7BzSNUgBRzn8nX1sb7PS50
         w21VaoOb4+RawTrdnGKjhpts81YqqWd2hp3Ek6NgxMo24Hb9YD5L9Ohd7tuzhQA1Gzoh
         DunNNcOqSdXp2RF6ZG9VSiPuyBHB1C5gmg+4IIxRMZQ6lBSI8A1OIH3VRrft+yPOWGJ8
         sEsrJEDrInsjKrcbNsQl7AtV3lL4LAWlMw4uJG0GT/n29VWDXecb6E4fcWOM4qJfaMtl
         ai076CscOpF4j2b6hUe7un+vTK9OkF7SJZ4Zl26/umI/ZtxwlEdOdCrLJbXSg+At16So
         BoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873222; x=1792478022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vhwyrLo3nugAHu+/mjnfuhNK77ERkWaoh4yz+8v/dy0=;
        b=l5BlFlwpq2GCL2l5c03cjQMzkbh3VY6Yx2Zb7x92eQjpso/9RtftEOyzAvlQ8god2H
         vPsRvPxQ8l6NAzj8DJo0Ief7tmWdBxdJQMcvPcWay4R7v3b8bjY5K+jHpye5vuZgQYku
         qEY7bkyJY0Xr5D64kO2kSCSJvBVbl0sUGQkycKTPxa0WiVR5Sg6HE2R/GmmfdRJK7m5N
         WNqjEPFx4drPOkwkv1OoBgXjv2Sm+IA7EYyavJwOrWXNYRYN/8qUhMYnncbMMN20URfq
         TwR7Mqfs4uymdPfrnSpZBX/sP6xVyHOU/chWSMP26mD5NPyGvkolIheBQGsY7l1hv7qU
         Kvdg==
X-Gm-Message-State: AFq9FYIJYK+aAimtbsTMA5FR1KjGxS8CYPGyVD/v6HoPlX5ZHgjrdwpp
	Er5Yd8PWtDH6oSZsYp6G44WgNEzPvDCA5iR7OEhe9v2bSwA4OM+8A9RCaO6ZOA==
X-Gm-Gg: AYBFou0EI2Pa4KcpfaTb2TSca8at0SarETbyQ6woF7QwOiRFDNt5b2uMZVsblPebox1
	FZhXtv05oZM2X4UB5iK0jUktLN2k+6SVzjVEYhdUDkzzt8OebqBQc6pJO5vyYaLA8pvpO/xL9ga
	Cv1hc20u+k2VwX/QFTg3bcFikJQJmGxsrDhld53TbOKjdv83390Qq4p8owZBsKfAyQZ+aMNuIm6
	nn5TMTpr7gJ5slTuFNCcRk/e65DuyiHpLUNW+2umOqZR6JLsKCxCUQfuDt0mM1MRKi1IHdUED5c
	kRJbOR3aGiyjCDCkU/wLhD0sIiDv1+qOyXplOk3Zmb5zqrWQwN5f9Hvrevv+/uC5feU0I506RQu
	++6pNb8zBW5zUlnQvl+Ez195s5WGKD7qqILlzbq++A/Ckdp7mwLyVrKKrrfFO2yOvzAjx+5prbR
	L0MAmDYPPNrB2L8IRoacssVCZB9XpPNXq7XWCKBP689tvEoSP8yTGEAayMy1FLgYZ7bgb8eB2O8
	xQ/rlzztqIR1iJeOuCfKl9FbfK1EiWkaagJB6ic
X-Received: by 2002:a17:90b:2e8c:b0:3ab:1e1c:837b with SMTP id 98e67ed59e1d1-3ab3a9183b3mr10030590a91.63.1791873221997;
        Mon, 12 Oct 2026 23:33:41 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:33:41 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v9 01/12] mfd: nct6694: Validate the USB endpoints
Date: Tue, 13 Oct 2026 14:32:47 +0800
Message-Id: <20261013063259.2734757-2-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013063259.2734757-1-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
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
Changes in v9:
- None.

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

