Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140326;
	b=0505zCb0tBmp156tlze2Z0Kpf0Un03yaztlbfxFh+1HMM3szKGJq3+Ei5hzcTeIJInrD
	 jdAKQc/DbXyvUFCJTmrP+WZXvuSYZj9cSCg3RY++UVcJGj2WXo2dnZbYBU6Zcz58ewX77
	 f7AYct8uxW8o1qLfjw29LUvLsorXEWD3yjJCifWVsKEyVq1mxOB1EpDAzozdSHLNnPKOK
	 BuSskGlLRaisz/Gixi3zcsp66jS9H9xzHMJXZGsPZ2zYZIhRPf6mhyRI2Y8Aas/ANGFKj
	 pOMNCVVCKmSvZVMeu+C4iuPIGkUi7D/FfRx0kvw7Jfe1todUf5IOqiz9dTO1kYmtLXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kPicyF0JOQLNW+JQsO0wEWL93KfdqOhJFo6fwT6dbS4=;
	b=zYZdytXxj2srALOvs5+YabGYOtD+Sb4IVRyYF56oTdNX2n11Ed6kbIfthQsUPQmIe6vW
	 d6BKebv15m85kGE3PvqxUWjQ1hcM5YHCExh5f/idNEyQiBf8yr+MsOW4bz40ya1L2Nji3
	 djR7fpRXCfms5oh4fNzaeihSfY1Y+5h6eWy8hg76TSLA9PDjb0L8CtkIPBFKRUM+ZCuUT
	 aS3CBai5jckXbndEZNZQUGarlRDZOLnAWZ5YjNfPs6QCBvcXJj0e+/gcdJbDmlCalwj1P
	 6IXDqLG1LrmG4V1kb7ZnjhbZCR9NTyj05ScBILvMeM4GoBF16rCYJjd32t4wPz5xE3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HQU/hEHj";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA361606A326
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA361606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQU/hEHj
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-157fe9d771bso404423c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140325; x=1793745125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPicyF0JOQLNW+JQsO0wEWL93KfdqOhJFo6fwT6dbS4=;
        b=HQU/hEHjFeTBUq1NIuSddFR6HXYfipg/o3Qp1IHbYAgdnv8Eb3D9BMuGMCqrSNfQC3
         WraVlKhQg7VbPDYava2pH7ri/i0nF/YSFb++Fun11YBQdkZpHjdTLPaxZ768ouKCip4j
         1WYzTzrso2bjbG3rBQl1ty8Rb9XqjkemRf/t22sAGRqZskgyI/rjcpfaG6gV+ghwB4di
         SFaiUuPjvabY5jZMaIjzjBNouWj61zpbEqHCKKSsG5JBwh6otcJDnGN2FgNBwI1UV4ty
         MuMm/NZDPivqioz1hbHU1vLqkV0CWLtvoPrCw02mHQQOZYOBYDQ3GrCYpRwmdrZniv8M
         /ekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140325; x=1793745125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kPicyF0JOQLNW+JQsO0wEWL93KfdqOhJFo6fwT6dbS4=;
        b=TsW8z9lw2H4jzek/xFxn8wtMd7joM5rRhf/UmFJ2FM5A5eYGLvPqpbt+tAyK6WjlLc
         ehwYe14/0aWLwhDy7eUardBpe7KRAEvX0BUltJftEp5e/3NpdJmqTPi+s0ccHyqs+3m7
         5oEvyFSv7BvpJSNNaNVNvsipyjBQUABcv8CWGBLEkK0txyVnsbdXToYhrL0jKH5LoI0o
         0l7xAeOZEM2HtbjwV4nFpHn5MCtjpEQ4Pr3rmgGSRft8ffnnzGBtOkavHZB0R3W1GtST
         WLqvAY+HI+5obdRWcgqEHOMiEYmFCQODcSOvIRUsuRUkU390IMWRhh4ut7ZSHAiSJ/1W
         f32A==
X-Forwarded-Encrypted: i=1; AKwUvBxE9jhYdaMHkw5pJihZgNmyh1ugyfftb0RSOIxY9omDHkHxe5nZUDgMpo8prxHQGoBg7Qkjrv9vEiaL5LE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh+BmNdaKdV3yvzScGgh2RO21ZPCKkn9DQXNxBvzTkqwjimtBi
	VXDc4GIkPxspiltpRWi+OMjrjo1TvNxeLr91MFaLELJ8TGURmShSAjTm
