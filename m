Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5AD382397
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788717918; cv=pass; b=MBoaV4JcpL8kdujJiZLUCd5+mLubYLI+4gg8ABgzVvXmr428svVayc08FH4ctQm73t7tghJa4wy2aK0bnWMxGYMdR8TGjGT3WiKo2F8/Hj3a8oaIbpiwVJhKdfZAM/F3I1nSQExNFLgyqPU8dCvHDlOcvqRhK+vvNpL0NWIOwMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788717918; c=relaxed/simple;
	bh=oZrbA+gqhj+N47M5MEXg42k2Lnl2gVVvx1vsYaMwzfE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=aCyMOMcyhk3Jdm13/f/+EXMjcq5cn1LiK/G6qES/XUEwXB8w06Zg9XgW+khFudFCTVfcS/VSxgfZsx8ApR00RXvpYuJYV0q0PJjqi9VzO/27GdVwbECVgKnr5ojfOFdKeDTboKYGwJHOeOo4MVl36KFdfSNcAh9s/If5kbk/ZMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PO3zhmpL; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PO3zhmpL"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a63667b78aso4358789a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 11:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788717913; cv=none;
        d=google.com; s=arc-20260327;
        b=R8Bc5yEK62TB75YgR/v2bdsjHXek19A78Kygrg9nolEDGX8LBPSaSVuozrqgYwYTA5
         lIAHN9q0xQ2j4j0Xl7OsGfN6ojBMJSbFDfV9X4OPvjadXq290Xh+yIL3rLDRGVSGGrJt
         IzGUwWxCtafgfi9wu/E+JZTHYAUrIMGrCTsjpiOzjMYkA7nv8D5AqsjBUmAa0Zhb2DFZ
         71Og+5I4sXVKOE0VVQ3W3nxKbgVXMDjCbejOSWZZJ6ICXZ8x3dX0hegtWNV3AYpAnHxF
         VzI+IYKtEhC4ycDzJ73/fxbRWCSQKi8SE1VltUsK/v5WmsV5zRX1HB7NvI1t1q8pjvLM
         BZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=pa0aNgWUrAXoDkrBmj85T0XzOgW1Y6aPgEyekCwvi4c=;
        fh=t8SVcQDXYuAyckEfDs4PF12QDQnooFRLEo/LKvB9esI=;
        b=Lo6RTUhQi43I4G78uuLldtNCBbK+cDcZQRnzGtNPIGnE4Jo0MklAqqeV511mUx5Gn6
         rI7JfAh9WILjKgrSOnTxiMKZV4PcBvEU0GM9AD24T2Vry1dYBV1oi/ex2nrjMIQVe5a/
         TrkdrYukmPT4/m359VSqcnaYmkOKWdCNwKilNgFlhLiockG0Nv/psftWG232SASbC+K9
         fSRfvGXaShI5pnYrO45GVKcZYfPslSh0s52zOwfDeIF6x6NmoY78sQiatJ14FWahKrvR
         XrSzYaFv+u9GEfHfNgZO294aOabQrvy2msPQqCfbFZVmvvjTMOUq2Gq6a28B+RKQToP+
         7v9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788717913; x=1789322713; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pa0aNgWUrAXoDkrBmj85T0XzOgW1Y6aPgEyekCwvi4c=;
        b=PO3zhmpLzjFBBJwPpDiDhAi7SI2nOwzfbqZ6elOJM2DlQOqyZulbg/Azlq1/O9SrRC
         8By5jUyilrngzFXTc+nIr6k9ihm+snBsFlbEO9uTEow/PPCSbqFDW/nKq+E9MdSpUpBO
         kCvjAaxs89tWPf4BkbAE19o7sCzGuuBx5TgcyqJpYC/obOhRtTNfxxSjtY9iCKVQJBMW
         DGSzzYb9bPHNTyxuIII1rG8HssjvfamU8KX0Fs+3u9qPcwk4BxMZfYPBuKS8qIiLqKKW
         074rFyRkyWHmcAFfcBat/oW+lm4zcBjj8ECWvxlbteVc5c9CH1yg4FTFikxZ1Sp4JxB/
         GCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788717913; x=1789322713;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pa0aNgWUrAXoDkrBmj85T0XzOgW1Y6aPgEyekCwvi4c=;
        b=kw4eVXy6KliICLvylytG/RRITbjDw+Ugtgh07d5LqwF/zzU3Y3ecP/Ho/W6SDsBYfk
         sSj/R3aF8U7uJ4ZMy2P03y/7xWNN1reO7sCALZTmEDLJpSLe+lN0zqtOYPYhaYT0LNkj
         xRqYAIgJChhpFWx+05QtsPQCOAQVbnI5krD3f5+1RdIm5WqAvD+lsEcBLagRHjhsQKs4
         J//XhezgWBz4PLyGnPHViF+VEK+NJvtFbAnnjPgeUooSIfv5Mf90OdtGZg9T9AHlxWUT
         K6mKM/96/97geF5e8YvYVqaXhRtKswBTUlNaBhkLU0NPjdyHSdMUg7IALxzjjdIfH1iE
         1VtA==
