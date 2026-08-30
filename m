Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5479B2459CF
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788082044; cv=none; b=FWmi5bYc9qei88QmOf3kdry5xLXpCz5eKXPVZLdsw6IhIboJ69hufYcmMqy7twCGAPNh5qlj9TkBcxDI3Yck43W2ppIzrkS4U1xGFjh830FGqlJSz0hx/SqMtrq9mps8elSZEuOHu05UUaeNomairdT3U+3vVJVc77BQFFFQ5Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788082044; c=relaxed/simple;
	bh=hatNoNGA+YXnGlMiiRKGzTz5dNJ8bwEIiS0xjj5GM4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lgnvmSeLix4VK4bwDVbfjEPmjwTzuBITqXx7RsbwdkYhGHGSBicRbcyE6c24DR+ZQ9IV9gKuvwhhXiFkrSZ97onSqzGcuqQ0BUBdiirvzIf2e/FbEumh0xDt3Tfi3gEKee4LBOgzx0DewoHyzCURWEmWelj0068gufM9GCvinTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHDDJO7T; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHDDJO7T"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so1881404a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 02:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788082042; x=1788686842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4mD5bCpSQ2dBdYny3erqq3V+bcIJgzXOhiWs/uhQvjc=;
        b=VHDDJO7TpbcP9nh3eF8Ip2ARgkSrcHqwLG65ExCKV87GsIvtQ028LNg88d/2DGPjfj
         nu5TzrjaS0xolRthtgv1NFQ9tHoEBPdtR/0sQWXOjfEcPM07JT2ne2fmRr6bh99+IDb6
         L4S6jccoYmJ4/rP/ers+ZmTcx8bRodmS7bgIyXvCoJSYyjuCvytFzPlbk3DPY9R05V2c
         km6TgVxWoIScpfExbnvpHLoNnEmqnbQ1vJC+FWAn/ai6qvVusRopzKK5fxtqmAdBoWbc
         VIkVovcgwZPge5kKLz/G9T2E8j+X8FOOhCkAPIJFNunafbmarpOycNtFdBR4+uL1EpOv
         7BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788082042; x=1788686842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mD5bCpSQ2dBdYny3erqq3V+bcIJgzXOhiWs/uhQvjc=;
        b=HCXdnMK1BZXnYQzGHaPDcY2qOKi44IfiE28j5MrnvTEwxDRGytBIES7PZhRMwTcCG9
         njmFYhtfZtT7GnCoTd8gPY19UTXzmL4fpU1d+jowpDFe9zXJIx/W6f0z49hfsQyouig5
         axcbPr/586zG7CpPiW+GS0qQ7gRIC5f2Bv1N05hvPtlUuuVVNRZfVQnbEIBHANRaEdYC
         iODVMnxmwvTOGyH0F9nNdNeXgNAsYT5KtChcSMWyW2dQmyBAkNJURKYAq31hiWxh5frG
         o9X6uOSYG3kBdWbWOVGCc8xsSS+NxqWE7WC6Mt/hyQAIzgHmR2kpETHzhSbibcYnV6rM
         xCxg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6UJaqJvPI3fr+d7XfCqO4mgX6Zte/taKUVJWIWGAdvaUWdfO/G9otqla6cJnR4h1bAIID71EB12zGtGw=@vger.kernel.org
X-Gm-Message-State: AFuF++kjBnvrFUBpzKLSXUe1b+PJfYsW5zkYHF/VGyLmfm8AHrNVGZ+p
	+bUbdrcaLKaYX/ZsqDdim70DrRfJseTfDjzgCtPTPSAOD/r+Js/IX0cr
X-Gm-Gg: AR+sD11VUQ4WIH3G5m1eCxI7LdJLm2uX/LVLfDacyvBAskJlW1j2H6LRuobdVe1K9My
	PVIUT1TCACSA1EUNU93fYo8Lja6H+6doX5SseI1BKa1k/AvkUHZI4n5u//M9c5RP7f4xDge7sLz
	1TU7dw7n45nmqPuC9rJYOBiSFgEXgRWLxdFRm0ZR3XeCIwrxuW1M3Gt7S4GpfJGDseIUf5w71w2
	RIxiEO2srLk84zVoDa3i0HiBh0772VPTPNK8fiw5VBm5A/1Q2JdgJB9I9+AqAWh9l6UTL2s4wjA
	A3n5yyod0tJeBBoC6NzFulEx8LY/yD6OZ1s/9c3OBFD5GRrGEsakV9p7NTA6xut1zuOyo6ql6t9
	EINkUOEJQdaHML3KN0yxfGzwqjl9f8x/WvzLOqyR4ZIuGOGVhAgj5ZnAUUY4zY5Fvb78SVmFGl2
	MlJWIzFcEnWCuAVpib+8opvcEKCmsgBzv3xMU4IVO7zljnC36rXg0MwF4hPiR6+1JlAb1sdjrQV
	UVBO703zQL5ZNpgp+qIFAJXTlR3CVTO1IRQkulg6fI22/EBqdXbfg==
X-Received: by 2002:a05:6a21:3947:b0:3cc:9288:99aa with SMTP id adf61e73a8af0-3d26329db5amr33871221637.0.1788082042513;
        Sun, 30 Aug 2026 02:27:22 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:35a3:71a0:a824:96db])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2512628a12.11.2026.08.30.02.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 02:27:21 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: enelsonmoore@gmail.com,
	sakari.ailus@linux.intel.com,
	johan@kernel.org,
	hansg@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com
Subject: [PATCH] media: gspca: don't call stopN/stop0 after device disconnect
Date: Sun, 30 Aug 2026 14:57:12 +0530
Message-ID: <20260830092712.19452-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gspca_stream_off() calls the sub-driver's stopN() and stop0()
callbacks unconditionally. These issue USB requests using
gspca_dev->dev, which becomes a dangling pointer once the USB device
has been disconnected and freed, causing a use-after-free when the
video device fd is closed after disconnect.

Add a gspca_dev->present check before calling stopN() and stop0(),
matching the existing check already used for gspca_input_create_urb()
in the same function.

Fixes: 1f5965c4dfd7 ("media: gspca: convert to vb2")
Reported-by: syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=537b5eb78cebbff5ea70
Tested-by: syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/media/usb/gspca/gspca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 594d73e50b9f..5c33cf397f3d 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -733,14 +733,14 @@ static void gspca_stream_off(struct gspca_dev *gspca_dev)
 {
 	gspca_dev->streaming = false;
 	gspca_dev->usb_err = 0;
-	if (gspca_dev->sd_desc->stopN)
+	if (gspca_dev->present && gspca_dev->sd_desc->stopN)
 		gspca_dev->sd_desc->stopN(gspca_dev);
 	destroy_urbs(gspca_dev);
 	gspca_input_destroy_urb(gspca_dev);
 	gspca_set_alt0(gspca_dev);
 	if (gspca_dev->present)
 		gspca_input_create_urb(gspca_dev);
-	if (gspca_dev->sd_desc->stop0)
+	if (gspca_dev->present && gspca_dev->sd_desc->stop0)
 		gspca_dev->sd_desc->stop0(gspca_dev);
 	gspca_dbg(gspca_dev, D_STREAM, "stream off OK\n");
 }
-- 
2.43.0

