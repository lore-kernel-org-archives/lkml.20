Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394850;
	b=FFhmsUycD1/l8vs/RulRJguBNSaS1pwGoFTsLNFErnrmUuczjRqo9jIf+NtVkkCvVOhB
	 VKlugU0ulewlmtWnjcj0ZQdiHh6aBVxtADkv9RAJ2+QwWR+y8K4uOVgbruOe1ulE0sjpF
	 E43UunC4Gx3oPG90BpD8nqOmvz3MNw26t5MaJ38mzhrIEN3DjXW0MIm0MHx+B6Qk6el5o
	 1YNrgXJ0ron8hH0shMUPu4kz4/4fBaLgKAtQu1P1pAdKkXxhiWNOHDkReW7xj4BrCndwO
	 g4y1RhJE5d5YJCZfoYiX/ed7Z/TBQTeJPSgD8jU/HTB+ZLgTarQPXNOMoQYkAEbvT5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394850;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=zKHpOqN7el/iBi24fQQZSjZZJgwztQp4IyGIqG/dArc=;
	b=XaqWIBkVM8ciPbpv+FFlOKbaEjPyJCS6EDowngjgX5fWPDP/nxTSkyLB+nfs+oeTM9P3
	 q1hRqdLbK9dhxcp+yeyHTy6l2HafSmGEWrFpTsFMPosx8woHdJobHrc52vT2yjXnQrk9D
	 gRMRtzND7zi3xeleeME2E8uustzQwYV38SfDVoxqNscTHge8E4qUdIU18KpCdyQ/BoW4O
	 AAyDxeoIkPAN+IQshuI2V5yQsv+7kjRAxu/tn57XnmSt9l8xJ8U6StiMsOutxnxAcJNuk
	 ivUJYXWuZNcHm+e3yCXCvJlLECHr7YXnxvvEKf8LI3Y3CepmKFGzfz0a1QQ3vq9sdFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DR4mV8qJ;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FE860A260E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42FE860A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DR4mV8qJ
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1021906a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394850; x=1793999650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKHpOqN7el/iBi24fQQZSjZZJgwztQp4IyGIqG/dArc=;
        b=KJOYVp2IAz9Hgy1eSpcKWf3MqgZX9wMlEOW0OGxo4arLsX4YfnnpddHWXjHZ7tAKvs
         MvOhMC/3JBQ646NjemGtkI8Lu4DTxlZ+antpXeJ27Tx7/r7agiKWmNODsn2n8IC73O6a
         +f/GgfAD0e31KTe7WLYYtV2/GtDi1pX3rlpjidxbKqKaaWJNAXnu26+otGyn5koRq4fa
         d21rs/LsdgsPLc0966MiA+br46z/LrjK/1rF/T4BDZvbEAy4Z1DeKij0+KyU3FYRGDvY
         /3OJaQxMiQQInGY/y8+hscNR/lrmCkNABWw02SFiT5jfbzGEYtCcatE124AdyeGWPrmw
         VAFA==
X-Forwarded-Encrypted: i=1; AKwUvBwmsQT7jEZZ2MK30HQF3p6K0EfwGpIH45+SX1Sf72zJmYW1cvcJUlsynfTTGGOXi8xlMmPP9t1h2I/oy70=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN0C2gk2Jc6GkAd1I507xxVU6lU4oKVmeWYbgolQtwXbZ1WSE7
	WqRrVAz7FX5cIcyNkbNWF8odg/1ZAXwIkfwUDXrA35Xe6n6oeUAo6oK0h/vWX1mLp8Xllgt6jA9
	h2f6vg/kz3FQAq7d5ISZN2qotpZwrKM+rdPPayVtomk3JL6pZceLaQOWUBOSxNgW8tGBSRcuXSg
	Oww3IXv0rPFjegiVPOpNg5xOj2J312FC7NzvMOBkEeawMLtv6/L2A2d3TMEqTQl6tZDV7E9XIlz
	k1PRGWy6fJeLP1ilYS33LSK
X-Gm-Gg: AYBFou1TNDPxAmqEYZQKx9yuSFdj1lRSMBxtmauuSVrXYy1L26zFUXQNtocMat0YFGN
	YOPrZ78cvwCXai7aDM5Nq2DYvjiOCNGY2J30+Vaybz28FoD2F2ETKX9nfiReqsPPK9fVgBykfIE
	kwgOHefIAVngU62IBW2WmMOwV/+pyfI0tp0rnu4/dug/orVSdIvN0WkAFH/XHv5XLGdh38/egCz
	Cz4vn8RiVlroHjmFarbu0M/tLimxlJwAt44IuxmRMr91RCaa8rzAIF6T4P1pmKGUS6FsW0fKU9C
	JYJHF4RG+U7i99k1hWIITQuR93TDfVbeq+VaYoZv8hP6yJzjw7zbOinM7zkNoE0JAAxcZHQ4L6H
	9fHUvvrrz0H0YHeiPB311XOhLEmfta1bWC9d4xztgRZTceH6YALAE3rE9NO7uoT+6V5Q+s76/Te
	FLYNiG7ovhNMZS39gwtRB57IneG/AH9Cb5uJ/1J53+
