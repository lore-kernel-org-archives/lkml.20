Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D731345FFA3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925821; cv=none; b=iMABM1vjeTFdAYaWaF9krR+cKbwZwY690dSqZYWnk98gO9rK+5MAGL2Wx2yh3a7nM7nuYI2XPrT4PdfmLWFZEnrgzpyT75rOqBw+vfGdQPAooabLkCpLH/z5UfkY9+65q2+SZe5T275oYwo7vaxDYvE4T3vLt6dM0yNGJzZY6ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925821; c=relaxed/simple;
	bh=X+ibm73hLPtAVPfJtKwkvMlxQsgqYSo5Aqe0qcZuviI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mj9V0CBXwLfI3ktASdWZT+QOsQfJrq3ImsZb6DJosSUO4u/jQC/4twHZU9jREGFDpkmmZG1wO8vcWD1hq0YtC3sz3RQKCEfM93QbPWXxekNor9TNp/Vkp+dMNCHjS7M9BiIBsmClFLbxoVG+wUNgXH0jPvwrRGlXgvH9Ljnw/tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYciaezo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYciaezo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D8D1F000E9;
	Fri, 28 Aug 2026 14:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787925819;
	bh=ZMZ/kBarwjSgDXtkTwWShii9hMB72ImaIYEtvs34y2E=;
	h=Date:From:To:Cc:Subject;
	b=hYciaezoq6aRZ/YSZYVrOfuxrfHAn6D8HtKQyO3/l95vjtcWIjV+tTb0mzbSSSsCK
	 EwGsB5jB/HBhsCWNxghQ3P112fkV6JYCUljUYTKDLeTVVuibaTtkd1JgrtW+dtM1Va
	 P7FdfO4cBEfk0diyRvcRSvMrGjAw1SwyPy7lBjUQTVcI1udVmVHkjIjeqJWgR0DY0+
	 EMO9q0yzbGLh9iQLTc5j06Fm2AouEZFMJDkfmFgePqJB8Mhh8zU5OK8Ws3DC9oHH3b
	 oFolPXWBBB3rWKpTtvVi7xNYpIW6xiyLdHg2/cx9fPf7T+cvttwrq3a5iQUo5ObQQ6
	 P1MXctdEhD4bg==
Date: Fri, 28 Aug 2026 15:03:34 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc1
Message-ID: <apGVNo7DgJmIQRHm@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull these arm64 fixes for -rc1. The usual summary is in the tag,
but there's a mixture of ptdump, compat and MTE fixes that came in
during the merge window.

Cheers,

Will

--->8

The following changes since commit 26b77009ee74f6122a067a4f9926ff6e09fffb94:

  Merge branch 'for-next/uapi' into for-next/core (2026-08-14 10:16:13 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 2bd533739234d79b74afabfece1abfe9c6d52c83:

  selftests/arm64: Add MTE test config fragment (2026-08-27 14:18:39 +0000)

----------------------------------------------------------------
arm64 fixes for -rc1

- Fix address handling of final memory region in ptdump

- Fix emulation of decrementing load/store multiple from 32-bit task

- Fix SCTLR context-switching for store-only MTE mode

- Fix numerous issues in MTE selftests

----------------------------------------------------------------
Karl Mehltretter (1):
      arm64: compat: Fix decrementing LDM/STM alignment emulation

Muhammad Usama Anjum (4):
      selftests/arm64: Print missing MTE TAP headers
      selftests/arm64: Treat KSM merge_across_nodes as optional
      selftests/arm64: Fix MTE prctl TAP plan
      selftests/arm64: Add MTE test config fragment

Vladimir Murzin (1):
      arm64: process: Fix context switching MTE store-only tag check

Wei-Lin Chang (2):
      arm64: ptdump: Make note_page_flush() range aware
      KVM: arm64: ptdump: Flush the last region

 arch/arm64/include/asm/processor.h                 |  2 +-
 arch/arm64/include/asm/ptdump.h                    |  2 ++
 arch/arm64/kernel/compat_alignment.c               |  4 +--
 arch/arm64/kvm/ptdump.c                            | 11 +++++---
 arch/arm64/mm/ptdump.c                             | 14 +++++++++-
 tools/testing/selftests/arm64/config               | 17 ++++++++++++
 .../selftests/arm64/mte/check_buffer_fill.c        |  2 ++
 .../selftests/arm64/mte/check_child_memory.c       |  2 ++
 .../selftests/arm64/mte/check_gcr_el1_cswitch.c    |  1 +
 .../selftests/arm64/mte/check_hugetlb_options.c    |  2 ++
 .../selftests/arm64/mte/check_ksm_options.c        | 31 +++++++++++++++++++---
 .../selftests/arm64/mte/check_mmap_options.c       |  2 ++
 tools/testing/selftests/arm64/mte/check_prctl.c    |  2 +-
 .../selftests/arm64/mte/check_tags_inclusion.c     |  2 ++
 tools/testing/selftests/arm64/mte/check_user_mem.c |  2 ++
 15 files changed, 84 insertions(+), 12 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/config

