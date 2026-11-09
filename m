Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228607;
	b=1B6FtIffRIWe+SVTHO4nae8CfkBtdySyoSyT9Arnu84TOgqg4Dd86/rgzUGcsJDu6hnd
	 IvGoshePN3DulmfS0qMv5ZUcZYUaxpcm0Gmj8LXtWWo/Vj2sFhOB7GsjO1EP4TZhNbHWq
	 CTswV3KwKaXP+8EINMGRSrl9BIV6pTw2oAPpynRyKHnDOz1kvdjgl6PwQWezrBfmN8rRJ
	 LJQHkeGBmlVQYrQ6CYyVqD9tpSaT8mcOcQ919HQBLUznpabOKHrLznHe9wtd9SdwnHu1L
	 FBguXSumTWLoEii005zgYq042wx30ANFAjyiSvsRYYEpVXlCakLc8VYbabb3TUYe/jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ULzCO0JjMJTSMtXSK5ToDUte4FnYbn3iov4P4pXWrOs=;
	b=AXM50hedS5EGtGcGUhoqk5MaS67MyUTud4W+3o1KsVDSRyfonn1jLvWHaFFvGXP8ZcKS
	 QJVU42PR6Wsx9WWULC2JD9UvB1VuCTa/A5BOgvclVIibveU4qJPv2c15T5wDI4//cI2Dd
	 78TA3vcGeC+CT0Wc4fTawMuUvR3zfiCcOwNbfGrepxcjhuxvvtHBymJo+pUWRe+rQohoK
	 dHm7/zHdrCzLSzZZeme6Jlw5KdsxTDeuGfUIdrlwHUjpZAv+fzRhRnblINBDHmsGMMa8g
	 d2pP5aZWHUh1WViHU49HqEIBVYoKlSciGgWSI7racOy5W8vpGYvLQsd2WnMRv0orYJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWSEio55;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17609606EE87
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17609606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWSEio55
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37000e7234bso625290eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794228606; x=1794833406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ULzCO0JjMJTSMtXSK5ToDUte4FnYbn3iov4P4pXWrOs=;
        b=VWSEio55nDx45swB4s1+3i/yAB+YajUhF3GaZcaZ7QhmGyeEeDwdL5vIbNGBT5YE3k
         q+1Bg4f+Jx7sm/LjeiV30LCtDJ/eTaXYYxB19uRBRdvsWkrNfcA80S8wkQ1VAAL4RdZP
         Q4LhjnwbHYDacfReX+O3dpkl3E5vQaV2yzca2A5bg61YoyXn8Yl6Y0ANaEGHUwMGUdya
         x55v81jk+GK5zZ3PJ2eaYABty7C6oCbOj7Q4LImkYG9XVLeYGr/UfynJoVvhy2w+vnRm
         U9CqDwr/2oNc1bNt1/WXslmgCBGC676tXwonBZAI7ktN5HLLstyu0AqnOvUiugk2EAS3
         Eunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228606; x=1794833406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULzCO0JjMJTSMtXSK5ToDUte4FnYbn3iov4P4pXWrOs=;
        b=OMM6EfmB6WnbO2MwUGOk5XyiLyMqekOFy8KXyjr74qBZUO6e8y+JorYdiazMKVrL3Z
         ekymkI4n8ek6WzkYsYs6oU8VDTixVdVLOcnqIdEyNKEmTFBpjpE6SLb8Xu4z2Ml20dkV
         tAnWtIzzP5Dq5H3E3Cy1qF1x9RsWc14/L3fq0vRxXoOGW0efauX347PvBll6a4CoBAly
         45H93fu6lFN0vGWX0nX2r+pgfywfQZKS6ect/dwUNwSy7F9GYxR84+t+FsXaUN4n/IvX
         iQh4s2VJrXw5/44KfSw/biPNB4U60pcfDglKrCEvMEOzZIY5BwDrPLcxZZh09/OS47NE
         Z2mQ==
