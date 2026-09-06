Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F1538642A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788718494; cv=pass; b=B+kY/i/LEpPfTOJY5rxqo+Urh+1dc65ennIYNhK71uClWdeCMZoK6gZa9H2NcjIrrRlYfmkbsImJ3SRQ/pj0MITTHAN0JNABFzN8ET5+OkGjwYraeV/MgblH1eVgNc++maTVHS69D6BS/CHK/aDrP7d8NzRxRoGnDm1rlUQ8RqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788718494; c=relaxed/simple;
	bh=2uIeKFJ6kSyQmOt/lS7FHOi4SRMwZSiVnijYyxEhUYA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=S1WrbjPlB1cOrfuvqcDW5/Quhbi/jwJ1bNdiR0x8SgUUUm63YgyCB+UCYJhYHCvYzEX6H66oF03DOMU5IHLWjLX97xQ77GuKa79AsneEFpJzC+jnPStQWqGSN5znYVplStF4B8OofrOEQNo6wb5IAA0WgQo61mIn3jOKkPr0z7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HjxlB6QY; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HjxlB6QY"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so6519273a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 11:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788718491; cv=none;
        d=google.com; s=arc-20260327;
        b=O8/wIP9XOC0JyJjXZu6VhHY/WVa0bACpOyf3Y/D8Fi3XIKwIuGRLSNihY6em4KY+HI
         biZKky3PZyhabDyL5S4aSwjpvM/ejOk0taEqbf/KvGpfOhXCyT/R1yTvYN+l5LVyrojd
         gxnyYAEpNgcBknVJgYSpt7FiBcmqHYCA63cujUVwz1jig34WMkp0fEw50ExCTTLpX3+v
         zB59w6O2u7N9BaMh66UrGObkvl9sY4STCHFXM6zB6iLJ/DGvKFm+4gjXWPU73gatEfsb
         mSGuh14gSXSQFi2nIz+M1v/LMy99W4/ZbadioKbklSKK7C+n+1/dmisHH2RkaFdNyw2E
         cOpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BZBDbjweCgWN70lZ84c1vU1QYkRvTglzhT8uoQ1WdK8=;
        fh=fsyS3ag0YfdQt6Nv0fanfEpGIj1l0cCiHTbMJ31poK8=;
        b=Bqe4jpjFu90i9WipWSkngEgY/I5nZRaJdAZLHCYvRooJrur2TCywmZ4SZyPcTFqW4c
         8u3VyI97DT03vA9z7KXL78vkC2fG5V5Tms/0oMmySG66ra7NBwjUTIhIjGCHxmtSfpOo
         cs100RKNtTj81qwKsWmnPjiobCKvZu6HNwDWW9LMf2tvDesBng0TzhHf9sKoE+EiJmyG
         L0dQo8c6Ss+2rhp9GkHjMzX1S4j8S2iVmxz/vKI5NF5F0CCCIHFCHv2Cw+lTyksIZu9W
         NejheSLisWQrkG9L2BD27Yh/MQ1O8jEcizckCQ6CNfCxcCHJAuaVvCWD3XXhmIsmAiJU
         +41A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788718491; x=1789323291; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BZBDbjweCgWN70lZ84c1vU1QYkRvTglzhT8uoQ1WdK8=;
        b=HjxlB6QYal8/2wt1oQ9mvMN1Yqgvcscti6W3uLUro/e/AKBDQMFYPI7HPukQjVoSNE
         Gj3fEL8dKp8Oiq9qcnYqcCN2HmXePqzhQi7wDxwfJ1ev6+C6ZIeKUBrQ+g4TOZmWrpTF
         3M8VeYTrMgofoZ8AKeXV0Y18FgyhBjLcd5kEGGtZBFJlf73W00B25lKIsUGDhERv59hL
         WcMRcqmo1zJjOHq4OaaU113dYcHPbGbOQ5Iss00FjWug7XvbYYjPhLtBxQFZYZ9sjLHP
         KVEG1DlXaOu+wrwZjGC2YzheaUTdSK1mNodLfJcy8ZnxpagV1ZZZJanfoWVFLOpqu6hE
         2O8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788718491; x=1789323291;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZBDbjweCgWN70lZ84c1vU1QYkRvTglzhT8uoQ1WdK8=;
        b=nqqu7H1gq6k5vkspDrV8vehZCd9rSMU205aDBiYRaaUzGSb3xgwHfJCXSSgbhRTr8J
         RaRC9dGpFhaTEWgje2gaprqOTuhZ4LBfcpPI5fNs+xBIDrP8L75N1cWAESCL8nOgWSmw
         PFbwpNRNHeVY016HYLEJCvT44zzWxlScmriv5hfbaUCB/1cSZhR6+/Yg9BSsDTBl6zXY
         EXGracWZ16pxyK6rRc4dtRZ/mdUaLTnJNcxpIuwnZxrkR65Geeaqhsdo/DzE7IdRRAKc
         VDIxiCqRKCfqEC2xmSYRkGbmqhMJCsvBlTL8hgk2O7rhrlqUG560T73lysKYNVKAhjlL
         8Amg==
