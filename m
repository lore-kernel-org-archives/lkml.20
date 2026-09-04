Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1B838655D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562270; cv=none; b=bzPkx3j7Li03pyj8l2LJ3BAwpPwhfa5hrmJQmwP3EcAQN3xWv6HplEnnKdOzfR1y04KKAszhpNrAfzz6qefEx5A5DMXp3slBRBjbVd7j6JtMjD9YGnQGuHt9ma7tquHMC70K1+D5w6eEW1U+H9Sx/SzaNQ1S6PxBgnhFnps6BGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562270; c=relaxed/simple;
	bh=mSzRI8T86ADzb2qXZmjJGGckgsvjcAZvprIbXfXtLrg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aEnudj2hRK7aaFD5RLPpNUgs3RXq+th1hJ9Hn+COJCRGFb1bvJWnB3r4/nZcxv/9v1nF4P6ugNDLD/PFiGF9KsHdd2r+/b5Yq2+rThOMrUCDYqWhAZqUtshh5mq/dG3GIgohkZznAzv9dWuYwutkZ5A5oGIx5myvdgk6ih8pels=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lM4yxaEG; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lM4yxaEG"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so19416325ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788562268; x=1789167068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MNz/CRZcdY5dw1JlngX3+udQebj6/NYG9KvEnFaFzZg=;
        b=lM4yxaEGKGlPb45uoNY7cTwG+Jf04kib7pr/e5/hL/QYIoDvwfqIAjmm1WFI6VufoQ
         ylmO/pQuO+a0s8Sjek7ea6KBjzXkEt9XPzLCgZyFZAPM4W+cgf47u6hvf1ZIfaLge3NH
         dXUCUWr+46cZjYkBp4M8x1PIgDi5Kwu+e1ZDeYEzDt6T0JnCyWwS6vT0RNS7F9BaCR32
         UyhnEOBXX7qfKJSaA3Co1akRdTzGM2/yU03V1Iiwbjvr3yfvRL3sesHHoERqQ2ZMs75+
         TqlnNwNtQplJ535NOvPZx/PJWeARIXdRI85M2COc3hIz8nENjyB5EA0EjR5GgqPAVZ3N
         FSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788562268; x=1789167068;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MNz/CRZcdY5dw1JlngX3+udQebj6/NYG9KvEnFaFzZg=;
        b=d8C8+TEl7Sz3p6k+r9LEH8pamReSJ5YglbYMt2K55s6L+LDfPqLrEUcMEyLNpOSxo6
         eRYuOh5UvwXDyDcuYrm5LoFP1T8PdagrcpfjUeyTTCb9N65c/gU39AQfnp4tRn8g5eaJ
         /ec32A9+EQKoQ04tf6dUhM5YEhNwzGE31uAwGb3XpdvOk7+IG1SaBA/oUwKVSWN6EUrk
         85PjvSi0OllbGLBMiz6SUUXBU4t713H2xVc+aNwUdyPSpY9MlWwg+IeEeuA+0rS3c43w
         rr6Q3uoULxR8uJVfffREBLdUTUFqNRouqf+0y4QER2UWJO9gOKgmD0343l+BCNa95crL
         JSng==
X-Forwarded-Encrypted: i=1; AKwUvBzpfSX5cGEF1J7+iNItYFJzBpWBG90//1b9jFbuoMkcCZ/5zWHF41FLjocLUSG5ZJIdVkWCOoEjH8PMR1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++k3JTY1nCP+uCRpehmeOm35T4phXVr0s4JIdkq+P7371ZsOJdPm
	9uwQtLVbKyeRUmvCjc1bxWmRMhoOpjc4+rGcEVP+78EYU068vDXOlH3UOBWehcS1V/ab+iFY85Y
	4JqaG8nk4Ug==
X-Received: from plcu18.prod.google.com ([2002:a17:903:3092:b0:2d6:ee0b:5a28])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3905:b0:2d5:2f49:b3f4
 with SMTP id d9443c01a7336-2db1231fb56mr160244895ad.2.1788562267735; Fri, 04
 Sep 2026 15:51:07 -0700 (PDT)
Date: Fri,  4 Sep 2026 22:45:12 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904225103.2955759-1-wfelipe@google.com>
Subject: [PATCH v6 0/3] selftests/cgroup: fixes for test_zswap on single core VM
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wilson Felipe Pereira <wfelipe@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This series fixes two test failures in test_zswap observed when running on
a single-core VM (-smp 1) with 4GB of RAM.

