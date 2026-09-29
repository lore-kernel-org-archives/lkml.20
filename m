Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1984039E164
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667436; cv=none; b=GyEJYR6/bTqDFoP92ZJJym4xYcqJxMlJfNiWfmAVp4ZH7sndBYWExTGx5LVvFtRhWWC04uozrHdqrJKJV/V59aMch0WTwZxi3n6IMH5fsSM9RIcVMkLWCfuoeCQ2itsfL8fU4t9CRDVXBjSiHBCb3O3Xx7pUxkQbgt1bBbLUp2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667436; c=relaxed/simple;
	bh=zl0xoTaTYS/w0n0Ztaa7vwfu7tIkczl6Z5m3FFxtjn0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hZTzO7/kHsMFbJYj/8kEMbZ/GEs+FgXKwo2eUih6mE+gzKmkxnAxKYUPczDZZJuEtr5lSDEwXG6PxOZg6iV3z+wavSZqD2ZTYGB+frj6qU8ycSqKE76IMaAGil4CDVGolGlbIWqlKwecRQC+h8Bg9O/YzNvD9OY9iwTtYQjfdyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJKIPOen; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJKIPOen"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso365209a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790667430; x=1791272230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lH7vabi1ElgAOD/H3yIzbFBlm3tuRz9eFpdl+CXfo5c=;
        b=kJKIPOenBxXpe3zgnYmEnIGcMuwA5mxMf03HsloCbwup4mnADSK3QzYPW/oZf65Zgu
         CspXQvB6lknmqabNi6t33ZL8xX28hJbhX+0e00OHw4GkS3GKKJgkQz9pOB3DHeSuCN4+
         b6sTTV7bAiCVfn6hkHJqs9iZmjRyq9vEwPFMYgNgh9GFstAaOMOqxl57AiYZEiEj+SnZ
         sYUIwWQNrD68Yr03udE3BxS94eCNvL7my2rtlTYZFbRQYSZLRIVKhV9woSWqD802O6RC
         KG5HU/GWko6dYp5Aj1w9dR057n2mbCD8yVjJRDBxGMjG8+rJftl2mKWgsYvHM3g7gyoM
         OUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790667430; x=1791272230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lH7vabi1ElgAOD/H3yIzbFBlm3tuRz9eFpdl+CXfo5c=;
        b=FzZ9e61Yp43YtJ/KWRZYBKTgV0oYIJ5bsU4xYMwdsjQ1ynCOANpxtYXn9RH8Mci0Ih
         sRaHoXHUYauGDkP0hBvfafjovm2bT1ZxvnmF7PRrvEFvvxRi0zowudu87bPVLpYUz1zM
         oPv96U5XwpQzAJ4/6SR8LhuP80xQPMRIH/Kzustk98bzLavCqT/InFveUT3fKFbr9us5
         TRML85D8bhAIOY+7/n4ycR3yK9aROQvHv5DgXDBQFiMfsvoI0a3SNIHo+4hFxRYZ1J4J
         rcy7WNOB+ddwCyMj3YbsMLJzdRlsXt6cwjjHEU83cKLdxIT4b+AfzS5zBop8ljzglBxX
         3mWQ==
X-Forwarded-Encrypted: i=1; AKwUvByV07BxsvacAsvZsWhC3KWuJBIv37vDEsugF06xluR7MIvm6LdOKwcGeVEoo0lkQiuO7wXEous0ODiS1h0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0Yb4j0UVa0lB8nVqo25N4yoTi/9Fp9f3Ar2GrY4l/u/VFWMTj
	0JVx12/9bV1YXmxzidZ4rDDIzZ0Mzt7m19oRw4tWJX3z5Oam6ostOn12
X-Gm-Gg: AYBFou0VHCsOB1wMWTQ5OdxaHyM6Cc5x8YgpW7528L8CSE+wPnCoaDxvIINE9Dt8nLV
	FZMckZdesoIiPXJIL/UWyOP8ET+QQCTD62PIYwovKY1BO0WkB7b7TAF71d9TmzBHI2SyH0sUxoW
	lR0t0LC8YYLnlYOC5/Mg5aABdqFWdbDcY/TJPcQUUDmsvuIMV72HLOoZPw0i8PUf4jReuPynwno
	qTXaCx3++XVUKMHH9G1B1ubLFFhfJcCaniiYfbo1mCeoAK9IzjOxI1e0OG6j5B5Bel2xofa7aVy
	RuGLk0JM0fHWM6/3Y1yvAvOQKsKNh+UffnTMX8OBp8+kykFqtpuqwkixl8OxcdVLuRDkoM4uUq4
	TRLDI4DszAcvFBj7foG6dplJ75VsvZ3m6AzPQCjve8zPW1ctv/3dBEnJrt0FthE8Pmy5fyTKFjC
	VwCdtB1gpENsFL6stW6KyLi6hJce9e/VwUpwn/BXeK5UVfgztfz/TjzEFmPmX+70Bar1zgNg==
X-Received: by 2002:a17:90b:57c5:b0:3a2:b04e:8084 with SMTP id 98e67ed59e1d1-3a2b04e8394mr3109613a91.42.1790667429672;
        Tue, 29 Sep 2026 00:37:09 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498ecc986sm1328708a91.3.2026.09.29.00.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:37:09 -0700 (PDT)
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
Subject: [PATCH net-next v6 0/3] net: stmmac: dwxgmac2: timestamp interrupt support + Agilex5 fix
Date: Tue, 29 Sep 2026 15:35:50 +0800
Message-Id: <20260929073553.4136336-1-zxyan0222@gmail.com>
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
stmmac_rearm_timestamp_irq() when a channel was left enabled across
suspend.

v1: https://lore.kernel.org/netdev/20260806-dwxgmac2-timestamp-irq-v1-1-c051c79c9d90@gmail.com/
v2: https://lore.kernel.org/netdev/20260810100221.9166-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20260818132722.1852876-1-zxyan0222@gmail.com/
v4: https://lore.kernel.org/netdev/20260902131441.322167-1-zxyan0222@gmail.com/
v5: https://lore.kernel.org/netdev/20260910081020.86227-1-zxyan0222@gmail.com/
v6:
- Hold aux_ts_lock across the whole crosststamp sequence instead of
  dropping it after arming, so a concurrent EXTTS request cannot flush
  the FIFO between the poll and the drain loop.
- Arm XGMAC_TSIE on demand from the PTP_CLK_REQ_EXTTS path instead of
  adding it to XGMAC_INT_DEFAULT_EN, addressing the review comments on
  reverting 30300d9f9150 and on the missing disable counterpart.
- Reword the ATSNS comments: ATSNS is the aux snapshot FIFO level; it
  is not cleared by reading XGMAC_TIMESTAMP_STATUS, which is the
  property the poll relies on.
- Add Fixes: to the EXTTS support patch and guard the shared handler
  against a zero PTP_ACR channel mask, placed before the new handler
  so every intermediate tree leaves the shared path hardened.


Zxyan Zhu (3):
  net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS
  net: stmmac: guard against a zero channel in the aux snapshot handler
  net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support

 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 36 ++++++++++---
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 54 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  5 ++
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 17 +++++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 14 +++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  9 ++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  1 +
 8 files changed, 130 insertions(+), 10 deletions(-)


base-commit: d0ec95a8a4e79f2fd6063fc8932415db8c227689
-- 
2.34.1

