Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48573C0A0E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788716823; cv=pass; b=ZQ1oeXftOxg+qPesq+iu++SDgO6DzFwe2Nm+Ii86yGO4Xoosgu3FCRqex75/x1ZCnsh1mc6gRs1C8r28WSf7jTl3d+E1pI3W54CT4UKy+85xtF51cO0iVUhV0MDwbfw9Thdz4NQlxR7d892xN2RYob7t1WgfCTwUHN4z1Dh9pBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788716823; c=relaxed/simple;
	bh=RT1vKor16SWprNgN2I46rvkJPkB6+81CRIOtFBRT1sI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=HzjABe6g5jKYd3jl9QQBQeVQdMY/JzNl688VQmShuM0/QpocoTV2E0YC3XdzT4ZgHp2KT62uJYE6b+/1zN70OIdRBzawgXJ13+2Oqgmlsb+zPC7JFoU9URV/yWccNiKRJzIx4blyYWei902fuhWy+kGjGM3dE9Tag9bq20rH7qU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkkAiqjn; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkkAiqjn"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso3917662a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:47:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788716820; cv=none;
        d=google.com; s=arc-20260327;
        b=mkPVNvzHozv9S/GFZod8SXP5uRWIsNNJxYqZJNDXz5ysSPXY4VG9VFY9hb7gAh7ccf
         qIqFA/E0JtO3VYBAeRZlMGGLVz5C/L5oONLQjCK+6tgsyysVEFh85WO4wxN8wIQBzQCw
         pMnwx1TPEXgck7RCprtQJTw9wfZBcvOVr6Uk7KUf12hqVlWTIkamdXWp7LWimeXNlURR
         IR2BuIGlAIhzZsU4BPGywcFzNILkG++e98yvxbN6K0KhxmHE3PgqLsoGHhzliasOtTMz
         hXdgniArHKXqzn7tz561h43rzvSmxMbc/O+UvUv0hidClEQ5kH5Yh7hXTeO+2LnSiEpf
         pz7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=sOTHRTeo1uuAeRV8y8wQh1qPhCpdcDYGMX/pO45ku1s=;
        fh=TInJWGEkSvj4K3eW/HjRUSKKQrKvzgGkt4fgItV4vVY=;
        b=IS9KojtNBhh7cz0aeSYaXPDaRhFa/cDU+5rMSVAfivWrmiX7XrHh9GYRGxF7C2uc9i
         tM8lBsq63VPARkRibZYUheKmXP67foVDZTorb7sf7vs2nqCNwFOLhMZKpK2+esmEtsAU
         Uld4c0me/DRD1G5pb4BHb2H6SxyH55EW/cxtt66VYf+4XS4ElW5axX24OiYNFSFXJESn
         krPMkLOZudz1XUfhkdOv38EcoLIzlwYXJTNQX2bULLgFDaz4iMQD1DeqJCRw7SHdlyed
         G2+oMX9y5o3NwlJp3E/p5DfXR7kAEgfR5a4bqnRgzqs2z4dypsW/nWHh1pRq/CAThJ19
         dUGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788716820; x=1789321620; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sOTHRTeo1uuAeRV8y8wQh1qPhCpdcDYGMX/pO45ku1s=;
        b=AkkAiqjnJDBr3k1IVibJ5mpMDYDXKPLC1KZuLD7ewrS/elhfK9Fy/iVVfNf2oiNQV1
         n+rNuuU6YWQPJkJIAG7JmsgTz1suW3Z0Dl0lo73XgC2V8koGkgf6T7QivYGiAp+am+dZ
         W5o09bdRzFAvndkDZCkLBDFrSqIIfEVFO65zhXu0Jdah1N/Pu1Oa9pFdMEmNFSiAQFKp
         gQQDfIQPQgEqQpXYdVZbNmWwnxLGtmQvAe55qLj3MiJRpU1e5AZJ7+64kTaLXBz69sFB
         LvguadoyQYj9r8N09KJskrXsd0VIe3Z0SYQooXyehpvUtkCwnOlckvY2zjajzznKnbmD
         zjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788716820; x=1789321620;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOTHRTeo1uuAeRV8y8wQh1qPhCpdcDYGMX/pO45ku1s=;
        b=ngpNWP09L9fB0a6KjftGelNZejmYLOTZGGLfOggWfnCUOoa1KkuIusEQXfkXBa0R/R
         Xn7N4gCPjsWLsoUGmK0/JCvi20+Z3HJBJxsTD7pSQBDwX52Tnvr+XOsdTVteFWFd2paY
         mpubsPULmubIJVJfpYQdaW5aj87XuA1vwWITFdd/u3qJPPPMlDc+GKc3/3jduVZo8XiD
         O6nnKvDB5BxpQ/w12CCGSIwxmCK8G+SzC50PSfvLLM6QmuS/UcWMCRG6DYLXky3LN9Ix
         hbtQxqzTtnjnFAaHy1MDDkK4NBCtTmErg1EBUNpsw0BRiurOJU0kl2oBmRhKLSOxNE0x
         B9gQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnlgxEh7gtwIzEZlxEVhI7FFbXND3VN6lcJ+xfL2VPKkk8ABK7m0zQ285nN1MrOiSBsbqQycWBgL/0cRg=@vger.kernel.org
X-Gm-Message-State: AFuF++mD5KbH/YwphdFi1/4/01VRR8lNm1/wZ65GZlCe9/A69Y7IkaOM
	2KIgYzCyptivEpmgJ5HProdYB3djELoD5IXncZU6eL3Q766R8W0eUNjS12FV9+Z+U/1cPlD42Hi
	1+zlGs4ZJhsDTN2OFBc9dj3zjLUmFiq8=
