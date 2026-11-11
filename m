Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423650;
	b=LLKUVvO0WZ4j+g157QRLXfDl1RHCWedMEeKAtjdStcYUm9JXaLihl2JsIfzNf6qfcW4+
	 5Ase3ux4zNN2wFx536Kzc+b55hoqIiKUWBBX6xF7h4sm9jztV0kulI2e2WJvIRqIWNOx1
	 BmGlGLahGsIFyMQhNrX9DNGr7WlyTVWoH/Q0J5blQCs0T12kppOV+Eke4XHOMAdDMEjnI
	 5UOuTtw+TCClphJh10N6m6KbchA3wevIQ1UiMHOwyBqgQaaEWe0M66dTjo+C/IpJX/vPg
	 MD902ofTGDqKwWxLKTLEFOQ2aBU1oNsKesUAuG6B67RznDRyuCJoB8y5S9HV+Dp73gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KLrwOHZ1vOGAPfvTBTgw9NT45opR0v5Or24JcyLWJp0=;
	b=rSst36Pz/pUHWCBEh6RER7Tn7AI8qpybI7kPsjvj6X0oOCJSzXgG6sayLcsGSuU6jzwg
	 1oLZ4e0MN+pQvu6QwuhcPUts/LOo5sh02n3RPnaYmKlZSYmiLFiYEhhtwYiLBRA24vv1u
	 G/Pm9gHm1hWiE0EiADbCMgAOnYqgOzq7iMI33ATax5pozfRT2DjJUgF4o2oxUlPs2ZGKY
	 FbIvZn93HtLBrlMBC3GNPtNWLEHhgB+gvsTXLy29ARXWJVYeY89h4ghymbnWn3eWeIUY4
	 KFRhdcctwdj+0+xX5DVNhpgDYa/Ys7vRin6wBju7PiBP4ai4zE4G/OzWJqQNFg9bT9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=Bv2c9Vx2;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38121606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38121606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=Bv2c9Vx2
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67be6030c9fso3090571d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1794423649; x=1795028449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KLrwOHZ1vOGAPfvTBTgw9NT45opR0v5Or24JcyLWJp0=;
        b=Bv2c9Vx2UaaL/W8/RwE5ZlL0jnzYgzDL1l/3Q3jVeM7OoD2TvkTOy2dkk5FVmky4Ra
         wtYMUBc14bJxkbGRBmK785eA2bMfZPzS4tXQDJnzg7Z9UfXDq3kwUsZNSLZQC603mpQW
         QQMrmpuYVf1tPcs6UZFItSjUYmI8PgNKRkDHhirUPbkLzotSInBYr+t6nmM7JVrWSwxQ
         vGLhfIiPEpBBv7Y1yWfExp7R0E5U9ujM4dar7KDt71du7Yu9JJt8c5aJaPWAPxFACTX5
         ucm7d2FpBU7nRRxiyTNqx9Jt69D1uSaIEsbeX4Z2JoTkMAAx6x+t4Fnfa0Xi7xJmi1YI
         KcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423649; x=1795028449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLrwOHZ1vOGAPfvTBTgw9NT45opR0v5Or24JcyLWJp0=;
        b=K3yf4ITL1Bs1937ErvQHtzt3HwgC6hMryKjl2jBMI7DtF7yHy+8EFfXDrITrM9B/Lv
         w1zuBtamsEW5K/WBi1fgLGhkOR3TlR4fyWtE1oluEEYCWNLioDWR6dpAvLJJcmrbS0cq
         8axrrWEIs83POG/gRungdlPrzi6GoGaE2wN6F+4qLnNEHd+a1Z6Ku3mRdEU3HsMwU42w
         VKZRJAlHRsjOzDDK1xZ0kwsQhLpXdFIfJ+2j8vC8BNLZ1u9iC7KUEkF5+klEyz+4Caot
         q3C8HGrE9DUUedKpuO3be7INdtulpkWuUQNoYvJHNJgnpKt8Sk0Y8tjr+8LY3ed0uhYn
         qLdQ==
