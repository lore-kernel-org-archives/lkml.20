Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B260484880
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989257; cv=none; b=mNQ/rsNVEmD2TDgyxvhTGSv1IO8BY/Ifw7YfSMBZFYHmGinKQnk30maqMt7un28BC7X5+XNus97fN5qJfD+9JmAKk2sh16QhAg76MkZQnCNs2XzivWBdp1d1AoaRl535NPZfo4ZziTCTR46Ql8yvglCedQqSh3cZaNWno3UmGu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989257; c=relaxed/simple;
	bh=f30g0q6yku3eG2UiV5UtoYnqdcvLIj+EA/KgUAXGS5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hjifkl2ruffs0hIGBjldjMrCBOacnp8yULMunKxCDMUydmgmxbq98mXK5ALQDSc2zrPk6W21OCY3++TQcFi8TJG8AKJsFFpLKRhhJvj0+59mQhV/w32Ue5Z//8Wrkd1f8T5X1i6Y0K6njkFF+eNIu2XjPRzJc+cO5CgQQMcj0mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FB2ymOaY; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FB2ymOaY"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea50dc0so1159981a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989255; x=1790594055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHUJIBm2U4V64OwaSBxvcTjq0/clFqcHASwuFrVtamA=;
        b=FB2ymOaYgG3hTfapjijc8W18qRXNQXgqmGlqW12pV2Mloy6dkEX/Bd+OMOcPTfi7AL
         IrJNIJSdbnmKceYIBrWdNVLHePP68R4TlJxCWd+ZO0Bf0lQgjw21JUZOU6au6G/dI5OC
         wxPbKzNHSXgvg5kZohQb/vZi9pgTB0kbCaFXDN8MZzltc9sPXhpxaX3Ua6gy27kQBYEs
         9kot9J/+FblbY3n0pMhnE9zPRRVXSCWNKpThLI0AC118tUh0l4mYNav8Lt4vhoklcjok
         9yZySyfjThUkjqxMVwRqnF4i1qiZKfHB4rH+xM8+sbEVUy8/Nw7e10x/UK8QgfbwXMQ1
         nFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989255; x=1790594055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHUJIBm2U4V64OwaSBxvcTjq0/clFqcHASwuFrVtamA=;
        b=wJOHLtR6xyKQehSVVhtsi0x27Q+BqGdiaGQHwU+yjgtGXs79PLs0GbjCYJgx/nB7Rm
         Uob6+MJBOmfDy1JWyYiIsJjhlqvZfT6/hvVTs1fuL80gs3+OCbAEJs/3JjM2ZTqwxF+c
         ZsxOsLUUF41M1WV60L8dHJnkk+f63gi3JljXn/g2Yw1d5eVn7uVt/+8Ixhr3YM9dIMp1
         pFEwOdI4EyiFHLiLibIrcV14YW3Ao64vVI7nFCxTIy9Bl1xFd2K86kGKYeUaH7PYjL7p
         RINkDMreDspPgpYn1ht+y7DlFTde8SK0L7v6wo2lsEPVUMNqJPaEigBMdlPx2II6M1fJ
         gWeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqr1GW9ZG/GUE6SDPy87Gd4iqpRPcFyhaIFm+yn+mM94u9TlmswwBs6M2Lm8vFSWygEmUYgLCngTWEuqU=@vger.kernel.org
X-Gm-Message-State: AFuF++kfMlEAuapyrBr+rAIhpi6wsGzk7lodJLzzVRTnABKdIu3DqA5r
	kLJh5/xU5L5QpT8FIF9lSAOrQG9uMcVSZI3vE4Iws6G3VbonJQzLVO9A
X-Gm-Gg: AYBFou0+KxNbH5Bg9RA0SUyFm0+1FOyyd2MX3wdHIhX3lJ6dNi5QhFlZfVHMC5CygSh
	qvZOyerTRn6UPPiE3CKkGVGKZZXBYsG9qdhu8RTDhM9+n4ompKYMFw7Ng4b4QQAjm9jGt0soFQ5
	HnoU1jSfWOGrIH5ccrkP8UBBpLfc1TbQpNfJa2rdYYzHAZtYU2GDEc97/h6MfEinapHzzCXtfYi
	0fRWFWYglPhXljz5F8NopvkAGF9Ghm9m9vurzMXMVmot4gUGLkRm0q+hj7+tqfCndMqdQZlW6qM
	YA1oeMFEEIH32VdV/17TznKBmF3osLSlQk8tp2XSzYu8DKLyavYr7J57lVSuSJnAC3ZfCAkDbse
	nPUKEqB2lvTNp3GQysjvTXlOLg5HjUAav5A6cqqej4Q+6vDVTNCunNxzlfhUG3EkLMSQ1o4oA5I
	QlPvueTjbZy8Ooahudy2tRpYT3c7jOQxUYggK0X7F3ATIMtiU7c/lrdPZrQvWLeMciXB91v1knF
	yHQfYg2jWDKuNnxognHxA==
