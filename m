Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197167;
	b=EdSzUOEXZzEQvppIjgN38ZB7MQuEvALplYdWh4MflHwWDWgbcqXFyHWLYCE3k6m1dwtU
	 aV9qgLTRmSMWs5vhCHQo14P0fukTbum6pZEfWaZQNZ8EjToKh8W2u4sjPfNKXLRskUTmr
	 C2e3FN+ZccfKdCA/ubednOHnVDXj7X3RyCtP3vV1KB83RXXh4NzjvYlLh0uAKa/xRyhML
	 T8KSybMD/HzytWau5ZLXa47tqP3pBJxzvM36uy/LHZXLu/1jjEvgf3IUjIbAiKVHyu/g3
	 hL2eBbsCajtCZDCE8PnK/V6BFQRFLR3K/LQmCE/wRo4LlfufA9xswEW5UmoZNhaxmqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wfVFawx1WEgioRP93JnhxZQvMdlK3X24yVnDut49gjc=;
	b=BjAuKcCF5kCSaR2Gte7G0c1rEo18XydBpMAOSm6uFI8FsEfHqacS/XfLiKJ1BUfg1p1P
	 PJKFCx0Ga96lfdR9tY+mIByek5ZH8a1yZiHjp+EWbTCRqkEZLCo8FSqVjH2FSG+b8U7nm
	 twevOGz0I62i8Q19BGsblKqAWJBk+1EzxMZHV7qUiYlsfcUFZ4TPeynaoPt5V/8ohkKmk
	 zzaPa57B3GdjsTmKhzQ2VdhqYl2bAIy8RNDMA9CW4NmYgdHBCTzBBcSF4+baPJr4jdnoU
	 alSFjpkCHc1BlabFtePdRCbErKu7cu77yk3PUj2/g2NC1MR+bkWIZo6tswVAUftmEBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P1XA+VnQ;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B5560A2600
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B5560A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P1XA+VnQ
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so588560a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197167; x=1793801967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wfVFawx1WEgioRP93JnhxZQvMdlK3X24yVnDut49gjc=;
        b=P1XA+VnQPQCdb8cQtqtSQOiFR33H3BylLmzvaDP5xvfAoAO+KLEchzy0HUroGMJ9Yf
         pLiTWLeBzGjv60XR0m8sHhiyZhBhnKcQFAwRP+a/UoOGkFHAzOvzxjmV8ZmVxrqb9BFe
         UomSN2nAOriW2X8FvIegSKAg4hCpzjSG0l4pfmHg2R3tdvA8k8FrSlegrlsGYDI9pISc
         RQiJq9VJ4S3ZH3JDGBI7i1S4x/1BXncfu0OaBN7EykMMbBBB6sbtzUSy+GFPNO0ZcFcj
         O4iK9rkiCOpaj3zAQ87CPSqrVOoHRY2+REuScBVAWsgzbiNKjFw5zUQLw9YM/epf+8WD
         y1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197167; x=1793801967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfVFawx1WEgioRP93JnhxZQvMdlK3X24yVnDut49gjc=;
        b=vvrq+/1yI2Al5Ai6eIyF4uQxZYhe86yTUxnpmLrDm0ev2cojjIStJ7pwkob4l/jhkM
         Ej3p59b4ox0povjJAsz9VFZgr2UtKg4PzbV9z7RCir4xZcaAXO/TT6YaEA5DzaT12QYX
         TDeWE1KSjPB+ra0m4yQvQ1d4E/mE1/rnknVeBXFcbe+Q9j4oVoZVjPOiCEGntGARfCVP
         V26OtbnaJh+7dW+HnFy3EbPiZLv+EAItpDmT53FWopIDd0Qc560xGyGFyyKd9Sozk7N3
         gPjOP5zhudPZZPB69xf2gS6RqWstLSNptxJ0JJCiog5JZ50eUqvBIohH45q3dFWq8UpP
         AtoQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0pXhRmYwxHg9gQyqOQ5WtvsC0gGhNuW6TTxYKzHYydDsWU+AgMg1ATA1v9iqTnPpcAt2mp0iPGfeQAwk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxMWrJvKf5zFbNHVoA4vrF6t3vsvwem7KCnVoBvHZD09dPdcKw
	HW1sbDxYWtCwom5ko918kBTCOzDt6GlmjKAdfacLWy0pewnGyonJJAMixkvq/koM//s=
