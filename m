Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268635;
	b=D5YkYnoM+BSq2+X8I2mkVCaq5hiPfgSfUcRnS6126Z8gxevFpKGqMztnYO9290XRm2TH
	 KRq2gWEiv/wSkIGjaidu+KWa3ukJkUHGE2RDOgV4v9ygOeZe/npq8EVAaPajxCgQRmqW7
	 l2fo/JXWXqjMU7ISI6yWMMTOLq9hKr14/6+gw7CEWbssaEgvdmRiva11L/qeKp36s1blT
	 0lSkTNQw4OvVcbgMahbODOlmhP9bUX3H2BkCvpBfDnyGsaRikUA90Ivxsz0W0Ww5ztf4i
	 l4/LkL8LIM2XsBwbbo8Emcc+KNsIUJoGJj7GjHZ33oN0Qs7j2EzyLZlxlVI3ulg/Evw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5RsYyZ4jmwX1lHRNizw1tgGoKzSfWeMKs257DsMG7TE=;
	b=EYfy/HlS2r0gdUgPoxRpSBGG9DUZr/8T7WPYQGP3xj4qYchMJyVelFBbGzLnZVuLaBbW
	 rG+AuPgZxfY/Q/DboOyUCxlsL2zbnnssVDIY+XbT16r56DlUFWHH/adxLn+TVIhCm3WmC
	 GBlLZM1gNqAE6Q6TpmUCl1APX4OK1lqch9mVkMwm/hNTO4aIYnKte8aK3QDDKZhkpYVjQ
	 nmgfQr7fpK4941wEFl7gxMOBrF2XL0wFmf9sdPHKRLphRc/QsPjsjwvjWXo2fv+CiHJyU
	 3ca/4u+E++spbdHnq2N8eqmGFxbhHLtaBIiFYip8N3JKCIAhsVl56A+tyaQ1UIaBGOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URxookT3;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE0260A3817
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE0260A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URxookT3
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso211740366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268633; x=1794873433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5RsYyZ4jmwX1lHRNizw1tgGoKzSfWeMKs257DsMG7TE=;
        b=URxookT3xe9D0e9ytmspZKxDkUi62bNIyWnkkarfEClufFS8VehB0rADHBlNF3mthO
         FAL5LnYDmIyS3vrMJ4qF5OBkpWm5/M3MwxXm3PlXJPSZsanrNZI6NNhA1rTBiOavBVYr
         r/2+gFwCSEdX6Ns91D0EQdnrjuS2ynTjtMHYzO4/JOSgq5fOqDjS0vyDzQGf5ahi2eXB
         e5CkG+JeZqqS4u5TiJ3Theg61zdxW0QT26eu/ygaBh/zkotG4EBglPSVTIPkhFuV3otU
         D06J85MlHc7ZkvON1RQDGJhMGD8N7iCDqCmrI5S9+tJNqg7OcUUsTZlcDSHGW7Uqx4WB
         14hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268633; x=1794873433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5RsYyZ4jmwX1lHRNizw1tgGoKzSfWeMKs257DsMG7TE=;
        b=CJoQbPBMpd6DkY9g7HshQIXAZkyOO2eWJ6bva56HcfEuSY7J4tPD4klKMdVGYjiOQ4
         yY0K7/3e/DBjCStdFz2KNtcwu46fl8ganyjECT+wkk+0n9NkuHjA7GVBLk6U5wRsvCDA
         5TqnslBjdcvoJrJA0CXXb/LBxpqH/l7IVqJ4RgU9rnXDu7JHEwzScs7JrJOc3/HqgbCp
         lMpw+sPP0X2LtOWViLrKfTbOyb189KTrAUqE6jzsP3R6kWF5hDqOtXWqLK/oaNkOJuN2
         PUWACvnR2GH3JX4IMpPZPsSgadjw9mspi0j1h7gUH6c/rC8mQdDtf+ZGyYee9o2MU8z7
         i5jA==
X-Forwarded-Encrypted: i=1; AL+hErGhZ/5QnDY0boAzMJh0YP4n44qDjX/J9aAqznKzNXXi2YAd3OE+eG7u2O1x9JLChuon3cqByvdrKmaSIoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gg7H0NoG2GuV6EqsVssLIhcUtMb5xhWt/YohkEP15kInzSK8c
	jzSlG9izIXtqCexLJ3m3FgyL8dN0P/eXKYThNVBCWUhDAR6nTIgWnlyy
