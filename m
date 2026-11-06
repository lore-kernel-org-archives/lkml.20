Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007994;
	b=QkHU97HYqpzymwmibAReDoOQFf3G/EHXAlIXucaE/c5NCxZ72Fx3jYgEw32EYfCaqsxk
	 X3LqdttAtbXorapNbfQiMdD3YtWIZmv/3HutNCrkndWBNJ1nQjZK5XA9gU608LJFFFuFC
	 Ht04Qh4JV/7KYTOK5tIKUWwl/deuVd9i+ipZSsAqwlI+AVjKa48ZhzY7hG3QVu3Kcmbrc
	 X8WMgNKvt5dI2MACJh4yLjs8IGljdgsYbz9SD8NpxcO2dWqbZ9uvmtHS56V+g6MrDNpX1
	 56Ch62H54EQzyuQJucjRg/4XjADRPYS4EIMdFFDTAveCD0O9/MPGLi1BVhq55TIUFuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zxfYVvH5G04u6i4PPEDKV6DF5oBNEBfWKzG/rxdV9B0=;
	b=bveVVzj3p5aowtAL3YUjf0q/RQJw/geRducA4ZQVh/OHviYnLXhZqoRE8svHwiApar6h
	 B/iiZ10mj233Srx0l30APq6TQQBBKNM2bParrnkhPVcHt2A57hpA/xxHNIBuj4R573WeX
	 GcbLJAME3lFcYeaxpV+8s6NqRtluOhEJlmHUAV6taaE3pLZospuOClL+eeMtcTE9j9knS
	 2GCtoknlIoplPvYYKhUrxoV+/M2RJI6koAAXkXmN1xtjRMXtSgsqNQRDRM+UKywb330hD
	 LYcXLstjcjVzoyXgB5s6mEgJDsqVV/oGu3PpAWY8RsivQ1liFaGMIDxd2Su29AWxqJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtE7RUna;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B77606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B77606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtE7RUna
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso12187636d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794007993; x=1794612793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zxfYVvH5G04u6i4PPEDKV6DF5oBNEBfWKzG/rxdV9B0=;
        b=dtE7RUnaeY8tP9khziSLkFTMz9CrC7KCDdxq2hMm5VDXP35abZlI6zOM9Dr7M3GHN9
         h8Vidq7aBOXKQcn1zk3lVgqD1gMtxL1AYC9xeM6kqniioVnpnoUDgB6EJeiTLSu9Ls3z
         TZeTLJCt5Awwyak9g08AyRxsJos+R5yhWxt5FOX84fv/BOo+hfXtXqPBWPCATSOz9sqd
         5vDkMYubVFmwc/7llxi59qUf5VHA2yWh5z5872LJzS9uJpSnC+Gazz0IsXAc79QBieJP
         amb9H26pi3sDtGHNRnsBjzIVga/Livxj3kk6S7hvmqmWOh8ZqRW0sPW7vqSOowLGXu2x
         6oGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007993; x=1794612793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zxfYVvH5G04u6i4PPEDKV6DF5oBNEBfWKzG/rxdV9B0=;
        b=lcinDA6lGAJ3oELO0uTxT2LfBSs9rsCbmmTpg4/Xv0Ds+CIt/vU89sFDidzdwsU3S8
         EWr8HyoZEQ+duobUmIOKWWNPYaLVV+loAbZ8kw0s5VmcsiUvn9mrzDL/MbplzBR1y8OB
         5wbsiZcyWjogEYmoEpwQL9bDZ6+yK8eTmxUORKX/v1eZUDfA99zGVUirqYYNqwdIMU2g
         n7V0o36qYTYDQKJgUyaRz6inccdtTZMcbDrmb48BIcZ2q53G161+ZxKRSJtOjFRBR0lg
         xvpZKwNErNCPRCLT2q+8mr4uvaN40wKWokAer5CQx6ukzyJxOMn4YwPAcJ6AqntOVXCd
         Kq1w==
X-Forwarded-Encrypted: i=1; AL+hErFBHqK/Ta/4Fo3F5zycEDAUmlznyTHEk6dNd0OBpBkP/H/9q3LikvQVGG/rhDm1Na7fyJzFkcQtQrOlEN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iiMVAq0OUJ8EllgcaNFFStU4uu/cu1fQ3VC+GfBheEWnkXa7G
	BKyTkhQEyr9X/6KYcm8KKvBlwCvS+mAfSKmvQ0b+4stXrtZiRO8sPoX5
