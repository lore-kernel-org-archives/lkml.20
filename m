Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC03476CF0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354912; cv=none; b=V2Iltj9Kp0rZhZowtcYilnuU/V5abqTwPoQkq0V6CWwLxScdmtJ+XbxWruQ952lGwQV+7vuUZKQx4y7v9EcM/K6ZkGYk0dUEdwXse1LgYQztP5ytw/pk883i1GkVtLhY1/buX0fihrTxnYlBwQPf5LQtVG1HTONPP2MKn8tyGrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354912; c=relaxed/simple;
	bh=/h8KHRAun/jLn6ihpqdnZw6r1LjfxVZG68liizvJoKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UEDVQKe+7jQmL0Vm/x/NgH2wboVjK9O2E91dv6OEB98zHfmD6KDOvFoR7XH4mvqdcDgiWIMBC3PPYitiII160wsGgcgMwVlJlhYeBeOf8tuEnQL5duBxsCzxhocGoS3g+pk9v/6bFHu7V+XU4/FQ5ihvNTm0ZfTC+abc4eTelhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgCU/bfg; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgCU/bfg"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8568e3ecfc3so834130b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788354911; x=1788959711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uzv/JmEo6dRoaDeN8R/MmzC/JFKPPs1P6QOp8MtYRWQ=;
        b=UgCU/bfgyaUH/yef9cmf2BmBIB0UQRXOiA7OUeGfTY/4HiVOrZfobtxowWi/GkgpJ0
         uqsebvgAidMwvCUp/l/u+TRj9OTymvAFy5GUTiHr8YC8lG9JCO/a/xa/aYBMzMPqbYMg
         O0BpzaC6nvTm+2EeJs/zsKur7GD7D07pyi3OhhpfEUvvgCLZoGeaY7yR3JzviG7s8fR7
         dJ3W1WJ9J2dUpobwBS3xeRxSouiH5PJ/g5ahsMLSKGEfJsppGSNVt9ENI+gD+f8lGgZY
         lAgvTIQxsJZoXpYPp7TRHyceK9qeYZeFbm478z3w0o1BbV/E/uta+asbbsBV2CMQfUHv
         Er0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354911; x=1788959711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uzv/JmEo6dRoaDeN8R/MmzC/JFKPPs1P6QOp8MtYRWQ=;
        b=fj8wJThiwN+Pa/V24t3FrfDvRywIN2cqeFAxri+6VZB+MTshKXMpvU2WrA/MPsViuE
         LhdDWNlxxw+Tvj24PmZ2xGytjnx2Pz6OhU2vPiSUS1q8w0M+aPirDx+I54kgr2J7xjfP
         OVbDCLhzQHC7qptIDEhRjtZNJvtvIHE7O2k7+RAjuotkrspil43+V7ayi0mSWlqmMtlk
         iEiZAUN69+r7GEDPGo4DDh5fKuoYtd0DIarAn1ZVxTagCilkE+LZJCS26iFpPFyGrA1C
         bYFDZVv9huwh7iRZ24XezOTN4ZJUmgckQzfOSKaziS5tmOw7TqTihbQJlbynlLJnBerC
         x5Tw==
X-Forwarded-Encrypted: i=1; AKwUvBz98QBR0PH7z2nHFe6HGjYJg7FKKsdOTgkxcHIH4PE9EjnRQYbvrBHniM0aOz7CP/9t/bTQ0hp9gMzemGM=@vger.kernel.org
X-Gm-Message-State: AFuF++nMlwxjMrDN9FIwrEuZAbldZeYiIxecYoAXxpoKm6VkyKGmXRrR
	SWPaSthgzq16SHbG8lDhvnFYSVjoAPqqC08LBg9a31OuY7nzb4/noGDX
