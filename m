Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459266;
	b=FSe1lM80AxS6itEc9f9MnvFbRplKMfdHRtGdq4T/wd+YCArA3bmI+PEM7Hex41TBZMW9
	 I59bAUbAjMfQdkQD7Pdiwco0njgjAwoOt3u2l2BqLbU1VTRU1md9DY+olIg6Bnn/mW3nB
	 4CPUD+7uSn0BFtCZC1xPXYEoq52L8raiAcEe3JeSURk4/ix5TdfDEoxHFOdvEqcKHrjB2
	 1lnYbRgRXCw4Ue4fwkPZ0Y5EY6MjAAUpFCowUikxkwfQjYlJaZSJe9KZVZ58mRfz9S5Ow
	 pB7wRLC+dmzZIBChj7SeJHgEkiEgkajxXOl9DjEAkpF0RLRST8lKGzRlb6goRz8F/aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RAq9n/kNrP7BlUgARluwnVEw0T6kr6FCdHtXIgtVkeM=;
	b=TkJAWOEynMmFsYQFX57hsNzK2nMd+YIZrfvEV9PmNr8Rw92jQvoD0lKVAnsANKVV8ajV
	 tiVTKJJh72zBmGqmNeBI7/7abCXepNt/MIdw4mmk0gWRy49eq3PSBtl5IUYf++BzVm7fn
	 6JFVB3dOu2fjzSS60h6zh5KR5rol7w4Vqi2ZR8jdALFQumVvc5vqqHOOUvxLezKxPazH3
	 8rE9GpU0CYIOmOaBUy5c0mfk6DU9M2vEaBrj3j5j5OHS3ySbrDYLNHYnxmR1r5ERHqp9o
	 rsESzbyMHx+bsk6SmIMj4pxDFXwluZ9z58EPUsWIkMm5gqEGFfJCSABIkjxaVkZ2VGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=spDcTELD;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADCF606A898
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AADCF606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=spDcTELD
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37628596783so3652162eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459265; x=1795064065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAq9n/kNrP7BlUgARluwnVEw0T6kr6FCdHtXIgtVkeM=;
        b=spDcTELDFQlcTf19OdZXBxhtBvEGg4kq4pwPb1twI9/qO4gMpLoFm3DXDFfofVF5Xs
         Zgwx1je/2rmlyXNRFHSAu3PW34a3/XQUdfApr3W9NkndQTAU0CEesCkAmXvZEhsbgkQ1
         Vln9R5zmJc+ypxxE7usn8nE74ZSjSvGiGFfP513vGaYmkn6y9EL042KLawQyiPgg3l8R
         6eYQ8CHySmPTNVNxW9E567dW6scIE/PYDrkAy8Tv7qwdRAaFTLpWmG59yxRwAjUZe6iJ
         wdYH4xPHRqCnsV/UXAHOrj74jM/7LvaB7MnHdRccV1HNJyWrigjIy1qu2HgZ2kiWs/eg
         f1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459265; x=1795064065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAq9n/kNrP7BlUgARluwnVEw0T6kr6FCdHtXIgtVkeM=;
        b=xDgU/kCgO/TCiC0hn6g0LVRYRndMx1fiIcUdP/K4Gtvbm+Mqekl1xwtwaLzKRKK2m4
         u0dDJld/PU78ZyAxqcP7ympJwgMfqSxpJE7YUb7HnIGuXcyaOmu2SWywFjlnABXdLqty
         4zZVGOvmT/l/6ZTbt4uRkkcQsmTP+8Pz/5yXFmKGTUQkz7otEI0c8hBgqzzdELxig1uq
         lzHl2KuJVQL2Z1RP2Ex4BzVkhmgBt/O+ZwBltFULTyJ/kjL9nMnhnFOuWr0Z2ezPyj5r
         2cYNsHquNBf5FYZpw8KPgAxTC3Kq3Fs8DowlVUsD/7FrjH0A+wFaJeA5uDrRwk/o2ldP
         aNWg==
