Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992480;
	b=HBQswIxVh+GLc49X/dnD1EonHRFWTjK+zvi6t1jsQ5N3currqnvbTvQimLk52yrOJBpP
	 ubWkbFtzTaY8uIWWiZgBI3cDDtHGsq3/WaNoKRQiMrr8X8isD2uk2u/8IbX7C4dE859Xw
	 NiykzHTQy9BQEZLKIP3Ry/5vvoh28j3JnY/gWlnDhguqCcozS5dUBy86HL4IjwBWiatzR
	 zekQux/V6pXUwCrz+xbf5He+hf1zn/uUt/8+D1h7KK9BQ4ZhoCjNFNInxOekZAEftzkDt
	 +cEiqchbGdbQwE8ItRbuLvP70ysIZWfvOjKtCfkbOdFPr5B2ecga6UZUVRp/5rUMgAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zHhr2ZuKOQTS3oVhgY7/wtWCuYen9Z8I9si9WIJ02xs=;
	b=R4gIPEgtNLri6ovEQ3TJopDYuCjUm3Hw+jkytc5hC9pJIwRwTs6Io4koUySa5+Nu2ulk
	 4wDp3ArdSKmSUXUFtoBwnnK24WZd0clET4Mo4KFQSPIkWaHMjb7RJlCWqJmqwsT4IZ48o
	 ALxok99FFzaurJusG1nxhKOnsF7GcyaYd7pa4nkFHpJdcmGTtZ/CUfJxDv4breyU9/RDL
	 yuyOX5Vs2P9Fu4R5jDfS77EHBcy21WqjX9PLncPEDCXvUGlkp38pIjQ01lPIrBvxrh8WJ
	 a7P1MHkNk4tfGlWLxXyDS+d1Pzm3+jD0wNLT7GFBds99S2avVco5UKA0pB95gXSkj0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Jp4fXsAT;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E36606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E36606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Jp4fXsAT
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc147d86bebso780070a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793992478; x=1794597278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zHhr2ZuKOQTS3oVhgY7/wtWCuYen9Z8I9si9WIJ02xs=;
        b=Jp4fXsAT8wSFwYhafgrWnszG/hOU3DU7kjJC59pTLeSxIehqcJ+Ejo4Bc+T8ilzvLj
         ohV1D+CO9EEcBqRj6IX9VEdsRF/Ozdxs3UMqs1zTdZm8cvyyJd7QImrX+/0tMn3sGB3g
         swC5mqadAOVhCTWZ/OoKdGvunyl6wU7rWRrgV4Et1+Dd0TzTLsayE8r/1L7CMgfOqRzn
         vGS3GcRjPYgGHyexFkHMTwr2G/x8MMht+FBAeC2jBQfdsTxAjrGfJoDu3BKnZVG2NizR
         TYXCRrm2oa8YYl7C8tF1ec/E8w/4+0r1PKQMZ0HGvkiamFDAWMZZ6UufdFdIVXFtKBdm
         W/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992478; x=1794597278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zHhr2ZuKOQTS3oVhgY7/wtWCuYen9Z8I9si9WIJ02xs=;
        b=Yuuu34y4VKcXJcnLWuRef/s1SXUDYZJFILygVg0K+kVvL0edg/xE3UpOVbBS9Rr4hL
         WyIXkwi43Ij4o2ZE3u98ewXdm5/dNlkkdjo0uqkW2HgZHC3V74qF2+SDbjVMVPkg08wv
         CP09kMVSK066pOHEINK9NZusFliTezleWzsgdkWzy8b0290uQbVm+Jt8JQMXRPMTNlN7
         vz7IP58vF4IG7B1RImZ35boDMhwmRZZJ+/3g3qUEVPJcnBYmtdJErOjtOWbDzTrAGrAJ
         jAjX3vhqJfemINT87Fb8RUgUR4fzuRBV+1k/wkBbJDJGN+/4uClPSQMNJL2NkOSBCnH3
         5TXQ==
X-Forwarded-Encrypted: i=1; AL+hErHV2ekdGfJ8MjD5I8AW5mbK9l9E6zRI1eJCCpOKVrUIY0gWOJTXwrD9x1jgGVy9PeGyhKq9Be/D+IO44LY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cYgChr3g48FcSj7RuGNb2XLKH/A6XQxUDdpznyzYVV90+i0cd
	l5vablyhKLmIe0k5g5GgC5v2ig2HQMzTOTNulXECbScVKy80SFpjOSYswVQBqTRau9M=
X-Gm-Gg: AYBFou2/CvRenPZNuf7a7ioEvDdpo8cio1CtxIs93FUfb3zY6EMHBif85rKcfOnYSXo
	a9NKzOK+XztSXMKL1rpJQ85A2JsjVoprBzhI4e2W8CaLfxgZWfzU0a0URIARnjQhKM4/lxZ6Ya9
	/EAvCP8vQ0Y4sD2eXR0xSIS9fV4a3fQPVRW2H2D9hee3o0KFbwZp5BmgYaLRplNejx0Wyi2eMkD
	1YVYW2iUb3IFMVLyPnt8QYPIdIkWLDMxhblihcrFnprAXGcRQbS7jylIjpCbtVdQPnP+XHpvwST
	wTEyPrxs2v1rJFDClZUzrJ5Z8rGdsunFRbjBjEy6w2/90x7j/Y0t3lEgiG8GlkZCXwG3AOVD86H
	SwXLY1dUiBKtj9uNddiKbQRTZGtNDXX2x6cBGCAEZkxFK+uImoTStkSDdGHyKVWIHo13+hlIFMz
	3GdiL3sBIOjNqrrErxt/pmUiQLYbGOd36YkxiNcOtcGu3YpzQGgaLG2beTt8XnZ/o+vvYM73Flj
	wVoTmZZ01cJRM3t0+fsR7wjgS2gdMCvdcoUdVxMKeiNy57BwoiUsedFZ+TO/CKgvaCOlyWfPHnC
	8lkWQyzbSMFyiCk49fIPGIeknSWK0brPz7hTiJLMg8c=
