Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354335;
	b=pj/MOlsWcr+TBUaF7iyS4Nes1/6RlRp+v/xUUkWtZb8ozX8Y6/sM6rSGOkbC+YrtnLuN
	 WaN/2hnFecs7RwSF2cAWRmFJwrvFKZjRA/7dIt9yPyOedNVDHktWcXRuemo0nF7Q3DczE
	 l6N9TuLvVHL6JP8rNTw4eolo4ZAKD2XUqzOm40NgZKX+mT91iPt1gnnZeCV25g9p3KiFI
	 5dg0Zg7CGDxSuLvA+95VURZG4CArX7Kb+94x2yjW3qSCvm63RbjV7pnHjGa06kuZhiG60
	 GHnwTs8ETZDO1a3BCxqI/pCiAvQEVRzf/X34C1TGep+G16406cidM2awowLgTOgOL5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HosWUHlaOYuMVF37Fh9a12drQIP+JeWidriSfMU7poY=;
	b=ZSMHAdb+lZ2vTVpbZHHjp47VppbjFduc7ak8F2NrkNn3aRPOIyGgGWsmFwrFL/7u/rx8
	 Ra+Ge4ZCzkUMwsGRxxGy/ECDlZ7PVeTU/xmIOK+4P4m5e8Hw/6i9n3sqhGlxPtdU+ZpA0
	 x/Y1mEeDuGDLN7r6UPzYF2mi3mblYYnwd2rkhl0nn//xEhjQlk5EvfqqKTbmg96+CO/cF
	 OenJOk7lVVi39n7b7aA8Snylh+XOwYGutoryRCf4tSzsIXR0o3EX5YcC2lybF6nsGYCXz
	 RCgppT7syLaSfrBKcXA8oI3qWFq35LjucHjiTYvY2WcbBTGGGf0xjtOi1cEL3Pdy3ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U+ymGBNC;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C266C60A2615
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C266C60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U+ymGBNC
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so4146482c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794354334; x=1794959134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HosWUHlaOYuMVF37Fh9a12drQIP+JeWidriSfMU7poY=;
        b=U+ymGBNC6OVC6wHzIDDuOq7gpUfDwFrZtfjOK9r4ChPjwFGEd/fgTJEg25RWl/pnZl
         pzBnHyYxKw8e14ynGm+aoFImFAzIgXOBNS7fWL5dEFvlypcAO8BhRcQfwxFLrQuq5+gQ
         mQxyHNnBukUYTX1ZHiHxUmhfY+yJ1VW6DAmF80Chh7F9Hzb3wGuyjQj1w8kcakl8yBPI
         lsva5gauW+yK4kDTduJ/LPwtrbHo3ABT15EC1a4cCHZDVzrSfP7mKVkG+I2UtuUDJM+l
         BYGJ6HXtsxbXQe7su6MLyw6hlBhkiQdCHq8gpuhcUE9xUOPSfbmhsLh880De9L4dPq0V
         dKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354334; x=1794959134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HosWUHlaOYuMVF37Fh9a12drQIP+JeWidriSfMU7poY=;
        b=TodyxPi7e968Qavm/agpJNYHL8pZABVVzF7YItm1W/2zdH1Q9RE5je+4Uf8rEHA/Ix
         ORyWWmS1bSXLPfPE/l5flJL7KhUOQKEBpy4RIWpTbRGKwqmz45gx5qc9jf3ePtGa3cwk
         xL8sCFd8IVq3PvyXoXROsImZ+52fmR28uhGGWggV7nqeOoyn0uHfL8gzga5yk0CtKez2
         sIKgxlxUoerWIWw/ukLR1O+nrFz7ZKwIvdIGW6BwOkgMGGqi4w9VqU7t8dbKF29lpMzT
         YvoDSvxqg8K+Xd4wp7Bs4lw9MrnKdGghR8ak8tI+0KgRZqELgIwaGcXNE1D2Rk5Rrm3J
         vlQw==
X-Forwarded-Encrypted: i=1; AL+hErFimayxj6UO4iiOmgYtiW+WBdylt3QWUqm5AWJlxMl4n831tukF+HkX94y8Xjdc3pEzRIyXYWtY4ZcZM9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9O//ac+uq6ixOMZFdTX6I2QkpBi7x2ejwLHvDxNw2RiSMlANI1
	wA328hn7/WIEe3z0ahzUSZE9BVZbE4zEjx/0VWl+5zhpMaLoYuHiESyb
X-Gm-Gg: AYBFou3o2vcdm3zdRzn6i1EkUWBECAHHGT6QcszYZvvoph5yKbXm6gMQuBdLahEQB5q
	Tc5s5y4Q7HUMu0HCkd/C1CCv0yiFD0kyR4VO8KMd4Gx9Lc8sA7olUB76kgCdYJK7prTeUf0XOAs
	DgWDRkIKruNMdHB1+NJetF+6MOL8cJxRPrky5N+D90N6Q1nj0jnmGZTHz+pugUP3muQCaNVaFJx
	2LHbhtNhVgKjM3YwGKSyOuSQaj1RBBMv2jh/wQOs3iiA/HuJae8MyigJQSYGNB6R7EMo1OCPa1L
	JkOiI+3M0T/dfg5TSP1AAFmIXPfZMETnM6mV0Wv1v+4getbmc9XQ+aDt4Hm/VOvBkVqIwOMn2nU
	FyTwO2lPAXgHBGM4QLKfBne2yVVBjxhzbO5cLDtB1Vka1XN84y6DX0eWwvKIoOWEBPoYJVIpLuy
	bjoEJU3lcuxGcRR6McoV7Bmyrzf13qw++GJFGDkXis4Dgrk+qX67Z0cQjxTDV2trWIvsG7TXw8w
	LNxrUTHjmzYmV0p9Rc9GIFmVfZg8XDnwG29PtTV5q0CUmM0/JUdN+L4G99YLlgYRgm2x673WK5P
	zC4HJV+Z8vIv0rNgSLWoPuLnEcJ4PQ==
