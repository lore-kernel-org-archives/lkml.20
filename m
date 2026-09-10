Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0943379966
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053867; cv=none; b=hMoACYTM1CMBF4sC7+9l4np6F5YobCY7kE90Gk0bvp62XD227KyknxlDHyOXiq3SEi2Mk4ypItsGN8SbfYy3eLr1/Qw7V/ajgQ//z4aD+FwkVAMNqEgEwnIOFI4sf2NIXx6EVuVAZJJGVhZJxjPTVrs9nln8/G+2B+joao3Y+BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053867; c=relaxed/simple;
	bh=d7Q5M1vI7/120q4pHA5b5xHQjtrAs56xYi6z/xR6of0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jWa0gEc6pj1nWAzFsjrLfpWYQ8K1Lz5TNzN42XVA66ujS7sFcooFTZHEGhXS6zxpMffgVzt8DwMlfnt7SzeLzx0E/pSPTfr3Cxr04zc1M+UamqPaEgdnbaGJ+sdCxodjs90DZG4aNk7BCZmNzD3CX8QOiUJg+SF/1oR39Wlp5SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4NW+Iq/; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4NW+Iq/"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d9520b9155so60636605ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789053865; x=1789658665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qSoq+0T0RQWwUv3FBS9ojV1fof/Vt3X7sSwGsvkfUEI=;
        b=T4NW+Iq/vixBGsmM1hS6Hrgvvxg0rZFI6VDfgZYs3Z1F2ipUcng77CRuUu0hnqllwL
         Z52SmyEFWGGNkuP+dCn0Gl7c98fF0aU8NZhFgyubVKJFwYW16GLKSJih/U3OuEiePPUO
         rdb6+LA+HZfdLd7mfGah/MS9lNqKnUbF+XVZ1yZ3YAylPCOIYpVaADaNry/gBCssBQmc
         YmUFYOUO9dim+KoSKlN57rzWLuQSH9mqWCCRO0i8dh69naiihMNpQvonxK36jgCmudww
         67OW+VCbqjQs0qFy93lG9gniiSul7M7SP8RzaTrSk+VriTXtDVVywVF4q8qWJaihKRoQ
         jFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053865; x=1789658665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qSoq+0T0RQWwUv3FBS9ojV1fof/Vt3X7sSwGsvkfUEI=;
        b=kEfODCHZiQr4ghDxFYm+JIg4hdSf6E1xNxTvOdijt7b6N4w/PxCor5CFvUVLZQMQUw
         5imoVUqj4zBc+68DcyEnjn1qL+PW41Tz367HoN+HQgsJJCKo8crjFJhtKNludBx4XlPe
         W9n83G08nfAO8nU7jP5uPe0MmW0d6bkDTU377eLAH0JzhApdVCXHpIYAo1odQoXfuqeG
         MUAix33zlz3E3TPSLnu5JReKA64qYv5Hi6QWkDXSbMiDrFZIC3S3y77rsEJ5T3fpBH5D
         CjzCe1XB0fx1pat/DW6NpDj4m0/QYOFZLxIZUFWUgx8Yq5xAmQs7xEVGUfl64hWaJf9w
         G94A==
X-Forwarded-Encrypted: i=1; AKwUvBz67QZ2WJaCD/KPQRcZ8iexE18Cv372/rjXodRKV7DjrJl77hHG0CDuiUwEYvsssCVCDzYslkqEC9fPRUo=@vger.kernel.org
X-Gm-Message-State: AFuF++nLlBIyE4pMv5qJhPR+WKKsg/IEhUW9xENZs3AXpoifiiaRSQel
	+k0LvQVMCO3oifFq+Hy78RFU6niVus3JbHUB127MYeDdQa+UejhmhXU5PUbRCfdMC+Q1Xg==
X-Gm-Gg: AYBFou1vI1G6xvZ0Oax1tng2mQsRpqJrn5jfzrwSgcVoIgHte2myWUh+n0dbdAbWiGV
	+qTLwDbY00PmZispD0LBiapuB5iHDJpMfmB9LFP04TsbMcQFDB77okF6PgcgMUt22Zwze7JidWr
	BRhbkwYdQ4cxl45xKrH5UT2BRIhClyyGXUJVWHtlCSCViAzJeDdygaJQlptQWbo3HUGpK87YtMe
	OTkdle2cJEFTgTHUVJd84KH4DR0+/2YTrytildfF4UPU7hI7ajBSMdfQ+94RgxiZUED+T+U3dPQ
	d6bgAVR0roM9r7674I1+1RLVHh5KB9jw32sjMqUDPVcWzqYNWRnL9eIV1UTzz7OJRei56CA6JbT
	+0CSZTul7eEu8W835j0nJQFWnEkZGVKxqS926ZoMyHj6lFgQW4VbH57lqKLLF9Mmcy4eZd6MGTw
	4lsb5M1XjexFFVJAB054NYJBuDpOSxSQo4fW/69ek4WJ7+q0I6kTt4kB5ROTpEgoe7v9ZA2Sh+k
	AbRZ13TSivftl9il9oyW7bmroXBZXXf
