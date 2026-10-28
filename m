Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193922;
	b=q11R2RaZVwiM7ttsf1NBqHSGZd/QpZC/mHPm1VE+GqYd2vgKqfqcI2ys1RiRNgPXGBWN
	 34dHgOaPdTKoOGHyqo0w+sQ0OKt/t2fKrfPMxUtzVQLQeM8Gtj+MpLZYtTV3w2C7vJmqY
	 6T2T/K/pie91lmsInSuL8GYuCkNwxV4R2kgcZ0douRcJBuIeZ30/xZ8gBn15h6i9hODg9
	 G7L6o9caznZSnNzPb+DJeQhq5S9G/m8UP7lEfI/iPcfjoNpMlwm6XBDhhi7yHrUoKqtM9
	 NnkA6QfPnhsP1zElQUndJ4uQEw4q+f0dyVGG8Jg4A0qHFR9BIHDhh3LjVWc02DNsDVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hPJrinTuc8YfKSq20Of15bbl8HF3Z/k9fx6Ti8T3C6w=;
	b=Bd+15klMYlRaRQ2diaQ3HpZRT0+zkjtbKbb+MsrsV89JkmTshVF0gdB+cBCoz1fkhcAk
	 fPHziq7/iTLCB3KiewjajkmFYQogQ/K/Zfv6ndYd54dbFKFJxYvxdkBWLyYcBH2rgGolj
	 GjTFRdrQN7OILD2u+bKhXVfBlwd+ZgXGKPvmCiAqNIJ8Xh9cgLazYaZrLaf2mu6InIkLn
	 nrlJAM/E4FVrsrhfdZJb+eClu3iRCWbIfykTAnEK7IXOobViMG6A6dUN11vpbKMw8FuNW
	 PD5NyTqipR/hX3rrJFJl0ZsogiQCotjX8W+CgFUakf7/+DUBvpHhSpBzCMb0C+p4S0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=s2pnDRRi;
	arc=none smtp.remote-ip=74.125.225.65
Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F7F606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84F7F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=s2pnDRRi
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-48df388215cso261949f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793193920; x=1793798720; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hPJrinTuc8YfKSq20Of15bbl8HF3Z/k9fx6Ti8T3C6w=;
        b=s2pnDRRijKvahDaltyMzIJGmlmf4FlUL+iW9a3Vy8+vpywjk/JA2hObKrewypGZs18
         SUx+4tft6OmkAJXaDnVm5BwHdGeVrYFjyO6EcBf45s5DW9r4HEgUAFk5ZS4lUAS8pJK6
         URfMoJ68NLPRzG8kQslmrUXF4e81f3sPAZCcEPVE/Ci0Vs0bmFPwqsaBqHLjLZ8X2kAk
         auDlJGyRsDvFz97WGRfLXFxRMNZrL6TYV0DsIz50SZZi6GxN5Xn6ge/gv+NapFNnDNXp
         QWjZE7n+HjOFIaUC13jQLjR3/i+3YENbGnt/zGOCNJCAhZ+4o1ydI1yM7EOaLJQt4qhW
         H6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193920; x=1793798720;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hPJrinTuc8YfKSq20Of15bbl8HF3Z/k9fx6Ti8T3C6w=;
        b=gh12p02xKIC7SGgIu10VRuQh2oi+YcNtDRW03kW+hp6ACFQk0Awm/5EUsaBGL99FWY
         ruq8l/ONeQ13NYkdpmBS12Vu9Cv6l+3EG45Pnhv5vdedBMgnqRkkx1fAvsONMF3iuaW+
         qYc76AoLV1EHYp0QcH3yeENXEagJL5B5R6OtcZk0eUkcbkeoTGuiN69ktWeqB/75BhJI
         l1a6I7aDVVKlFdH6PcmfjFPxZuE0Kfx+LmxgGa6ovXIY7L5BC+isPDHluXT4sS2Y/mLe
         QrthMtbM0OC0sYUnv3OcKNC0D35jfZQHInKtOLpM8U9ubqJMPa4e0jxEKuhaTWPRoz89
         g2cA==
X-Forwarded-Encrypted: i=1; AKwUvBz+na8aISas9n8JUCgMM9RzutEWX8tla1a94zrSzWJV03tGN6jauxZ7h/WHiwKUhlfLXm5aacyfM7kUZ9A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLth0EVHjj7xgYuHWhncRtIlGEm+lSDdDAqjzYzbVnegExEj+Uu
	05b0V5xik1GM/EHsLVlj9KHQbEYyGq9h9Sw/cx6w4Hj0YChMRoWTRpjNazUWtTEAEDc=
