Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773984;
	b=0vgMOAteLCNZAdjTnwh8UuAeSucdZBePVHz4n3/FLSOtMRxdbq7cWSWuLEaSxdjwM+PP
	 5gg+nvnWJwfhlXv+X+DcK/vBn4JeYbCJ+aj/eQ56Rf/bb73gr75Pz0aTdeBwyajJtD5D8
	 P0myjMxHOuLDZUHEmiJjT8DBy/aewcEMmoLkXAMZ1SrIfilLXFnuRfOci/N+chkOWzbBm
	 eQKpgw05SW72AUdkeR7POi3JxshnBVhBxQNNK5jA8ge5X4gekOY6Tu7tj/NpfsTWkrVpG
	 s26Cc9WqEqyUqS1cKzrXrEZusKH0cdmXxwi4U9m0Cf9Sxz69dlzR98LQMIbtvYeSZTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A267S55gzLsHKNdX2hHubjRBVjQyKepuiQmncpiS49s=;
	b=2sYgwawc8mmacsy0YegrW73Y4cr2wTi91DK+gb8fhR24iVcm2o0UwnByD/KPiUkxa2P1
	 VtiXvH/Njy3D/O794iTXx9RamRFnKT1uAPsFNCrUhB66v0o5tJ5kzaXk/gXMuryG9uVrC
	 DtyQfU80EOiptJ2a5T23BuAfHSZkGRz2c507Vn4xAlIEPtaxTgw3qeCvYA4+HtyC4rUp1
	 PyVWN/qSqcSrjyQQLR/xbhEXHPpgSqynsaqBDVV5SEeAjA4G0d+KMwms76hX7W9F6EvSa
	 hhoz9jGjrJ9qaJzpwoPiPHt32Dva4a5IZ3hYo07R20i6RzGhnX8YRcZqz9sa99R47ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="P/3fRZtB";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA25606A337
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBA25606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P/3fRZtB
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e977109392so2030745ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793773983; x=1794378783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A267S55gzLsHKNdX2hHubjRBVjQyKepuiQmncpiS49s=;
        b=P/3fRZtB4Qn317tlZqnrQOHNMnODYV5scoIBkngzWbm7EbPJDSL/xd0W/t6zO4uXRI
         BmPwbwD6oyUwUCNrkTw+zT0T7HLsOffjX9vLv5NhAr1QOddMCwsYsjeS+MEfDJDkPyfN
         0r6X808DuXj0HYmBHpB97UUeqovf8ofndKWnNZPHyW/HjFvftFE+xvD5i8IHqWM90HiD
         /bQu88706FAoYlIIOBa+jDf74VcitTwBUJ9d3y7fCQzyhbVqKhDPLNPqLdt7oHVAMhzb
         Y6VXnMAf9/jir/7leYCFvcfv5hlmDKOd1YrRZJfaacGkwVt1lQfr8g0AhbgtQ1G/0nVV
         ZzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773983; x=1794378783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A267S55gzLsHKNdX2hHubjRBVjQyKepuiQmncpiS49s=;
        b=jEB4mvuzuFIFYaikhaFhNLx/YqrX9GdSsF8/HH/FiOekfaqfc1zvZOSgidvSRdC0l8
         QKv1CCXuB/Mb7C4n7tnL/PM5qk6QbsSZn0umCG5zrN8e89kl5hrMXSMCo+RiT9npkIpP
         pYA6vKYuGZNyVIEEc8QLUa1qDe7Lbxw4SlN8rpFJRoaPBpCIw28W7AsieYDJvAyuiZDd
         km19GHuO/mR1n+8dkF41iMxDxiuC2Ppr7ur1o29QueEJjgkieNfQFH+jXoQ1ZBicQDNU
         EYAFD5tZ9pxMdFa/6gcq2FkfyyC+WffYoEM5KwobLeEs0eDR2p6v29CuViLTxdUUPlAf
         6YkQ==
X-Forwarded-Encrypted: i=1; AKwUvByDZ6qkQ2Kt8cbOTkb1YM9u+CQVgug/11ea3eZJStEzCbHa2aqSKW3cZB5NU3vI1ZV05Q0jOtePeXILONQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wKpCu+m2jNtNWjUoq4utiG5gtM0jrto1FVyhLcRJNGP0ybZ3V
	ZpvpDnf8RoKG0pxt2ao8qQK17SAMaN4Vo1TJ4KuIId1tKPX0D3idOIqB