X-Gm-Gg: AYBFou1yRdv/la56frU9uXQVY9HdLnR58R6pEKRgVdSG2Rw4awu2/mg/gQtpMtflsv4
	NpXbO9o8Nxx/h2lSVWpy8foSCtkoP/29oJWQDQP+JMJ+kGkx+zqE+8EEgmWXiBbkcopLL8wIABF
	o15TbsSuGRXAs/ECZnlh+CzE50hzwxP0o5m0706vZ4fmpprtPRrcPzmujpKichCuGtrc8E7dlsg
	I7/0kTSFC3+igMug4JTpiVSfdyPOOctu2nN6chqROvfTlP3VNT8sCNmWArx5jbTDoObZqpAF4Ov
	3m7r+JjaPDv1oz/9PDGqWPqoReKxLMSzb2TOm4ECJ7Senx7gZ7iYZh6ASDZwkTMLIcIjp7Jz5ui
	a+BNrpah5/AtDQPXOOd5uWBOoacW3IkPtH3dRoQLBTLjgwXcj9a4neOUOmHTXa0mO5PUgcu0TbJ
	DGoSuRsd9p8lh0QBG7p6qnsfjxwpVaMPfFJRZ3zLitgbzVLAhsWBrf8SLPGU0K4GJDOO8NBakJx
	bgh7pbFT78VNj5608VL1jP8FGvwLCZkCIui5l8SueQHatdCBoQO0fatWboXvb/ADOoaavMPJFOA
	G8od2Q==
X-Received: by 2002:a05:7022:6b96:b0:19a:51da:f54f with SMTP id a92af1059eb24-1a6cd498fffmr1097038c88.14.1793140324678;
        Tue, 27 Oct 2026 15:32:04 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d98c93d7sm1130735c88.13.2026.10.27.15.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:32:00 -0700 (PDT)
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
Subject: [PATCH net 05/11] net: au1000: serialize TX completion with packet submission
Date: Tue, 27 Oct 2026 15:31:34 -0700
Message-ID: <20261027223140.3774570-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027223140.3774570-1-f.fainelli@gmail.com>
References: <20261027223140.3774570-1-f.fainelli@gmail.com>
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

TX completion runs in hard IRQ context while ndo_start_xmit updates the
same descriptors and ring state without locking. In particular, an
interrupt between netif_stop_queue() and setting tx_full can miss the
wakeup and leave the queue stopped until the watchdog runs. Use the
existing IRQ-safe device lock in both paths to serialize descriptor
reclamation and queue state changes.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index a507a524370f..90887dac26bc 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -873,7 +873,9 @@ static void au1000_tx_ack(struct net_device *dev)
 {
 	struct au1000_private *aup = netdev_priv(dev);
 	struct tx_dma *ptxd;
+	unsigned long flags;
 
+	spin_lock_irqsave(&aup->lock, flags);
 	ptxd = aup->tx_dma_ring[aup->tx_tail];
 
 	while (ptxd->buff_stat & TX_T_DONE) {
@@ -890,6 +892,8 @@ static void au1000_tx_ack(struct net_device *dev)
 			netif_wake_queue(dev);
 		}
 	}
+
+	spin_unlock_irqrestore(&aup->lock, flags);
 }
 
 /*
@@ -973,17 +977,20 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
 	u32 buff_stat;
 	struct db_dest *pDB;
 	int i;
+	unsigned long flags;
 
 	netif_dbg(aup, tx_queued, dev, "tx: aup %x len=%d, data=%p, head %d\n",
 				(unsigned)aup, skb->len,
 				skb->data, aup->tx_head);
 
+	spin_lock_irqsave(&aup->lock, flags);
 	ptxd = aup->tx_dma_ring[aup->tx_head];
 	buff_stat = ptxd->buff_stat;
 	if (buff_stat & TX_DMA_ENABLE) {
 		/* We've wrapped around and the transmitter is still busy */
 		netif_stop_queue(dev);
 		aup->tx_full = 1;
+		spin_unlock_irqrestore(&aup->lock, flags);
 		return NETDEV_TX_BUSY;
 	} else if (buff_stat & TX_T_DONE) {
 		au1000_update_tx_stats(dev, ptxd->status);
@@ -1012,6 +1019,7 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
 	wmb(); /* drain writebuffer */
 	dev_kfree_skb(skb);
 	aup->tx_head = (aup->tx_head + 1) & (NUM_TX_DMA - 1);
+	spin_unlock_irqrestore(&aup->lock, flags);
 	return NETDEV_TX_OK;
 }
 
-- 
2.53.0

