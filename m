Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792862854;
	b=ZL1uSy2eb7hOMPKe1qGstd4/HOytQ3M5lBfOpZ6v0NcvJR2HxSvF53dOLtym6iFkbqBO
	 ddIDmCtW2twbtIYsdfnwLOYUXtxJbMsVt6fGqINtTc33jTRJ9T1l7r+zhepxfGyyqUz3W
	 rihVaGMyxMW5aV/euNS/zetyBfRAzjnIDz7foFUnMk3N5Sx5V7V+e7OficqTkDbS4kG8F
	 HQd7dK38OCgyij4y/FYhgrZ61goH8kCJ8Z4hvb/Oke4hX1Yu+3suF1h4NhXrPnKKG+Lyn
	 86lt8qaZ1/e5LEsAQedG9FkKg70IywLn5QfEHTQWVdxe2KFhTHeTaZZn04g5/aTNCNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792862854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=X8ZJ80a/z4DWnRGcxZzAaCGtkR0kxX41wBpZTWuSpAw=;
	b=IVb90hm2WH/vIXwx6vBB/9OdEcFePxp+MWg9nEY7/D/2dOWsq5F6vu6kN4CXaGk96CeL
	 Zi0fTyjJR08Cw4qnygNmHMIeVrUrdHc1RqEte0C+XDrIXHCnQmotJZzvUCKb6RJxcG+nS
	 n0M5/HUpkQG1mnQLz9NetVtrbm/egnE+O0OtkzhDi7IqIBzJP+Lht9xKBiSW5WaczkoMR
	 +/UNqRgxL5pM/n5fFxkULp/IT5QGkY3NWdCo4hCQdK43k1dd9g9DnkQOEdHp/BFU9tab3
	 YnG6yMepKD2m3UFtjrgBg0adKGALIUb7KDlfnzW9Q4JgTD5RN+DLvZkv8+qGtzlKzWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZXuotAtr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D564E606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D564E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZXuotAtr
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e8c710847so222276966b.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792862852; cv=none;
        d=google.com; s=arc-20260327;
        b=A5Vjck32oG4/UhbbW59RIrTeXAZHPCUi3KyRBJN7yUZOZTa5b1MJIYNT5pG0NtyD0K
         7w0i5zU9nRNLzr/6RShii9l1IVSRIV8s3erSh22Lmej2EsQTB9qv2yWgxmNY6JFpSRvc
         ujb6N296/o56PznvuBrJ9WPIRSAmfTZ/nyrD+8OuxWYqb+P+pHpzfc61Epo/f7Ypd7jw
         Sj6nlBVcNhligQnKcWkAdP0K6HzC8u70oVtRavRRt1IqrXO50myutf7uZ8gN9e+9cVq3
         6Bn3CC0eJnQGnsGWxb1PeHJCTg/B3K9UMuRa9Y7CkXQlPaEZdab9oehpmLOD3zQE7A6A
         UqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=X8ZJ80a/z4DWnRGcxZzAaCGtkR0kxX41wBpZTWuSpAw=;
        fh=7dhLMiEElhlwiTHg9ttz374EdpwAnKeYzuhSP2kzUlI=;
        b=K9E81c+qTF5ku1m2eYCHaD/GszNUu0iyqXW/eKSXOfrLWNLMokzTLTrJlGgJsNIkUR
         kkIEqttkjDQhkJiheWZKgtVcpPm82jHTxZy0xhb7UJUHBgYj4wM6nClDV3XMsbTEgw5M
         jzyAtw8XHor3jfAi9P+9uacL2iyD7SKe9weEv0TjMSvbXLeT99hHVG3k0dzjJ3Xqf+6Y
         m5SrRzzSPfZrErE3jS6FRH8rK0PZz7UQS5zEXsOUAjJK5aldAizKeTFYRxuRqmOoHUhs
         FP4yjsETKqesM0wVIsTtpSPXuBx+pe6Rm2T1CDTm/3vaSpnK/ExXRQQRIABsKBpHhBpd
         cjtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792862852; x=1793467652; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8ZJ80a/z4DWnRGcxZzAaCGtkR0kxX41wBpZTWuSpAw=;
        b=ZXuotAtrFBfoMY9IT3TTNwOc53F8IKS+lv6jmrCdvM3lJSpbGYgILBC3NZpDCVoNJ8
         JvjQ7EMGG43zZTTeNHdL5JtMRFqjYTa/oWg6R2VJKV/1eX8zFljinDRiXXYtIB5bv9NG
         BYzxjhb6OjWVVL5E21vhWCbkO/uk9w9cLDcf005+M8ze+FzyxsLBlXAJQsCYz+zfO1+g
         nKE/DqMSfaiHkrq469yKtR9YbLC/Fl3g/uODV9kkXPX3RU7n8M0Thy4l+5nVV5Waa1X8
         ttol7mVlTn9QBc4p/+WEkAA3JfN2Uy4LbuPSu07W01CeYdxSsCeMoLKgmxVV31DmuR+T
         2FfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792862852; x=1793467652;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8ZJ80a/z4DWnRGcxZzAaCGtkR0kxX41wBpZTWuSpAw=;
        b=lF0MZ6hQHFTx5Z1/q53PqzAm8abqusWIozX97PHHv2E8wsY2wEbmicUhIpMU7YCod0
         0BXah2fRDcRwofVvrYOP0nf4uxaboXbe5H+WILzkSSg/J3dw2qXG3JAYaFfOMp3XXljZ
         r/yCFChWx4ix8OybkETKb8b3VmlASo3HrHSihtCcxzg2zEUCTf/AgeHViFb7XEEgjDD4
         F5MQiS8Kg4xzAj6/KJ3iN1M+GI1sPmHhcU44+xhLeVXvacq1lZxq36XR5vrOnbXe0f4P
         qmp2DQZyaxIGAQ9QTLaZ4IwjXlDXLnK8L5tkYtwS6c3K60c/Aj5VL1wLuwxrplyESk8Y
         oHJg==
