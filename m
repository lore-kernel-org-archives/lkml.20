Received: from mail-yx2-f27.google.com (mail-yx2-f27.google.com [74.125.224.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C6235201B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789768403; cv=none; b=TTVZvLSCFP70rqfofOM7rqomfVXb8nMQgoRhmGjxgd7M5ZqQtmKueQJL3FgndfboaUHdrdN7NHPSOag6HAP+yQ9HuL4W45p8BYiohSoh7OS2ITy/KSjzBh0ksBlKRIBFzRxCVPcHJ/Y0nJXBtHsGoOh+pymh7zg8rGoLo9dHsrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789768403; c=relaxed/simple;
	bh=jZQ56S1FiZumeisI0eZTdwzaLBB+eEDhZecGDfTUB7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f8h0EHpPPc/nqPwKtTuKxAEOSRa1bHdjkUwyGPF48MEqFVD30ehyEhd52yW593WVro+3ofS9rzx9xobQnPzo57B7GVu8BK1Mdr2m245IjyxEFAqmyPswMm1L14J0vly3Fzwrf7I7idh21feCbI5zBGNxTev8Cbryc9uDl30dSew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=ePtalg6T; arc=none smtp.client-ip=74.125.224.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="ePtalg6T"
Received: by mail-yx2-f27.google.com with SMTP id 00721157ae682-895fd505832so9807887b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789768401; x=1790373201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DCeNBo6gA5Vwt91BvnJjd9zbeD5TG84V0uDwV5N2aYk=;
        b=ePtalg6TibwOz9PsaVkueCGOwkmlWt5oLHsVtdWDMa/5bHJBfzCmgRWxSv+fLckv2E
         /1ZPB0nS4Bvuj/LRD8MUUt8wExC+UMyCUSpW40jIWCnn93Zc2XFcM7xy7iwLY1+AOlrA
         WcIDO8wEUd+4nr6SQDxXhMSo6S8VU3MVXGic4pkJqhRsgu4mEG5jIcSA62xz4ACFrr4A
         DuCGzCCTQFYEEfQNya0FQdJ4Ma3lS62o9CP8oGn8NRtAeIrWpmFnApkN+EYq6t6QRHtO
         SfxexzYrZUKtVKnR3eBpPY68fLXZKbbpMkf22WQDpb+W42wO7LzAUi6ELppeM7+A9tAt
         QrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768401; x=1790373201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCeNBo6gA5Vwt91BvnJjd9zbeD5TG84V0uDwV5N2aYk=;
        b=XJyGxNnd67JOyRaNDuA72xkjm5pLc29cUKt14iFJBI8dv9HG0Jyw4LCDwYOTJngG8v
         pLb3W4YWkwWvg0Lo52HlHe0yTfTC7zc/mZZ5PuDB5g4BnQSuKND4hw5s0cOczbRh7eJV
         JK/ioWUSTvvypOrvQhGCU0whJ7c/h5ub2Tn3MSKy9enXrdx0HG8sfQ7P0QVTsCwhhicu
         V8YrVBRUwZbkIGAiisP1UV71FMamcyg0hXCWpczYZuW1BFLe6okVKclVorRjUX2le8kC
         zBohWhRQNr3EszAAV1gO39ccdOVV5lYnXyEWltaqeqN/NnBo1ONCdAreK5N8VmDXRqGY
         RdAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxof5mUdzYWW64tfUBBx17MVSGl7UGhPGII8nItIJ4qnAHMC8bbV5JPAevBFP+66BOKjz7mPQ9vyelyS8g=@vger.kernel.org
X-Gm-Message-State: AFuF++mQVhfOJwMDJrRSK+fbMbNQl39TKu26uwHIgH8YgMFv6p64eUky
	P7vgilyL+VbY9R1zVjY3pjeXw416qvTto2g2p+ishzgS3qumGtLX9rJrlfJl2D+EnyY=
X-Gm-Gg: AYBFou0eEHiYd9RjqbC06djgURb9xmsWRIIhVRRruuP8x1viho86ipUPF3Rx71oyG2e
	8XLvtaKMIelEWChzrwbq40wdn3lWDC84Ibb67GUyBETF24olw9OC7X9pq3traJfnq+oUblSc1W/
	BsgxRu06h27dZ74NkBlE0unPbB0aF4cxCYR03zIge3EqbiMDpij6/Wh186cQivJ81SSxoaYEQz5
	uy9kilu022IS84TidAAUDI05WP9B0asuFME0py5iy6zW3b8zejPjKcjQ38njD3pQo0MdBHjUYK9
	UbvTpAzSv7QH+ifDvkpoBqKKcKopSvnKTwgDzKgnFoJDz5geA9QMHbFtzAA7QHoFAd4nbapqauZ
	KFngN4M1CMGuA6LtIyfl0Y5mEb2+7o8lF7BSr+wlvnQfLQqT4VZhTxKtwjIm6Z2m5D15X4AqIRI
	cqG74OOGaYG8rJFqS2GJYSuWV4Z/OjlFC11O6ivZ1V+vcLZ5bTPwmCJgu5QbqvwWOXjaCeZMXB5
	HqU52dwJVt0Yb5uzbQFPByo2c0Q1iEDDpxa+w==
X-Received: by 2002:a05:690c:e0c2:20b0:88c:b280:5434 with SMTP id 00721157ae682-89732475485mr9362117b3.30.1789768400926;
        Fri, 18 Sep 2026 14:53:20 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a45d8fb3csm4017757b3.13.2026.09.18.14.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:53:20 -0700 (PDT)
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
Subject: [PATCH v6 0/8] riscv: optimize mode switch latency for Vector
Date: Fri, 18 Sep 2026 16:51:14 -0500
Message-ID: <20260918215154.2481482-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

This series depends on [1], which is now queued in the KVM RISC-V tree
[2]. For those who prefer git, the series is also available at [3].

Patch summary:
 - New patches: 2
 - Modified patches: 7, 8
 - Unchanged patches: 1, 3, 4, 5, 6

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

[1] [PATCH v5 0/3] RISC-V: KVM: fix vcpu vector context handling
    https://lore.kernel.org/all/20260803215250.824417-1-tchiu@tenstorrent.com/
[2] https://github.com/kvm-riscv/linux/tree/riscv_kvm_next
[3] https://github.com/tchiu-TT/linux/commits/vctxopt/v6/

Andy Chiu (7):
  riscv: do not read csr in vector context switch
  riscv: vector: refactor context switch for kernel-mode vector
  selftest: riscv: test vectorized user copy
  riscv: vector: refactor vector context operations
  riscv: vector: adjust ptrace and signal behavior for INITIAL state
  selftests: riscv: Extend vector tests for sigreturn and ptrace
  riscv: vector: optimize vstate operations

daichengrong (1):
  riscv: clarify vector state semantics on syscall and context switch

 .../admin-guide/kernel-parameters.txt         |  13 ++
 arch/riscv/include/asm/alternative-macros.h   |   6 +
 arch/riscv/include/asm/alternative.h          |   3 -
 arch/riscv/include/asm/cpufeature-macros.h    |  12 +-
 arch/riscv/include/asm/kvm_vcpu_vector.h      |   8 +-
 arch/riscv/include/asm/vector.h               |  78 ++++---
 arch/riscv/kernel/cpufeature.c                |  19 ++
 arch/riscv/kernel/entry.S                     |  15 +-
 arch/riscv/kernel/kernel_mode_vector.c        |  13 +-
 arch/riscv/kernel/process.c                   |   3 +
 arch/riscv/kernel/ptrace.c                    |  13 +-
 arch/riscv/kernel/signal.c                    |  11 +-
 arch/riscv/kernel/vector.c                    |  56 ++++-
 arch/riscv/kvm/vcpu.c                         |   2 +-
 arch/riscv/kvm/vcpu_vector.c                  |   6 +-
 .../selftests/riscv/sigreturn/sigreturn.c     |  69 ++++++
 tools/testing/selftests/riscv/vector/Makefile |   6 +-
 .../selftests/riscv/vector/v_uaccess_stress.c | 221 ++++++++++++++++++
 .../selftests/riscv/vector/vstate_ptrace.c    | 111 ++++++++-
 19 files changed, 598 insertions(+), 67 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/vector/v_uaccess_stress.c


base-commit: c93809c637bd1fb1e0d0f0168b53cfe1c4767d21
-- 
2.43.0

