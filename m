Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285098;
	b=M23DBUPxoIfh8r4yG3Q3y23PaOan+cIubwmIFhdzc9Hw6oh373+mUf6Q+RvXH83DAsdm
	 +h/XjpWUfgNnfPHqlbiLvPguFSlaO880S/79ZaePakILmEe2ETvirpj/GZEONmVJdTagR
	 WOrjD+9B5PQlk+5PDl/tdaHFw/OCkWvGS2nnn52MZZHRxhybOK7P3rkaHvGKivrzTQUEo
	 6l5n9MjwOtRXfC5a7KMFxPVSN/JvNVFr5Kbw0zFYTfwNXmsXfPuYeiJxSKeS408NqYe9J
	 VPbfyhS/7btl6ojAag0XEp8796dwIrUSijZ1iO29Yvu6sTVyCJRBYIQnAQ7damq8c5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZYqgKe2GJZW2UHebN2sjqXJOaRLIiL2bT7ytz8MwIYc=;
	b=P0PQewsILwtLX2syEJssKkag/ZFOtKZ2/sFKcBxXJubXoTuenSlGeNzgU/kxbBYNOeO2
	 kkGLrWnlVg7qPwaiT8DznZLwPSCh+0B3iuEzw7nwgPYIBTnO4uHw0JDjShYdQRQrJHItN
	 S3qw2OOJ8nJjYoNZezSVeRmyllxP0DNsrzvNoY3tBaLTr1MogVyYLBbLulbu5gWatO28v
	 fY633l3LlY0Kf7ltIFpOqP3zBJ1vH9FLQbdVKuOH8stK8bT2Kn5aeKLj8gxMsErniJdRF
	 E/3frqiDi8Q4hKpO4/7uEng9a06rx4JgDLsiWB8o1rWlp1lNZNfbXNKk3Ih4nsidnPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0uPH12Hl;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085C6606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 085C6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0uPH12Hl
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2801530eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285097; x=1794889897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYqgKe2GJZW2UHebN2sjqXJOaRLIiL2bT7ytz8MwIYc=;
        b=0uPH12HlIIjxnOa4jUq2Xm2642IE6xugnu508/kJ+JR4O7djbtb9RAgMDgtbpC/fGN
         4ayZEeNFQ+Is9OiZ9QF1ExnDfhH893SUjQ6KY/6GeRVAWY4BE5k1CWBa4YGT8MtZ4VqZ
         nLILYR8B/hzmuZJRc2By31R9+FQV5LfFhg7qaNUxMGPbmAiJH1PgKgZyNtCta++HocuO
         MN9X6USKJ2fhH1D3g0bzKaAAkF0HYlg8mIXvuk422J2ELc9pB890iAZnViDDHm2xB/n8
         crh/bBGr95Mk8S81ToWVbXC9Wzs6kby2CTXNvHTAy+SKSJKdg9Tj48euTvBDAHjWrERb
         xDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285097; x=1794889897;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZYqgKe2GJZW2UHebN2sjqXJOaRLIiL2bT7ytz8MwIYc=;
        b=Bd4VMUQS9LKhe/lXMA2h+JqXOrDOaM+m+fWjCX9qCs8PS41yREjURtB3Se7OyGXIZ4
         MyYfmdunmL9JvC2PNJ624ZncaHzQTlb2dhpVK1uZD/o4Tbdy3ELL+pDwhmGdTMBjceRU
         b6ju6f3cksl4zXNllzrsqK6XQ2XjVsXb554VrKWkDAqjlMNtaICjH87k0Q6Lpw20z3Zi
         poTDnSdZzkIPGpGvuSEREsD8PnzgtNhUSHufj0gEKIo1K2dGF+o9b9W61ONcM08A71us
         B8k+IgTBBRgNK2vOXJOQoWGqEaLDZvoY2xOG2ORakNjTWpm2JVn4cFIGwcThnVZhZcM5
         HS9g==
X-Forwarded-Encrypted: i=1; AL+hErGEB1Dfo3dubUtkMuhuDxIOLYWXuKi/dSLjJfboN6VLoCkRwYP6flnBcFL7gJVk6nkD125cylKgWLVYKLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lo6Z45bcTR+UZQrbp0MDNcOvcK1rv0Xg5kTcBCM98ElZGmEke
	ZyzA3Vprb6P8iUFJYxV8IePlyWT91t/tOyRkA2pKP2ibxkc9igVlfvKf
X-Gm-Gg: AYBFou2ZYs8DsBggkZ+SVMRozsm1v1513c2jn5DVq+CSm6EefpumHQMQPMyfqyaclL0
	YREt7tdBsEGE6SJ++g2SSqnQVWv5bUS153qEj6WElsM+ntS9KgYrKKfJI1+QzJ9u+KVl1TELF/C
	y0sYXtAH33+i4Rvi9bbxJGqhwsievpvnRwbCFcGw+f1lF8unfs25QHtxTnFTfzw3lpbKzZS0pMf
	X1aJZLiidc4Szu6wr866oN4mRAZq50OEYOUIzO2xChyyVpXHMdy3H2lPeST2DOtz0gaNKc3gZj8
	rbTrXzhL19OiPf4gMaKik6bP33Q8asUppVWwBC+pqzASSD+zMjSIIz+J+OOGpLlq4k8PcnsNI7a
	XOuvr4OsIPUzMWpfvNnfjIDkCskIe/06ISudP9JGXc6z5ahOd0/eRxt4YE50brGrie9SpZoE5o9
	B10Pz3iNbdturtONe7uhqmBBEEeWlxsKGLbPJ6pzimdHGKxtmdqtWKCQmute6/L4NzGYWI1uHNj
	jVUtnnFl0CbivAbA5atvrMqwMzLdQ9s1FZf22CF0BUNBfBg5Fy97kXJdcOjI1u3Dx+SBvY/DTCl
	ZDMfOg2w
X-Received: by 2002:a05:7301:e22:b0:372:b76a:6fba with SMTP id 5a478bee46e88-3751f077fc1mr2683844eec.14.1794285096489;
        Mon, 09 Nov 2026 20:31:36 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm3340996eec.25.2026.11.09.20.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:31:35 -0800 (PST)
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
Subject: [PATCH v2 0/3] MIPS: CI20: Enable SMP with two CPUs
Date: Mon,  9 Nov 2026 20:31:28 -0800
Message-ID: <20261110043131.1985993-1-f.fainelli@gmail.com>
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
 arch/mips/include/asm/ingenic-smp.h   |  20 +++
 arch/mips/ingenic/Kconfig             |   2 +
 arch/mips/ingenic/Makefile            |   5 +
 arch/mips/ingenic/ingenic-smp-entry.S |  54 ++++++
 arch/mips/ingenic/ingenic-smp.c       | 247 ++++++++++++++++++++++++++
 arch/mips/kernel/idle.c               |  26 ++-
 drivers/clk/ingenic/jz4780-cgu.c      |   2 +-
 11 files changed, 362 insertions(+), 3 deletions(-)
 create mode 100644 arch/mips/include/asm/ingenic-smp.h
 create mode 100644 arch/mips/ingenic/Makefile
 create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
 create mode 100644 arch/mips/ingenic/ingenic-smp.c

-- 
2.53.0