X-Forwarded-Encrypted: i=1; AL+hErFquARDkHk/nKL7o5Mj3un55I66KNcg5+9migJOKDJZ7Rup0lHiozKppEckqsYcVjVFGdwFDUMxzQc//Sk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GYhd+Vx1O2Acl0yOjhFwc438wcSJGK9lxsZqJve5rheMXxRTk
	/TM8EQpC+Afa0T+kAnXDDewipnooJCdbl0tZXbMcUyiZ2K8x2chIT51LwksNTGE/Blo=
X-Gm-Gg: AYBFou3rbIKI1BkPjRp4kwaYIgzxcYd2p2fguWPY4gs+t2nPwV07rdac6x9qfc+xGoW
	C4ghtBHRCxoBq+UFdlHhd/4uakGln21U7gc4LbNGq8pKQ/GL4axT7vH4MRndiSFXc5wRUDYAbjF
	5Xe49snuTgGB6iScfGN9vuYWJtGJ/SVjg+qK161FJPFP3ylmjtD81wKWcRkajMHYVMNs+AlRKbf
	mINPlAkDQrevRWXxgWlcFBgJDcC0qFBdb5KfzxU9nXN8pcikKbxzMX40PGPt7bGumKrkNSS7jUK
	kuSiBcQzABL9abPeEaQEK/gkqiR0x1yM2PRcrSGW9tH4qOEmOL5a8u2lpvDeulRAa+6iuEw1LOE
	GcvmMxNm+ZzoCwTF5tyj+IBTajSbDTumFnxNO4WRTtHXPcUkw9pN/cQc1bqqFmB5YwbWUtGPd4Y
	aT/9i8q94796CLOPRnr6h4eWapnpD1yWzqkXD5ZrdhwuS68nOBVpC6skMawoMY5jqzDr/QyETw9
	MXuAhlspPUW/WLedPySib07pXSaPcJfrbwPphicjdMu1u08OMAFL9jN8DgpQltfa7c1xH61/4wv
	qxHQ1FfBZ4cAijzm0ja3wKAEwx7Tfz1BqEwiI2pV8Cx3w/m1hEAUqOE1rkkSYsigZA81tLDbuiM
	/P6HnE8vTI4JOxudLjsDzbyyNplIj4bD5l5uIiWyHPI6UvyYFMYz0epdIMyJLFFdrJ4co
X-Received: by 2002:a05:690e:11c1:b0:67b:eb7a:e62a with SMTP id 956f58d0204a3-67c67a48a3amr2377800d50.0.1794423648748;
        Wed, 11 Nov 2026 11:00:48 -0800 (PST)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm5209197d50.6.2026.11.11.11.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:00:48 -0800 (PST)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: [PATCH v7 0/6] riscv: optimize mode switch latency for Vector
Date: Wed, 11 Nov 2026 12:43:22 -0600
Message-ID: <20261111184359.1239821-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
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

This series provide several optimizations targeting system call latency
regarding vector context management. Before the series, the kernel
handled user's vector context in an conservative way, where registers
were null out and VS is tracked as DIRTY. This introduce excess context
saving and restoring when there is a context swicth.  Also, the kernel
turned off Vector at the exception entry, making all in-kernel vector
usecase take the serialization cost, which includes context switch and
user copies. The cost is not easy to hide as vector code are usually sit
right after enabling V.

Since vector register are set to a known state at syscall exit, the
series set VS to INIT at syscall entry and null out the vector register
at the exit, skipping unnecessary saves and restores. The series also
introduce riscv_novstateopt, when unset, enables vector in the kernel
mode, and do not perform register nulling on the syscall fast path,
where there is no context switch or kernel-mode vector during the
syscall.

With the whole series, nginx request throughput vs base on a four-core
Ascalon-S, by served page size (* = statistically distinct):

       86B     1KB     2KB     4KB     8KB     16KB    32KB
  v5   +0.79%* +1.36%* +2.33%* +2.02%* +0.14%  +0.93%  +2.42%*
  v6   +0.33%* -0.23%  +2.88%* +2.19%* +1.02%  +1.14%  +1.40%*