X-Forwarded-Encrypted: i=1; AKwUvBxEYgKpRWbIC+on4I9wpOVMVQ+UKU1pQRKCNIawYyQCZ5C2nZMNS2u3bWPUyda9QrYm74T03/f4gk76KOQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFx5LxtNucZDTWW84N7XdWIlpr+pAHPMFYCr+4yBit6Cl0S24D
	vfnyv7IyyzTCFfUTENgVZxd66op++r2ZDyLzLt01UufCMITibCsGb3FUatErvw46uxoFGDiO6sV
	F4OpxHIsXTCKF6aYKnic7NbDCyXj2u1Imvlks0AI=
X-Gm-Gg: AYBFou30afS1nuqznM4+EKEoJ6Rrmtk5NyVovYH7OSxD6/Txp9+8hOmSzyyLaPaUSXy
	pKNipFx72lR2q8DxxsfduoSuGU1dZSjIoywq9Z1R1S55lIGel96EMiTMv59kJBAq1GXAgx8fS7q
	NHuCMueLrqcrom/fHq1IQr42PmND8ItO7WPd3xClp0CAnq7CreEWRCPVlrwVQM7scmq4Qd5DINF
	QaTb6nsdy1xDLWkYmsfDhMv19iUtMU5/lczjl60maTn1+rBaTqVIwWBQ0aOiAEE4F3axt2f2xcU
	ZtwpSEvgX4zQE+P5Pr6tpKnhwga/kKqI9FYlcZNZ4tR8sTJbiIY15YCQT3vG7MzV+6h+G+Ll4qM
	jLKRPf9xZAZ8h4UXLUFj8gtQzAeqhp7TRLHRAcymOn/J6nNphjO5eAHL0gPaD2Y1BXH64HlvuBd
	xzoSe6Xyq0B3MV
X-Received: by 2002:a17:907:3e05:b0:c2d:c739:30e1 with SMTP id
 a640c23a62f3a-c46bde6c920mr273371066b.32.1792862852097; Sat, 24 Oct 2026
 10:27:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAMnMt5aD83-6x8oRBo56kEwkrjPibZZ5SNR8MkwU9DSpM8HRqQ@mail.gmail.com>
In-Reply-To: <CAMnMt5aD83-6x8oRBo56kEwkrjPibZZ5SNR8MkwU9DSpM8HRqQ@mail.gmail.com>
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Sat, 24 Oct 2026 20:27:41 +0300
X-Gm-Features: AclHuK99TnIuS0fkz2gWqH4dJEt6ZW2u5GPOzHC3qNGDC04AAeGmSky3JNfM_tU
Message-ID: <CAMnMt5YoiP50fE_gLgfYFweuGfDjNZKXZbsE50Fj-bGQQHM5vA@mail.gmail.com>
Subject: [PATCH v2 wireless-next] wifi: mt7601u: add vnd_reset parameter to
 fix probe failure on Tenda U2
