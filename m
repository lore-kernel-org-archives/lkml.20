Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EABC3E3C68
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365396; cv=none; b=SMfyqYDZcOKE5dMmuqlF+BmUyCegIJOnNY2rKHr4pJA7RDQF5CgQQVA9mx8wLTgUlSHyTkWjJYwK78+q8hF7esDj1pxbnNq8luMNUAuys4G2NspG54tZoBYfIiPIoZ7apm6sP91r1+jm0Panb6oVW22pvOt6zYV3uw0LKSkrgdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365396; c=relaxed/simple;
	bh=qfsHfNYeopaC2KHOpQEeAGY94hrcVDHpDGsEIwd3lxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ufPTj0W3MxNAeV3+s6hGwETUVABLruI4eCUoX0ujc5OSc9REKudV4GvPzEV0M0vo8A069i7DkipkRwfpP080he4NNPlSl6o6uym3s1gvxz/j6C2c11Sz0cAyeJ0OhE/71UvruFSb2SjBCkydN+ZYFwrjFByZoLDvWP5XWvkYSrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sPqTaiyG; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sPqTaiyG"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2df8c28a0b1so4917515ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792365393; x=1792970193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TX/6wyeHiY/2nSsVrn/GvE8vWNq9lTA3Z8+LlkuKRzg=;
        b=sPqTaiyGQUZngPgG8v3cTGSDnu0EEZ5PeGyZ/d6IgT8vTnH5hZI1M5bW7O72UwC5Qe
         x/PdV2lBlKYBlD/vGZ9UMdI3GiFPvkSrKtgnWmu0aVZo8q4wGuBdaDpc2tfxKIfFa911
         95ov16v+mWgbCMaT9wcaAAKSzr+OcEGP4lW6bvMW37s5y58eofmqSoK5tPPHfKGneYro
         brrPv8piXBwH7mhYQvceD5IS7EmihL1nYyhwBPvFaaIv+AcRfi/6aAnEkLbRFGul+NYt
         /fFUemqj1JPMBb5fEhit7Is+r4uhoVMfWZYTnOV+TchBOU23iBBqoDCekqU4pVBwTnms
         5CEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792365393; x=1792970193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TX/6wyeHiY/2nSsVrn/GvE8vWNq9lTA3Z8+LlkuKRzg=;
        b=jtbItiE7tZZ/b7IeuO4nQYpKiahjiXC5WW5BYFhakN3hyFNMEMl18qu62aMxSy/O4F
         OxVFIG6WTPRBH9dPWIDwrwCoziB9Jz6jwfBW+SEByQ6OlsJNQJtG51DoOa8ufr7ZSIz2
         CVP4BbQXuBMxlZo30B7EbAm22q/MxF1JXSGXeC43/MzDDU6BL3uxqp0+BG8opNNUi3sw
         VoentGpKpRWzhR47pFpL3jETBJVIaT4vY1g+NczxFh9LLKfwuaMKHBtIFZzCKKDe/bVB
         xwlawDXUbxmBgdZO7LZuBg7IzqwVfua1dN0y6uwKyem9DjECDeVBh6rAxI5rrLB60qUR
         DEYg==
X-Forwarded-Encrypted: i=1; AKwUvBz/UD6NfxfvzKiv7HLhQLnIdnkPWP5LUpDQXO5iQXnpizL7eP+p1M3Ldq6dUvhAi4ERQzjRbDGOfe+BrMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ5sQUEZtIEWyTwhIhevCqTlX2/qcrgAuJMDYQMf1z9Ws5Id/C
	2nlQopOM17M1M7tCx6KB1JZma+jjiGzYlL9Hu3DBOQcz4q+vJowjCmtL
X-Gm-Gg: AYBFou0PzO8tXp/V52h7h7fXicpk9roK6Q2zDRW6YtdfNLGXV8bxejFPADR2GvxQ5Ao
	w5l+NZyo2/BzyfsY5eaCvuEXi5In9Bwz4cqx3AP/tvlNeG8cOjmVEKfyZANGG+GoQFdxCVWrnhA
	QYSlbFTYQTsPhwzUAoNX+DFxoGBbxDRQxaNh0y+QkXcdORoYlvkAn2HtmOoN5oxk6vQLoHV4zQM
	9HvcCcC9pI/kmiRkWA00h/n1banQBhFWr5Q5iquoIRuVlYvTwXJDjq0SqZxVLvZYVlHpn2NkAZT
	BJ3Nq+2K2cPF6Vjmy7rO3GbmkWw6SgUJzVDe0ReLqAbC+giMIOuK3dBKiIO43hRGTc8lX128GKr
	TZzvyYDc18ezRGVJLgBhJZIIOuIeaoUAeD8InPRqVCcxsTshRn+jEim7w+iSLfqX+pKLX5pW1WH
	qeOk3wONP9966bzzLZ+yElv/corJUJsHhgGY1w7I9otmC43dmGZWV0Oo1BuCSpPz8R78Z1MNINr
	Zy75CybLPvSx8qmP9jqCRn1tyGHyg4O+2TL5z9UaHTEIl9OCfmuhRjYvI7SDMTTRS7hmtE6jiyb
	aHuFD+jXd3+sO92Lqpdfl4pWe68LCFEkG3RBIqduGNDkakT4
X-Received: by 2002:a17:903:1450:b0:2dd:ad73:5b6d with SMTP id d9443c01a7336-2e9a6d2f037mr43829215ad.29.1792365393591;
        Sun, 18 Oct 2026 16:16:33 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804e80sm32607215ad.23.2026.10.18.16.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 16:16:32 -0700 (PDT)
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
Subject: [PATCH net] net: bgmac: rate limit RX error messages
Date: Sun, 18 Oct 2026 16:16:29 -0700
Message-ID: <20261018231629.39734-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the RX ring is full the RX FIFO overflows. With RX overflow
continue enabled, the DMA engine then writes one frame with a bogus
length (always 0x45c2 on a BCM4716), which the driver drops with
"Found oversized packet at slot %d, DMA issue!".

Under sustained overload this happens on every NAPI poll. On an Asus
RT-N16 a 950 Mbit/s UDP stream to the router printed about 1450 such
lines in 20 seconds. The messages are printed from NAPI context, so
with a serial console the router spends most of its time printing.

The frames are already accounted in rx_length_errors and rx_errors.
Rate limit both RX error messages. With this change the same flood
printed 60 lines while rx_length_errors counted 14297 dropped frames.

Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 1835266fdd09..b3a92ae95de3 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -447,16 +447,18 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 
 			/* Check for poison and drop or pass the packet */
 			if (len == 0xdead && flags == 0xbeef) {
-				netdev_err(bgmac->net_dev, "Found poisoned packet at slot %d, DMA issue!\n",
-					   ring->start);
+				if (net_ratelimit())
+					netdev_err(bgmac->net_dev, "Found poisoned packet at slot %d, DMA issue!\n",
+						   ring->start);
 				put_page(virt_to_head_page(buf));
 				bgmac->net_dev->stats.rx_errors++;
 				break;
 			}
 
 			if (len > BGMAC_RX_ALLOC_SIZE) {
-				netdev_err(bgmac->net_dev, "Found oversized packet at slot %d, DMA issue!\n",
-					   ring->start);
+				if (net_ratelimit())
+					netdev_err(bgmac->net_dev, "Found oversized packet at slot %d, DMA issue!\n",
+						   ring->start);
 				put_page(virt_to_head_page(buf));
 				bgmac->net_dev->stats.rx_length_errors++;
 				bgmac->net_dev->stats.rx_errors++;
-- 
2.56.0

