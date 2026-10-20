Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792527991;
	b=QJucrWVy6f7j2Q3Q9pDYJaks4pFx/BmtA8jnGNKRAfpBk9JO+hWq49tGL+02r5NLNR/a
	 5ss5dAIDCToXuxm3fO6qVpK9CNFycw2YGb3dmYlRwFmkMjI7N+L81UkN/ct1kuvgAogX5
	 QmXOpD9giRL+GluURb3kc/qCt01qu+t4IAzZQ0b8iYaAZ5Th/LQsyHnCu9NgkVV3/MmFu
	 xZmdhNNkBP1Jjv6M2cwm5CmCC0iLoVRLcF0FwybXlKpgkdY88eiVnq5m/CNmCO4oPEFN3
	 0zngUKZGhb+XRJrTCHnABzY/7Y/7PuMeOcJ2kNFxFMRHaS+Q9IZxl0hhS97vGxdRcBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8rjUyibfg+Fb7pOHgHKUgkDL1wyDBRIdMXVrklMIh2M=;
	b=0BKkp0MliydSyhIMk7trpA59qTQn868586kZ13Pyhfe/1oeTPTYKnGjEBKGn5gpjdumZ
	 Er9z8na5jH8v+2ZUw6eRragAzOyBrvwUznZwugc2vFuuJtQvLKz1j1r9POWggu/GtBHEl
	 RvovVgIEkTuWfsLRiilYsQLRV/JjVK8VjJHjYUdZ5+nbWMBYQB5VIx1qHzq4eU5PKujqd
	 NTdCuTxdFWm7VsA3QUwqMPHd22kWWox/sfTJ/l2o8KmE1CL1KItIzeuc1pOkGSsQ9OtRn
	 yb0GW/Ermf1J/dd4SLym9/sEFkoH92UfKiHLmCJyrrXlAfoXi4yx7DMkCC0h7ZqkzZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bDUhniMC;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589B5606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 589B5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bDUhniMC
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so116105e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792527990; x=1793132790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8rjUyibfg+Fb7pOHgHKUgkDL1wyDBRIdMXVrklMIh2M=;
        b=bDUhniMCk9VaZC4P1e4MZBeS6+Mf8v0Sfn6gz2lsOALe/xTYJoG+zRD7x2K1Tx3y0c
         DBi8h+nl+wyqK0cPe3qZ7MdZ/zOiAY28657CYzVbqx6qF7LD1nzMsW+f+OkXQX9OvOF3
         ZDJdyqZn85WM4iAcmESXI6neuaweZObtgil420tlRBF0GdqIAkTxWXbpVi1oWVRWv3z0
         iUPjDYf2oPi9Q+jaVczM/Fj90W2Sgt9kfyRZQ2TVFd6hoSx/wxdZ+xV+cZlnsvncliyH
         57pN6grjm1VMgQJKPYecqVj1eRSVjItnQtayxZiKxmFwhM/rZecOCkCahPUgzhMAZuFQ
         WZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792527990; x=1793132790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rjUyibfg+Fb7pOHgHKUgkDL1wyDBRIdMXVrklMIh2M=;
        b=EcuVAl7LsObfowgi/YyF4oyYOCRAy1f3JLkFuSTINRKLWzpCbt/pzkwKWYi7DByaw/
         VmubZR0D/uNRGExA9XJjHbBF9kmYKnE9FWCKnLEfgObRpeQ02Wn5Em6p/8RTS8bIzc1d
         cIQQ8zjpzHSEMobQADuS9e6cao1r86B3+xIcp6vxgDxJ0eCvLpz3+ysopITaElstSAEw
         R6WIOB++Z16KzemGNtwgg7Ki7ePsR/vF2d0UaNo0oqbdBsKv1ZuSpR0n6Yfi/oX1Ohn6
         S8854QfVSUOpDzHKGncYGgQgvDSrrKqyshvxnsuTxzSLeFZ1C1p596DpjCLGPO+Qarmb
         q4Nw==
X-Forwarded-Encrypted: i=1; AKwUvBzTT00ZBNpTxMEVDCM1D/Y87I3EJYTeXQleRUNmEQ9SMGMr5bVd91DLwLJ9BXBfvchERjYHadsZT6tTnMw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl+vGa/HzgcSPW9jlYrz7gmD3Ex0z+jj4gujYndtthGxORKc/y
	Ld1rFPVvLLMIyfP09oELHMWOuuZtShWGKleFNMzf+eFI9Jajcyal9S5+
X-Gm-Gg: AYBFou3cPgAh6dKVGTd9PuiM69yI3Imp+p27g2cryKA2wjGOBel0HKGjXnSmRTm9iBF
	Uc2csWM2k20INrRvbOfbOj4yF+lsR7obJYwKQzUnmQpemkCKAoh6k5mFM9xpq+9H9x61Ds6Gz2D
	yA49a3WAkz/DeO9jpC9DAL/0h1QCHfB4JHiunexVCK+fA1N2K45Mik9ZXshcC9YAscSLZoIIBUi
	hwMDqnjtD0VpTQgdM4h0eQinYvQA4gGtFajnejWVn/Kd9sKprSUAS1Ol+ab1tsJJrZekX8G6jmy
	ae7qi8bfNdlESdev3mBESo/q4XCVyFOgm9gnntgQZN9Mo4A5bgYq/4KiHt01XtHI2BNrJlK3ihA
	vpLv74Ja5UJzZlGAIe4R5kmMf0s5ym0AHTEO4V+bdJ1qOzHjTV4vpSWQRcx2avAviUAR+1PwR7p
	Sa26jgiL4HoNsOkPHJBGDPXwbhESi4L+CPqOXF9JR9bcKAOheYdbqTeBbZWiWTGgEUCbVGGf3N6
	E137+1+LHSq/olHpTWMF4C73WM/7w/wPRioR3fBD08=
X-Received: by 2002:a05:600c:3f06:b0:4a1:7ba9:da2c with SMTP id 5b1f17b1804b1-4a1d760f7b9mr257835365e9.25.1792527989648;
        Tue, 20 Oct 2026 13:26:29 -0700 (PDT)
Received: from fedora.fritz.box ([93.93.22.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d699dasm104991895e9.12.2026.10.20.13.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:26:29 -0700 (PDT)
From: Stefano Munari <stefanomunari.sm@gmail.com>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>
Cc: UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net: usb: lan78xx: fix error handling in lan78xx_open()
Date: Tue, 20 Oct 2026 22:26:14 +0200
Message-ID: <20261020202614.30277-1-stefanomunari.sm@gmail.com>
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

Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved PHY and MAC management")
Signed-off-by: Stefano Munari <stefanomunari.sm@gmail.com>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
---
Changes in v2:
- Move cleanup code in err_napi unwind label as suggested by Nicolai.
- Add Nicolai's Reviewed-by tag.

v1: https://lore.kernel.org/netdev/20261016000521.92868-1-stefanomunari.sm@gmail.com
---
 drivers/net/usb/lan78xx.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 5655941f1478..2fd1fd0cd565 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -3484,17 +3484,20 @@ static int lan78xx_open(struct net_device *net)
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

