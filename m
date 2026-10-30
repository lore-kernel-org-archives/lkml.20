Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384700;
	b=lfx2q3y51wkc+YlFR6SMbes9jB8knVzm4k8AkalnM+2omXd8a8bd3r/1dSdHPKia8xmM
	 X5k9VfB4o9IfAfbajkZwMjzcLOWoiRW2dUIVFHUC4yG/BC2epBGdyjnec+liMvCNZhN6S
	 LGYldt2q7JaABrCSHN4DoKivpTQ4cer5NlnK9cWMpZQ1/HxHnlMH/FQ5HD2wAVZ5M1j63
	 +GOXUCYmVRzpkvqClTzgDIG8KWab5BQUQ6AN/jA6em9CV6nBp/vGhfXbg+9TzwpCS2dGb
	 k4lgVSb+NLsfYv6RPhV3JAwo4uPZ82ZPdOWmWzws60pV/fkG1tJcEurRCLme6pFZMpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384700;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=41o/DgL+nFsgsid8TUUhF8UMTGKy2cZolj/OO47kSSA=;
	b=hPal4yEo4BLay6495RQpgJohcgoqOxbgKgFim4nFlUHf23bc4Ct+K0wi0cLf4hP2bemh
	 axZMbsIDH3OaF620cZdOk+MzeCblRzL+YDT+pn7+Z/7R8LylZdnRFG5r39KTTGjbmujVU
	 2trgSTbI0ST+eN4dseMDw+ElB38Rbh01s5d52dCm6Zu532xd/34fTXcQNsFacPdZ608uo
	 K3/K4UByeSTFKmzRwBzRcwB+T6NG5Ty2vaXp22UZusIexdqA4w6UquA9758H46RdS5hQp
	 p1Z2MPwXQzMvKQBdvNnlMkywl1P9EX3ViDoEXtlPJZzuVfKq/TStF3krEvLuB+jVifg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hp4F5d2j;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12D9606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C12D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hp4F5d2j
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 797331576;
	Fri, 30 Oct 2026 11:24:54 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2AA03F673;
	Fri, 30 Oct 2026 11:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793384697; bh=Hncs4sYrggz4WDHbAbVosY9saDcGH6y08xLwvNmlY1k=;
	h=Date:From:To:Cc:Subject:From;
	b=hp4F5d2jY3YM6uMlyJaG4ge3pwI1CwDW+i6DjDsVgIB+7FFO37YxnNCQelnVxb1Uh
	 NxEur+hb4SV3N454QfyHO/3UQjbJ8PqKsscMGq1TwQZ/vKK+zvDqszUMf6UjLApkz9
	 kDky0JxLx98gu4gHZx/KQbmwxwOU/qK1jhaVlsIw=
Date: Fri, 30 Oct 2026 18:24:54 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 7.4-rc1
Message-ID: <auTg9t-da3RFo9nx@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

Here are three fixes that turned up during the merging window: shadow
stack not freed during a failed fork or it is unmapped from parent when
a worker thread exits (same commit covers both); PTE_CONT set on
PROT_NONE entries but subsequently ignored by the unfolding code since
pte_valid() is false (pte_present() is true); an MPAM lock not released
on the error path. Thanks!

The following changes since commit d0de3a73194a250a2e5ffbf1dc604c0bcbb16e8a:

  Merge branch 'for-next/fw-rmi' into for-next/core (2026-10-15 19:09:31 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to f46be4da2cbb17574b5369517a9a1e1b414063b4:

  selftests/arm64: GCS must not leak on a failed clone3 (2026-10-29 20:42:23 +0000)

----------------------------------------------------------------
arm64 fixes:

 - Release the GCS on a failed fork. copy_thread() can allocate a GCS
   for CLONE_VM threads but a later copy_process() failure left the VMA
   in the parent's mm. Implement exit_thread() to free it and stop
   kernel threads and user workers inheriting the parent's GCS
   base/size. Add a kselftest for the clone3() failure case

 - Do not set PTE_CONT on invalid PTEs in contpte_set_ptes(). Batched
   set_ptes() of present-invalid entries (e.g. PROT_NONE) created contpte
   groups that the single-PTE helpers did not unfold, corrupting a
   neighbouring guard marker via test_and_clear_young_ptes()

 - Release the MPAM mon_sel lock on the mpam_save_mbwu_state() error
   paths

----------------------------------------------------------------
Iván Ezequiel Rodriguez (2):
      arm64/gcs: release GCS on failed fork
      selftests/arm64: GCS must not leak on a failed clone3

Ping Li (1):
      arm_mpam: Release the mon_sel lock on mpam_save_mbwu_state() errors

Zhao Gongyi (1):
      arm64/mm: restrict transparent contpte mappings to valid PTEs

 arch/arm64/Kconfig                                 |   1 +
 arch/arm64/include/asm/pgtable.h                   |   3 +
 arch/arm64/kernel/process.c                        |  17 +++
 arch/arm64/mm/contpte.c                            |   4 +-
 drivers/resctrl/mpam_devices.c                     |  12 +-
 tools/testing/selftests/arm64/gcs/.gitignore       |   1 +
 tools/testing/selftests/arm64/gcs/Makefile         |   3 +-
 .../testing/selftests/arm64/gcs/gcs-clone-pidfd.c  | 168 +++++++++++++++++++++
 tools/testing/selftests/arm64/gcs/gcs-locking.c    |  20 ---
 tools/testing/selftests/arm64/gcs/gcs-util.h       |  24 +++
 tools/testing/selftests/arm64/gcs/libc-gcs.c       |  20 ---
 11 files changed, 224 insertions(+), 49 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c

-- 
Catalin
