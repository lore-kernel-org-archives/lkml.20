Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DFB3E00A1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790796311; cv=none; b=ftguFfqf30fZCxXIEfzHBwhCacn823dKEgAoHkekAPSSnFa+YTGLuU9TbRg5aoU9X5foCJ0xgNh4R3oLpAbL78o+S3rw8/4hvdPsODiaNyfJeYNT/2NWoxgy4lfFQiHd68gNVw/6+mDrpi+N5xGr8v3uxAdNp0o+FCKubPLjF9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790796311; c=relaxed/simple;
	bh=/62/h+VfGfJ6ql1gTQUsuCTcblvFkQeJFZbHPoAmfec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L/IeauLG9gpGYvRXXVbTW7vRJUB5shrar+5TOWuy3zOwfKHtc+LX7QhLsSvUEUOKjZi3FBAjfxdOFI9keY+V1ogT1JrPG4sKXsBoTmVCFaGJDGccmtUuuWnmpjfMthfeWthIuSaRXZFFy2EPBiqkXuNu1pMunY9PvBi8M+Hnl44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLHjM0HY; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLHjM0HY"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3add810eso1342587e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790796308; x=1791401108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOgxlbQSUpYQmPk8nc4VVjPwerr0EBnWUZVJ6uSKUgw=;
        b=JLHjM0HY8Z4BFSSJhf9hgUOW1FtTEsQcycXqranwlD6EiORLEUt1nXMDrUg7mH8LS6
         g02MDojlR+H8OeSqLJQ5XOtZyirrS85vN/OHftYpcTHS27dn2Hnva5V85jPUX3K3Enyj
         lrr80jN4vC+IITZ8GUpMvE6oRyvAZHx458BrUdqcR9lXgj8lOyniVsBrJ3xxSUSZ6V40
         Rp6ZhbyO9CY8YnsgvqxnHyU78E2Pr+kXbyHt84s4wC2TPdqRdfKyaeBfaKApk6pclYbp
         9m0x9Wr248amZz7b89kKHKGV7UVDYqpSKn8+bvh2zkNcRKTaL4Nq04OqLEf5AzTgm0Dw
         xm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790796308; x=1791401108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOgxlbQSUpYQmPk8nc4VVjPwerr0EBnWUZVJ6uSKUgw=;
        b=hsYIy5BQnhGOBuof+7N+pmsGmwHMs0/mR36wju3IYawbVa8Xz8VdcEcUVYJ4Nr0B6T
         ULTreoLRrXHkGhjewtf400rB8EgqHwi7/xbTDACgFq9GcSMPo2/+MaXk40ayqbRP1Z+4
         GIQqp/1jQrmnwy/jXitO9K77F8B6BZJ2IiwVa1g/VakVtbIIxMbAtaZe3SpDECMIMMgf
         J5TMR1Bd0cNzteBcDGICiK29wrD0waiCT0ikMfDteYMeENt60xw31k1aTbgkuW6uAJmc
         BFDdH+hH8hOfaDTdW/q1Qvsq3Qt6Mjo50sqW1Bmj35TPv9V/76GV6wZT0G8Ynn2L5JOy
         34oQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEYt5DLgcsdu7yndy+7BsMU/Q2R9OuPX9wddnlR0ahg9BmpRzd9p5ArGZYmyWBWYMDDjQzd4D9xvwDy40=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkhlNLQSP+O7vXyJBF4tctBPGFpUK7Jr0pkSs5Fsi4shvTLKjP
	+g8PbS/RnmIklGGxauODgK5CT1b2bHr2rFR1sA4oBFA93cKP4Q+5K7cWx2I9quOI3zGrEw==
X-Gm-Gg: AYBFou1yzQlVKNq4mx+iPR+IsFKVC+s6jL4pXUKux2Iu36he81UEkgTWWMDY2xfwILo
	76Eb4vUAKpSFp96BbD42f1BAmxI0evfhUZQhRQdFVOIr4NyZ1FPGkcgDp4WeQfBwtzhQ2TFIRUc
	uFkBvwJHHHHvndxIXNWA4JHbf0/ne7V4BAba/U29toFPUVWZ0nBvsE+h3EwIjtQXSzWtS10Hg1Y
	sT8k0Qvpik3le+BN+zFGpgVPKl+PgFAYanSEAaaawt1rCEVku9TvkP/fTefZQ8pNRwNVZyy5p/I
	bXlctHxHRhaeY3jLESmbFVvgSSOOleKDlGkwfQCbvUOk0eit+ohV9dUroOmN1l4W/yn5L6j/4jr
	bk6v5BCdiUNGjf80Esq1mCIOkp3soJuIN/vmOvlIUY7n3MQEGnEkz8HUlTMm8UfqnjDZEcK4UUn
	Si+Vkxm2aB/PWJKtoz0gVbuF6QcSsX3++Ft5Hu2kXs2OBD2DxuC3raa5irNo2nSCCgDchwClhI8
	XesNwuJ+SB48HU=
X-Received: by 2002:a05:6512:3c89:b0:5b8:ead0:c03 with SMTP id 2adb3069b0e04-5ba43126d33mr243820e87.26.1790796307336;
        Wed, 30 Sep 2026 12:25:07 -0700 (PDT)
Received: from localhost.localdomain ([95.31.11.153])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a77192c19csm10217341fa.29.2026.09.30.12.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 12:25:06 -0700 (PDT)
From: Konstantin Nazarov <qwertyuiopyyy@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konstantin Nazarov <qwertyuiopyyy@gmail.com>
Subject: [PATCH v2] Bluetooth: btusb: add ASUS 0b05:1825 to QCA Rome quirks
Date: Wed, 30 Sep 2026 22:22:49 +0300
Message-ID: <20260930192249.757-1-qwertyuiopyyy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Bluetooth controller with USB ID 0b05:1825 found on ASUS
systems uses a Qualcomm QCA Rome chipset, but is currently matched
only by the generic Bluetooth USB entry.

Without BTUSB_QCA_ROME, the driver does not load the QCA rampatch and
NVM firmware. BLE scanning also repeatedly reports:

    Bluetooth: hci0: unexpected event for opcode 0x2005

Mark the device as BTUSB_QCA_ROME with wideband speech support, in
line with the other QCA Rome USB IDs.

Similar issue but with different device id. After patching bluetooth is working fine,
no unexpected events in log.

Link: https://lore.kernel.org/linux-bluetooth/20260928143655.22223-1-qstrydom0@gmail.com

Tested-on: Qualcomm Atheros QCA6174 SoC integrated in motherboard
ASUS Z170I PRO GAMING, USB device id: 0b05:1825

Signed-off-by: Konstantin Nazarov <qwertyuiopyyy@gmail.com>
---
 drivers/bluetooth/btusb_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb_main.c b/drivers/bluetooth/btusb_main.c
index 3518f92eb..cc3a021a9 100644
--- a/drivers/bluetooth/btusb_main.c
+++ b/drivers/bluetooth/btusb_main.c
@@ -272,6 +272,8 @@ static const struct usb_device_id quirks_table[] = {
 	{ USB_DEVICE(0x0489, 0xe03c), .driver_info = BTUSB_ATH3012 },
 
 	/* QCA ROME chipset */
+        { USB_DEVICE(0x0b05, 0x1825), .driver_info = BTUSB_QCA_ROME |
+                                                     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0b05, 0x1868), .driver_info = BTUSB_QCA_ROME |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0cf3, 0x535b), .driver_info = BTUSB_QCA_ROME |
-- 
2.43.0