X-Received: by 2002:a05:701b:21c8:b0:1b3:ae32:7a57 with SMTP id a92af1059eb24-1b3c036a2ccmr615467c88.47.1794354333685;
        Tue, 10 Nov 2026 15:45:33 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm9145881c88.8.2026.11.10.15.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:45:32 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Daniel Machon <daniel.machon@microchip.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 4/4] net: sb1250-mac: Fix RX checksum status and header offset setup
Date: Tue, 10 Nov 2026 15:03:00 -0800
Message-ID: <20261110230300.2769327-5-f.fainelli@gmail.com>
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

The receive path tests M_DMA_ETHRX_BADTCPCS in descriptor A, but the
hardware reports it in descriptor B. Bit zero of descriptor A belongs
to the buffer address and is clear for the aligned receive buffers.
Consequently, a frame with a valid IPv4 checksum and a bad TCP checksum
can be marked CHECKSUM_UNNECESSARY. Read the TCP status from descriptor B.

The IP header offset setup also only masks the old register value due
to the combined AND/OR expression. Split the mask and field assignment
so that the intended offset of 15 is actually programmed.

Channel startup clears the receive filter register, losing any offset
set during probe. Program it again before enabling reception on every
channel start, including link changes, and preserve it when enabling
unicast and broadcast reception.

Both bugs predate the RX checksum feature advertisement. Sashiko AI
reported them during review of that change.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/broadcom/sb1250-mac.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/sb1250-mac.c b/drivers/net/ethernet/broadcom/sb1250-mac.c
index 433aa1e24439..7998ab9fc46c 100644
--- a/drivers/net/ethernet/broadcom/sb1250-mac.c
+++ b/drivers/net/ethernet/broadcom/sb1250-mac.c
@@ -280,6 +280,7 @@ static void sbdma_tx_process(struct sbmac_softc *sc, struct sbmacdma *d,
 			     int poll);
 static int sbmac_initctx(struct sbmac_softc *s);
 static void sbmac_channel_start(struct sbmac_softc *s);
+static void sbmac_set_iphdr_offset(struct sbmac_softc *sc);
 static void sbmac_channel_stop(struct sbmac_softc *s);
 static enum sbmac_state sbmac_set_channel_state(struct sbmac_softc *,
 						enum sbmac_state);
@@ -1145,7 +1146,7 @@ static int sbdma_rx_process(struct sbmac_softc *sc, struct sbmacdma *d,
 				/* Honor the RX checksum offload feature setting. */
 				if (dev->features & NETIF_F_RXCSUM) {
 					if (!((dsc->dscr_a) & M_DMA_ETHRX_BADIP4CS) &&
-					    !((dsc->dscr_a) & M_DMA_ETHRX_BADTCPCS)) {
+					    !((dsc->dscr_b) & M_DMA_ETHRX_BADTCPCS)) {
 						sb->ip_summed = CHECKSUM_UNNECESSARY;
 						/* don't need to set sb->csum */
 					} else {
@@ -1496,6 +1497,7 @@ static void sbmac_channel_start(struct sbmac_softc *s)
 	 */
 
 	__raw_writeq(0, s->sbm_rxfilter);
+	sbmac_set_iphdr_offset(s);
 	__raw_writeq(0, s->sbm_imr);
 	__raw_writeq(framecfg, s->sbm_framecfg);
 	__raw_writeq(fifo, s->sbm_fifocfg);
@@ -1549,7 +1551,9 @@ static void sbmac_channel_start(struct sbmac_softc *s)
 	 * Enable receiving unicasts and broadcasts
 	 */
 
-	__raw_writeq(M_MAC_UCAST_EN | M_MAC_BCAST_EN, s->sbm_rxfilter);
+	reg = __raw_readq(s->sbm_rxfilter);
+	reg |= M_MAC_UCAST_EN | M_MAC_BCAST_EN;
+	__raw_writeq(reg, s->sbm_rxfilter);
 
 	/*
 	 * we're running now.
@@ -1717,7 +1721,8 @@ static void sbmac_set_iphdr_offset(struct sbmac_softc *sc)
 
 	/* Hard code the off set to 15 for now */
 	reg = __raw_readq(sc->sbm_rxfilter);
-	reg &= ~M_MAC_IPHDR_OFFSET | V_MAC_IPHDR_OFFSET(15);
+	reg &= ~M_MAC_IPHDR_OFFSET;
+	reg |= V_MAC_IPHDR_OFFSET(15);
 	__raw_writeq(reg, sc->sbm_rxfilter);
 
 	/* BCM1250 pass1 didn't have hardware checksum.  Everything
-- 
2.53.0

