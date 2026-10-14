Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FE73E5EF8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000066; cv=none; b=hEbcGgk/rEZ256coc7s98bMttF4VZHaLx2ioJfAXpEokB/MPNExWxgpMg8BgVhdDJJYwz4ITsd67VMSYqnBf0Qa3P5dKyVpenh1vBnx88hjZfzGi0i7OOdz+WaFGnI3K6L0/jrm9hz//zjxjlSfVqFa5TQMI/ksr0zQOo2eDH6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000066; c=relaxed/simple;
	bh=IUPDwUL0BaNCf4DV5Ybn+DP1Rz/VR/mXDkTWYRMeRb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QVLfh1mV0ipeedMpcLodwI/A8YNp+355L4T/tvt8DRc9jJa85v+GqvHTSKUokd+TKlCPG88S6OmjbMDvJR1M/alxDEbUFzPeUIzM0oacW0gzjoMrEscGm/z4ZRW9UmQ0m0WQJun6WdHuxv1e3bMY2BU2t2uV3TbOT3dRph1nq+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a2qw7B+3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a2qw7B+3"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so310479f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792000063; x=1792604863; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XVQ4KwgLvEhsk9ZR/bxOmORzJTQYU0FLwNCJ2bt4pQU=;
        b=a2qw7B+3pnwoS2p4dRcduKHNzMaKgl+j+lbGGOA0kCnq+oEAYxCYsqnf+WyUuVAQsy
         tvvAvu140KgI0nvMVnrgPhBzL4KVQBOvOyb81H/MgxoFy/HST8BWbMi0v9qdCTqjd/xE
         i1pk8DJ3FiW8N+R9sYk/BTqsrRlDei6KpnwUipFqD94zM9ZQzTuq4io1Hrn23xWuN15f
         76cgX8eLNDp+E+tjQrBVYFkzRAp1arwD1+tHjjD8/hH1R2tqF5VAPoPkY7D/TFMxxwdv
         GCKtO0mj70m5nOKDyrGteP66/Q6MnsuF7lD+YtR6kzJgYs9+46PWdYLrHYD3XsgZUtYo
         FeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000063; x=1792604863;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XVQ4KwgLvEhsk9ZR/bxOmORzJTQYU0FLwNCJ2bt4pQU=;
        b=TOI0iDrTMkIy4ASQFmCm/k4E7t81QrqZ4/sEX9k6h8GIX/pvn4eQOcbM5cLz4ZVWXO
         +DNHHKxBjWMO4hNvG3Hho+u+RjOuD+LBtsvtN+O7GwYg5iJMZDWw/CxoxdjfIyJcboq9
         bbjQkTUO5x1EfCCq9cX1o73WM+wvOM30Pw0u4Saz8l+IIcAj0opzFmEG1fk+5Ky0+RxI
         Oo1D8mr5g6Hmo6wphl/F+nNdXiZu/XjMJH3mxMaWPMLKmtn9b9NSrT1sIPblKunFFFzs
         sLIK1CTb/szvqZm7q6ZTGLL5dJv1zAw4i2cQnUwrzLquNHNgDPpSJvGNhrwlUXtYBJxt
         c46Q==
X-Forwarded-Encrypted: i=1; AKwUvBzfzLiEOQ2iX2BU6seDzl7FdejU93cfVnBF0P9FnzdJPj4T7KjQoGnY8OmY7GQkYgy2GRy/6t3i9AI+A00=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeE0O02gmVlZujM8Twug0LXz1KDf7ROU/5w+bAbdtXdB2Cl4S+
	YCmiVrrI0svWJEGQJ+FkaDuL7Gr9ipWM1IBf+VMZuRw+48anwaJehOJd8GcI3/jX+9Y=