X-Received: by 2002:a17:90b:3b52:b0:3ae:8983:4ef8 with SMTP id 98e67ed59e1d1-3b0db6b701amr2004602a91.9.1793992478518;
        Fri, 06 Nov 2026 11:14:38 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:70::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057c3db1sm97167a91.4.2026.11.06.11.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:14:37 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [PATCH net v5 0/4] bnxt_en: Make RING FREE more robust
Date: Fri,  6 Nov 2026 11:14:16 -0800
Message-ID: <20261106191423.4194081-1-joe@dama.to>
X-Mailer: git-send-email 2.53.0
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

Greetings:

This is a follow up to the previous RFC (linked below).

On two production systems, I saw the following dmesg pattern:

  NETDEV WATCHDOG: transmit queue 0 timed out 6073 ms
  Resp cmpl intr err msg: 0x51                  x20
  hwrm_ring_free type 1 failed                  x12
  hwrm_ring_free type 2 failed                  x8
  AMD-Vi: IO_PAGE_FAULT  x3

This suggests that, for some currently unknown reason, TX completions stall
and the netdev watchdog fires. The driver asks FW to free the rings, this
times out, but the driver ignores the possible failure and frees ring memory.
Since the FW didn't respond to the ring free command, it is possible that the
FW is still DMAing to the memory which was freed.

Since the RFCv4, I found a third system that hit this repeatedly:

  NETDEV WATCHDOG: CPU: 35: transmit queue 0 timed out 5459 ms
  hwrm_ring_free type 1 failed. rc:fffffff0 err:0    x64
  hwrm_ring_free type 2 failed. rc:fffffff0 err:0    x32
  hwrm_ring_free type 0 failed. rc:fffffffb err:1    x64
  hwrm_ring_alloc type 1 failed. rc:ffffffe4 err:4
  hwrm_ring_free type 1 failed. rc:fffffff0 err:0    x44
  Abandoning msg {0x51 0x3e35} len: 0 due to firmware status: 0x408100
  nic open fail (rc: fffffffb)
  DMAR: [DMA Write NO_PASID] Request device [47:00.0] fault addr
  0xffffa07ef000 [fault reason 0x05] PTE Write access is not set

This case differs from the first two in a few ways, but this series would have
still helped:

 - The ring frees fail on the close path and again on the error path of
   the reopen (bnxt_init_chip()), and the device then writes to memory the
   driver has already unmapped. The series stops DMA on both paths.

 - The interface came back up later, the watchdog fired again, and the
   cycle started over. The host logged 79 DMAR write faults in about 20
   hours. Patch 4 breaks this loop by refusing to reopen after DMA has
   been stopped.

 - The firmware answers each RING_FREE about 5 seconds late, after the
   driver has given up, and finally reports an error in its health
   register. Patch 2 does not treat these late responses as success because
   their sequence ids do not match.

In this most recent case, I suspect the hardware is faulty, but the driver
shouldn't hand memory back to the system while the device could still write to
it.

In all of the above cases, the IOMMU caught the error. If the system had no
IOMMU or the IOMMU was in passthrough mode, data corruption or crash would
have occurred.

In the future, this could possibly be extended to make recovery automatic.

Thanks,
Joe

v5:
 - Switched from RFC to actual submission
 - Patch 4 updated to use an un-used bit to make backporting easier.

v4: https://lore.kernel.org/netdev/20260925174404.2789072-1-joe@dama.to/
  - No changes to patch 1 or 2
  - Patch 3: reworded the message logged when DMA is stopped, a rebind is
    what recovers the device, not a firmware reset. No functional change.
  - Patch 4 added which adds a new bit (BNXT_STATE_DMA_STOPPED) that is set
    when DMA is disabled. When this bit is set, the device requires user
    intervention to bring back up.

v3: https://lore.kernel.org/netdev/20260923210744.3406861-1-joe@dama.to/
  - No changes to patch 1
  - Patch 2: Don't poll for the valid bit as Michael suggested.
  - Patch 3: bnxt_hwrm_ring_free now returns -EIO instead of stopping the
    device, so the remaining resources can be freed and the remaining commands
    can be sent before stopping the device, as Michael suggested. Note the
    switch to using pci_clear_master in this patch instead of
    pci_disable_device. This was done so that the normal shutdown paths can
    call pci_disable_device without generating a warning.

v2: https://lore.kernel.org/netdev/20260922182405.1290749-1-joe@dama.to/
  - No changes to patch 1
  - Patch 2 from v1 dropped
  - Patch 2 in the v2 now checks the response and logs state before giving up
  - Patch 3 in the v2 disables the device to stop DMA before freeing ring
    memory

RFCv1: https://lore.kernel.org/netdev/20260917233218.1160001-1-joe@dama.to/


Joe Damato (4):
  bnxt_en: return the RING_FREE status to callers
  bnxt_en: check HWRM response if completion never arrives
  bnxt_en: stop DMA before releasing rings the firmware did not free
  bnxt_en: refuse to open a device with stopped DMA

 drivers/net/ethernet/broadcom/bnxt/bnxt.c     | 122 ++++++++++++------
 drivers/net/ethernet/broadcom/bnxt/bnxt.h     |   1 +
 .../net/ethernet/broadcom/bnxt/bnxt_hwrm.c    |  33 ++++-
 3 files changed, 115 insertions(+), 41 deletions(-)


base-commit: 19a227903e65c7a9c179156485660a4e017575fe
-- 
2.53.0-Meta

