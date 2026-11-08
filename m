Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794135902;
	b=Kgf0uZoi8w5ntb9HNh5Kq45MZbXA2MecTXo9A0XpWGhbx+B/o4oUj2PlDxXK6OCqVPjC
	 6/LFdKsHjc12+me5mvZScc/OtIzvDK8xmoTP1cI9zFGQ8TAOKMtCDvkhrTM43+uRR2/Zs
	 t8E+cBS9ye4cU9dw9BCmU9v1NjR9BTxjjuRNQqPRJt9UnLMxJHC8c/mtNdNa4yFE/SHvr
	 /ckzWFNnjuJcaLDm+86PZs1aZMDO5YMhtzam1w/lQyWY/X1VBPiajzd4tMQesuZUfCsX4
	 aL7z/B/qUb6wHXtsY4e3TVeYl/zCmzG7cK5fbovER9WY1tofxLvmkm9/kZYmo6Kn9WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794135902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KKnJ5ofY6xI7mGRCSoUHzG0stJCP5GNAGXYvslrLiuU=;
	b=eJ1j3kCkUdb4ED8Hn0gSaZXlmgwTBzbbqc0eFzLLZy3glFJU/4C/XQJM6xj3YhU2531U
	 0bjZ8C9QgBnPchYX4DgRIvNS+jyOkOPdFWm4kb2E0l2g4IeuHRFfTRyEH4P2cMtSAT7XV
	 WQKYun2rse+L1r+JKeKy2epNluij/SIiZBxSKCRkIYBkz1QsplDxWczs76r2f0Kfm/RnL
	 6H3c88mTLB80fLsmMcEUXK0QNy8A4kPqCsQ56XnR5m2adDeM/VpqLbyUS6xenQHsxrmrb
	 Q4RjQhI2atsXd8nqSWEQTp9Pd2wtCvzhlil3oYNIPQwYxY3Mbuz1ovVWfmJEVRB0PxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TYk0twXn;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901A5606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 901A5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TYk0twXn
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso17333a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794135901; x=1794740701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KKnJ5ofY6xI7mGRCSoUHzG0stJCP5GNAGXYvslrLiuU=;
        b=TYk0twXnCSyTPPkgKg6USfYbziaCIK3cHS/cA/JvC7apL4Vzd7htNNdmlrFNMyFOsJ
         QOMpQlBz4gBOtFwLMvHIRpiz5RzuMFoVUq14Hd/SRiz0BvaqyxGgn9JZwnTwKzwBhQxq
         1qudGUWe+mAvLfoRXLgzUFKVTa2DpG7f7E53yZSnbWVuSkJ6P3GfSG5hvrJiHbgTMS6k
         gTXX+UbRhDrdm1uWKkNLqnks842dBShSbnNgkzvAoKVekSirWF5q1z1nOWwx9IwzSnHJ
         ncNGS/ASQkMq/I24P+pGdNRr1SWDOfvc4rtbg3xyLWYAp7GR/HPESpjB+bRj9f+WIlU9
         LIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794135901; x=1794740701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KKnJ5ofY6xI7mGRCSoUHzG0stJCP5GNAGXYvslrLiuU=;
        b=Y+Ns/j+g+LyEakvy/8qGJqD/JKWxJ2lvTmiNZiOCwmrhGWe2Wacu6RoHhSi6gZUB5c
         P8O2Ut5G06cv3nxf2hAKqL9svh8cjuQy3V3s4Ld8eyeiRT/8nO4OxAJvcx4vE8OCXicB
         fujcSND9fOF/7RROOJVg3MEURketA3eL5qciPftjbFvssUkJp6FJ7KAU76uP+SDje8+8
         b39gydQnvT4hTspbATxoYIPNf0lW2dwBGJeYHGvuEjIJenzRcoRhngOYS0779brUbzkC
         vGNGN7XFcRq10+KWkYu0duACc9GYGPZlHqY83cihFiHj8rRRRSdraPpJP+FaeKjGQSBL
         Fb/Q==
X-Forwarded-Encrypted: i=1; AL+hErGO893Y0SanktmPeQyrUUwjeb/c50YxI4nXjMv6iI0aSuxdkqpE8Tu7XX17pCNeDk0kwcjfdRtfUNXnOOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z97aNAT+t16cmGd+Pr4yD34NXr3xyzDt7KGsuJPmsxoI7TRdyPw
	j1KnodpWb04UFfRRcf6cwtrsmNZaB+xJIlhNahwjek1FooDm53x2wikvfROGdb+ppYw=
