Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECFD175A6D
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 04:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791000770; cv=none; b=MZn46/yVZg/WPiym2oTRTYkC2k76HWmsKZ2l3lzbu7CcDFR9HbOP+kAoeVs9TnYW94YqNMy6p7xTdSu23r068KvxkGna9FxkOCbaYOdKKIp1BP+AQ07Yv+FYC9KJSW00lpSyobhH3R1famoUCvmDlhs1GGFZD3SCXoQOBmXS9Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791000770; c=relaxed/simple;
	bh=dOIXqLzBtSxy2qJIrgonAcgd/FeiJxv/lEsDBeOpcYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R6vnFAtOEnmgoAoqik190PxlVAI5SwWjfwm35ZSsKkMIP40e/9pY4BzlPaI1L18QzrWshJob7arJa0eFoBEEgJRWps0e3bm65y0oud8WNS1swMpo0vb9YUzgPKGwc9l1mHtoASOclCd6atC1YdJu7uvCRFg+5ez/wxTu3z1DjsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfPWsVw5; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfPWsVw5"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53397325663so1874881cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 21:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791000768; x=1791605568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cc2suPktwUV0lHyZwCLOmemG0HWTqvkRtCzdgjiCcCo=;
        b=MfPWsVw552kdpSET7H05u7VK5wF8VaN5nFh/7wOKOzRwfkWzv6kQ7CQ58YH+xoyT6Y
         o6ol6OVJ4dTCa2eqLB3AHkyCRG1n22kAP8cmbOURfGewAIDsri0G9Uxl0BKyoy8WVkVI
         Wb6IEU8VpZQ07zOIJPQ+JXsYOCF3p7BN3XbxgdDaEoye4jlsdxs9XaizNKpO6iBrFh7P
         x0YgMXqJv/zDWqhYkx2rOnkO4IMeWT0WMQI4x90WZyAl5FLOD7jfnO2f+aBsVS2Q8sK2
         L18nbKp6Y/P7u6x/6sWSLEWGwyBoVSq+EMMGtuTQNEeoDCae1+MSODuEcOBzYArl9JNV
         5oBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791000768; x=1791605568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cc2suPktwUV0lHyZwCLOmemG0HWTqvkRtCzdgjiCcCo=;
        b=hL4xfV6rRR9aMB8jZ9pzs8lX8EjWBm2HtwgGqnZOeeaFXPWXHgrnVMS4F50GC5sj6q
         /6QqblvyMvBJJLbkAvbAlloXJsinf1EQNbZjV9ttUWp7v0wnQfT+ebbTJ03gntHV1Y3u
         nJuMEHvpdzngGJrH2scPBW0TD9uvFD4/YQ1NWM7G1vshAObI1iOx/fI3It9dQDS1BbSo
         L7Lq9hL9STTaOPvjIOW5KtW17HYs64u4q1hUhbU0BAaegDYCnDBQntapZzeWXHipLyYu
         eJYTIn5PuacxPe3zpcUk1ugBaGTy6LPgYloCz0riBVeZ2UWLDU914aqmvyXJqcwLULj9
         MJ5A==
X-Forwarded-Encrypted: i=1; AKwUvBwZuxU2oMMYYpEM3oh+yMudao5g1IR+9ketUaLajDN41bqtfh9+tUE3Pwd9GhVXXjPpouTQSWFh7t/j4yI=@vger.kernel.org
X-Gm-Message-State: AFuF++kqcOld9RskjpkmwbZimx3chKPEBLOqTepcI5upFZGHMWGh7xGn
	DEoN0efcuE11gYapJKAFGZziZAzSStx6nKv6+Ixs13KE3/Ty70H9w4o=
