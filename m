Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896305;
	b=FO93/t2Tkcawws+7ptht1j7rXOSK7XYotxUHMaFFowJjXrFp8zJJwy+ykf6c6eKgTkld
	 M5ugmteaxnx0Zs1r+XrFpMQ31Scaqq2nFYlqLy3pbxWoOs+IEOH7Exv6EIq4YaAE3hOHG
	 LoOFl972AhTJP9Bdnz0DhKHJngTUaCuQeFl8xSfnjrzBZh7CIarNjGKm/MYeqbyJFMKeS
	 uUYxFe83mYf3mCuNt7+OC7SM8tyBnSo0XRxKtFm+Lv8x9pkJnDNPu/Si97wsNVQ157teS
	 Bo3U1xV7sd4HwkG9yd3xW7CDyOggxqqvdMc7/c8G+hJragTaipRKiNpt4hWKfYtGH1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896305;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=SsWVKwBOYb7UG2YBgpx0/XvlL0YKlHN9QVnO1zPn7ho=;
	b=4hPUGAAb+7402Z0CayLL77VNE1o52IkwYPSfcT9LTclzXnbvSgVG8eIabxRgs0coGhRA
	 E48Iff76246R8jfet7DzTA9+5NJZ80H/Z8fpuS0rIfToKqzz6oETwd/Zm/OdVbNw8ktvZ
	 2euRctP2R8jX/tI+dCgPLx/vlksEyLUBPRxzO0LjqN5p59Qo064H/k8glYpaWQo6KceFS
	 4oU3tQzZtNzfDq2L/Hg8iK4UrlF4vwPqqK5NTfrZjY5T84SjZvXClzQxVUhCsdxooNzFw
	 UjXdcexicbhZQq/jLpRs2IE2YO+Y4Zp+9jibJ0M2JpgCBOHGhxRJszFFIm8jBIzun/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P3zNfnTe;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C71606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C71606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P3zNfnTe
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so449400a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896303; x=1795501103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SsWVKwBOYb7UG2YBgpx0/XvlL0YKlHN9QVnO1zPn7ho=;
        b=aQ3QPkKUTr79bAuFvLYVV8cPwMPgDyPO1GXDDK3XNSEH11LOUTts2mRmKBTNGKPJTG
         evSV8Ufgmp4vj9Tm/kLeX9RmBCPQzDwNjegZ3W1vzUUc1BQ+xb3D8ClNzK7oelW7yOq5
         NJ5yvLvt4LQRA/7onSovO96Cw9rmh3EOveaIiyPuvAIqHxqhaHHXsC/Vo3j/9FYqiAAc
         YYuubavjUnZcA/hgmV2VHYvmpZpXDogN32OGs0rpiu86r998gsptzJ/5HYmbZaSF7JlO
         JtfW4P1MlLnYSC5hsW5XH8xG3eo+d7zjGMt3+W/xNo897qN4RwzdJLHO3HO+JutU8WHK
         nC6w==
X-Forwarded-Encrypted: i=1; AL+hErFwoCVEqp91X9m3EgBd547elz8JRMCQTpcYlQ/Y6fi+uE2o2YNHIGrLTtp6qGPCJi0PJgaCGGqyQPl+qos=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8tkXhTIMIjeHhYdVjV5vGerTnvT98bkr17qfgd5wD0bb/towQ
	64jSYJSdnK0GpVw5poVWwlU/kQvWnhfzq081cL/R2OhBqTPBPrlVUuViD6ikQ9+hqW+LfFh0P0P
	smiof0aL7+02PjdhlGXxHXPC2IHJzUQSNppai+SPJ7k7xgQeiKjKT1MEUYgxNB3FK5YCySmDZXW
	xBUuE9cS6EvneKIi2vHjFcrBY+oLN0KWJJQc7vaH+lCEIgmKNKh3o8pl0S1BxrTcVbuWiFWp5cp
	yfPjjFyYtJne0EeUJ6tpEu1ZKv+
