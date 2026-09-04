Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BC94CA28C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533653; cv=none; b=MaauhpYBc2oyjEmBSRYdS/B2GFVBikrI+Qf8IpjYNolUsmkiZhtVx33NkuqhOLh7ETUV0KJm76TQa4v1UxnyAN8G27RPkuSpKWsnzIMXsCB7TcXkvLIH8vJsiOmPZq4caVFQt/la7xUDFAt7urmfo7/wiDiASYGiPYYyKI9kxqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533653; c=relaxed/simple;
	bh=u/xVIgUmM6lKGJniam5xq3AuqHzyTgUTYInh6izj9MA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ugPW7ZfshsZYfo5b4kH92TCfEhIpoZG1DiFTVtAfZSRgYS4anutSAzVTb7v5hJ/vJ78/3o4k/os2cqJWmaOjsrFwYnynD0dej6fxdVDTTK24nHE5dcnFbOwN9fw0EKPdCZEbUs9MFIilhAt3oK0WGBh2f8SxdipZY1QFPGASTfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zw1elYA4; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zw1elYA4"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482e257a23aso777647f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788533650; x=1789138450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOAh63HZjbJrLKsptC0uE0W9y4S8sjFit+81Vn7lVzY=;
        b=Zw1elYA43Wk9ptU5j6TITH4AWpm/hoY35ZFwe7BHkpFrO6pBW9TrFfeB9LYg7mZVeR
         pZd+xMdPGU8ksJT/nYQ4SIHafk/rulW9Tzw0tx28WkemnXOoyY/DUagLvww5WE3GzPHZ
         nuL/wmIa4NSFT7M2Lslm2ZMGuoZGYWUZVrJwN24q8X4YnLQ/9UjVNceuKw1cWZA9FsbA
         dqhAhTIvwPLRLNeReTGwv5XAsBl7DBNOY9hDQPWgz+kjNbV+EHS2PXFBDA4zZdb0IMIa
         f/YeKhTROATKBpk5vq9lTRjhQxtq/fiuvBKuTKAbIIbab8KM+uxHO+asHZEv3GUlCc3t
         JtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533650; x=1789138450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOAh63HZjbJrLKsptC0uE0W9y4S8sjFit+81Vn7lVzY=;
        b=JAh39etKFt20cQ735r83mle8O10mvzCANxPyiyVOO1PKwZmcLzVzFaqzhxqFnd4b9R
         p0HTIfQ00iNgOpVBF3v1vdsj0x3gen8PzFtNcZ6Zw2Yu2oTZo2/3CvS4JNwoDwFctZUi
         GHk5K4Mb5EIjD+JyPyC/63zM9Uztbgp6lDIz9NQWrMgSS95kt9lntV28CoGxldAuL9PP
         2dTE6Iq/fjLAjPoCcAB/XUtdQyihHaqSondsxsaWtiZRTxc9zZQUSIitmlHn9Yb4nSgh
         hKqTApocDtOvKColVCq/WoEv6YjDzFs/jik6jA3NNEi/LHDcF7FKgA7+Zr4cJ2sJgP4q
         3svg==
X-Gm-Message-State: AFuF++ny5WZ3yg5kdAf6XyUWYmPwDdur4QQ0jJgKkgkllmTi9TPk03IB
	Qw2YzXDlHmRJiP8NXyWf33XDDQ2EFyZ0pMiuuj2xzwcYfmvUzjSty239
