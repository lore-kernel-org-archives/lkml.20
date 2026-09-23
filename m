Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17813C819B;
	Wed, 23 Sep 2026 21:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197754; cv=none; b=k+tq2hgG5OnBh15iS+sJvfYyAwgwAz2jZ76O42QQNqmlKSA9236VuZ7W3XwG/BGU2y/0Oz8oFOxqg3Ppy1zYKbijyyTvNUuHlpwCaYpc4+tHvtJxYNNEQJBEXiqQXUSM/wtXHqFK4LzIOxDgBmTvOVR6ikd/PlaqYyMz+3u6YHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197754; c=relaxed/simple;
	bh=wtEGGMO3DPG62Sr6SgtjiZ9dYBhzHClARU1EvI5jbrA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FisHks+16NiOv4aTY8LlBKFdviWFD5SYAGKIYFN9h4qbdDcrsZY/cjSBpAxoEMh50/pGZIFS3cezj63hBkU8RIKAEYU/Wjhl+j+DgA7tozGhIDdSzA+8aI9jFnlkCR+wEnrTHdh49kDSnwLhDa0IyAYMqzWaOUL2ydMNYtm6/YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TguZnFGs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TguZnFGs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691631F000FF;
	Wed, 23 Sep 2026 21:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790197748;
	bh=0I8OliWp57JKeRNoalAVk1cHol4oFIDEMtHC9uRftOE=;
	h=Date:From:To:Subject;
	b=TguZnFGsjN6IInvylxerxRT2KmK56gIqhI5wi7+f9W4sCG9PtsSXCu/yT//49wtR+
	 kUHn3jW58BSnRoF0so1wHT0v5b44B9ratgFFvz+8tQ7Xz/+8gpnLIfc0vVzE4+yHvJ
	 V/cQ6SWxCAD3BYHIU7kggXybVOyVHN/xbpAP1vPhYHMFVTEz1JzZ1V2ckPQz3uEpsQ
	 BSx0C/L9beKVBJ6eSEgW0qJ04dOrF4hzmApl1CQM/NGJ2VwusHyjE02q4la1aVCHSR
	 vaPt0U6euw1samO/p8s76r37DcKPjT8Xb6x+yvZRsQfwC/lK0HaCvFqdXy5vJm57PR
	 HNju+fHx0vXxw==
Date: Wed, 23 Sep 2026 23:09:04 +0200
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
Subject: [GIT PULL] parisc architecture fixes for v7.3-rc5
Message-ID: <arQ_8PdL1PPCVXh_@p100>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull a four small patches for parisc for kernel 7.3-rc5:

Prevent kernel stack overflow, fix parsing huge page parameters & fix unwind code.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.3-rc5

for you to fetch changes up to 94b7e3a7e871ae27d4935c76959dfc61829f27f9:

  parisc: Increase kernel stack size to 32kb (2026-09-21 22:19:09 +0200)

----------------------------------------------------------------
parisc architecture fixes for kernel v7.3-rc5:

- Increase kernel stack to 32kB on 64-bit kernel to avoid crashes
- Parse early parameters in setup_arch() to enable huge page settings
- Replace open-coded binary search with bsearch() in unwind code
- Remove unused <asm/compat_ucontext.h> header

----------------------------------------------------------------
Ethan Nelson-Moore (1):
      parisc: remove unused <asm/compat_ucontext.h> header

Helge Deller (1):
      parisc: Increase kernel stack size to 32kb

Sean Young (1):
      parisc: unwind: Replace open-coded binary search with bsearch()

Zhenghui Hao (1):
      parisc: parse early parameters in setup_arch()

 arch/parisc/include/asm/compat_ucontext.h | 18 -----------------
 arch/parisc/include/asm/thread_info.h     |  2 +-
 arch/parisc/kernel/setup.c                | 12 +++++++++++
 arch/parisc/kernel/unwind.c               | 33 ++++++++++++++-----------------
 4 files changed, 28 insertions(+), 37 deletions(-)
 delete mode 100644 arch/parisc/include/asm/compat_ucontext.h
