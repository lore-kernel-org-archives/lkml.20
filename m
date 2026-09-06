Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F90374E79
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788726069; cv=pass; b=dtUTDJjWRpkTlN0vll5dK7g3krVaFjqlEIv9q6hHTYjLrGw4KykQRhjn4gcWPL7HEQDkQJS31E+Tsg+7PXBCDlfpsGShbuiuXrg1AU7gIcTmY89YYuuHAYXWW4oPqQ5aHi00kLDhqBc+CV7vtwd4TEqXFKUL7DNtuUzz4zTP1z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788726069; c=relaxed/simple;
	bh=oA1X1GChFEvuacw+9iNRsJvQJTnj8ElVyU5ZaQ1I8As=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=PfILLTsnTwBW5HEF0Nwn+zyFbsmpU1iFzbHG/KOod3ZpyArEDcc9SGUqIHvOQT/TKeTGCq4Hlspn4AL99Kctptdn9dYBzuoGwkwRJTA70Jo9PgUQubNyyV/mY5uiymxmPVlqn3x7Df+tUy8I0ScYRfT41Qo4psh/YwjowpK4ybY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7nVUel8; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7nVUel8"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a7ea0046deso3547862a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:21:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788726066; cv=none;
        d=google.com; s=arc-20260327;
        b=H4+iiBVFAnqhE4bW5JH7aXJL4663LeiW7YkY1f9p2B3N9YWdwRp/1mrlJlBJUY4Gmd
         SuJgB7o7Rh0E5DVKPBkgUI7eM8uAgcpbZ5jg1i3uXt+Hm816B/kD5lbKO4V4lVRloPkK
         85RfsWfTiJ12/sl+hNo7U7k+zmAbVua500I9Aq2RQsC6yFYNbyg18ZfDlbV5jsVSyGZq
         5uG1tCgwBSoF1dCf7cuEaIg9KO11krP6MzmTYuKxDMjtXxuY7HE3s3oHh4Yr4tWsZhV9
         iIx7PLdluSd9OqSoZo3riOAQy9sMfstmJnbMDn1j+Q9HgEedIxe9XsK/UNw7RrFH3ir+
         uJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2wB8dZ34VBQ+EkfGi+YkoTYGW9KuX/Rd9YQ2zPOuFxc=;
        fh=nBt1ETA0DOHpyAjsA4VYCXxZkUO8SiGFgSuLj5+t2ZY=;
        b=RgJIXOXGQYVma9SjxwCyKEI4DBzO/EX/B+WSMj7AHWDzyHSEbyrGP+mADF20Ao/BR+
         Yvi/IYsWOBRSas/rAJ81zMUKvLOIbsvtpzoL4BxCpXHIOOjD/dmIFYmt1cnExd5DLgI6
         PyFfnanNKy8naFtQz85BIY8rNML2ex8Jqdq3l1yfo3kVDn5h5JmnTDE7fe5lYH6b5kkn
         hdj/u2l/n9HaqQ9lKVCfI0teyFEnFsM8YDYf7EnvAzn5OIByzODibqnG5rHBm8Zuj5yA
         5Ttigqzi0I6M/uPzKc+DdgIEBGxo8CoW8JwkSCr01jymku7DjlxOYZzP+ha1U9hlfzPD
         uPVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788726066; x=1789330866; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2wB8dZ34VBQ+EkfGi+YkoTYGW9KuX/Rd9YQ2zPOuFxc=;
        b=p7nVUel8PccVWgQKHDFjImpJhy8yWmMV6A59htYnyesEJsT0CoSlENNsj8YmStLHDG
         KTBCHvX86g/6Vf71yvDxNLYEfqsWO5LCYyYvmYR6zG4Cnd7z8odtC9XRbTeZY7qi6Zm3
         aDjjO3L0fxv/SEi7eJfuAL07YaW87brWpsYM6mHmcdaBYL8UFCsOnb8x/cD5EW0oXh7U
         W6KGOp7GqV1Brb48y5vmvl7t2HDy/TeG1lVRA6l909bgsUqpMPdCqNqZBKmMtf7UX16F
         wsoq6fIQErXZgL9IBY6ON062zK2ieX/8H40JvAYJH5j+QPjai+kKhhytynMGBio26rmF
         ERuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788726066; x=1789330866;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2wB8dZ34VBQ+EkfGi+YkoTYGW9KuX/Rd9YQ2zPOuFxc=;
        b=XAbPr7KdFempZd3o9SOvWquObK5HU6ZUttYhUHfaS7OXY7aWudugO+DifX7sL8m0Qf
         Zs7weQwa/MuWgm+CGeoahDkdMpZelKNA8c9BWpm9xPlYM3VTUROwcDdKjYOluP5JCjc7
         m8QoCdDlEQuregFtVn8J2pCzR0Sq3SOnA9lRD6mOxsH+ZdiR4I1Sgr4q7V/Ot9ifIx/m
         9G1PfZXJzov+J2fTho8oWhKbEZiIGtdDR/0G5BWQJPIyxqGICFgCDWIsKzvkIiEEUk90
         /wosjpjfl+qDNOTJkTyvABiUiQSfkGdAkrOGBnn1WaPSZOq662LCf63B69kgap8N5Enh
         r7qA==