X-Gm-Gg: AYBFou1S9d8DdDmSy4Y+Z1ZfeIMwhpX6u20MwSheZ78e/xwwh4OPM7PFAUslYICIpGn
	62gYxD/Oh8in9eyqzyvO3iTJMbrxGxA5Jn3Vy8xor9j9a6Ru7Nh98E2E/lBFvBZDZ5yZMy0fzD4
	OhatcKElEGQHZ7INoEPJWmh3BpexY/fLYJHLpRHDN3MYvDlOodMBS4pwJgGvsrvHmB0K9d0GCkw
	lGzku9fSfFwoElZaJFzWXk22ZaTmA9MldMtRMIpYcaYNnd0ZTXx4vnS4rtYvLYQMpdv811RfTZB
	3rZRQT3BCn0doo64puts1uejRu8hV740yp4JTRe8RCAnECcdjuox9XAkwYyX7YZfCx6vNIXHLub
	9XuQXxOXrGUiYe3kkBuAEiimtKXR+16skQ6ub3zYDz8ZgIqBXCykeJ4Z4YvqviIWO7GyD6t/0gI
	lgDg2BaWkx6whGBwhr1QwGmnidTCJRf6kbXJ+U4x9clFubjQZ6ojqFQ0r9JcxlnOvyfgG28CRxN
	X9cLk3TcPDUUXPSjSA+vZ5Crm/qHMp18SSTj6ri4MUHn3HVj0oHTGGQttxiUZ9wefBl/BM3WyPX
	zHV0c115zaG38oqoEVZZorgFVG3ZDMj939yVPoMftvWZJXha8IqqJ19bXTyIJis=
X-Received: by 2002:a17:90b:554f:b0:3a8:10e2:ad08 with SMTP id 98e67ed59e1d1-3b12d51f0b3mr872216a91.48.1794135900776;
        Sun, 08 Nov 2026 03:05:00 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278918f4sm2609818a91.6.2026.11.08.03.04.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 03:04:59 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	conor.dooley@microchip.com,
	tglx@kernel.org,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev,
	dave@stgolabs.net,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	broonie@kernel.org,
	cuiyunhui@bytedance.com
Subject: [PATCH v9 0/3] riscv: optimize percpu access
Date: Sun,  8 Nov 2026 19:04:03 +0800
Message-Id: <20261108110406.97495-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
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

RISC-V has no asm/percpu.h, so this_cpu_*() read-modify-write
operations use generic fallbacks that disable local interrupts. Per-CPU
addressing also derives the current offset from the CPU number and
__per_cpu_offset[].

Implement RISC-V-specific this_cpu operations using relaxed AMOs with
preemption disabled. Native-width read-modify-write operations use AMOs,
while 8-bit and 16-bit read-modify-write operations use Zabha when
available or a local 32-bit LR/SC sequence otherwise. Cache the current
per-CPU offset in thread_info, keep it valid across CPU bringup, hotplug
and context switches, and select HAVE_CMPXCHG_LOCAL so vmstat and percpu
counters can use the this_cpu_try_cmpxchg() fast path.

On a SiFive P550, Davidlohr Bueso measured about 15-20% lower
this_cpu_inc() cost in an ad-hoc microbenchmark.

Changes since v8:

- Drop the PIO helper patch, which has already been merged.
- Rename the first patch and update its changelog as suggested by
  Davidlohr Bueso.
- Use value-returning AMOs instead of rd=x0 for CPU-local operations.
- Remove unnecessary memory clobbers from the new relaxed AMO and LR/SC
  code.
- Use .option arch,+zabha for the Zabha inline asm, matching the
  existing RISC-V cmpxchg implementation.
- Isolate arch_cmpxchg_relaxed() behind typed always-inline helpers to
  avoid macro variable capture while preserving atomic instrumentation.
- Make the cmpxchg128 fallback use the already resolved per-CPU pointer,
  avoiding the same macro variable capture.
- Copy the cached per-CPU offset from prev to next during context switch,
  as suggested by Thomas Gleixner.
- Initialize secondary idle tasks in the common startup path, covering
  parallel bringup and CPU hotplug, and remove the duplicate initialization
  from smp_callin(), as reported by Sashiko.
- Select HAVE_CMPXCHG_LOCAL in a separate patch.

Yunhui Cui (3):
  riscv: implement this_cpu operations
  riscv: store percpu offset into thread_info
  riscv: select HAVE_CMPXCHG_LOCAL

 arch/riscv/Kconfig                   |   1 +
 arch/riscv/include/asm/asm.h         |   6 +-
 arch/riscv/include/asm/percpu.h      | 574 +++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h   |   9 +
 arch/riscv/include/asm/thread_info.h |   3 +-
 arch/riscv/kernel/asm-offsets.c      |   2 +-
 arch/riscv/kernel/smpboot.c          |  10 +-
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 8 files changed, 598 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.39.5