X-Gm-Gg: AYBFou2nOADb1rnuDwCCD74roVtZsTz75yGa1mJV3FpEE9lvOVh6USPyUEP6hTluSnV
	K4LtAF7tmbwOWXQ61pu0wflySsEFMWfEClUN1cPjczdl2o9KzABgvC+LF4zZoIG221xxdZ1t/cH
	NaE25MCYAWBsCiu4DYvMVI3360eyY+ir46j2uYLMhKiwwGsxasxOAG8ky4DXms+XFl2FkcKxT2r
	OtjonNyBAQdmR99oZYbfibRaKLoiqSgE6bgFDf/QOuhbdNz7OqyuJDQe2hu6LTcvUmdO5oPIWHj
	g+F7MlRS8xv1WBxW5Ny56J9MyBMp3tGs61bojrI60uXctcx963A3/RmylGyaCbrEDydPnOBxGlC
	/gOACWlS2lGczMLmf+O5IcKR6usdfgGepCNqdhCcf4Lii/g/ozCvTNO/J3zsKPjjnT/fPIGTRq6
	ZiTVQ/0GQ/vEXl58LWvH5CQoPYtUVpwgUGTA3Aymh3MGuK7cfvNDJcFwu5cM6BpT7KOPpoxKMyR
	4SJJKUB6VV93SkLdhi4aV7tbV3i3QRdCypU8gEfgnM1Zw0gqYf2KTgVeyZqN4SX3Qf3vASiAJP9
	p/qF9vntAiJ5jGBA4coJxUHB2WXRoC9YhPRt05R7Q/pqeosFimA/htkQFB8UqnQaOJCh8t1YbeS
	oSh2HcCAqNVCAu8VHYRm3/ycpOA==
X-Received: by 2002:a05:6000:454a:b0:48d:f7af:be35 with SMTP id ffacd0b85a97d-48e5d5c8a5bmr4210091f8f.29.1793193919672;
        Wed, 28 Oct 2026 06:25:19 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm28391447f8f.54.2026.10.28.06.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:25:19 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 14:25:15 +0100
Subject: [PATCH v2] usb: musb: musb_dsps: Wait for controller reset
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
Message-Id: <20261028-patch-ektor5-dm8168-usb-v2-1-c2af306eb228@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr0K6dgzTQAFX3sOwKO0A4w8lLRAN4
 e4WPIDLl7zvfasI5JmCuCSr8LRwYDdEkKdEmF4PHQHbyEKmUmGKGYx6Mj3QY3I+B/sqUZUwhwa
 sMlrqHMuqVSKuR08tv4/yrf5xmJs7mWnP7UbPIUY+x/WCu/f/ZUFAqFSRZpjJAq26PnnQ3p2d7
 0S9bdsXDvpjb9EAAAA=
X-Change-ID: 20261014-patch-ektor5-dm8168-usb-d6ca2a5189f6
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Felipe Balbi <balbi@ti.com>, Ravi Babu <ravibabu@ti.com>, 
 Ajay Kumar Gupta <ajay.gupta@ti.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793193918; l=2516;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=+QOONuVXfty/5e7THWehfWD7HTPOkPZMRyLSJHjb+qI=;
 b=6j0RGVGuI5JAIpiKZI5flRyJ9vD+nUxo7MGjBws7EhCEnmIwtYdIWMINFk9DjPgxeXYCFfceX
 TzRq9+9o6Q5BEG33IlEdC5HR0LGJfsrVzDNH4OD+Fea5R8Hvst/bgus
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

After soft resetting the USB controller wait for it to complete and then
set the mode of the controller. This ensures that the controller is in a
sane state. The timeout value used is just large as the board is likely
broken if it is ever reached so no need to optimise. It was tested with
a timeout of 500us which worked so gave it a 10x safety margin and used
5000us as the timeout value. If the reset times out let it cleanup on
error path exit to prevent leaks.

Fixes: 9ecb887522a0 ("usb: musb: Add support for ti81xx platform")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
Changes in v2:
- Added cleanup on error path (Sashiko)
- Link to v1: https://patch.msgid.link/20261014-patch-ektor5-dm8168-usb-v1-1-9670414271d6@linaro.org

To: Bin Liu <b-liu@ti.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Felipe Balbi <balbi@ti.com>
To: Ajay Kumar Gupta <ajay.gupta@ti.com>
To: Ravi Babu <ravibabu@ti.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/usb/musb/musb_dsps.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index efd1f0dbb926..91958b7000d7 100644
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
@@ -466,7 +468,16 @@ static int dsps_musb_init(struct musb *musb)
 	timer_setup(&musb->dev_timer, otg_timer, 0);
 
 	/* Reset the musb */
-	musb_writel(reg_base, wrp->control, (1 << wrp->reset));
+	musb_writel(reg_base, wrp->control, BIT(wrp->reset));
+	read_poll_timeout(musb_readl, val, !(val & BIT(wrp->reset)), 2, 5000,
+			  false, reg_base, wrp->control);
+	if (val & BIT(wrp->reset)) {
+		phy_power_off(musb->phy);
+		phy_exit(musb->phy);
+		return -ENODEV;
+	}
+
+	dsps_musb_set_mode(musb, musb->port_mode);
 
 	musb->isr = dsps_interrupt;
 

---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261014-patch-ektor5-dm8168-usb-d6ca2a5189f6

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>

