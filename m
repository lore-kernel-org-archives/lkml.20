Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794129986;
	b=BPfZWS1RnySmNhI7OCjyYSImCcT62jFLcuvpWwyuZWNmCjkK4DU8BuTyiylH1K6i2NEC
	 Zs84Q1rDF3foebhBXprIMzmjkuGe/WefgvEDmVdGRBJkPclHLGa1iaw8rEtspF1WWEHqe
	 8+kq1cWfc38Bho+y1fudqsBVPATfNtTvk6/+NV29qwAufXflIHRzKkrbuoSRj3pIkZdxi
	 q1UB+xj6hyKdw53zX5JlC5IVE1RjiT0rydl1sUs7R9DFsvviJoIYzcJp+0j90R6IFaPsP
	 r+Fdnh8qDbd1IgpM1vZcgCCm4yKHl0UwSWGnduRnjBfw25KAqHwz7RIq+oL1K52AoUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794129986;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=mfqVrDBy8CKgb42Ov7D4LXPqX3M1hEPgRe88wpo+3VE=;
	b=ISS5vlXJgLoTzsv99kjHXV5C5SMLVZVVDHn5vHzDuC5fvclONj1BCjNIkOCGFPp9IYPA
	 X1ICBlHkyD2HykwEJdkmFZlEq5yH30xOuMkTmi7yIYpYAOE0AV4K2X+Ho360CqJ+iQGv9
	 Kamj+noB2TKx5r6jXaTbL6mAZCZ6zELerJ8SJ2/9lmsBmPvwcAvNh/AmjhirStyvTkrmA
	 Vrh30s2MGwcf6xXdjk7l46JKEKBSE/OWYTefbZAX5blkLc71fAGCv0LqpyvTLIeBcZaeh
	 YkOafN8coXHOaMMwXSfdfYCku7ZrhL8pW6++vucM0UOANbD96y6SzIwvc/Mu2OkkZHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PuNJGK5z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB681606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PuNJGK5z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E521B1F0089F;
	Sun,  8 Nov 2026 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794129985;
	bh=mfqVrDBy8CKgb42Ov7D4LXPqX3M1hEPgRe88wpo+3VE=;
	h=Date:From:To:Cc:Subject;
	b=PuNJGK5zeYiqJWJh8pR4pmP+4HEwpTCfyTIUBaQmQsZGuigeQ/BeIotQsZZQW+8Ix
	 n7Mdj9R5fjVvrXZFc+6ZDJNYKnuWLShAuPNFueWrExNHjGHupuEXHf+xo5eIsCM5Sf
	 bZcl1CpYn33pYQ2vtEq41plHxRurJao/5CA8RD5nzdTH61OwOh+aoAkV1toOkQ9mqS
	 LYUnDYmNRyqKhg8XCQrgjKU650CpTnrY9feDWJng72MD+pA+lFedVdQkIJGnqO4p/u
	 clTIb6JW9KNLq7DKG5fXEFtDlVf17ScvoxyVJ821HBby96gV9T4AO7m2UWcndPg2wR
	 xdUwIPfMlHNyQ==
Date: Sun, 8 Nov 2026 10:26:21 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [GIT PULL] x86 fixes
Message-ID: <avBAPReJ7qMWur2g@gmail.com>
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

Linus,

Please pull the latest x86/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-11-08

for you to fetch changes up to 5cdc3746fa163fb4e8d05fa3cabf46bc6aa7df75:

x86 fixes:

 - Select the BHI mitigation based on the attack vector properly
   (Breno Leitao)

 - Fix i386-gcov build bug in csum_ipv6_magic() due to overly
   strict asm constraints that cannot be met in that build mode
   (Rosen Penev)

 - Fix Vmware-guest i386 high-bandwidth hypercall arguments
   under UNWINDER_GUESS & disabled frame-pointers (Zack Rusin)

 - Fix resctrl AMD ABMC counter ID field width (Babu Moger)

 - Fix restctrl pqos tool ABI breakage by reverting the
   mbm_assign_mode to default mode at boot (Babu Moger)

 - Initialize wall clock in get_rtc_noop() (Naman Jain)

 - Fix ptrace historic ABI quirk regression (Thomas Gleixner)

 - Add Drew Fustini as resctrl reviewer and Ben Horgan
   as fs/resctrl reviewer

 - Clear SEV RMPOPT when segmented RMP is disabled by firmware but
   is advertised as available (Ashish Kalra)

 - Set up SEV RMPOPT only on an active SNP host (Ashish Kalra)

 - Don't emit KCFI_REFERENCE() in modules (Ridge Lomont)

 - Ignore negative NMI handler durations (Breno Leitao)

 - Fix off-by-one error in boot-time sme_clear_pgd() (Thorsten Blum)

 - Fix ASID allocation bug (Chris Mason)

 Thanks,

	Ingo

------------------>
Ashish Kalra (2):
      x86/sev: Clear RMPOPT when segmented RMP is disabled by firmware
      x86/sev: Set up RMPOPT only on an active SNP host

Babu Moger (2):
      x86/resctrl: Correct ABMC counter ID field width
      x86,fs/resctrl: Keep mbm_assign_mode in default mode at boot

Breno Leitao (2):
      x86/bugs: Select the BHI mitigation based on the attack vector properly
      x86/nmi: Ignore negative NMI handler durations

Chris Mason (1):
      x86/mm: Fix global ASID handed out to two processes

Drew Fustini (1):
      MAINTAINERS: resctrl: Add myself as reviewer

Naman Jain (1):
      x86/init: Initialize wall clock in get_rtc_noop()

Reinette Chatre (1):
      MAINTAINERS: Add Ben Horgan as fs/resctrl reviewer

Ridge Lomont (1):
      x86/kcfi: Don't emit KCFI_REFERENCE() in modules

Rosen Penev (1):
      x86/csum: Relax the len and proto constraints in 32-bit csum_ipv6_magic()

Thomas Gleixner (1):
      x86/entry: Fix ptrace regression

Thorsten Blum (1):
      x86/boot: Fix off-by-one error in sme_clear_pgd()

Zack Rusin (1):
      x86/vmware: Fix i386 high-bandwidth hypercall arguments


 Documentation/filesystems/resctrl.rst  | 87 ++++++++++++++++++++--------------
 MAINTAINERS                            |  2 +
 arch/x86/boot/startup/sme.c            |  2 +-
 arch/x86/entry/syscall_32.c            |  4 ++
 arch/x86/entry/syscall_64.c            | 26 ++++++++--
 arch/x86/include/asm/checksum_32.h     |  2 +-
 arch/x86/include/asm/vmware.h          | 24 ++++++----
 arch/x86/kernel/cpu/bugs.c             | 12 ++---
 arch/x86/kernel/cpu/cpuid-deps.c       |  1 +
 arch/x86/kernel/cpu/resctrl/internal.h |  4 +-
 arch/x86/kernel/cpu/resctrl/monitor.c  |  4 +-
 arch/x86/kernel/nmi.c                  |  8 ++++
 arch/x86/kernel/x86_init.c             |  2 +-
 arch/x86/mm/tlb.c                      | 16 +++++--
 arch/x86/virt/svm/sev.c                | 20 +++-----
 include/linux/compiler.h               |  7 ++-
 16 files changed, 137 insertions(+), 84 deletions(-)