X-Gm-Gg: AZFdTZfqeQvTLfN7n08tWhQ+BDvh/57VQvdU0UCJAZs05LQubnskyfZJu8ctScLrr/0
	mHBQfsTq0xUgwlLFV3f8POrpSwpiEDEod2vafeuz964A6QC5sQqNm0CibuBl7cDmiF9eQefl1SV
	mLA+w/Mnz43WJg+zuMYIfX8Cx/Mv51rL28OJzt7rqmzsphdFwHL0SkW7ng1kvu1zJEYCVBA9MYw
	30jBnr77iIgnQXYCbgrYlZsFliD/amE08QE+0TwK+LscIi1Pgncec8moc4I582Qb4ZCY+YXEhqd
	Awlg9W1/QjZJj3bVTa1MPFzSTsc6XUsCQ76G2e1VXqEOxwr3XuN+xWEvIY8WSe30mMLjsS/x2lK
	7AaNqSrsLCjULF/7kW5tVdE1RWoNtUEAO/jHLxbSjYHf8hDr3lmQcly9aQzqNQ/CeUe1dPR1Cwl
	mu68XjSgzzwA66xkMrS3rKUIDJXsYVAh/XQsjEw8BFZA==
X-Received: by 2002:a17:90b:4acb:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3b1b0a20d40mr13973658a91.36.1794896303002;
        Mon, 16 Nov 2026 22:18:23 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3b3b41e1csm731346a91.4.2026.11.16.22.18.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 22:18:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so6201080a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794896301; x=1795501101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SsWVKwBOYb7UG2YBgpx0/XvlL0YKlHN9QVnO1zPn7ho=;
        b=P3zNfnTeAPAL0oevqYbgVAdcthqe60yYTI8K3dGzmLjjN0vfw5p0qJWz/RSo2/hW1M
         RB6rcTl97o82DQkjGz3LC8p4WXOP+b/4d/1KH3dJ2dqUFTJgBNcBtk0LbTgvhQqMZpwz
         JhN1x4Dv1CROacRX0SerK/mZiyFrcPhOOMhJA=
X-Forwarded-Encrypted: i=1; AL+hErGDHX9CDJo14+Zn0UMcYfK63CWhG3bdvbY42KQHA6bJdP5sFxxqfAUsgvYOWH79OD9ETxb6jkvW9T1e0i4=@vger.kernel.org
X-Received: by 2002:a17:90a:d2cf:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3b1b0815523mr12178655a91.9.1794896301190;
        Mon, 16 Nov 2026 22:18:21 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3b1b0815523mr12178622a91.9.1794896300664;
        Mon, 16 Nov 2026 22:18:20 -0800 (PST)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8668sm8669335ad.6.2026.11.16.22.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:18:20 -0800 (PST)
From: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Subject: [PATCH net-next v5 0/5] bnge: Make NQ0 persistent across open/close
Date: Tue, 17 Nov 2026 06:16:36 +0000
Message-ID: <20261117061641.122942-1-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi,

This series ensures the bnge driver's Notification Queue 0 (NQ0) remains
persistent across interface close/open cycles rather than being destroyed
and recreated on each cycle.

Currently, NQ0 exists only between ndo_open() and ndo_stop(), so firmware
async events (e.g., link changes) and HWRM completions are not received
while the interface is down.

NQ0 and its MSI-X vector are now allocated at probe and retained until
remove. To conserve MSI-X vectors for Rx/Tx queues, vector 0 is shared.
NQ0's NAPI exists only between ndo_open() and ndo_stop(), like every other
NQ. While the interface is up, NQ0 runs via NAPI; while down, an
IRQ-triggered work item processes non-datapath events.

Patches 1-4: Preparatory refactoring (alloc/free helpers, logging
             fallbacks, NQ iterator, irq_tbl layout). No functional
             change apart from the items noted in their commit messages.
Patch 5    : Create NQ0 at probe, free it at remove, and add the worker
             fallback.

irq_tbl layout after this series:
  Vector 0       : NQ0 (probe to remove)
  Vectors 1..A   : RoCE (auxiliary driver)
  Vectors A+1..N : Main L2 NQs (open/close only)