X-Received: by 2002:a17:90b:2d0c:b0:39e:6c6a:4b77 with SMTP id 98e67ed59e1d1-39e6c6a5492mr9909928a91.65.1789989255197;
        Mon, 21 Sep 2026 04:14:15 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm13438703a91.0.2026.09.21.04.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:14:14 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jinyu Tang <tjytimi@163.com>,
	Wang Yechao <wang.yechao255@zte.com.cn>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 0/5] KVM: riscv: Age G-stage PTEs locklessly
Date: Mon, 21 Sep 2026 20:13:57 +0900
Message-ID: <20260921111402.120911-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Aging G-stage PTEs currently runs with mmu_lock held for write, taken
by the common MMU notifier code. When MGLRU or kswapd ages a large
range, every vCPU taking a G-stage fault blocks on the lock, and the
dirty-logging read-side fast path blocks behind aging as well.

This series lets RISC-V select KVM_MMU_LOCKLESS_AGING, so G-stage
aging can run without mmu_lock while protecting page-table walks with
RCU.

  1. Age all G-stage PTEs in a GFN range
     Bug fix, posted separately [1] and included unchanged so the
     series applies on riscv_kvm_queue. Drop it if already applied.

  2. Read G-stage PTEs once when walking page tables
     A lockless walker must derive presence, leaf-ness and the child
     address from a single snapshot of each entry.

  3. Write-protect G-stage PTEs atomically
     Aging will clear the Accessed bit without mmu_lock; the plain
     read-modify-write in GSTAGE_OP_WP could clobber that update.

  4. Free G-stage page tables after an RCU grace period
     Table pages and the root outlive any RCU reader. Root teardown
     keeps pgd_levels intact so a walker holding the old root sees
     consistent metadata.

  5. Age G-stage PTEs locklessly
     Select KVM_MMU_LOCKLESS_AGING and walk under rcu_read_lock().

This builds on Jinyu Tang's rwlock and cmpxchg helpers already in
riscv_kvm_queue. Wang Yechao's huge page recovery series [2] adds a
second page-table free site in kvm_riscv_gstage_recover_huge();
whichever lands second will need to switch that put_page() to
gstage_free_page_table(). I can rebase the series as needed.

A possible follow-up is to run clear-dirty-log and the general fault
path under the read side of mmu_lock, as arm64 and x86 do. Patch 3
provides the atomic write-protection needed for the former.

Testing
-------
QEMU virt, -cpu rv64,h=true (Svadu), 4 vCPUs, TCG. The host kernel
was built with KASAN, PROVE_LOCKING, PROVE_RCU, LOCK_STAT and LRU_GEN.

After each patch:
  - dirty_log_perf_test -v 2 -b 256M -i 3
  - access_tracking_perf_test -v 2 -b 256M -s anonymous_thp
    (2M THP disabled and 64K mTHP enabled)
  - 20 VM create/destroy iterations

With MGLRU aging forced on the VM's cgroup every 50-100ms:
  - dirty_log_perf_test -v 3 -b 256M -i 3
  - 30 VM create/destroy iterations

With CONFIG_KVM=m, 5 module load/unload cycles, each with a VM created
and destroyed immediately before module unload, to exercise module
teardown after queuing RCU frees.

No WARN, KASAN, lockdep or RCU reports were observed. The kvm_age_hva
tracepoint recorded approximately 65k events per aging pass.

Performance results from dirty_log_perf_test -v 3 -b 256M -i 3, with
lock_stat enabled for mmu_lock and 86 aging passes:

                           no aging          aging
                         before  after     before   after
  guest dirty time       12.5s   12.4s     18.6s    16.7s
  mmu_lock W wait total  0.15s   0.17s     44.4s    0.15s
  mmu_lock W contentions  35k     35k      1.0M     30k
  mmu_lock R wait total   0       0        7.5s     0

Before the series, 93% of write-lock waiters were from
kvm_mmu_notifier_clear_young(), and the dirty-log read-side fast path
waited for mmu_lock 352k times. After the series, aging does not
acquire mmu_lock.

Absolute numbers are inflated by TCG; only the relative change is
meaningful. Under TCG, the atomic write-protect change in patch 3
increased the clear-dirty-log time from approximately 16ms to 30ms,
as TCG serialises AMO instructions; hardware numbers would be welcome.

[1] https://lore.kernel.org/all/20260918072622.284188-1-suunj1331@gmail.com/
[2] https://lore.kernel.org/kvm-riscv/20260914055936.3672758-1-wang.yechao255@zte.com.cn/

SeungJu Cheon (5):
  KVM: riscv: Age all G-stage PTEs in a GFN range
  KVM: riscv: Read G-stage PTEs once when walking page tables
  KVM: riscv: Write-protect G-stage PTEs atomically
  KVM: riscv: Free G-stage page tables after an RCU grace period
  KVM: riscv: Age G-stage PTEs locklessly

 arch/riscv/include/asm/kvm_gstage.h |   4 +-
 arch/riscv/kvm/Kconfig              |   1 +
 arch/riscv/kvm/gstage.c             | 111 +++++++++++++++++++++-------
 arch/riscv/kvm/main.c               |   3 +
 arch/riscv/kvm/mmu.c                |  56 +++++++-------
 5 files changed, 117 insertions(+), 58 deletions(-)


base-commit: 41e81f7e3ef96594fb840445343c0ee7723aa550
-- 
2.52.0