To: kuba@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On certain MT7601U adapters, such as Tenda U2 (USB ID 148f:7601) and
other newer hardware revisions, driver initialization consistently fails
during probe with vendor request timeouts (-110 / -ETIMEDOUT):

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

The USB device is already reset during mt7601u_probe() via
usb_reset_device(), making this additional vendor-specific reset
redundant. The vendor driver never used it, and devices that work with
vendor reset also work properly without it.

Drop mt7601u_vendor_reset() and its definition to allow firmware upload
and probe to succeed on all MT7601U adapters.

Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1716301
Link: https://www.opena.tv/viewtopic.php?t=63919
Link: https://askubuntu.com/questions/1418850/the-problem-with-wi-fi-u2
Link: https://bbs.archlinux.org/viewtopic.php?id=224859
Link: https://reddit.com/r/archlinux/comments/1d6dfv5/mt7601u_usb_wifi_not_working/
Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru>
---
 drivers/net/wireless/mediatek/mt7601u/mcu.c | 3 ---
 drivers/net/wireless/mediatek/mt7601u/usb.c | 6 ------
 drivers/net/wireless/mediatek/mt7601u/usb.h | 3 ---
 3 files changed, 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/mcu.c
b/drivers/net/wireless/mediatek/mt7601u/mcu.c
index bad6ca821400..979bc506d4ed 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mcu.c
+++ b/drivers/net/wireless/mediatek/mt7601u/mcu.c
@@ -459,9 +459,6 @@ static int mt7601u_load_firmware(struct mt7601u_dev *dev)
  mt7601u_wr(dev, 0x94c, 0);
  mt7601u_wr(dev, MT_FCE_PSE_CTRL, 0);

- mt7601u_vendor_reset(dev);
- msleep(5);
-
  mt7601u_wr(dev, 0xa44, 0);
  mt7601u_wr(dev, 0x230, 0x84210);
  mt7601u_wr(dev, 0x400, 0x80c00);
diff --git a/drivers/net/wireless/mediatek/mt7601u/usb.c
b/drivers/net/wireless/mediatek/mt7601u/usb.c
index 9306870cbc91..0d38644c491e 100644
--- a/drivers/net/wireless/mediatek/mt7601u/usb.c
+++ b/drivers/net/wireless/mediatek/mt7601u/usb.c
@@ -116,12 +116,6 @@ int mt7601u_vendor_request(struct mt7601u_dev
*dev, const u8 req,
  return ret;
 }

-void mt7601u_vendor_reset(struct mt7601u_dev *dev)
-{
- mt7601u_vendor_request(dev, MT_VEND_DEV_MODE, USB_DIR_OUT,
-       MT_VEND_DEV_MODE_RESET, 0, NULL, 0);
-}
-
 /* should be called with vendor_req_mutex held */
 static u32 __mt7601u_rr(struct mt7601u_dev *dev, u32 offset)
 {
diff --git a/drivers/net/wireless/mediatek/mt7601u/usb.h
b/drivers/net/wireless/mediatek/mt7601u/usb.h
index 723025f84483..49fede310c3b 100644
--- a/drivers/net/wireless/mediatek/mt7601u/usb.h
+++ b/drivers/net/wireless/mediatek/mt7601u/usb.h
@@ -14,8 +14,6 @@
 #define MT_VEND_REQ_MAX_RETRY 10
 #define MT_VEND_REQ_TOUT_MS 300

-#define MT_VEND_DEV_MODE_RESET 1
-
 #define MT_VEND_BUF sizeof(__le32)

 enum mt_vendor_req {
@@ -65,7 +63,6 @@ void mt7601u_complete_urb(struct urb *urb);
 int mt7601u_vendor_request(struct mt7601u_dev *dev, const u8 req,
    const u8 direction, const u16 val, const u16 offset,
    void *buf, const size_t buflen);
-void mt7601u_vendor_reset(struct mt7601u_dev *dev);
 int mt7601u_vendor_single_wr(struct mt7601u_dev *dev, const u8 req,
      const u16 offset, const u32 val);

--
2.55.0

base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