X-Forwarded-Encrypted: i=1; AL+hErGHXm602+voZsryP9F54Dodb89ytza7s1zTIrjDCOhCM7A+r8wo10ls5zWNgW2PljFxJa5BlgTQLheXt3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Bf5TrFUzc8IB98aaydjrnFptm9v7OORfO5MdDswd5bznUEYEB
	Tco53tIWEZlUcg65VXVxFgJmBgJP0zO5IgG5veEfRWNvqvp+Lk6NATes
X-Gm-Gg: AYBFou2WmByxDQnj7VISS11vl5TsnbMM7i0EWnFlJK1oZz5CYSkcCX/Zuu6qTagkPGr
	5OVIbrFpiQc7QvkdxZOwhyrvGi6HoXNnYu6H4Tbm6CwTiCDW/U3pxIjrsGn2ZcmxiI/whovagSr
	rS3kkiO8llzeJ26BUY2jYzBS3XRGdERFqrUrJ3/5ZstAL8lqr7zC9askhp6NQhfjy0plQt1Vutd
	3b8Zcod8lCTUV0oPHp9uScpI4fcUth8No6xWdkI0sSisRG5rNmieBChZwwy6JxgHuQMI/FW6UHh
	7iS/OG5K8KxpNqCESbj6bV5sOnUdNflTPRzt+p43ugcGvYd7se1MpkF4+giC3nqaiowdZh4U38C
	tPH7KYOtdCMcNcJBL2ksQ2jRbnKsKBsuPeUICwu36D7sdAt9mhpMXids0QluBlBUWeZDnnBFwX7
	HalzEp1yVcYlr2P6Qox7GUhkiNl2H7G0RxQ7L71DOYlUpZimljFnl/NiE1YSkrPlALWt5SoqFcv
	fgyTb9XHMI3t5lxx7DUvp8jiUY5EvuApxwswQpFllKlNoGvqh9O6+QXIlPnFvkHW4GRk6K3jyov
	gh5i4J9bwNXGKWh7rqcbsGCl5pWxQ7tBBFb3s/2dw/dcUCdM
X-Received: by 2002:a05:7300:a223:b0:36a:5042:85b1 with SMTP id 5a478bee46e88-3725302be58mr7671219eec.2.1794228605882;
        Mon, 09 Nov 2026 04:50:05 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f444csm20376602eec.19.2026.11.09.04.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:50:05 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Alexandru Tachici <alexandru.tachici@analog.com>
Cc: Lennart Franzen <lennart@lfdomain.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH net] net: adin1110: flush rx_mode_work on stop to avoid use-after-free
Date: Mon,  9 Nov 2026 21:49:53 +0900
Message-ID: <20261109124953.1604903-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

adin1110_set_rx_mode() defers the hardware filter update to rx_mode_work
(adin1110_rx_mode_work), which dereferences the port private data via
container_of(). adin1110_net_stop() flushes tx_work but not rx_mode_work,
and nothing else ever cancels it.

The netdevs are registered with devm_register_netdev(), so on unbind the
port_priv (netdev_priv) memory is freed by devres. A rx-mode update
queued shortly before the interface goes down can therefore still be
pending after the device is freed, and adin1110_rx_mode_work() then runs
against freed memory (use-after-free).

Flush rx_mode_work in adin1110_net_stop(), next to the existing tx_work
flush, so both deferred works are drained before the device can be torn
down. adin1110_rx_mode_work() does not re-queue itself.

Found by static analysis and code review; not tested on real hardware
(needs an ADIN1110/ADIN2111 SPI Ethernet device).

Fixes: bc93e19d088b ("net: ethernet: adi: Add ADIN1110 support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/net/ethernet/adi/adin1110.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/adi/adin1110.c b/drivers/net/ethernet/adi/adin1110.c
index 53fac3d..788cf4d 100644
--- a/drivers/net/ethernet/adi/adin1110.c
+++ b/drivers/net/ethernet/adi/adin1110.c
@@ -956,6 +956,7 @@ static int adin1110_net_stop(struct net_device *net_dev)
 
 	netif_stop_queue(port_priv->netdev);
 	flush_work(&port_priv->tx_work);
+	flush_work(&port_priv->rx_mode_work);
 	phy_stop(port_priv->phydev);
 
 	return 0;
-- 
2.43.0

