Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535E24772A1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458440; cv=none; b=IXNvea3v0Q8BdOa78TH0DE7rNU7K71zstlhbxrbKNgdoXFQProRLJFe9I+ka398kWD1HS/OG1kuisTK4ihwtFphGuIcl4uwAUCtN7wAYH6lBd41Iuyk8STlUArY8KdJZf2PmjIz329Ssd1VSmYFOTv1Xd8K5VYk/CbD1NzjRDmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458440; c=relaxed/simple;
	bh=IUxKvcbhvJ1WlqN1g75W7GmTyjgiIIsKfODG+6due40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eZ8kHyci7fjBWbYhnfbk8h/p1HQieoTSql55VDlTMyRkrB5svjLR5wp7L7ufMHOqgjpUrrJA+eV9u5nUjpjXVgss3p3X4Hys8RlagimyeRl++wOFI0csdMyq63Y3d9yGrzr6h7wTVBKjzICXq6ihtQ29MczBz0r5dgTu3RO/9PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzvfBGcJ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzvfBGcJ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so36375a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788458436; x=1789063236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=laP9SL4wV0LhItGTQrHhZYn1jphGll7QdwUkXmYDmvU=;
        b=dzvfBGcJ9HFntU0RSqEz2JM7qEvUxPnoGoBDO85tVw8Od6B0HF6Hd3LsZRCLlBBPln
         NGeK7NJp+rwgAjnj2hiGEzSPZvDRo1gGUynULqiiuyLF7ZBsqTXSFe/6z0dHlyiLz2CR
         EGi7IJ7aUMtyOm1/2EwRi+2JW2PsJBiJHS2C+O58/JucbRBc9qJdqZrZho4Rn7gPTlPR
         FRxtB8KT7d0JZ83qb1qQgw88nCSVvtOY9fnjUqUQ58cBZy0D5f+VtIr7gHNmWGrR1Qyt
         4OBa7TxXAAN830ZmDQq1TDLbeNBpLLr+A9khM2ZJYTPSr3Djbaa+hSyr4Z3mwBb1hB57
         gGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788458436; x=1789063236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laP9SL4wV0LhItGTQrHhZYn1jphGll7QdwUkXmYDmvU=;
        b=ZFdKh4ZXERyGqe0PpB9pDCpLsSDtvn1N/SYcfWtaw/c0bZs9m+P04Ovx+Bu6zyZFCH
         0IKpfAY/UbSLbl3kHLCHdIIuP0WYvAdVAcHl7/foaOjwKLOB45CfUwVmwyZveKGzT2R6
         +6sZzN7AvjGWz7C3PZde5Ej+OER482fsi5TfHDUvm3jP7Jl4favN/6dPanOhJGGAuu+q
         LTFz6w8KVMNJdv8kP6Qznhuvbx8ZTa0nVj7y0BWBWQG10peD752yQ624yZiZ5tpC52CS
         tYqH6CskYNWkZMgJ6WyuGm7QTc/Jlz7jyTG+DFg4LyLETMPlDQE8R8kkv8vkuI4UQ9cG
         Hykg==
X-Forwarded-Encrypted: i=1; AKwUvBwvkaqIQIBaUjze4gjdzk2gf7Bx7u+YQ4c8ssH79O53luynENdpGxyvOU29TqNP++bYLIZqM2RkiKB9f7s=@vger.kernel.org
X-Gm-Message-State: AFuF++miMk1h2XTJhSl7BsIU6pY7heDNdoJGTdHvrZ0H9yVssxwpCtuw
	SVq+cCdjiZrQaRcWewduSD8z9t+s4vIQVE/p1NapqjbjPIme5/qEM6Et
