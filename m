Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5618938F65D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546006; cv=none; b=GeJnIVWliRPT5xdsPulN7RxfmJhSN7rTHZd1AepxtY8PoHR322xa2sk88iRTySfscVNvWo7XBDo2lPqaA9251aiXOKjN7AlRiVFJd4JPvhHEvhiiM1XCWJEUAJrgAFK8tWD9Ld5ijc17GWArlz9L/foa2UJSIbXOhofH4prR948=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546006; c=relaxed/simple;
	bh=K2TGcBo0NbS6cos4zHFu92dLKPUihLxuwYfwU3OoI9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DwRcUaB0lSoEI5kmf3KJrPP/uYqnqwziOu5wzh0habx06zQLC7BzQd+xqa7DRE9RM0R1Rr5W8jN7Aa/9aom0TYY+MXgTs4f3dEYtA4L6f98OqseyXIuDbiC/BvVuwTHqYle6i2yUMNL/559Ufw0cth/gRO2TBsRstg7tQ+FUQI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e02BFwue; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e02BFwue"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDD91F00A3D;
	Fri,  4 Sep 2026 18:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788546005;
	bh=hWAMWTCVspgPae1UWmVXhHE0Xa+u/7brG0CwZz8F8vc=;
	h=Date:From:To:Cc:Subject;
	b=e02BFwuePHonUF1YIPD9m86xgm2JZJVc/6OOEEBLdl119PjE3e232pczq+BUXuq5+
	 NrYPDac4tuZtDxDQ/8N2brCRnjyl/21VPBghfAWkJ+Z7uhlfPjVYdG1dpZ/WGXofFL
	 /gI1IkEcrG5hV//QXEQJdwB7pFmM9up0KcT4XRnmEZR7+nbotC2tXi4EYm5jXN4dMh
	 mHnZd7Q2xL2mLz7xZNqA63UYSmhOnvccXCRSfj3jB7G0xh8318DTlPhomo4ULMjV1I
	 wLgAA4wq3WWGFXeL9aFbxap7JQ5ovmyFWlPaeZvcl6vHmDmNnWo8OPH++eVKwoVPIC
	 4R7+e2yXhub2A==
Date: Fri, 4 Sep 2026 19:20:00 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc2
Message-ID: <apsL0Jd_RUiP20Vd@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull this batch of arm64 fixes for -rc2. As you can see from the
tag, there's nothing Earth-shattering, but worthwhile fixes nonetheless.

Cheers,

Will

--->8

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 5445d64199626974269fcdf347769ad44b0bb53b:

  arm64: Don't read GMID_EL1 when MTE is disabled (2026-09-03 13:03:23 +0000)

----------------------------------------------------------------
arm64 fixes for -rc2

- Disable interrupts during page-table walk in show_pte()

- Fix kexec_file_load() with 52-bit capable kernels on machines without
  52-bit addressing

- Fix MIDR matching in CPU errata handling for KVM guests

- Avoid reading MTE-specific ID registers when MTE support is disabled

----------------------------------------------------------------
Breno Leitao (1):
      arm64: trans_pgd: clone only the linear map that exists at runtime

Fuad Tabba (1):
      arm64: Don't read GMID_EL1 when MTE is disabled

Karl Mehltretter (1):
      arm64: mm: Fix the lockless page-table walk in show_pte()

Khushit Shah (1):
      arm64: errata: pass REVIDR when matching target implementation CPUs

 arch/arm64/include/asm/cpu.h        |  1 +
 arch/arm64/include/asm/cpufeature.h |  7 -------
 arch/arm64/kernel/cpu_errata.c      |  2 +-
 arch/arm64/kernel/cpufeature.c      | 33 +++++++++++++++++++++++++++++----
 arch/arm64/kernel/cpuinfo.c         |  2 +-
 arch/arm64/kernel/machine_kexec.c   |  3 ++-
 arch/arm64/mm/fault.c               | 12 ++++++++----
 7 files changed, 42 insertions(+), 18 deletions(-)