X-Forwarded-Encrypted: i=1; AL+hErEr9lMWFyOI7Xj8ARXK1KuWwvB8kY5YLL0m+SURRy60SXEFVZulJdOirMLa0MuLpg6ldhgjmv0EYq8iBh4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zjy3zy4lvoelXg2N13EHgcJ80cPrgKsn+UCRqDW7CB9pBtNmB
	VAV1xvyHZkMnAJh0o2+AAijxEYpY2o6Rx60SAaHBATHb4fIk6d4QCW5C
X-Gm-Gg: AYBFou0j3S4l1yMr+H1j1k8wA+6/K77ovXZ6CZHNqvK/3MgX/Vb7OZllzKEHpVk4o5n
	BrEOb2teFu8G/Ggno0UDaSAMJwZ23/h+S7ykM/KLp5bJf2jYB4cSikgc8JG/lGTURMBy8Fi9/vl
	o9+6asFgGO3MiFFoKeTy8zHWbZ3dCSgYe1TYUkeLJTDqAmhkTFMyiy9W3skoEIa4lbgkDoz5dY2
	dej8g/k9gO6Msop/rxZ3brkzAPBNeAzdI3CdyBERkAi/7YcM7pbLZgIuL5aIQJzBC66a24gQyi0
	O2MFecjZ14GT5cgDqoknNeAKga+ORIdO3q4MuZmT7ROHXAKKct4HsHiV7K/UUwfF8rHFMEZGqdn
	JCAVISHvm/lQFqxtORVz6oge0IKQfdgVtmTQcpREwNJqNadQ4k7i+fdMq/paUh+2fVq1jvON+o1
	raGuYcb+9O7PzGCbsVuG5SY6PeljXQ9yAv1D74/uL+aFOhrvxIpPw/3elIknBjaIMQnBvn/liFa
	Lue79rnQxCqROczCaqaEgkNXcY17b4XmWa4I0kEHHhvQBV4es4xKdJAWK49xXqwXtJB7qGgbk9c
	+Bl5Oz46JXZgoh8s05GKTg0OQqKrIA==
X-Received: by 2002:a05:693c:41c2:10b0:36e:58f3:6f0e with SMTP id 5a478bee46e88-37682f9334fmr5020480eec.5.1794459264772;
        Wed, 11 Nov 2026 20:54:24 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm23921585eec.17.2026.11.11.20.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:54:22 -0800 (PST)
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
Subject: [PATCH net v2 12/12] net: au1000: reject frames larger than the TX bounce buffer
Date: Wed, 11 Nov 2026 20:52:54 -0800
Message-ID: <20261112045301.3669532-13-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112045301.3669532-1-f.fainelli@gmail.com>
References: <20261112045301.3669532-1-f.fainelli@gmail.com>
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

au1000_tx() copies skb->len bytes into a MAX_BUF_SIZE coherent buffer
without checking the length. Oversized non-GSO packets can reach this
path through AF_PACKET with PACKET_VNET_HDR and PACKET_TX_RING, whose
MTU checks are skipped when a virtio header is present. The copy can
corrupt neighboring DMA buffers or run beyond the coherent allocation.

Drop oversized packets before touching the ring or copying any data,
and account them in tx_dropped. Use an IRQ-safe skb free for netpoll.

Identified by Sashiko AI review; implementation and validation assisted
by OpenAI Codex. An extracted-function harness passed ASan/UBSan checks
for 2049- and 4096-byte drops and a 2048-byte accepted frame, as well as
TX ring regression cases. MIPS driver compilation and checkpatch passed.
The complete AF_PACKET trigger and hardware operation were not tested.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index d60430a3795e..d8855ccf87aa 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -1008,6 +1008,12 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
 	int i;
 	unsigned long flags;
 
+	if (unlikely(skb->len > MAX_BUF_SIZE)) {
+		dev->stats.tx_dropped++;
+		dev_kfree_skb_any(skb);
+		return NETDEV_TX_OK;
+	}
+
 	netif_dbg(aup, tx_queued, dev, "tx: aup %x len=%d, data=%p, head %d\n",
 				(unsigned)aup, skb->len,
 				skb->data, aup->tx_head);
-- 
2.53.0