X-Gm-Gg: AYBFou3ZbuBaGsUm9nQYEUeoh7Ufy0zRscwvPB4hhYoUxSJDyA3EuDsCgywbUYOU0yg
	dRqbUmTGy5UTgswBHN/2rwocKPuLmNHP9Qofdk0gK9qnn6lMJap6O3ifonSoq9wS1zTAY1V/IWn
	4fKzIUd/dFzlV/souWzhSaTz+EDnmF5vsdJRa88kqyZKBb46Xq2HReV92P8r7megchfzHXOgwRm
	bJXGAzzrDf+iqS/tvmyc5bZQlMf+/Nv1eLM/qKr93Q1NfPyvX+mpMvLDgThjEyh4IRzCDuyrAiS
	JNnZo30/8mFl4AzNgnezLeHuXBTu/+RlG03miRVivWpBOsMQr98TGcCif+ZqT0LdpSDO/5umQ6n
	2lHEiqjwTe9YZwl4oZRHlAetMYpZ2viq4QQQw2hW7gqGzHjZfPSswj8POu8MdM7s2fwlsfoQeg6
	LqKLb5GK8712pR6reEbfO49pD0EaDM4UoZ2tT0qxmaCSB2uwXykeSgRMF+oec1Jul7QdSqdL5UK
	gqh1OnW2I5s4OHYMGnXwlVL8gszoAJ9JoYzQANDKFyLh+S9vI7gll4lq5FSZxArTA==
X-Received: by 2002:a05:6402:4347:b0:698:c13e:179a with SMTP id 4fb4d7f45d1cf-6a6829afda3mr9886022a12.10.1788458436110;
        Thu, 03 Sep 2026 11:00:36 -0700 (PDT)