X-Gm-Gg: AYBFou3kBNqfOsXCkj4RO/UDGAYh7QmbuJFKpsVyEx2uwIllTdDnBDjice3Cq8/qLlZ
	KDqwZcsCK6rda7btNGa4W4Gdi2o8ce3lCOjq07r3oj2FcZhwsNs1GKAnFFPdIjQciKAYmk8ioF6
	GotE2yvnF8CEXxGoqVDX3OGvlh/0NO/Ck1UhKFZJ19TXADwnWaZ9vUCLzrpXSeV9oS5n8FeXtkC
	040sdlNzuTecJNvj6f+kt0GSJVuEG6AHcvnC5w4hYPhUYHAE4L3c/oAeQcaFv31cq9/bS8MxDxU
	atjlDshTLw5fahRToNEIiZyMiMydxV/LcByw5aaLfoTTWyaBbnlHmbqEnnlBE//M6z1wEOXOcko
	EUWY2a6DlyFyEEDnY5FBM3HSKfaS8yKVjVpsDU6Y9SUlnWcAUakRAkUn4Q0wB+y4NZJ4Xr3uLJT
	+8zDSrMt8NSbJCu+6SunPsSlqxdmTN9Bk1KpBC3aVO84Ww2oJbunZi8rZSPfCjDYapnbyw9WqTs
	Wwc112sNgQ6SoBdCcTR3oZSn6Uyf7qYLggeaiTfctBwhiupoWPDMxfj+4MWxT6qE9DUJg==
X-Received: by 2002:adf:e983:0:b0:48c:7f94:8755 with SMTP id ffacd0b85a97d-48dbaced42bmr27950392f8f.20.1792000062772;
        Wed, 14 Oct 2026 10:47:42 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac3ac5sm13337683f8f.38.2026.10.14.10.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:47:42 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 14 Oct 2026 19:47:23 +0200
Subject: [PATCH] usb: musb: musb_dsps: Wait for controller reset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-patch-ektor5-dm8168-usb-v1-1-9670414271d6@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDvghBpSryJdxGTUaalKJpaCe
 PemdfkW/++gnIQV2mqHxG9RWeYCulQQJj+PjBKLwdTGUk1XXH0OE/IzL6nB+HJkHW7aY7TBG9+
 Quw0WSr0mHuTzP3f307r1Dw75t4Pj+AIfDLdXewAAAA==
X-Change-ID: 20261014-patch-ektor5-dm8168-usb-d6ca2a5189f6
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Felipe Balbi <balbi@ti.com>, Ravi Babu <ravibabu@ti.com>, 
 Ajay Kumar Gupta <ajay.gupta@ti.com>, andrew.goodbody@linaro.org, 
 rouven.czerwinski@linaro.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792000060; l=1954;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=FNhYi3zdirabUGuJUuxxNcXj3ChSUs+IDNUC/BSjvn8=;
 b=ZWCYtYZ+3hvJTQEiKqMs8W58/P+0C6v6vSjz+RIX5UvfNkLUZ0cviSEFQgklOhCT0KBxPhaXj
 NUhZsCow/tVBadS2w8BnIPQVjPzV/qeVyzef05ugC92Ls62DNhlBSw+
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

After soft resetting the USB controller wait for it to complete and then
set the mode of the controller. This ensures that the controller is in a
sane state. The timeout value used is just large as the board is likely
broken if it is ever reached so no need to optimise. It was tested with
a timeout of 500us which worked so gave it a 10x safety margin and used
5000us as the timeout value.

Fixes: 9ecb887522a0 ("usb: musb: Add support for ti81xx platform")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/usb/musb/musb_dsps.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index e3935f18dd56..d909c45c253d 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
@@ -35,6 +36,7 @@
 #include "musb_core.h"
 
 static const struct of_device_id musb_dsps_of_match[];
+static int dsps_musb_set_mode(struct musb *musb, u8 mode);
 
 /*
  * DSPS musb wrapper register offset.
@@ -466,7 +468,13 @@ static int dsps_musb_init(struct musb *musb)
 	timer_setup(&musb->dev_timer, otg_timer, 0);
 
 	/* Reset the musb */
-	musb_writel(reg_base, wrp->control, (1 << wrp->reset));
+	musb_writel(reg_base, wrp->control, BIT(wrp->reset));
+	read_poll_timeout(musb_readl, val, !(val & BIT(wrp->reset)), 2, 5000,
+			  false, reg_base, wrp->control);
+	if (val & BIT(wrp->reset))
+		return -ENODEV;
+
+	dsps_musb_set_mode(musb, musb->port_mode);
 
 	musb->isr = dsps_interrupt;
 

---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261014-patch-ektor5-dm8168-usb-d6ca2a5189f6

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>