X-Gm-Gg: AYBFou3UISyVmzUdndqrKHXv7n9WpvQct62JXp4KgR/b+/DY9JjUy1f+n/JiKAlL71c
	UJL2UitkIGL2Pe+L2fIGr0fbT+2F7P2KGZL5qlNbi0reeGyQaEYZkE9XfAi6vCL1nAFrfu/6/Pk
	kB0sSAKUAHKzYI7xu0jyj7sXTl0a14TVSep5NZnwUd9oRdbUgf7+KeBgZLM721/rssZTLx/vg3O
	iTSMFn7CBjSeNUV9MSVPh3tKFfT27o2qsUqiL4nre4M4DoNoFpP/yiM3l3woqVbNfxjVwIOiA8e
	iuHmakiQ8EAZxzQbbToE30BhaJZTVBXVbMPV2kcHli15JnD2hXxIgRK3tQsYZdOZW96LJBIhy6j
	jcl4Wotpd/2yA1yFs0rIkH2NgWe/OAssVuc+3t0gaMI1vzyeVo9XdHIg/qw/AQMaezXtU3YDKFM
	pwnoA7zfWPLR5319JeFvPsUJ42YMZiwRqs/FFSzi0n2cucHaIPf4hezg63Qa+n5zZ+uPFj+PncQ
	/GbwLxVJphp
X-Received: by 2002:a05:6000:4b11:b0:485:8a46:b3bd with SMTP id ffacd0b85a97d-4858a46b4c8mr4684164f8f.37.1788533649711;
        Fri, 04 Sep 2026 07:54:09 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885cb03asm6802799f8f.37.2026.09.04.07.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:54:09 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	kpsingh@kernel.org,
	matt@bobrowski.net,
	song@kernel.org,
	utilityemal77@gmail.com,
	sun.jian.kdev@gmail.com,
	tasos.papagiannnis@gmail.com
Subject: [PATCH bpf-next v4 0/7] bpf: Add user memory access kfuncs for mm_struct
Date: Fri,  4 Sep 2026 17:53:33 +0300
Message-ID: <20260904145340.40212-1-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On MMU systems, during exec, argument and environment strings are copied
into the new address space held by struct linux_binprm before that address
space is installed on the task_struct. Existing BPF user memory helpers
operate on the current address space or one associated with a task_struct.
Because no task_struct refers to the new address space at this point,
programs cannot access these strings from the bprm_check_security LSM
hook.

This series adds two sleepable BPF kfuncs for copying bytes or
NUL-terminated strings from a trusted struct mm_struct. It also marks
linux_binprm->mm as trusted-or-null, allowing BPF LSM programs to pass it
to the kfuncs after a NULL check and inspect exec arguments before
allowing the exec to continue.

Changing bprm->mm to trusted-or-null would otherwise reject existing BPF
programs that read through it without a NULL check. Preserve that behavior
by allowing fault-protected reads through trusted-or-null BTF pointers.
Pointer arithmetic, writes, atomic RMW operations, BPF_LOAD_ACQ accesses,
and passing the pointer to a kfunc that requires a non-NULL trusted
argument continue to require an explicit NULL check.

On NOMMU systems, exec argument and environment strings remain in
bprm->page[] until they are transferred to the new process stack. They
cannot be accessed through bprm->mm at the bprm_check_security hook.
The new kfuncs remain available on NOMMU for address ranges represented
by a supplied struct mm_struct.

The series also adds selftests covering both kfuncs when reading argument
and environment strings, and verifier tests covering trusted-or-null BTF
pointer reads.

Changes in v4:
- Add negative verifier tests for atomic RMW and load-acquire accesses
  through trusted-or-null BTF pointers.
- Preserve explicit nullability-marking coverage for tracepoint
  arguments, dentry->d_inode, and sched_ext .dispatch.
- Use the already-nullable mmap_file argument for the negative store
  test, avoiding dependency on the later linux_binprm->mm marking.
- Clarify the bprm->mm lifetime invariant and move its lifetime fix
  before the mm_struct kfunc patch.
- Document that the existing task-based user-memory interfaces delegate
  to the new mm-based implementations, reorder the string-copy kfuncs to
  remove an unnecessary declaration, and annotate the remaining
  declaration with __bpf_kfunc.

Changes in v3:
- Replace the linux_binprm-specific kfuncs with generic struct mm_struct
  kfuncs, as suggested by Andrii Nakryiko.