X-Gm-Gg: AYBFou1jHwDDshP8mi2AK4+fY6o77vn3xFcjjOQ7LFIDkj+C0DyVV9BOM3HvYrIExSb
	K9+KwtxiWmnp9ahepPCkrjXfJUwG7CpARCSy1sVekBQUu/AB2o5uxE+p2X7NOehJYTH3DMDKSoj
	t4BLYnCWRNui1vNAMSkBkNCtl7X6WU/sa+IYQGUva5JXVzQY+xE7iudIOz58j8b/VAR1CTNs8dB
	7wbqJsMsxWyfLaqHumzRBPHftOI1airCF5/NQIy+OtfYhNtKYG+4X5jF4m/793c7SZmUJSiUZL8
	I6KSz7HdDVv+l1VVa9zVrxioQsP5jQP5Rz6nkkCdxiFZQ+PShiFM4H5r64EcZLfiWQc6brBRGHB
	d7x+Tam4ETTKdEit32CNeNmGvrValUdLZ9UHh9W/8WtsH5QlY/qcJGENR4IxhCCDb/WWrC18lZ4
	BoPfOy/xxJqZNA+cWzJtB28EA4NNlnyD5wrIn58T/iVq5G8xkIEI2Sxo4le/rowx69nLPmKBIw7
	4iGublm4HfHsi77W1M6iYVzliMbP6jKTklFDH879NAkKUGZDKesfyur4XF1YbYpgvsPbgxujNr8
	5t+KGu8hXV4rtPM1DmVgMuvcBSmd
X-Received: by 2002:ac8:7e85:0:b0:531:172f:79e8 with SMTP id d75a77b69052e-53511f1965emr23644131cf.57.1791000767676;
        Fri, 02 Oct 2026 21:12:47 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398a5b6d6sm42699391cf.9.2026.10.02.21.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 21:12:46 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH net] net: nixge: stop IRQ producers before draining DMA error tasklet
Date: Sat,  3 Oct 2026 00:12:42 -0400
Message-ID: <20261003041242.650599-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TX and RX interrupt handlers can schedule dma_err_tasklet. Killing
it before freeing the IRQs leaves a window for an interrupt handler to
schedule it again, so the tasklet can access descriptors and TX skb
state after nixge_stop() releases them.

Keep the initial DMA channel stop while the completion IRQ handlers are
still installed. Then free both IRQs to stop and synchronize the tasklet
producers before draining error recovery.

A tasklet queued before the IRQs are freed can restart both channels.
Stop them again after tasklet_kill() returns so error recovery cannot
undo the final stop before the descriptors are released.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 492caffa8a1a ("net: ethernet: nixge: Add support for National Instruments XGE netdev")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested nixge.o on net commit
6dc989ea46b96ce170840174b4a38c4a387fb005 with x86_64 allyesconfig
and allmodconfig, both with W=1. No hardware testing was performed.

 drivers/net/ethernet/ni/nixge.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index 230d5ff99dd7..7bba6f8e64fe 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -920,6 +920,7 @@ static int nixge_stop(struct net_device *ndev)
 		phy_disconnect(ndev->phydev);
 	}
 
+	/* Stop DMA while the completion IRQ handlers are still installed. */
 	cr = nixge_dma_read_reg(priv, XAXIDMA_RX_CR_OFFSET);
 	nixge_dma_write_reg(priv, XAXIDMA_RX_CR_OFFSET,
 			    cr & (~XAXIDMA_CR_RUNSTOP_MASK));
@@ -927,11 +928,20 @@ static int nixge_stop(struct net_device *ndev)
 	nixge_dma_write_reg(priv, XAXIDMA_TX_CR_OFFSET,
 			    cr & (~XAXIDMA_CR_RUNSTOP_MASK));
 
-	tasklet_kill(&priv->dma_err_tasklet);
-
+	/* Remove both producers before draining the error tasklet. */
 	free_irq(priv->tx_irq, ndev);
 	free_irq(priv->rx_irq, ndev);
 
+	tasklet_kill(&priv->dma_err_tasklet);
+
+	/* Error recovery may have restarted DMA, so stop both channels again. */
+	cr = nixge_dma_read_reg(priv, XAXIDMA_RX_CR_OFFSET);
+	nixge_dma_write_reg(priv, XAXIDMA_RX_CR_OFFSET,
+			    cr & (~XAXIDMA_CR_RUNSTOP_MASK));
+	cr = nixge_dma_read_reg(priv, XAXIDMA_TX_CR_OFFSET);
+	nixge_dma_write_reg(priv, XAXIDMA_TX_CR_OFFSET,
+			    cr & (~XAXIDMA_CR_RUNSTOP_MASK));
+
 	nixge_hw_dma_bd_release(ndev);
 
 	return 0;
-- 
2.53.0