X-Gm-Gg: AYBFou1ZD2MWgnkOAUr+kXk0HBJjYnNrgqJovDQdrNtpqU3DsToU2jRtSdG+kJhVCpt
	rffnlOGUoSB4wrUnGhVZsPpk7N9Heb8VAWDfavSIrPVRFBTscXGTC4vTY04pVI8mSxw3Wr4TtrY
	y+n1EEEPlwVgk+YLERpcfegnPIwZvZ+R+2/0y5KWqYa0kBv6f2qqjrUleC7ALDt7zWdxTOJU95r
	0+1wU4ihdTLOvxC6j7/AmKvvqJXQCGR0Zk19rk1kmzexwKcn7cxrr4QhcIjUYQrWaO2OSBPPaJF
	tLECnl/z37l++/LlL3zmWNs7kljIgTpvp5BzQ6V3Y2RzkHstJY4BQ54kLGgU5FKurS2yGeuCVXb
	NLLLBpueM9y3+mkWOMrnxho5pSbeNMcL5C+LSpgfJd+cAYAcb2J50rLdjrz/tcmagTWGES+x04C
	DqZBagJ0FfhnYIugN4QapR//JMTxLHhBEOYNqeLxk0WK9Ykl00nelMuQpkXJBkDiZU40ahjW2kd
	DrikftGG1IPsaL3pRQsqU7DZsyZxAWQSgQOE7Sj1Rja6HTb1qsvTuH6rykfdUIZnC8kqBBCLHDV
	zCBemqa3gsv95PaRZL3z8NWAJOCLngQETkjRxasfs/XPsZRwmPSnANrb9cjyVLn8v0o/
X-Received: by 2002:a05:6a21:8217:b0:3e2:7030:9080 with SMTP id adf61e73a8af0-3e9023aaec6mr2697680637.47.1793197166415;
        Wed, 28 Oct 2026 07:19:26 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a6cf9489sm1300647b3a.39.2026.10.28.07.19.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:19:26 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: neo_jou <neo_jou@realtek.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Kalle Valo <kvalo@kernel.org>,
	Hans Ulli Kroll <linux@ulli-kroll.de>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: rtw88: usb: stop RX work before unregistering hardware
Date: Wed, 28 Oct 2026 22:19:04 +0800
Message-ID: <20261028141904.8707-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disconnecting an rtw88 USB device while RX traffic is active can leave
the RX worker running after mac80211 hardware is unregistered. A firmware
event can then queue C2H work onto a destroyed workqueue.

rtw_usb_disconnect() kills active RX URBs and unregisters the hardware
without disabling rx_urb_work or canceling rx_work. The resubmission work
can restart a killed URB, while an in-flight RX worker can keep processing
packets during teardown.

Disable rx_urb_work before killing the active RX URBs, then cancel
rx_work synchronously before unregistering the hardware.

LLM assistance was used to find the bug and review.

Fixes: a82dfd33d123 ("wifi: rtw88: Add common USB chip support")
Fixes: 3e3aa566dd18 ("wifi: rtw88: usb: Preallocate and reuse the RX skbs")
Cc: stable@vger.kernel.org # needs adjustments for <= 6.13
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: A W=1 module build with MODPOST passed on the rtw
tree. Not reproduced; rtw88 USB hardware was unavailable.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.
Kernels before 6.14 have no rx_urb_work, and 6.6 also lacks
disable_work_sync(). There, killing the URBs already stops resubmission,
so the backport only needs cancel_work_sync(&rtwusb->rx_work) after
rtw_usb_cancel_rx_bufs().

 drivers/net/wireless/realtek/rtw88/usb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/usb.c b/drivers/net/wireless/realtek/rtw88/usb.c
index 64e1c3420e0a..1d2759eb96bf 100644
--- a/drivers/net/wireless/realtek/rtw88/usb.c
+++ b/drivers/net/wireless/realtek/rtw88/usb.c
@@ -1370,7 +1370,10 @@ void rtw_usb_disconnect(struct usb_interface *intf)
 	rtwdev = hw->priv;
 	rtwusb = rtw_get_usb_priv(rtwdev);
 
+	/* Stop deferred resubmission before killing the active RX URBs. */
+	disable_work_sync(&rtwusb->rx_urb_work);
 	rtw_usb_cancel_rx_bufs(rtwusb);
+	cancel_work_sync(&rtwusb->rx_work);
 
 	rtw_unregister_hw(rtwdev, hw);
 	rtw_usb_deinit_tx(rtwdev);

base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
-- 
2.56.0

