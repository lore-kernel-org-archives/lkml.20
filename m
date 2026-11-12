Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490796;
	b=kIXgjGFBrEQ6WYIE6h2Rp4u/IAac29X25uKlU4LW4MvCl7Xqa62yXZO3oxogzsT5F9Go
	 hG2cjREENrk9derLgIjW7QgWbuT1N3Dc4vnswrm8amQcxrvPLeEh3a6+rj3CUaiCZsWQH
	 URxQKaSbJz8JNtSp80QVHJKfW0MYF2stLLrUdKEjHKeLFxaY0TW6IeopYwKIDCfufFC5L
	 rqE/g5DK4D/auX+iYt8JBp9WS3u5e00AUuD1qQEJNazMKoYzrBSTg+6GD5K2GQ9i0FFft
	 GMmKYylPj1jT2RAH8z94O7u+hRBIjsoW6GOOc64mc/jTyi4tsL7uWKKr/xnQB2RRN8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=seWLHQeXZyZ8tmRvofieMn9RmSQ51of6+PAgiTZQrds=;
	b=brZkNUmXxPi0xxxzMCr3lN+zqmjnqgE2wwqC7g6duiPnmxPSZZptgMrKPme/S1hJpHzI
	 rFaS0M7Z5ShFGrNXZKnWGrcmzs97P1OpLgTQuKNBlSEUOC67JmcR4oA0c4O2QRQmwcT+z
	 OGEQhRQsmvzbkNXSdv4Lb3Q07clhizE1GJ8n9m9ycNcwju74Jsn++fZ0ZiyDyqAzqPV4a
	 uv4sHzS5rmglwtlrvBZWLIS15fc79yStcUikht7iUXJwTN8HNCaiypukw+Pfs1yXh0N6s
	 7hsECc/FLkBnH7CHsbB3aFFwC+lohl4owppfrCQBTcDIP4nLjaHCcpoOMFzZPTs/Z8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=BJRYcCaz;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E898E606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E898E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=BJRYcCaz
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so32404145e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794490794; x=1795095594; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=seWLHQeXZyZ8tmRvofieMn9RmSQ51of6+PAgiTZQrds=;
        b=BJRYcCazv7TcWMeW5VaDg5GiMEt2ICDbqfTH5xn2VjEDibc6O/rn8lTxMgAoC2W1AT
         h5R50DLodlK1gFxfIHNcnJ04ZsvhhiLiDr27bjALZqteuvqLyn1x6jchmigUqPAHD6pw
         ITsLuzHNhejyIZ4GwuczyXOhRA7j92W25HiUcYZWNtynDSDSGVqAqaQcbkyHR8FhGXBI
         kxpapwY4PWlhS8vKFlR9HzI1Nqd5FRNkaJYoj5fzL1HbfOLCugSaM9jvVtb7lajP+x+b
         41x40WEsKIJHmOnXHgKhdWU9Rxsc4R6zD1yhjEWfHL409PyslfIb0eyqpYDkwYFLcP0k
         CzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490794; x=1795095594;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=seWLHQeXZyZ8tmRvofieMn9RmSQ51of6+PAgiTZQrds=;
        b=Cqdv0zFnKMAjhhEcvIa2dHG0MaZuimJv/ErDKfMxbnm8AbOyNK3Rh/8olt0DRSr8oj
         PNJ5pPKUgD6yCfDfxeA5BJWRQGARQPiWe8ilpBN0nNmNukpPApF153TiRLrwR1aZrG9t
         qRZcxyr7aKpikTI9UQxcCdw6YFwUTtrkWGIDf4qeZJcuAxEujYvavWr/J3eyMappyyuD
         4XvA81gthPmZDiN/WQALegefWTj3xiwlc6Bn/8FMct/WgOtH5qeZb5i1UIwgcWEuzweJ
         ijbPV9z2jYPZlf9NdzNYn6uEpTTCdiwcWOJ9ejbfny2Tzmy7b9W/DLkS/qmjPjXkScHK
         MKhQ==
X-Forwarded-Encrypted: i=1; AL+hErHwBX9QTs3OJ0Ts0Btx8Kmxjt87Hki1TCLSlvKW3iSyJ5RhIEMyD3djJaY0dzCy9wa2LmYb4ysAG6cDsH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s0om4tzqpqH23XyI5g5T7cc5jJRaP21xSqoQg61mDivr71lLN
	wL4Id0rExbeOkHDztqpsQaIAiyKMb4/FC/3l0DGEk2I55syo+AzhvZZVyeuwJNDViCQ=
