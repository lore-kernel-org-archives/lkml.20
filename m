Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455664;
	b=hfBI98oVfiy4O/axI8vJHgtX3yFHgLYKEEtiP2cnNhAXsSkMtTGUjkkLHonikP6rPqf0
	 M5PoOxXd8OaGRLEaJJGNEHB8fqOsJiufEA81QcHaj9uK3HaNdmSqafkK9wCBebjxRthIK
	 y6CVORFLUfGPXYvtR8vMHzK3mWGI2wRU2PP2YCBkqnxA7bmp04m5TR/oVCuf9Ti3HMRjo
	 +sm3y+KvlW7WvcXMIO1kg6q+VYitU9oMcu8T0HiGmUiFkvkhmURS205EWFs1HaeKIXmBu
	 vdD+FBbHGWSQnyjcxh0dcB3R4dPG/m8WOr9jE/0SvRjpQBOM/zML+vnMGTfUiK717LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xBHf1i3knjux7GbC9NcrP8w6x+jKGVeq5oZiew9XRX4=;
	b=yViGUUC4Oxf0iVqkRhccG+jOw88/6/VKmYwWKlEXO2f6rD5ZEbW50M92+2kiX/MlrFoy
	 BL4lCdubZiPcmAly68ud5X7Zlrl6qUzNngPh8xRcnUNYAyMHiBIu/3FCQRsDts9u5nX46
	 Mfny0aYLC34Ap7Qt4tIPv2mD52uiu6K3XRM/6NMBQR6oZIXAB31hxdhqbTkCZT3WAv6KU
	 kCgddCgTa84KiyecaRcQeBlGlcCrWO/ATUftOSi9twECAI7bW1dMneLdiCT/YVrYFg+PH
	 y+5uZOEUHMcLCREaFujaXby6KVQQnpjtmo4f9cxx9+UQKhmJA4kXl3z5yIeiNsNhleA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=NzPGYzfW;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808A2606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 808A2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=NzPGYzfW
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd3310348d2so83172a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792455664; x=1793060464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBHf1i3knjux7GbC9NcrP8w6x+jKGVeq5oZiew9XRX4=;
        b=NzPGYzfW1WBjfwBOavoylb6rkxG7Bh3thkTixKBzQjgIlVPNNWwY+1+lTxDzqnof39
         wjZOxkOkeS76PtLwWa905tk0DoTPgNgw96iFiAmnfmMw3w6WPWkdWe7roBxc0Gl+vbEm
         w0MmkvTkYGhzElelY8ddSq2xdYktSmICX3ovs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455664; x=1793060464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBHf1i3knjux7GbC9NcrP8w6x+jKGVeq5oZiew9XRX4=;
        b=RqfCth+UgJQoZHcJ1y+gi2OJ75jQntJjvAJifMJ59kEymYngifi0hAMn85kRumtePV
         F0BJocarKoz6be3PaIuCfvbteYWm6mZU1br/4GKRvWHldnxtf4iKbYmfXuoVhoaw6BgE
         AUrpGfCQuTCbW2Ze1+T0DVL2XGbfQ1T9aSWA/7oIEy4K52EmW+3C0ZDcmqMUPONYkA1b
         6zswT+ndtawraRhi/H11Y/8+0w9XYMADP16C3jNG+/EioMw/dfbyXqKlRSPsuOIRk3ez
         tIq93qxvYmiqJl9R0Hj9426HjmpTWqIeOOb/MXjR6Gs1tMDfWSZiqe6nfOhXEpln5GBU
         6PqA==
X-Forwarded-Encrypted: i=1; AKwUvBzeU509L2S540ext/DqvZUOyP0EjqOyAoTcZxXxaMNWFJvHKxCGh81RZKaaKztKSinkOyIbN+4Yk8TmVPA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH7IZBGQ8Jm1Jt+4akya/O64Sl6xfUMNeXeYT6SZGpdNqtpbQd
	vSdHbena+TwdDu6SSLoslOiQ6NwnQe+0I3vxAq/EKhOAdMMFP773184h27cQYhDOvYo=
