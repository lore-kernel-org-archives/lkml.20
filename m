Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140335;
	b=TOhFPLerH80h3v8PVdH6eJkHcO0mYKFmbwjA3PLSt7OUF9MbkZcC/EeCOSUkfOM98IuV
	 aLf/4OB97xFI6iR7nXqdnDf+zH0G/IOm0I0b/+BZXTI1mh10BGsFfJ6L1ypyYKytMTWIG
	 ZvqIbm7FQzqZ7IE1uROMA96nqzPaaSmKnEYJ70XJt4p565UYN5PQDUMhTk0xWkbMUFiLb
	 3+XmkO/TNogSJGCgYd3not9tv0ab3nM5+9JEE1w5FGlKzJGDijYo3aTQkIrXukJ4PZDfG
	 VUpBX/+uVTYWphXIuf7qc8hDx5js1o0lz3lkPbLAwGqxPW+hdvDuGYu3KrZxSWs420w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HZPyG3s7DWLnksXjw7x8gzIGPWb9n7MYHVZSQ0mRqaw=;
	b=uRHM8cfYA9KseAN7/tl/WOhrDczHnRqamN8VcF8dPqkIKuSodJ4N4lcNt//uAP9NO8KP
	 55M17md5xHrhmYK3rz7Qrwc0BB8i1B5RhJr8dPcZOCl76oVE/Sda9crBMi6wdTMdy2lb7
	 aPBFDPSdqd2tk/GiiRENG4ySNFfTqx8GStcaalfBYXJNx+s+tSrX/axSN9s+uGoamMWKT
	 yGJChEVWC9pO9X13+XJ87dosHoJpdwujzPLxAKtV4secpLnz8J3/+9Bquoo3WOeFlOzKS
	 UNN9jpWkofnmQ586zxeU+CffwZtXPK635DPusGhju7fMEtjHrrkcugRAnhlcwxWGcxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qAVhB1Mz;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E42C60A382E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E42C60A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qAVhB1Mz
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so404889c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140334; x=1793745134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZPyG3s7DWLnksXjw7x8gzIGPWb9n7MYHVZSQ0mRqaw=;
        b=qAVhB1MzvHea3AWoyYZcyCmQVJyz7UeIExsB/xBQwQlkQ9UVMFArnoqF39ubNHR3yE
         yf1W58qP8T4lPxx4NlU946vJ7T9C0UJ051quCX5hE7oJ7fxtO8c0QacTIfDsk3TCy2bi
         jBApGV/866kvZK4ErtSAs5Tz8XI+3fr5DsviLTZ7NE6cEcafOAWKmQ8rt+iYUGRFuAtr
         MLN+G9rF4QGIGiNhxd7ge+bYOGRgRbiVF8uH4W5oxdgxIhC4lbadjAz1tYpUkBRle+Ra
         J8WNoSEH+DyiG32LLksgIzxVrgZ9bfdE3Vj29U40J9fBXEklqtiSG72znIAOl1mZ/CCE
         ojIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140334; x=1793745134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZPyG3s7DWLnksXjw7x8gzIGPWb9n7MYHVZSQ0mRqaw=;
        b=sR5ipdK8REWJeq722Fu+g/vD9DuQJgylHXZ8gLGFscNRSxiZ2UwgYmy2oHYn1AfbRy
         f5fK9toPd1HdgHoUevUor1yhxq2D4ahYrSQQHHfBnlopedan2FpyQbXtXBdFrWeNYfnL
         rxlhN8uziUV4aInSkpBQpmi54CDML+9PjqIFJNC8x+4qJJjoCQbAA12Dd1qM01VmNXHg
         d7389105EkvwU5K5Gp7vpUSG3l02XO5nAWQa7M5qDvCj7K3cTOAZjcmqJrnwKmbpNE/W
         QxPM7dPcNFs69p1eiyjwlYG0zRGmozpF2LxjozxVNc93qNmETc6seH8njPy9BOOl3660
         4Mlg==
X-Forwarded-Encrypted: i=1; AKwUvBx3ueErHNRkEpsbZHnBckZxl4e+tt+LFpsUofw32AdsZl5CoCLzvtZgvwnrWQtE71QBLXVqShB9DZBoYrI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9aQ3vvxaPncXFWU7YwvVfbkoedHddciuVHXCiT4CWhsGfOtTd
	yZDmGwzB0mh2NV2wt+pITU2uh4pHwckP89VhfSpuiBsmOh1F590g8Hx0laTjLbYS
