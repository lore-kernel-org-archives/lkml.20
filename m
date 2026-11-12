Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506189;
	b=qkRCJSjwAcoeTjlzv23gXNaLLHBEU+s5YwrAUbHDEEI/0+BtxiQP63l0uRLyutBwAytM
	 otRcG+uw7QDCx7sUqYZcpuCBFbSvYkSNaq7Hv7R/NmuJ8zq7Dw73ILcM1Zcj/x81aV05/
	 BHH+JTScU8KGBxWUHAF5oxxrTePyx6/tStEi7rlQqbpoMS+5YYCA8Hzq4cPZs15RLyJx5
	 FBoHBhaG2z1hmtb3a9iOXG886ZEo5ziJFp+OuMKNyI+yBq2P9gpRdGNF6FHHlWbuTxi0y
	 XwsvSBnB1/hUZYaBYYgPDjFAV2QHy9yy/nNniTGHsZ4Dez9CKm9241okbRbOFUto4RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kmnLdMmjUsJ8mDUaHUl0eMypkCr4ZnV84joT0wzngzk=;
	b=Noy6hG9uqcbudguJ8TrSmCCVeG4k6BB/35tmU125nSw3NEi246DIY798mlEiC08yK3WB
	 Oo6jXw09R7m2yVPC/ySu3wDVoqWNcyTOUmTXkoqHtNap30rUEod1AoOShZAOzrCTGrB48
	 mzjfEf3uYB4NQcaEPf8Ir3479tmTMb0Qr5+hISSf5WtpApB+m+VJIfB/7ix+ogtXwdvnq
	 zLst9ubC8P+24+soUTQC7vZt0RUskr2dNDdgUZkaaTy4e+63lWHqxinD3lP9ZcTQrCnrW
	 CC2gImBfNxZvmNgyKfx6VCytiode6o61wt/S++2sjHbHguwq89DJCAfYgHzgKOPFiPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HC/WBXuF";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5787606A336
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5787606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HC/WBXuF
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492690dd5daso34340f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506187; x=1795110987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kmnLdMmjUsJ8mDUaHUl0eMypkCr4ZnV84joT0wzngzk=;
        b=HC/WBXuFGpWtE6AfYCAizOd65Jyt52yYL0N36JVe4HG+aAMg5yOybFVJncravhLoqf
         bl1yylnzEasU2K+Lsq6Xun1KawWylds8oqcPJ+YszYnsCvKdy+R/nVuyk3moPqpzJbjD
         OK+4A8cTDDHdKSeVzmvM3yuRGxFo3nY55tTV8/duFYzHXs5NvXIIqRU3yxOH1kPbdLsT
         LWfRbMyc+214jCRR+4b24WKUMRVpOCndpBd8QVLEKUgMwZaarXg1eBnRRpwqlU89Kdnq
         y+B9BGy9FAoFkLCc306emUzz0I+6OSWun15+FFiRLYQ/W6o+UnjhV5BF9wGHZ9/OSDo8
         Jixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506187; x=1795110987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmnLdMmjUsJ8mDUaHUl0eMypkCr4ZnV84joT0wzngzk=;
        b=JwFBAQllI73QAkSc9HgKGYFiC6VQ9nJwt/TrAWsSJDDL1lCy2qELCJicd87Rlz0pU6
         gDfbLKR3TZQaVLCwv+KAbH4PLKZfBfvDRbPRL58B/OOc69hnxj3S/2B+zv3UuGnanogz
         ZOLlDFdyNodGHa0r/sfZseQSFwhRy0Ax2oDkl/+UJ7AFqBxbXQDQnCSIlJ4viMOr+vX0
         lMLuOgPqdyponX/lSc5FOBIxAlWqbBijSTA4RTP6mk6zTiHgHSD6BDhrEA5eaUDal+6t
         SR8Vui9v8aCbMOH2aJHzfNeeC6QMz9ARxHhIXR5VYYBN3Ly/Lq9oCBMnH5lY4XV+MZtr
         R9+w==
