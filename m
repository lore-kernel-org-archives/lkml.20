Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F103A27FD74
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791859687; cv=none; b=RP0a/E3oBxknCTc64HypfHD1gWqfCdNkU/2U+POfEmJPYcc8F3/x0idu01BChJaxyEPTbbWcVlnCSgQsLaPtuzODerr61cEoirJDpA3iqUwX7xhn0JeFskLfCJn9y+jdcuW0zaCi/FwNnHehuVUQlls3kMrILtaEiAZ/wm0jEqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791859687; c=relaxed/simple;
	bh=/nq9ULOagF8TNdNkpu6Q5sv3UadZrrvNv8JRzSgtxuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2I7qPm0Bhl0Rdhv+y+pkqnZzIevJk348lnse0YBcjDiZE90GLmRgH84m4VcNxOjdglFZhhKH5IHxfvqsTwVKhtjGynkZcHZ6zHuIVb4PbWL4D03Ou2NosWMt+ff9nz1n8QLNqoSyw00IYP2g2UO7ut7UJROaLEf1AsspTpK6fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqIrQNZd; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqIrQNZd"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-887beafb714so1150315b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791859684; x=1792464484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/CQGMpBuy/7FJjcfHtn4Lxv99je/uyA1AfUbEVnRss=;
        b=sqIrQNZds3xFmRLXdaMHSF8btDZx3ZrJbYWNGitFywvjWYRvXhj7fW8FPXmqy47L7f
         4R4E3o1EHAJYNhO87Te1XIHk0rl2E5tF6BRN0qzg8AJqc3tu+uME9O8ZNJigABnl7xYV
         A8gZbvcvIR5/9Op0W9xGrxxScN6kaqDC/z4u2Dv2XrGVnkLddQRaNRPI05Ieg2GUZzpJ
         vvyxwN0InN6oCEaubqC1Q9TOYRLy64sRiXi60aQHvwhqlzEIb3aNotiFg7VYLPneln/n
         qxanFs7s95ViAtXuv9vSr/ilNLgo9LNZT58P4pPDyy9jK5nrxFT/+YnavuyJc7cMuC1N
         69dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791859684; x=1792464484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/CQGMpBuy/7FJjcfHtn4Lxv99je/uyA1AfUbEVnRss=;
        b=MIgfqiH7NDVZCNhBd2x/JPN7+wZfGiT8bdCQHb8vpZXZqt8lxkRbKa738jawyw6cX9
         Wo7GhJHcFp+si/n9bihCIrvDpEAwwsX6wQxDoBroFbCRIxz+J67VAHUOmCgRn2xe73LH
         uUJLMHhOgG2jc3t+5r7K3jUCsaObGt6mkwknMJp8/PaLJL1bpCTFut6Eb6hnEyKSWsvf
         k25n45o7TG3cpDf6YKhppGrDJU8F0Bg4+Z99XfFAgPFW9Y/Q/Qia/Umu8g2X4CboL9zF
         NKnEdHXBWm1divQJkiHV9UTCDyPhWuEN2uIBTDQdov5WxRYV+9NBBV/eHmjS49RGFDIs
         lZgg==
X-Forwarded-Encrypted: i=1; AKwUvBwwomRcr+KE8dx9E7AqerXaRTdUffSpx+aB0PRCTWvSf2rRUwoUPvyLzs0EUga24DQtn+06qmNoe7MJico=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKHezVjALncMSQsoadu8zSse/OdAhPlTcDo5YQnICjogxcFCCe
	xSg+7G5M9ec1irj7GV5WL+/2+62/BDbZn43q9MnLIU4EbmTTqtgTd3oY
