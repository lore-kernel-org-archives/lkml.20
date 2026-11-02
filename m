Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793653914;
	b=oMreLGtyN3vVPF2o0gJGu9TO7pfU1AtiiOleuoc8wMC1WLaiRpucTVQd+lWtQ2Ga7b1+
	 GuM8LP10vGeuNif2T1lVjdNnLEeYFSKbb/JRcVzOUvJFiV4c+TEyTK6l1zZlssE+KUm0a
	 SisB2Bg71k6tB+vlJ3RaxxMAD4RmhxJbTKocpsgyQTnVXgJEZkOiY8ayKxswJA9X8o75K
	 OCM/+UN33Qm/qRlqsYJxjnv76aXSNmo6vZhwY0uS5kZSw22Cr0v6lPT2K7+7LvTgpPvCA
	 7LnM7oobH66IVTU0Gi2N35vxYl0aOO76d8JBrdxnk87bxD0uqZdT/Ao6Z9BDvCiqZDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zp0V6uq9cSdHG3OMQtcSrfjn66ui+Jf9Vm1BV0hp92U=;
	b=wkiFAUuBFlJjN9ctO4cAiJmYmJ/RbHW550jj3NtGJ4IFutkEtvI5t+C+rm0X9A97NbZ4
	 HfregK2xFEV5Wjc/7iv5SGAbVjiXVT4koHEgN6bnVNcfADZclQ7w2FI28Ih0CC8Yr+nl6
	 l2LQyLivtuCCg9+a9UYzzvFfBDhVbA2DSneSEYMdBixXNo1WYdjdOJhaafEyzIuRO2d6p
	 x/If8PGfR3Ii0PGY4O1ftUVD3sF6PaxtfTcYfn+3d4Mv5YbBm9k2UROxIN16nWjf/YyP5
	 VOsBMbvdEkh6VA+CY+9cmj0vnD8q4W1IN16Lig57kGQA2k/xG6QW8vpTDNQ7j5C8CEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pw7n9TV3;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1882F606D802
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1882F606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pw7n9TV3
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e0d1da913so47841f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793653912; x=1794258712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zp0V6uq9cSdHG3OMQtcSrfjn66ui+Jf9Vm1BV0hp92U=;
        b=pw7n9TV3hXbr93+QK6KCZ4NiaMlSC9VR2NTKxZ2G0KbF5cf0GwPv6+wTsD2HFv5pVF
         41/qrKMfz9jKsmJZ8B6zEoboqIokpkDk4hzu+vBELk2zJJ+itarOLBYTqepkoemmJL6Y
         +s3X6mqVytQDAU3hRx4MntWocJJazcWWDfg1ze9l8hGMJhPRDsb9ghwED4Tqp47s4Yvl
         5q+5uXdv+U2UtaXe5/+l3LWdkvL+on2ieWX92QKKxz0PGib0vx5UxbXbc/kOtIg/2NZf
         r05xepgHxRbEPNpzHdkgCorevDEHFHAZbZlqVZ5Y50/PKFcyBOVIggBydWpyBRWzYQ/c
         lWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793653912; x=1794258712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zp0V6uq9cSdHG3OMQtcSrfjn66ui+Jf9Vm1BV0hp92U=;
        b=Krtt33AWytERJmcyUrynEfZqmwifyGlMnAhcMl0wbxz61tNONz/AcFtU1d5/I6VAih
         28cuzi7xcIOdJFeNNKunLXycFxPrlyCAr31p/ekJGmQ+DonprfJXvl9LL8sd9zyomnlM
         bUex8U3WsC/1rmixk/LEGpLICvoqy7wKd/bTmA+9mZ+7WH4+Pxbc1aUSc+ao22af4111
         3VC1PJhcXRczsGnr4fe9Qx7FAXvKWgNo/TncxWGQ2tZ3/dqDML5nsdo7tfurvKS/bd3q
         GTeP5BdboUzT0UxRl0/GCiCPysNWOg7mX2qks7U3MDPUcUkNWRDa9HhQJ/h0O5Q4IAd2
         8m9Q==
X-Forwarded-Encrypted: i=1; AKwUvByFAP+fjmEH3zpHxP0VB8ZnwY1dn0HRo5pEo5ygF4EsMUE9BxgxXhY1wMJVIYpTln32KB6LRW1LkPLfebI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SHWzMrDGk12zY2/jXKz1Jq+nDPPXP77pwYgG2KXNOa7TglmLW
	lItvUnZQQlzGayf7DlmysLKM9NhwW33souKO4ltfcYNoD2nxKGdklsk+