- Move the kfuncs next to the existing user memory helpers and make the
  task-based variants delegate to the new mm-based implementations, as
  suggested by Andrii Nakryiko.
- Clear bprm->mm before dropping its reference on exec error paths.
- Mark linux_binprm->mm as trusted-or-null.
- Allow fault-protected reads through trusted-or-null BTF pointers to
  preserve compatibility with existing BPF programs, as suggested by
  Andrii Nakryiko.
- Add verifier and runtime selftests for trusted-or-null BTF pointer
  reads.
- Rename __copy_remote_vm_str() to __copy_remote_mm_str(), as suggested
  by Andrii Nakryiko.
- Clarify that reading exec strings through bprm->mm is limited to MMU
  systems, while the generic mm-based kfuncs remain available on NOMMU.

Changes in v2:
- Register the kfuncs on NOMMU systems and return -EOPNOTSUPP when called,
  as suggested by Justin Suess.
- Add selftest coverage for reading environment strings, as suggested by
  Justin Suess.
- Clarify that copy_remote_mm_str() leaves the destination untouched when
  called with a zero-length buffer.
- Use sizeof() instead of hardcoded argument lengths in the selftests.
- Use ~0ULL for invalid-flags checks in the selftests.

v3:
https://lore.kernel.org/bpf/20260831092305.42062-1-tasos.papagiannnis@gmail.com/

v2:
https://lore.kernel.org/bpf/20260820131801.68759-1-tasos.papagiannnis@gmail.com/

v1:
https://lore.kernel.org/bpf/20260812111140.7762-1-tasos.papagiannnis@gmail.com/

Anastasios Papagiannis (7):
  mm: Add copy_remote_mm_str()
  exec: Clear bprm->mm before dropping its reference
  bpf: Add user memory access kfuncs for mm_struct
  bpf: Allow reads through trusted-or-null BTF pointers
  selftests/bpf: Cover trusted-or-null BTF pointer reads
  bpf: Mark linux_binprm->mm as trusted-or-null
  selftests/bpf: Test mm_struct user memory kfuncs with linux_binprm

 fs/exec.c                                     |   7 +-
 include/linux/bpf_verifier.h                  |   9 +-
 include/linux/mm.h                            |   2 +
 kernel/bpf/helpers.c                          | 142 ++++++++++++++----
 kernel/bpf/verifier.c                         |  17 ++-
 mm/memory.c                                   |  33 +++-
 mm/nommu.c                                    |  33 +++-
 .../selftests/bpf/prog_tests/bpf_iter.c       |   6 +-
 .../bpf/prog_tests/copy_from_user_bprm.c      |  72 +++++++++
 .../prog_tests/test_struct_ops_maybe_null.c   |  13 +-
 .../bpf/prog_tests/tp_btf_nullable.c          |  28 ++++
 .../selftests/bpf/progs/copy_from_user_bprm.c | 123 +++++++++++++++
 .../selftests/bpf/progs/raw_tp_null_fail.c    |  75 ++++++++-
 .../bpf/progs/test_tp_btf_nullable.c          |  45 +++++-
 .../bpf/progs/test_tp_btf_nullable_runtime.c  |  35 +++++
 .../selftests/bpf/progs/verifier_lsm.c        |  18 ++-
 .../selftests/bpf/progs/verifier_vfs_accept.c |  14 ++
 .../selftests/bpf/progs/verifier_vfs_reject.c |  14 --
 .../selftests/bpf/test_kmods/bpf_testmod.c    |   1 +
 .../sched_ext/maybe_null_fail_dsp.bpf.c       |   5 +-
 20 files changed, 616 insertions(+), 76 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/copy_from_user_bprm.c
 create mode 100644 tools/testing/selftests/bpf/progs/copy_from_user_bprm.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_tp_btf_nullable_runtime.c


base-commit: 7bf591f26545f5776a4e42d08c06fd94469766dd
-- 
2.55.0

