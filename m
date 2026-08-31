Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF9C3BFAFB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165859; cv=none; b=X66L8AuVn+vpybqUZljTmH1JdF0OLmliVFC5hSdG7LNzf2o1LBBoqIa6EaHYy4bbJ/j1hHpXA1PuUcKpgNuuYB9+KcVqV8ngliAseGa7yumrTBSUdsG6KWX/69doDDkAYTglRD6ZHzOTH2e7MHiRA7/bVy4zo6D6mrlwmsIHizE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165859; c=relaxed/simple;
	bh=EyX8qvocRRT4z+7IIC/7oHq63cyTz6iY0KWcwy2pMe8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oV4/jcwcL1qwhCp0jIdfdPvDPkEdyH/ZOSEzFb7NEkdHJ0EiA1XborsQh/RAXRW+bn809b4DpXQNzZS0mY1IxV+/2MtFApnAwRj62gV8HdBRoHpteqTftW5940Z3ltOJ+D3nouttBS3PRhk7BDsWibyKfXhq5ON181eyEwxWW9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFffVMkN; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFffVMkN"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3720266a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788165857; x=1788770657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MDVn5ErxJ0Fjvf5gqyhUkfteNgBIOZxlcmjpqwkLy4o=;
        b=LFffVMkNlwDGM9qUdafm7euTwYuV3Yus3MXloOqMgX3a8ZbMXhgI4Gaoq1F/vub08P
         XpYUoN/Qy6YIfvgN3lYDdS3okcwOjIYEWfKD0zZ54y7zo2gM9YcpCLe36zetmc+vQceM
         7QzUEJihMQDscQZxvopPDnzIvWUbSQhB8kphbj6Nl2kgH2jLfuTiKRNa7QeC/81yTGsC
         O6YqpaxgMMuqSVBfxG1+4Uwpji/Fz4ckkmnXWYPffwhkYcYYJ1RzftWT83Bc7YSOS6rt
         0GKjp4UHkeW+FFJu/OW93AT3vl5qcJYCKtROHyWNesIANUqYJhFgpgSDUpw1o0nYpDfo
         jn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165857; x=1788770657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDVn5ErxJ0Fjvf5gqyhUkfteNgBIOZxlcmjpqwkLy4o=;
        b=jdAf8XEo8it9cHJopm4wHsdwR4kxkIWex9gIzilEURftYM6DfkDX8FLL48diEwMdwK
         Z/JBnCKbkQJ0uGsSGtL+Pzx6ASwxb2RCsJsfeUBVjtUOi7W8xblx4WceDLnhZE9gl9xc
         DbVTuWEu32B6jXfBM9o0+Cwy4D6yCnuvw5MLXDpNz7h3sc3Rn75wrvep86aMgz3flVZ6
         lg9tymWeXdRaXZoPQRqtc65PhxyQ008kV0WNn+T1CQMZ3vWTtTorZYVpiw3JmiHPZQDY
         /tWGmec83cm/4hpa4rxPkaG2Nah3x8OgGo1HSdPQnXpyIq8Y28DP8ZG22WE63Z7ba7UZ
         Eg+w==
X-Forwarded-Encrypted: i=1; AKwUvBxcXAmfN8+POaUWUuP3uzx9I8SbE5ZVlPTSP7NWEYv+RzQC+JORsJPichTY3njLkP/rJ1X8duu59yXTrM4=@vger.kernel.org
X-Gm-Message-State: AFuF++keVYv6a0GiAHmghjruGHg36VzXFOf0/ELp/I1oEoQzO/9Pcu4u
	CHF694cPUp6HwwEjZV3+ZdVHvhwm+KV2WxVO/8ljxNLGM97DQfTJwG7jTq1uAprT
