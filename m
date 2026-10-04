Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0772EEC0
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791115571; cv=none; b=FB/RehL/bZNGgL13Fs1GKJmLEOYtF/4sCn4rc8SweS5bBSHhdjoPMw+i9+P++xuCKvimFSd8s/s8A2oP0AwcZ2Y3AMVQ4wTarZ8qixHhHIWDtleVS5kMq8Puy5rm/j+zYgzL3Af4CwpfZQ3JkJSGLIMbk7ruXFSNxYEjnAtzUms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791115571; c=relaxed/simple;
	bh=oWcntV/BrgOJNRaVQjTBsXl79ydnNX7DAAGD7GhrFSo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UN8qt8/pdNBEDMl4y4VI4vtvDemZXP1BxIRYCPoDaI6YYQ9k131LJlAu2MgzOJXyTSkBDLbueHQ3gOByJnmgdjdPnfcTkUirwMIppNbdi5KlKSAP9HG2ujj1GqPN0mptju7fpYKkHOfic8anZRaa9q/2r5HkymG4a+GJr3zJ8OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbD3M4Hz; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbD3M4Hz"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so544800a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791115569; x=1791720369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwd8qadBr0UxQpeVs5pWLNg1qZ6CtGQ15NzXNboPOx4=;
        b=UbD3M4HzuJar+CyzPxIMc1muNztlWJBD96qXrw5ro+4EoMRal4UpLaNy9ahPAVk3g5
         iH3ZaYI+WnhdKSHFhUo3LZkxR8I4P1T5gXEuuSNUBq0U6Hwlbd2Blb8SQOi7EVecF9bF
         8zKqwUVJnVDOP/+9VDyQd5egB1iUkKPxp3lKSD3kGdywiYSQAS01escP9JfpWi0OMUZ9
         BJiUnVDtnkeIGBDjJrG2COIZzNqRJ2MKxwSeuans25SaSgSYsXhNCKFFkD45OmuZG2K+
         eMktd8rG6XaWKfcc2GQeWNgzfKw+pAxt2H6qjHGH6g987F7EzCEfmF8+DzPI+aWGo06U
         Gs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791115569; x=1791720369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwd8qadBr0UxQpeVs5pWLNg1qZ6CtGQ15NzXNboPOx4=;
        b=e59EeXmlTgyxx4/c4Joc2SFmxQyvUROCl5XO1tbYFbSiFZWfppk/+i5TVOkedWYm40
         cQdYlRBBaQGNHKZ5N1UQe24zcaGTFUtMKmTK7wMWXE10SUEwVvN6D9x5adNlDU2ViFO9
         NFxnsb2xMMXc1+3rpfAk7+enK/2dnNYUaqASSoy8fWDCSe2dZcw0yg+U/mLjSa5EXGZC
         5S0SEWYzVwaRsZjuz8T5Dcf5MkuVj49xaeHpXJruNdA9EiZtefrWDszQsNSrqsZvSn7H
         fEcxcinfxK2QgRUSOIUf1zGWJei5BYQ0c4ETGrkb8gHgch7VGsoEd8epry2Thjk7P9Lq
         McYg==
X-Forwarded-Encrypted: i=1; AKwUvBy6JTHF9Z9NYXGGxnUg8RVygxrLUexmunx4/D5VLD9wWbhZT1eNMKxFWBKC35D5YsmqggbA5wwcmZpjgSM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwuFU4tq1S4qabMh00ZSH3VRpVLaFr5iIjWhi8DmyuxMkMoi3u
	Mcgj1L8T1O53QtYZxRf2wD4H9kIBNzxKF2I/m5LTwOWgIB2miSnXPaAP
X-Gm-Gg: AYBFou1KNCujl1jAfn5a6zU5iKjQMiB5nyClQtnR9rAidMQEmjb+he+orZsiRS3l1LQ
	7PV5tYSXaNg2O65w+3VOFPUvEzb9LEjtpJAESQa+KiZXnlMNU5JLbEK9SA7W/Hi5KkSJKo5/hPX
	iaG232cg8mM3KCb+nM1dDvSi7I4LS9UsYaO0dTUhLGdyxo4SjzsJJ+nqucfBs2DVaz9RpPBcAQ8
	r5RtTorERL/8xJ9LqS7o0IClA1VQ9X1KV7QDXqwNffNSIK/cXw+o9wZmbiJWgMFxm1vTyamodZS
	HZK8vHURdIpEQ1XYr0MUwFPQx9KGTo3iBMQQUsIYNpUfx2zG/g6M+dQcjAYwgK/GAqIppfI/Zo6
	Zp45FdAmNDA2VOripEWyUt2uNVf3bMPKmC+SHZvQnLKrjevTSIrfseGB8m9OGFZ3l5EWabYvQz6
	yTULfexWQFZNXh4Lx7M7wjfsB2ZDnBQHU97ekAGQfJ48UyV6EMViIQxGdtmCK3Xnee7J4Tzg==
