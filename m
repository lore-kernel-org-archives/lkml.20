Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742194;
	b=uq3XVZbEaFOsEJqYrJApo4eEqDGfuK/Uh8nNxLQ/gnkTy9yD1q+C4WjrLkcKoFZlyo3s
	 B+lOLITvV/VTOEYlnQzlbIeoZ5iZX5MA7shOmZ09S2X6TJ8zPF1u4uuZoy3HSHnmNfgx9
	 CGrF3JLTAmA3qnuq2NkGZ+2dwTDMbZrVgnutIP9kko6VCj2x6Y5o8vADIvSpg1/K6WOXm
	 o1HDw9sWdxW2XUPlAYT5cKOC6CNDP+o2MgRCz7KqeMt+oeFt1FpP7Rq1YPt//Gb5nx3sn
	 qSGPmIlFCIcisbDFwl8fNwx+rzWSoNL6auenvfS7MnS103VTYxiJZVEO4zMLTuEvqyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0yQ+xs6aEztTJgPOL/FRptwCM1FCU7FbXIb46UL6X3Y=;
	b=ZW0Qmi+A2kYZBB1KgNFu8OeEz6xG51+6vVbhm8IxV/DrCCAZyZ9kiydV6L5ev4DFbcP1
	 tPyo1a0fO0Xm8h1bP9L4cePIH1m3tpc1H86cZLLFm6LqVX3wTaMD+LtQZo9iVPaW27K/p
	 JdtKFysduW0YMneDqdjbQtanSiiCg5ZyDPWnsv1F9NWBy9PGtF14/3E2bpRI3NoSo/omz
	 1vMeILeX9Y9yA+O6cYZF5DnaULpf/ClRVNN1PCV/Fn19dzfZsOA4LThybftoNuuznJYwI
	 0j581nfkI5j8fE9sasnWN+GSKqwZ5tP7dN8D8CioiTcv+OX/y/+UbWLUgyV6bESMvcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zgsz6jtt;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CF4606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23CF4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zgsz6jtt
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so7580074a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742192; x=1794346992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0yQ+xs6aEztTJgPOL/FRptwCM1FCU7FbXIb46UL6X3Y=;
        b=Zgsz6jttDrNE0nAEi5gAL562a7kaxEtzuezmnofWUEX7AIppECy3pNcKy0hCsIlsIo
         kOXVQSgsZcjgQlEGH5evjNMecUUPA7lKfxZm1t0uYfmBzPR9xQCTAM5Jf2M5pvArZ510
         u/+pcCNQ6BMg8P9fhMUKiO6OKFJv5EpnJe90C0E8Qg9efabCtXnrhfeG6Mz9P8pWoxjO
         lem9eiF3XVWGgdMYsPqVI1spiUp1X6qcN+wyORhJBGCl/ij6vCd+1HBh2ghskcPhZpi0
         5CXvAhEqKDQAmfN0lOO+zDZPvRx0z6sxASNib77yGQSZ/NYiDaNmFeTKDwSKCrclliOQ
         z4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742192; x=1794346992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yQ+xs6aEztTJgPOL/FRptwCM1FCU7FbXIb46UL6X3Y=;
        b=QXuRmDhI4/IBWsmsxCtwch4aRHQDY8lilS6MHyupNSIkuKEpW0O7+FSPnwtyiuhIjD
         5+jVY/Pj41ftNAS1vx11tgoa20ScHPMUtLhBh++l+6ew+/6HFMCtrtpuvU5CRYfpqnzA
         1qWTf9GPdAyEZUsTLkUJBVLNl+pYFuPmRqHbHrbxmj/7rbMiMMuIPQpvhLzNSmNYecRf
         D+titzE8u4uQO7/mH4EuzZJiA3y8WNNBcfFSkx6KcGXED06xJfamNaCqX8RGRWsDd/gP
         fjmXRyVKHOH9M4bSF98mCE8ibnqhvSLgCXIf2DSOnVyh4njlFyghC9vtAInito/jHXQx
         0NKA==
