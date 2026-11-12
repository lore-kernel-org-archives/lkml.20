Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509149;
	b=ePry6gdgIQ0+fjhbLSmHTmGs77kfva1JYlLdDZtUoZVIBQZFIz8MX9bYaM7zEGZz/2JX
	 jpVw4U8/HMTSYhwlLges7A6U+tvWCcCiHBLTIhdCNuGWB+n/CEzNPWcOV3QlGlYYm4inF
	 lITWnbp9F4f5UCuhm753VsWTmKjGSpaLj3XUrvplTIqDI5PDYfWE8QkhDgncmi9JMIPGn
	 hOF5iuCGeYxN+0FoTvrVQd10tV1YuLClh2hc5Lthj5alx+MsUcdssI4azgBBIkrjnQmLT
	 bCYDxluAQFUTmWr3A5vKxISTaHjJRdV/LazHZhr0C9JhRRZ/Ye62mxq5nYyHO4Mz1dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=o2qMJEH+31qggb6YqbR5qReK9kZYkIie2xHFXPABy7M=;
	b=WAeSjZRqTsTl7b4e50FqNGBi5U40X7hOvWg/v48VPnkZHCuWD9+YXzhvU66dVF6XmeGD
	 l+p5f4SS8WfugdlV4Fbhdm7W5Q5yrOICDNhR+YCyKYvehTPYd7Glkkq/l9KuYQUI0SbAn
	 jcIf08cBPaLO4Dxuz+FWv0HgQSfg9uNZ2S1Yt3HCE0rOOEQeS/2N6Igb8D9oW0xA37v0H
	 GwMdzEPd5VURZDGc1iQ4VKbLCnm56XYbGEn30yD4Csq0Z+Sf9M33H1aeaqaITAbhgYCbz
	 tYdozPYMZAi0fJW8XnucQ28JgZZZm2t05P+xdPDinki1TiKBTujKtsLvpj5wKXOwDwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WYKEnETn;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDD7606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BDD7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WYKEnETn
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3791619605cso386329eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509148; x=1795113948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2qMJEH+31qggb6YqbR5qReK9kZYkIie2xHFXPABy7M=;
        b=WYKEnETnICcshBd/3HhBmqwjrcKe+FbTbYG4mIGPe3Gt+6T8ttAbfauJHC3wbnYNI2
         N4W+1hX0tN1TiFkSUGF20Ufp7aOifT+NeDqD1SM3j0+/jmZrUNg3HlCMQPoRuAzmDApo
         /ytIuoeddMZnIW1FBATf89vHQ+Ns5KRLIQseTsjQEups6kRFzSABIhx0gEferU0R3qYO
         zYuwLHPmb/bdWeZsqHaIZ4W6fV0Zb9fJfF+8Sy08N2sKi9Faho3B3mgBRJzGIPa/43Fz
         k0eir7hJmXlvb9chFcFblFVb3VZLzcZJJ3u1/K5BulVvqDIWb6KDbSV6T/ndl10J7BJ3
         CqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509148; x=1795113948;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o2qMJEH+31qggb6YqbR5qReK9kZYkIie2xHFXPABy7M=;
        b=L4alGJcirFhn/b4eCGBW2aBNnvokWPjYgMopMCtEa/NTU5P707pY+n65+wHzia8il0
         92BF4FZZoWWfMcdrczEOAvU9If8ZJhhLdKp7eBNmPTVIGflRIx1SuemJO8jOOLM4Z5HV
         1aKS2iHE1JbDKWrkmEIIAJ20IE4twf5vDIxk10KHb/6EF/3iHNQWKY1u3hSCuGQ/NFQz
         prkEsug/t817sBnc7MZ+XPCtubliJpXVngY5VqnMAEHxo80jL/bv5YA0n17pG03q9prS
         KZo3VQNl6cmWeuaDJ+74B7xCgMGNdpRYrpJIwlJ2V+LzqCGs7ZZei+LNvkjHYeYqLwbJ
         GPyw==
X-Forwarded-Encrypted: i=1; AL+hErFZsIdWm7AuMSlXUlbRv2JJcX7YdxqTqk3Ead7HNnVTylHhrAS5dQsovD4aAz2bLVZPekWhe5M5oOTQ5Wc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2+xEShkzryNob8m4VPuKloOWjL0pQ0pQn2z4kAjji+Mlb6PEo
	7VtIKpFkYdPDsXe8Wz1pQCedDCbq8vslb3dNySxQ/cS7pnG7chOQLeCV
