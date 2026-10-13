Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAC2541E55
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922083; cv=none; b=Q7Sb+/f6a0/sJxpuSCnzRRKaZoUCHA25umJJgo7dgOI9B7L4xKmxNgu8xMIS9HiYftj+4vKg6I4SAubj0VXEs/xuBhkrNLqfR3UY9MPARHLIbxNZXE1NVHbCwCXtRLOF0I3ZmNMbfvQ/LGsYAOo8POsrkk1jJqu2GPpURyNun1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922083; c=relaxed/simple;
	bh=ylNSm5iJQKbAXlJuT8nx+gEikUoDjXRomMlE59BXUcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iCQKa8Y6IPYih47/h3CjMkS6VWtI99e1K4JMpnxWLc5TG1+qXhJQPfys3qVdowWsTSmUM7r0QR8rfbXmYnTbYn+f4QCmuVJEnlLCi2uvEKpBRJZp3djBiSie1/KZlrRXu72C6HQ8dD3T/dmbKnrii6sQw0E6DVoqBYxIhPymxlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dILCO1bI; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dILCO1bI"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3aacde0cc0fso1348056a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922081; x=1792526881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vDQVXA2YtwSF9W6aGBSr5Gd50xsxUDYwXPsk5xejvlQ=;
        b=H1I4vzXRtDX9d79iEoG1297jatSFDj7pwqOkttKa8w+uHwso3Ann+oFDDnM4a1r/LH
         P41rjDkFCdmvGA7IoqHcdKBM+higOGUuJUEP7N5QIzeYG4ipy9MMsnBKH6HFuo/xppS8
         RGOMbtxiauvugiSJRo8BDllOV1fJ1VR38ciEq7Mi1he4qkgqf3MO/ZI3/HDOY34OHGdG
         Wp3Vh9qOFXcTjx2gr7KdClHQXncwVEGglm0rDM5ewNEHnn4dew19dXxhFDuIeXcEscmu
         Bs/stmDnOk37nqyMl1S20ZLlBVswounJYYlG0ks3g4EYlSbFkjKmLv6RoLLWXhwJRExa
         wXSw==
X-Forwarded-Encrypted: i=1; AKwUvByTwwxOzmQ2ETLIUXjyE3mqLBCLkXPBCLGk9Dp7x+T13DM6rnDiVizrEduXQTQms4Uf3JxenFKFPJxVRgI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdK5hd+kaEtKKyi8bMh1s7cAsiMKpBtx9DIV1k+cPACjIV7plq
	PcAS95yMCz2eWSE4zIykrnYtX1IXSLNtGsLaz38evDC8bJBkFqUuSYY4iiAqGVW1us6zr2bP7RN
	vbOAsVHscFWemRZjrkRFaXz00T79W2jjzCjzD2sVXpfVUVdiVJHYXEakNLlkpkgxyJUc4Z+LohC
	U8Lyl250628T+3eulTmiuyGoDOy3qfZMXzkRcOEgUvIqhkVozOKXIVbNvgOWxDqUHMtxEbVTwUN
	hsjVkU2EDDcsZRXy33Bt0wNOw==
X-Gm-Gg: AYBFou3N2b7IGzNwtENpgxWVW8u3BVUzeC0W0C4VvAByI6wKd+zOw8BYRK8Q238zylR
	bQ+U0lmTMBOw9kK9hrcu083BBL8F3UTwZ51Dl0vvPhEeJgsjReytybvmjJzoYmqMbyRKb7GtXLY
	p4nlIBQgv+XMxq16BEfOyNe26xxumn8OyTDuVwfubzxCv6DiUrvI80xKtGLVQRvmZOoPxiNoffl
	Zswz49/5CuuTRsvZ7v1D2by86pGmhEGBnfjyWhlebSHiOc6rUxpk1TlE0Ame7jkZ+cOf//Og1Cd
	bp+DgeckkBac85f1C6PCkbOqdG+W8J9kGFk0q59LZ8mD1hI843xHNbOD+eG892sKmuL8HooRdU/
	C9NFECx558IuYWvBhjEKkPhmQVMtTvHG7L2eTDQ6Ue+4QjzP7oml0yHsOxBPMm3m63lvEs9/4y5
	szYjgBbaEV4DZk6PD8tFrMrKuV0S0b45DUvQxFBJKbhdb2
X-Received: by 2002:a17:90a:d44d:b0:3aa:f4af:1e17 with SMTP id 98e67ed59e1d1-3ab3a9d6d17mr9778065a91.39.1791922081178;
        Tue, 13 Oct 2026 13:08:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac5f3d0af9sm334328a91.2.2026.10.13.13.08.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:08:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-143826c4a13so2135529c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791922080; x=1792526880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDQVXA2YtwSF9W6aGBSr5Gd50xsxUDYwXPsk5xejvlQ=;
        b=dILCO1bIGbmikUJIgUJLG8ZWgIq5hFH0mZTDgJrVPahtUSFQ0Bjt39dNlCQ0F5IcR/
         SP7ASbYD0xHoDLuQYLZ8HCfkjXllRk0WghdcE9xQOyolFTZ6MyQrTb3/rCULPS5ZboHV
         HfJ6VvBe9UqJjiegtUVQdQxRZeBzlRIL9Yx5Q=
X-Forwarded-Encrypted: i=1; AKwUvBxpXQN1shVAJW1iK4DGW7XhZHUdwlr1f1gUgFQhOhmEUgg/UQ59/TtdaERuM2JBQA/8NPH3hLZv5IRc5ao=@vger.kernel.org
X-Received: by 2002:a05:7023:a47:10b0:14c:1f57:3e86 with SMTP id a92af1059eb24-16a5f5ddf6bmr17972978c88.47.1791922079300;
        Tue, 13 Oct 2026 13:07:59 -0700 (PDT)
X-Received: by 2002:a05:7023:a47:10b0:14c:1f57:3e86 with SMTP id a92af1059eb24-16a5f5ddf6bmr17972937c88.47.1791922078349;
        Tue, 13 Oct 2026 13:07:58 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6f5csm39526585c88.11.2026.10.13.13.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:07:57 -0700 (PDT)
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
Subject: [PATCH net-next v3 0/5] bnge: Make NQ0 persistent across open/close
Date: Wed, 14 Oct 2026 01:36:40 +0530
Message-ID: <20261013200645.1346299-1-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi,

This series refactors the bnge driver's Notification Queue 0 (NQ0)
lifecycle so that NQ0 remains persistent across interface close/open
cycles instead of being torn down and rebuilt each time.

This persistent NQ0 setup lays the groundwork for additional async events
in future patches.

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
  bnge: make NQ0 persistent across open/stop cycles

 drivers/net/ethernet/broadcom/bnge/bnge.h     |  47 ++
 .../net/ethernet/broadcom/bnge/bnge_auxr.c    |   4 +-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |   8 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 489 +++++++++++++-----
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   2 +
 .../net/ethernet/broadcom/bnge/bnge_rmem.c    |  10 -
 .../net/ethernet/broadcom/bnge/bnge_txrx.c    |  46 +-
 .../net/ethernet/broadcom/bnge/bnge_txrx.h    |   1 +
 8 files changed, 448 insertions(+), 159 deletions(-)

-- 
2.47.3