X-Gm-Gg: AYBFou3zmP9A1ZxpsF4ZLVVH0vhkoLX0L9vMQnJcO55XFT2SSpXuqFcyaOei3sqy1Pq
	gkNGYEBFIBfPazGWmK4S2OUfwgLdYNapf7LcgolmroxUo7O9CJZw+MifLvyjGI7JG8CEyyERsXt
	u6efR7OZzpSP/RqkSQwt0rG2YHG58fTZ7BlC+6JefjM2Rw0Cq758pbpoRMSHnJ6kOuDoeSH544x
	W8hBo5L31E+KeThCJShxQPrt5EuzfZIDWYd4s1PoqSP5g1kstPJTwQQaw5eO7PqMSreG3l03uzN
	ngNjN90pZ0+xYiyhMCVyakHpe+ioJ4rg4QuSMK2sZAHw0pXGlasAjJg3BHvakw1lLbcZ91vhgqE
	iiAoxkOF8Sy7YqAxO9eUv8Sg3odapUVH4/Z7kPy9YxFMNYyWFguWFX6t2X3bc4z5fGf/hj2gPNZ
	/NRNC9RtntV85ZG1Hqs5KI8CgjRObCjFmMybO4wcGbHdSbNBINYihWVW/MGYWwMcmG/ShaaUkHs
	d9yBdOKMaOjmzRYmzmHaEekDDPlC53GLeH5UmncomocpnHysRHJh6tkNehn64QzqKutz3fZRGO8
	P/TFl5rBQhrjftkjLYM3+xm2eiEGL1PqO0MAOyoq0S98B8ozKmJv3AUbmDk8akyBVCaqVq9mZns
	VFJLWv4RaJg==
X-Received: by 2002:a05:600c:350b:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4ba09381815mr103259415e9.27.1794490794383;
        Thu, 12 Nov 2026 05:39:54 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c30b1sm16920643f8f.46.2026.11.12.05.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:39:54 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 12 Nov 2026 17:39:33 +0400
Subject: [PATCH] wifi: mt76: mt7921u: Don't reset the USB device on probe
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-mt7921u-bt-reset-v1-1-65587a4d7b81@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdPElkyHr0I4uFG0JoBZhzEhv
 LtTjt/h/zcwSSoG12qDJG81XeYCqiuIj9t8F9ShGPjEZyJinPKlZVoxZExikrFp2PuR2+idg5K
 9koz6+S+7/rCt4Skx/z6w719iTb5JdAAAAA==
X-Change-ID: 20261112-mt7921u-bt-reset-33288f29c855
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2245; i=alchark@flipper.net;
 h=from:subject:message-id; bh=bL8RpPYoSxUEiC5G0bR5mu2gXixb1LSpx/iep6yWC+k=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9Pbhgrt6mzODDqpa1AcI8vMX9clPd5p0T8ZCc7n2x7
 eh0vXj7joksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKY6VpSR4YpHVJWeiTaD1rrw3dzTQ2qnHJB+bV301oJh4tMCzoQiYYa/ApGuEpd
 lBdsN7G/ov652P2JZ3fTkZdhDPtOXO4wTPjgyAAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

MT7921AUN modules are composite USB devices: btusb drives Bluetooth on
interfaces 0-2 and mt7921u drives Wi-Fi on interface 3. Resetting the
whole device from the Wi-Fi probe unbinds btusb, which has no
pre_reset/post_reset handlers, and since interfaces probe in order, btusb
is usually still downloading its firmware when that happens. The unbind
disables the Bluetooth interrupt endpoint under the running setup, so
HCI_Reset times out waiting for its event, and the Wi-Fi probe stalls for
about 5s until the Bluetooth power-on work gives up:

  Bluetooth: hci0: urb 00000000c4b7b871 failed to resubmit (2)
  Bluetooth: hci0: Opcode 0x0c03 failed: -110

Drop the reset. The USB core resets the port in hub_port_init() before
addressing any newly connected device, using the same hub_port_reset()
that usb_reset_device() ends up in, so the probe-time call repeats a
reset that has just happened. A rebind without re-enumeration resets the
Wi-Fi subsystem through mt792xu_wfsys_reset() on both disconnect and
probe.

Fixes: 0d2afe09fad5 ("mt76: mt7921: add mt7921u driver")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 2fdecf239125..90b9bdf15e9a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -181,7 +181,6 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 		.write_copy = mt792xu_copy,
 		.type = MT76_BUS_USB,
 	};
-	struct usb_device *udev = interface_to_usbdev(usb_intf);
 	struct ieee80211_ops *ops;
 	struct ieee80211_hw *hw;
 	struct mt792x_dev *dev;
@@ -205,8 +204,6 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 	atomic_set(&dev->mt76.bus_hung, false);
 	mt792xu_reset_work_init(dev);
 
-	usb_reset_device(udev);
-
 	usb_set_intfdata(usb_intf, dev);
 
 	ret = __mt76u_init(mdev, usb_intf, &bus_ops);

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-mt7921u-bt-reset-33288f29c855

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

