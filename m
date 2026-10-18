Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE23E367B96
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304265; cv=none; b=twnrFn02M/QfPluvBMOb258oZn5otq1Uk+iyBgiLl718qcxc7a6+ccKALwmwNN0qS9O4J7IkAw6er0SZ/yU2dBxJk8FcyEv8c415ZdnTa94T03g71l3InnWCUw9dc+lbLuguyvfwPVaJTcKXbqX1suvRv01KPE1jVj2CqeJ+Hmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304265; c=relaxed/simple;
	bh=gq6gPWjlXWTpgggTh6qVeJbK3k0jEZ8oMXcfLm9kaw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eXbW0GkoUqChcq2hgdp8N5CTpTrKJyIIGvyn8pOOYAR5fP6PkoR1dpIzt27yeCEBosuFJM1BfGM3oEH9LnO+b18CKOM2OrFMhNifCGw/amM/mUX5eXop7oZH4+bBQfRqZLQxRiUWMPkSmRExYdTfWB0Ws+IKdNtXnW8I79vk3Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=cKKRTsEq; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="cKKRTsEq"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so985893a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792304263; x=1792909063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+EaD3mjRasIGte4hZqwmjWl11AAvJaiM9yV5LHuDVgM=;
        b=cKKRTsEquZfffDlvCgPEg0fI/Oi2qvO96KYrcmenTBWoPIwJFbvIg1MuQQW9DRu70n
         jWfOJTCXvSR96YJEfDDCpYOvhppfsvR+0bLrEPjfZr07EmOA4USAvoKOkSOXlslcxWg3
         xapLYW8YEOBprVMyo+sZDichcQFa+gKUV0eBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304263; x=1792909063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+EaD3mjRasIGte4hZqwmjWl11AAvJaiM9yV5LHuDVgM=;
        b=vzCMNg2CUabmmuTLDPXTnXWcOVP9LZhZlaCKVMHpGCqjURHPc3sRnCqH8dNylFfe5M
         7+nvH8ttDJKdA1IOpUwATVzFp1B7wzF61QU1dmGmcIXeTBtPj3j+wrPOgouH5UyYuuLI
         5KEm2+OfWhmE/1O5pmqjnKCPZGm3zt1KD3ZpR9sQHjgrL7yCN7PVoxl+W2EnfHcDu3su
         DmIXFaspUoWfKyNcLh6ycw3POZl2BWn2hMnXKF8L2pQ+UcsfEaegddOnOwanJJnAGYMh
         fzh0W6BdrC37kJ4T6NIWwzNSLdKGRFDtb1sx144t2NoQjt4J8O6t6rbvSHmCkNw5VkWD
         xq5A==
X-Forwarded-Encrypted: i=1; AKwUvBwSDTKEMkCpKmP6R1rbcvS8DC1bV4vR5KKYZ4+43P3nrz6rB/cs5Go9qkpiXkBMAxWuMsPPAhU7lqs6vSQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZeYhTWC1jVzLw2LTItwbX/eiUDP3v0Uqiv/38UxSnl8p1zhla
	OBT1KJJ5CIuhGTdsfkD6bVI0/JkxyAiE8P5MUUS3Lm3A5P7GAePwU22vT9j0iFEnVjY=
X-Gm-Gg: AYBFou0Yu9XJUAZIaPD5Jg/mubmEYWguan/Gnbdg1Yz27aOwhKWXdViqBPKTnzhuH1w
	qVZrarT6zUKVwkDjd63ipo/PgEZYpNoC65ir38v+4q9zjVMRLpWmkrlHMpl4QDafcsBHYU+RvC5
	BNcpOCJW629swbJbrIiwonQG5ROkMczt+T2IybO3GHL82UcdtR86Ce7FmdNhSYH0wbs/3x9xAc0
	0q4BDMD2HSOUlgwtnnEW7w6r68/XvdpcK+nRXtcAhHJEXNnjOim6qb1Qi13X16zfoKntgWPEfO+
	RN1qnZpsYuJGuBDX/5Pn43DS14497YEmh8P5aftZU1MD646zO/hT3UUfuK9GhXuMSPfrTwV2nyH
	1dvbTyMHC2VAEPMkWG9QCKnQ7TnCL35fDKAckpqmIc48u8sZzB7VDx9u0eeM/19LIIFy5LwliyC
	qtJ66HJf4I5Nqh6XMPJctTog47xZQ/Cfd8RR2ssSL505XOIXXyo/Iby7kKZ1b8Fc9kmZMHWVX4L
	T/4ea/Evl2nNDuJF7uldop3cd9Yz1faqOzrJs9XlyuxiPq4J5f6lXo=
X-Received: by 2002:a17:90b:50:b0:3ab:31e6:12fc with SMTP id 98e67ed59e1d1-3aced867f5fmr3988514a91.0.1792304263243;
        Sat, 17 Oct 2026 23:17:43 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ecd32sm11025963a91.3.2026.10.17.23.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:17:42 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>
Subject: [PATCH net v2 0/2] net: usb: lan78xx: do not use uninitialized data after short reads
Date: Sun, 18 Oct 2026 14:17:32 +0800
Message-ID: <20261018061734.19488-1-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lan78xx_read_reg() and lan78xx_read_stats() accept a control transfer
that returns fewer bytes than requested and then use the uninitialized
rest of their kmalloc()ed buffers. A device that sends short replies can
get stale heap contents used as the MAC address of the interface, and makes
ethtool -S report them to unprivileged users, including kernel text and
direct map pointers.

Patch 2 makes both helpers fail on short reads. Patch 1 comes first so
that a failing statistics read does not report uninitialized stack data
instead.

The bugs need a malicious or emulated USB device, which
Documentation/process/threat-model.rst treats as a regular bug rather
than a vulnerability, so they are posted publicly.

Testing: the series builds without warnings (W=1) on net and passes
checkpatch --strict. It applies unchanged to v6.12.105, where it was
tested with a LAN7800 emulated by raw-gadget + dummy_hcd, booted with
init_on_alloc=0:

- Zero-length statistics replies. Before: 40 to 88 of the 235 ethtool -S
  counters are non-zero, including usb_api_blocking_completion() and
  direct map pointers. After: every read fails with -EIO and all
  counters stay zero.

- 100 byte statistics replies. Before: 110 of the 235 counters are
  non-zero. With patch 1 only: 29 are, so the stale tail of the buffer
  still gets through. With both patches: the read fails with -EIO and
  all counters stay zero.

- Zero-length RX_ADDRL/RX_ADDRH replies. Before: the MAC address
  differs on every probe, is programmed into the MAC filter and is
  used as the address of the interface. After: the
  probe fails with -EIO.

Both bugs were found, and the patches written, with LLM assistance,
hence the Assisted-by tags.

Changes in v2 (review by Sashiko):
- 2/2: the commit message now says that with patch 1 only a partial
  statistics reply (1 to 187 bytes) still leaks, and that patch 2 depends on
  patch 1; the MAC address paragraph no longer claims a write-back to
  RX_ADDRL/RX_ADDRH, which happens only for an invalid address. The cover
  letter gains a partial-reply test. No code change.

Wei Jie Law (2):
  net: usb: lan78xx: do not update statistics after a failed read
  net: usb: lan78xx: reject short register and statistics reads

 drivers/net/usb/lan78xx.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)


base-commit: 7ec48f396a1d89532c0537bc38b408b8c31ee37f
-- 
2.43.0

