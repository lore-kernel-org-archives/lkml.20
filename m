Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793995284;
	b=XtrSU8PmTRrZ5PKj+ZqAXfmVs4afd0IEKSq3wG4WUwwF252kHmUvsocGCc7W1x69fCQB
	 HbdWCkuELgoc2nSW9cW3jKKSXL3SB5iUKzfPpt7vSjy/PbJ9EfdtJ45tDFBJ4+dlbeIDP
	 q6FxD6uq5UqpIYEQlhEYTObqqW99lDpWPjWmXdAqrGHDrhMikE0c7s6n/E9eykuxYSmIW
	 5lCrsWinXu7LMsmLF8ZM9Me4Eb+h0itRbR59oLR+RYml3pn1y169Tg3miqwy5hbOEGTUu
	 zL1hul4JwGGBybEo+rSznMTNmfI9o5nQIy7FZDJz3LdZ9dAo6r/5boUsLqIcBQwsmaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995284;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=R5DTVliTIzgLtOjZqg2nUZXCBUkscXpY/488e6YJO8s=;
	b=h7K7OlfNwpdEJtg44uxp06jkipCQ+5gWmyo1+N0WDFdgfa46/Jpn2FofnpOHePt4fZK5
	 9EacbRrxlpK26WtYHb0uALp8y7zyJZAlWqjzwa+xsy/q4OPW/SMmquQkQcRI0Qm+gzr2h
	 w5/Hmvm1Jucg5oLoTEtyS1epMiVFnlEFghAYX+iFCSgs7pkPRn8imRncaMl7XShq1uyqS
	 P99ZUjRBi5DnmgedQOuGJ4RALz7QAJDpH9SAEYw2Vm41gQEvP9PRifqNsppmKF0MgOShX
	 ihv0Vnf0J4Sr6F1IZgAeDruOwlWS66P+AEHFWn9FlkzqfeLRx7NEKf5k34m+Bxxp3qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C1w1tsN3;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7485F606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7485F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C1w1tsN3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C5572F;
	Fri,  6 Nov 2026 12:01:18 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DBB23F632;
	Fri,  6 Nov 2026 12:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793995281; bh=AePJOyAuyt/5pF9iqDjaLRnTEjhNW595aixOdlo0gN4=;
	h=Date:From:To:Cc:Subject:From;
	b=C1w1tsN3qDSrKSAXdDNWdeKBbpBF0ud7on1u94eY5VXyol6V27FbNCfPZbHpihMy7
	 fPnleO/Rn+rRH9tnX2X6so1vS1wYBAmGMbocGTLc45bm/kgWDu/zBCLe4Ph15NlVzl
	 WbZKKToTan5QL+G3QB0Z3gjABpCz+ejXlLRmyFtQ=
Date: Fri, 6 Nov 2026 20:01:17 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 7.4-rc2
Message-ID: <au4yDc-l14h7hwMI@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull the arm64 fixes below: SDEI (software delegated exception
interface) handlers taking nested exceptions (looping on the KPTI
trampoline vectors and clobbering the interrupted context's exception
registers), TPIDR2_EL0 preservation across CPU suspend, a
kexec_file_load() memory leak and an overflow in the /dev/mem
valid_mmap_phys_addr_range() check.

Thanks.

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to 58c1eb84e97701c583605ba2fd553b69afba2245:

  arm64: sdei: Preserve the interrupted context's exception registers (2026-11-06 17:43:20 +0000)

----------------------------------------------------------------
arm64 fixes:

 - Fix nested exceptions taken by SDEI event handlers. With KPTI, an
   event interrupting user space left the trampoline vectors installed
   and any exception in the handler looped forever. Also save and
   restore ELR/SPSR/ESR/FAR around the handler since an event can
   interrupt exception entry or return where these registers are live

 - Save and restore TPIDR2_EL0 across CPU suspend. Its value is UNKNOWN
   after a warm reset and the task initiating suspend could return to
   user space with a corrupted value

 - Fix an overflow in valid_mmap_phys_addr_range() allowing /dev/mem to
   map out-of-range PFNs

 - Fix an elf_headers memory leak in the kexec_file segment placement
   retry loop

----------------------------------------------------------------
Jinjie Ruan (1):
      arm64: kexec_file: Fix elf_headers memory leak in retry loop

Kiryl Shutsemau (Meta) (2):
      arm64: sdei: Run the event handler on the kernel vectors
      arm64: sdei: Preserve the interrupted context's exception registers

Wei Wang (1):
      arm64: suspend: Save and restore TPIDR2_EL0 across CPU suspend

Zhao Gongyi (1):
      arm64: mm: validate /dev/mem mmap ranges without overflow

 arch/arm64/include/asm/sdei.h          |  3 +-
 arch/arm64/include/asm/suspend.h       |  2 +-
 arch/arm64/kernel/entry-common.c       | 40 ++++++++++++++++++++++-
 arch/arm64/kernel/machine_kexec_file.c |  2 ++
 arch/arm64/kernel/sdei.c               | 59 +++++++++++++++++++++++++++-------
 arch/arm64/mm/mmap.c                   |  4 ++-
 arch/arm64/mm/proc.S                   |  8 +++++
 7 files changed, 103 insertions(+), 15 deletions(-)

-- 
Catalin
