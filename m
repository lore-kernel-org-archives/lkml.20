Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060425;
	b=0hAwlIQO2Qe1ze/Yet8Ls7Xqi7AOiq/X2WPVSoSNDTsXT1AfrmEc53X55jWYqXoUsK0N
	 eYxHCr1D6a6dUDTdpa6POZpQFlGZfBXbQLwid1d7Y5/ZpAZnZkAmWcWvjINXHS1YIr3DC
	 j+yyKm0z/6iKmFS3GpJr+VzOcTW+KXnYj8nff+dEkthQlRzZxCXQdiccF8TbQib/YEHs0
	 eKjdfhXJGRBgGk/N+lZ1V5SgiDpFeOVCbs+qQDDk2wA15yYsBtUNUKBPWHcZfeBKfY9NB
	 DhlSCB9TLO9nczwNsVe6Te+a2b3Da5UnKyxBtIRKAuchZxRQt/71JqytS7Gsx3XZllw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ngyvw7W1wldCSbIp2eT/kVHJ8HXnUw9pEjSsrIxeEVQ=;
	b=QAwQmwcWgU/9syNeyAnfwxXDITvVwVvYvGWRkvJYs9iIOmLDYiVsqV/kBeKkB0QTzV5R
	 GYxmsTDeGcnXi6oauCtxXJG8MCNq1ag5VM2eyzg2ea3OmqJGmWfjySu4JCpx2i9G/mzt5
	 jnZggBrtCjC2N2Y6LHNvCgTIgZHnD8Z9ThmAPQL7VwORBUJ1rid+HnE6/8Vf3JuCaJ/Zv
	 V1yNUGP0S2cEKbvnuGXrmlhIbv9E6i/zki5iAsf/qPV/BNajDsVU7cmMxaCgxsiMJmQIs
	 yQb1SwGvyt6sAInRTz6gTI+dCoHqIJNpiTihAoY3aIPHVGMUObaB+Kg2IMSlUJWCDpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+KvkcLr;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13500606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13500606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+KvkcLr
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-19305bcb72cso1486830c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060424; x=1794665224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ngyvw7W1wldCSbIp2eT/kVHJ8HXnUw9pEjSsrIxeEVQ=;
        b=d+KvkcLr03VEL/Dw8mCET7X/fPun7qHPwWG088o+U2t1dmqLcJuMjlgmXhQQtIWS9x
         yo1b+vPZ9d0v8CDFXjPpnhrbSzdkxTk3wEXDHNtfCdVZXJRF6O/Z2bLJ9Aaqv07K341Z
         AbmBU/pbPrXyQfdhaHa208u/2JvsBIzXiIb+DWxYQ4ABAJibl8JCoVvDFhSX9hfO5dvO
         5tZHLVtpBLoqncTkIiXM/l6u1oIiEAuMVdRV03PAalY0QVtlscJRXuq26S2PRydiVgp8
         e26BgBsUhMnASeEaLbSZKbi9HHZDzXFP6b2kM6yI6/V2XWId0gPBN4S+k9nFy1U560Sq
         ILow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060424; x=1794665224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngyvw7W1wldCSbIp2eT/kVHJ8HXnUw9pEjSsrIxeEVQ=;
        b=xPjQeDqvBLnc9HhGnmmBGPEHrw2szWZlomfKSCGf5RxmWqFne0VFPRjiTs1Jcc/nKC
         66O7DYXo5qV+d5aIdBedMGFVM4I8RMJFFN1+jQ64FFFOLSgQPocRo6+0qBU4gQ1ngznF
         Csj121BSgfigg5+tyuzVExUq9Hq7/gkeMSZjjfeysqNHQL6SDYiEdnH5JPAIFdRKcqPX
         uYStZJ5vz8to4kNGCbZYZihqw0z4OY+WXTBDMLuM9p6QF/GkTxZGeGZjfRvJDJIijJtF
         NJx6UL+i3UxxALf4pIhTua4qqyqqHmZmp6ALU+OV6lxfauMNt2zHN9EiHl+sueGlLh+c
         ATrA==
