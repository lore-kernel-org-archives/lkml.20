Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F9230C637
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 07:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791014375; cv=none; b=TYB7vyD73CKDSV30ELq1YkURBmDyCc7Y8MXgSDmZgYLOppAY0cCU1YUWxVRIdqkwEwZcnlOdzx0tKXEknEC/EX3U76/+wGz2I3jWXochWw94/xtJLt18NZI0NhwiLvGl+CUb8XUNZM2Hgey02V/r4b3J30Ec/38n9Dqx2PUXHlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791014375; c=relaxed/simple;
	bh=PjA7LQ1H6tcm62uZtZ2OcoUNmMdD+Ih726AkDyq4D5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AYY3H5VAzpaPXYcLcK5oAL1WSudVcfBWcc3GD6LDIlsuaZDpDL87iDtyJlnEPqkiP0NJX2bVLoy5OsqakhuoqjFTtDUvaGDrLrYW4WbRHO4JYooK2cJ80yhfD67xafoFrStAMDnpYIGI/tEdrSiiLXVVaPqE/mm2n+489ONDNgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFCW37jK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFCW37jK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B221F0089B;
	Sat,  3 Oct 2026 07:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791014373;
	bh=9EIcFLb+YrmmNcWC6f1tYu0S89BRAVqNIn6jBHgd39U=;
	h=Date:From:To:Cc:Subject;
	b=HFCW37jKJJtcHIUxrbs0X+9Qjq4hYtBrZuxuFklUWqDtNqH+V55rlxgK/uOtjMtlX
	 Eodwo3IMYyg6m6yhQ4PQzN4AfP8E25tvfJ6O7DD8GNcpKSJ5sR04lCWPkpcqi8Gibn
	 +PQFH9Da6QFnMmn1ubGibV5gwOu/6f5esCGLBXFTk+spev9lV/S7z9CZQ3ylk+sXnh
	 oMWeX5QQwILSZEP77FIZeESNbQ9ZGvfsKf+vT7VnROvLL0YxGSB57ZaWYFEUmep5t0
	 9xVOknypMZ/r6eqX0M/714DJK6eYKXtENOPOSBZ6pXs4XuxVcZtAqeYZJ9918L2ELb
	 FNfTKfBPleRHw==
Date: Sat, 3 Oct 2026 08:59:28 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc6
Message-ID: <asC14CHKGoRQLv6n@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull these arm64 fixes for -rc6. Half of it is broken hardware
(AMU counters and TLB invalidation) and the other half is broken
software (frequency scaling and signals). So it seems as though we're
all as bad as each other.

The AMU workaround is a little noisy, as it refactors an existing
workaround so that it can more easily be applied to additional CPUs.

See you next week,

Will

--->8

The following changes since commit 2bc6b218717b9d08f466f88209251d54bc09b207:

  arm64/boot: Disable trapping of PMZR_EL0 writes to EL2 (2026-09-23 12:34:30 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to e060d9069b49fe55f38057dfe592068014652671:

  arm64/fpsimd: signal: Forbid non-streaming SVE payload on SME-only systems (2026-10-01 15:45:23 +0000)

----------------------------------------------------------------
arm64 fixes for -rc6

- Fix handling of CPU erratum #2645198 when batching pte updates

- Fix truncation of CPU frequency calculation by using 64-bit arithmetic
  in arch_freq_get_on_cpu()

- Work around AMU erratum #3821522 on Cortex-A725

- Fix panic when trying to restore an SVE sigframe on a CPU that only
  supports SME

----------------------------------------------------------------
Andrea Parri (1):
      arm64: mm: Fix the break-before-make flush range for erratum 2645198

Beata Michalska (2):
      arm64: errata: Factor out broken AMU const counter cap
      arm64: errata: Add Cortex-A725 erratum 3821522 workaround

Mark Rutland (1):
      arm64/fpsimd: signal: Forbid non-streaming SVE payload on SME-only systems

Oleg Keri (1):
      arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz

 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 30 +++++++++++++++++++++++++
 arch/arm64/kernel/cpu_errata.c              | 24 +++++++++++++++-----
 arch/arm64/kernel/cpufeature.c              |  2 +-
 arch/arm64/kernel/signal.c                  | 34 +++++++++++++++++------------
 arch/arm64/kernel/topology.c                | 22 +++++++++----------
 arch/arm64/mm/mmu.c                         |  2 +-
 arch/arm64/tools/cpucaps                    |  2 +-
 8 files changed, 84 insertions(+), 34 deletions(-)