X-Gm-Gg: AYBFou0jipXdsv9hBmgN8x0CPtfW2Ov9jcllz/iB2oksVK5HZYQ63E5Z1zYYaLdwohV
	GIZB8M1FqmY8wYntJxOIgKJS6nOT6BH9bgue6tREJw3tZN9HAsA8zIxIg2sm6p6/fOWoH8US49R
	MOCfjJOsVbq1deoQB6UZtSsc7UP4gWsVXtj911Bv7JEdH8bo0eFpxtSVUpSyT0wgtJJqKqOYuRd
	sPp+1DjETSn94b/l6mO3++QihTgyopS2+XA+NgFh3VLxlqK66OHR/VcLrUJrVLyxMkAi5amqIFt
	pTREHUVFmQZgnyf+u1Pu/mpBKD7A6b7RX1obW6kCGTk24VRqB3j5nZhhgFYIflbbhXz6RJGdYc1
	SelshoICo7c5EUdEmG1TPAzIcs9iUa1wpdyM3zwckMDQYEnTqgt+VmhEUvQCwyjGPxiEYbkkC2j
	pxj/cEeEFexfHZhLs8J4PemVqDMaFSpAhw0FSaddPnz1f0fUvBl9PfdV5sky3B+dc1DHVJAPNCX
	oGMo4zXZZXEMBGiKALQl93/NDuyC+EwgfI6JpfeaA==
X-Received: by 2002:a17:90b:3c89:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-398f88f2e0bmr2977653a91.24.1788165857075;
        Mon, 31 Aug 2026 01:44:17 -0700 (PDT)
Received: from ian-lin-DREAMBOOK-PRO-14V.. ([2401:e180:8832:3ee7:cbb8:f1fb:c6e2:ba18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1ac3cbbsm20142625a91.17.2026.08.31.01.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:44:16 -0700 (PDT)
From: Ian Lin <jisayme@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Lin <jisayme@gmail.com>
Subject: [PATCH v3] USB: serial: option: add Compal EXM-G1x support
Date: Mon, 31 Aug 2026 16:44:05 +0800
Message-ID: <20260831084405.65506-1-jisayme@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Compal EXM-G1x is a Qualcomm SDX12-based LTE modem. Add support for
its vendor-specific serial interfaces with protocols 0x30, 0x40, and
0x60.

Relevant output from usb-devices:

T:  Bus=04 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  4 Spd=5000 MxCh= 0
D:  Ver= 3.20 Cls=ef(misc ) Sub=02 Prot=01 MxPS= 9 #Cfgs=  1
P:  Vendor=04b7 ProdID=8217 Rev=05.04
S:  Manufacturer=COMPAL
S:  Product=EXM-G1x
C:  #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=896mA
I:  If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
I:  If#= 8 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan

Tested on a Compal EXM-G1x modem.

Assisted-by: Codex:GPT-5
Signed-off-by: Ian Lin <jisayme@gmail.com>
---
v3:
  - base on usb-next
  - add AI assistance attribution
  - post as a fresh thread
v2: https://lore.kernel.org/20260828082645.13018-1-jisayme@gmail.com/
  - split USB serial support into a separate patch
  - identify the Qualcomm SDX12 chipset and include usb-devices output
  - keep the device entries sorted and add the product name
v1: https://lore.kernel.org/20260828075644.6228-1-jisayme@gmail.com/

 drivers/usb/serial/option.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index fd8f96294..8713f8b93 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2541,6 +2541,9 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, UNISOC_PRODUCT_UIS7720, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, LUAT_PRODUCT_AIR720U, 0xff, 0, 0) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x8217, 0xff, 0xff, 0x30) },	/* Compal EXM-G1x */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x8217, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x8217, 0xff, 0xff, 0x60) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0530, 0xff),			/* TCL IK512 MBIM */
 	  .driver_info = NCTRL(1) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0640, 0xff),			/* TCL IK512 ECM */

base-commit: 15734de99517b0c81a1a5a3bccaff4593ef8d953
-- 
2.43.0