X-Forwarded-Encrypted: i=1; AKwUvBzc3CPRLJF8rLGN0ipTqFLf2+ca4R1sgLeqTuEGD3ac8YQf7aj5mWXyAZxWOSeEGDxq51MLFUXszxMUDh4=@vger.kernel.org
X-Gm-Message-State: AFuF++nJKtHlRRtAhfROpgghbTtnrtkAtFuGM/gFAiu7CPZqHTir+ty6
	Rq0dhauGZASCmvb+niP+11fL3L4nZVEAq5f703fA2c3VCTCEBlsZL/QlW3sDUAyV6idhhDZSRwJ
	bUmK1pYfyJNW3nCcSC5T0DdSOs8npOmQ=
X-Gm-Gg: AYBFou0d4dsmoL7grIwRqQFci/Jx/z189oSYECrLFibQ7I9ghxpnJnF9dsrXUIBrVMo
	b+PTuDMuUn1AI8Rjj8ZW51seufuvMCv+PTb8JCH4mMCeQo9d993P5124Z/HEsddeym7grItw2ws
	8ffQt4KiDGL9aHgp7u/av4s8uf+57iYBAYVVLNOQedE4IPwMqpbo5TeKay0RANhMQqp3912kExd
	wm8u0CxvAzMyfTcVLpOCS6C06xgNeJKxDWdpYu/LgpNaD7WysxDVbK+N6oK47b3L+RZEVs6M75/
	BoDwX7KaUiuohcQWFIfgTrTIz6dwi1v3wiYdQiAbMw8n2nbEJ9+z4+iQjTQQqK+ZNc/fPj7fgJj
	fI1y+KNYc35mPMNWOa3pc
X-Received: by 2002:a05:6402:a0db:b0:6a5:ed9e:b490 with SMTP id
 4fb4d7f45d1cf-6a7e8d94c7fmr6429567a12.14.1788726065413; Sun, 06 Sep 2026
 13:21:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Sun, 6 Sep 2026 23:20:59 +0300
X-Gm-Features: AcwNN1UPxIFsHwDXU8hiGJkF5a7BpL6rW2bIEFZM53U-6Zkk-RDF2UtnB5YSwWU
Message-ID: <CAMnMt5aJwVXEVKyBR7MvVBd=qCn7fNijMC+O_cZn82zGuNPc3A@mail.gmail.com>
Subject: [PATCH wireless-next] wifi: mt7601u: add vnd_reset parameter to fix
 probe failure on Tenda U2
To: kuba@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From c03d73d37df440d0046d68406fde2aa1f62fe0d1 Mon Sep 17 00:00:00 2001
From: Herman Semenoff <GermanAizek@aizekgroup.ru>
Date: Thu, 3 Sep 2026 07:14:32 +0300
Subject: [PATCH wireless-next] wifi: mt7601u: add vnd_reset parameter
to fix probe failure on Tenda U2

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
This patch is based on linux-next (tag: next-20260904, commit af5f12805e5c)
and targets the wireless-next tree.

Note: Alternatively, if maintainers prefer to avoid adding a module
parameter and can confirm that mt7601u_vendor_reset() is not required
on any supported hardware, the vendor reset call could instead be dropped
entirely.

 drivers/net/wireless/mediatek/mt7601u/mcu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/mcu.c
b/drivers/net/wireless/mediatek/mt7601u/mcu.c
index bad6ca821400..c7c5bd9bb9df 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mcu.c
+++ b/drivers/net/wireless/mediatek/mt7601u/mcu.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/usb.h>
 #include <linux/skbuff.h>
+#include <linux/moduleparam.h>

 #include "mt7601u.h"
 #include "dma.h"
@@ -21,6 +22,10 @@
 #define MCU_FW_URB_SIZE (MCU_FW_URB_MAX_PAYLOAD + 12)
 #define MCU_RESP_URB_SIZE 1024

+static bool vnd_reset;
+module_param(vnd_reset, bool, 0644);
+MODULE_PARM_DESC(vnd_reset, "Perform vendor reset during firmware
upload (default: false)");
+
 static inline int firmware_running(struct mt7601u_dev *dev)
 {
  return mt7601u_rr(dev, MT_MCU_COM_REG0) == 1;
@@ -459,8 +464,10 @@ static int mt7601u_load_firmware(struct mt7601u_dev *dev)
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

base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
