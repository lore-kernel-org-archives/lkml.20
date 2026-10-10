Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D2C3624BF
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791643589; cv=none; b=E8za/j7hsECCQz+dGfkLJarH3H2dmOwZXvD8kbG6H9XH9D46OAmFQA5bI1qWWn5wY/qb3IpNoruNbUUDl9U/kTjBMDYJaafay0c599YadI9dJCYj6gNR94wKqDBV2a4ISLISUh81AX/Qa0q1Y6mO8C0shiBISQYHBpDRVWJdxaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791643589; c=relaxed/simple;
	bh=PE2B59UPOOadlBtkwWqdcd7RJKl6bWXi8RccVpdLBAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gGbefUY3dEzwg/EBCGYDB/2d+PtsOncU6mz41c0kkWJM+xaJkXB89i4T/u56QIQ1QIUwJ40prU9UNG97sM9ZfbymGbOOLc6QAQqXPmHZlqFvL6bMMTtIH6TVhecTVRzQy6ZRZtxqPzwvJpwWH+evF2hdI0MHu+tPzuLOPueqT+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGeZefW0; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGeZefW0"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6acbdbc1725so774240a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791643585; x=1792248385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q5dm3ALJVygTFo9c7172OSMAeNo9NnOOsjkf8BQg0Bw=;
        b=TGeZefW03+ogtcPX+UMc3iULRr8Xd/z1tgzepvzdoEOhsjySrEBcZoRdJrnpSePZ2E
         9mW9T/wtEdwBYFlfUXTkPFSdP4fOyIOpE0W9zZmSHi6UfD8VcD22CXbXiNajKPiMKJ9X
         Oai8ZXFRSpIwk2nyDdWpOSuzJhkZlBcoDelWgxfDCn4h5//blDeUJlkxCAlnXPwsR/Ak
         dMAi7B3D4arqYPlg8ejj5F+7VxSBOBFKyWD1OSnzGj3MTDbiEkCQv2xnJI3eV2j+MZ8A
         TYDV5OxwMeF0kPyKVdegx9oP/IRpq8Xney1YpcdzK6av6YMqFe8inF7/cHrUpD2F2NQJ
         7ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791643585; x=1792248385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q5dm3ALJVygTFo9c7172OSMAeNo9NnOOsjkf8BQg0Bw=;
        b=V0wvoF3z6Rf+jeuAESMC+7QCFchbIhKp6yT5U+7fH4Vi9DVkHy59LWa//oqfLwDR5f
         XFHsnhHJN6pefbQrIDzBE/29kWUAtFOSSMMBlO7xC5h7BrEl0XnCYVU2Oq60447v9fTQ
         IjjT81J79RPMqlQ6XFD6of2V65oKkoI1WZzSERrVf+huAKdZdbciiRE5u7EkXctCRwAE
         gSZ3Qe8b18r9cwOxwfYp98eQTOunFo5W8S86mo8bdPLON0NXf1MOcEwnh7uIshXC+XnH
         Kndb90v9QFCzPlnYIGgUrAS8at0cDPjV3Yv2LFPAkG7wMfsn6LfVt0rr8XKkgh0VR4ej
         w3iQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2vZHRREBUHEPcoPfs6ExymnYJJ9QTl6ROweLNBeaKKclO9DHcSmEHtizaJrhXj/TXMEwbb7Rt+ncKGLo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvXNAdekUlDIM/UjYJQhv+OJGGm+EgPOWuSaqm+gWFUnitWUL6
	a9NXNwq04U1yiKRhnm7J9yonviJRoF0MAJ6IvDMVdRvsW4GoyA3Gx0XI
X-Gm-Gg: AYBFou2gxvA1lAvsoi96z4M0HrTTNTKGkhmYk8hyUoTpneVzqvZi+SjHGtbgW5YOZFu
	3r2oTGCE3QUK0cmqWumG/XHEx90FsSFSEgEM6/ehynoKWPMZRGpFG4s6gKCFFqY+kS4oXVGfl/N
	KsTZ1WDG5H6cNHKHo2NqmJ3B8sZDBKKxM0JXYDnvvs0yEBuGoJWP6rZ6c7cSahbEm5G2TjD6zT/
	/WK7/L7ZWad56KYUSZdKH5njxDLVP5BsE6RMbSNdsZn2ymA3Ws0mBmsyLx7KLo5j6qfusVVeWVi
	rGkGMA70DXdEko6XDzXhZk7W3x5o0Iv3M/tEYFv+cxE8VSgJBYRuiCYpgXjQPA9b5FXXrk9MpKf
	eTHYDrO8RCfBNvD5Lqs6kXzpQ5/NWTuNxiOesPpBhUjWcCFlX0M2Np4Yk350aQowt5p86W2k9ua
	MPsv7T97XzvkTz/zBk8srqhj9MG42DrurC3fDVx+nMnPGNgPcSRQngsK5XSPKeAuWEpABq0f3KU
	M8hplyjcu+sNbuWBp8PYisR9y6lp5fZ6mXji8Pk
X-Received: by 2002:a17:906:f59f:b0:c31:7495:e57 with SMTP id a640c23a62f3a-c31aa0dc6b5mr491518266b.44.1791643585086;
        Sat, 10 Oct 2026 07:46:25 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9767227sm247286566b.11.2026.10.10.07.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:46:24 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v4 0/2] alpha: complete the direct-mm shootdown fixes
