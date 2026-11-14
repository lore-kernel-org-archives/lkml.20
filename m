Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675388;
	b=VWy/t8WVnymwtdlzWkp70KVP6vZYHFTEkHwtVLbrCIcDqY+z6wMbqA288AtHD4fD533c
	 eObuMTcidwjx2j37FAnXPPAYSLXXJHiNeb+S0zT/gW/j1f3p7sKR7XFUjLWlbXb7gNKtf
	 hHc9YQUc9vwCnublo/1n61JBlyolM82ZQCnn70WRJxJxoXnC2r7j3qQnB/oI93J6yPf0N
	 T/EMSIK3pAOz/xHdi1/pKS07+9BCjIkGI75/MIV3vBo8pAN3VJOHPlr8n9d+zqvKJRGiw
	 g4wgjNhfuid3oI+YCp11sJlTimBo9SCtMGn0HdzqH06c3WNbkPLmT7JHJILMgOu+UDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=N9Kmc0u0x1VilCzo6rmrouY+CDoMFvwyyIz7bM0JapQ=;
	b=pxiq0LDXQqkzEC1FY2ECuAMTfMVcdT7AG85pglXMJFzJyl6NHqXTNlOn4Ws6YAhUVeWU
	 44B21a8lak/SBzJE/dYQal3FFbKJkuJSC6pY2ngSsJgnSffTbn1siiscTWzO/ETURekye
	 7V1Cxo0nMbYolqyP2wiuSlCWpJO6nflDacVqrfIc8Q7/MlYKPGe4VwfjKq5w+SsoQikVT
	 7oSUn7fb1j2paK7EVYHa4B+r4rJ3K+TKfK8a2ArKNyA4eliCwO9MJmI2smLdakRNuReih
	 0Lgly7slRgH8hyDStU8jiOqqIY27zJjvI+91wiOj1W6YL9+VLtvS7S46rFYRkSXEDTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="z/dSOD7m";
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1621606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1621606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z/dSOD7m
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be47aa555cso2501919e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675386; x=1795280186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N9Kmc0u0x1VilCzo6rmrouY+CDoMFvwyyIz7bM0JapQ=;
        b=z/dSOD7mIkyWG0us36nWLgCRXNO21fvRymtlBIntwttdxndlQDh3V6PLZKJBRPBfVI
         Hm0uTvG8rAucUNbjWD5jwTVgIFsMMup0x54+zc9xZ8ZPdKag0bA0rKUatNH1gp1IHXZ8
         FUXu599FDZ0L7+AJe0mmyNb3rxHjWev/pnW9uM/ViVKLnyR5GANv9hmvR0OwSeMOx+i+
         uA5jmp5SXnqWbRj+oBYJtYpTZBaEFoUlRWJXq0ziYx/bObskC0UqUglkmq6mjLWSZG32
         YN5Z2bwm3k2X0IFOlsZzCrJUtroQLkS9+IG4cnxqBJ+dsZmz564ZCqNsoYKqzTsfjx6+
         HJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675386; x=1795280186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9Kmc0u0x1VilCzo6rmrouY+CDoMFvwyyIz7bM0JapQ=;
        b=XHC/UOWaM/cqZ9PZ09xjx3Alk7LajrpxPzS7elpL7QEK8edxoREajC4/ZJdiYPaCqP
         9i+zamFjRoh5mQX8BqThM3x86CAKEyyV5MQgjCq9IztsbgqA2Y1ZecEizqzLdL3ONybI
         2JiVadiTGyC4nR5FI2tgkAzLnfLoaZ51hfM6LKtzBjCAIZaUn12qH8al50r8aEKHMQ+/
         5wH/rutfR5aVd/6+t6JjARKfOlCWgnXf+peYUgWUADhKbN/E20zU9fR0WEnczi2chBS4
         HxUXGy5RyveZfutKSvSMhc3aokdUqC+nhbfvKfmndqxrQptEAAYy3PbkE21E6chSokgd
         4i5g==
X-Gm-Message-State: APuU4Z95h3umQ9FjztOkshIhfVL7jax/WpPyAI+FAiMIhHpAYJEnN7fZ
	rshz3WWBzMLgwdRUO2uMeGk3mUN0TbSFxoOpTlzmHiNRP6v6+aI9CAassgG50K1x6fSieQ==
