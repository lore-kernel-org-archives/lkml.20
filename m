Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595968;
	b=MI74wiShU/Qy+hZKr1BLqw7CiqLFoJeeswq1bgfclxrttry6SVWdhY/J5lhgJaArgDoI
	 MS0JaS3hDeFvEMx1djHZcNxsjGJTBPe+4WyscWw3hSNzQof38R2tDcvseUsUGmR9+kY2O
	 cx6IFtjwxq87CBANcbcjrfa4r3l1fvg4woTtEyD/JaBB+jZSo1eQ8E3VgylCzYvjDuqBy
	 8yXAAQnNOZb1ZN1pqXNxUyuHGjLHLHJhYSz5gnUyPz0GTr1GBkdwiG8Xc05ipuec/b338
	 xc38WsjwP+QkqcoxGyN625zwYfuTqsaj7r8tgjH6BTtl8ptEAdpDRR2KZ4Cpeo/slWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595968;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2MDi62zSrUcHu3jIKja7h0mngHAeGSbDpYPRSVAWgbk=;
	b=XD8X2MuqcK1zHXIyUUf90ge+4tJe9/pgSphPUzjUWO6diMI4jDDe5IeubUvVAGsihECi
	 rLHHrDw8iaZTjnHHec7FWdq24WpoiYAqR5qqvQTwpMq5brzooOWM9C4A2fyymfXaqo6n+
	 ZWuguwiVUxwEBVRk6Njk8GUGoszR7KK/DAdy4sLo02X7vDjxQEh3GaVBLkJ167SBeUQuA
	 qLEDOpwglaaM8cJoYhqRf8f9lbBSmIOCFo93ZF2OYfrrG5o4iakGB6H5JpuFV3m1YkzDm
	 sz7xf8t2+vLYJzOwTOvUIsbZOl883483Yr2kraujdWgG8dgy/cbCtWgjxb9UQT/H8qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EtuBOIjW;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80CA606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E80CA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EtuBOIjW
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDF58143D;
	Fri, 13 Nov 2026 10:52:43 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 290A13F673;
	Fri, 13 Nov 2026 10:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794595966; bh=LmDTb5gajHHD2PRP+VluaoNil6RAYYnV0tkAZjWtwU8=;
	h=From:To:Cc:Subject:Date:From;
	b=EtuBOIjWX1OobRGrYVOS9JSxIrN3DhzJ/ppQVVbFMWaa+1b0Y9/oPLH+6Ejaddpc2
	 plRKB/EWMABFESSlx64g2Me4w4mwqaafKAdukvOoSx4Sx/dMpWU4m9py8xzIbwR5NG
	 FNtWFZJy3ScjUqBvq93OytCicqBAjF2Tv4eXx7NM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 7.4-rc3
Date: Fri, 13 Nov 2026 18:52:41 +0000
Message-ID: <20261113185244.3798402-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull the arm64 fixes below: hugetlb write fault livelock,
permission overlay and GCS state preservation across CPU suspend,
cpuidle context tracking during system suspend, GCS mode handling on
signal return, AMU counter errata workarounds, kexec loading of images
with a non-zero text_offset and a spurious ptrace warning.

Thanks.

The following changes since commit 58c1eb84e97701c583605ba2fd553b69afba2245:

  arm64: sdei: Preserve the interrupted context's exception registers (2026-11-06 17:43:20 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to ad3fc05c7e65009355effeea06aa629a687acef2:

  arm64: suspend: Only track cpuidle context for idle tasks (2026-11-13 17:12:34 +0000)

----------------------------------------------------------------
arm64 fixes:

 - Fix hugetlb write fault livelocks caused by stale read-only TLB
   entries after another CPU makes the page writable and only performs a
   local invalidate. Unlike the generic fault path, hugetlb has no
   fix_spurious_fault() fallback

 - Save and restore POR_EL0, GCSPR_EL0 and GCSCRE0_EL1 across CPU
   suspend

 - Restrict cpuidle context tracking in cpu_suspend() to idle tasks,
   avoiding context tracking warnings during system suspend

 - Ignore attempts to change GCS mode through signal return, which
   updated the software state without updating the hardware. Changes
   made through prctl() in the signal handler are preserved. This
   changes the documented ABI but no known userspace relies on it.
   Allowing mode changes through both prctl() and signal return also
   creates confusing interactions, with signal return potentially
   undoing changes deliberately made by the handler

 - Extend the AMU constant counter workaround to additional CPUs and
   add a core cycle counter workaround for Cortex-A715/A720, treating
   the affected counters as unavailable

 - Avoid CMA allocations when loading a kexec Image with a non-zero
   text_offset, fixing an incorrect entry point and a memory leak
   when freeing the image

 - Remove a spurious ptrace warning when setting the syscall number
   of a task in a non-seized group-stop without siginfo

----------------------------------------------------------------
Beata Michalska (2):
      arm64: errata: Extend the workaround for broken AMEVCNTR01 counter
      arm64: errata: Add Cortex-A715/A720 AMU core counter workaround

Chris Down (1):
      arm64: hugetlb: Prevent write fault livelocks on stale TLB entries

Jinjie Ruan (1):
      arm64: kexec_file: Do not use CMA for images with a non-zero text_offset

Mark Brown (3):
      arm64: suspend: Save POR_EL0 over suspend
      arm64: suspend: Save GCS state over suspend
      arm64/gcs: Ignore attempts to change GCS mode during signal return

Uladzislau Zhauniarovich (1):
      arm64: suspend: Only track cpuidle context for idle tasks

Zhao Gongyi (1):
      arm64: ptrace: don't warn on missing siginfo in a group-stop

 Documentation/arch/arm64/gcs.rst            | 13 +++------
 Documentation/arch/arm64/silicon-errata.rst | 12 ++++++++
 arch/arm64/Kconfig                          | 44 +++++++++++++++++++++++++++--
 arch/arm64/include/asm/suspend.h            |  2 +-
 arch/arm64/kernel/cpu_errata.c              | 28 ++++++++++++++++++
 arch/arm64/kernel/cpufeature.c              |  3 +-
 arch/arm64/kernel/kexec_image.c             |  7 +++++
 arch/arm64/kernel/ptrace.c                  |  8 ++++--
 arch/arm64/kernel/signal.c                  | 22 +--------------
 arch/arm64/kernel/suspend.c                 | 11 ++++++--
 arch/arm64/kernel/topology.c                |  3 +-
 arch/arm64/mm/hugetlbpage.c                 | 21 ++++++++++++--
 arch/arm64/mm/proc.S                        | 20 +++++++++++++
 arch/arm64/tools/cpucaps                    |  1 +
 14 files changed, 151 insertions(+), 44 deletions(-)
