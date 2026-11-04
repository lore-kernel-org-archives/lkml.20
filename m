Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833107;
	b=iR/3RjxGjFmruh8EcrDMIVQoBwoLgWrbArlf8+WF4HXv+kk+xU+Zdqi0kKgWW4zRmfXr
	 60X160u/w3LUVMXdDzhTvEex7zG1GsrquzbfQWwboI3V8dZmFaKfUCoRKpUveCSnwXBgz
	 Q0+JHfiurgUi/zMcFa8OBfIldqv2VatcnN1kMApaTcfFDMyb8e24fxb3/JkiYpIddpJIs
	 gdOl+pBRxeDDTUwEzMIYJx6L4PBRcwziCwa5AnCdWF1UeMTlXh9+6XeHgj1XI40/uahWA
	 R34v6I/pQTjAu+zcLA0OxTqyvmzNIKS5uXJ+QRxeeYpNMzUxRmDgD4ttHumsGrPda0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=4I/Of0MqaFIwlQipyrMVyhxTIsJLgwA6WtB7dsntB6E=;
	b=W6fgnQ+l9nCoSgAiFxPqcYn4972mcAN8gxnp8fFGP1/zwufuWEpF7Z7l7fRF/Ae7kXzd
	 brmHT8j7Oa3YDQXtUjFwugkuTfVtnA4vg/cTJWcm1k3qj+z4m1fey6iZMgEwj83dxdQtX
	 uA3+1fbXlf9VvRCndRz+pKcP8aaHU9NVRxUGROfr1Z1FVgJ4Gt09Z6sNk+IcafyAfMfLk
	 WRbjJIHJbT1iDc50o9Eh7pExnmeS8jC9yZX2J3wVLAmdMFEIMxrHp8mJyiKJmWwgchBgF
	 qCxrJDaXGT2qrvP4RZa79KCr/ZxIw4aTzSCI2K5zn9lWcSnPuJbN0bXan3nQz8CInmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q9QjrPru;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D73D606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D73D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q9QjrPru
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f2b8cf037so102547685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833106; x=1794437906; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4I/Of0MqaFIwlQipyrMVyhxTIsJLgwA6WtB7dsntB6E=;
        b=Q9QjrPru7WqUp5k7qiTAyJ7BHKv8Qot0va6Sh1tJO+Kte7MSH+b8g0w5ECiNxebFnk
         jz1UPaN87xoVtk8iuMOyAuq8IIh/V66b9dtpF9ORdmUVWIxJLNeuP896qbDDaW76rcv/
         cLP3lV4sH7rRsA+44sSK1uY3s+D4gsI0XBHHB2xVmstq8i2P6F6h933acQF5D1QKHz0o
         ZtPavjA6cN8WqF7Y5rrzGzixGE3497yxgUcK7nRvzSyeAMb/2fcORI5MBvxzibvwgJLP
         FaNzGuOxLKVJ6gwx+mUqIzJ3Eu6sL/JlCkqXNbPegBqEdUKXBuNV0AoKWCkddMv5mo/q
         fABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833106; x=1794437906;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4I/Of0MqaFIwlQipyrMVyhxTIsJLgwA6WtB7dsntB6E=;
        b=zNoM7x7w/o2S1IP5UXOLbiIaJMjQsFaqoqgjF2w/8tjFIJxlPZBW1aIlRs4BKHzZQo
         FxkzpHqe+wAZzb0xBm03Ye9jk7FNGx7DrcPrwc8G2IqE+/5NucX8LMnIG2BaJr8q6NN9
         t+9G27y5o7ee7hcgQx4xg6PgaZK9PC1DDXB9ezlGSFdhEK4i2H3KQ4eY2wWvNTDA+8lH
         FlqrdVOCcpVgXYURuKg9MLXmtO+2mJcfNN45iVsV3jLQ+tqnXNqYGR6ZyQpyWpaOM4bt
         mN0ckZ3Md31v3OZltzmsftT3PQx2YGKIo2Tdfy/2tnOVeFRisg88doz8TvqbS3s+8haJ
         9yVA==
X-Forwarded-Encrypted: i=1; AKwUvByNfS1kCyGgmtZdttG5Pz1K7aK1CifF6pSyAfN8M3MP7G0cUS9gLlCj+XzohbtFmEjCLo9AogROWC4HU40=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8qJ4j6ygfJYuk4kbImYOOX5vIqpZ3bDzWROo1nugZG3Kf8LLW
	EAguUvcu7puymFXqDVkxTxU9s7zLIYA2xJI9Isy3650ra0XRFYUD8SaVSAhdYA==
