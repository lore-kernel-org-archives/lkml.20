Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581439;
	b=fuz0lDM6xNiALp1DHBmJ9DIkFcoqYnYu0d/ycSw7f0H8pG34dlK0I+K8zHecGhvnG2m7
	 S2JYtgyJbMZ9eoK23EKqhrv8mIydYscCCmeW6ZK+Cuzd7WvDpbxiXE0mM8dCWaFOguXkU
	 Y9YQ2thg6bpAR0l94J/O1NSzLnVpjDoBGOpLLceLpvUC4fRVDP4+vGSxDcXb56swQIJtm
	 qEPXRvm3mtXAcqa5/3+UG1uJW0j1fNpOoFrdWX0ImyPcbygnSNbPwHA/qKPc7MdRzsyVr
	 4XsLL/sHQwrj7yUTiCfQSMenlHUZu/1rcUAtUmDJCDkxTSRFAg1RkMG6/7V7emI41uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581439;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=c0zXVTsrbk174LmaYrVUL39Szcf/bPuLxQyvLhm2Mqw=;
	b=Vq6g9u8RLQpfCIIznTjl8wElqxt+L6WyI+K/MTVPtBebneZMMEIMa0Rul+Ar50PrRyoc
	 Vo+P8revG/XRghPOrRkO8aZVKufAEoamg3yeJxX19kgpKxHEGLcbPy+Toq0QcL3hgHwoR
	 fI8ZwI4Lm9AvI51IAJv85EvZ2HmUSA7W6YGvlIg7aKfS5Hg6De8Q1vqTpXHXcxsj2IQWc
	 CsS2RxmqHnv5xgfMJU7LZRjHgwOoafdi9RC9qEs0xClIBwFfjnxY0Q81BcUghnJB7PqQJ
	 VekqohJXX2Q4T5Ko0lljWt+n4+biO0BuEH9J3mtwYuxykXC+V5xCxRAySUhdvT+JA9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZN1+KxA8;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D2C606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01D2C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZN1+KxA8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31CE9339;
	Fri, 13 Nov 2026 06:50:35 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AB8C3F673;
	Fri, 13 Nov 2026 06:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794581438; bh=6ecGdQ4eT5YT+gG7gKfOdhj7cI+gAnAbiG7t+YQUvIg=;
	h=From:To:Cc:Subject:Date:From;
	b=ZN1+KxA868nGCeUJJ8j+cH9sszhajb4K3C6R4fAebiU6e7qjWSLAwUJ8NMjBcP/GP
	 qiB9Z6rK2XUMsac/YTcEj6+WGjz/vnjA2w56A6DVpRZ8ueLdWVHimuyqe/W6xxrcO9
	 JKRSK0SmaOnL2BBhFj4lecjsHMel9oqIc54xHKts=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/6] arm64: BBML3 errata workarounds and cleanup
Date: Fri, 13 Nov 2026 14:50:14 +0000
Message-ID: <20261113145022.2592454-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
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

Hi All,

This series updates the BBML3 allow list following a review of Arm CPU errata
and implementation support.

The first two patches remove Neoverse-V3/AE and Cortex-X4: their latest SDENs
show that revisions previously treated as unaffected still suffer from
BBM-related livelock errata. These patches are intended for stable backporting.

The remaining patches introduce default-enabled Kconfig options to track 10
BBML3 errata, and enable BBML3 for Cortex-A320, A520 and A720. The result is
much more explicit about what CPUs are supported and what CPUs have errata
preventing them from being opted-in.

Applies on top of v7.4-rc2.

Thanks,
Ryan

Ryan Roberts (6):
  arm64: cpufeature: Remove Neoverse-V3/AE from the BBML3 allow list
  arm64: cpufeature: Remove Cortex-X4 from the BBML3 allow list
  arm64: cputype: Add Cortex-A320 definitions
  arm64: cputype: Add C2-Ultra definitions
  arm64: cpufeature: Track BBML3 exclusions with erratum options
  arm64: cpufeature: Enable BBML3 on Cortex-A320, A520 and A720

 Documentation/arch/arm64/silicon-errata.rst |  26 +++-
 arch/arm64/Kconfig                          | 163 ++++++++++++++++++++
 arch/arm64/include/asm/cputype.h            |   4 +
 arch/arm64/kernel/cpufeature.c              |  43 +++++-
 4 files changed, 230 insertions(+), 6 deletions(-)

--
2.43.0

