Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E85B3CAA55
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791716065; cv=none; b=Yx0XUGKXKJrheZl/VCbkwVWovKKKH19O1UbpBuLUFii8dGeD4JDtIdYe7oiPqOXB8VZVtP0tc3q5GmCiCybTuFWSwE9CI6iYmEb/lQsY5+M0O13c+MY0lwN9bNLYVdHcNEOipzfKduyiK68SCDOrtIPc9GiCc3HZqkbh5HWDfws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791716065; c=relaxed/simple;
	bh=oo1++Z+45kdoNDO+pHDlSuwcXsCm4emEXut+2HJaqOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j1QEt+GCEe6/U7/3InkwYAv2M4pRaleYFW0vVAUP5bj4XN9qDotirH/+Kc4jyQnC6P/wBwJVDomKAATybBE8Z+xQAb18Meb78xH302Rem3+VZM9Vbguex0OFfR6fbJkh5f/Tz4NXYCJW3PF3TzoCuXRhSQR9Se5pPX4KnpbQl2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbE7todP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbE7todP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A121F0089B;
	Sun, 11 Oct 2026 10:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791716064;
	bh=v8T6AnIERHoeWGzM/LYoXgxvl1Yh8QZpFEQ9OU58m5c=;
	h=Date:From:To:Cc:Subject;
	b=dbE7todPlvvtI151M2UUpe5pxPbGFSh4twsauyCK0vEkw7S5RA16njRZJ6Q/nzUZi
	 0b/3omudmEcN4I5WhC49T5xVKTg/2lm3k8f8oKOboe88rtSQ62ZFd8SuGYmyXrU7L2
	 HOU7SF9zbWf2r4wWQvW4JErvIJx5ln4RRy1Z08Kp+f93YFz+vSoFLj1wwF+JzaOPxl
	 v/SQg+ELCOb4dGvlYcPpQvrdn7AVEEUIESRGyeHJ3yc//plus7/rCtYXq7Q5+1d8cS
	 Q6fj2KxiL3PdPaoKLxxT0483g/mVQW1JMMKfNGM3lR3SFL9k8ej86zWw3lRi3HoeiI
	 pNtId4zoVKjkA==
Date: Sun, 11 Oct 2026 12:54:19 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [GIT PULL] x86 fix
Message-ID: <astq2yZg1CBM70Q3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-10-11

   # HEAD: 87db7795cbaaf636ae22ae031f4906db7bb77803 x86/CPU/AMD: Fix AMD TLBI Erratum #1718

x86 fix:

 - Work around AMD TLBI Erratum #1718 (Borislav Petkov)

 Thanks,

	Ingo

------------------>
Borislav Petkov (AMD) (1):
      x86/CPU/AMD: Fix AMD TLBI Erratum #1718


 arch/x86/include/asm/cpufeatures.h | 3 +++
 arch/x86/include/asm/tlb.h         | 6 ++++++
 arch/x86/kernel/cpu/amd.c          | 4 ++++
 3 files changed, 13 insertions(+)
