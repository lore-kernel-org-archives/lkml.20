Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295086;
	b=Tz2Q7SXxI+ynRUGU6Bf6v+7B1nzASdPin7F/wNWdOVkqqsAav3aRxvRMsBDd7N9BAnRo
	 yYERY6nCvly3B8qpf9XX9RZ/sdRBWs5xKUpV7Ibu3LFdFhX2SEX7cH4rurwl9jihqavPl
	 gu9mYuGoUE9Jz/t2oDWGj3vwDb59fMY48G7Ih7Uegd1EwYsLMPYrUTq3wLqwwswm5fp/U
	 9tvKQgxmk3iW8Cm3MTAivmGYFgEizY01eW0uoYDUSvSDPD1zdFZjAMf3IsXC3HylmiFWe
	 wCatf2uob5hyomjpfhQoX4392oYBXASJyApAe2rqy/9EyoLlCLB0Ft2XJmWzj9rIwaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hSIslHYAdaXfJ/6/15cY4EI+1/izn+/DHEzPa9wprnI=;
	b=BoEB5Ei92XbPn+6xK7jfFmBUW5V4hVq5Y91+kHpmHv7GNAJPuhEDwNKt2oXFG4ODyMcK
	 d2R6y7lu45x9bLePME06/v3hX5yAf0XefjrkMoXvVK+NuyKLf1ouHOFih3JXjNIHVtU4u
	 IfjkPuwyaXPo8qI/mFiua37pp9k2fXIbY1DgIpjBBiJkBTDmSbTdoO4hNnFUQvkBPmmce
	 /EcaJhUDF5IRNOXpLWyJMckAv06V4Uh1+GIMwQKm4KGSOGysvnW8b1aUCoH3gMkRU78G3
	 Bik1sLgTbBxkotGP5lwROXMR+5lbjiunpFU//Aoac95zLXvB0rlwtEnVWCKV2Pqtu9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JY8XJOEJ;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECCA606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ECCA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JY8XJOEJ
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1424525b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793295085; x=1793899885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSIslHYAdaXfJ/6/15cY4EI+1/izn+/DHEzPa9wprnI=;
        b=JY8XJOEJuBC9fU+YlQNtGGQzPiI9s6gIriGR0T0B4hin0I8UONoZaXa56WnmqfAMex
         hmZ0TD1lJiySUIahM1XZEXp5CayPU1NRxOTxb0YDx6wc5FD7BbSGvRpsR/ktDd8PqwkL
         a+n3VtSUlWOhrOPNgMIlz2ESzcFOmrkD594nd5nJmAqvjy8sKBTCM3VIrjmTg7LOiUKZ
         HRGYc7sVDjcpR7hnlrj6n6RpFuI0FtuvkHAnw9mz2BzW7sm7N8hLbyMG5cptezEEcQbx
         dSLGVn6LJROEVC7DcytCgpW673b81ntFsbKzgALbA1oS3AedMgeq1Ehn82aKRZ3/eDFs
         DnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295085; x=1793899885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSIslHYAdaXfJ/6/15cY4EI+1/izn+/DHEzPa9wprnI=;
        b=ub3bIiRvypLoyyivxYIYUelEhewE0KVBo7w/a/w9mlvAGRSdOunopXZb2DRO4uU32A
         a6UlNTVIqNLuO3smp4qHH67dGYQlphhiE8gFvt8S2yRUla4baJ9qkbh3phFhVCL/bSL1
         LnMwQs69xsDohWOBibmWtboLFrsFIjbHjVameOz0JY1h+xCEt5SEnK+OlhRSuYQjm/UU
         R1XsWN0/pQ2dp5Ei0dvgkdZL2FixA0TH290810Kx5xl6YLAw8dzkMV9TPgheyxs6LfWu
         bfMf80vJuWDbo3NT86mtq4bZUJCCZ6tJGRpgQIxqvi09BIo6E6wJcouzJUlfFPl3siuv
         z+zQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTWFEYKD3g4rS0/AI00L3U0UGaZyyKLbpVU6tV4bOWhJ8du0WDmPfsIoKi4qbNoiTggffdKkJoQXVjoGA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+YnjUrNjPCIN5Gzo2MjJ1t/fX2TxREdSPs3vMyCbNNHRHjduG
	gWvVS8NFZ6U1a7IKH7CK6+/quGaWCGuf/BungIh4XTinau1/96exMt1H
