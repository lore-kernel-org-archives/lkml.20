Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C5F4F4CF3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743695; cv=none; b=TQIwVXTtLed6qCgLENDZs/qCD7nCbGg+xeigvETNryveYmJXqYANWFuZ4L/08F5DEpj/l/+N5IZFFPI9x6zuOitqaKmO667uYwNs1xddBnCYlzOM1WaebdNt3J8XPE91/SKvHSbVR4t9dmpWUr6EPm9hdM36o/emz2Fqf54Hrcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743695; c=relaxed/simple;
	bh=/0o6u23Fq1Z60p1qHzz70dDTlO7zd+wzxJ09cBgL5QI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BuZM0fQntNWIBc57kEEyHwoRKqXsw6cUvm93IYE1//wBT2LVI9230hl1wdUWyQ4gWPuyNlGYKaEJyrEfPOvz/5VZ7mbZUwA+B2ybSH+DRAwm3sefbF2MN6VQX18t94QvLjkLp8Wy5jxAdskFMZhV/+M+/VqC4ok+X7tiYMvpjP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lYtunU0L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYtunU0L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44DDD1F000FF;
	Fri, 18 Sep 2026 15:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743693;
	bh=YKI5+bKz/u5TUQe53gU8/jmtq5Ye1wah0IVTuXctBOo=;
	h=Date:From:To:Cc:Subject;
	b=lYtunU0LIXI0kdFnVndvU0qN5CMm9UtrVB4RjtpINBU8KSTI6MWxWwTq6crpIwzFF
	 j9Yzc2R6XzWwjUfql5f+i9I0CVWEFX1RHbXxobmywLOVSAYSvddLAFzJd/fDb0zLvD
	 Zd6C5WAYcUbq9UbX6eezQi+54xiJ2v/R1SbO6JvSi4aCw4m8a249I9MBkUfrGsUrfl
	 ApspYgxbZNaYnNnGAoMuC+TI4FwHppzGTWAjbv4Y/VcnznkyDhNuR1C2ydrs0mOJUT
	 Mtl3OQWM+kj5C0Y74x2YPywl7cIjKr5Jiz46QIthFguRn/p4JCBTMQ87Ma1TT73lUr
	 2uO1ry9/OucKg==
Date: Fri, 18 Sep 2026 16:01:28 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc4
Message-ID: <aq1SSMDovHJhKmwF@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

We've got a steady trickle of arm64 fixes coming in, but I figured it
was better to send you what we've collected so far rather than keep
waiting for it to settle down. I've already queued some more for next
week.

Anyway, in this batch we've got a couple of hibernation fixes, a couple
of minor MTE fixes, some per-cpu codegen fixes (which were found as part
of Mark's series adding preemptible this_cpu_*() operations) and a fix
for the Arm CMN PMU driver. The summary is in the tag,

Cheers,

Will

--->8

The following changes since commit 5445d64199626974269fcdf347769ad44b0bb53b:

  arm64: Don't read GMID_EL1 when MTE is disabled (2026-09-03 13:03:23 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to fdb9ebc7fb7788b8371fbef6c17dc5c8291e1429:

  arm64: mte: Fix PTRACE_{PEEK,POKE}MTETAGS error documentation (2026-09-11 12:50:02 +0000)

----------------------------------------------------------------
arm64 fixes for -rc4

- Fix hypercall arguments when resetting EL2 vectors during hibernation

- Fix hibernation with 52-bit capable kernels on machines without
  52-bit addressing, similarly to the recent kexec fix

- Fix a bunch of clumsy codegen issues with our per-cpu accessors

- Fix MTE ptrace documentation to reflect the de-facto ABI behaviour

- Fix pthread_join() usage in MTE selftest

- Fix port selection in the Arm CMN PMU driver

----------------------------------------------------------------
Bradley Morgan (1):
      arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc

Breno Leitao (1):
      arm64: hibernate: clone only the linear map that exists at runtime

Catalin Marinas (1):
      arm64: mte: Fix PTRACE_{PEEK,POKE}MTETAGS error documentation

Mark Rutland (3):
      arm64: percpu: Fix this_cpu_write() casting
      arm64: percpu: Fix this_cpu_and() mask generation
      arm64: percpu: Fix LSE operations on {8,16}-bit types

Shouping Wang (1):
      perf/arm-cmn: Fix wp_dev_sel2 setting for multi-DTM configurations

Thomas Huth (1):
      kselftest/arm64: Fix size of thread_data values for pthread_join()

 .../arch/arm64/memory-tagging-extension.rst          |  5 ++---
 arch/arm64/include/asm/percpu.h                      | 20 ++++++++++----------
 arch/arm64/kernel/hibernate-asm.S                    |  2 ++
 arch/arm64/kernel/hibernate.c                        |  4 ++--
 arch/arm64/kernel/mte.c                              |  2 +-
 drivers/perf/arm-cmn.c                               | 10 +++++++---
 .../selftests/arm64/mte/check_gcr_el1_cswitch.c      |  2 +-
 7 files changed, 25 insertions(+), 20 deletions(-)
