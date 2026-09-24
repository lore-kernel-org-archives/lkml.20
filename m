Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0C235F61A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257888; cv=none; b=u9lp4LbwyekLoLY4qCVl+joYugykLEIpQhThuO9i5ViR4C3XAjqaaHsSqW6aPHpo1EcQox9hpoZjT5SKwvLODTXKRQxPCwgeYohvesITiIDNXapQ8QZaKciLljQRn/n0fY8az52ATIJpzolPb3np4+RXenan/y2YFvfgctXzSdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257888; c=relaxed/simple;
	bh=s+SJDHC4PikhkB0xzyjadUkSXp0uMtL60Mts4EJbjMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5UZPPxM0+8fABjjnrr5oLJdUaIkfeWtXrBimhc3h5UwPrd3YAr5rdboY7xgK+901tgUFN8OI0gE7VIS/sekkN3E3Ep/7iLhyEPDz8xPOxmTatqgb+bcwR69tgqCzSuAKPHZVxf42tvwDQbnPxevMmGFHiJMB0x6ov6D2ccZLpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qpef2z13; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qpef2z13"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so1421609f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257885; x=1790862685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9iLsnAODx2rF847XvroFh/ns6W9jfoyO6c4E8bJMN4=;
        b=Qpef2z132exD8StDQB6YGTwIatT32Snz49SPUn2E/tuq4hsuo/rDZ1P3H3aVhb3KrP
         2VklBRtoFpUb7ORwTsrUXOu80HumPY+iijeuu0nzUbW9DIkW0AFicirNUTxvg0oTsjHy
         c90m+jLgPHZo6IS+bpagcHNiA5LoTlQqxndj7VHqBLXu/XvYamWv2W1T1uGJlGesr2+Q
         joZEO+k7lQhDhcRkyUbnChOcgknUcOlf438lxmDj9Cdau9LpCOby7Ei2dMHICuQmBao4
         clbZPfunF9b/xZ2XBxw5+Z1ORElcG/K9RVoLzH6uICZ1pinTjcGhiiQ70SJ4B3KvF1ds
         pPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257885; x=1790862685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t9iLsnAODx2rF847XvroFh/ns6W9jfoyO6c4E8bJMN4=;
        b=uMbAyhznyTP8wdL/r1W+FXaHneGpDhBIa/Sv66KIRy91S828+NX5CTwk5Em32Vy75G
         tkHoMIOixSDu6epcLQ3ppCg33/QUTRQ/ipvqzMBec+1f5XOS5I4xWjv0VHljMqvvCwky
         E9OedELtehClorq7XYr3MqB+xv7tex76/GaSabBQV1gjfUMV8sct/Z+iDVK8j+jFOjaY
         sT1YHOe/ow5dqP4b+tpLy24C1pM6b1xm5/UQUeXvK1vWQApS9SANRw+sCPh9NmGRukW1
         e4AOHVshLMITweIerKI4TVpCUVTa31l9SP3BRMsjLhPzA5224DGyEHAFHZAiUlt7u9km
         C+0g==
X-Forwarded-Encrypted: i=1; AKwUvBxAdIThFsOXCQEdmvYjFyi+jiLnjXoCFHytzhO9xTLJ6zJnSN5uRLAjMXHFg3RUwL6QwnLPBzVTZE31LhE=@vger.kernel.org
X-Gm-Message-State: AFuF++mCqCueDGpYDqK++Z2sUuKiA9rWtgmXx7wJUsVVSYGa8evDDQyz
	I5grIifxuz9LIfPhHl6QHjE62U+qz4XZAREUSBFFTDryLrKI/ZE0A/re