X-Gm-Gg: AYBFou2U28R8WB4VEix+jeqnn5Eau6LIDukHdnFdm9ippJFeoqZYe7Z8uXb6EW/njrp
	PHFZoMi2KVTWoSXRUiDp97V657geN7mef649DNnvGareYwu95z1Hpwx4NJ8mV6taZ/2m7XvqyvU
	HEutcQ7YnDk/YP9kyPaim7BY5ee5JQ+k/BXP5gw/tDZ2oziF0MmX4Ugzk918a3J0UmP75960y83
	yvW/JTiGL6HB9N95j7o8eh+063zFadyExSmkLWpxzXelD2lkGRaapEB8a9EVjRSLEabIbgs1IUU
	d9aj/YjI+HH/h6ApnlFcvt9fcD61zAWrLP4Lk7HkFZFY+TYxp9eL4bp1pRiM92FucLorp7Z5slG
	l37+BEE1X7Q0CsHgtrhXAlXKCoH1vOD6NTGF/OQ4RkF3x3PQyewK6v6jzd0fr7Ldx/1IxfUZF5L
	8PagV4Q9DujOoMoFkmoEHin1r1acVkyZ1Bwbnr+0AJJenX4Idndr8c5CNK/WXHv6qWPGSPE+pjn
	5m7XtzNE03d2qkZNi6jRjQYmek8RIDY2JLe7D2MFOEdTC9Sxb+j0VbWw6QKNcg/PcZXHAeeiPBj
	B/ZuksL6deaRlPqtqwbeLREIf1RC9EYgnybievh8BlsEtIqUwSijyCwcZDcGUcoqQUTYDsLZtym
	G
X-Received: by 2002:a17:906:f587:b0:c4d:28c9:b90d with SMTP id a640c23a62f3a-c50494f324emr73812666b.17.1794268633325;
        Mon, 09 Nov 2026 15:57:13 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56b772sm33725066b.16.2026.11.09.15.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:57:12 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 6/7] net: bcm4908_enet: publish the buffer address before OWN
Date: Tue, 10 Nov 2026 00:56:59 +0100
Message-ID: <20261109235700.2586821-7-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109235700.2586821-1-kudzo51@gmail.com>
References: <20261109235700.2586821-1-kudzo51@gmail.com>
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

bcm4908_enet_dma_alloc_rx_buf() hands a descriptor to the DMA by
writing its control word, with DMA_CTL_STATUS_OWN, first and the new
buffer address second. The refill runs on the descriptor that has just
been completed, which is where the DMA waits once the ring is full: if
it picks the descriptor up between the two stores, it writes the next
frame into the old buffer, which poll_rx() is turning into an skb.
start_xmit() writes the address first, but nothing orders the two
stores, and the descriptors live in coherent memory, where arm64 may
make them visible in either order.

Write the address first on both paths and order it before the control
word with dma_wmb(). In poll_rx(), read what the DMA wrote only after
seeing OWN clear (dma_rmb()).

Fixes: 4feffeadbcb2 ("net: broadcom: bcm4908enet: add BCM4908 controller driver")
Signed-off-by: Kordian Chmielewski (mlody1212) <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index c0aca6801..ea4a9eb98 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -289,8 +289,13 @@ static int bcm4908_enet_dma_alloc_rx_buf(struct bcm4908_enet *enet, unsigned int
 	tmp |= DMA_CTL_STATUS_OWN;
 	if (idx == enet->rx_ring.length - 1)
 		tmp |= DMA_CTL_STATUS_WRAP;
-	buf_desc->ctl = cpu_to_le32(tmp);
+	/* The DMA must not see OWN before the new buffer address: with a full
+	 * ring it waits on this very descriptor and would fill the old buffer,
+	 * which is on its way up the stack as an skb.
+	 */
 	buf_desc->addr = cpu_to_le32(slot->dma_addr);
+	dma_wmb();
+	buf_desc->ctl = cpu_to_le32(tmp);
 
 	return 0;
 }
@@ -600,6 +605,8 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 	netdev_sent_queue(enet->netdev, skb->len);
 
 	buf_desc->addr = cpu_to_le32((uint32_t)slot->dma_addr);
+	/* The DMA must not see OWN before the buffer address */
+	dma_wmb();
 	buf_desc->ctl = cpu_to_le32(tmp);
 
 	bcm4908_enet_dma_tx_ring_enable(enet, &enet->tx_ring);
@@ -638,6 +645,8 @@ static int bcm4908_enet_poll_rx(struct napi_struct *napi, int weight)
 		ctl = le32_to_cpu(buf_desc->ctl);
 		if (ctl & DMA_CTL_STATUS_OWN)
 			break;
+		/* Nothing the DMA wrote may be read before it gave the descriptor back */
+		dma_rmb();
 
 		slot = enet->rx_ring.slots[enet->rx_ring.read_idx];
 
-- 
2.56.0

