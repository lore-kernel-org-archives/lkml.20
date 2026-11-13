Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596921;
	b=q7AobjMtpNb9/7T9L5kS8iDNKBnerIaUCdAKAu4ZLwgfWS5u9kgaoP9/jj0xWgQgIQR3
	 9bxPtPQFfUYQxEBvmL3zHP+v3C4CJ1VPGOd0qfUAqaXHvLGhum4HQnqaGY2KMr98pu1Qs
	 oRyTZcUC1vLwzkEOSa/K15a8x7Hc3Mid3rrifRC3zNqSBniHuQvxmK8aqsXxAIKtd524M
	 O2DEikgCQUpAXF0eG0tM+XzvW0k8IooMkMPfiY7NT6f1SK8ZpwTMGbguvrg/dIvYxX1Wf
	 NMSqJTRG8X8+9URMtuWlTMAKlKJmQNkuZUHQodo00rl/Z/O7Cdl9vGOL/A1eBE1w/Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7zVRWdksbk2GmJApPG4YI4MTzgCoDOVGLlN4Rb98bD4=;
	b=b4yQJDygDcU9LvRM18eYAJEzPJ7ZQb3KEXxH4vM47zP8QMcIWN/jyyuhlx0bIvluG7AA
	 EipQ8yN24ae92AITv3VMMMd599AxrT7mHNPUmjkxkDjSakUqSeNw6TsV2oPGzzb3J66nx
	 x2ycrBM/rP8KShSXfcBRQeHfngdfligiOHQjBWie8woCjQSgLOFEKAXqgIlD2FAd9V/j9
	 /aB1WJ+lJ3plF/ekdsUNa+61g25xo6cVrlYF5kA5AA/iqf2cLmMp5F9GtwyTy30uh1z+o
	 PCRIUZ/PQ1S7Y2EZLdcg9tXFLpMpIa3e3PDXXTJou6Y+zTq+3MXcEmTzL0BBoFpH/rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oi6n14bJ;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8074A606A8A0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8074A606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oi6n14bJ
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3720addb068so2132784eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596921; x=1795201721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zVRWdksbk2GmJApPG4YI4MTzgCoDOVGLlN4Rb98bD4=;
        b=Oi6n14bJsuA3MZESR2IVpCx1+TTNYhFtsSxeR6Rlc/yu4ih3w3su2fUaAAiDCICSHF
         lxpCMYkvk5kZMYo6LVjuR68e+p2CGzY+iMcOBvs1WBwZSUPFfmNE+Bt4uaLd/Iyr043d
         jL+yLtHUi7Yjzba1ksZmoNThvzrpL/ARk8jz7pRyEHZGfdE6yRPqLAr+TUILJZebSPn9
         2IBS4KyXPkjzPUPmMo2TbXpm3vnGOmYxVohRxSLOfvqMFURsv6MKanVa9YT9B9UuoHPH
         tkyMFjuJH0uBF455JpeLfAJRLK36xUvmXx//gkwEsYSB+18vt1GpaaZ0FN4QKjj++I37
         0+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596921; x=1795201721;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7zVRWdksbk2GmJApPG4YI4MTzgCoDOVGLlN4Rb98bD4=;
        b=iw9gpNVo8ctkot/ZJGCwkEQBvIW43zDKPYUxwcTniWDQL+JRcA+jd8NamXjsU3MGJz
         CH8ii1sA1BbXAjKrr74bfMoU8+rPsyKJ2fYWmTG85RaVWUHc2hz85G5KBjVs1KWZxnpN
         5mr9XAvrDMMpBOBzeNZsUycxoQz3kifPIASwlj47vTVUnwoO0kwzCwNlmquK3FlhnZvO
         Tsglj1ATXAVogrs5f+t1OZdeySPiH3sJi3NxgcT4NIdYQGk41B8rphqHGbczHBgEEiLP
         9cnwqnYdjviG2bn/H/JTy/KUQQgIiQXgieqKivLLDO8cNaJ6lIeEqVw1UXaORcRPKlA0
         crOg==
X-Forwarded-Encrypted: i=1; AL+hErGwmhCLPmZAwAz1iL/XwSIIOlczT6vR6xRdTDmTzOblZnQx5MnVplK3F9o0wh+n8i1S/Q4NbJziAAP+4zo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RiCiPeZoXGfrMeacBSucwyBrQlm8ka17fWbGq8r+id9GDdcJr
	RrMF9diEejG7XIxZp6T1nBXPEAhoIbJ6EJ6rTqfo3BtJ5ZjZ5GOINnAo
X-Gm-Gg: AYBFou0Y9wZc/m4I801uSd98W89rs2KMHHlEnuZbDCN1LgWiCzqQRp2HvWsfOBKoSKS
	89SabKtmw9Jezw/HP4krWQ5JkZ/NK5A8Hf4X/IeAlYCabd9Wg/xF3oC3MD0yMSNdy+aFseY5xy9
	Gj04O5e+LvgMR+jdkJenXuXNsIAsuBjSBnEb+Ub4/rxTppH9oiebGeBEfAn3JUoU8qHy5R2Knrl
	A7PdKeDr3kGiMHVIMtw6/rjPgFbWVHxfMtujjLt43mH0r+9bHrJcMhdlM9VolqETMDfVFMrWKho
	Opfx34nTPxxFVlUYAFTWeRIvQN1cIQsCwfQuH+azboGUXmnT17LecTkb/yBbfH2RiZKVQ7TJcd6
	SYifWSLy3ROvEiMLgeNoqw6UibY45+DAbKPYuVJDD+UygOP18UnZYduHWJxIuW6WzlxGT/ttQ3/
	OUnUs9sOgASNnX15iFLfXgWPuCENROOp8WiV05UCdXPgU3gJHMvmbZRhKGcvsqlrAmc6N/gEBeG
	iKjFbw81nzZT+/mTjVe6mz4jJt355agGgo8pxncNm+jvhE6IxszAUdqVc+8huqV64990lhwBBQ6
	9HKh2/EVtw==
X-Received: by 2002:a05:7300:8a19:b0:377:1bfe:14d6 with SMTP id 5a478bee46e88-37965f9d236mr2579200eec.6.1794596920459;
        Fri, 13 Nov 2026 11:08:40 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm15714037eec.25.2026.11.13.11.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:39 -0800 (PST)
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
Subject: [PATCH v6 0/4] MIPS: CI20: Enable SMP with two CPUs
Date: Fri, 13 Nov 2026 11:08:32 -0800
Message-ID: <20261113190836.470937-1-f.fainelli@gmail.com>
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

Changes in v6:

• Added missing Signed-off-by tag to patch #2

Changes in v5:

• Added changelog per-patch
• Split the generic IPI setup check
• Added comments explaining both need_resched()
• Removed void Reviewed/Tested-by tags

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

Florian Fainelli (2):
  clk: ingenic: Poll JZ4780 CPU1 power status atomically
  MIPS: Skip generic IPI setup for platform-specific callbacks

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
 arch/mips/ingenic/ingenic-smp.c       | 260 ++++++++++++++++++++++++++
 arch/mips/kernel/idle.c               |  31 ++-
 arch/mips/kernel/smp.c                |   6 +-
 drivers/clk/ingenic/jz4780-cgu.c      |   4 +-
 12 files changed, 386 insertions(+), 5 deletions(-)
 create mode 100644 arch/mips/include/asm/ingenic-smp.h
 create mode 100644 arch/mips/ingenic/Makefile
 create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
 create mode 100644 arch/mips/ingenic/ingenic-smp.c