X-Gm-Gg: AYBFou1E7CBqlZuIHYJ10FsuMLXEzrDTgqFS5uqOgtPCjD0OxHHeq49LGcitEj65NlO
	F24kToGRxnxq4HAy39VegRJLSGcokGrspVAwiUitSrru04ISzeVhdvif8tHtBac3a/1jGivOz5s
	TOPbNLO7ZQAry20XYQH+fHoF69S1/T85K1HcmuXV3/b9TbWvqbTZFMfsN45xeTjPZY+Coh9HH+J
	eG4RYg129a8XLqRataloyD/ZA+5cBnYuYLNaD0fKC3KNThOw1tzlD6S/9JIyOOTIcQAPdUseFxM
	AkbsFFaGstRWmoK5EueXJQ33Ud27klky//zkNeC9RTS3qmw/LZWw9iGAhZcAAN78/jEI4fXqSji
	ICvqUSG1S2ERy+3cXRZogBUVN4yYiDIHbFrXFKYaF8LTpWHdPXPb/Yy5NOu86GdpoVBYh6J1gJE
	tdUbh8+//jMwIGBFaQNBLs82FUzYaVn2WFGX3WPbeZI5Zc6QyoYL7BBk1TbsThQecpvxBgW2eX+
	b/bfiKEGHWm5s8ZeMyRBvh+L69kIxij5PIwr9jIIqeqSZAVmc/qlN156m7cxcMzUOK2BwpT8FJU
	wq00UgV2
X-Received: by 2002:a05:7301:b06:b0:36a:1089:9836 with SMTP id 5a478bee46e88-3796628ce32mr27774eec.15.1794509147532;
        Thu, 12 Nov 2026 10:45:47 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm369524eec.27.2026.11.12.10.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:45:46 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v4 0/3] MIPS: CI20: Enable SMP with two CPUs
Date: Thu, 12 Nov 2026 10:44:38 -0800
Message-ID: <20261112184441.3724150-1-f.fainelli@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series resurrects SMP support for the CI20 board. This was
submitted back in 2020 by Zhou Yanjie.

Changes in v4:

• Enable the secondary CPU clock outside the raw spinlock
• Mark enumerated CPUs present and assign hardware core IDs
• Skip generic IPI allocation when the platform supplies both IPI callbacks
• Fix generic 64-bit builds using CKSEG aliases and pointer-sized assembly macros
• Reject unsupported CPU offlining with -EOPNOTSUPP
• Restrict the XBurst SMP idle handler to multicore systems and recheck
  pending interrupts after flushing the cache

Changes in v3:

• Align the second line of the readl_poll_timeout_atomic() per Brian's
  feedback
• Collected Paul's R-b and T-b tags

Changes in v2:

• Moved SMP sources to arch/mips/ingenic/ and the header to arch/mips/include/asm/
• Removed CONFIG_MIPS_INGENIC_SMP, using CONFIG_MACH_JZ4780 and CONFIG_SMP directly
• Renamed JZ4780-specific SMP symbols to XBurst names
• Changed CPU enumeration to assign consecutive logical IDs and removed the explicit two-core limit
• Changed mailbox IRQ allocation failure from panic to logging and returning
• Shortened commit descriptions, removed Codex attribution, and adjusted source credits and sign-offs
• Kept the clock polling patch and CI20 defconfig changes unchanged,
  added Paul's R-b for patch #1
• Updated the kernel baseline to include additional upstream fixes


Florian Fainelli (1):
  clk: ingenic: Poll JZ4780 CPU1 power status atomically

周琰杰 (Zhou Yanjie) (2):
  MIPS: Ingenic: Add XBurst SMP support
  MIPS: CI20: Enable SMP with two CPUs

 MAINTAINERS                           |   3 +-
 arch/mips/Kbuild                      |   1 +
 arch/mips/configs/ci20_defconfig      |   2 +
 arch/mips/generic/init.c              |   3 +
 arch/mips/include/asm/ingenic-smp.h   |  20 ++
 arch/mips/ingenic/Kconfig             |   2 +
 arch/mips/ingenic/Makefile            |   5 +
 arch/mips/ingenic/ingenic-smp-entry.S |  54 ++++++
 arch/mips/ingenic/ingenic-smp.c       | 262 ++++++++++++++++++++++++++
 arch/mips/kernel/idle.c               |  30 ++-
 arch/mips/kernel/smp.c                |   5 +-
 drivers/clk/ingenic/jz4780-cgu.c      |   4 +-
 12 files changed, 386 insertions(+), 5 deletions(-)
 create mode 100644 arch/mips/include/asm/ingenic-smp.h
 create mode 100644 arch/mips/ingenic/Makefile
 create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
 create mode 100644 arch/mips/ingenic/ingenic-smp.c

-- 
2.53.0