X-Forwarded-Encrypted: i=1; AKwUvBxnBfNi1u/+mUOW1EKB3GYsFx001s5E5bMROs1tjJbW8TfnFYbJiMHFJff6phP4vHroTvuJif3uPZRPW5U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AlwKZP+U1rx0YxfMWu+agZp499xKQnQT5FBYAkFlzlywuL188
	8KspVdN4ddk+GG7GjEb8QwdRULX1JG1rH+kxtYpUreORRQwnLYoQkYZF
X-Gm-Gg: AYBFou1sERM2K50nN9P1G4ySnNPjb7JKucpndh6cGPbc7/3MJsFWSW7+E5FNErqAa+N
	bJBYtA3e84Nw83lUt/bdPBeIzREzy2qk5Mr2rH5xIh+CAKBnxplYSwyy8NjVOOMb0Gri4+envYO
	LqdT8pLbyn5gPn6H+kBj9UQMopdDfGmcia7LIf2b9uhctuk3z1XAGYA6annSJ8rcEY+UWWlBJpl
	lNPDMbaGvqgoNf1p7F1edURQKhVwEjH5t5PSuSNNaVCSZYuTRMGT776wk3VRpEFgQNqDq2AeLTT
	Eb/X51ncMdj8z5jG2sxWcmYS3jWjjYFhAUjEGVa74zf/Wxq7Vt1zYm01AZkvilkKGAR4IINFSG1
	cb9z8JPX0kIb6tvfO0E8qGcGLCckjPBwWnbJEwoqx1ptP/Bk3mPmHAwbKcYv9kPy/C+BQWVxsOv
	g27XGplI1fcqN9JKTwc3B/fWMezZUxZViAzTOZKaCm+eTWWsIK5yAiIemASdDTCS3HmXC6Spo0P
	bmX26Khh+Bv2L+Zi/OZAgKGe9Aa1GSe6fhXppGn5lfvGc/Q4o8LBU1dJTzihMep+kO3RDbc36A4
	3n3IPK47OpPbuApn9XPixnk3+PTSJTHaMsu5aOwIQRlMir7oHzzd9OajrBdJxORUEzVhsTZkAqe
	rK8LWRVITUJJoIVKw
X-Received: by 2002:aa7:c693:0:b0:6b1:abe7:8276 with SMTP id 4fb4d7f45d1cf-6b4d33ab545mr7257113a12.2.1793742192252;
        Tue, 03 Nov 2026 13:43:12 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:11 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 00/14] alpha: fix entry bugs and consolidate generic helpers
Date: Tue,  3 Nov 2026 22:35:06 +0100
Message-ID: <20261103214120.1099893-1-linmag7@gmail.com>
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
Content-Transfer-Encoding: 8bit

With GENERIC_ENTRY upstream for Alpha, this series moves syscall dispatch
and ordinary interrupt/exception entry and exit into C using generic
helpers, and removes redundant fork, core-dump, audit and ptrace code.
It also reuses generic memory-option parsing, OSF resource accounting
and CPU registration.

The consolidation work and its regression testing uncovered bugs in
saved-register oops reporting, audit return values, SIGSYS register
rollback, syscall restart eligibility and arguments, and handling of
skipped syscalls versus invalid syscall numbers. Patches 1-5 fix those
bugs before patches 6-14 consolidate the code. The fixes remain distinct
commits with their Fixes tags and existing stable Cc tags.

The fixes and consolidation changes exercise the same entry paths and
need coordinated review and regression testing. They are presented
together so reviewers can follow the fixes through the subsequent code
changes. The fixes can still be considered for earlier application or
backporting without taking the consolidation patches.

