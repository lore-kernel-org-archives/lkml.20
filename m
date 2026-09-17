Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CEA4A64F6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789687956; cv=none; b=JqRaTDBWnB74Z+vhlR6BHxBNNKiItRUoTUjJfTAtW/BeyJ91017rwVa6JjIAx5Z9fd1fbBvD5vT26SNBn6ICmVA6Exb06RKlqENKiYPKOXLn3eXi90rtATFdNayh+P9igPdqFVl5vvFqN4he37rjMWrEW7JYerXuRXHjnKJ/Cnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789687956; c=relaxed/simple;
	bh=nGDdOwWMYJjfnr0JCWRYvyMk7PP3RND/O85c6KvmNJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W5W3RdMANvQxClg74t9Yfwbx+AA0RFSWoCJZ9Kda+kLgC45ooyWKHULNAw2mo4xP75+LKlyco46GtnxFk7F1ZHg38xb5nOoJi5ga74i5WSVIicU7hnGFMG3t0BAYFNLFAt6yiZdqFRrdR6zggqXPyNw8jV0KVErZNzV+m5ds87Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=XZc8tDSu; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="XZc8tDSu"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so35753a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1789687953; x=1790292753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6A5k5usHjrN+hp1LkAKDZkjDqSyyAO/UVA2C1Chkli8=;
        b=XZc8tDSutiRTjLxnrM6ZUGPQyb32A8Mdqgs593dCH1nAf37ypyEPE5iKrmtJyesDiO
         KMGCsuIlQyW5v0uBXlS/REhe7nCYmlBKwUCriRYRCZ+mrX6l/E7F9fVz65wjF2xUfsne
         zCDK2g7xaDY7G4CXIj8RBt68U3jCzx1ldShDuyibW1utKw0z0qi3CedVEaEphCeGIUAF
         ydMtttusVqebH9+6acE270qnDE1/lszJkCY1MllDhrVj/oBQrgazFmActDuf7Ks4VncR
         xIa+tfRf/zhwBW4JBPW5Qjf9DExtDC0Cuf59nTyzsTK/900B4am4w+8/FYH7zdngViuh
         m80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789687953; x=1790292753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6A5k5usHjrN+hp1LkAKDZkjDqSyyAO/UVA2C1Chkli8=;
        b=q7ouCyAZBrvImuh7aRsJ1kIf1VpsMvFd9kDSv/RW/FWHuXtE2r5il/h994FVesaR/7
         6BUw+Y8wEzEDRJryaqsP+LKqQ5TebLwvKY0p+Ta7/rYxpQvHop29gT8tV37jACgO1r6s
         LiyDd9sY3ocDHjAXRoOy6LYO4h0OuFhEkiwH+j0d3lfwUXh9Aa5V1Adib2xLMZW7uY2/
         l0uVbwrIfl0czu9URahraqB/r/v1cEfeAePr57WilKEQyfHo5YE6OAVPszHDzddvSPiT
         OFL/q4zpxiAGW725R9QysZJj/iAul3Ktwp12a+uEhdqcBfh0wueM11Q3F+TDvQ87aYk+
         Y2wQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqJSYeSmFsoEpB1MLFqt6nGftO7xXNsKSR22U8/8mG75zuk7Av6yMSeVz59xiya6fCaIEryvKgoXtz9MU=@vger.kernel.org
X-Gm-Message-State: AFuF++nir1tmnDzUYYtzTQjd4ptcUWx1UxC5KQ0PO48VX++cqxxs+a/H
	iOmSLovwFszg+TmglnPdyp2nGV/zS/zTNcAXhMEv6ESkF+1iRblv+uy4nn1gwp4tLqY=