X-Gm-Message-State: APuU4Z+yHpzuiK1lijy7w6Yw7KeYfFcPvShpQ8PVNdlBBjlzwHB2+DPK
	wzfukdWmW7NtR2SZraa+h+V7RUtw8hH/xrFtGjw+n2M0MnATO3H873td
X-Gm-Gg: AYBFou1xP+m6XysjDcN+wS083EQpquIWv0mz/8hySyiJdGpcOpWzBCNh03WnmE+Fdaa
	Trtc2hLeriVAV0wyW5dQZ5g9PdV+jhQrhrkBQy6Ta8qxVp257dZZ9nM9a0DrxYcpKUHa/5KbtCh
	ItgL6h7yvJHYKvtQ+NPgxFae8Sp6wvf+ugrXwhOFO5MtOre6PpCyIX/5Xe2C8jjUyHpQ/rFDfl+
	cpLR3bUP1mTTIwAsGody8dIPe44sJlqm1MEjHSbXFsZO/9hjrNMdX+3QZH8vCCuGyY5T/PgQSYV
	vFb2lMhSkrhHeWp3MDYxaTleLZ1+rLi7QnqdT/FqZGhw0t9T4iWCmBd6trT+bh6eXXovbsDHZJA
	DoxiXl+RLFz2xvwdHR4ua5ybYalNOaZ1UE24xpneUnhiNiNve2ZziKWh7dG7UFIusECor8UJIja
	H4CCmk5XHvfulRSpn4x3AT+vRR09eYTOlYqEULNVgvmk9z8NKIN0T0aRCOx8ucHkuB8O30KBSvz
	nU9CLd55VJQnJXhnSEW1tunwOSedxgeobgg2kNioukY04Oe2+2azze8cb6Wt5NEL3EqaKH9hTrG
	2/fT0xGvxxQn4I/bHGgW4adtDgbCSFvZy85v98w+km5pISqi
X-Received: by 2002:a05:7022:b056:10b0:167:4198:2cb3 with SMTP id a92af1059eb24-1b25d3083a7mr7690558c88.18.1794060423886;
        Sat, 07 Nov 2026 06:07:03 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fd0000sm14558756eec.21.2026.11.07.06.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:07:03 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net: enc28j60: cancel deferred works on remove to avoid use-after-free
Date: Sat,  7 Nov 2026 23:06:49 +0900
Message-ID: <20261107140649.3702472-1-hj351016@gmail.com>
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

enc28j60 defers work to three work_structs that dereference the driver
private data via container_of(): tx_work (queued from ndo_start_xmit),
setrx_work (from ndo_set_rx_mode) and restart_work (from ndo_tx_timeout).
They run on the system workqueue and are never cancelled.

enc28j60_remove() calls unregister_netdev(), then free_irq(), then
free_netdev(). unregister_netdev() brings the interface down so no new
work is scheduled, but it does not cancel a work that was already queued
from an xmit, rx-mode change or TX timeout shortly before the device went
down. priv is netdev_priv() memory and is freed by free_netdev(), so a
still-pending work then runs enc28j60_tx_work_handler() /
enc28j60_setrx_work_handler() / enc28j60_restart_work_handler() against
freed memory (use-after-free).

Cancel the three works after unregister_netdev() (which guarantees no new
scheduling) and before free_netdev(), while priv is still valid. The
handlers do not re-queue themselves or each other, so cancelling each once
is sufficient.

Found by static analysis and code review; not tested on real hardware
(needs an ENC28J60 SPI Ethernet device).

Fixes: 3ec9c11da033 ("add driver for enc28j60 ethernet chip")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/net/ethernet/microchip/enc28j60.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/microchip/enc28j60.c b/drivers/net/ethernet/microchip/enc28j60.c
index d6c9491..5266912 100644
--- a/drivers/net/ethernet/microchip/enc28j60.c
+++ b/drivers/net/ethernet/microchip/enc28j60.c
@@ -1602,6 +1602,9 @@ static void enc28j60_remove(struct spi_device *spi)
 
 	unregister_netdev(priv->netdev);
 	free_irq(spi->irq, priv);
+	cancel_work_sync(&priv->tx_work);
+	cancel_work_sync(&priv->setrx_work);
+	cancel_work_sync(&priv->restart_work);
 	free_netdev(priv->netdev);
 }
 
-- 
2.43.0

