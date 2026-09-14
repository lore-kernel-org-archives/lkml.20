Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F8A311968
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789362944; cv=none; b=IZLU6shbRKLSRvFdoh1LWgu+FBzRrB9QShRKNgLmhk5Us14yul/SCdbrLBDr0gG2pN5o8SmCgNhdGgBtBwPgdAG2QjmPCCwFVYRDUXMh/SV3VMg/Yt0L8i2W6/LyMZqjlf6bCclUzEgmK0xx3iiekAhQnMio8S8ImC0GGRUNz4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789362944; c=relaxed/simple;
	bh=JWc6kL5u++skIy2R+4WnVwWp8bEoyApVyvKKd5rYzms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r1lhw3CAAHa6Yuy+xnnSrscF+3LqRq6rVbX3dJJLZjLB2mzotDyv7InScF+k/WN/rHRWL/UA4BBRSsDz9uJoy0XFG1bYuPSBTgYmqJ7wRY1yXokaQ3IBua7z+52UnlLOVbBAqBy23lEKA7Qd8HMdr0HUBujh0yO15gPey68mECQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIoY0t5E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIoY0t5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CF61F000FF;
	Mon, 14 Sep 2026 05:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789362943;
	bh=GUDBwHEEq7TXUANzZfGT2Bt6VxcKoDJkKvK4JgFLejE=;
	h=From:To:Cc:Subject:Date;
	b=SIoY0t5EzeuOkLvjtAI9DpiOH9foAsEuv9DTc0qYR5BDO1OV/wd0/VbmqSy2Vdhdp
	 /7e+ueiyud+pXuWZDJNoTCWV7nFAhypxY2SJ1TI4e6cM1yZ5ymmsnUIhfKGJ4mci1a
	 7CvIJwB5MPf6Xm8lgC/xTaN6aqouZu7bHV3EV4asRP25wQ2k+vtZPOgD0FY+L5pDwg
	 qARStT88+ooiNtlsaiCHA7gXJ/EEOA/qn55XAgKnjU0olnZYxKN1nUts2XqosOq87O
	 GSYAXWVIp8CFO5C4oELu2GZrswwYoKe/n4B8XIZ4KwgxLWuR5J7FHoM/EikXd5abVa
	 nep++2t735iZg==
From: Mike Rapoport <rppt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [GIT PULL] memblock: fix for regions display in debugfs and MAINTAINERS update
Date: Mon, 14 Sep 2026 08:15:32 +0300
Message-ID: <20260914051534.4085114-1-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock tags/fixes-2026-09-14

for you to fetch changes up to 6e33dc90df108c76899dc544a42d17adcba61668:

  MAINTAINERS: update memblock tree URLs (2026-09-09 20:28:14 +0300)

----------------------------------------------------------------
memblock: fix for regions display in debugfs and MAINTAINERS update

* Make sure that multiple flags on a memblock region are all displayed in
debugfs

* Update memblock tree tags in MAINTAINERS

----------------------------------------------------------------
Meijing Zhao (1):
      mm: memblock: show all region flags in debugfs

Mike Rapoport (Microsoft) (1):
      MAINTAINERS: update memblock tree URLs

 MAINTAINERS   |  4 ++--
 mm/memblock.c | 18 +++++++++++-------
 2 files changed, 13 insertions(+), 9 deletions(-)

