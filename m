Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCC648B398
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101461; cv=none; b=WpMIWOLwAuirSA77h1wHx6aEdJELwj/76QE+rOYOCPLZ4qgd9EGv6oKHf/0RBCfJvciRx/1oQg+Ph3JVCDgWGrihAU++osyXEyHvEkcdV8ResjbUHbywtofvzbRTLo4TudvVD2EF8EvZRjOzAGz6MiH5+HwOWMBxFyHl7HcsXeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101461; c=relaxed/simple;
	bh=JxjffhNsexrmC8+bVvEf/LuSzi1MYoSUYWH6uds8NiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m2VfshXLZNwEgqZeDCPbPKP12qOy5oJoZTHBlQeUsAiVRAUnyeFyvSPhTd/XHPqBYpQliwKYQi9FamPHGCSoQBqPzkZ6e0Ke1L3H3zIsjIwO5mw22XkeSoSeBbEpnrGy29vZ/NxgcbCsgWmjmr6umxDJe+6j0aJj2Yn/348uPqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=ykqx23B/; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="ykqx23B/"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so299646a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790101458; x=1790706258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3bol2sXwPiGUerQXDqRvJQ0NGyxQSLBBHVEfWPm2X2E=;
        b=ykqx23B/3L+Q90KZkcuHWNBQYKqERaqeprwTKtHOMXzaWI+A44DXJm7BhD3knKxaXl
         JwFNe9bqWc4Re7TAEx1Qlmra3qjbBwPpbxetoleNxGHrzMJg6rDFkgC0UqrHC+fxMdQg
         f6TyAnYe+JOokD7rxfMlJOiwl0HjeMttNrz6NcY9yzP1cELf0yINOoYKiE2pbOyLIb9M
         VCarkAH0BmkBGfR9sO6WfPbHCcObhS/teJIsHmVvqDn5RxmSLPAVHsSXvO0m6tvqxDky
         KZ8pkYyt3vwOV19h52QWxyzr2kfL/hiXdERRkbmvRvHeK4vvX88Yq2+wSLgX1McF+fLu
         J6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101458; x=1790706258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bol2sXwPiGUerQXDqRvJQ0NGyxQSLBBHVEfWPm2X2E=;
        b=kqpInPbRIHfbxusSfcH+ghp/9fpVBCO85uSuLcqJgs8iHLaqnzLsZp3SlB380D+MSr
         bkrai51Cei2jGJio0j1avfHGOlkSczlxsXfjMEQJ7QkrhZBQRxG85X8K9stCybLvV+RU
         azb+SBCB2oo+wiEGtWhOnlAC7encpqk0NYV/DKF2x6DrLNJKI8ESbNewlv7RPTrwjHfF
         0nDoot2PYeXI7lq068ctxJO8IoS3iiCDcW1hWos3iwDH6nycJ6AsirLmltU3nfZv/JTE
         3oe00ZIa72yNUufyBOkA9AHdZTgdyG+alSJnyPSkDkYIWsnvbGnhF8XLUvZQ697P/wyo
         E6/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzb7R1yML/z3eayEyTwIF2zrjXOzUGkl60CzknXOFuDvxQIvkZvj9iKwTOGZYkNGjHm2Trdcb+xS0JPmdc=@vger.kernel.org
X-Gm-Message-State: AFuF++knIFuRQUGHb3ngBVC7IySdjZ0zTUu9OPEybAlj58dv5xuF7OAa
	ce2Oj5kugUcyuOKIHwjlPSASE2zZaX2ETJC/WNACaadskVsss/m3ieAwz4hT5wW9iTQ=
X-Gm-Gg: AYBFou1jj0eSfvnlKs2zigwtL/3xtma8UVlFJJCyUz3GvzbYaoVx1BImOe6XCeTh8ry
	+qK/bWJb1pBLcXedJ/xlOJoStCgMG4dsCMB8tmuA6s4VLZgPNmJTInseJDFaDxWWTQJP+V/eGHZ
	6PL+Bg6Qg2ZoJjMZGGLOzMiYMvclASS8czzpXGo/U2r6UjuTvuvy0W9Ghn65X0a4+hOIcjbMlZN
	M4rUNyl7bpvz2zQz3zRtYbeOqsERX51ph4Ga0jq5haKKdtTofHhy9JAkYtBmOnIw4pCYUkTLfSj
	9/kSL0YeDEpo4WKSusfOAEjSWCmR6UMdO3evuOqu5JYUBIfMAAQzkt91eHCeJssxvP8ap1q2cxY
	yWZuf3OM0+nxgYEPIlnCS2+/SIbS1BRxIqd3Pguf4RCmL76tnWtOvkS72QLvZE9zY2rSNPRcr6o
	PSZOwgUWtQD0U1aJFX/H3+pxgDDuFqZLH01g5LQ1SB3og/fassB6U6
X-Received: by 2002:a05:6a20:cc0e:b0:3dd:a197:edea with SMTP id adf61e73a8af0-3ddf83053dbmr281533637.57.1790101457665;
        Tue, 22 Sep 2026 11:24:17 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4a::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3f4173sm8509a12.20.2026.09.22.11.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:24:17 -0700 (PDT)
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
Subject: [RFC net v2 0/3] bnxt_en: Make RING FREE more robust
Date: Tue, 22 Sep 2026 11:24:00 -0700
Message-ID: <20260922182405.1290749-1-joe@dama.to>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

This is a follow up to the previous RFC (linked below), which takes a slightly
different approach, is now targeted at net instead of net-next, and has a new
subject line :)

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
 - Lastly, disable the device to stop DMA before the driver frees ring memory,
   which should prevent any possible use after free.

Sending this as an RFC so that the Broadcom folks have some time to take a
look and test as needed.

Thanks,
Joe

v2:
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

 drivers/net/ethernet/broadcom/bnxt/bnxt.c     | 69 +++++++++++------
 .../net/ethernet/broadcom/bnxt/bnxt_hwrm.c    | 75 ++++++++++++++-----
 2 files changed, 102 insertions(+), 42 deletions(-)


base-commit: 17741334d00bf5ebd37f8c1c36bc9c146a351deb
-- 
2.53.0-Meta