X-Gm-Gg: AYBFou3SCdLqxOvzovhBSsbbEoyFykTMxCAhlLWNBcJuPAJNll23yv3/E3Ndr4g8xnd
	jbzyoNGqdzIFVJlYFr5L+nA/hSTFfKRA+gN2mkiwj3QV8wJXvtuWIVdSfuiMTu8I145bVxRH7yz
	DuCLjKJyj3Nd2ZC2xn+uLa8BWmjeMYFWN4mHcREaesSlsqiMiNJCNIgDMcRNw0AIzZyihs/Uioy
	Mqx1yIFv4GBCSWwKkjivJzFs0Je6EnHAn+HR351ssRrJ8lmaZ3tn9UWav87/3PhuyHqV1nY9PfO
	KU4N4XwXZHjdqM5hdGCedRoCM6IUeVhcXMPYvAEx1U9t2Th938FzY+IvBqmnDMCIECFaR8/0sLc
	BCpbqfscy5ZHWwux3upw3K9KWBSk5E2RUxCEdJaUGkC49XHjrQAAnyKMP5wJcxV2NLf86d24i1+
	NYk0jkwys5MN9ZifBp6uFLlL2eG1g0R877BLVFL1/iIqkcOAPEu+7pv7OhuMKaVGWmOszXDToI1
	gOZsITzCTfadIWuCftzr83D0O4pDujBnrwtFBnGgEXSVDDZ+Ttn/EMv+4L07tjXvvZ8eSHC2d/c
	bySoZCCc3F+vfUbYBcMEGi7j+yljv1UJ4HhE7fDPKiOxnxQNdQyNjD9Qww==
X-Received: by 2002:a17:90b:1645:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3ae8957cf23mr12255501a91.3.1793773983145;
        Tue, 03 Nov 2026 22:33:03 -0800 (PST)
Received: from ubuntu24.localdomain ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0945104dasm2583207a91.17.2026.11.03.22.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:33:02 -0800 (PST)
From: BeaCox <0xbeac@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net 2/3] net: enc28j60: disable work before freeing the netdev
Date: Wed,  4 Nov 2026 14:32:44 +0800
Message-ID: <20261104063245.23402-3-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104063245.23402-1-0xbeac@gmail.com>
References: <20261104063245.23402-1-0xbeac@gmail.com>
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

enc28j60_remove() unregisters the interface, frees the IRQ and frees the
netdev, but tx_work, setrx_work and restart_work can still be pending or
running.  tx_work is queued from enc28j60_send_packet(), setrx_work from
enc28j60_set_multicast_list(), and restart_work from
enc28j60_tx_timeout().  The handlers access the private data, the SPI
device and the netdev, all of which are freed with the netdev.

Unregister the interface first so the xmit and set_rx_mode paths can no
longer queue work, then disable the three works synchronously before
freeing the IRQ and the netdev.  disable_work_sync() drains a queued or
running instance and rejects a later queue_work(), which a plain
cancel_work_sync() would not.

Fixes: 3ec9c11da033 ("add driver for enc28j60 ethernet chip")
Cc: stable@vger.kernel.org # 6.10+
Signed-off-by: BeaCox <0xbeac@gmail.com>
---
 drivers/net/ethernet/microchip/enc28j60.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/microchip/enc28j60.c b/drivers/net/ethernet/microchip/enc28j60.c
index d6c9491537..bb29a94a1e 100644
--- a/drivers/net/ethernet/microchip/enc28j60.c
+++ b/drivers/net/ethernet/microchip/enc28j60.c
@@ -1600,7 +1600,16 @@ static void enc28j60_remove(struct spi_device *spi)
 {
 	struct enc28j60_net *priv = spi_get_drvdata(spi);
 
+	/*
+	 * Stop the interface first so the xmit and set_rx_mode paths can no
+	 * longer queue new work.  Then drain the works that were already
+	 * queued; the IRQ handler does not queue work, so the IRQ can be
+	 * released after the drain and before free_netdev().
+	 */
 	unregister_netdev(priv->netdev);
+	disable_work_sync(&priv->tx_work);
+	disable_work_sync(&priv->setrx_work);
+	disable_work_sync(&priv->restart_work);
 	free_irq(spi->irq, priv);
 	free_netdev(priv->netdev);
 }
-- 
2.43.0