X-Gm-Gg: AYBFou0oOfRVEmW0QTaWZ44ufBARnY95n2Ek54StWbJRKPnZQPKe93PvOxdjaLfxCdb
	4OoBAekd/L35Mal2VdxRoXw4yPB4ILYje8um45brujwnAtzIasBVN5oyHdWj+f+SK+OPENWUUiH
	Q3aAF2yXhEWMqYIP9HrsHH/vv1xEVFNMnhkCJO46LFdrY6Xc1GvKLiUfu/rP2r1/uE37IGb1JBU
	Jwv6xSSjLLVK6EtJIrcOCiSSqTzC6IkO7ZZUx4aPfBZRUySAU8wKBpWBiWDeWv8RR1bnhbWiy8v
	kduCjfllNhH6+snSwIpPzF31ytNX99TJrWBc5klANmUJaYLO4VLpzqS4flEmGHoY+Wovxz/XABu
	6ID7w9cn6eTjvMVhYIObBLYPw30c64G4fjepUbIPeRizb+EB6vlu2Dna2foEzQDr7R0G51UNB3w
	Ei3RJRK+2bBHKEwHWEMCKO5ra+pcjj2cWInWbuBbYi4EJ/6UbdQudiFc12ZjJH/bkOp8v/JzRMg
	Kues+owYQo=
X-Received: by 2002:a05:6a00:951a:b0:882:2b16:c314 with SMTP id d2e1a72fcca58-897c7cd1127mr9507515b3a.52.1791859684155;
        Mon, 12 Oct 2026 19:48:04 -0700 (PDT)
Received: from online.mioffice.cn ([2408:8607:1b00:8:5e2a:b6c:f432:a6f3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c42b4549sm4466018b3a.44.2026.10.12.19.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:48:03 -0700 (PDT)
From: Pengfei Zhang <zhangfeionline@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
	EricChan <chenchuangyu@xiaomi.com>,
	Simon Horman <horms@kernel.org>,
	zhangpengfei16@xiaomi.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: stmmac: xgmac: do not treat TBU as a TX event
Date: Tue, 13 Oct 2026 10:47:47 +0800
Message-ID: <20261013024747.2688984-1-zhangfeionline@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 8d07a7930434 ("net: stmmac: xgmac: Do not enable TBU interrupt")
removed TBUE from the default DMA interrupt mask, but did not remove the
TBU check from dwxgmac2_dma_interrupt().

TBU is set whenever a TX channel runs out of descriptors. Since TBUE is
not enabled and only enabled bits are cleared, the TBU status bit is
never cleared. As a result, TBU stays set on every idle TX channel,
regardless of whether there is any TX traffic.

With a shared interrupt, stmmac_dma_interrupt() checks all channels,
so every interrupt from any source schedules TX NAPI on every idle TX
channel.

Only use TI to trigger TX processing.

Fixes: 8d07a7930434 ("net: stmmac: xgmac: Do not enable TBU interrupt")
Signed-off-by: Pengfei Zhang <zhangfeionline@gmail.com>
---
Tested on a board with 8 RX/TX DMA channels behind one shared
interrupt. A peer sends 10k UDP packets/s to the board and the board
sends nothing back, so there should be almost no TX work. Every idle
channel reads DMA_CH_STATUS 0x4 (TBU only).

Per second, averaged over 10 s:

                       before    after
  hw interrupts          9071     8580
  tx_normal_irq_n       72572        1
  tx_clean             ~73000        9

- hw interrupts: the shared interrupt line, from /proc/interrupts.
  Unchanged, the RX watchdog sets the rate.
- tx_normal_irq_n (ethtool -S): how often dwxgmac2_dma_interrupt()
  returned handle_tx. Before the fix every interrupt reports it for
  all 8 channels.
- tx_clean (ethtool -S): stmmac_tx_clean() runs, i.e. TX NAPI polls.
  Each spurious handle_tx schedules one. What is left after the fix
  is real TX and the TX coalesce timer. The "before" value is from a
  separate run with the same setup.

No packet loss before or after.

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index ff83858ebc..0a6e82a155 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -346,7 +346,7 @@ static int dwxgmac2_dma_interrupt(struct stmmac_priv *priv,
 		u64_stats_update_end(&stats->syncp);
 		ret |= handle_rx;
 	}
-	if (likely(intr_status & (XGMAC_TI | XGMAC_TBU))) {
+	if (likely(intr_status & XGMAC_TI)) {
 		u64_stats_update_begin(&stats->syncp);
 		u64_stats_inc(&stats->tx_normal_irq_n[chan]);
 		u64_stats_update_end(&stats->syncp);
-- 
2.54.0

