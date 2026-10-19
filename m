Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440655;
	b=S/ZRHTb/73MLPUQV9XwDsYq4+r5bsuJ0DpM9/Mnn/qeiP76L9woEGQPVSgCCB07TR5h9
	 EKMPnl6crZIc1r5Al4ZTdXwoC4ytmzlSVINKAPYHMcr/CN3I4YOeq+vEL9gCQlCXzhvum
	 bWZVm+uzLwZm+DYIcR36p4DRernyozRjYhlxS96IA8PqF3ovCtWIGnuNq9uQS89yjoUO0
	 8YkSKvZPOX1wUafJLqSGkwI1w5m8pnRy7WNi8qtrSSB0gtrZv4Nof1LNenL5KWdno1ttC
	 mofRXnFCZ0Vha4RwDtUCGfNxw2Fcp4kxc9ibHaWM3SeGqDpeDDxFdwTgK54VJTeO4fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440655;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:MIME-Version:Content-Type:Content-Disposition;
	bh=qidcyy0hfoTCKGqGDR7rx4LiUit+fnvx+mfaoo40PIs=;
	b=4q0uuG+m1F983D14Roe01DaiKeCi6K+caubJvh0ociQ+yyhTdjwsW31l9S5PUUO7ktmX
	 7AML1R76MFDqcAIpjSXzoXV1fsF2g0PxgkPUqks9eIN3+Uu7n/hDrulZJdG7HCWReTq40
	 2g2RstykTXb1itByScBvyJ45ZY4reuqzhTBs6bbBGHywAHRAws2WayBDhbFGqDTDBMUPv
	 vDfbDc5iGJv8o2Gr484+MQ3N7PlYq900fFY5+NyHMPljlaDk2CWu0ggKONd4JV8yxa9zk
	 DXDvYhDi+uKF7rpy6UOE3Jju88K7W4eSz5RPrJSVz5kJ1RmOpn6WrtOcG+Jdr3mIEIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HhX7jsHF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7BE606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HhX7jsHF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0181F000C4;
	Mon, 19 Oct 2026 20:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792440654;
	bh=qidcyy0hfoTCKGqGDR7rx4LiUit+fnvx+mfaoo40PIs=;
	h=Date:From:To:Cc:Subject;
	b=HhX7jsHFE6lelJYBSux0lB7vMAvDLPWpxRsOJYXUChc6CpiA8Y/nprIN1uNmNclVs
	 IXCoB532F3waUePdBuO2Zpj9yEAQXGHcKQl/Ta+wX7e2z5+OLFbJzEHAnpkcI4gmst
	 aC5IfMj6MdFY4/Mtg6WHzVVHn6KjJgi92O1eekpuEaqt4AeDOPMr3iwT/n18ODyhMH
	 guVpfw70wmYBzTjwJEpxuLKM3UdGpVxAEv0bRRs1VSbohJ3OzDkd1eX8Di1fmDteSE
	 6tFtlbfxv8OewnojPtbMHtYXRJ8FtUzFurug5T/pwUi3excPFLxaMK9xsuEm0lrAqz
	 KiZHd0ulv1j8A==
Date: Mon, 19 Oct 2026 22:10:41 +0200
From: Gao Xiang <xiang@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Binglei Wang <l3b2w1@gmail.com>,
	Giuseppe Scrivano <giuseppe@scrivano.org>,
	Chao Yu <chao@kernel.org>, Jingbo Xu <jefflexu@163.com>,
	Gyokhan Kochmarla <gyokhan@amazon.de>,
	Christian Brauner <brauner@kernel.org>
Subject: [GIT PULL] erofs updates for 7.4-rc1
Message-ID: <atZ5QThkCK8UnB28@XiangdeMacBook-Pro.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Binglei Wang <l3b2w1@gmail.com>,
	Giuseppe Scrivano <giuseppe@scrivano.org>,
	Chao Yu <chao@kernel.org>, Jingbo Xu <jefflexu@163.com>,
	Gyokhan Kochmarla <gyokhan@amazon.de>,
	Christian Brauner <brauner@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

Could consider these commits for 7.4-rc1?

The most notable change is to support superblock sharing for composefs,
thanks to Giuseppe again: it needs a vfs change, which already goes
through vfs tree [1] so I merge the corresponding vfs branch.

Another one switches to iomap for file-backed mounts on unencoded inodes,
which enables efficient sub-folio I/Os. The others are all random ones.

All commits have been in -next and no potential merge conflict is
observed.

Thanks,
Gao Xiang

[1] https://lore.kernel.org/r/20261016-vfs-7.4-rc1.shared.super-9c2de4415e8b@brauner

The following changes since commit a90ee4305c4a5df72c11b31dacfdc76e00fcf78a:

  Linux 7.3-rc6 (2026-10-04 13:45:25 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-7.4-rc1

for you to fetch changes up to 1137aa577a35e2684e8046c3e53f920e79c7cc60:

  erofs: enable iomap for file-backed mounts on unencoded inodes (2026-10-17 17:29:36 +0200)

----------------------------------------------------------------
Changes since last update:

 - Support superblock sharing for file-backed mounts

 - Use iomap for file-backed mounts on unencoded inodes

 - Minor fixes and cleanups

----------------------------------------------------------------
Binglei Wang (1):
      erofs: fix xattrs handling when metadata compression is used

Chao Yu (1):
      MAINTAINERS: erofs: add dev branch to git tree entry

Christian Brauner (1):
      Merge patch "erofs: share the superblock for file-backed mounts"

Gao Xiang (3):
      Merge branch 'vfs-7.4.shared.super' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
      mailmap: update entry for Gao Xiang
      erofs: enable iomap for file-backed mounts on unencoded inodes

Giuseppe Scrivano (2):
      fs: rename vfs_get_super() to get_tree_super() and export it
      erofs: reuse superblock for file-backed mounts

Gyokhan Kochmarla (1):
      erofs: use on-disk blkszbits for lz4 max pcluster bound

Jingbo Xu (1):
      MAINTAINERS: erofs: update my email address

 .mailmap                            |   1 +
 Documentation/filesystems/erofs.rst |   7 ++
 MAINTAINERS                         |   4 +-
 fs/erofs/data.c                     |  34 ++++----
 fs/erofs/decompressor.c             |   2 +-
 fs/erofs/fileio.c                   | 157 +++++++++++-------------------------
 fs/erofs/internal.h                 |  12 ++-
 fs/erofs/ishare.c                   |   4 +-
 fs/erofs/super.c                    |  56 ++++++++++++-
 fs/super.c                          |  19 ++++-
 include/linux/fs_context.h          |   4 +
 11 files changed, 161 insertions(+), 139 deletions(-)

