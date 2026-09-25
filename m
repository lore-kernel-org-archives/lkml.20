Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543973BED18
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790358253; cv=none; b=pY7HJ5yJ0Jtpejyi57kPMOSZn23VcFnP1SrAW9iR9GCbq44JMISrakzeKvAqv5RrabnRO8U3pisEVP6tz/4Lp4DZUD3e9UASklCychIh4xi9z5bZmoNVdvvhC2NqIBlgxVFKveUzhwf3nPY+fcS4KHmFRHKBbQUAg2IRadbSuJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790358253; c=relaxed/simple;
	bh=lzQs0tU1yYqAVocT49emvCDvrENuMTJy20JKeuFCVI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yl/LY/cWwi7OVLIPH1wysx/Mmg+zBAeuvUcrbC4JoI1FxeLjXnrSxCUlbdjbJrUT9hMfyVObSQDl1UQS5QCBDGyCJ/aMEfGl7aoxiOkwJi643vgY+QCtuoxqyc3pgAdX/jo3lwyIvHbmMWAxNxI/u7Wjgqkkyw/2XSW5AULapls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=WM9Z3rkd; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="WM9Z3rkd"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so752330a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790358250; x=1790963050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TK/DH+4JzTnTVS+XnmmVmFsrlIQXhSuIy6L0xg5cFTs=;
        b=WM9Z3rkdnnJ4vm1rxoEnjYnAE2EWCNDyfwP2iyP60XdgGcVo3Xyl7p23Y3YuqRDie8
         dOO0h/CBKOuH/57VJhWqx3xbstZhC/9dxKsUq5+ll90dTZge8/uwNLERowc9mmTp5w4P
         ifm5ADg7OLu/TgJCrpZQj4kI7yMNYVLcNwC9XmLOB3I7+by5ECU4Q2KRBe2rGKhjRTDP
         h7YZfwTE3rJKGMBtoNYo/iDKnv93JpbAmFo3Db5e6dYp4s0Ix7QdbYHJk2eQskUKJnLi
         gNoyLD63uCUSBrKMEdlFlV/j8BtcbGSQewk81vxF59/vuHRA2mKyK4qykZZoYTg5YKno
         GinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790358250; x=1790963050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TK/DH+4JzTnTVS+XnmmVmFsrlIQXhSuIy6L0xg5cFTs=;
        b=MGYbMHOe9fSP1ccC9gSif9HVWFxYfKdCP1OO3UsBOkH8u2RbmUc4/cyWb4DaNbng5L
         M1uR57yT8z05D9FjOcJ/B+/GO3Q/WcLYDnvgelwmqmF4q6b66ApE0H7thC/04WOLacyE
         SpjxBUKFdfwT7dhfaAhKf0x0iT42X8jgnKUgbKwHB9HGqReC+p/8pBIu9pCTJb81oNYT
         eFYMiOVUbmcW4H6CULqFoRhfklxgEKdxjUHiJLU6YtTBf3UF2XAiugdllbzaGdTH0K64
         KGASjB26mr4Be5juXf26EKqaQDPqaajxjEx64MKCuQyhG1d6xw8nGVy7U8aDHJFZMNFX
         S+DA==
X-Forwarded-Encrypted: i=1; AKwUvByGtEO39sMySeEkaE9oaBn5qzhVoJo9LH5ExQ/YK93k8UC+Y4w5gl+u1L+BO14VgICdGtLsXLXO6hrwy6M=@vger.kernel.org
X-Gm-Message-State: AFuF++lTGXg22VlkTLBkNY/Z84cPcO4daksk77bNmAdERUZUUuaV/z7d
	4KBcptw1ssnzci2EbowYVHFXCNR6DItL98SwQxpd76OH8CoO58zPesSrMSN05rG5oer5wafhJsA
	+A2wa
X-Gm-Gg: AYBFou38lOVT0MB1CQXyPUYSQVQfckFIuvXc2lSDx62CLLYt6abs7Y6LiNH+CGI3ift
	vp4gRqqKQmtnPl7ddG/Vt1eqxn/eY1GUjY9GeQkZhmle0o1ArNxj1a+YV7MkAy4yMm2Jb0GDaRU
	7EiNytjMuwDykEs/gDjFOcDM73RApyYdTXyQNJMopGek8BDftInlL7mfrTdWFHrJ8mXXPgQTW9P
	MOtRpge2DbX5n5zlPu2ZEbs57/g0V/ADlK9RaEAmuXrykYo9xi0hvo3HP3R67fEys2nPM7O+d9L
	dXb7tgVYg0dewNregUJotUr3J8vyg+BmoCAYNfJ+lnVkSdFUiaJOOYMm/OLbnZeRPX7P7IWCNUI
	7tOpkEw3RR3iep3LdtjdtHulNhGR5sJ+1qbJom2tDAdeKKHLEOHCdmLDdHsqAHPPoFIi+ZF21wu
	nIFZFZXSrfYrtPYvh3ZZM6VVVV+ZdNgVhObB9AdXpj7ZLfvJ0Q0rTZqBGv4jYB0wLxBieS27EMe
	KwcWNScQuA=
X-Received: by 2002:a17:90b:390d:b0:3a0:c717:2db with SMTP id 98e67ed59e1d1-3a0c7170934mr1394363a91.27.1790358250609;
        Fri, 25 Sep 2026 10:44:10 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972f111csm11862481a91.2.2026.09.25.10.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:44:10 -0700 (PDT)
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
Subject: [RFC net v4 0/4] bnxt_en: Make RING FREE more robust
Date: Fri, 25 Sep 2026 10:43:57 -0700
Message-ID: <20260925174404.2789072-1-joe@dama.to>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

This is a follow up to the previous RFC (linked below), updated based on
feedback from Michael.

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

This series tries to prevent this by:

 - Returning and checking ring free command return values
 - Examining the FW response if the ring free command times out. It is
   possible that, for some reason, the FW did complete the ring free but was
   unable to respond with an IRQ. This seems unlikely given what appears to be
   a use after free in dmesg, but worth logging just in case.
 - Stop DMA before the driver frees ring memory, which should prevent
   any possible use after free.
 - Set a bit in the state flags to signal that DMA was stopped. This prevents
   the device from being reopened without user intervention.

In the future, this could possibly be extended to make recovery automatic.

Sending this as an RFC so that the Broadcom folks have some time to take a
look and test as needed.

Thanks,
Joe

v4:
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


base-commit: 11536ee3d3e0b1bd35b6f3f8df55a6053eb0c71d
-- 
2.53.0-Meta

