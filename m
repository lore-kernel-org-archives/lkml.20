Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FCB3191D6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119785; cv=none; b=jgz9vkbWycdGl0brc2wGVxATbz+MmLMrUi5YkA22EFmUXdkf/8Nev/WUS90l1E+QFvOikjoyJ8qYmQuW+O1zeagjeykwuI7C1Sv77x690as4A4+pwsnX2aE7t851Ju1lgMq02LqhHTrwrnFeafv3rwhS1WO9fOc6u3OE6rVVQ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119785; c=relaxed/simple;
	bh=W/RnQwvCdJ0Ti8zFdI96RAOugrp6e59Hi8hIUNrvbcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YNFUxWPRJmQj0iU1juT2hqyvuib+tO74V8zgL9+Lq1fXMsEqvkUHhjB1KsMMGYHthjUajuMBBAyI4xxOtOg7ah/bqXNwnXIbR7JIRzlnjArtGpNbkHrXyGfwEdQN1qF7wioBXRfJL5AQrQURVvdeZQmOb/BvwkryzAwKbAkvP5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=WM8jmAER; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="WM8jmAER"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-88c72646f03so1266100b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792119780; x=1792724580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SphrYcHvxe/mXZHDKOmLcceivgr1r5c7dA7xi5/TFCY=;
        b=WM8jmAERD4REVm/RvcS/5DX8QJh0V2G+H/62z23i1R0+Szu0aa9wbFigK7OVNm4Nbl
         QDv3vSWtwMUkSIBUXvzgv4dvmqDLhlTTQ7bFyKUewY5AdQeUwWKqY5/1qoJZQv0jGuEH
         9SA9dg9/eiUyuhNA4N2P7XnTVytcz+QeC6eMwksLszBnUOsZlxCMW/rMdeQksJgJnI8S
         R72kL5eDNp7wb2EHXbv+enffTZP4uIZ+J6mJyWrpSNTHeqMIJ8CBlSO3d9EsqFjtRxes
         FySLFYaAKaNO1h3dWNpE0DpOL3Yz/VJabN7HvPBmPXfpkmHpr92ZtbCMlCuBGitjYYg1
         o5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792119780; x=1792724580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SphrYcHvxe/mXZHDKOmLcceivgr1r5c7dA7xi5/TFCY=;
        b=Evly0d/v5t3M5O0WsLa6ytPSWoSHVfdm5zoerI6ca62XYtYsoxqhvJT1fznbA+fxLH
         Zfvbl20CaRQa9GdVs+Na46QRB4tw3xMCik4xmYynEPqQK0MD+2AiYj+qI/yp88LwxFau
         GNLwC9KD79R2pROOqATsusezEXGwo/xHJwewlN4NWJ2URi8yhqx2IF89Ui+8lFRAAlDM
         +lF9gpnOvpngnVsu4YGedxW0W1KYDAcA5yV4FnRlO0o56v1CREjIie9KYIk+1JkO3X9A
         qh7WRNonrgdn796Zmxhh0a4RL3rCsHY2VGFd+KCFySWGvqVIE45hRAEwXR3lytbZ4ig8
         uoGg==
X-Forwarded-Encrypted: i=1; AKwUvBzlFaGxUslTBr95VUdbtmmJWgVtnXJU5tY/aiORBjAW33V2vjviWyX8wxXsS6zGN0Y6e/sdw2F5F47Zg54=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9l3455PmeKehxrF5wD+ikG5KqmE1qcZMIbYOhyqZbGPk6PCXd
	YpJxVz1ahXeZPcOiqJM1Hs67ebGdQiWaIkhRoVBaIb5nV2ztXulYhigT5Go6T+PMq7Bb8tzKYOP
	B1DHq
X-Gm-Gg: AYBFou3hbd4qmrmzuul9mHGbs4SROgdOpJiEwbFBkCw9q+tvjfEKdCCSVMj1WbvnQkF
	XrZRguBIgUbH1JZO/aNFSGdFbV4iCd26UdyYAcGSz5mrQaLdy49abYuIUSW4jZPCJiJGUiZBcVM
	nJ1eWVUlkT/faOlhb+gy9F0uCvkgimsKWbugMZnJm9kjO2A3nUsGhKVqVM+J1cE9QoN2diqhgvC
	p2kMEbaFNO/fTIfXZfrqOiURz+vlI6noEdVsfVlr5GVS1Sikt4uhtTqReiy5Z9sgLts9KXjp5PV
	lfCFV+6bgTBZfg9He3zgaRHW52pZ7ST4Ey5DgFq5Hnz8NAtYd6eNawXYeFELTLlzGf21pfkSUd3
	G0Fd1uVF4rUzXQ+S1eL2/95O1fSc9ygzp75Q6GGHcoF5uW5X6sdr2ray4Xp0QOnGi+z/BOWEO8r
	Pfum84kePSUKXK1thp6Y4TzGAHjTHCHdDR6Z1O7DtxJFeZB+L/kzhtYczE0cU8cE3/I5tMzOXe3
	s6bJ8syu7lCTuF7
X-Received: by 2002:a05:6a00:8019:b0:886:84c7:72b3 with SMTP id d2e1a72fcca58-897c78d79d0mr17473704b3a.26.1792119780244;
        Thu, 15 Oct 2026 20:03:00 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c8c490sm422493b3a.10.2026.10.15.20.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:02:59 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 0/2] wifi: nxpwifi: bound the 11AX_CFG response handler
Date: Fri, 16 Oct 2026 12:02:48 +0900
Message-ID: <20261016030251.690780-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This supersedes

  [PATCH] wifi: nxpwifi: bound the TLV lengths in the 11AX_CFG response
  <20261016014927.434473-1-yhlee@isslab.korea.ac.kr>

which should be dropped.  That patch is patch 2 here, unchanged.

Review of it pointed out that the handler also dereferences the command
buffer without checking it, which is a separate problem in the same
function, so v2 is two patches.

 1  nxpwifi_wait_queue_complete() detaches data_buf when a synchronous
    command is interrupted, because the caller may be about to release a
    stack-allocated buffer.  nxpwifi_process_cmdresp() hands the field to
    the response handler as it finds it, and this handler stores through
    it without looking, so a late response oopses.  Check it, the way the
    other response handlers here already do.
 2  the TLV walk takes its length from the response and bounds neither
    the walk nor the two copies, so a short response wraps the u16 length
    and an oversized header->len runs past both destinations.

The driver has not appeared in a released kernel, so neither patch has a
stable tag.

I have no IW61x hardware.  Patch 2 was exercised by injecting the lengths
through a KUnit harness on a KASAN kernel, which reaches past both
destinations without the patch and nothing with it, and still accepts a
TLV that fills them exactly.  Patch 1 is from the code: the detach, the
pass-through and the store are all in the tree, and the KUnit case for it
only confirms that the guard returns -EINVAL, since the unguarded store
takes the test kernel down.  Neither patch claims a reachable
out-of-bounds; the firmware's behaviour is not something the tree
answers.

v1 -> v2:
- new patch 1: reject a NULL command buffer before using it.
- patch 2 is v1 with no change, rebased onto patch 1.

Yehyeong Lee (2):
  wifi: nxpwifi: reject a NULL command buffer in the 11AX_CFG response
    handler
  wifi: nxpwifi: bound the TLV lengths in the 11AX_CFG response

 drivers/net/wireless/nxp/nxpwifi/11ax.c | 26 ++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)


base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
-- 
2.43.0