Patch 1 addresses a race condition in test_zswap_writeback() where
waitpid() returns before the exiting child process is switched away by the
kernel, causing an immediate write of "+memory" to cgroup.subtree_control
to fail with -EBUSY. We fix this by waiting for cgroup.events to report
"populated 0".

Patch 2 standardizes cgroup key-value stat and event parsers on 64-bit
types by replacing cg_read_key_long() with cg_read_key_s64() across the
entire cgroup selftest suite, avoiding 32-bit integer overflows on systems
with large memory or high counter values.

Patch 3 fixes an implicit unsigned conversion bug in test_no_kmem_bypass()
where small negative timing differences between debugfs stored_pages and
cgroup zswapped bytes caused the comparison to falsely fail due to
unsigned promotion.

v5 -> v6:
- Now it is a 3-patch series.
- Patch 1: wait for cgroup to unpopulate in test_zswap_writeback
  (unchanged, retains Michal's Acked-by).
- Patch 2: convert cg_read_key_*() helpers to s64, define s64 as
  signed long long in cgroup_util.h, update poll/reporting helpers
  (values_close, values_close_report with llabs), helper functions,
  and all callers across cgroup selftests to avoid 32-bit
  overflow/truncation (suggested by Michal Koutn=C3=BD).
  - signed long long for s64 was based on powerpc/include/utils.h
- Patch 3: test_zswap: fix implicit unsigned promotion bug in
  test_no_kmem_bypass, updated to use s64 for delta and max_delta.
- Verify warning-free builds on both 64-bit and 32-bit (gcc -m32).

v4 -> v5:
- Patch 2: Introduce cg_read_key_long_long() to return a long long
  value, and have cg_read_key_long use it and convert to long.
- Patch 2: Make zswapped a long long. This prevents an overflow on
  32-bit platforms (Andrew Morton, Sashiko).

v3 -> v4:
- Patch 2: Use long long for delta and max_delta and explicitly cast
  stored_pages to avoid integer overflow and implicit unsigned promotion
  warnings on 32-bit platforms (Andrew Morton, Sashiko).

v2 -> v3:
- Patch 1: Collect Acked-by from Michal Koutn=C3=BD.
- Patch 2: Explicitly cast stored_pages to (long) in delta calculation and
  inline the return comparison (Michal Koutn=C3=BD).

v1 -> v2:
- Patch 1: Replace EBUSY retry loop with cg_read_strcmp_wait() waiting for
  cgroup.events "populated 0" (Michal Koutn=C3=BD).
- Patch 1: Clarify task lifecycle in commit description (Yosry Ahmed).
- Patch 2: Remove abs() and declare delta/zswapped as signed longs with a
  signed threshold comparison (Michal Koutn=C3=BD).
- Patch 2: Add Fixes tag (Michal Koutn=C3=BD).

v5: https://lore.kernel.org/all/20260901052250.154532-1-wfelipe@google.com/
v4: https://lore.kernel.org/all/20260828033741.2184560-1-wfelipe@google.com=
/
v3: https://lore.kernel.org/all/20260827034807.2822234-1-wfelipe@google.com=
/
v2: https://lore.kernel.org/all/20260824033533.2147900-1-wfelipe@google.com=
/
v1: https://lore.kernel.org/all/20260804042053.56940-1-wfelipe@google.com/

Wilson Felipe Pereira (3):
  selftests/cgroup: test_zswap: wait for cgroup to unpopulate in
    test_zswap_writeback
  selftests/cgroup: convert cg_read_key_*() helpers to s64
  selftests/cgroup: test_zswap: fix implicit unsigned promotion bug in
    test_no_kmem_bypass

 .../selftests/cgroup/lib/cgroup_util.c        | 14 ++--
 .../cgroup/lib/include/cgroup_util.h          | 22 +++---
 tools/testing/selftests/cgroup/test_cpu.c     | 47 ++++++-------
 tools/testing/selftests/cgroup/test_freezer.c | 16 ++---
 tools/testing/selftests/cgroup/test_kmem.c    | 56 ++++++++-------
 .../selftests/cgroup/test_memcontrol.c        | 69 ++++++++++---------
 tools/testing/selftests/cgroup/test_pids.c    |  5 +-
 tools/testing/selftests/cgroup/test_zswap.c   | 63 +++++++++--------
 8 files changed, 154 insertions(+), 138 deletions(-)

--
2.55.0.979.g7e5102b832-goog
