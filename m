Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595377;
	b=NM7ZBevYG16dW8laz5F4rX1uui2UoIaUbn6QzLvpQoC75EWO1f6Z8z/qDR371qVtRls7
	 7t8YXm4zoypVKRLLd2pKUvVnN7jZ1hCQvnGZzmsQ6+A1jSYgCIuU0LTYyVTkwBiCUX62R
	 2pTmMPVmdOJ4B04gjodhuYoTnkocUM0aKJoZ8QIYa2EQoBJ258L8o4mLo7FBJ8Dt+Fq+F
	 vrr30Fn+Vp+aySvyRnUd6phaB8YGKhAjdwZtBWqQgW9YAgOozZUF8NoMiIrL6H7hukUzJ
	 ujd4J0GwilQ3093v/S5OylmCQce0O66ThQNQifN0+u5+/iYWQO4FVaBKXVzBhmB0dfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yEw5KadHQTak+G++8OlzH9m+1ubEWMXtFGCjx2W1Qrg=;
	b=CR2KXAJvEO8tAtrAZeFepCJkMsTDAZTBKVsSGfUGv1hg5hhmKFdqm1m7fxsp7ygn2V5P
	 +L+QiyM/+CtuKpwdua+k/rnL/c3qIZyxz4LitxFKziccotSKUY6YO4CNv8pNEOPOPqIZC
	 XKWpkYZf7BszQHcGI35QNKeDQHKDC4K6koi+ZOhkNNA3I3re3Ls60skCnG+IFoaoRKxac
	 19HOOhONoL9G8dYN2Dkk5jSxjlA4LU9Qg0mLcATsSm+Gdf0rTDHnwghzP25Ew3WFmd2q8
	 Sp7gQslRnfD6tujFg52w23Y4e6etZkqmh64fCX6KRSeeASy/j7D04vrPlOh257M76cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9Eg0Qeu;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5A8606A673
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B5A8606A673
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9Eg0Qeu
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so1776226c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595375; x=1795200175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yEw5KadHQTak+G++8OlzH9m+1ubEWMXtFGCjx2W1Qrg=;
        b=u9Eg0Qeu706qjT2IhCsz4+EKc2sO/nmiljfYEXHHufIWj8XYW9yaWltbHfroO+nRs0
         4gdWcsMQoFSyT8YLi0gRRsryAw+3QXIWxWhsEUjuaDNFalx/VTGkgnrsyjl5E7ctZbED
         LT0gSvcoNSjTXDxJXTHdW8EFzO0x0RB8TN29xhZ42euzZ1lij68JgmV1oS6N8z5Khbxs
         EpyLoib0NMAjwfbP803j5/GeZo4jLP7Zn0GSdSNKtRIJKzA6DkNeMNbIYGESB//k2Tj4
         nf3cUDSVetEIRqtLgNwyftNHQKGiBtYj/Sf+vQOTKOWRhOIl1w82dt2dQOGeQeayJdiR
         kYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595375; x=1795200175;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yEw5KadHQTak+G++8OlzH9m+1ubEWMXtFGCjx2W1Qrg=;
        b=vYsSzg41p3O4YdznzrCmhEv0BsFQpaWYxP1AVkMuVtTo/AfjFO79V2RiObAjhlfr1w
         UCJs13reKJzwIgrY+Wjw807jybZ3k8tTkBIrAdZdD7blyrE95vsmEw4iS9OEU3iv5RzK
         zV3hxZaIrQOaT7H2Zde+Y/+DwNn/CCvuSzGW0ZqvstthQzI3lhm8S9bt+VDQJIwmGsBi
         gmYQcWfOkziDuVtJmhDGaNWnJr1uLR90us0b5kYkn43TVpmBZscrGZ604pNZwxzJrh0O
         Ur1S5URbQSbHdU3bUTsfIw9nCm8V1ECdle7ksuZNIE4rkXYXj40iVOloE7j23IpKC5Cq
         y/Yg==
X-Forwarded-Encrypted: i=1; AL+hErEkNtvmij4dkHPGvYKvkYhvCf2N2ETZS9aZpnd5RPjaLOpQuNNhZbyswFQF1PFmJT5+JagoMY8WhGjxYhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M5JCVuRqOfftTwMZOnyto6yPVLdQuFqUiLCsRQAZ3KpnICAQ3
	CeW8TzOcR2Od1uNkxMhmOntPQTmHzEqsUjq/Zkfe2rFwcX/WfIeSSsm6
X-Gm-Gg: AYBFou3DqdLZ9azcafkade7OTNNX8iSlO8iwoONOm8ZAEsegfnoZ02X9CnYqH31cPYg
	VnpaBCMsamx0TLiMDn8AE9wuHdI1zV5kxOTC9clD+2Bkv5xnLmzsiz5oZ5Qcyj1mkWURcdn2sEP
	IbLAb5aN4LYSraPfWQhUkzVIocmQ8/7ejg6LFa871mV2cIQG3krYTdabj6rsXADeBL0I7MLMgq+
	ITn871xBvTy41RTstEHfC62fU0Z4fd2MpLj8MpNgUj4PW+8lTnXccGReywQAdiG5HTr8uj3RfGa
	RnbGpRXIoaR9d2TnZB90wyY6l3HwnVIJyg8ux4MO8IYsSodZ6bsUvoMssE89A8c6Oh9lidiotu7
	Hkz/hpnJS/JymzJaoO3Jrzb0vPJMNhlVZN30V0TvnCiwDHp/f077QJTTw2v2pJmL8Hs0Iob0TPK
	iPV0rBcz4g3sVmK9L7NVxje1mjEjaAigcXVYSWwKIMMgIYPZ6JAPdbCnkOo1NFq5xOx5Kyy8jzr
	9TL3SFgvYrrZqpGDtS6/0lXB2vGKWDssggweqPir4NYI3w21vzkhV+Vd8FWOTZj4j6q+chvRD6y
	IPhFKOEC
X-Received: by 2002:a05:7022:3a87:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-1b5030980f2mr3402806c88.13.1794595375329;
        Fri, 13 Nov 2026 10:42:55 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm10526177c88.8.2026.11.13.10.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:42:54 -0800 (PST)
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
Subject: [PATCH v5 0/4] MIPS: CI20: Enable SMP with two CPUs
Date: Fri, 13 Nov 2026 10:42:06 -0800
Message-ID: <20261113184210.470320-1-f.fainelli@gmail.com>
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

