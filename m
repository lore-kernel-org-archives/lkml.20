Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1663AFD08
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197682; cv=none; b=GmsdmFBLwBt/hTEVPHtwel0eqLo71mzd+gaXF19VWxklQgAuAKOeluVQ5hDW/pRYzYJn2hvXuRpmAauSf4SWbgY+1HwfR9dTVInPcqjdGRzuG0zXcQS7NgmFwxs1bTTKWIJhkRNouPM02UqjI/VQwfghmKvIh4veOzChcBx4bvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197682; c=relaxed/simple;
	bh=mRyxy9kulrKLCctPR5R5jqjv4937c3fvzBlt5PNvMX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D9vxd6/ebdfJrXa97SgW5HAtqq+cWg22RXOz6uNoUeaxJHuLN3QYV1zrMb7K0vbuR0F52LLplGwBoZ4ZhAOdXM4vr6jK78QRiT/5kigKKEykyC0AtA9yA/AfrPdnIVZCbXrnoMi6Vj+oidudLADMoxMVJqaZR3tciPAp/jjflRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=GF551xw1; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="GF551xw1"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25187so607814b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790197672; x=1790802472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2njhcgWsNI00xUbpMQlMbxUVBLgveQaLtiK1YPtxLMM=;
        b=GF551xw1Dr/rtgUJXu3UinEZYF4GzyVB7Cxg706GL75LEpXkuBFs1IUaslkT3RfqLV
         6mA3I+6vlCvNqMYvSv9xrmPhBr+EwwziFwz11bg0QOHhgzUiX5O2H41XVQCRfPfmgbFy
         KojIfPMLRFyvq99vhNMikysb2/41hP9KDNOwl3LmzsoI4uXw47bkMFB2o5CU63FJAQHV
         J+19dlOYWMG0tlLxMN2fy/nmeSNk/ZmZEL8OMclnu9HyWtzpk3xsrD2n47D57n0miSqb
         F1EIqt8pzVMFQe4btXnC2AcWb+RlEORzl7pwnjEd1jm6NF8JUoR3MIOWLV9ADZs2LmR9
         pGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197672; x=1790802472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2njhcgWsNI00xUbpMQlMbxUVBLgveQaLtiK1YPtxLMM=;
        b=cOgIbAQ+8Um86mgLwdrkCq2oW11w1/P3qSTX0va1wismH+tlj7yxYTQX9R36wCuGnH
         LVTKBiEemNIH7Ozzc8feoU5Q92qvTLr1WG6MIoTLLw98rmai+bkHqY+bABHipzQbpTFX
         yX1FhPlpDQQR0rWq0vasp+FV9ava2fBWPGcA80uPsa+aQnHvEfwN/3s+bgdc9VGMq4GL
         8sdVdfHhbCLv589DNmqxFWNrWaBgzyb805Hjh7UqtGHKKeECQDtazXkQD7Ge1M54BoHx
         Ys0XBenXAEHanFjqpET5rqIAzy3xKOC+bzC9dDB9O49WMRQzNmU7lEQL8nXe9Zfytyof
         YOsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzA9821P+kVr8Wbs82nwQfhPRk8Rsc6Kk4cGmf14Z7J6jcEZauEFeHn/zLJAy4bmi+ooby16P/hoEDd0wY=@vger.kernel.org
X-Gm-Message-State: AFuF++nmUca5cETYm2wkqUMAexDaV+5SKWqE7ckaRCinaLxhdnqnt3GP
	NBp7+HlzlOna4kkdnmPyUN8d8i00+NKT5PdieoXDuK+pYY2hTLaSkCv0pQVldfOs6+c=
X-Gm-Gg: AYBFou3Xt1VYWAaQI6t9J8ObI+8dU3CqSTYx195v2Wj/3AyU9Hlar0EELP1qlcstgc/
	q3STL+fWjno4kUqUoyz7ovatcFyl9439+XfyD/FzuNL+AnKv6IQ4x+CFGCudx65DkWAlEwLUj2L
	bXGeDaG6xY/mLJGmJv77dkc1J/DlJ51zNL17Ijr1+5oQrLPuBkIS3GCztpdi2JyFjIkOfodLSPm
	JtAhRcJxPnqgKhJhAplRXonKO5EoaWr+OqJFJJsw3yDoYRaQw9qr0Oicrz2EKO4SbqQU31ywKRh
	akX6wPgwDfp0fy9sKazNDAuIgo0h/c5FTSBMv9b+e5a8Ai7/72wmrbAWlZRvyPlDKcYOGtSMrSy
	e/eNQRqhGNqMDrc7V4d5GM8fdIIE3JdwGimsH1HHxqAvDoU0fBEeJRkkGsJEIU2s1InOqPHFWB8
	17kI9b6AB2iL0rR5PAo6rKvkFFD+UCXzsdYNNCwzrTILSZPi+zEtg8bWJy6lXBWjyj
X-Received: by 2002:a05:6a00:114c:b0:87a:346f:d060 with SMTP id d2e1a72fcca58-87e9ca1c0a8mr291890b3a.55.1790197672313;
        Wed, 23 Sep 2026 14:07:52 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4b::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1b0b55a3sm1867668b3a.3.2026.09.23.14.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:07:51 -0700 (PDT)
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
Subject: [RFC net v3 0/3] bnxt_en: Make RING FREE more robust
Date: Wed, 23 Sep 2026 14:07:39 -0700
Message-ID: <20260923210744.3406861-1-joe@dama.to>
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
 - Lastly, stop DMA before the driver frees ring memory, which should prevent
   any possible use after free.

Sending this as an RFC so that the Broadcom folks have some time to take a
look and test as needed.

Thanks,
Joe

v3:
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

Joe Damato (3):
  bnxt_en: return the RING_FREE status to callers
  bnxt_en: check HWRM response if completion never arrives
  bnxt_en: stop DMA before releasing rings the firmware did not free

 drivers/net/ethernet/broadcom/bnxt/bnxt.c     | 96 ++++++++++++-------
 .../net/ethernet/broadcom/bnxt/bnxt_hwrm.c    | 33 ++++++-
 2 files changed, 91 insertions(+), 38 deletions(-)


base-commit: 17741334d00bf5ebd37f8c1c36bc9c146a351deb
-- 
2.53.0-Meta