This series depends on [1], which is now queued in the
linux-riscv/fixes. For those who prefer git, the series is also available
at [3].

Patch summary:
 - New patches: 2, 6
 - Modified patches: 3
 - Unchanged patches: 1, 4, 5

Changelog v7:
 - Resend the series based on unmerged patches from v6
 - Rearange patches so that it does not introduce bug mid-series (2,3)
 - Add a KVM patch that skips duplicate context operations on host vector
   context (6)

Changelog v6:
 - Refactor the context switch of preemptible kernel-mode vector (2)
 - Address checkpatch warnings by reformatting patch 7
 - Drive the optimization with an alternative instead of
   CONFIG_RISCV_VSTATE_OPT, enable it by default (8)
 - Link to v5: https://lore.kernel.org/all/20260810172255.1532787-1-tchiu@tenstorrent.com/

Changelog v5:
 - Rebase on top of the kvm fix
 - Do not read sstatus in vector context swicth (1)
 - Add a test for vectorized user copy (2)
 - Enable vector in the kernel-mode and skip nulling at syscall fast
   path, gurad the optimization in a new config (7)
 - Link to v4: https://patchwork.kernel.org/project/linux-riscv/cover/20260528190927.886558-1-tchiu@tenstorrent.com/

Changelog v4:
 - Fix a build warning (1)
 - Prevent setting INIT when it is already and provide performance
   meassurements (2)
 - Address comments from sashiko (4)
 - Link to v3: https://lore.kernel.org/all/20260521162521.188629-1-tchiu@tenstorrent.com/

Changelog v3:
 - Refactor function names. (1, 2)
 - Merge daichengrong's patch, with a fix and optimzation. (2)
 - Fix ptrace GETREGSET failure. (3)
 - Strengthen ptrace SETREGSET semantics and add a test to cover it. (3,
   4)
 - Fix a potential ABI break in signal and add a test to prevent future
   breaks. (3, 4)
 - Link to v2: https://lore.kernel.org/linux-riscv/20260402043414.2421916-1-andybnac@gmail.com/

Changelog v2: rebase on top of for-next

[1] https://patch.msgid.link/20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com
[3] https://github.com/tchiu-TT/linux/commits/vctxopt/v7/

Andy Chiu (5):
  riscv: vector: refactor vector context operations
  riscv: introduce riscv_v_ucontext_save() for signal and ptrace
  selftests: riscv: Extend vector tests for sigreturn and ptrace
  riscv: vector: optimize vstate operations
  riscv: KVM: do not save host vector context for vcpu

daichengrong (1):
  riscv: clarify vector state semantics on syscall and context switch

 .../admin-guide/kernel-parameters.txt         |  13 ++
 arch/riscv/include/asm/alternative-macros.h   |   6 +
 arch/riscv/include/asm/alternative.h          |   3 -
 arch/riscv/include/asm/cpufeature-macros.h    |   6 +-
 arch/riscv/include/asm/kvm_vcpu_vector.h      |  17 ++-
 arch/riscv/include/asm/vector.h               |  68 +++++++----
 arch/riscv/kernel/cpufeature.c                |  18 +++
 arch/riscv/kernel/entry.S                     |  15 ++-
 arch/riscv/kernel/kernel_mode_vector.c        |   4 +
 arch/riscv/kernel/process.c                   |   3 +
 arch/riscv/kernel/ptrace.c                    |  13 +-
 arch/riscv/kernel/signal.c                    |  11 +-
 arch/riscv/kernel/vector.c                    |  56 ++++++++-
 arch/riscv/kvm/vcpu.c                         |   5 +-
 arch/riscv/kvm/vcpu_vector.c                  |  22 +---
 .../selftests/riscv/sigreturn/sigreturn.c     |  71 +++++++++++
 .../selftests/riscv/vector/vstate_ptrace.c    | 111 +++++++++++++++++-
 17 files changed, 364 insertions(+), 78 deletions(-)


base-commit: d1a8d411533d6be16ac79796c02a9bfc7d7958f1
-- 
2.43.0