X-Received: by 2002:a17:90b:3c4d:b0:3a7:8350:49a5 with SMTP id 98e67ed59e1d1-3a783505109mr3878592a91.32.1791115568964;
        Sun, 04 Oct 2026 05:06:08 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a79e7c243csm2603661a91.0.2026.10.04.05.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:06:08 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	maxime.chevallier@bootlin.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v7 0/3] net: stmmac: dwxgmac2: timestamp interrupt support + Agilex5 fix
Date: Sun,  4 Oct 2026 20:05:23 +0800
Message-Id: <20261004120526.2728564-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds auxiliary snapshot (EXTTS) interrupt support to
DWXGMAC2/DWXLGMAC2, fixes a stale TSIS race on the Agilex5
cross-timestamp path that the new handler would otherwise expose, and
guards the shared aux snapshot handler against a zero channel mask.

Patch 1 makes smtg_crosststamp() complete on the persistent ATSNS
count instead of the transient TSIS bit, waits for the ATSFC FIFO
clear to complete, and holds aux_ts_lock across the whole
trigger/poll/drain sequence so a concurrent PTP_CLK_REQ_EXTTS
request cannot flush the snapshot FIFO mid-flight.

Patch 2 guards the shared aux snapshot handler against a zero
PTP_ACR channel mask: ilog2() is applied to the mask without
checking for zero, and ilog2(0) yields an out-of-range event index
that ptp_clock_event() feeds to test_bit() unchecked from hard IRQ
context.

Patch 3 wires up a dedicated DWXGMAC2 timestamp interrupt handler,
following the guarded pattern of the shared one.  Before this change
the XGMAC hwif entries used the generic stmmac_ptp ops, whose
timestamp_interrupt callback read the dwmac4 offset
GMAC_TIMESTAMP_STATUS (0xb20) instead of the XGMAC register at 0xd20.
The PTP clock advertised the aux snapshot channels, so
PTP_EXTTS_REQUEST succeeded but no event was ever delivered.

Following 30300d9f9150 ("net: stmmac: xgmac: Disable the Timestamp
interrupt by default"), XGMAC_TSIE is not added back to
XGMAC_INT_DEFAULT_EN.  Instead it is armed on demand from the
PTP_CLK_REQ_EXTTS enable/disable path via a new optional
timestamp_interrupt_cfg mac callback (mirroring dwmac1000).  The
interrupt is only touched after the ATSFC FIFO clear has completed,
and the handler refuses to drain entries while that clear is still
in flight; it also leaves the snapshot FIFO alone while an internal
cross-timestamp owns it (STMMAC_FLAG_INT_SNAPSHOT_EN), is disarmed
when the PTP clock is unregistered, and is re-armed on resume by
stmmac_rearm_timestamp_irq(), which redoes the EXTTS programming
under aux_ts_lock before re-arming, when a channel was left enabled
across suspend.

v1: https://lore.kernel.org/netdev/20260806-dwxgmac2-timestamp-irq-v1-1-c051c79c9d90@gmail.com/
v2: https://lore.kernel.org/netdev/20260810100221.9166-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20260818132722.1852876-1-zxyan0222@gmail.com/
v4: https://lore.kernel.org/netdev/20260902131441.322167-1-zxyan0222@gmail.com/
v5: https://lore.kernel.org/netdev/20260910081020.86227-1-zxyan0222@gmail.com/
v6: https://lore.kernel.org/netdev/20260929073553.4136336-1-zxyan0222@gmail.com/

v7:
- Rebase onto the current net-next/main: stmmac_resume() now only
  re-initialises timestamping under priv->ptp_enabled (8181678a92f0),
  so stmmac_rearm_timestamp_irq() moved inside that block.
- Raise and drop STMMAC_FLAG_INT_SNAPSHOT_EN under aux_ts_lock in
  smtg_crosststamp(), so concurrent cross-timestamp requests cannot
  lose the flag.
- Restore the enabled auxiliary snapshot trigger on resume: the
  platform init resets the MAC, so stmmac_rearm_timestamp_irq() now
  flushes the FIFO and re-programs the PTP_ACR ATSEN bit (channel
  recorded by stmmac_enable()) before re-arming the interrupt.


Zxyan Zhu (3):
  net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS
  net: stmmac: guard against a zero channel in the aux snapshot handler
  net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support

 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 36 ++++++++---
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 59 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  5 ++
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 17 +++++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 51 ++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 23 +++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  2 +
 include/linux/stmmac.h                        |  1 +
 9 files changed, 187 insertions(+), 11 deletions(-)


base-commit: 62d7b9186cad08324d6b9d262631104bb215e67d
-- 
2.34.1

