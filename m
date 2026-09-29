Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22B54EBACC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704735; cv=none; b=kp7VuAwwDbmm3N9/Ey9D0sMg3M+o4owThi6w39twTjIvnOpDuyjI8HJcLhEP0JJuVY3nu5UGH+li9Kxq084wOdpiKWw8HOyxiwt7uPLejiCwGDswycW7KS9wAvQqWHdiggryC7cC3W/RVB6RtSI6BKvRWcFSnu3lFTltOTuiyNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704735; c=relaxed/simple;
	bh=qFAx/pnngE/A8wI8Zu9QmS4CjpyUWSL8VwdOu9yr0KU=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=Cm+Yelio26SHggg256ke3stdf1wu7oJbmH0yVEfGDprflLCIO/LNDH/V+GDTy4SE/+8gMd2a5N98p3WDia2Vf4ovA7cI9RayzE3h87AW0A8kLYUuWMNVhISK0LPqhnEdvaj4GiKcj8yXXV+RRwVYMipA1wB1flkIl0cMcfZ5uGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKUtNz0O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKUtNz0O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827061F000FF;
	Tue, 29 Sep 2026 17:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790704734;
	bh=vk3nxwp/7lZZyp5CGxF5TgatcwDjt9KZTeaXzgNAE2I=;
	h=Date:From:To:Cc:Subject;
	b=UKUtNz0OGYJcm4trvq+cBEKFIwHEtOln0ej9SvH+RCOz2VdQujJo3RG7egLWGrg2A
	 vEpZs5la1aIlchPjzCaQnrCcXaNOehTe+G10L7ZRgm7Qq4861S030WUyTPTNf99RKz
	 LhWd4rB4pXWqhZZ1jEaSkHdXHukdi06NZbpt88khVRibSrHsr6qCnhWz2Yq6OR1UWj
	 se1U9BiKXOMYZXZcTDvevYhjlsEIEzYdofSy+10MV6jttA2QxtDJ8cCqpTE4FR5AK5
	 x7ubb6c7xKx+328SVZDx9BpL/wXODJlAT43syyakIp4W52ggoz7EHDylAJoQ2Q06KJ
	 q9ZCRjpn+uluA==
Message-ID: <edb955af-9153-4db1-8a9e-3d729cb99753@kernel.org>
Date: Tue, 29 Sep 2026 10:58:53 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Bradley Morgan <brads@mainlining.org>, blaze <1466528493@qq.com>,
 Anthony Iliopoulos <ailiop@suse.com>, "Paul E. McKenney" <paulmck@kernel.org>
Subject: [GIT PULL] ARC updates for 7.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Linus,

A bunch of fixes for ARC. Please pull.

Thx
-Vineet
------>
The following changes since commit df2908090cda368b01ff43709f51890076c56157:

   Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ 
tags/arc-fixes-7.3

for you to fetch changes up to f050c3e61d2a1aaece3170d459e4ce5fa2486c12:

   ARC: arch_cmpxchg_relaxed to use size of pointed type not pointer 
(2026-09-24 21:17:09 -0700)

----------------------------------------------------------------
ARC fixes for 7.3

  - cmpxchg snafu [Bradley] and other miscll fixes

----------------------------------------------------------------
Anthony Iliopoulos (1):
       arc: remove unused profile.h includes

Julian Braha (1):
       ARC: cleanup dead ARC_CANT_LLSC option in Kconfig

Vineet Gupta (1):
       ARC: arch_cmpxchg_relaxed to use size of pointed type not pointer

blaze (1):
       arc: kernel: Fix clk reference leak in show_cpuinfo()

  arch/arc/Kconfig                      | 4 ----
  arch/arc/include/asm/atomic64-arcv2.h | 6 ++++++
  arch/arc/include/asm/cmpxchg.h        | 4 ++--
  arch/arc/kernel/setup.c               | 1 +
  arch/arc/kernel/smp.c                 | 1 -
  5 files changed, 9 insertions(+), 7 deletions(-)