X-Gm-Gg: AYBFou2kb7iKY/W2ME7wbkaEcHcgBDrpKNj4lg+39TaFwDVmJiSkM3nJkp0SUqQ0qiD
	FPmAki8ZuwD2/0tZbdAD4aWrGzMCdRdfhgX8qteU1NmtQaYwUjnjeBlNfdz1rsAvxaTa6guem3v
	y92pfSEwEwA1eQ0DNlD43nO6e8tsMxnU6M1TNDcVSCKfgZqgtbFYn1ruC96/2KdJ/aVNmN8FZ3X
	NUrMgbbdvF73zfVCAV9qbuadW91awQy5r7MYcd3SfA39o+iwaOInf28AREySQ5BUIMlS2gzpXKc
	w9URD2PZmzsjqwM1P1o2nyQzWdqIC2BdMHSQfR8W50CPsoHLko2XGDLoyvcxbc/uUV94B4Pdd/w
	R912SxE8biaQJzK+NQE0e3hSXowVHZ25VTofWnivqUfr+RSiCnH44PxkeszdhFO46/VzPXKiDv7
	xn4CI8zqXPQU4rGH4JYxydVqjjRaTLI0veQ2r01nhZDuIxcrraiq6fi6Bja+kUEuVeVu4Xm9ITm
	7XXhJDfYpZiZreiXjF5PGNcAZI9icA6Y1N9eNY54N/czEoVWIIUAgWXTyMAOJXHQCntAGnopcd7
	qCw9itzMFlWaCAx/aHhzU3MYrEcMUS3pbhZ1Cgb9ZRZ5nam55jC4DVoVSb+m1Pbcp/iETwwbjeS
	SShws/7v9tA==
X-Received: by 2002:a05:6512:131f:b0:5c1:4bd6:fdc6 with SMTP id 2adb3069b0e04-5c1705d924bmr1975041e87.8.1794675385759;
        Sat, 14 Nov 2026 08:56:25 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.56.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:56:24 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/14] Remove redundant extern declarations
Date: Sat, 14 Nov 2026 20:55:40 +0400
Message-ID: <20261114165612.368785-1-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257

Changes in v3:
- Split into separate patches for suspend, start_kernel, sched/task,
printk, and lockdep

Safocl Stollmannovic (14):
  ARM: fix duplicate extern declarations
  loongarch: fix duplicate extern declarations
  microblaze: fix duplicate extern declarations
  MIPS: fix duplicate extern declarations
  openrisc: fix duplicate extern declarations
  riscv: fix duplicate extern declarations
  x86: fix duplicate extern declarations
  drivers: fix duplicate extern declarations
  sched/preempt: fix duplicate extern declarations
  lockdep: fix duplicate extern declarations
  printk: fix duplicate extern declarations
  shed/task: fix duplicate extern declarations
  start_kernel: fix duplicate extern declarations
  suspend: fix duplicate extern declarations

 arch/arm/include/asm/bug.h                |  2 +-
 arch/arm/include/asm/opcodes.h            |  2 +-
 arch/loongarch/include/asm/idle.h         |  2 +-
 arch/loongarch/include/asm/smp.h          |  4 +-
 arch/loongarch/include/asm/switch_to.h    |  2 +-
 arch/microblaze/include/asm/entry.h       |  2 +-
 arch/microblaze/kernel/microblaze_ksyms.c |  2 +-
 arch/mips/cavium-octeon/setup.c           |  2 +-
 arch/mips/include/asm/bmips.h             |  2 +-
 arch/mips/include/asm/idle.h              |  2 +-
 arch/mips/include/asm/paccess.h           |  4 +-
 arch/mips/include/asm/ptrace.h            |  4 +-
 arch/mips/include/asm/smp.h               |  2 +-
 arch/mips/include/asm/switch_to.h         |  2 +-
 arch/mips/kernel/r4k-bugs64.c             |  2 +-
 arch/mips/kernel/signal-common.h          |  8 ++--
 arch/mips/kernel/traps.c                  | 50 +++++++++++------------
 arch/openrisc/kernel/process.c            |  2 +-
 arch/riscv/include/asm/string.h           | 24 +++++------
 arch/riscv/kernel/process.c               |  4 +-
 arch/riscv/kernel/stacktrace.c            |  2 +-
 arch/x86/include/asm/efi.h                |  2 +-
 arch/x86/include/asm/gsseg.h              |  2 +-
 arch/x86/include/asm/preempt.h            |  8 ++--
 arch/x86/include/asm/processor.h          |  2 +-
 arch/x86/include/asm/suspend.h            |  2 +-
 arch/x86/um/sys_call_table_32.c           |  4 +-
 arch/x86/um/sys_call_table_64.c           |  4 +-
 drivers/soc/bcm/brcmstb/pm/pm.h           |  6 +--
 include/asm-generic/preempt.h             |  4 +-
 include/linux/lockdep.h                   |  2 +-
 include/linux/printk.h                    |  6 +--
 include/linux/sched/task.h                |  2 +-
 include/linux/start_kernel.h              |  2 +-
 include/linux/suspend.h                   |  4 +-
 35 files changed, 88 insertions(+), 88 deletions(-)

-- 
2.56.1