X-Gm-Gg: AYBFou2HHXOdwEcXu67dXpAyNLdgBx3xws+PlX21au3JPBssY/cipm5qkklWkBXGsVk
	6RNhYbt+pF0LnAf4Q6oG5bNNQDfxgf+94aEP8Zv8FOT6T1Fne9s4CVKxcrwfw1LvBPsDGGeRlf/
	+U/4jVoITv53gV/ed4YOVS+d6vHh6bfuslFwy+Q0Y26WVtEFMtZTjSD+xfOXClQRf+/tzj4oF/Q
	+EMDaS+m3NrmnbSuQDuGYkwHrfvrjr9i+mKDry4J4rvMyKu/oa+jHy0bf/n3dLg5WcYB7nTLCDz
	rRv7YmRgdStQs7wGQYF1NNMny2PzF3nvTE8HKcI+xhMkG9O3CSqxdkKnsR/aTpP7MKPccT3xNDV
	uhzwTMk7JUwMlNjPKm0A2O7dNRSawIbgrrY9voGBlbLfzViNFDN73VM6Q3QO3n+t/ooCFWVynzA
	ibMYnY9zu+FkCby8CpjLV0roDGFglxNssNY9L7wGNdFxPrtsUsLn2I+VS5g14rEp+EQXwj2/pTF
	TWobeBlppSV/nquv6O6Yz892yiXlhPp/sOqljB/DxU7srW0ScgZqT8u/ohy0ziO7tqBmFm/6plM
	a/1S+iH9cTnWZ/oHnlXCCmxZ01cYJK9kf/hT6JwGlwTmNwu/FYzXzzcxzSCaf4cYjL4KNvQLv0u
	6Fe1i0APfC/TaNXvvYA/PPOctOW16ipfGA9c1Oc3Ht2PdvPboIQdJb2Ze4G2tvLTQt3A0ExnDGw
	RIug==
X-Received: by 2002:a05:6a20:431b:b0:3e2:7c10:d482 with SMTP id adf61e73a8af0-3e9022f304amr5613114637.16.1793295085422;
        Thu, 29 Oct 2026 10:31:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb0548fa57sm94180a12.13.2026.10.29.10.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:31:23 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@openwrt.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3] net: bgmac: fix RX frame length check
Date: Thu, 29 Oct 2026 10:31:22 -0700
Message-ID: <20261029173122.29636-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

While reviewing commit 77dac783f113
("net: bgmac: rate limit RX error messages"), Florian spotted that the RX
length sanity check compares the length reported in the RX header against
BGMAC_RX_ALLOC_SIZE. That is the size of the whole fragment, including the
space reserved for struct skb_shared_info. The data area handed to the
hardware is only BGMAC_RX_BUF_SIZE bytes, and the frame starts
BGMAC_RX_FRAME_OFFSET bytes into it, so at most BGMAC_RX_MAX_FRAME_SIZE
bytes of a frame fit in one RX buffer.

A corrupted length between those two limits passes the check, and the
following skb_put() runs past the skb tailroom and calls
skb_over_panic() instead of dropping the frame.

The check has no lower bound either. A length below ETH_FCS_LEN wraps
when the FCS is subtracted, so skb_put() asks for almost 64 KiB and hits
the same skb_over_panic(). A length that leaves less than an Ethernet
header makes eth_type_trans() parse bytes the hardware never wrote.

Reject lengths below ETH_HLEN + ETH_FCS_LEN or above
BGMAC_RX_MAX_FRAME_SIZE, and print the bad length.

Only compile tested. Not tested on hardware.

Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 v3: add a lower bound
 v2: replace Suggested-by with description.
 drivers/net/ethernet/broadcom/bgmac.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 669eb7ce7d40..b5e1d3c0003d 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -460,10 +460,11 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 				break;
 			}
 
-			if (len > BGMAC_RX_ALLOC_SIZE) {
+			if (len < ETH_HLEN + ETH_FCS_LEN ||
+			    len > BGMAC_RX_MAX_FRAME_SIZE) {
 				if (net_ratelimit())
-					netdev_err(bgmac->net_dev, "Found oversized packet at slot %d, DMA issue!\n",
-						   ring->start);
+					netdev_err(bgmac->net_dev, "Found packet with invalid length %u at slot %d, DMA issue!\n",
+						   len, ring->start);
 				put_page(virt_to_head_page(buf));
 				bgmac->net_dev->stats.rx_length_errors++;
 				bgmac->net_dev->stats.rx_errors++;
-- 
2.56.0