X-Received: by 2002:a17:90b:4cd0:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3ae8974b76dmr2857222a91.29.1793394849663;
        Fri, 30 Oct 2026 14:14:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e6ec859sm4915961a91.2.2026.10.30.14.14.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:14:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so2632074eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394847; x=1793999647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKHpOqN7el/iBi24fQQZSjZZJgwztQp4IyGIqG/dArc=;
        b=DR4mV8qJMSeJDZ3qq9Ms4AdH8Q+L1avjwBLElIDMO1gwRjWj63T6jBd9Gzuzph5aTw
         p37//7vumb8T6Q3XyTTBYCkiliQwVdh9Uo0hH9708gy5MpEIKq42ldM7/pzPQDNYh4Pq
         KylEGz5WRerDSmAvgffZp+ZSXN9dF4YOvHNzA=
X-Forwarded-Encrypted: i=1; AKwUvBwILcwL58jx7z8Nl8aEzyJbaiSxqLuZA4JJiR5m22Z5tmpM8KVkoYliGv5zBcs4wtLOf/KfZEzExFnH6Fs=@vger.kernel.org
X-Received: by 2002:a05:7300:7f95:b0:35d:eafd:5737 with SMTP id 5a478bee46e88-36a423bec77mr7348008eec.22.1793394846865;
        Fri, 30 Oct 2026 14:14:06 -0700 (PDT)
X-Received: by 2002:a05:7300:7f95:b0:35d:eafd:5737 with SMTP id 5a478bee46e88-36a423bec77mr7347949eec.22.1793394846227;
        Fri, 30 Oct 2026 14:14:06 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm10574595eec.3.2026.10.30.14.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:14:05 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netde@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	netdev@vger.kernel.org (open list:BROADCOM B53/SF2 ETHERNET SWITCH DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 5/8] net: dsa: b53: use the correct override register 2 Gbps bit
Date: Fri, 30 Oct 2026 14:13:47 -0700
Message-ID: <20261030211350.287566-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030211350.287566-1-florian.fainelli@broadcom.com>
References: <20261030211350.287566-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The IMP and per-port GMII override registers swap the override-enable and 2
Gbps speed bits. Using the IMP speed bit on a GMII port clears its override
enable and leaves any previous 2 Gbps selection intact. Select the speed
bit alongside the register and enable bit so lower speeds clear the correct
bit and 2 Gbps sets it.

Fixes: b6a8a5477fe9 ("net: dsa: b53: fix resetting speed and pause on forced link")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 378f47e7250c..75033b28100e 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1370,17 +1370,19 @@ static void b53_force_port_config(struct b53_device *dev, int port,
 				  int speed, int duplex,
 				  bool tx_pause, bool rx_pause)
 {
-	u8 reg, val, off;
+	u8 reg, val, off, speed2000;
 
 	/* Override the port settings */
 	if (port == dev->imp_port) {
 		off = B53_PORT_OVERRIDE_CTRL;
 		val = PORT_OVERRIDE_EN;
+		speed2000 = PORT_OVERRIDE_SPEED_2000M;
 	} else if (is5325(dev)) {
 		return;
 	} else {
 		off = B53_GMII_PORT_OVERRIDE_CTRL(port);
 		val = GMII_PO_EN;
+		speed2000 = GMII_PO_SPEED_2000M;
 	}
 
 	b53_read8(dev, B53_CTRL_PAGE, off, &reg);
@@ -1392,11 +1394,11 @@ static void b53_force_port_config(struct b53_device *dev, int port,
 
 	reg &= ~(0x3 << GMII_PO_SPEED_S);
 	if (is5301x(dev) || is58xx(dev))
-		reg &= ~PORT_OVERRIDE_SPEED_2000M;
+		reg &= ~speed2000;
 
 	switch (speed) {
 	case 2000:
-		reg |= PORT_OVERRIDE_SPEED_2000M;
+		reg |= speed2000;
 		fallthrough;
 	case SPEED_1000:
 		reg |= PORT_OVERRIDE_SPEED_1000M;
-- 
2.53.0

