Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423719;
	b=auZUTxZVKpv20kPkHjwkzFQ66dHfjGYQB9Fmvu0NIFPIFNqcJ4OuEHuIq+qxjT4b3a5O
	 wbfth9BIF3qYloSvFY47MK0qQRKBao0/LZSrjKIoieL3Sqo/YVa5HCVAxC93B5HNCchGY
	 07LhDfvj4FScH3+iv6J/BBa7qd+/PbCtFDyD28UhLsSKVdxX7/bk1sv82IckRu02NbrYA
	 gqOw/n8iA3lwkouVaM0K/8TGbmcE3do612nWfNFE+Q6+AmSF2HJ95PRNNnKQBlf789cLo
	 12pNOvClBd2Y0sGSeDQHNzWB4TDkd5FRZ2rlCex08+gRcZpbjfFfwQKYl/NnBOvRnHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423719;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=WGmBVBqTPzE6wBBa29Lpbl1ycjxY4huditJNqegwALo=;
	b=QQPivQ2aaLyt/ANSXCbYS93PcTuXMu/I4mo3gKO6C7yVgPGirrDHcWz9wKM2HWAtinki
	 QyhlMl2qh/0+4Dv/MynrK3L4vdfO+y8r1agUPOu4LjVyMVYCrBnqswOXZF4adV/r9Q2iK
	 WPK2pVz238TcCf9m3Qu+XN24KF8l48b9FHkw0MFjBU/XAu9fbp+KR4Ng7iNWb/GywD9Ci
	 2qlOQf42xsV8Z4iLUB89QUxGP+d77UcSKOUm3umkv15EWB+cn6AzXXGCJ2rVB1Z0DID59
	 qYYzki7lHiu5lQFUU5IBeCvFZ9oHRxWm2h7Am1/BqKON4yGHSgGSBPL7EbfnPrpDEGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="GXjtCnX/";
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE89606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE89606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GXjtCnX/
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-93f22a8515eso280430085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:01:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423718; x=1795028518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WGmBVBqTPzE6wBBa29Lpbl1ycjxY4huditJNqegwALo=;
        b=vplDaxS6BqGIOJEK9mKn7Z01XZoUfF9AlD4SMJVxvKiAcL2nk0/8e80IaVB++JqcCr
         U0iWrVmx9Urcb1OOrHS96LUM0XLWQNd05/EIBSjkFuSk/j2nh0+Rs7UJvd842Vf452Ew
         Nd/UZDK/Rb6JDvF2Gufkt0wm5ze38bFDUvIoJYsG9mR5zMyJQS4cHTfNXpEKC6Ugi1Nu
         0XE/wI0kxMRQpUqT3EPfz36k3GDNJl4BoQ6u7i1HULXKSJkiXd9W7B2QQV8rlPIoeaHf
         UMF1b/7fSxRJ49SDKydKFMODUZ9LpCrqBgj2jPH3ElEqjd4dYfkmhPSv1dq8e8zHe12L
         e6bw==
X-Forwarded-Encrypted: i=1; AL+hErFGCYF27g339hl9GRwWHXwgmah+X2Qc3eicyRaE8ADOO2y8X0JMu0fYxtALo9PXegKFL5oMkAx8bVPbY9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oa3e+oucL6qvWLLkbkUDl3oaIkhHButYvQNAfkuUKpesHj9XW
	aZeMqIH9sXW48rqloCilDS3lrgv29WixOVSJXNh/Wvgb9nKsPK60BcmBIix4I8gWHZk9N5hdPwk
	suV3CR8s53Q5oqAp/+aIaHNZrPm5CDnYQ/x8lEMeF0FReCh+K0v+K7p/tqi48ieXGfHRgtFHMFs
	zUmDshFsJttyx2UUBkwjDgMqiCAMOeVjrBS9DSkZyZopfpX7yGTn0/RAg4V+hVFFr+7eOIlJPBf
	qkzCibnZDZDA1KsutJES0Artw==
X-Gm-Gg: AYBFou1xGbFFoYNYK5TJYBPwzHT6TWJ1EYWBl2PF27UjaoSNErF/qIrIk0ACl20nil3
	k10M+hCf7bN9TWZx4cisOpPtxZ1iy9U/Lg/Zt562QCAhz9Txe00ZVcS0+raKYldUgkPnzuT7dYu
	fwaeqV3CiT/lUsarngToK6KEwpyhuMsykhNfcqV6qPQLVM1sFAZ4LwyorBoSv5z7tnMtav3RQIE
	AopwXjEDFH9tgNQ1vCSNvDyPZ6FZGXH3+a40mOpDdXNC4N+HhfiFOpEUAm0nq2YwJZ/E2yysJGZ
	yQv5zPrNuZ6cwtxqGlFrqsAvp1S+T5Vzbca9zl1AwHHtBrVWDI3ytLMU8pyy9VIhHAUtl/y6PvZ
	sJFOLo/TFhXnNkNXgvgCB5xaSETKxq0NbwI3DterihTwnfPKo887uTkXnnbnvtLbcJytEu7dM3i
	u6/xsDS1FGJWLnXmpnDZvAmbtpWjhSH1q/gTRlKxa0qQ==
X-Received: by 2002:a05:620a:1a02:b0:945:f275:76fb with SMTP id af79cd13be357-947b002ccbbmr546498485a.42.1794423717551;
        Wed, 11 Nov 2026 11:01:57 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9479ef68bccsm72042985a.6.2026.11.11.11.01.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:01:57 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6631079eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794423715; x=1795028515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGmBVBqTPzE6wBBa29Lpbl1ycjxY4huditJNqegwALo=;
        b=GXjtCnX/JlcdnBl8m58qpkEwqCeVbTt6BGj9vkP7o+5++a6Pe9HfY4VCmoYSjATwaB
         hstyPOS/xpYFRTSCPMceqHZSXVJn/LkW4r18xbRtLmv14zzhDxUUxkI401BeUFgRMWhF
         mHqyc9z/zbUOIXlxWge9sGvpAqKAiI3Ii2FYk=
X-Forwarded-Encrypted: i=1; AL+hErF3N5rVrlriOHATZjiM/wmCtQxK+JT1WAy9RU9/TdMfqEYq0jufEkLtwiaMvgWtljLSer1zn1eLiKmAPYA=@vger.kernel.org
X-Received: by 2002:a05:7301:77c6:b0:36f:d53:cf2f with SMTP id 5a478bee46e88-37682f94242mr3747138eec.1.1794423714648;
        Wed, 11 Nov 2026 11:01:54 -0800 (PST)
X-Received: by 2002:a05:7301:77c6:b0:36f:d53:cf2f with SMTP id 5a478bee46e88-37682f94242mr3747097eec.1.1794423713587;
        Wed, 11 Nov 2026 11:01:53 -0800 (PST)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm20860468eec.26.2026.11.11.11.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:01:52 -0800 (PST)
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
Subject: [PATCH net-next v4 0/5] bnge: Make NQ0 persistent across open/close
Date: Wed, 11 Nov 2026 19:00:06 +0000
Message-ID: <20261111190011.53437-1-bhargava.marreddy@broadcom.com>
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

v4:
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
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 518 +++++++++++++-----
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   5 +
 .../net/ethernet/broadcom/bnge/bnge_rmem.c    |  10 -
 .../net/ethernet/broadcom/bnge/bnge_txrx.c    |  57 +-
 .../net/ethernet/broadcom/bnge/bnge_txrx.h    |   3 +
 8 files changed, 493 insertions(+), 159 deletions(-)

-- 
2.47.3