Received: from localhost.localdomain (185-130-167-72.kund.ip-osteraker.se. [185.130.167.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6c2asm95575a12.6.2026.09.03.11.00.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 11:00:35 -0700 (PDT)
From: Sebastian Sjoholm <sebastian.sjoholm@gmail.com>
To: johan@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Sjoholm <sebastian.sjoholm@gmail.com>
Subject: [PATCH] USB: serial: option: add Quectel RG660QB
Date: Thu,  3 Sep 2026 20:00:29 +0200
Message-ID: <20260903180029.6155-1-sebastian.sjoholm@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Quectel RG660QB 5G module (USB ID 2c7c:013d).
The interface layout is the same as the RG650V:

  If 0: DIAG   ff/ff/30, 2 endpoints
  If 1: NMEA   ff/00/00, 2 endpoints
  If 2: AT     ff/00/00, 3 endpoints
  If 3: Modem  ff/00/00, 3 endpoints
  If 4: QMI    ff/ff/ff, 3 endpoints

Match the serial interfaces on class/subclass/protocol so that the QMI
interface is left to qmi_wwan.

  # lsusb -v -d 2c7c:013d

  Bus 004 Device 002: ID 2c7c:013d Quectel Wireless Solutions Co., Ltd. RG660QB-EU
  Device Descriptor:
    bLength                18
    bDescriptorType         1
    bcdUSB               3.20
    bDeviceClass            0
    bDeviceSubClass         0
    bDeviceProtocol         0
    bMaxPacketSize0         9
    idVendor           0x2c7c Quectel Wireless Solutions Co., Ltd.
    idProduct          0x013d
    bcdDevice            6.06
    iManufacturer           1 Quectel
    iProduct                2 RG660QB-EU
    iSerial                 3 f50119d0
    bNumConfigurations      1
    Configuration Descriptor:
      bLength                 9
      bDescriptorType         2
      wTotalLength       0x0105
      bNumInterfaces          5
      bConfigurationValue     1
      iConfiguration          4 DIAG_SER_RMNET
      bmAttributes         0xa0
        (Bus Powered)
        Remote Wakeup
      MaxPower              896mA
      Interface Descriptor:
        bLength                 9
        bDescriptorType         4
        bInterfaceNumber        0
        bAlternateSetting       0
        bNumEndpoints           2
        bInterfaceClass       255 Vendor Specific Class
        bInterfaceSubClass    255 Vendor Specific Subclass
        bInterfaceProtocol     48
        iInterface              0
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x01  EP 1 OUT
          bmAttributes            2
            Transfer Type            Bulk
            Synch Type               None
            Usage Type               Data
          wMaxPacketSize     0x0400  1x 1024 bytes
          bInterval               0
          bMaxBurst               0
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x81  EP 1 IN
          bmAttributes            2
            Transfer Type            Bulk
            Synch Type               None
            Usage Type               Data
          wMaxPacketSize     0x0400  1x 1024 bytes
          bInterval               0
          bMaxBurst               0
      Interface Descriptor:
        bLength                 9
        bDescriptorType         4
        bInterfaceNumber        1
        bAlternateSetting       0
        bNumEndpoints           2
        bInterfaceClass       255 Vendor Specific Class
        bInterfaceSubClass      0
        bInterfaceProtocol      0
        iInterface              0
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x82  EP 2 IN
          bmAttributes            2
            Transfer Type            Bulk
            Synch Type               None
            Usage Type               Data
          wMaxPacketSize     0x0400  1x 1024 bytes
          bInterval               0
          bMaxBurst               0
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x02  EP 2 OUT
          bmAttributes            2
            Transfer Type            Bulk
            Synch Type               None
            Usage Type               Data
          wMaxPacketSize     0x0400  1x 1024 bytes
          bInterval               0
          bMaxBurst               0
      Interface Descriptor:
        bLength                 9
        bDescriptorType         4
        bInterfaceNumber        2
        bAlternateSetting       0
        bNumEndpoints           3
        bInterfaceClass       255 Vendor Specific Class
        bInterfaceSubClass      0
        bInterfaceProtocol      0
        iInterface              6 CDEV Serial
        ** UNRECOGNIZED:  05 24 00 10 01
        ** UNRECOGNIZED:  05 24 01 00 00
        ** UNRECOGNIZED:  04 24 02 02
        ** UNRECOGNIZED:  05 24 06 00 00
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x84  EP 4 IN
          bmAttributes            3
            Transfer Type            Interrupt
            Synch Type               None
            Usage Type               Data
          wMaxPacketSize     0x000a  1x 10 bytes
          bInterval               9
          bMaxBurst               0
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x83  EP 3 IN
          bmAttributes            2
            Transfer Type            Bulk
            Synch Type               None
            Usage Type               Data
          wMaxPacketSize     0x0400  1x 1024 bytes
          bInterval               0
          bMaxBurst               0
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x03  EP 3 OUT
          bmAttributes            2
            Transfer Type            Bulk
            Synch Type               None
            Usage Type               Data
          wMaxPacketSize     0x0400  1x 1024 bytes
          bInterval               0
          bMaxBurst               0
      Interface Descriptor:
        bLength                 9
        bDescriptorType         4
        bInterfaceNumber        3
        bAlternateSetting       0
        bNumEndpoints           3
        bInterfaceClass       255 Vendor Specific Class
        bInterfaceSubClass      0
        bInterfaceProtocol      0
        iInterface              6 CDEV Serial
        ** UNRECOGNIZED:  05 24 00 10 01
        ** UNRECOGNIZED:  05 24 01 00 00
        ** UNRECOGNIZED:  04 24 02 02
        ** UNRECOGNIZED:  05 24 06 00 00
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x86  EP 6 IN
          bmAttributes            3
            Transfer Type            Interrupt
            Synch Type               None
            Usage Type               Data
          wMaxPacketSize     0x000a  1x 10 bytes
          bInterval               9
          bMaxBurst               0
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x85  EP 5 IN
          bmAttributes            2
            Transfer Type            Bulk
            Synch Type               None
            Usage Type               Data
          wMaxPacketSize     0x0400  1x 1024 bytes
          bInterval               0
          bMaxBurst               0
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x04  EP 4 OUT
          bmAttributes            2
            Transfer Type            Bulk
            Synch Type               None
            Usage Type               Data
          wMaxPacketSize     0x0400  1x 1024 bytes
          bInterval               0
          bMaxBurst               0
      Interface Descriptor:
        bLength                 9
        bDescriptorType         4
        bInterfaceNumber        4
        bAlternateSetting       0
        bNumEndpoints           3
        bInterfaceClass       255 Vendor Specific Class
        bInterfaceSubClass    255 Vendor Specific Subclass
        bInterfaceProtocol    255 Vendor Specific Protocol
        iInterface              7 RmNet
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x88  EP 8 IN
          bmAttributes            3
            Transfer Type            Interrupt
            Synch Type               None
            Usage Type               Data
          wMaxPacketSize     0x0008  1x 8 bytes
          bInterval               9
          bMaxBurst               0
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x87  EP 7 IN
          bmAttributes            2
            Transfer Type            Bulk
            Synch Type               None
            Usage Type               Data
          wMaxPacketSize     0x0400  1x 1024 bytes
          bInterval               0
          bMaxBurst               6
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x05  EP 5 OUT
          bmAttributes            2
            Transfer Type            Bulk
            Synch Type               None
            Usage Type               Data
          wMaxPacketSize     0x0400  1x 1024 bytes
          bInterval               0
          bMaxBurst               2
  Binary Object Store Descriptor:
    bLength                 5
    bDescriptorType        15
    wTotalLength       0x0023
    bNumDeviceCaps          2
    SuperSpeed USB Device Capability:
      bLength                10
      bDescriptorType        16
      bDevCapabilityType      3
      bmAttributes         0x00
      wSpeedsSupported   0x000f
        Device can operate at Low Speed (1Mbps)
        Device can operate at Full Speed (12Mbps)
        Device can operate at High Speed (480Mbps)
        Device can operate at SuperSpeed (5Gbps)
      bFunctionalitySupport   1
        Lowest fully-functional device speed is Full Speed (12Mbps)
      bU1DevExitLat           0 micro seconds
      bU2DevExitLat           0 micro seconds
    SuperSpeedPlus USB Device Capability:
      bLength                20
      bDescriptorType        16
      bDevCapabilityType     10
      bmAttributes         0x00000001
        Sublink Speed Attribute count 1
        Sublink Speed ID count 0
      wFunctionalitySupport   0x1100
      bmSublinkSpeedAttr[0]   0x000a4030
        Speed Attribute ID: 0 10Gb/s Symmetric RX SuperSpeedPlus
      bmSublinkSpeedAttr[1]   0x000a40b0
        Speed Attribute ID: 0 10Gb/s Symmetric TX SuperSpeedPlus
  Device Status:     0x0000
    (Bus Powered)

Tested with an early sample of the module on a Quectel 5G EVB connected
over USB 3 to a Raspberry Pi 5.

Assisted-by: LLM
Signed-off-by: Sebastian Sjoholm <sebastian.sjoholm@gmail.com>
---
 drivers/usb/serial/option.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index e4ad14375..7a712b018 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -260,6 +260,7 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_EM060K_12a		0x012a
 #define QUECTEL_PRODUCT_EM060K_12b		0x012b
 #define QUECTEL_PRODUCT_EM060K_12c		0x012c
+#define QUECTEL_PRODUCT_RG660QB			0x013d
 #define QUECTEL_PRODUCT_EG91			0x0191
 #define QUECTEL_PRODUCT_EG95			0x0195
 #define QUECTEL_PRODUCT_BG96			0x0296
@@ -1274,6 +1275,8 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500K, 0xff, 0x00, 0x00) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG650V, 0xff, 0xff, 0x30) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG650V, 0xff, 0, 0) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG660QB, 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG660QB, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG255C, 0xff, 0xff, 0x30) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG255C, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RG255C, 0xff, 0xff, 0x40) },
-- 
2.43.0