X-Forwarded-Encrypted: i=1; AKwUvByoZ/7HMmsGGlxHyGt2Hmfb7xSTWNbGKH3Xg//AoRrP1VkDQ41w1ympcuJbxDTnUpxP2LCNb7A9lz22OE4=@vger.kernel.org
X-Gm-Message-State: AFuF++m0m3POufI+uRtfszA2Xf6UcHFH8Oi9l5yKo5/WKyEzb/cWHdrp
	9NB1wB8iLKBT+7z4t/H+0KA10RZpTAu+xVlx9OTKIzZxJpeYxuXCKkRKIcRSBIKqMb9TIE54DXp
	0IP/JoT6FeD5cMKqq1TIZBrAU5MotYCMnvjYdMGg=
X-Gm-Gg: AYBFou3dQeZ96/H1ei59CMO5eMh0tgNBhvkPcNhgxJ9HfgPOSNFmoCiJMyItHa/Otz1
	WPlKPlS2R/qiIYmL8gxboEJxlNqRNw0q+UMtxJxdWcwWrc6UyTQkWJICF4AhTrigEkCccU3B+X9
	0LgJYkSMXsW4mYY9QXarj9WxRlT6So3lkPRVqSIIQnCZDgTovbP5OrgOT1hEJy/UFLYOiDD1gRX
	8fFIZq0OINANYGxtJDd5zDFCvnch20e7zIn9SCRXdjs04fLF22mP/fNWP60GEuk3K3xnC3pYNcr
	yecu3h2jKAww+8J7BcEQseEkWMt/Isv0j2C/3YHzLJra1bAOKMSzFTUld4HzpBVJzRCt9EhO0D4
	T0W2HSBu9lh0EQvE+d/UGRBSGYKtL9zY=
X-Received: by 2002:a05:6402:350e:b0:6a8:151b:4f8b with SMTP id
 4fb4d7f45d1cf-6a8151b5117mr1163910a12.9.1788718491060; Sun, 06 Sep 2026
 11:14:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Sun, 6 Sep 2026 21:14:44 +0300
X-Gm-Features: AcwNN1XQea4JVeKlgosC4Fnb06TVn9_6OLpz_KP5Kh1YLDKOaHMdq7n0R17mMXA
Message-ID: <CAMnMt5bi7417A8gRAZMKA8GJzwR+YCUEUQZ0Qeh4t7Vp=uq=mg@mail.gmail.com>
Subject: [PATCH] wifi: mt7601u: add vnd_reset parameter to fix probe failure
 on Tenda U2
To: kuba@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From c03d73d37df440d0046d68406fde2aa1f62fe0d1 Mon Sep 17 00:00:00 2001
From: Herman Semenoff <GermanAizek@aizekgroup.ru>
Date: Thu, 3 Sep 2026 07:14:32 +0300
Subject: [PATCH] wifi: mt7601u: add vnd_reset parameter to fix probe
failure on Tenda U2

On certain MT7601U adapters, such as Tenda U2 and other newer hardware
revisions, driver initialization consistently fails during probe with
vendor request timeouts (-110 / -ETIMEDOUT):

    mt7601u 3-14:1.0: ASIC revision: 76010001 MAC revision: 76010500
    mt7601u 3-14:1.0: Firmware Version: 0.1.00 Build: 7640
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
+ usleep_range(5000, 10000);
+ }

  mt7601u_wr(dev, 0xa44, 0);
  mt7601u_wr(dev, 0x230, 0x84210);
-- 
2.55.0
