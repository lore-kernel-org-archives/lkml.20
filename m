Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506204;
	b=XjVle4FRxIRga9qY4R6iuCXdcbsM2DWN6D9VUNiXP9p12ppIwMrHrKLLMMtq0BqMX9Zb
	 Kbr8zEb5u+VPvyGPBC9P2h9DT80KMz/nBvfS6RSYhM2C1XTvWIcAeHv19JXkFlAzZusGd
	 aPWSFa0FNJbUZVzrr518LlIc1YC4/J7GwbbKfyeUrCq4eaICQaq4lUuNuE5mU+XD4XAOC
	 0Htw2RaTJcHTUM79lQRs7Cosoxk39Om3wFzLL/HXUMCyCH2NH4wKS32L5pNnRVdvyGBol
	 IfnBRBCCgdaeDHHgjFyAZtGqFz0XpqHVRmk4i2DI7H7LdEiw7hlN5nO4GnHo6GbEeTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UodyIOSej7Q9D1lUergWPqI8N9mlc/GZezBApzHmwIc=;
	b=PJzoxKsZtCFFErQLbbqMZCE7BdCWGp1UwHbE6SNnEZ9j07v3IRWJuBdXn/K2aniZslXa
	 v+mGfM2XZwg/qZXlW3S2ERJFcPe8pbYKjOLlMP0OuDKCxbkA36XYjDBL887E0GFB5MUsP
	 mQ/vTJABh6mmUtMUFPF6l9u5BtfQ40gxcAACO1UA2vTMh0Omba6DZ9NH3MYQsCJzWjxuv
	 vOmeY3U3GO8Qco026xUYCh/rNrQsqBSyNLLUPuIHtB1SqTWf27LUlKM31y80NZNdtTgoV
	 MWYBBc/iV2fDb/QRDxT3i235VnTBbJuBFH2+vva96IDGPvBJgg8eqZpT95PicU3EQkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="a14/Dc2h";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04713606A334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04713606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a14/Dc2h
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so832855e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506202; x=1795111002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UodyIOSej7Q9D1lUergWPqI8N9mlc/GZezBApzHmwIc=;
        b=a14/Dc2hfC1bApYStSPz5W5SUWFLM3BnRqcON57tdgIVbFXNV8Egppq9Z/WN1xl6JG
         JoSoDm6Op1j4WqqoVOM4z1L5BpwqGB+hBz5nibr99WJZhk2v0jJ2QwAi7KSmvw8vVT6R
         M5K8uYvyefXk7EqSHMuiEIAa/e+HOZOp1xp+3De4XnnGStTTFFAXRjCY6sI7kK27LUJD
         IM8c6qNnMc4hyWG/3Oxxsgqb8A4D0PbXEkCm7o3nVvpbroh1f+WMQmc8Z8NEioBUUQgj
         DC8vGPn3BHwdG9TfQzsWg7M6M0GC+yWZ+HWOsZWaWTA052N7VRvqNiPhlAtYH66Xrt4K
         c9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506202; x=1795111002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UodyIOSej7Q9D1lUergWPqI8N9mlc/GZezBApzHmwIc=;
        b=n66oNO9MbNwxXGuw1Bs3hrGUimH3+DUSgl3tcke1ci88gF8h9oUhHMINXgEXZdFd+m
         hgTa3q7DtlwsEYSXDv6DbZV9aowbKwGbw4Q2EcsweUEwLc2Uw988f0aUNstOFnshGAim
         j/Ntgw2xKlXIYd5z9YU82RpkwvImkOEGb3so9kC0z1s1HuEfBmSI6v5dyguH13NU0j8n
         dCGg9ZiII9YofZFxPDHajb6YdtWAJxhtWbqC3t55jJ+OkeaMppeXDAclkWxEhDhE+kDL
         e+5r4FgXRFCvIkxO45HIJbdAliCtcUudOz+AQcODnHU9Pnj0vzBqGqDmzWX/dTkGEOKk
         tQUQ==
X-Forwarded-Encrypted: i=1; AL+hErFTD64eEhCTP+fCt6zgIOTpYTw7y/7jQ7+KNCrLDok8frIRsW6J0I+gLx9au8tjsSJpjKF2wXQO34eXdQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ueY+vmQWV/HmPfoiKNAqy/jeVVrZgLThr1r111pkpdMoGtozJ
	OktK0U9Q/aduSYs2NALOyzrMwpadZGcUvZMDNAoiSiOnYPrJIrRj3USn
