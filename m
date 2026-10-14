Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0822F3BB126
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946581; cv=none; b=VP4y3zeKtCBMOYU2ulCp39Gpj3veynuwV+4jGZVufLYRtdq4SMtfU9U0PRAzGs6E+Z6KI5toVSPngn7GruqXGKJ2ELqDtDmkikQ4b5E35n2Px/+Mg7U2RD4OMBkVmAEiEmF+Ayt6Rh/uEZFt1YMrj/kZBUSTeH1nAPZQ4ZlXnvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946581; c=relaxed/simple;
	bh=xlvNzdBEDkNjZ4017cocaTCfcKs9/ceIgmy0m9FwRY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMPxynu8aZEfpefhxWacqnO/tfPjBekpd2W+a2BeahW5qnmAgytUxoBDDSxvvM+BItb4Xk0ElgrdV3azVlZF76RUn6xZWQviOAD28ETWxSrtftxo8aUNHvWmmWkfGO4bmt1oePk6sgdktOinbXarOCMOrJgsD8w6KHQ55kNdRGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=YAtnaBc3; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="YAtnaBc3"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15168a20b47so2349099c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1791946579; x=1792551379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOt/1BdDYxiMzENqA6TOzLT/rpB6ssuySkd04haqJTY=;
        b=YAtnaBc3Vm3KfG/62r7tE+qpsXEnCF7hvvHeicYJh6Lx7ADnU9Z7sxScRtY3vsNR0Q
         Z9lTZFs+EhUcYo4EHeUMiCu55eBnZ+B3GDA1mWHhe9FpA4LBubsZvcaLneJi34TuBEdN
         f8c3upHfsyoqrebEAPZOb7388SYf3LoKsJQbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791946579; x=1792551379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eOt/1BdDYxiMzENqA6TOzLT/rpB6ssuySkd04haqJTY=;
        b=tivy+t3mTcEZ1OpeWfDgVSACtZv59WSA5cK7xdvnMmnOr96r7O9UDoQHq8Je8JEDED
         ovg+0WuTDo7suZCL3HKWJtvpnsiBS+58XnGpNJFP66Xo8aVr5QtqOKAQrY48Whe6TUm+
         IZ8K2wW8LKnO3ic6QCk9/xzDijO909kD4Hq8XciAOaeD2kIvd1CSGDAMiivTmCMmuMar
         GGnPyxiRg75gjVNr82OYOZPnNP4XkWUWVUA543SeaLNNS7Tns1LP3tvvyYpoH3NjI8sv
         /DkYdaU1DrXHEBxbtNagI5Uj8Z5r/vagniQkRZ9JlxkEhWaZiKRQy9Heuuc91RDjOhrv
         9c2A==
X-Forwarded-Encrypted: i=1; AKwUvBxTpSpC/aDMPsasGaKs/9LrXQYzmYDmIlN1UyaInfumINOISV136dn3F8AYBELyUefnit8rLX5gzuUb5Mc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIx+0c+nSK8tOk+CJGsOIkqjCOtjHGoYGV+d4UJ+V2hOSLEnP9A
	qVnr4kPlbOp5sHQjlApXuZ3ZAWggsBq95FLYzwZiE7qot2sd/RrtnhsQbOYeldz0xDY=
X-Gm-Gg: AYBFou19/MVfbme9PPz58AgZJFXLxFJ9d+yOK5GBA6FZzx5PWXDeyzgea3C1FCcl0F0
	xFbMKBkaWXqX3AZQyhpR9CatZoJqP4IOnkL67d5pm68skS5gbNTx85tUnoabLwTDipthZguK3Hs
	B/3PmhJ7PtObtANi9pgc8DLSY2UCbwMmVJ4awmDZAlHQcshlni+DFeRJHSH2k8Dp+ZuJQjRtBTx
	T5XEIgFgGDLAXi+cwZmODuoPGiTeHy1Ds5BMOEQhya5eMiPA3MSxVg+JbAimDUzMRD0mVYW9iEm
	y/IxfI40U/fclIwR45/zpE7YDGaRTiCDQrwz5E1CwITBvGnrGkr07xUmZ45CFZADjY+foET0yLS
	r1nRBF34DThN2kArZZiQG12nEi57+ghVd+jcqJ24geq8SC4cgYJFiX/jdpuuOIkiflJhSWYI9rD
	PJ67ODUkHu0X/HtpzuYmJ+eorN3Awr1WWNtghDtNqxupDyV+FHfrzDALouBzZMX53AmnmahG0Z5
	HnSD0Tgh/LY/6KMLxgpr7JlOgctx/DDBhgvqg==
X-Received: by 2002:a05:7022:7e0e:b0:143:72b1:9004 with SMTP id a92af1059eb24-16a61d5c336mr20362920c88.45.1791946578956;
        Tue, 13 Oct 2026 19:56:18 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm2122640c88.6.2026.10.13.19.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:56:18 -0700 (PDT)
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
	stable@vger.kernel.org
Subject: [PATCH net 2/2] net: usb: lan78xx: reject short register and statistics reads
Date: Wed, 14 Oct 2026 10:56:02 +0800
Message-ID: <20261014025602.26334-3-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014025602.26334-1-law.wei.jie@gt.tech.gov.sg>
References: <20261014025602.26334-1-law.wei.jie@gt.tech.gov.sg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lan78xx_read_reg() and lan78xx_read_stats() read from the device into
a freshly kmalloc()ed buffer, but only treat a negative return value
from usb_control_msg() as an error. A device that answers with fewer
bytes than requested leaves part or all of the buffer uninitialized,
and those bytes are then used as the register value or the counters.

With an emulated device on a kernel booted with init_on_alloc=0:

- A zero-length reply to the statistics request makes ethtool -S, which
  needs no privileges, report the stale contents of the kmalloc-192
  buffer. One counter pair read back as 0xffffffff8a427800, the
  address of usb_api_blocking_completion(), next to several direct
  map pointers.

- A zero-length reply to the RX_ADDRL/RX_ADDRH reads in
  lan78xx_init_mac_address() turns uninitialized heap memory into the
  MAC address (12:85:1f:dc:2e:bd and e6:93:44:41:9b:9f on two probes),
  which is then written back to the device in RX_ADDRL/RX_ADDRH and
  MAF_LO(0)/MAF_HI(0).

Treat a short transfer as -EIO in both helpers. With this change the
same device fails to probe with -EIO, and with only the statistics
reply cut short all counters stay zero.

Found by code review with LLM assistance and reproduced with an
emulated USB device (raw-gadget + dummy_hcd).

Fixes: 55d7de9de6c3 ("Microchip's LAN7800 family USB 2/3 to 10/100/1000 Ethernet device driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---
 drivers/net/usb/lan78xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index cb8204371f5c..e6be066349de 100644
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
@@ -695,6 +698,9 @@ static int lan78xx_read_stats(struct lan78xx_net *dev,
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