X-Gm-Gg: AYBFou0Qyl6/6D4JIgHTIrtU1ibdcndoFSvzAbkryfqCaetQmQFY/qw6YJqjXr7yIx0
	NVjKwFs7KB9CLbro+yYP3jld6qG+Gc7xz2Yg80iQtiTSU4SZTLitG5YOWGUm6nQ6IDcb7VA0RnO
	5mqi1+okYep4gUSV8WDSlx0BNHxdqAiDLw7Z/UyDCvkzkoUgLapvoCY8fOXUz4wTzlhdp6WnTn4
	aNt9L+uBUYEoVuPvH1xvydB/Y6tr8mEBkj2GBlO0OI+1tpyIraMbZGeNP+oR8kJ74CiCLr/Qwm9
	OAu0m/jy2PtFOBsljUswap1yKhhHqmzBqTSYOaGjTSM7+58XEKJD1zCUsezXf7w9Jl8KNPBlmsR
	aymBIpdYGGOpfWie7GVOIzQ64Vm7IRwbsC+rXmwNvq+ywjnDPYxnD1UBhHEN5p2yyRkpu7U8F9j
	9WgtrgNsb4II3tAQKOdFcFhfHxcaWSkdffkonZENadqRvBMqzmzC3NELDdxBkwswFBwADiURUET
	5HjAVZDI2fRzUaVmlEMiJrHhpxID6EluqDEDE36MjEaz7PThf5q5oQMAHhgeoHjQMBEdx8cOux1
	0qECWPkTReAYKaCck3adLij1ZVGpRIoD1qGs3zxgUWcI9fQtBn/YXJxX1G6hWigB+e/OzVwU0g=
	=
X-Received: by 2002:a5d:584e:0:b0:48e:6669:fefb with SMTP id ffacd0b85a97d-48e6e2e2369mr26875294f8f.22.1793653912530;
        Mon, 02 Nov 2026 13:11:52 -0800 (PST)
Received: from fedora.fritz.box ([93.93.22.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm21535520f8f.9.2026.11.02.13.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:11:52 -0800 (PST)
From: Stefano Munari <stefanomunari.sm@gmail.com>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>
Cc: UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3] net: usb: lan78xx: fix error handling in lan78xx_open()
Date: Mon,  2 Nov 2026 22:11:19 +0100
Message-ID: <20261102211119.8738-1-stefanomunari.sm@gmail.com>
X-Mailer: git-send-email 2.55.0
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

A failed interrupt URB submission leaves NAPI enabled and EVENT_DEV_OPEN
set. A subsequent open enables NAPI again, triggering BUG_ON() in
napi_enable().

Clear EVENT_DEV_OPEN and disable NAPI on the submission error path.

Reproduced using failslab on a Raspberry Pi 3 Model B+ (LAN7515).
With the fix, the injected allocation failure returns -ENOMEM and a
subsequent open succeeds. Verified connectivity with ping and SSH.

Signed-off-by: Stefano Munari <stefanomunari.sm@gmail.com>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
---
v3:
- Target net-next and drop the Fixes tag as requested by Andrew.
v2: https://lore.kernel.org/netdev/20261020202614.30277-1-stefanomunari.sm@gmail.com
- Move cleanup code to err_napi unwind label as suggested by Nicolai.
- Add Nicolai's Reviewed-by tag.
v1: https://lore.kernel.org/netdev/20261016000521.92868-1-stefanomunari.sm@gmail.com
---
 drivers/net/usb/lan78xx.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 181e8c087..d73002b2c 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -3497,17 +3497,20 @@ static int lan78xx_open(struct net_device *net)
 		if (ret < 0) {
 			netif_err(dev, ifup, dev->net,
 				  "intr submit %d\n", ret);
-			goto done;
+			goto err_napi;
 		}
 	}
 
 	phylink_start(dev->phylink);
-
-done:
 	mutex_unlock(&dev->dev_mutex);
 
-	if (ret < 0)
-		usb_autopm_put_interface(dev->intf);
+	return 0;
+
+err_napi:
+	clear_bit(EVENT_DEV_OPEN, &dev->flags);
+	napi_disable(&dev->napi);
+	mutex_unlock(&dev->dev_mutex);
+	usb_autopm_put_interface(dev->intf);
 
 	return ret;
 }
-- 
2.55.0