X-Gm-Gg: AYBFou2Vn6JrDscneVWwNfpuEqE5nhAO3+U/kO5vJywC+nOq1/wI3UToh2pPSJNNnS6
	qaCytl6T0csWwvkW2L6TydsMyJ76y1FQ7OcDVUYWY16kSF9nxl3Hz+9dEyy3o4XQHAlkhN5Vaub
	FwXFuAIXgQWVkOmkAjdJzzKdr2JmLY3YLbOJaXI7C6bZsc/B5fyVn9yetWKMrVWafEbmauAIZbV
	FPp9mMesO5O9fyJD1whePtx5x1d3nK3X1kS/ZCv778ZEDBZzpfBAZHcqwCoAZ/nOvKXSPVNbItL
	ummi5MTAnTMDJVbxf/ImeK8tN2h4ClvrMkMMbEQgEbJWMe65GWntwBDeiNtO82BYX2i3IFADh5H
	N3PpdxQqIBzhYCqSvpG1V1WJg2nHoygjpTUxj/MlMuFuJ/MWVllJGHJpYPLlHDvrJBq2F3EiSRA
	4YiX0HcHzpe30ZPruPVGLY1IZotNBwsn+iGKtlAiepq8jfRisRNN+jmTJht5k42AunPAQE1g0rD
	BiXeyadoOzsRRy/2vmVHAPu8Go6d9SrKLLcWQyNbT5EA0Y4oVjGgIw=
X-Received: by 2002:a17:90b:3ec8:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3ad64ba5d2emr378689a91.13.1792455663750;
        Mon, 19 Oct 2026 17:21:03 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d6df89fsm1694273a91.11.2026.10.19.17.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:21:02 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>,
	stable@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net v4 2/2] net: usb: lan78xx: reject short register and statistics transfers
Date: Tue, 20 Oct 2026 08:16:21 +0800
Message-ID: <20261020001621.2920-3-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020001621.2920-1-law.wei.jie@gt.tech.gov.sg>
References: <20261020001621.2920-1-law.wei.jie@gt.tech.gov.sg>
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

lan78xx_read_reg() and lan78xx_read_stats() read from the device into
a freshly kmalloc()ed buffer, but only treat a negative return value
from usb_control_msg() as an error. A device that answers with fewer
bytes than requested leaves part or all of the buffer uninitialized,
and those bytes are then used as the register value or the counters.

Treat a short transfer as -EIO in both helpers. lan78xx_write_reg()
does not use uninitialized data, since it fills its buffer before the
transfer, but make it fail on a short transfer as well, so that all the
register helpers report a partial transfer as an error.

The write path validation was suggested by Andrew.

Found by code review with LLM assistance and reproduced with an
emulated USB device (raw-gadget + dummy_hcd).

Fixes: 55d7de9de6c3 ("Microchip's LAN7800 family USB 2/3 to 10/100/1000 Ethernet device driver")
Cc: stable@vger.kernel.org
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Assisted-by: LLM
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---

Notes:
    This patch depends on the previous one. Without it, a failed statistics
    read would make lan78xx_update_stats() compute the counters from its
    uninitialized on-stack buffer, so the leak would move from the heap to the
    stack. Both patches are Cc: stable and should be backported together.

 drivers/net/usb/lan78xx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index cb8204371f5c..c19df8e80b52 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -612,6 +612,9 @@ static int lan78xx_read_reg(struct lan78xx_net *dev, u32 index, u32 *data)
 			      USB_VENDOR_REQUEST_READ_REGISTER,
 			      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 			      0, index, buf, 4, USB_CTRL_GET_TIMEOUT);
+	if (ret >= 0 && ret != sizeof(*buf))
+		ret = -EIO;
+
 	if (likely(ret >= 0)) {
 		le32_to_cpus(buf);
 		*data = *buf;
@@ -645,6 +648,9 @@ static int lan78xx_write_reg(struct lan78xx_net *dev, u32 index, u32 data)
 			      USB_VENDOR_REQUEST_WRITE_REGISTER,
 			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 			      0, index, buf, 4, USB_CTRL_SET_TIMEOUT);
+	if (ret >= 0 && ret != sizeof(*buf))
+		ret = -EIO;
+
 	if (unlikely(ret < 0) &&
 	    net_ratelimit()) {
 		netdev_warn(dev->net,
@@ -695,6 +701,9 @@ static int lan78xx_read_stats(struct lan78xx_net *dev,
 			      (void *)stats,
 			      sizeof(*stats),
 			      USB_CTRL_SET_TIMEOUT);
+	if (ret >= 0 && ret != sizeof(*stats))
+		ret = -EIO;
+
 	if (likely(ret >= 0)) {
 		src = (u32 *)stats;
 		dst = (u32 *)data;
-- 
2.43.0

