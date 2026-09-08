Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CDF2931D3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860438; cv=none; b=fkyZOcxn4spS7t+JXOI2e+q7GNw0IpMU/Cx+e7UMvbUymZdyxMQQ+wpw8R16x/kplj4EdvHIIcZsKMuzC5ToH5C6SKhhYBJdkEdTIcaYSvRLrKHnX7oXl428J3ScHHg+e60XS6dVYlFo553G+RSyNrgwk9sd0B16594EB2r+MTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860438; c=relaxed/simple;
	bh=1ZQPoNVnUuiMVJVjYzNnasQG1+hpCiPhDHvHiw/xNsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M8zyJhEZ+UrqvEJFhb6uJ6zCLY0FNcpfyyTs4EerrPJtnlMTYjK0qnK5MtEKVNQsVWw6e5keqzlt91hV/b0lnUXQTkVIYUU28Prnc0XZBtzYScAbbk3RMmUqyBuSEwVeax8NUxyv/6YhzaS78YpF+BCiDdJUIEwE7j1EkTJ3im0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzhtxIrG; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzhtxIrG"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c7364550so4556198a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860437; x=1789465237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QSADaGKPLGDmms0JzztEisv6wj1yn15y4i/vNr1IM14=;
        b=gzhtxIrGzuSirYQea4NheWlQ2CDkEXbDtCMhciQ9UIrEKpl37cYffzd88jkWrpTCV6
         K1UsQe3QwkWocmu+z7nYsYxdYvmooineNKzLiLVWCvuoQXz7L9xP8UxUabdF+umR8GSu
         fjqj2Pe4h3WBkpAt1hzu1spXLg88jjasyEDnNqBsGSbtKRLXBvGhMO/GQ7xN3d4YC3dW
         vrqD0KNGaUysqFuTpnsdSX3llp8EgYgmX/VJ6jXbGjUygrsz8OVC2faJ+hbAj3MvA+8i
         alPPIQimVPKGPYgpaFPJwe+b2SHdpmjTYJa5zzwZjrgmmNRDcJmMxdeHqF6+27cMyPvn
         B70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860437; x=1789465237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSADaGKPLGDmms0JzztEisv6wj1yn15y4i/vNr1IM14=;
        b=BF7TWrJZ9OY7DUnAe7BLiDaOGYf/mvn0s695JxKwXdRUBBdcwNaqcPAV/Nfr2sBdsZ
         fq3sI9lwY+r9ffY2e08n7NdiF4I8pEsu2qjCUOed3pHQi1DD2pPg4F13EbILoNaHdFpA
         8xnLrXN+2S+fTAIxFveLYV4kbZWFewKYOgMvai/BvbinZyft2J3gI4X10bon80pdJFJf
         qlvY01bw2TAPpbEoUGL54jbT7H9ayxAoOoB2455U8ic5DuJULf0+C8T5SlYb8EULzYX3
         pz5kknAeSMl+R2gZIIQnAq8/f6MIRAysfDDoEnwv9IV3HWcUNoBBzEGtGTsUYQr7uYYY
         CNRg==
X-Forwarded-Encrypted: i=1; AKwUvBwqHufZ/azyUdAlv+b1h7jNz6S6QUSUdD/NOdkh5mnA0KZ9qMCGWn+Ey17DoRxd1Rm8Cka6Lb80bps2OTE=@vger.kernel.org
X-Gm-Message-State: AFuF++l5W2AoNvrUbxFDZP7/mb8jUBWVooChqGnWnWWdWZCitBXkTIdP
	8prfwax9IACCBdXRnM/rNIsN+bGnoUE1m/4m55Wg28fyqnrufdiV82InOlbNYA==
