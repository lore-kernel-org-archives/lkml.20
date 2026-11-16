Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822976;
	b=BNGaU5VSawRVOMIEOkQOoOFJjep3iGhqjxOH4om0X/nwevx1ZAMZkaN74Xgz1jpNj07G
	 ZnjQZUKaohmjs4Qk9+lfxtMmHR6uBBoO3UxGPT+QegXaVRfzSukCIDY+74FifnUpJOVOx
	 CpGT+6cHJJf1JwZrE89jnOz0FAGVOQLSXqHwdXoVI3PSA4Qj2e8i+Wfw6Lv5X6n/es6rw
	 B+MRnzPN/EFPl7msrls4suF+yq+DlSz48uXlsyECG2xMtC2xjbVSk2EnpiTrfEE1G7119
	 MaDTuCI931UKILQPR1WAMnWUDSHokvYAqXlhndL0iNYcQ+IlCkAnm3fpxPYtO+6VJ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822976;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer;
	bh=fL4xMvgzojg+WiVMPbFBWFV3mWxVR2K7sLvrVVvLVtU=;
	b=37ct8megcomjL9xYjW5pJLaNFgHhjEMzQC5U/LZj7B+kERAHw07qF9QFNazYMklmwp8X
	 I08V8Y892l8ez461p6jC0SoC5EJewyXUKd1rg3K6i7GG3hqim5yKqaCa4xE63bKkX0fgd
	 SmGy/R/g05lHWUSkIk6FoIYpPlmgqnozLfJLSEoaJtStlf45AluOhdYQt6Rcb3lLhJ106
	 tDYx/mv5LcMA47PwPkry7dSM8HXgeNOx/INUoKhKlZNZptIwxMeXYKeHq7LQl3bQtGOHF
	 rT6HVzDwHoTlykmOSR4w6yhf+y+HIka/zkemfwUzZSJFSS7h6se5Rzy7UdejyMgjiig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=mGugRIq0;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2C6606A338;
	Mon, 16 Nov 2026 09:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD2C6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=mGugRIq0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794822976; x=1826358976;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=AqU0VY4PfPgM56FvvNZrTMho/7crl4ybIv+YY735130=;
  b=mGugRIq0zoJNqUkrZLoz4gr++tYwpOM2BfdM684JYwB44mVmJXVPkGRp
   kssZZ6CnfIf0e9c6rjL5mu5tN5XgBxk+CSKiUUadHS7CID4NLWRd6JzDZ
   V856r96D50JoWGQvo1vqGGol6GKVB5FsSUkuFDDal3VUZkmvFFM2dM4+8
   DZC8tfO3OWXNaqJa6NJTFRBg3E8OfaFrfxlgzTwJaV/WOfb581+vkvHIU
   htZnPEC13Z4jM32okL0ZRhAeuivjbh0n47vpeOBbTov0WmDiGEdUMiiER
   p9RRIENq/3Z2EoAemjYN1LUoiMLeZy/+fK4pCd2OB6kP/x/s4b7GZ7Pls
   g==;
X-CSE-ConnectionGUID: WU7imL2hTwKVUDu7IpqGdw==
X-CSE-MsgGUID: 9jexKbTTQkKcnIomS6Nxew==
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="233613656"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Nov 2026 02:56:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 16 Nov 2026 02:56:14 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 16 Nov 2026 02:56:12 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 16 Nov 2026 10:56:04 +0100
Subject: [PATCH net 1/2] net: sparx5: fix RX ring stall on frames from
 inactive ports
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
Message-ID: <20261116-sparx5-rx-inactive-port-v1-1-343d8bab58bb@microchip.com>
References: <20261116-sparx5-rx-inactive-port-v1-0-343d8bab58bb@microchip.com>
In-Reply-To: <20261116-sparx5-rx-inactive-port-v1-0-343d8bab58bb@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: Zhang Hewei <memoriaru@foxmail.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3

If the source port of a received frame does not map to a port with a
netdev, sparx5_fdma_rx_get_frame() returns false without consuming the
DB. The DB keeps its DONE bit, so every following poll picks the same
DB and grows its skb with skb_put() again. This ends in
skb_over_panic(), or in an RX stall if no more frames arrive.

Drop the frame and return true, so that the DB is consumed like any
other. Remove the extraction queue flush, as the FDMA has already
extracted the frame, and ratelimit the error, as the source port comes
from the hardware.

Confirmed on Sparx5 (PCB135) with a kernel modified to give received
frames an out-of-range source port, which made the board reset. The fix
was tested the same way: only the bad frames are dropped.

Fixes: 10615907e9b5 ("net: sparx5: switchdev: adding frame DMA functionality")
Reported-by: Zhang Hewei <memoriaru@foxmail.com>
Closes: https://lore.kernel.org/netdev/tencent_ACC296C1F221C304053BD0F1F4B0D2C2BA06@qq.com/
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
index 15ec9b053824f..8675702bf1504 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
@@ -157,9 +157,15 @@ static bool sparx5_fdma_rx_get_frame(struct sparx5 *sparx5, struct sparx5_rx *rx
 		       sparx5->ports[fi.src_port] :
 		       NULL;
 	if (!port || !port->ndev) {
-		dev_err(sparx5->dev, "Data on inactive port %d\n", fi.src_port);
-		sparx5_xtr_flush(sparx5, XTR_QUEUE);
-		return false;
+		dev_err_ratelimited(sparx5->dev, "Data on inactive port %d\n",
+				    fi.src_port);
+
+		/* Drop the frame, but report the DB as consumed so the
+		 * caller advances past it and recycles the DCB.
+		 */
+		kfree_skb(skb);
+
+		return true;
 	}
 	skb->dev = port->ndev;
 	skb_pull(skb, IFH_LEN * sizeof(u32));

-- 
2.34.1