X-Gm-Gg: AYBFou2mawtsC5K283qPCf5/9F8WLKqkgoKjgVJAYxryiqM4L3Fmg6r8fvDplPG26jh
	HfmWHLNRk7fHZd6JGTKuiilPNEmSknq17OG59lCEhA0FKuQARLzNeNNQSI3R04hhwe1KSfbI8Ko
	Ll9RbjHlIlBVkCvHXtQ1IwKVGrFyh7RKCDxeFdFbPA44DV23ONMx9VN15/VUahFemMb4JDfIsD2
	IkgyWcSF19aPcfiVGd1C1IkRbTT+Iurq2EAG05Lq6uP+qg9xzNf2pYbhMsAbZ6+/4s6Eq+SSErT
	anvxNpm5i/y8cb78rEMaKolldCVyxV2oiXvIr+AKWhA/jCTEVdM5mH6f1iReyuP5OQQxqYpZ3GA
	vwimfcbghNH3WaXDGo0IWbo/6ei4nP+SH6qLn8A/QBq9vD6AxZKgapG3MT7/J14pckLT1KTMGgc
	5MWa19t0QeGUSGMV34vAMLaYBnnHuzFD+98IZsLwT4nWrbX0gTjvZxz3ak9f/P3XvC01isBA53U
	PC0P2pR/9TQTuaKsgCWPZ4JCar1d6wXFXcehJ9Dqly0gRSyywZn6fZPY/DcWqKxaWxy5xicvkoj
	ppFjpyRI/80aJnu5LTD7o2+H9Omr0VQFskjGB8xbr6JxkO/Lr25rrnFJgfgU4TImW9NW3vcp/yI
	p9lWFoJbFYGD0
X-Received: by 2002:ad4:5769:0:b0:91c:9086:ee29 with SMTP id 6a1803df08f44-91ea97502c0mr61821976d6.40.1794007993077;
        Fri, 06 Nov 2026 15:33:13 -0800 (PST)
Received: from nerdopolis2.mynetworksettings.com ([2600:4040:5e70:4900:f826:3fc4:9d57:a627])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a870dcsm31066286d6.30.2026.11.06.15.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:33:11 -0800 (PST)
From: Adam Simonelli <adamsimonelli@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adam Simonelli <adamsimonelli@gmail.com>
Subject: [PATCH v2] USB: visor add vendor/device IDs for PalmSource devices from the PalmUSBD.inf file in Palm Desktop 6.2
Date: Fri,  6 Nov 2026 18:33:02 -0500
Message-ID: <20261106233301.3267777-2-adamsimonelli@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PalmUSBD.inf from Palm Desktop 6.2's driver defines two PalmSource
devices. While PalmSource only developed the PalmOS, and never made
actualy hardware, as it was Palm Inc. made the Palm hardware, there
is a bootable ROM containing PalmOS 6.1 that can be booted into RAM
on the Tungsten T3. When this ROM is running, when plugged in, the
device will then present the PalmSource vendorid that is defined in
the INI filem and the deviceid then becomes PALMSOURCE_DEVICES_1_ID
the PALMSOURCE_DEVICES_2_ID is also defined for completeness.

Signed-off-by: Adam Simonelli <adamsimonelli@gmail.com>
---
 drivers/usb/serial/visor.c | 6 ++++++
 drivers/usb/serial/visor.h | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c
index 5706c46c49c2..18c586d552d7 100644
--- a/drivers/usb/serial/visor.c
+++ b/drivers/usb/serial/visor.c
@@ -75,6 +75,10 @@ static const struct usb_device_id id_table[] = {
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_1_ID),
+		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_2_ID),
+		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID),
@@ -133,6 +137,8 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TREO_650) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TUNGSTEN_Z_ID) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID) },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_1_ID) },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_2_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_3_5_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID) },
diff --git a/drivers/usb/serial/visor.h b/drivers/usb/serial/visor.h
index 622d639ce74e..0f86bd06c4fe 100644
--- a/drivers/usb/serial/visor.h
+++ b/drivers/usb/serial/visor.h
@@ -32,6 +32,10 @@
 #define PALM_ZIRE_ID			0x0070
 #define PALM_M100_ID			0x0080
 
+#define PALMSOURCE_VENDOR_ID		0x13e8
+#define PALMSOURCE_DEVICE_1_ID		0x0600
+#define PALMSOURCE_DEVICE_2_ID		0xff00
+
 #define GSPDA_VENDOR_ID		0x115e
 #define GSPDA_XPLORE_M68_ID		0xf100
 
-- 
2.55.0