Patch 5 distinguishes the -1 abort sentinel from other invalid numbers:
explicit cancellation preserves a supplied result, whereas an invalid
number permitted through entry work returns ENOSYS. It tracks supplied
results explicitly, avoiding guesses from r0/a3 contents. This also
preserves small successful values and seccomp results matching the entry
registers. The C conversion in patch 6 retains the corrected behavior.

The OSF accounting change intentionally follows getrusage(2): RUSAGE_SELF
covers the whole thread group, previously zero resource counters are
reported, and CPU times use the generic microsecond conversion rather
than jiffy rounding. The OSF layout and supported selectors are retained.

On stock-PAL QEMU the rebuilt ES40 image passes all 107 skip/result,
91 portable ptrace, 30 skipped-restart and 50 forced-success checks, as
well as SIGSYS rollback, on one and four CPUs. The four-CPU run passes
all 18 regression suites, including seccomp (99 passes, 12 expected
skips). Patch 5 before the C conversion also passed its focused four-CPU
run on the release base.

The complete series passed all 18 regression suites on a three-CPU
EV67 ES40. The resource-accounting test now compares OSF peak RSS
with native waitid() for the same child and accounts for its final
voluntary context switch. Native controls reproduced both the low RSS
reading and the extra context switch. The corrected run had 8,364
concurrent CHILDREN snapshots with no mismatches, and lockdep stayed
enabled.

All eight focused strace injection and syscall-info tests passed. A full
native strace run at 80e661285 had 1,225 passes, 303 skips and seven
failures. Three passed on serial recheck. The remaining four involved
CLOSE_RANGE_EXCEPT, the separately submitted PR_GET_UNALIGN fix, the
Yama hint when running with CAP_SYS_PTRACE, and the getxpid syscall name
on Alpha. The companion ptrace selftest remains separate from the series.

Codex assisted with code, tests and descriptions.

Magnus Lindholm (14):
  alpha: fix saved registers in page-fault oops dumps
  alpha: report syscall errors correctly to audit
  alpha: preserve rolled-back registers for SIGSYS
  alpha: fix syscall restart eligibility
  alpha: distinguish skipped syscalls from invalid numbers
  alpha: dispatch system calls from C
  alpha: use generic entry helpers for interrupts and exceptions
  alpha: use generic syscall exit for new tasks
  alpha: remove obsolete core dump register hooks
  alpha: use generic syscall audit classification
  alpha: use generic ptrace memory writes
  alpha: use memparse for memory size options
  alpha: use generic getrusage for OSF resource accounting
  alpha: use generic CPU device registration

 arch/alpha/Kconfig                     |   5 +-
 arch/alpha/include/asm/elf.h           |   7 -
 arch/alpha/include/asm/entry-common.h  |  11 +-
 arch/alpha/include/asm/ptrace.h        |  13 +-
 arch/alpha/include/asm/syscall.h       |  24 +--
 arch/alpha/include/asm/thread_info.h   |   3 +
 arch/alpha/kernel/Makefile             |   3 +-
 arch/alpha/kernel/asm-offsets.c        |   1 -
 arch/alpha/kernel/audit.c              |  62 -------
 arch/alpha/kernel/entry.S              | 293 ++++-----------------------------
 arch/alpha/kernel/irq.c                |   8 +-
 arch/alpha/kernel/irq_alpha.c          |  41 ++---
 arch/alpha/kernel/osf_sys.c            |  56 ++-----
 arch/alpha/kernel/process.c            |  32 ++--
 arch/alpha/kernel/proto.h              |  16 +-
 arch/alpha/kernel/ptrace.c             |  48 ++----
 arch/alpha/kernel/setup.c              |  41 +----
 arch/alpha/kernel/signal.c             | 151 ++---------------
 arch/alpha/kernel/syscall.c            |  85 ++++++++++
 arch/alpha/kernel/syscalls/syscall.tbl |  10 +-
 arch/alpha/kernel/traps.c              | 118 ++++++++++---
 arch/alpha/mm/fault.c                  |  27 ++-
 22 files changed, 356 insertions(+), 699 deletions(-)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0
