Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB41476CF5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249209; cv=none; b=T4E53rzQuSoLKQITRZ8XiovRk/OR3H1PSW8RKVEFexJxPfR4j7fOAzaVDlZgMx9CjWN/cPsX8f87dIhSjUMcWPUnYK/Zy7IBwVle2mwq+pbfFRTS6jZRoYgW96+kah2xGxPWMyzPSOLknCYJPOLL/kWrivWkvH9oPDoFoFSEdAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249209; c=relaxed/simple;
	bh=+Zm4GnJxGSBybQsHw/O3v/BG8RAmfiXbNYaElvIGkXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=osHjjhkSRYPg00DLNPpdqUbGzhk9WdLxQw1WIG1s/WoWF8oY+haRUnAnIWwVkUoyZKapg94gPhoMrki8EZ5fH946gsF4ORycwAzm8UzThzsn4+bNHOqQ79Oo9NdL9qSiKeiiVRg5eyr3QKXqOtYy88GuzL+unWXR+tZ8l3dJ6Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BH1W5g+7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BH1W5g+7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8397B1F000FF;
	Thu, 24 Sep 2026 11:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790249207;
	bh=7vnO3oSB0cm4HtAkjL6UCxThtk+ZQrqxyAxnx1L/1Z4=;
	h=Date:From:To:Cc:Subject;
	b=BH1W5g+7ZFBsZxPtz0Q1MFCUOhHnTxSG4ySsSgUw7GMhXQ+4P9v9wQGD432++sDpY
	 JTUBka4M7i6jF43jk4C6nil+EGs5N2LogZve1h1XIoqCLfrDlSTlxtu0WVaa3O+1cz
	 mTLLkocAMoJQs1RWFHBoTjLD78wcfe1wugkvwC82HX7cTari0BHO8MhyOipoZNN3pf
	 CdLKMkOSDKTb60NwlXRwbbCwGeW0yxMKQYWZvDhib0joqYzlgwWeqvMpE5K8jSHFSM
	 CdXB2YObPfDPqXLhgBgtAcdm7X5afJbB6bfXrE4Cwd5bWJbcs9dGqJsijEGxjz3KY8
	 y6cGRsY0NcyjQ==
Date: Thu, 24 Sep 2026 12:26:41 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc5
Message-ID: <arUI8d-mES9Z00we@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Here is the promised second batch of arm64 fixes. The summary is in the
tag, but it's all spread around a bit. We've also had a couple more
fixes come in overnight, so I'll send you some more next week once
they've had time to sit in -next.

Cheers,

Will

--->8

The following changes since commit fdb9ebc7fb7788b8371fbef6c17dc5c8291e1429:

  arm64: mte: Fix PTRACE_{PEEK,POKE}MTETAGS error documentation (2026-09-11 12:50:02 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 2bc6b218717b9d08f466f88209251d54bc09b207:

  arm64/boot: Disable trapping of PMZR_EL0 writes to EL2 (2026-09-23 12:34:30 +0000)

----------------------------------------------------------------
arm64 fixes for -rc5

- Fix the recently merged user ABI for the Arm CMN PMU driver filtering
  logic so that the ordering matches the hardware spec

- Fix spurious warning when attempting to read PROT_NONE mappings of
  /dev/mem

- Allow WFxT to be disabled on the command line, which is necessary for
  some configurations of recent Apple SoCs

- Fix EL2 fine-grained trap configuration for the CPU PMU

- Fix MIDR matching when applying CPU errata workarounds in a VM

----------------------------------------------------------------
David Carlier (1):
      arm64: errata: match the target implementation CPU's own MIDR

Fuad Tabba (1):
      arm64/boot: Disable trapping of PMZR_EL0 writes to EL2

Robin Murphy (1):
      perf/arm-cmn: Fix multi-filter encoding

Yureka Lilian (1):
      arm64: Add override for WFxT

Zeng Heng (1):
      arm64: io: Reject non-user protection in ioremap_prot()

 Documentation/admin-guide/kernel-parameters.txt |  3 ++
 Documentation/arch/arm64/booting.rst            |  1 +
 arch/arm64/include/asm/el2_setup.h              |  9 +++-
 arch/arm64/include/asm/io.h                     |  3 +-
 arch/arm64/kernel/cpu_errata.c                  | 15 ++++---
 arch/arm64/kernel/pi/idreg-override.c           |  2 +
 drivers/perf/arm-cmn.c                          | 58 +++++++++++++++----------
 7 files changed, 59 insertions(+), 32 deletions(-)