X-Gm-Gg: AYBFou2JZtliWN2RXkGazzIKxl9PvsltvTNFOvEGMaYefl4bKy9iIfj88igPPUDJtAm
	nszw3PIX+UhLb2rIltYkl3hH+kFCD+4H6yc1AqYGROWChga/gqtP4T4wehDEKWJ311VZ4wStgSD
	XoZ4vNo8IFO3P1dcFYpsertY3/Zqovb6xBvSePhaY6n3nCtM15xfs78mk8TbX873ZKoJwltkCLV
	vjGwToMs4BOsy1dpdFDorbFWYdL5l+bDd1bYHMPVqzHsVd8uqcCu8fUzVBqASLWOp4Y3IztL0CB
	69gl0VPrj5uRRSfM8Vf3faXWtJywLCba68jzE8nDV39fd3Qj5x3vMwHDaLMUyJcsKP96bnsDxis
	BxZD92EbvXDAKo//UdJs0V4PO+ee5zTzqvpyslCHVbiY4UXO48D+XoE1MoccQQSo8WGY29EF4ar
	WfcjuQikG9NvfrKNDR9W2zeIajXcUAI0FUXdrIacttOM8WfXUow8GScUdmDSzd8QSMrCPpP/m51
	WKNpp32AY4i4RRpfGfoa9EKuT+d5WtdLr1KLchZHeOM/+rK4Ln2oZRPfivpGiYJEQ==
X-Received: by 2002:a17:90b:1d45:b0:398:9bd4:d1a with SMTP id 98e67ed59e1d1-39b262995b8mr41799602a91.25.1788860436531;
        Tue, 08 Sep 2026 02:40:36 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm31999240a91.13.2026.09.08.02.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:40:35 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org,
	miodrag.dinic@mips.com
Cc: radu@rendec.net,
	zewenchen@google.com,
	jamiechen@google.com,
	edwardwchen@google.com,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 0/6] m68k: virt: Switch to generic goldfish PIC driver
Date: Tue,  8 Sep 2026 09:40:10 +0000
Message-ID: <20260908094016.1997918-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the m68k virt machine to use the generic goldfish PIC irqchip
driver instead of maintaining a duplicate, platform-specific interrupt
controller implementation in arch/m68k/virt/.

The whole patchset is tested on  qemu-system-m68k -M virt and verified
that interrupts across multiple goldfish PIC instances fire and
increment properly in /proc/interrupts.
---
P.S. From a quick search on lore, Miodrag has been inactive on LKML for
a while. His last appearance was just handing over the goldfish-rtc
driver 6 years ago, and prior to that it goes all the way back to 2017.

With tglx's recent call for irqchip reviews in mind, I actually use and
care about goldfish devices on qemu for both linux and u-boot, so I'm
happy to help review future patches for this driver. I can follow up
with a MAINTAINERS patch if that sounds good.

Kuan-Wei Chiu (6):
  irqchip/goldfish-pic: Use gf_ioread32/gf_iowrite32 for MMIO access
  irqchip/goldfish-pic: Use for_each_set_bit() to iterate pending IRQ
  irqchip/goldfish-pic: Allow selecting CONFIG_GOLDFISH_PIC on other
    architectures
  irqchip/goldfish-pic: Add goldfish_pic_init() for non DT platforms
  m68k/irq: Add empty irq_eoi callback to auto/user IRQ chips
  m68k: virt: Switch to generic goldfish-pic driver

 MAINTAINERS                              |   1 +
 arch/m68k/Kconfig.machine                |   1 +
 arch/m68k/kernel/ints.c                  |   6 ++
 arch/m68k/virt/ints.c                    |  89 ++----------------
 drivers/irqchip/Kconfig                  |   2 +-
 drivers/irqchip/irq-goldfish-pic.c       | 113 +++++++++++++++--------
 include/linux/irqchip/irq-goldfish-pic.h |  15 +++
 7 files changed, 105 insertions(+), 122 deletions(-)
 create mode 100644 include/linux/irqchip/irq-goldfish-pic.h

-- 
2.55.0.979.g7e5102b832-goog

