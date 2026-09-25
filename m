Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281193E0222
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356054; cv=none; b=kFfxMUdGHU04mLOktK8y+9EdxPnvB4XH+zL8V4mRVVtkctoEkcHH/OBR5SWvlRZMr/BM6qPi4ikDxd4qF8bYmSd0/euiN4NadsbZIv6fLZGmfU0Yw9sLl8J3K1ZDJSnv1mLKZW2c6kBsPRdFCdvlsLn4q6VwXC+YC72mkH1t498=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356054; c=relaxed/simple;
	bh=l1m4b+1Tuj3AgpgIoBKvDCu/Rg9JYV3MfKsBgahuR1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qFXmeQk54EyapKHIpONxAxUHr33qVCMrMmnCzyCcJ9ruF5BwtuiknUztkIL43BV3/hCFUoorJCb4NlUFNi5w+X11ER2fyAuGa5P+WiKsTQ7v5jvg4XISQj/FjASl0MrJ9UHGlquXTc6H5Q+9r+W2vP2co96sRzbAX2abHfcm3Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFA4F7RX; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFA4F7RX"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df8818fe1eso3894985ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790356043; x=1790960843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7VpcBNdmrVh0UXb9yrYQNO/worK6M2KtwpnxLGH9ufo=;
        b=VFA4F7RXNlX/fzso5qNA4O4ygIYgbD2ZW1MW/C1gkBVOizaef/33LSgByFUkuam/pb
         kZrUGC8ihuNoy3vl+MLPXTNU6uiQ1jvj+ilhS+RPWl0OIU+1jQOeXqW7d7ylrFHvmwRt
         BBkyPflupe+ucrwDzobAIeOPS5qvGPOCWee3dSbo/8CqcroP4wwYK/8xf59R1RBvjtxv
         v8oI1b+1xq2llr6QZdSPadqmgvRKFd89ClFBWM8BREp/iyQbB6oHUTvsgMcLKZxiP8hb
         vttLE3wHQxAch7smlYFsowPoNI+BlBc376LL25OJEeLvvQZxkBa33HzBOGA8HUT4cgh7
         gDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790356043; x=1790960843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VpcBNdmrVh0UXb9yrYQNO/worK6M2KtwpnxLGH9ufo=;
        b=SL8WXY6rThQ6+nu7VFsyhYziXBM/CZLgLbNIwuO/d6oCwRd0xZjmgoRz+qUN60h7nQ
         WZizDKgRjMDQDTEXpoeQgYeat6VBS2eLvqJXgAl93P+DwaGrs+XXVLTSpZ9eumIDyPzR
         tBmgn48N+GncHchgbAC2dhRkKs3My0p9MoQl2XlYFSWHJ2SFXAjM1ww5hLgXzDaNZBMr
         dXCvTbVdV0AyatwZn1BWnvNVNksfFBeNAe0amzZpIV17mzWRUQ0wYf3g0ajlU7xVToOW
         o71F1V88sn8hW1T9pxFEPwxc+eG0mmMQxKloqTW65hQWhVVBwGYp+m/2UgzTzhSDkggN
         hJ7g==
X-Forwarded-Encrypted: i=1; AKwUvBzlJB3zZe9+VlhojBlwjg+yElWDfCWcShC2oIe2U4SPaXTw4iBzVmXmPH0KymHmaVRoSfZBaUBp0r5cw9M=@vger.kernel.org
X-Gm-Message-State: AFuF++n68NjanGV/PylB97tUnpLA9YQEeVdlwp2R6GP6AKwogfoE65Qh
	jb19GYClI0WAEN0RZEzDhNlI715txifJb8RdQum0zYbRwV5RtjMxW9TN
X-Gm-Gg: AYBFou1yYi5km9sdTbGQd/plJGiCGpdvXUVGKnA51bWmsZH1dpxXY8Ez8eVpsXLsBJe
	jDXu3yrOKCOik0wbjpR+H4qC5THkImPXGzI3vOWa8/6bRDfXSXhbtTTe2lOAW9NWHYkgB2KQQrW
	s+7Ajz678aJLFyU5aUaO/Jorgy5Pc18BVdIpaQfHPSbi0aTNCtRRwInSm3m4pegjaGa27dWmq9e
	m3UfVeMd/ogb2W1ueE3ERaOpatVvSV4xHnsIbdCYuNHIrjfRpktxZM6NAPcOyelIjPcGpHCCJ+V
	z62DYE48ehNsaWrcbyfTeu4S/KtZoldbQlHegHVhHcCH/WVlKYyU5Syeww019Q/qs+QuUCtC6go
	bAvVK9kSWA4fckltH0XCsVrgLIY8yxpNFpzXXqTDWbT0I4BwQNYdANqYUX14l6xEUyuNP6TREZ1
	i8GgH9vUTv0hGv38a2mm3bF+rnAp5OhImkv77HJ+hBwYsxGCnmcqwB6sirYRRPubOml5va0hAju
	ZpTHX5bDF8hVvOTq5aVvjNP+vrl
X-Received: by 2002:a17:903:2345:b0:2dd:c100:2521 with SMTP id d9443c01a7336-2df7e3b3ff9mr40533265ad.42.1790356042978;
        Fri, 25 Sep 2026 10:07:22 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:6850:49fe:a642:bbf3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91401161sm14190205ad.36.2026.09.25.10.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:07:22 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Daniel Mack <zonque@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: caiaq: unregister the input device when probe fails
Date: Sat, 26 Sep 2026 00:07:17 +0700
Message-ID: <20260925170717.22462-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

setup_card() registers the input device, whose name and phys point into
struct snd_usb_caiaqdev, and then goes on to snd_card_register() and
snd_usb_caiaq_control_init(). If either fails, snd_probe() calls
snd_card_free(), which frees the device state but leaves the input
device registered: card_free() only clears the pointer, and the input
device is unregistered from snd_disconnect() alone. Reading its "uevent"
attribute afterwards dereferences freed memory:

  BUG: KASAN: slab-use-after-free in string+0x4a9/0x4f0
  Read of size 1 at addr ffff8880208f5043 by task caiaq/4967
   add_uevent_var+0x183/0x3a0
   input_dev_uevent+0x162/0x900
   dev_uevent+0x2f1/0x870
   uevent_show+0x1ca/0x3a0
   ...

Unregister the input device on the probe error path, as
snd_disconnect() does. snd_usb_caiaq_input_disconnect() is a no-op when
no input device was registered.

Reproduced with a raw-gadget Audio Kontrol 1 and a temporary hack that
makes snd_usb_caiaq_control_init() fail.

Fixes: 28abd224db4a ("ALSA: caiaq: Handle probe errors properly")
Cc: stable@vger.kernel.org
Reported-by: syzbot+2a123f6269da57ffefaa@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2a123f6269da57ffefaa
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 sound/usb/caiaq/device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index 3d821fde4582..f604846ec6e6 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -562,6 +562,9 @@ static int snd_probe(struct usb_interface *intf,
 	ret = init_card(caiaqdev(card));
 	if (ret < 0) {
 		dev_err(&usb_dev->dev, "unable to init card! (ret=%d)\n", ret);
+#ifdef CONFIG_SND_USB_CAIAQ_INPUT
+		snd_usb_caiaq_input_disconnect(caiaqdev(card));
+#endif
 		snd_card_free(card);
 		return ret;
 	}
-- 
2.43.0

