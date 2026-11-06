Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794006482;
	b=xXuln4MonBNJ6MO7MDwywFREW9eW+g9UIftP0w/YPghRhwlQpIQ4AcM20Fp03Dz/tRSI
	 yl5MMEDRcs31UrqPA7HFRtT0XyVcIFLPqHXQt5qd5PXnPtzZCYNCw1UPsJratJoJv5tqC
	 yOM/SKiOrmUbsiBFrIuCB6yPMNZsp/RWM1+5zIKVnsALwl4pYr3knCz5wWQeDQdXLAQTO
	 KqZVvvKie2I5XJDWaWl2xlahAYs6gbjW+Sk+pNzaRhwCSYXv9Z0cWJsEC7cP2tYOFHke7
	 tPpMWytZRsjep1KzVsU39OzEbDj2OcFlTxVSeyNzwWvkL1Lwp8dUYLjwxk59xaIxgmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794006482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DRx7HVaOdJE7DvS2IBVEJ4TVt3eGJMgIXn5m4zK8mAM=;
	b=c8pHAzCRNs/uqz7sKn7sX6VrFHe9gcRhRb2fvhkGuR2LBrJJGYU+lHLsRSJBCLM3n2LE
	 sPmQkesc9QgDkiRZT8jwRQjDYz2HXBOQbZJaCIcUMtSV1V4JB1doeEc9KwR9OrPIOB8qN
	 WCReCkeMWjtPWGOzWAPQHVkuA4+OFT8F1jGZ7raByzRXyfT2nYQTvjq9n/DzjxFZ/ECcd
	 oL+UqvQ6UFYFrsO+cSwt8MmEWGLm+G1XyncwGLNuUOrm7G/97C6f/YP6Y5FoSRmE0TCBs
	 Z2XhefnygsC8D11Ba7MAdWNlFEUe1B06p+tzGIoUsZUTnc3KxeP1A7dX5Wsm4qhg4zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HjJqVZtl;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A55606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A55606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HjJqVZtl
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91ebec7d5dcso15926d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794006481; x=1794611281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRx7HVaOdJE7DvS2IBVEJ4TVt3eGJMgIXn5m4zK8mAM=;
        b=HjJqVZtlFEWd/sWH8uevBdwfrw9NRuoctSSBB9Rxonsv7NiCS2NC2/akzy7DcPquI5
         69wSJ2gVJlOx+dutT5/GyotxxWLffpU1ltvogRdJmAKqbxW5dXNppTZ1nsywoEvqJXtv
         IF2P6tdcTfBSzbS9vkvo4sPtS/WqvIgsjm6DcUm6rb6q5TD8lHQjRWqrpFB3FLqOIbOl
         g3Pb/cykxOaS6Des/x4uryz7EPCaCHfYTOVL8DCKZYQIyIbPlBZgDvEAEinypmspRQgE
         jtinVtO6UubOLmbG6VC21xzihdP8rBH5CV07FVgfGb3vi3xAEornoF3ooryNBe8wqivh
         s9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794006481; x=1794611281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRx7HVaOdJE7DvS2IBVEJ4TVt3eGJMgIXn5m4zK8mAM=;
        b=nOJvw93+0lesLmjAvphDRFTICb9kNdWc2zZGcI/qnSqPKuakMvtUHeA7mfypQoh3sO
         msQu4IpAJfD9GWR2OvTaCXLWL9HSOiniRwCjY3YYMeO4VFdJ2NrA+hWclcqpjjiOMn8r
         Eh3/95wCM4rzMSOAK56JLbXpWrPXtmydt6mIMfW+44A3GtdwBt7Lo43rS+WnplNwD9uN
         Gv5Ojs3G8pbSH3c9lMiylkv+8yHeCL8+wHz1eUIRZdFzHnAV5fFyTaHY/oURjnWHY7f+
         ucpSQPaoNfJOt3TxwvLE5T3q1s7OhLgpz7wH/2ZJhqoq5nYm6TZuz0VqXRDPGxzsf3hv
         rbsA==
X-Forwarded-Encrypted: i=1; AL+hErGC75ZZWfQ15RVBbMVBj93HzAOxvilcFDqkSW4Vg2GmYgt/4JSBzpcMew1a4ohkZI6Z1hkFnjKaBz7pWlY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WCBSTwfdZtGGqnnYiyQZ13tTwrm8+hLFf7OT2TcjIXQq8/sKv
	zBOx0xsvqzsnwIA3Ts4ZvKVSFxSOGfTDzN3chbmGXXW6OO2WnbXRzurS
X-Gm-Gg: AYBFou1euA/HQPXgZoeovHuxyDz9qYVMJuakVnXI4B0A9lRN9u3cDG/JBL9iS4DkCyb
	kOfD9b+H4llO+H4vbAJEhECUuDf32a1/hCCIS/o7Iae3GhBx/cekfpi0eIGiBYwq2jZ3DLB7F0Y
	VNAhLVKdvMIIW56QcXlu41St8IwdDfyg9PerqIbgLeOUKoqAf7NDdqnNsMva1FkfQNXAqZIDQBj
	7XJ4/02PHTf8p+o8vd+hk73EjQ0yKirXQDnKZVd35KvljfINeZ9WIlJxFyseDYK5XpkV//jeMm2
	N7f7w45O2LGxi15B5wM3BmnBb8UgYstoywnEq3/Y6mCJDfvZsz+lGITxGmD+oae3U/57Qypo36h
	5GH3ODXpshJH4JR7mb2q82Z1L8K7ys7aGHDn3MGP9DMf2cNtLE+dDPbLtjMxIT0o+7WDms4yCBs
	j6NUhKLOR3oj5/aIx6jWkR5pJtXPJ+YZjBpGYTyY1Hpe3DHbNKP9Hz2/UbAcj3ggYad51LmTNin
	8XzXtIlf33EVsZh6esITB4ABQgDbDDe/k8vaQ28oUIELtUk/t/PUfb4B0Rx2SJDkCtrxwM7nhIC
	JK+kMmNtJ9Z8EmnfzTlCnj7bUEIKLPclZ0p20JxKCNt3ysb9Z0sW3My+DsdxW59VDXg=
X-Received: by 2002:a05:6214:cac:b0:91e:98f4:5da4 with SMTP id 6a1803df08f44-91ea932d46fmr59699546d6.5.1794006481196;
        Fri, 06 Nov 2026 15:08:01 -0800 (PST)
Received: from nerdopolis2.mynetworksettings.com ([2600:4040:5e70:4900:f826:3fc4:9d57:a627])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea675224bsm31195606d6.0.2026.11.06.15.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:08:00 -0800 (PST)
From: Adam Simonelli <adamsimonelli@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adam Simonelli <adamsimonelli@gmail.com>
Subject: [PATCH] USB: visor add vendor/device IDs for PalmSource devices from the PalmUSBD.inf file in Palm Desktop 6.2
Date: Fri,  6 Nov 2026 18:07:55 -0500
Message-ID: <20261106230755.2652311-1-adamsimonelli@gmail.com>
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
index 5706c46c49c2..5a289c566ba6 100644
--- a/drivers/usb/serial/visor.c
+++ b/drivers/usb/serial/visor.c
@@ -75,6 +75,10 @@ static const struct usb_device_id id_table[] = {
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_1_ID),
+		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_2_ID),
+		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID),
@@ -133,6 +137,8 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TREO_650) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TUNGSTEN_Z_ID) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID) },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_1_ID) },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_2_ID) },
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