X-Forwarded-Encrypted: i=1; AKwUvBzRAPCCsmnyk/SgWIr0DihIzSZ5NF/nx95mmdWZpp06mfwKfnibhvzNDU0KxI880PXhFrWvWl6AWwNekIg=@vger.kernel.org
X-Gm-Message-State: AFuF++lNpWS3ixYqJFYBhXuGD0radkdHcHSwCQxEmGKum7tSj9ZesvGu
	ZryGyhEiw2L609xcN0pUt6z+yQrAuKKHD2vTYMABioKEuNYDRLztnhgCHwxwhLeiI1DbUCklOH2
	4mn//jBOfuqN2z9M/FE5zxJtZ50U4xso=
X-Gm-Gg: AYBFou2XmQK9/us9GoWq3YuzmsblBVVFiVM/ilORfXmbe2Tc6mQ6FY7JdnTUDqs82+U
	HzjI+otjnwveeO8IvRn8ziAN6R8lIIJ7E562dAMnLbRqVRyegI6fsQi8ZZBOjF0S9US1Qa/VZYa
	3ByUZ5dLIDk9Czf58kx0tx4oi43aobZeoKCZQSVHMsal4YKgIt3vVGNtwYcZH6o8AgRAD49Iesv
	p5U6YqRhLUAyR1Aot/AMHFdF078s3ji6IKeoR+r9jOMJcsu0ozTKVR6WXCpXX5CVSKopu/QVybn
	r4yZHjeovvYoaRICwLQQKQOu/O+6bjgjV/RN+cGe3jVrpcp9LUON4AcOPhADJXgxirUCQ4OSa61
	wQk/rigFZT9M/zXBLyCeq
X-Received: by 2002:a05:6402:3552:b0:6a7:ee55:dcd6 with SMTP id
 4fb4d7f45d1cf-6a7ee55dd7emr5195426a12.37.1788717912975; Sun, 06 Sep 2026
 11:05:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Sun, 6 Sep 2026 21:05:05 +0300
X-Gm-Features: AcwNN1UFEVFNvQf-_X8sOKVlhKXXkSgs5UqaHugB48_TROvAqilevHmYdWT9u90
Message-ID: <CAMnMt5aEXztCdrr-rFMOv9rEKgxVir4Oe90mPpO9duQoxLJxCg@mail.gmail.com>
Subject: [PATCH] wifi: mt7601u: add vnd_reset parameter to fix probe failure
 on Tenda U2
To: kuba@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On certain MT7601U adapters, such as Tenda U2 and other newer hardware
revisions, driver initialization consistently fails during probe with
vendor request timeouts (-110 / -ETIMEDOUT):

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
Link: https://www.opena.tv/viewtopic.php?t=63919
Link: https://askubuntu.com/questions/1418850/the-problem-with-wi-fi-u2
Link: https://bbs.archlinux.org/viewtopic.php?id=224859
Link: https://reddit.com/r/archlinux/comments/1d6dfv5/mt7601u_usb_wifi_not_working/
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
