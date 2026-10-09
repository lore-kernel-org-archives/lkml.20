Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B9247669B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532518; cv=none; b=FivI4869iCLlMPFdPsXKE4bcdV8s8bnUMsVf/LbJyjlsoFVXgDad/zEDbD16Qh2NOscdq661jUPwfciRC0ZV3UX8Lo/15KQvJi9anDEYGUJeEsk89sZqyYJe3Nf1tDhlioU4uv+6EDscvrW23vBP2vnBipASj5pcj7eT7rmalO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532518; c=relaxed/simple;
	bh=OGcz0KNRCUmvJqYdE7GV5P0PxjQNUUJSYBZgDARaHuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hHeXGlJpLPmiXqENYHgiAV1PJaPs6mlAqHL8x4kg9o4frduiEBL6eVAxQ7aLu5WUdocjsKzEO5cKFYUcJNcJjODk+KFghFOD/az8/WFraWC7mrCCAjWsHjpf4WBaFiPnEvepxlgRyLgUc42wDXW+Xj2+P15wIG6cEZ6EiGzR+lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikhouu69; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikhouu69"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE89F1F000FF;
	Fri,  9 Oct 2026 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791532513;
	bh=TPPhZoPptZw0BuAuXEu+AmirEQrC29ZkluE6KKz/+wA=;
	h=Date:From:To:Cc:Subject;
	b=ikhouu69VgjzDcPEGu1DjthWGro28ttAT3hnW3MZ41u6IzXqU+G2a7gaYTuSzxWwX
	 efYEremPSCd26YhUShPZW+I4K7S2kYz7z2fWuqOpX/fAerGj6Qd37z8OiiBlgwzCTF
	 EBeGZ0TJQv5yFsOVZ6crWNDh5fgzL/hPkgSfT2bVr/liNrfSJHlr49xt1XEbUKk29n
	 fteM1Mnmv8yAJ1pb6regpIw3p3g2Mq++suCAPXs1hPPhzHFuXW1WDVSlydAJMUlhop
	 zmoxsXxe9zWQH1z33nVa12QLVe/wJ3Q4RlTIPSeWHhMNGQU/N6+rIzbAkk7+iqP414
	 hXeyv03/k58Nw==
Date: Fri, 9 Oct 2026 08:55:09 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc7
Message-ID: <asid3RY1C6mbTvh9@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

It finally seems to have calmed down on the arm64 fixes front, so please
pull these two straightforward fixes for -rc7. One fixes the EL2 trap
configuration for implementation-defined CPU PMU hardware during boot
and the other fixes a kcov selftest failure by excluding our softirq
early entry code.

Cheers,

Will

--->8

The following changes since commit e060d9069b49fe55f38057dfe592068014652671:

  arm64/fpsimd: signal: Forbid non-streaming SVE payload on SME-only systems (2026-10-01 15:45:23 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to a9cd14bfb0c113f1cd77be4349784663bec71bb4:

  arm64: irq: exclude the softirq stack switch from KCOV (2026-10-07 09:39:11 +0000)

----------------------------------------------------------------
arm64 fixes for -rc7

- Fix PMU EL2 trap configuration for CPUs with an IMPDEF PMU.

- Fix kcov boot selftest failure by excluding our early IRQ entry code.

----------------------------------------------------------------
Fuad Tabba (1):
      arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3

Karl Mehltretter (1):
      arm64: irq: exclude the softirq stack switch from KCOV

 arch/arm64/include/asm/el2_setup.h | 5 +++--
 arch/arm64/kernel/Makefile         | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)