X-Gm-Gg: AYBFou00E0j5E+VpcO5RLZwTC7M9I9lTNFTMyHGIBZKMHAIc3NZiYjIV+hg58zmSQIS
	lE4wobHpei/rxedzVf2plInK4oNwzIUFX/NhiGiAsjdLLFP0mPyIkRA17mlAAbjCHqWj+vhCYFL
	/WUw1ZzvtftESRUxjmm3tYWheCc77d0MbVjYD9QmgWHcbhwEtzoaqj4Lss2gb/QEQ/v7bn6sBJT
	8fzB9tHp3lvcGRqMTMTWvOrIJXe6iP7kxzA0bIKY6i+zNEzPwxQz5Uu8i5xT8j/VxSHjsATNfRB
	4fSJkXYM3vHkqFf/799WkVcNRHBhrx8dgNLVkValJihRNwW7YFKrk3oOBZaHKuNtMQhto8weNjg
	r8kxVJ5B6N8OaA8ouVEZm7q3nO788Dtygnb13i39i/1VQeYRj9claR2U8UAlk+Il3/YTov2zges
	fvn/y11OB2XoHdYoE4oayWNhC8431qhG/qBRezF843IKLkPhbkCowqmr24sbcshf6lQnu8z8Gry
	gvVqabiSGBz3SOjVPkTQ0I3fLbo2fK5d29deQIK
X-Received: by 2002:a5d:5d87:0:b0:482:fb60:2f0 with SMTP id ffacd0b85a97d-488716b2841mr5288900f8f.8.1790257884978;
        Thu, 24 Sep 2026 06:51:24 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889376sm12060660f8f.33.2026.09.24.06.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:51:24 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	daniel@iogearbox.net,
	andybnac@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net v2 2/4] net: axienet: quiesce the TX path before axienet_stop() tears it down
Date: Thu, 24 Sep 2026 16:51:14 +0300
Message-ID: <20260924135116.185161-3-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260924135116.185161-1-maimon.sagi@gmail.com>
References: <20260924135116.185161-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the legacy DMA path axienet_stop() stops the DMA engine and frees the
TX descriptor ring with axienet_dma_bd_release(), but never stops the
transmit queue or waits for a transmit already in progress.

On the dev_close() path this is covered by the core:
dev_deactivate_many() has already quiesced the qdisc and waited for
in-flight transmits with synchronize_net().  axienet_suspend() instead
calls axienet_stop() directly.  Its netif_device_detach() only sets
__QUEUE_STATE_DRV_XOFF, without taking the transmit lock, so an
axienet_start_xmit() that was already running can still be writing a
descriptor into lp->tx_bd_v, or kicking XAXIDMA_TX_TDESC, while the
engine is reset and the ring is freed underneath it.

Call netif_tx_disable() once TX NAPI is disabled and the error work has
been flushed.  It takes each queue's transmit lock, so it waits for any
transmit in progress, and nothing can wake the queue afterwards: the
error work returns early once lp->stopping is set, and axienet_tx_poll()
can no longer run.

The dmaengine path is left as it is.  There the completion callback can
wake the queue until the channel has been terminated, so it would need a
different ordering.

Tested on an AXI Ethernet MAC behind a PCIe endpoint: traffic passes,
and after each of ten down/up cycles and five module reloads, all made
with traffic running and each running this path, traffic resumes and
nothing is logged.  Suspend was not exercised.

Fixes: a3de357b087e ("net: axiemac: add PM callbacks to support suspend/resume")
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index fb26d2e39fac..6d448d0b523d 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1739,6 +1739,14 @@ static int axienet_stop(struct net_device *ndev)
 
 		napi_disable(&lp->napi_tx);
 		napi_disable(&lp->napi_rx);
+
+		/* Nothing can wake the queue now: the error work returns early
+		 * once lp->stopping is set, and TX NAPI is disabled.  Stop it and
+		 * wait out any transmit in progress before the ring goes away.
+		 * dev_close() has already done this, but axienet_suspend() calls
+		 * us directly.
+		 */
+		netif_tx_disable(ndev);
 	}
 
 	cancel_work_sync(&lp->rx_dim.work);
-- 
2.47.0