X-Gm-Gg: AYBFou2+eFQjY1uDbPx+kx+jj71bAMOu99Xx7i7LaK57xrgLJAUss7nXBykz9fM1Ay4
	578SvPF8ySLMhzau8b11dxrhc2cA5Ukc812EtlFcQM7roPEDoqU6BfW6kvx5s1Hh2WueH63p720
	W6s/c9IKP4gSqVff1ARCsIkD/FSGtKXO4eflkbTrTVEKZmEirp+U26uFOwQeJhcIoHwJzfv0KG8
	xTY98orVCMjFpCQcubL+GLwLc9nE81+edwsoAZFde7vFFz4fUok9s5pZ3iE5+4dk1ucbeGMa5vb
	9FgyHQMmjEKDv1uqmdVFuUDNTz2MuIp7dMqWdmmVpp/D894qWmLNXrlnLnxyK8rE0P6eguNoKO2
	TOPXZSppjRsmxTUh0Y6llOQ==
X-Received: by 2002:a05:6402:2709:b0:6a1:b515:d2b9 with SMTP id
 4fb4d7f45d1cf-6a7e8e95b74mr869492a12.14.1788716819865; Sun, 06 Sep 2026
 10:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Sun, 6 Sep 2026 20:46:53 +0300
X-Gm-Features: AcwNN1VWBWqQMURRhY4OdGyiXXIbhwwC9IMfYsou_S9_mMyXq0_U8RCPF8GcX6A
Message-ID: <CAMnMt5YqQBn08_f1diNrb5z7=Qh-a=8Ju+QvNc6bQcCf62m2yQ@mail.gmail.com>
Subject: [PATCH] wifi: mt7601u: add vnd_reset parameter to fix probe failure
 on Tenda U2
To: kuba@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On certain MT7601U adapters, such as Tenda U2 and
other newer hardware revisions, driver initialization consistently fails
during probe with vendor request timeouts (-110 / -ETIMEDOUT):
  mt7601u 3-14:1.0: ASIC revision: 76010001 MAC revision: 76010500
  mt7601u 3-14:1.0: Firmware Version: 0.1.00 Build: 7640 Build time:
201302052146____
  mt7601u 3-14:1.0: Vendor request req:07 off:09a8 failed:-110
  mt7601u 3-14:1.0: Vendor request req:02 off:09a8 failed:-110
  mt7601u 3-14:1.0: Vendor request req:07 off:0734 failed:-110
  mt7601u 3-14:1.0: Vendor request req:42 off:0230 failed:-110
  mt7601u 3-14:1.0: probe with driver mt7601u failed with error -110

The failure occurs because mt7601u_load_firmware() unconditionally calls
mt7601u_vendor_reset() (MT_VEND_DEV_MODE_RESET) before uploading firmware
chunks. On these devices, issuing this vendor reset leaves the internal
MCU / FCE DMA engine in an unresponsive state after the first firmware
URB is submitted. As a result, reading MT_TX_CPU_FROM_FCE_CPU_DESC_IDX
(0x09a8) immediately times out.
Introduce a boolean module parameter 'vnd_reset' (default: false) to
make this vendor reset optional. When the vendor reset is skipped,
firmware upload succeeds and the wireless interface initializes normally.

Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1716301

More issues with Tenda U2 and Linux:
- https://www.opena.tv/viewtopic.php?t=63919
- https://askubuntu.com/questions/1418850/the-problem-with-wi-fi-u2
- https://bbs.archlinux.org/viewtopic.php?id=224859
- https://www.reddit.com/r/archlinux/comments/1d6dfv5/mt7601u_usb_wifi_not_working/

Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru>
---
 drivers/net/wireless/mediatek/mt7601u/mcu.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/mcu.c
b/drivers/net/wireless/mediatek/mt7601u/mcu.c
index bad6ca821..abf4767f1 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mcu.c
+++ b/drivers/net/wireless/mediatek/mt7601u/mcu.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/usb.h>
 #include <linux/skbuff.h>
+#include <linux/moduleparam.h>

 #include "mt7601u.h"
 #include "dma.h"
@@ -21,6 +22,14 @@
 #define MCU_FW_URB_SIZE (MCU_FW_URB_MAX_PAYLOAD + 12)
 #define MCU_RESP_URB_SIZE 1024

+static bool vnd_reset;
+module_param(vnd_reset, bool, 0644);
+MODULE_PARM_DESC(vnd_reset, "Perform vendor reset during firmware
upload (default: false)");
+
+static bool disable_usb_sg;
+module_param(disable_usb_sg, bool, 0644);
+MODULE_PARM_DESC(disable_usb_sg, "Unused compatibility parameter");
+
 static inline int firmware_running(struct mt7601u_dev *dev)
 {
  return mt7601u_rr(dev, MT_MCU_COM_REG0) == 1;
@@ -459,8 +468,10 @@ static int mt7601u_load_firmware(struct mt7601u_dev *dev)
  mt7601u_wr(dev, 0x94c, 0);
  mt7601u_wr(dev, MT_FCE_PSE_CTRL, 0);

- mt7601u_vendor_reset(dev);
- msleep(5);
+ if (vnd_reset) {
+ mt7601u_vendor_reset(dev);
+ msleep(5);
+ }

  mt7601u_wr(dev, 0xa44, 0);
  mt7601u_wr(dev, 0x230, 0x84210);
-- 
2.55.0