X-Gm-Gg: AYBFou1A3YG4w5WeIWq+mfHqqfAcD6wwvp7vRfX9PoNHN7mW7wZ63zJkWUP43rDUC/J
	5RWKCCGi4DEWC+XWYFLI6/uwwqR3VSjchcsxDNqZ7GzMIfMNzJhnBziEIXLgNpzq3WiOn8Gg1R4
	B1sSGucAGaxWv62ZnCPJ9YFBRwkVv27ACZ5VMLWAxnlaZGV/2wcoi+5DkSkbkOoFrPoArm4SHCY
	8S4JKYKJSJ7htaqY5Wu6IJs0k3AwuEULHQD4YIregyEEwFQIiX9eeGwc1t7/+CWoZZZ1ZnZSVen
	/nkgbMhBmLYm51d0JhIUEKgMa3RV+FBWaYryF89OdAG/h+K0a/UDy/p/uMpt/hlDs+DZRps5UNP
	p6oJ/7fHD3LQlg5C1P/jWIQ5UxzbtTlN873A/KDRxzBsSlhttz8+A1IGAFXpQOSDmkgoDt5pOyj
	pRb83uN9R0Q9yDJi71XCGHfPseV6g54WdWQmUkkVeCd3Bq14L6sMsN2zrOU8HGorOa1dhFx2Yw4
	214ISgGoKgy3CoHmwkTxha6gNBbMhqbq379eIqdf8A4oXBwHUD9yauu7qhT7mwoukObhRBbIDX4
	dujP1fToNhGpWCQrNdkwCJAKIZxCLZfdKUi0jV+KM7qcTyXDSjq6SwRX
X-Received: by 2002:a05:701b:4288:10b0:14e:d0ba:7569 with SMTP id a92af1059eb24-1a6c9cdae05mr791294c88.6.1793140334001;
        Tue, 27 Oct 2026 15:32:14 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d98c93d7sm1130735c88.13.2026.10.27.15.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:32:13 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Jeff Garzik <jeff@garzik.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net 10/11] net: au1000: keep the MAC stopped until the PHY link is ready
Date: Tue, 27 Oct 2026 15:31:39 -0700
Message-ID: <20261027223140.3774570-11-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027223140.3774570-1-f.fainelli@gmail.com>
References: <20261027223140.3774570-1-f.fainelli@gmail.com>
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

phy_stop() powers down the PHY when the interface is closed. The driver
leaves MAC receive/transmit enabled on link-down and enables them again
during initialization before resuming the PHY. The MTX-1 can hang when
the MAC runs while its MII clocks are absent or still recovering.

Start the PHY before initializing the MAC, but leave receive/transmit
stopped while the PHY reports no link. The duplex update enables them
when the link comes up. Stop the MAC in the link-down callback before
phylib suspends the PHY, and stop the PHY if MAC initialization fails.

Fixes: be9dad1f9f26 ("net: phy: suspend phydev when going to HALTED")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 8c2dbf72652e..c616ce616541 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -458,7 +458,8 @@ au1000_adjust_link(struct net_device *dev)
 		/* link state changed */
 
 		if (!phydev->link) {
-			/* link went down */
+			/* Stop the MAC before the PHY can remove its clocks. */
+			au1000_hard_stop(dev);
 			aup->old_speed = 0;
 			aup->old_duplex = -1;
 		}
@@ -727,7 +728,7 @@ static int au1000_init(struct net_device *dev)
 
 	wmb(); /* drain writebuffer */
 
-	control = MAC_RX_ENABLE | MAC_TX_ENABLE;
+	control = 0;
 #ifndef CONFIG_CPU_LITTLE_ENDIAN
 	control |= MAC_BIG_ENDIAN;
 #endif
@@ -740,6 +741,10 @@ static int au1000_init(struct net_device *dev)
 		control |= MAC_FULL_DUPLEX;
 	}
 
+	/* The PHY may still be restoring its MII clocks after resume. */
+	if (!dev->phydev || dev->phydev->link)
+		control |= MAC_RX_ENABLE | MAC_TX_ENABLE;
+
 	writel(control, &aup->mac->control);
 	writel(0x8100, &aup->mac->vlan1_tag); /* activate vlan support */
 	wmb(); /* drain writebuffer */
@@ -928,16 +933,18 @@ static int au1000_open(struct net_device *dev)
 		return retval;
 	}
 
+	if (dev->phydev)
+		phy_start(dev->phydev);
+
 	retval = au1000_init(dev);
 	if (retval) {
 		netdev_err(dev, "error in au1000_init\n");
+		if (dev->phydev)
+			phy_stop(dev->phydev);
 		free_irq(dev->irq, dev);
 		return retval;
 	}
 
-	if (dev->phydev)
-		phy_start(dev->phydev);
-
 	netif_start_queue(dev);
 
 	netif_dbg(aup, drv, dev, "open: Initialization done.\n");
-- 
2.53.0

