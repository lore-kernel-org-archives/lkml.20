Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2882C237C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788638280; cv=none; b=bEl2fMg1f8fSf7mdtpopIcgiNB1BTKlnUVAZF/Thc96RSGnHA2ntkHs1hg5femX47zA0Js1rpNYGFYi6JZbQYznsZrbZNnoyiejzxYI+FeVnV77L1V0+CXw8r9OJiKnrXeW4A0YsLUiSRXsfQ0XDs4a097G6GJqRB7FFkuWdSUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788638280; c=relaxed/simple;
	bh=R5/B5vGlSNPc0+3npUkTgg42Qnkjn1wNspAqrjKe4II=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RtPDKhsbWgP7KbUwk7Nlzmpg/MiJCDzJyjlb0u/U56kHrMUzX3x+ngWwSSMM5hVA68I7nFtENqZJr+mo4GgqQ8nPzXLv8FtaK9J4TgMdv6k0RP5DH3/S/p03FGyrpGRtcEbp3G6kzdHqECCAODgbGimgytDowaaHTER8IiYj180=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMnWaWEC; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMnWaWEC"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a1f75277f3so16468691fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788638276; x=1789243076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ss06BnBaR9nq6gnp+WtomXwyK13rwnEDu5T/dImWHuQ=;
        b=KMnWaWEC3dsqwV+EQYRFiQ+y4JQJ2pDh6Wt1oNd/GRZMJKqNdgpYFxzoVHf2gNgO87
         Nvi5fk8fNwMbmdq7WRRndd0jFC2NB6zm0lop/hoJGPRpaHQEzNS+9JRhq9DHbT2mqBUC
         t9qMcKpDF9KUi6q01BEhQLZXbb8SNcjf0fYGzT0zCJ0oESaY70OyuYoecxmb3A9JjsyB
         8/NoSIMXN4OYIqzPYX/mpg2hsUxESuucdB+oZedoJ+cdzqpt0jOW/+rQlualsAe8mxQa
         amXDyiP2JohhpGS/l0ntgQeLzp06rnaoJ9e67UZ2sgjKm2Piu+IDUvbflY+FKAHo3Q/x
         cwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788638276; x=1789243076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ss06BnBaR9nq6gnp+WtomXwyK13rwnEDu5T/dImWHuQ=;
        b=nLi2OpKWddWptnUQezhSro+HfSBYzAEfGUJvCCLg2yNWu4RHDv16YOBbAx95BPP2wj
         z+rNEwH0e+QpIqAshehtnvOHb3JsJZhdawUdRTudnX9PREsSrwYj8pjBj/6asYNTi4fH
         0jT5w1LGZ3zqtpNhCXVbXKGwDfRQda8fvDWPU8/IF1oR++ph1MjMZLyNyfLqFWF+rGyH
         2zINYyN2O1FpOP5qqWNlVjjG4HDUFLjN7ac7EbqfRgw5jCH9EMWOLhTEcNRdIiE5r8WN
         BLOjpN2e+doYN+iWzBH5zCMnN9rlYxq1eUHSRKO1XKCDB80d+578V/Izix/QWVZTCV0I
         3JIw==
X-Forwarded-Encrypted: i=1; AKwUvBxlXqT1f3Iqwzr9t6ok8Np4r8rZJLbfWsV3GRMkRyK9iiYkLLdBZ8iHQh4XCj3oGqp86oVA79cWb7tBeu8=@vger.kernel.org
X-Gm-Message-State: AFuF++n/jlFEPjwspQ58viQqan2eeY10e0FW/fYk6jNiX+zXHfcjtwfb
	lu6IL558aIm/z5im/Ol8vKpF3c0k+H4QUco8x345DFUO2q1WQtMDYXxm
X-Gm-Gg: AYBFou3DWMolLAnc2w/bFT35zK3EBxpi1LWA5Eeq0cUe9uArWSL79rZnuazSvQbLRjb
	dtGuprbINyHcDlEHQV4bAdcV8sOqwowE3X1Xz6V6CJ6gu0I3qiUHJM/iH8LivJpmpp4FySg+HPi
	6SVTX3cxsweEl/ln1sAjaaOc3PyOCZ57tx95uQK4xPhb9+fgwpXqBPuvLbT+u4kfN7QuhU6Q0ND
	tLVtT4S7Ars3Y0b35bn+xiAwQMxiZPiV5vNXeoUMiEmWJVGgCLGgUQjlEQeLWi83zVsOb+UZXs1
	khuxIYbKK9e8fRK/38koEV4uIsexSi/xIS4YzVAiYKsdrkdkZSE0gysUTqYO7vCEDq6V+JUApeM
	PfQE3E8lR+8wNluh4m7l4cv199wEoz5/pk1/jP+IrFKlCTFueBNjem+DKcTJLsoBlUD7vmNI5WE
	Ni2Qs3nRtMMcC50y0nCnZrrPgtvDvU+Sorc9Cu6fJKBoxqkVIAJ9edxd1AmofBd9g+CnJYxHyJL
	S6xNBI01NLkhGNQUQ==
X-Received: by 2002:a05:651c:a322:b0:3a3:7680:67fe with SMTP id 38308e7fff4ca-3a3768069a9mr10429151fa.29.1788638275969;
        Sat, 05 Sep 2026 12:57:55 -0700 (PDT)
Received: from White (84-253-240-120.bb.dnainternet.fi. [84.253.240.120])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a37059973bsm14985831fa.26.2026.09.05.12.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:57:55 -0700 (PDT)
From: Samuel Alhovuori <samuel.alhovuori@gmail.com>
X-Google-Original-From: Samuel Alhovuori <samuel.alhovuori@pm.me>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: pmenzel@molgen.mpg.de,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuel Alhovuori <samuel.alhovuori@pm.me>
Subject: [PATCH v2] Bluetooth: btusb: Add device ID for MediaTek MT7925 (13d3:3631)
Date: Sat,  5 Sep 2026 22:57:46 +0300
Message-ID: <20260905195746.244134-1-samuel.alhovuori@pm.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the USB ID 13d3:3631 for the MediaTek MT7925 Bluetooth module
found on AzureWave / Mercusys MA37BE PCIe Wi-Fi 7 cards.

T:  Bus=01 Lev=02 Prnt=04 Port=03 Cnt=03 Dev#=  7 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=13d3 ProdID=3631 Rev= 1.00
S:  Manufacturer=MediaTek Inc.
S:  Product=Wireless_Device

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Signed-off-by: Samuel Alhovuori <samuel.alhovuori@pm.me>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 03039ceaa..11c62ef1f 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -816,6 +816,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3630), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3631), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x2c7c, 0x7009), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 
-- 
2.55.0