X-Gm-Gg: AYBFou2Cytarm+krcy+OQljiNpmVwvhoUmfZ0cTvZmzTQRzSbbceMkAlaivcLYlNWy/
	4d72Ow+5Dn5Sn+O/kHcEMt1k78dTmlHvMRluyC171Xi5B1CuUMjfpNthMDAKgs+s0mXgb5tGEWR
	an5eyAptLp3NnRTjxVqpUT3KA4vqPRpaLfbhdD+4pVSPbs/zANoVidqvWIjxVBr4gnPAsA2GpmR
	ERDy8jGDVPiYcAxE3uooDqjJPzhEWuoiXkfzaVbYojHNXnFGnCUgebohRGK+fLXY7alvN+dYc+V
	QhnCAW46oKxOi7ADMZ6V90vzx/usgvFaG3p4VdmVkGohWcXbtQq3Ju1YLMXKmSF2Ldt4x5XM2zh
	Hf21oHEAHvnqmFB3gBjk+AsynSNfsU14uyoBBqcFDzwqDLivk4DJEe9CBLQrI7Yy8qUs9OBovhs
	8wqvH/kAyo+4B+0eSXhKNoBb21q0ayhdo+jXA+aooueGehsPTDY6gTDsMCGstDcBdm60p7X1B9A
	4pWJZbqwgBjcpF5Qiqz67NXT/h8iUsoLndDd0AGrcTz6rB/928XcuIEpoKdF60IwJOSG03Xhhha
	fHzO145CiD5SUU3SvBGj662kXZZH1UpFkQwWnzg7abxb/HHRBQ==
X-Received: by 2002:a05:620a:3720:b0:93f:38c7:70f9 with SMTP id af79cd13be357-944216f2318mr3136951585a.14.1793833106272;
        Wed, 04 Nov 2026 14:58:26 -0800 (PST)
Received: from nerdopolis2.localnet ([2600:4040:5e70:4900:c81b:95a5:d93f:b197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm317811085a.39.2026.11.04.14.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:58:25 -0800 (PST)
From: Adam Simonelli <adamsimonelli@gmail.com>
To: Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 [PATCH] USB: visor add vendor/device IDs for PalmSource devices from the
 PalmUSBD.inf file in Palm Desktop 6.2
Date: Wed, 04 Nov 2026 17:58:24 -0500
Message-ID: <ciHDthUGQaulSODjTZQ9wg@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

From fed0bc0868dd1e0dfe98ec84fcd7c1208cb076c3 Mon Sep 17 00:00:00 2001 
From: Adam Simonelli <adamsimonelli@gmail.com> 
Date: Wed, 4 Nov 2026 16:56:50 -0500 
Subject: [PATCH] USB: visor add vendor/device IDs for PalmSource devices from 
the PalmUSBD.inf file in Palm Desktop 6.2 
--- 
drivers/usb/serial/visor.c | 6 ++++++ 
drivers/usb/serial/visor.h | 4 ++++ 
2 files changed, 10 insertions(+) 
diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c 
index 5706c46c49c2..5a289c566ba6 100644 
--- a/drivers/usb/serial/visor.c 
+++ b/drivers/usb/serial/visor.c 
@@ -75,6 +75,10 @@ static const struct usb_device_id id_table[] = { 
               .driver_info = (kernel_ulong_t)&palm_os_4_probe }, 
       { USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID), 
               .driver_info = (kernel_ulong_t)&palm_os_4_probe }, 
+       { USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_1_ID), 
+               .driver_info = (kernel_ulong_t)&palm_os_4_probe }, 
+       { USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_2_ID), 
+               .driver_info = (kernel_ulong_t)&palm_os_4_probe }, 
       { USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID), 
               .driver_info = (kernel_ulong_t)&palm_os_4_probe }, 
       { USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID), 
@@ -133,6 +137,8 @@ static const struct usb_device_id id_table_combined[] = { 
       { USB_DEVICE(PALM_VENDOR_ID, PALM_TREO_650) }, 
       { USB_DEVICE(PALM_VENDOR_ID, PALM_TUNGSTEN_Z_ID) }, 
       { USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID) }, 
+       { USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_1_ID) }, 
+       { USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_2_ID) }, 
       { USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_3_5_ID) }, 
       { USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID) }, 
       { USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID) }, 
diff --git a/drivers/usb/serial/visor.h b/drivers/usb/serial/visor.h 
index 622d639ce74e..0f86bd06c4fe 100644 
--- a/drivers/usb/serial/visor.h 
+++ b/drivers/usb/serial/visor.h 
@@ -32,6 +32,10 @@ 
#define PALM_ZIRE_ID                   0x0070 
#define PALM_M100_ID                   0x0080 
 
+#define PALMSOURCE_VENDOR_ID           0x13e8 
+#define PALMSOURCE_DEVICE_1_ID         0x0600 
+#define PALMSOURCE_DEVICE_2_ID         0xff00 
+ 
#define GSPDA_VENDOR_ID                0x115e 
#define GSPDA_XPLORE_M68_ID            0xf100 
 
--  
2.55.0