v5:
  - Addressed review comments from Sashiko.
    https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111190011.53437-1-bhargava.marreddy%40broadcom.com
    - Disable NAPI (including NQ0's) before the NQs are masked on close,
      so a concurrent poll cannot re-arm a masked NQ.

v4:
   https://lore.kernel.org/all/20261111190011.53437-1-bhargava.marreddy@broadcom.com/
   Addressed feedback from Jakub Kicinski on v3:
   - NQ0's NAPI no longer outlives the open state: it is added in
     ndo_open() and deleted in ndo_stop(), like every other NQ.
   - While down, the NQ0 IRQ handler queues a work item for async and
     HWRM events instead. The mode switches only in open/stop, so one
     context consumes NQ0 at a time.
   https://lore.kernel.org/all/20261022181639.1815c338@kernel.org/

v3:
  Addressed feedback from Simon Horman:
  - Extracted the failure-path NULL dereference fix in bnge_alloc_core() and 
    submitted it as a standalone patch to 'net'.
  - Dropped unnecessary defensive NULL checks (!bn->rx_ring and !bn->tx_ring) 
    from bnge_free_tpa_info(), bnge_free_rx_rings(), and bnge_free_tx_rings().
 
  Addressed comments from Sashiko:
   https://sashiko.dev/#/patchset/20260922052904.59237-1-bhargava.marreddy%40broadcom.com
   https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260922052904.59237-1-bhargava.marreddy%40broadcom.com

  Other changes:
  - Renamed series from "bnge: Support async events while down" to "bnge:
    Make NQ0 persistent across open/close" to accurately reflect the
    streamlined focus on NQ0 persistence.
  - Completely reorganized and streamlined the series from 6 patches down to 5.
  - Redesigned and shifted the MSI-X vector/offset mapping layout:
      Vector 0 (IRQ0) : Permanently dedicated to NQ0 at probe
                        (no longer recreated on RoCE load/unload or open/close)
      Vectors 1..A    : RoCE (aux) queues
      Vectors A..N    : Main L2 queues
  - Added a new patch introducing bnge_err()/bnge_warn()/bnge_dbg() logging
    helper macros to fall back to PCI dev-level logging before netdev
    registration during probe (Patch 2).
  - Switched to the bnge_for_each_open_nq() loop iterator to clarify which
    loops are open-only versus those that cover all NQs (Patch 3).
  - Enhanced safety in bnge_napi_poll() to skip CQ notification processing
    on NQ0 when completion rings are unallocated while the interface is down,
    preventing invalid dereferences of cp_ring_arr (Patch 5).

v2:
  https://lore.kernel.org/all/20260922052904.59237-1-bhargava.marreddy@broadcom.com/

  Addressed comments from Sashiko
   https://sashiko.dev/#/patchset/20260901191728.643212-1-bhargava.marreddy%40broadcom.com
   https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260901191728.643212-1-bhargava.marreddy%40broadcom.com
  - Dropped patch 7/7 ("bnge: Process async events while administratively down"):
    - Link events while down are unnecessary to process since bnge_open() already 
     queries and updates PHY settings via bnge_update_phy_setting().
    - Keeps the series focused strictly on the NQ0/NAPI lifecycle refactoring.
  - Corrected the order of operations in bnge_quiesce_nq0() to disable NAPI
    first, synchronize IRQ, and then ring the doorbell to prevent NAPI
    rescheduling race conditions.
  - Added support for dynamic MSI-X vector reallocation by introducing
    bnge_reinit_nq0() during interface open.
  - Fixed potential NULL pointer dereferences in core ring cleanups (e.g. bn->rx_ring,
    bn->tx_ring, and bn->grp_info) on allocation failure paths and failed opens.
  - Fixed a resource leak in bnge_init_nic() where RX ring pair buffers
    were leaked if chip initialization failed.
  - Corrected the MSI-X vector demand check in bnge_resc.c to ensure
    sufficient vectors are allocated for both NQ0/aux and main rings.
  - Changed CPU affinity hint failure from a fatal error to a warning.
  - Added robust NULL pointer and safety checks in ring allocation and
    cleanup paths to prevent potential kernel crashes on allocation failures.

v1: https://lore.kernel.org/all/20260901191728.643212-1-bhargava.marreddy@broadcom.com/

Bhargava Marreddy (5):
  bnge: factor out per-NQ alloc/free helpers
  bnge: add bnge_err()/bnge_warn()/bnge_dbg() logging helpers
  bnge: add bnge_for_each_open_nq() iterator
  bnge: make irq_tbl layout depend on BNGE_FIRST_OPEN_NQ
  bnge: create NQ0 during probe and keep it active across open/close

 drivers/net/ethernet/broadcom/bnge/bnge.h     |  47 ++
 .../net/ethernet/broadcom/bnge/bnge_auxr.c    |   4 +-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |   8 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 513 +++++++++++++-----
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   5 +
 .../net/ethernet/broadcom/bnge/bnge_rmem.c    |  10 -
 .../net/ethernet/broadcom/bnge/bnge_txrx.c    |  60 +-
 .../net/ethernet/broadcom/bnge/bnge_txrx.h    |   3 +
 8 files changed, 493 insertions(+), 157 deletions(-)

-- 
2.47.3