X-Gm-Gg: AYBFou1IHjfjWRYFgYRlgDnOocMYHZxYL/60ZNBOymG6aK1r6nFTLefFkIf23JhoYej
	c4iPyg6UuXkbcQCdhnCNMgvVW5VOTcLimR74UdHNzuKlovCfRwy3c0w/oiTefRJVqv/wYVrG6MM
	AjvwDaarffvKlZu3KCaWTdoj0ZUBsGCXdG1PYhrpz05Fb+zl3INl8M8PVplzSV7CEwRqWtrWu6Z
	olYDjhhDKD31fcKgr3i3y30GQxcdIGoSOeanccv0GVIw4pIQfKsfNP5j7WRv5+obKAVT9EDZcgX
	O+QJe6GaNNTpIg8Bki/IW+7/9Ix3g1fUEXFEnGJZJ8W7Q5mqISpCztlMpbZICCaq2bOT0ju1+SY
	2oqglz3+toG+A+KrWHU3IdFAc/EB1MGz/EvECaIX9p17ExuFSWKYgS9CtCTKJTEuQ5DQy6gIHWD
	hSKB7E2h2Mc2KgDxpf1uApPnvaiOtSWOMy4TijfKpAMbXq4iQm7HY5J2Q29WZtFGhdRKxJkHPu5
	cSyNvJQ2cW7t6nBgir9zMsBM8PxCIzLJt78ochKPd9pzXGl4n2puOeCho92W5gwj+ureZiBBh3R
	NFLUXmuOdU0+uHo7oRFPpGSKaQBOArC4WV0Ec5ChijrelvEwi5FEFW5fXzvdL1eBrA29++5mIwC
	Zk7DcF79WH+951zZnj4hPM2BCpk7lRip4Z+zj4HJJuby0mMRH+4rEyNt170NzBN/Jk3jHJlHRnn
	gOdkJqAYcgEGaYgpEv88yZmQQjFttF178U+W6wC3gDAA==
X-Received: by 2002:a05:600c:6dca:b0:4ba:7a0:7b67 with SMTP id 5b1f17b1804b1-4bb4e2d5f20mr58501255e9.3.1794506202346;
        Thu, 12 Nov 2026 09:56:42 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c193fsm547430f8f.13.2026.11.12.09.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:41 -0800 (PST)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	rosenp@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC wireless-next 0/4] wifi: b43: AC microcode TX and RX formats (series 3/4)
Date: Thu, 12 Nov 2026 18:56:36 +0100
Message-ID: <20261112175640.40603-1-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The TX descriptor, TX status, RX header and A-MPDU handling of the AC
microcode, gated on the microcode revision. Only revision 832 has been
tested; the layouts of 784 and 928 are expected to match but are not
verified. Based on series 2/4.

Where the values come from: the register sequences and table contents were
taken from Broadcom's wl driver running on this MacBook, by tracing its
register accesses (bpftrace on wl's MMIO accessors), and reduced to what
the hardware needs. Parts come from Alessio Ferri's AC-PHY work (the PHY
init sequence, the 40 and 80 MHz coefficient tables, a TX gain table, the
Farrow resampler formula, the VHT fields of the TX descriptor, register
and table names), and some formats follow brcmsmac.
The result was tested on the hardware as described below.

Each patch compiles on its own (kernel 7.2.10 headers). The four series
together were run on a MacBookAir6,1 (14e4:43a0, BCM4360, core revision 42,
microcode 832.127, 2 of 3 chains wired) on top of v7.3-rc5's b43. The AC PHY
only comes with series 4, so the earlier series cannot be exercised on this
hardware alone.

Andreas Wendleder (4):
  wifi: b43: 11ac chanspec for the AC microcode
  wifi: b43: TX descriptor and TX status for the AC microcode
  wifi: b43: RX header handling for the AC microcode
  wifi: b43: A-MPDU for the AC microcode

 drivers/net/wireless/broadcom/b43/dma.c       |  61 ++++
 drivers/net/wireless/broadcom/b43/dma.h       |   1 +
 drivers/net/wireless/broadcom/b43/main.c      | 113 ++++++
 .../net/wireless/broadcom/b43/phy_common.c    |  13 +
 .../net/wireless/broadcom/b43/phy_common.h    |   7 +
 drivers/net/wireless/broadcom/b43/xmit.c      | 327 +++++++++++++++++-
 drivers/net/wireless/broadcom/b43/xmit.h      |  13 +
 7 files changed, 528 insertions(+), 7 deletions(-)