X-Gm-Gg: AYBFou1n9WqCFdRzKhr5B8zv6Q4YxMlySABJBabDfft8wG6xAYPfFSRyAnf5C9ojf3V
	iy50pVVvTMH9zMSkwUnrBen91PtiuEzvmSXI3vRMkm1jOGvnylC4uwhYMoiqpYXd+EyWWWYj1K6
	jK0pcrKFg42NZTmdfIDgD+tYdTe5NNfDODigU4rdnwywaul2CKMJznrTDfDXwO9u23zSoBmzznx
	QYMqX5EfDl7g+ztgWB+21DIOd5dARsXCJRr3Nal+9qm9PSjShAOEsXWDDznsq/pgXZMZGKX1ywB
	AtqaMz9sXblEths98NvfVcDXdcp5ynJl2IsuB+oJ+k/VCxlL68pApoA0uga3QrdIITwbDs51z5D
	LIhkHQl7zchehlPqUsFlUImXGW1CX9ON6AC3oVEFpV1N/QbiBT/PT78bnAwE9u070zcm6N9p2MW
	dlWFcVeZX3VXPpXSkH+uXTQrfIowH7YkhFVTdGnsoouWh1Xl5xhBX06GfYVRM=
X-Received: by 2002:a05:6a00:f88:b0:858:b809:6ec0 with SMTP id d2e1a72fcca58-85ed4d13780mr8488702b3a.23.1788354910497;
        Wed, 02 Sep 2026 06:15:10 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85da342023asm1398533b3a.0.2026.09.02.06.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:15:10 -0700 (PDT)
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
Subject: [PATCH net-next v4 0/2] net: stmmac: dwxgmac2: timestamp interrupt + Agilex5 fix
Date: Wed,  2 Sep 2026 21:14:39 +0800
Message-Id: <20260902131441.322167-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds auxiliary snapshot (EXTTS) interrupt support to
DWXGMAC2/DWXLGMAC2 and fixes a regression it would introduce on the
Agilex5 cross-timestamp path.

Patch 1 wires up a dedicated DWXGMAC2 timestamp interrupt handler.
Before this change the XGMAC hwif entries used the generic stmmac_ptp
ops, whose timestamp_interrupt callback read the dwmac4 offset
GMAC_TIMESTAMP_STATUS (0xb20) instead of the XGMAC register at 0xd20,
and XGMAC_TSIE was never enabled, so auxiliary snapshot events were
never reported on XGMAC platforms.

Patch 1 also unmasks XGMAC_TSIE in XGMAC_INT_DEFAULT_EN.  That makes the
new handler run from hardirq on every XGMAC timestamp event, which races
with the Agilex5 smtg_crosststamp() poll loop: the handler clears TSIS
by reading XGMAC_TIMESTAMP_STATUS before the poll loop in process
context can observe it, so getcrosststamp() times out.  Patch 2 fixes
this by masking XGMAC_TSIE for the duration of the cross-timestamp so
the handler cannot steal TSIS while smtg_crosststamp() owns the
snapshot FIFO.

Patch 2 has been verified on Agilex5 hardware: with both patches
applied, smtg_crosststamp() no longer times out (no "Wait for time sync
operation timeout" in dmesg) and the PTP clock registers and operates
normally.

The pre-existing FIFO-pop / PTP_ACR / flags races that the automated
review raised are not specific to this series (the same shape exists in
the dwmac4 handler) and are left for a separate follow-up.

v1: https://lore.kernel.org/netdev/20260806-dwxgmac2-timestamp-irq-v1-1-c051c79c9d90@gmail.com/
v2: https://lore.kernel.org/netdev/20260810100221.9166-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20260818132722.1852876-1-zxyan0222@gmail.com/
v4:
- Rebased on the latest net-next/main (v7.4 cycle, after net-next
  reopened).

Zxyan Zhu (2):
  net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support
  net: stmmac: dwmac-socfpga: mask XGMAC_TSIE during cross-timestamp

 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 11 +++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 43 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h     |  1 +
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 12 ++++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  1 +
 7 files changed, 71 insertions(+), 3 deletions(-)

--
2.34.1
