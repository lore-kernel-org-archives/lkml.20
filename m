Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277449;
	b=ztzdliRMxYPcwOeThjxBSlf7Vk5THpqKxfoI0OqcoZSONX/e4LGxYY6dflRPrWeFKdOw
	 LzFt1CDVHgmFOcGXsw8YvDFz2GnyaYQzuYDA12O+pcCirUWQsq6fr6pd9MhgR/FyPIhhv
	 GfaJA+/OB6uiIkk4xrUwvy3pNVRSMHwWp41x25zdgKn7zZ3cADAiat5kJNmLvvcwrH4Z3
	 iMYeXJ07Tmf6datdCgRrpP2RIy8/VpV84EikdKnoUC8/4sslFVlAMwI0uX5uUBs52ZeZy
	 CZ84fINeMZ8qt/AFijlZsbTf21JpiToFnKzBz0daL1e5Fwqsr8kHxqND5HfpddYJYyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PrkOtc/OC2AOG+d6nHrznRI3kYXg0qTtORwpIqtDkPQ=;
	b=5eyNdpiDOwC5d1MuganXghW5/+8GEg7TkQ7BUl2CfqYblozbQ+CWOmR74Q6CNfS2/xBc
	 kJo3i5c9caHcvFS/pz3o1VhDYb6Gn7lx4hv5Z4EECjl9ZwvdD+HNlVtiYfklCg7mjIUN4
	 KbSrOCXntSYhTB3jONWhVvp5d1HOvZVkeD5uiEYCz3sn9N9u2X0trH3p0PYVicCN+n85q
	 C5urNzGUn1rCbGp8oEgDqP8SkO4lN/cTlnu2F64a00ciaoDzKGqFlpQXMiO7HTqoCtgNd
	 6SUbtlvaZrYSJEUHQGqZQjjIHZFQR1LkhRsLkdnt94Txk6uk90twcofH7gbApG26mkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKnyin6A;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB363606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB363606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKnyin6A
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53512cd2f85so16572681cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794277448; x=1794882248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrkOtc/OC2AOG+d6nHrznRI3kYXg0qTtORwpIqtDkPQ=;
        b=aKnyin6APAKufozj8dG1UjPebu0006Nlpvnz+VA1zBbADA+c/oYEXb0kaT2alYARcW
         Grs+j4cN8T94Okbv6b3A4XOKlyhG5JtBFP+EClEvpG0B3lE0uNi7Ssn+CTPd6ERxjK49
         1fkoFoVaNlsWeyO3G5+/dKaIpsgJLGG+2vbURfo4fyss9/GuBv5Hq/6HwN7rkAR84rb9
         6Mob0mj9FHlvb24jnTZ2Q4jO+SqOWd0x1QF+BxM6sT/A3NMURMzwvhKaQgjRGFb/RuI1
         NXYCwEtAFwhm+toCe5l7k7ZN98HdYJQNCcDXFZZnvSRwl7F19yU2w5PluOWQa7PcTPzp
         xjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277448; x=1794882248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrkOtc/OC2AOG+d6nHrznRI3kYXg0qTtORwpIqtDkPQ=;
        b=EpNpML0lzs9LVidJ8FiZaPu5XDJ1PT0zg2brSiGxetHCALWd5mQ9c70KN6obxflEZp
         9BW44EuyreEq4wQxUnPn8a7fUHtoRRneKF01BNnNQasf4B6TD9AUeNzxZVTSROwuMaZ6
         xPjiBNn3MA/gd9gGEdvgCe8dFD27vdUFuiEyyaf4GyHN4fOzJHKSJPCjXdoXvY/M61JM
         9epq4NE7Rac0KFNbq7MLfTfKEfIgx1VyBICMZkmyhaO5gbMnyZp/lMhFFJzeVK2kJDrs
         fLizaKmLqkxR1Arm2F7fedXxd1xAQ4DhLD7kF/vyd7B44ixwpBsAn4fMR2NTyVF4nj6Y
         TsVw==
X-Forwarded-Encrypted: i=1; AL+hErF7l4gB48FocuQLYA9AWumaNGQZ+X3/54m0p1BVmVTj65oe+idqYJ3P5QvIAwZ+8Dnive8IDUlpwVAMQSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1/qPVQvy2xa+dOD1sEazHwSWCr1HDh1H6/+AsVrlOlamUraGi
	0DIcEcrFQNMB0e44mEOdyTNx893kwHnDpIOgIYpDk7I2jGfai1KyS8xH
X-Gm-Gg: AYBFou0cbOXzYvGZz2b8XApjoJ4kPRR4/w3Qh9HB/Dcgp/EL/8qLQXaA/CYIdNY/Jau
	2SzqZcFPmtMjyevWh6OBIV2EpWZSCsOWT0D5GuMP3K0uEO5T4EcPDACkEAQuf7GJLm/xGsVCsvj
	jBMOYqNETV0Zn6t3LPWP5XLY+/ATe3Dy0HG9b+ngs1Uu/JOe0xEnC+MZ1ARLTk5C/6RexNks9hJ
	FslM1kDkCY/IuIv10a+/qUYik87bSfO3QsvOJidz7wSOO/2Yg8zrxaJ5y9p9CoMNkDaztX8Fqqx
	O7/LTMY4IbSAmhCcti7qUZN/Eo93bPgsuLBrDKnW6i6t5D2vCyjwc6UzoDvJ4n25/RivNmhCVqn
	Mk8kXq9SUBBljgURNLAKXbRLDQU64QKJm9K6yUx5Z0h1zXmsVyodXvmYexOhpodXTYwQHvpzjms
	PdJ5KnxodHVRhJUFEP90aXWpfBI7A8Ng+vRaxBKJQaiVWwFNFIXgILveO8zaTwr1QiFcAYAG+qp
	PpDXLHOHeDU4vQVFSPhNAI7Q0+tO63mhXxQdcsHkdBtbxJW9HxAL2Hs+f/LkgiLvnKJiB6jWZV9
	sKCGu2MMlHr973d7Czc/wOTksg5Pt0ecvwNegrSz5IwwsvAhE8GojToxQ6abKbMynq0=
X-Received: by 2002:ac8:5a42:0:b0:54b:8145:dd3f with SMTP id d75a77b69052e-555283f0ae2mr18654381cf.17.1794277447716;
        Mon, 09 Nov 2026 18:24:07 -0800 (PST)
Received: from nerdopolis2.mynetworksettings.com ([2600:4040:5e70:4900:9dc4:9216:4f52:6891])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550bf2cf01sm12069621cf.25.2026.11.09.18.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:24:07 -0800 (PST)
From: Adam Simonelli <adamsimonelli@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adam Simonelli <adamsimonelli@gmail.com>
Subject: [[PATCH v3]] USB: visor add vendor/device IDs for PalmSource devices from the PalmUSBD.inf file in Palm Desktop 6.2
Date: Mon,  9 Nov 2026 21:23:51 -0500
Message-ID: <20261110022351.302989-1-adamsimonelli@gmail.com>
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
the INI filem and the deviceid then becomes PALMSOURCE_DEVICE_1_ID
the PALMSOURCE_DEVICE_2_ID is also defined for completeness.

Signed-off-by: Adam Simonelli <adamsimonelli@gmail.com>
---
Changes since v1:
 * Fix compile error when changing from 
   PALMSOURCE_DEVICES_2_ID to PALMSOURCE_DEVICE_2_ID
Changes since v2:
 * Add note for what changed in v2

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