Date: Sat, 10 Oct 2026 16:33:09 +0200
Message-ID: <20261010144621.974850-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the second of two series. Apply all eight patches of "alpha: fix
stale TLB translations breaking copy-on-write and writeback" v4 first,
then these two patches. The base-commit and prerequisite-patch-id lines
below describe that ordering from for-next at 33465f6ab697.

Patch 1 removes the remote context-clearing loop after the migration
shootdown rendezvous. The callbacks have already updated their own slots;
clearing them remotely can hide a CPU still running the mm.

Patch 2 fixes the mm_users <= 1 shootdown shortcut. A kthread_use_mm()
borrower takes mmgrab(), not mmget(), so mm_users does not count it.
Inspect remote context slots instead of clearing them, and skip IPIs
only when no other CPU has a context. Together the two patches remove
runtime remote writes to those slots.

The full-mm, icache and migration callbacks now test current->mm, like
the page-flush IPI handler. A CPU retaining the mm only lazily clears its
slot instead of publishing a new ASN. The migration callback still does
the per-VA tbi() afterwards. Returning to the mm allocates a new ASN
through ev5_switch_mm(), or through the direct-load path for an explicit
borrow by current.

The caller-side tests in flush_tlb_mm() and flush_icache_user_page()
remain current->active_mm. A lazy caller can publish its own slot, but
it also performs the shortcut check, which excludes the calling CPU.
The claim about retiring lazy slots applies to the callbacks; it does
not mean that every path now tests current->mm.

Context publication from ev5_switch_mm() is ordered before use of the
mm by the mb() in Alpha's arch_spin_unlock(), when finish_lock_switch()
drops the rq lock. This is an Alpha property, not a generic guarantee
that unlocking the scheduler lock is a full barrier. A comment at the
store now records that dependency. The smp_mb() added to
__load_new_mm_context() in v3 remains necessary for publications from
check_mmu_context(), which runs after the scheduler has dropped the lock.

Changes since v3:

  - Drop the stale v2 Message-ID trailer from patch 1. Its code is
    unchanged and Matt's Reviewed-by is retained.
  - Test current->mm in ipi_flush_mm_and_page(), so migration callbacks
    also retire lazy slots rather than repopulating them on each page.
  - Explain why the caller-side active_mm tests remain unchanged.
  - Name Alpha's arch_spin_unlock() mb() in the ordering argument and
    document the dependency next to the ev5_switch_mm() publication.
  - Add Matt's Reviewed-by to patch 2 with the migration-handler change
    he requested as the condition for that tag.

Testing

Fresh fork-throughput measurements and an SMP run under compaction are
still pending for this revision. Targeted Alpha SMP, UP and SMP with
compaction builds passed, as did a full ES40 CONFIG_COMPACTION=y build. The earlier fork numbers do not measure
these handler changes and are not presented as results for v4.

For comparison only, on 2026-10-09 the preceding MMU v3 plus stale-TLB v4
passed nine lost-store rounds, nine stale-read rounds and ten writeback
rounds on an ES40, EV68AL Tsunami, with four CPUs online and
CONFIG_COMPACTION=n. No new kernel errors were observed. That run did not
exercise the migration callback changed here and is not validation of
this revision under compaction.

The direct context-load fix moved to stale-TLB v4 patch 1. Its existing
review/test tags remain there; it is not duplicated in this series.
Both patches here retain Cc: stable, including the migration cleanup as
the shortcut's prerequisite.

Thanks to Matt Turner for the review and EV7 testing.

Earlier revision:
  v2: https://lore.kernel.org/linux-alpha/20261008195608.965266-1-linmag7@gmail.com/
  v3: https://lore.kernel.org/linux-alpha/20261009212501.971158-1-linmag7@gmail.com/

Magnus Lindholm (2):
  alpha: do not clear remote MMU contexts in migrate_flush_tlb_page()
  alpha: do not skip TLB shootdown IPIs for kthread-borrowed mms

 arch/alpha/include/asm/mmu_context.h |  7 +++-
 arch/alpha/kernel/smp.c              | 52 ++++++++++++++--------------
 arch/alpha/mm/fault.c                |  4 ++-
 arch/alpha/mm/tlbflush.c             | 18 +---------
 4 files changed, 36 insertions(+), 45 deletions(-)


base-commit: 33465f6ab697abceafd9a340067a544d551c4412
prerequisite-patch-id: d194ee1170a45793fa8533400dbc5599fc0e59ae
prerequisite-patch-id: 17df30a2da268e1bd07c7b44de4ef061cb744c50
prerequisite-patch-id: 94856bd5734d96521ef19e59cdb77af1d577fefa
prerequisite-patch-id: 7326de756f1a933cd3c44e4f7669c5a7c4519678
prerequisite-patch-id: 9e39c93f5b7267d1e8ffd176988803681ba03eeb
prerequisite-patch-id: c3f48cfa74e60b966610f88f73f7a393b5adf0b2
prerequisite-patch-id: 73a4faf81a8a0929ba8ba03a6d9a3286e0d9bd2b
prerequisite-patch-id: 55fb49cef84ea661b5340f14c56d73c04556f565
-- 
2.43.0