X-Gm-Gg: AYBFou3c/zKLj1fhsfpuaRGge1EOiJUAb4I/9V/YtEy6/hQfQl5lzE8kHaLMEXwygt6
	hGU51nVmU/Ldm9z8pLwJw05qj9uHNsfP2cEFwIG0bGR0t0cSEQpHLdbO2dva4qQ2fEm3yS17wK8
	B56aF1vWvWUcIwfJVh7n1sU1GQu3rnXCIjdFwb6kyi+HsGsE7A5T+QEm+x7dpztLPoY7xNSc+T7
	Z9lHCsPKof3mQUXc3wBA51MVcDeiwOv3n67fj4Jvw1cLkj1b3s39rP2eYDBPTDv1zd4QRH2T4QF
	22sYRy3aQ8IXdqs/SJNjjUqdhT9SqXUp3l4zW6O7ELKGA8RqHuWcHsQXcfvZnf28frM/ptINtua
	9MJviNgtWLcBHwq1QFrTniy9YUrt997WxcJmjfUAn9+pWQIJyv9oxVBpZN+w9m92M2xxWZBNckC
	+71ncHjQJ19qKPHIDA04rCBQowYH/j0umWoW1mjySGGc+aPrta
X-Received: by 2002:a17:90b:1e0d:b0:39d:fcbe:fdcf with SMTP id 98e67ed59e1d1-39e54af3671mr1433773a91.1.1789687953140;
        Thu, 17 Sep 2026 16:32:33 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35e732d6sm7402936a91.11.2026.09.17.16.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:32:31 -0700 (PDT)
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
Subject: [RFC net-next 0/2] bnxt_en: Recover from failed TX RING_FREE
Date: Thu, 17 Sep 2026 16:32:13 -0700
Message-ID: <20260917233218.1160001-1-joe@dama.to>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

This series makes a failed TX HWRM_RING_FREE recoverable instead of silently
releasing ring memory the FW might still own to address a use after free I
noticed on a production system.

I'm posting this as an RFC because:
  - I am not sure if patch 2 is correct. Maybe Broadcom can let me know ?
  - I am not sure if this is a Fixes or not. I guess if it was always like
    this then this is net-next material?

The core issue is that bnxt_hwrm_tx_ring_free discards the return value of
hwrm_ring_free_send_msg and sets fw_ring_id = INVALID_HW_RING_ID
unconditionally. When a TX RING_FREE sent over a completion ring times out,
the driver logs:

  hwrm_ring_free type 1 failed. rc:fffffff0 err:0
  Resp cmpl intr err msg: 0x51

and then __bnxt_close_nic() calls bnxt_free_mem(), unmapping ring memory that
the FW was never told to release.

bnxt_queue_stop mentions something about this in a comment:

  "HWRM_RING_FREE completion is handled in NAPI to guarantee no more DMA
   on that ring after seeing the completion."

But... if the completion ring is dead, the completion never arrives.

This is reachable on production systems today:

  - TX completions stop
  - netdev watchdog fires
  - reset closes the device
  - every RING_FREE routed through that dead completion ring times out
  - ring memory freed by the driver but still in use by the FW

The result on an IOMMU host is IO_PAGE_FAULT or DMAR fault against freed
pages.

I tried to test the code in patch 2 on a BCM57504 with FW 235.1.208.0/pkg
235.1.208.0.

I hacked something together to inject a failure to test the reset paths on my
device. It seems like HWRM_RING_RESET ring_type=TX is accepted by thte FW and
the polled RING_FREE also succeeds, but in my testing the TX ring was idle. I
never tested a reset against a ring with descriptors in flight. Which leads me
to my questions.....

1. Does HWRM_RING_RESET with ring_type=TX cause the FW to abandon work already
outstanding on that ring and stop DMA ? If not .... then this code is wrong :(
and maybe see question (3) below.

2. Is a TX ring reset supposed to post a completion ring entry? In my testing
it seemed like the FW may have written success into the response DMA buffer
but never posted the entry, so the request times out with -EBUSY even though
it succeeded. Is that intentional? If so, maybe only polled transport mode
works on this FW?

3. Maybe the TX reset isn't necessary at all? Maybe instead the code should
retry the RING_FREE over polled transport and that's good enough? This depends
on the answer to question (1) above, but I guess it would simplify the code if
a polled RING_FREE is enough?

Thanks,
Joe

Joe Damato (2):
  bnxt_en: return status from bnxt_hwrm_tx_ring_free
  bnxt_en: recover a failed TX RING_FREE with a ring reset

 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 55 ++++++++++++++++++++---
 1 file changed, 49 insertions(+), 6 deletions(-)


base-commit: 5ccdfb2c3203207deb17e7c5b0db8c7f475639a7
-- 
2.53.0-Meta

