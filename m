Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354331;
	b=y52q+gxsAGu7VtHf1gZPjXNbAz/vFK+BGjYUipcu1DykDRY5QvfzWzuOY0BAOGPEHnop
	 YImOJ5Fb2KI2AFTSZKkmLPMXqQWZG/RDRxlcLWKtNYO/SqCDc0GTB80Lejnl9KOUuSGck
	 5LR/0K9umzETHCD+jdajv/z4Xja8S3KN959lC+B4+kHYRzoNjq5LLzmUBC1F0hZiYe3RB
	 f6V/JkQf0IYsL3Aosv6XuW9WVoqCk8KwOBIjQ9IXQGrTbmcLEb/RmHce3MH6k52Y8cPUg
	 38DHNELyMo+UlxJ+a5cZQvTbrtrgI7AfVTkQU4eXLEQ7a242izx2iDpbfZYeINndGEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8f/qN8yAC8+iTxgP9ikdx8LsPCCF4I+j0HVDju2YBDI=;
	b=UU0RABLYnelGQqcbERXpyxI5JvNHrtnE/nhN0DAvgxunoUyREc/R0nxj612oNZFAwAdq
	 JACwKTY9E6LS0OP18Dy3N13S46Y52RkQgRIswFsVBS8RxFosvcZzm1Br+To/7+oP6Zwg/
	 2FSSvszsOZV3gp5fqXisroZpwAkllhDwcCk74+ja5gUHrAaFgsBToy50y//u8UeCM5Ko2
	 l7PT1A9WU3egAXYbzE867atPiesXeIHwafmiQrQY0LVxCuaWdMwPyOi2xLXVLgpNgu7Cc
	 M9E2glrgiLrJTkv3QVG/eX1nX3WSRuq6YcSCRK2AKjf2FJhK8dGGkO29Jeo2hukOW0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O50OpKyp;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E513606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E513606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O50OpKyp
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3acec6677so4056542c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794354329; x=1794959129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8f/qN8yAC8+iTxgP9ikdx8LsPCCF4I+j0HVDju2YBDI=;
        b=O50OpKypaUE+KMuX+D1C242+pyYHwfxQt45uMVYwEQykjWryvEfKbRcEBROXG5HxQN
         SozfFFIgaiHRFPHJmrKL4SsJ1a3OeLNhvZ5yTzR56kaymuax4zPHuT+qseQ5QidzXV0G
         P5qlJn1UgG9aOci/JIXjZ3h/RhiaTOIuiSpqPD0sa2MJIa6jNsmwvGuWGhcht+7Xo2Eh
         e6k63THgVx6d+/KA6s0MP6d29RCEH22erbYrnx9oyRBqDy+KLNAFcdidqRbUw/XLllg6
         36H/ijpRtQAFAY+jZVncu/s2Jj4K8ymkfEUxZCNu6seD+hPbmr/FFaMecFPQRfk4Mq2M
         6FIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354329; x=1794959129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8f/qN8yAC8+iTxgP9ikdx8LsPCCF4I+j0HVDju2YBDI=;
        b=onnrerL2bBgeMAQ1qdSyy9Wd17a5YWnjs3uXwzP/z/Vld+wG3IEVlkkvHcnruU5taT
         YC+KWR+zbEMUkgUUomJDogRw9wFKUAUbyvCR1utKFMwRKKwGpt0WkivDdkr+gqXwRWE6
         lNP3aNoqCnfarLkRW0FoiOE/W1ZolI6m9G7jcQEEQD6f0r7YF8edexbEjRtdvAYIXUuH
         a/f2//F35XAQMp5Gt47bTZz5J8PrtRXpLpazrFGZn0xd6/GeJgQruJSGoQwDCMk+IpiY
         d07rwbsSJU/gWMNpZTBtok/+RcRxbBtv6FMlFWa5j0jQn+/9JbzYgR8qGk044VZDn/z2
         +u5g==
X-Forwarded-Encrypted: i=1; AL+hErHSfx9U/i6GzrtzOHekSyweqcZ+3QFcHqXtI4y1WL6VY+4bIkLiSbdbiO09vTL9ovdzvbV/IUEMff79smU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YdOwuVdQnA1HbujXNvRZwqA6/+b0Ecq+fvO4zgcCoYpTTF3AG
	riCvEnEM2QR8gBAaVQoaEyKq9Uw7ZVg9UwlUmoqaq+KqrPIupBC3FcGJ