X-Received: by 2002:a17:903:3803:b0:2d7:7cb:a44a with SMTP id d9443c01a7336-2db127bf3damr666893425ad.11.1789053864925;
        Thu, 10 Sep 2026 08:24:24 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db148404b8sm91545235ad.2.2026.09.10.08.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:24:24 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>
Cc: linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?St=C3=A9phane=20Grosjean?= <s.grosjean@peak-system.fr>,
	Wolfgang Grandegger <wg@grandegger.com>,
	co+4bda3bf8e1a2b780@bugs.sh,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH net] can: peak_usb: validate PCAN-USB Pro receive lengths
Date: Thu, 10 Sep 2026 23:24:07 +0800
Message-ID: <20260910152406.3865455-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCAN-USB Pro decoder validates each receive record using the size
implied by its type, but copies CAN data using a separate device-supplied
DLC.  A zero-data record at the end of the 1024-byte RX buffer can
therefore make memcpy() read up to 15 bytes beyond the kmalloc-1k object
and write seven bytes beyond can_frame::data.

Convert the classic-CAN DLC before use and reject non-RTR records whose
converted length exceeds the payload present in that record type.  Keep
RTR records exempt from the payload check because they legitimately carry
a DLC without data.

KASAN reports:

  memcpy: detected field-spanning write (size 15) of single field "can_frame->data" at drivers/net/can/usb/peak_usb/pcan_usb_pro.c:562 (size 8)
  BUG: KASAN: slab-out-of-bounds in pcan_usb_pro_decode_buf
  Read of size 15 at addr ffff888021468800 by task swapper/0/0
  Call Trace:
   <IRQ>
   kasan_report mm/kasan/report.c:595
   kasan_check_range mm/kasan/generic.c:200
   __asan_memcpy mm/kasan/shadow.c:105
   pcan_usb_pro_decode_buf drivers/net/can/usb/peak_usb/pcan_usb_pro.c:562
   peak_usb_read_bulk_callback drivers/net/can/usb/peak_usb/pcan_usb_core.c:267
   __usb_hcd_giveback_urb drivers/usb/core/hcd.c:1657

  The buggy address is located 0 bytes to the right of
   allocated 1024-byte region [ffff888021468400, ffff888021468800)

Fixes: d8a199355f8f ("can: usb: PEAK-System Technik PCAN-USB Pro specific part")
Reported-by: co+4bda3bf8e1a2b780@bugs.sh
Closes: https://lore.kernel.org/all/XNNBJQCVSRi1dUNtFoqHoHlP3XDSNifVcPOu%40bugs.sh/
Assisted-by: Claude:gpt-5
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 drivers/net/can/usb/peak_usb/pcan_usb_pro.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/usb/peak_usb/pcan_usb_pro.c b/drivers/net/can/usb/peak_usb/pcan_usb_pro.c
index b6be8c19e537f..84ebe2904f6ef 100644
--- a/drivers/net/can/usb/peak_usb/pcan_usb_pro.c
+++ b/drivers/net/can/usb/peak_usb/pcan_usb_pro.c
@@ -531,7 +531,8 @@ struct pcan_usb_pro_interface *pcan_usb_pro_dev_if(struct peak_usb_device *dev)
 }
 
 static int pcan_usb_pro_handle_canmsg(struct pcan_usb_pro_interface *usb_if,
-				      struct pcan_usb_pro_rxmsg *rx)
+				      struct pcan_usb_pro_rxmsg *rx,
+				      u16 sizeof_rec)
 {
 	const unsigned int ctrl_idx = (rx->len >> 4) & 0x0f;
 	struct peak_usb_device *dev;
@@ -551,7 +552,14 @@ static int pcan_usb_pro_handle_canmsg(struct pcan_usb_pro_interface *usb_if,
 		return -ENOMEM;
 
 	can_frame->can_id = le32_to_cpu(rx->id);
-	can_frame->len = rx->len & 0x0f;
+	can_frame_set_cc_len(can_frame, rx->len & 0x0f, dev->can.ctrlmode);
+
+	if (!(rx->flags & PCAN_USBPRO_RTR) &&
+	    sizeof_rec - offsetof(struct pcan_usb_pro_rxmsg, data) <
+	    can_frame->len) {
+		kfree_skb(skb);
+		return -EBADMSG;
+	}
 
 	if (rx->flags & PCAN_USBPRO_EXT)
 		can_frame->can_id |= CAN_EFF_FLAG;
@@ -750,7 +758,8 @@ static int pcan_usb_pro_decode_buf(struct peak_usb_device *dev, struct urb *urb)
 		case PCAN_USBPRO_RXMSG4:
 		case PCAN_USBPRO_RXMSG0:
 		case PCAN_USBPRO_RXRTR:
-			err = pcan_usb_pro_handle_canmsg(usb_if, &pr->rx_msg);
+			err = pcan_usb_pro_handle_canmsg(usb_if, &pr->rx_msg,
+							 sizeof_rec);
 			if (err < 0)
 				goto fail;
 			break;
-- 
2.55.0

