Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822979;
	b=pgVLgubxYx0Wk2FToKtnduRhOAapKLXLLbI4denhQ8YbemVVH1RPA0DvjOsTlpnVK/Mu
	 TauU/QDNnh7SHN3VrI7eqYxf5Rjc6hUK7g0iFHfb++pCxkzlHhzbRsGThRlP+T+ZLAFy2
	 DecDY9JEs0UbLAS6v59meAvBQ/bXBjBS6eLqjDKYJ0kzrLD3kF0jv16dxBjmhkm79ttk4
	 CjMaC6aosyIfLXzLNc0eUr0DqquAzKD+uJlUHMTT2NAjhmY672DyUdk6dxv1MVTYrutnU
	 bbtsy1892XCJcD4REZW1JQ9MQIXjGz8wU4iQlsngP5h+aRYSjA4aT7nDxa2lLxjoypA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822979;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer;
	bh=UH0bWnACNzDflP3qTpTK60pPAUWOTD6CtY3JFDChnAI=;
	b=DjHTiwDNW8KZvVKAkl1gmFTofLcrGc7tbEXMwkPInyYSUbpOL4DeGvv5tV6n+a6jusfP
	 zjZoaHDqj1Z8Rkjqm7cxKUSY0VKGV9NrrCAbWEGBHvR6J/pSTO/htyaBq96ibUGh0MnE/
	 LDc3PenooKBN+DNpa48FiOOUsFkSOhEu2sYTnlxYigKup+UqMcxRSXbtYB+Rru7bFfBog
	 Pmm4hBlVtKbJMYLmK0HQ2mqqPu67DBq5Ch408G5jjQ/yfgMMIFQjFT4UWP3vWQwO6Vy0G
	 tL6MG+PFm7E1yXZf67GhwTw/skKVuzPSZ662x2iAYSUZi/H9KYT+eHC6paO4IkddhnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=JtfDGeuc;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C228A606A337;
	Mon, 16 Nov 2026 09:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C228A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=JtfDGeuc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794822986; x=1826358986;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=e5zGi3wEIQJPvBLV+DurPYuglqNx2l0a2BJwxi89I1c=;
  b=JtfDGeucClq7Wi0OhG686QVYO9vVA4lrgsfrbasHp9MnaMW/xpwIoCmG
   CxUCZTaG2foM5/z6n5YSd5VE0fkdZ+OYQyyIX1dW1Zi47HjqYubSM2Jdt
   dTs/2W69ezcf0yRKEocwJL5GQUdQ+OgnqdsidSiEddz9uBT+NtItOi81P
   UqzWTYp5HPS++0+6YZBwq55DalBBfrHyYbCBSj+jCK2m9ucjjD6K1zQ2w
   bKLO9wfJ6coF1qZs7Y9gqkbb+uHzMzMfcS2ohj7tugbYlSoREPc8QkY/R
   oMcpfwqT+wPSbe20K0TrFEV3rid93bwcTqU2X2VCkgn2Gt07R6WOZo2Qk
   w==;
X-CSE-ConnectionGUID: hITfFtwUT4GP9a0u1ydGHA==
X-CSE-MsgGUID: M39AjVtWSfeJYe9QfLiirg==
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="297975481"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 02:56:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 16 Nov 2026 02:56:17 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 16 Nov 2026 02:56:15 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 16 Nov 2026 10:56:05 +0100
Subject: [PATCH net 2/2] net: lan969x: fix RX ring stall on frames from
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
Message-ID: <20261116-sparx5-rx-inactive-port-v1-2-343d8bab58bb@microchip.com>
References: <20261116-sparx5-rx-inactive-port-v1-0-343d8bab58bb@microchip.com>
In-Reply-To: <20261116-sparx5-rx-inactive-port-v1-0-343d8bab58bb@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: Zhang Hewei <memoriaru@foxmail.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3

If the source port of a received frame does not map to an active port,
or build_skb() fails, lan969x_fdma_rx_get_frame() returns the page to
the page_pool and returns NULL, and the NAPI poll loop breaks without
advancing past the DB. The DB keeps its DONE bit, so every following
poll returns the same page to the page_pool again, and RX stops on all
ports.

Drop the frame and advance past the DB like for any other frame, and
replace the WARN_ON() with a ratelimited error, as the source port comes
from the hardware.

Confirmed on lan969x (EV23X71A) with a kernel modified to give received
frames an out-of-range source port, which stopped RX on all ports. The
fix was tested the same way: only the bad frames are dropped.

Fixes: d84ad2c0d80c ("net: lan969x: add FDMA implementation")
Reported-by: Zhang Hewei <memoriaru@foxmail.com>
Closes: https://lore.kernel.org/netdev/tencent_ACC296C1F221C304053BD0F1F4B0D2C2BA06@qq.com/
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
index 053d125eda658..fd532c89f9110 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
@@ -113,8 +113,11 @@ static struct sk_buff *lan969x_fdma_rx_get_frame(struct sparx5 *sparx5,
 	sparx5_ifh_parse(sparx5, page_address(page), &fi);
 	port = fi.src_port < consts->n_ports ? sparx5->ports[fi.src_port] :
 					       NULL;
-	if (WARN_ON(!port))
+	if (!port) {
+		dev_err_ratelimited(sparx5->dev, "Data on inactive port %d\n",
+				    fi.src_port);
 		goto free_page;
+	}
 
 	skb = build_skb(page_address(page), fdma->db_size);
 	if (unlikely(!skb))
@@ -258,10 +261,8 @@ int lan969x_fdma_napi_poll(struct napi_struct *napi, int weight)
 			break;
 
 		skb = lan969x_fdma_rx_get_frame(sparx5, rx);
-		if (!skb)
-			break;
-
-		napi_gro_receive(&rx->napi, skb);
+		if (skb)
+			napi_gro_receive(&rx->napi, skb);
 
 		fdma_db_advance(fdma);
 		counter++;

-- 
2.34.1

