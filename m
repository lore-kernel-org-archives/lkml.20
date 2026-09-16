Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472303B841F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789522456; cv=pass; b=RnvZ8+EvTMmxs39isXLmogUkbg8zb3ygtRwIpJB6EkoxzfN9AAE4All5QuWmEIqPNU58rv7SGahyCcKmqkAWxoEI0PVp90Q8EjmYHWH/MEMk3IFcVeJpGDSQXLkEdHAuhq9XzhYVEKb3kxSV2L9TaNba2/kzuSJuz+GTL23qJks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789522456; c=relaxed/simple;
	bh=bcGw17MDxQDxC5Y3/F3j7nu7GvtT2jwlY8xu3ufPlqg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Doks8pA5wj19M4bnGfB95PAwVtcaQfaQoviawidX/I9oBdfMF8ZX0dMVdaCzMecETe1C456qveFFN/TtA5UiyPUvXSEp5PwMFP/9VE1eAipldOrpBcfu9kTC9v0UjtEkB8Xa/XTNf5eQkN83R+gBSWhy5nskHRViXmTT3g0mBsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOFOxcKv; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOFOxcKv"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a985e8fcddso600230a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789522427; cv=none;
        d=google.com; s=arc-20260327;
        b=eav+Q02BrFZJfc7oLoupoDyV3Iw0+e6oMP/3kWQ9+c/KEfiZIXA40uqGW9tUoBiIf7
         TpnoqPkpG0LTsZpRxCCj3fXPRKvNEKILvvdpt3jl3uStwySHAiBujnSaHZNa8Q/MHf9u
         mjtXO5Jn9J+xTw3v4qIJbaJeIsUKV6B9fM/YrdvhBs6Afg11eu9hJcR5ePclQEjbMVaK
         860VVbq0Z1xEVhSIVVS+EK5yTMPqZCKhE4i4eHhHbqK8qMypfDnBcfM4w2IhcOLL8bbR
         dt3VtFxUq6hhdvo/kBSA4XzQEOiVTsgzYaYbSoqOgUNzYGyYgeXlbUEu4x01y5/qZ7VU
         pT6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=X8ZJ80a/z4DWnRGcxZzAaCGtkR0kxX41wBpZTWuSpAw=;
        fh=uKfh7iPQKVYTO1Yw0acR4hes4g4HBY38C03xeax8Ers=;
        b=fYEWwMMS62PLdtO4KqZSRt/nWAFwx8i8dXhz7clqypunn1Tma8LrQEUyNAJQWe4EVd
         sHRUsVLTJvzBFNfltIFsNvAAlbXIqSezJEYxtYC0BcRJcOqF+wSt7KU83YDse3kMFvj7
         LGq5n7hQ0vfqrp5tSdyqp4vAPwwzFz5g44YdrXDKAMob8Ig1BNCm3yTrtUqqsAADlroR
         VPNPiI79dA7rr7I9DQUswlp9mK8YHORndcRnzmwOwC0frEZQwQHpxwkoY2qdnZA+fBj3
         EFp/0XN28zoWk62Jxohf2/EunOYV7ZFbZqw0laj5xNRSA8Hn3tYB8RJovZyLu9W3nQb6
         BB2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789522427; x=1790127227; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X8ZJ80a/z4DWnRGcxZzAaCGtkR0kxX41wBpZTWuSpAw=;
        b=KOFOxcKvTbLEc7g0IbMgVrmdT7vheXxNIZOVuFFYFEqTrSoaNU1sITDElbSmBG056S
         uQK/hu3N2uRpNOh1D+DT1e4KFcuQszjYtGkfyXLwf/aeWd/Qfox9Z2x3yhB9g63YpOkU
         u9hifp/rYNgX+sH7O15up8eEXDsgN15dhgRzk63uF2pc403Gu0oANjHjDj7fWg63z+73
         5xu00Kv9p34zpmHQ+NnYEvsQ+YhNmGjxGf9vrZ17auYYGSJgAlw9KVXWKMugZUf75Wjf
         1hv/vV8yNYtJShn/rGbR4ZdIxv5ROidD6wJXsbGWq7bFJ+Vnn+n8tVH0LF/Ts7HcM+wq
         M+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789522427; x=1790127227;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8ZJ80a/z4DWnRGcxZzAaCGtkR0kxX41wBpZTWuSpAw=;
        b=jLmfJ2ui5xPR9PAXK2c5ao9isqO1Sqwtqi/G2Xij+4Gy8+KfZn1XLyjKekdWC8y1Sr
         /NdKFhbLk1h12eu/lN5HJ96V1BJPAkZCITZBtBIHpw6dr3X8jgByB0uPpaPnFWTXaAHx
         om9BMpAh5lZkqhB0gL+RNluv5kc9nH0JTQe0gfSIIxkDiDF0U0jZdAmcisCMLL6YIAIv
         7YUTOio6i7cR3V7+Aa/lQw9HJe3+PayLBjhsq+j1L/ZuUyiy5oJrIlojCtuhZU239K8J
         OX0oPql/JA8QtRsFAeXbCRSSkUkfD+lQ1/uDdreRX7NQM4Sc0NUZbVPwPA1KFdjPg1Mr
         myjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTA+6vp5ePd/5tg0f2l9YlEx351/xlpTNBJ103u+fZDmSP3YK6/KwgEVgagi+8WUHCvviV5aLBW8i+hSw=@vger.kernel.org
X-Gm-Message-State: AFuF++kNoeCDHuBQLggaGwtP/GhBDg215Y3h0GvVMixo9HUKXjapEuTG
	DZ2Eqw1THKFoEK/ZXI992qTXM59RkOy2eLkZbqBJj6K8xr1NCpgWVll6slRYlm8ur7wK7aH440H
	PISft5dwmq6ZMkhzZ6xetX1/knlwdQ1jV2F/RE2w=
X-Gm-Gg: AYBFou20uOPen5fofjbEPieFdexwZnedgAFozpeIJgWiJxuqQ0xE21/WP9yYG6BQTPF
	xDEbPG1zTa76Ja2t72u/kuexPtRf0wYrWtIrQodo/1kYhkf2BfJ+eJa/gc9L/UgY+zTLchKoAHe
	geOn34zB1a5GWjq7R6EXhfRaz1yATFQ8rcKxnFB1vgKctm4jEH8vs7JiRnHGnCX4UIXVOWc61Rc
	xxH1bbXkY+AidCRXnFxAzIUJEH314wFwanXLFXSv3Nu1gNcgClAogJsEZWrfn5wXrYEr0Qm2Q4F
	JXpn2HZvdKW6lwsTwEX9HrbsiX04PR14a+2zg8cLOI48ZkmB1rYHC4kIrvPZBAzD8S7ydx7Mv2r
	KwdB+DVdp70m568FYdghITp2b34ONuF0=
X-Received: by 2002:a05:6402:a0c9:b0:6a7:ee56:615d with SMTP id
 4fb4d7f45d1cf-6aa223fff67mr390484a12.31.1789522427160; Tue, 15 Sep 2026
 18:33:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Wed, 16 Sep 2026 04:33:44 +0300
X-Gm-Features: AcwNN1WRjAmPrMxRjAxEMpPlykDTvmaP0osOKfdExBpslvJPszIxJRGvBbTeeb8
Message-ID: <CAMnMt5aD83-6x8oRBo56kEwkrjPibZZ5SNR8MkwU9DSpM8HRqQ@mail.gmail.com>
Subject: [RESEND FIX PATCH wireless-next] wifi: mt7601u: add vnd_reset
 parameter to fix probe failure on Tenda U2
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