X-Gm-Gg: AYBFou38ihVU9SFRivnCQEvWKUiq74dADPcCZwzn60aj48h/d+kZgQMqqRvYYJCqiMf
	WOijkTpmqZJFfcIOEDmT4/jXLi8xxW4vgDAI2xHL6a0AWx+dZiuLzu6GRu9A8Bh/vQQ3bczskkS
	RWWOoiJV2g9fSlN7AohqiJ3AYfEHDLZ9nz5P3p4yapfHxQtqXlkkXW2toBSOEVDc8BONVlLbRbR
	Mt0FTSHpWVL/4MMGMcni2YHF9VjjIMT5XZo4Sqjz/s3COiLLWyVJN/2E5BLSVGk0WasxfVd/W0P
	ydCpqJyjR9GRPTGhnETI7NmslTxuPV0jGyS5hdL1aAgC2Ti7d2P5wV5e8ik7M1uXm22V0GQ7gN/
	dbXmPI0Vb+i6KfhArxe5P35wsbDFDGbUitq28c/wXuwowoJ0/EVn2H5lvtoy+4Kyahf3dyE5T4e
	H5A7CQrGYZmBLevl+6Ihbanv1AGs4dYa3OMoMijzSGdYezzVqQHrjIGnL8/NWPn8u2OOIcV3v3I
	RhBhmAMx8ZpElMgsOguORIN8Fk6f4wz2rARVI2QB0OWL0iVEkapPa0RAbc2t4Br8ZHYcRGncee7
	o9WQX9VRlP3GTj2+KSHlwbu1VNm4A7o=
X-Received: by 2002:a05:7022:5f05:b0:1b3:ac34:bd59 with SMTP id a92af1059eb24-1b3c036b32emr494459c88.45.1794354329146;
        Tue, 10 Nov 2026 15:45:29 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm9145881c88.8.2026.11.10.15.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:45:28 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Daniel Machon <daniel.machon@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 2/4] net: sb1250-mac: Advertise and honor RX checksum offload
Date: Tue, 10 Nov 2026 15:02:58 -0800
Message-ID: <20261110230300.2769327-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110230300.2769327-1-f.fainelli@gmail.com>
References: <20261110230300.2769327-1-f.fainelli@gmail.com>
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

The driver already trusts hardware RX checksum status on supported
chip revisions, but does not advertise NETIF_F_RXCSUM. Consequently,
ethtool does not report the offload or allow it to be disabled.

Advertise RX checksum offload in hw_features and enable it by default
when the existing hardware revision check reports support. Test the
active feature bit in the receive path before marking a packet as
CHECKSUM_UNNECESSARY, so disabling RX checksum offload restores software
verification. Hardware can continue computing checksums while their
results are ignored.

BCM1250 pass 1 does not support the offload and retains the existing
software checksum behavior.

Acked-by: Maciej W. Rozycki <macro@orcam.me.uk>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/broadcom/sb1250-mac.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/sb1250-mac.c b/drivers/net/ethernet/broadcom/sb1250-mac.c
index 1843b52e96f5..546415d3134c 100644
--- a/drivers/net/ethernet/broadcom/sb1250-mac.c
+++ b/drivers/net/ethernet/broadcom/sb1250-mac.c
@@ -1142,8 +1142,8 @@ static int sbdma_rx_process(struct sbmac_softc *sc, struct sbmacdma *d,
 				 * the kernel
 				 */
 				sb->protocol = eth_type_trans(sb,d->sbdma_eth->sbm_dev);
-				/* Check hw IPv4/TCP checksum if supported */
-				if (sc->rx_hw_checksum == ENABLE) {
+				/* Honor the RX checksum offload feature setting. */
+				if (dev->features & NETIF_F_RXCSUM) {
 					if (!((dsc->dscr_a) & M_DMA_ETHRX_BADIP4CS) &&
 					    !((dsc->dscr_a) & M_DMA_ETHRX_BADTCPCS)) {
 						sb->ip_summed = CHECKSUM_UNNECESSARY;
@@ -2214,6 +2214,10 @@ static int sbmac_init(struct platform_device *pldev, long long base)
 
 	/* This is needed for PASS2 for Rx H/W checksum feature */
 	sbmac_set_iphdr_offset(sc);
+	if (sc->rx_hw_checksum == ENABLE) {
+		dev->hw_features |= NETIF_F_RXCSUM;
+		dev->features |= NETIF_F_RXCSUM;
+	}
 
 	sc->mii_bus = mdiobus_alloc();
 	if (sc->mii_bus == NULL) {
-- 
2.53.0