X-Forwarded-Encrypted: i=1; AL+hErFsfDOI+de5ZsyOej/ZF3bFHUd3Ig6bD7aKSE3MDd/oNd8v7rWZKKSX6QUBMu4cTpDAJTLakiv7R3p3a9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i2m0E/hV/QnsAKojS0CzmvL4xjjPdiy0KQJb+zmwCUCk2yQdd
	MdoXrj8g12WREy7UwU/V3c0NjxYqx/UrN417+VhTeb+wNLVyUi9cEHpGuZ7ZvZjOk9c=
X-Gm-Gg: AYBFou3QTa2i/LRvJHtkxiUdS7yLA4Qdx67Hn7D85VsxM6C1U6D+lv3C/TS9to2ebPf
	X604G/3vIUOex6g5xDp2fRIiRchRg+yA2E5CCNG6oh46amzHOxCdXXWIQDJskZc67UlayoQzp9V
	CsMQioKfaYj0EDgZeaK0yDjAOKCJ94x2VdQduY/dABpwexp4+1BpirnXi1t2msauufbgWfhu1RT
	iUMSoSstkrAwbTo9jBVCe4u9AtognzwCKlrCVePni6bMk1eK/Ob/5+26UK1jOXNIeVbuXDHdXyv
	3ghiF0j/g3ULQ/3F5tVKlwVoPE0JVSIB6dhbMoph3qF60Oy0o2iGqDlft/o8lib6/aH79QagOyA
	3eh4oJBITuLT7csKgMv5ekreYrQRn9iiVQGhWgN80Pv/o0BD0bc9mbPWyAGVCo4mhD/RB90tiK9
	Hhu+3Gi7g5LlTCUly2NPpsrTr3NbZl8KFbh4jv1mXNljGvjk170QrABMcDhcNMTolf8/Ibv9hBh
	BBRzvtpC69UDAXpz/+z8pTULHU/UZuWnKxEAld+q9Vf4yBT7hMzIJwFF4tTKa17WsitQ6h9D34H
	tY/KTDDKOJK8oF+EP5wKXTQ1xN5hsMzrflNTJPEO9zq6p0ost1a4wmy04y2QPyubGMyfoaPtmx2
	KHpM9g0hWuku64ak/OmqcV6dvAcu6b7Yd0uiH2T3TX6LkFO6vDizWQC610yY6x4PQNIR0T7QfGN
	xDvbrATL9DEAroLqr5ocZwHYPq65jDYi87KqQpcnzQQQ==
X-Received: by 2002:adf:e00e:0:20b0:490:1881:80ec with SMTP id ffacd0b85a97d-49c710c24f8mr229471f8f.36.1794506186972;
        Thu, 12 Nov 2026 09:56:26 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm438408f8f.57.2026.11.12.09.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:26 -0800 (PST)
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
Subject: [PATCH RFC wireless-next 0/3] wifi: b43: core revision 40 and 42 MAC setup (series 2/4)
Date: Thu, 12 Nov 2026 18:56:21 +0100
Message-ID: <20261112175624.40547-1-gonsolo@gmail.com>
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

MAC core support for the BCM4352/BCM4360 core revisions 40 and 42. Things
that depend on the core revision are gated on it (b43_is_ac_core()),
things that depend on the microcode layout are gated on the microcode
revision (b43_ucode_is_ac(), revision 784 and above, set once the
microcode is loaded). The TX and RX formats and the PHY are not in this
series. Based on series 1/4.

This is posted as RFC so that people with these chips can use and test
it now; b43 is orphaned and nobody is set to take these patches at the
moment. Series 1/4 is on the list:
https://lore.kernel.org/linux-wireless/20261014143225.82149-1-gonsolo@gmail.com/

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

Andreas Wendleder (3):
  wifi: b43: set the DMA burst and prefetch bits of core revisions 40
    and 42
  wifi: b43: MAC core setup for core revisions 40 and 42
  wifi: b43: address match table, templates and beacons for the AC
    microcode

 drivers/net/wireless/broadcom/b43/b43.h  |  14 ++
 drivers/net/wireless/broadcom/b43/dma.c  |   4 +
 drivers/net/wireless/broadcom/b43/dma.h  |   2 +
 drivers/net/wireless/broadcom/b43/main.c | 242 +++++++++++++++++++++--
 4 files changed, 246 insertions(+), 16 deletions(-)

