Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32994078DC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428249; cv=none; b=kFvXWI8iRbYPNdpWFgGGWNJ2LsIG7jqlKY3/XL+w/ZexK8+mRPrK+ERpLjHWsBEtcnkiti+vD6v1C6DeAXXwwAoMX9gyiddILzIYssnzJ5cj5Jp2K1PjKBAFs7tXdmr7MC7XAG2B/hmMhosF8hG5luwNiSsrtPTrpOkxopxhvjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428249; c=relaxed/simple;
	bh=Oi9ncm1X1CkXg0ZjtHaZsfDgIq48EMYEhrTbfZoJMak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XWYCM9PSGGITWGlz7zIElM2x5+3CQs99T9P5h6RSXltFaG/6njGs5qkXkLGMqKPUjoscer8DKsD3aCvSUE+UD4XVkdR0uKTfjuXXXOAY3YT4lA2TC+trsOctzMle6WqIXidkMbVZOCFNE+4exRo6nPGBUo0QxL/ffGC04xa7PtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8hHeWmD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8hHeWmD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468E61F000E9;
	Thu,  3 Sep 2026 09:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788428248;
	bh=maHZoC5k3pW4B24ARIAH7ZjE/zDEUIeXWf2OnTCKjQ0=;
	h=From:To:Cc:Subject:Date;
	b=Y8hHeWmDiUfqEJS/cIPa9KtJpTfORyJE3kxSoKNnDY9wOmIY3pvl6eqxpHlcLjqtn
	 1fyK4SYgYfzSNxS7GmRA1HGv4k+4Sym7384lYs2klQhqaoEtzAm8+rOO4h+Nt9/eZm
	 iM6VvzdXhqS4+bbErW7vSVM73ipLksPARxRJdnamnY0kIoNjz+63IWdqDiz93h+YW1
	 I7I0BGdG9Ahg5UUqkNoe5t6hclbifKherdQ3UoH3zqQa4ffJ/18nHC1phQ5uXbswwE
	 +noymbtSSdD6HIjzFwYyVmAicj/kxNX9Oij60u+PiZqa/elOW/l5Qd7KgDds6IcvSS
	 gf2TtRSRlcpow==
From: "Naveen N Rao (AMD)" <naveen@kernel.org>
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Bharata B Rao <bharata@amd.com>,
	Manali Shukla <manali.shukla@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RESEND v4 0/3] x86/apic: Add support for additional AMD EILVT registers
Date: Thu,  3 Sep 2026 14:58:38 +0530
Message-ID: <cover.1788425679.git.naveen@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for additional APIC EILVT registers being introduced in 
future AMD processors:
https://docs.amd.com/v/u/en-US/69205_1.00_AMD64_IBS_PUB)

This is a resend of v4, rebased on tip/master. Previous posting:
http://lore.kernel.org/r/cover.1784785046.git.naveen@kernel.org

Since then:
- I have retained the macro name 'APIC_EILVT_NR_AMD_10H' since I felt it 
  is accurate, and didn't hear a preference for anything else. Happy to 
  change if needed (Ingo)
- I have gone through Sashiko's findings on the previous versions, and 
  none of those justified a change. Other than the pre-existing issues
  reported by Sashiko, there have been 3 findings:
  1. Sashiko seems to be confusing the Max LVT Register index field in 
     APIC Version Register, with the EILVT Count in EFEAT. The former is 
     the maximum index, while the latter is the count.
  2. Secure AVIC driver handling of EILVTs: that is not impacted by this 
     change since the driver never consults the hypervisor value today. 
     The driver will require separate changes regardless.
  3. Need to clamp the maximum EILVT register count to prevent incorrect 
     MMIO accesses: this is not an issue since all offsets being 
     programmed are appropriately clamped at the source.


- Naveen



Naveen N Rao (AMD) (3):
  perf/amd/ibs: Limit the max EILVT register count for AMD family 0x10
  x86/apic: Introduce a variable to track the number of EILVT registers
  x86/apic: Drop APIC_EILVT_NR_MAX

 arch/x86/include/asm/apic.h    |  2 ++
 arch/x86/include/asm/apicdef.h |  2 +-
 arch/x86/events/amd/ibs.c      |  4 ++--
 arch/x86/kernel/apic/apic.c    | 17 +++++++++++++++--
 4 files changed, 20 insertions(+), 5 deletions(-)


base-commit: 461735aa6e8e357fb90d2cf827d2b15ce78a1bc7
-- 
2.55.0

