Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B145A36B924
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217443; cv=none; b=V0iVE0ovRqHIfLL6WkmARVDVKCc9GsuOBKCz7oGfMALWUeuDukohtggM+zFW46F9sxjoqUsTScNMActcD4jGAgRxfBu3CgvaGkJtU8vVZRs0yLLJ6xOd+cxXDMArWf3TRDPKdSMbKFK/DPbdzxdp8vR/zNvZlr5SNNZw1IBtp+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217443; c=relaxed/simple;
	bh=hTskU0pOty3fg73gOVtWYEfhrdtDFXkBbS195d7R1/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pp0TOatzXPQwF0AE4Xt0TUNVDayPZcAIB6lbUuadCEbmw8tuXyBrKjMb2PXn3FuVZz7Ab4vSWMmR8DV1Z/Ela3Ve28HuwCk9Adxo7VSEWEL4+CT5dopUYH8EmU81Cjwk5zfszb8OndLhzLxx2PGUkUm2Cs3xFMmUIebuh15qUUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ix5uvgYA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ix5uvgYA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A16F1F00893;
	Sat, 12 Sep 2026 12:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789217440;
	bh=eNq1op5ezbt97IUUfSwak+X0tpZtHNmTMqQGd5E3XXg=;
	h=Date:From:To:Cc:Subject;
	b=ix5uvgYAHl0eXNMygcQoGz1gHxvqrDHoLPrPEgmcirTwmMuSrixPLlH2JVPr9rNbz
	 2aYar/z3fqLSDmDpI18WvNr3Ps974LN72D0UeuSf2OBZI7Kz05xlmZi2Remc6yFQt+
	 JZw6VuFtCTyI+1o5znmPqPn9o3gsvGrh4Yqus9oEZzuAc1BmjfhIX/WxSNqhcsIM6b
	 50s6/P5dp+3yo19SLaCus8HygHRg0pBjNLQgdPQI0CZRAmJb7mesJ948CyOrDUmDea
	 tqsD3/uQh8gCAP+B2la2Us/SaMHXfx0bSSfqiyCjtP/MUwQe0H1yZ/UOuncWtYs6Ju
	 tOmACcpcCMPFQ==
Date: Sat, 12 Sep 2026 20:50:26 +0800
From: Gao Xiang <xiang@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Jingbo Xu <jefflexu@linux.alibaba.com>,
	Nikhil Gurudasani <nikhilgurudasani314@gmail.com>,
	Chengyu Zhu <hudsonzhu@tencent.com>,
	Binglei Wang <l3b2w1@gmail.com>, Chao Yu <chao@kernel.org>
Subject: [GIT PULL] erofs fixes for 7.3-rc3
Message-ID: <aqVKkkgDZCBO-0Df@XiangdeMacBook-Pro.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Jingbo Xu <jefflexu@linux.alibaba.com>,
	Nikhil Gurudasani <nikhilgurudasani314@gmail.com>,
	Chengyu Zhu <hudsonzhu@tencent.com>,
	Binglei Wang <l3b2w1@gmail.com>, Chao Yu <chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

Could you consider these fixes for 7.3-rc3?

The most impacted one is to disable LZ4 rolling decompression for now:
AWS folks recently found their systems could get corrupted data with
some rare, specific LZ4 datasets, and after a deeper analysis, I found
the root cause is that there could be uncontrolled backward memory
copies in the current LZ4 implementation and it breaks the assumption
of the rolling decompression optimization, since the kernel LZ4 codebase
is out of our control and it needs more time to plan how to do next, so
disable LZ4 rolling decompression for now to ensure data correctness for
real production on these rare cases first.  The technical details also
see the corresponding commit.

Other changes are random minor fixes.  All commits have been in -next
and no potential merge conflict is observed.

Thanks,
Gao Xiang

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-7.3-rc3-fixes

for you to fetch changes up to 135d84c66f85426299db01a09d93a79a87af18ba:

  erofs: add missing buf->off in erofs_bread() (2026-09-11 12:16:20 +0800)

----------------------------------------------------------------
Changes since last update:

 - Fix the missing sysfs feature entry for xattr prefixes

 - Fix invalid LZMA decoders on resize failure

 - Disable LZ4 rolling decompression for now due to the uncontrolled
   LZ4 implementation

 - Rearrange the inode_share cache key to avoid potential collisions

 - Fix erofs_bread() when fsoffset is used on sub-page-block EROFS
   filesystems

----------------------------------------------------------------
Binglei Wang (1):
      erofs: add missing buf->off in erofs_bread()

Chengyu Zhu (1):
      erofs: delimit inode_share cache key components

Gao Xiang (1):
      erofs: disable LZ4 rolling decompression for now

Jingbo Xu (1):
      erofs: add sysfs feature entry for xattr prefixes

Nikhil Gurudasani (1):
      erofs: preserve LZMA decoders on resize failure

 Documentation/ABI/testing/sysfs-fs-erofs |  2 +-
 fs/erofs/data.c                          |  2 +-
 fs/erofs/decompressor.c                  | 55 +++++++-------------------------
 fs/erofs/decompressor_lzma.c             | 18 ++++++++---
 fs/erofs/internal.h                      |  6 +---
 fs/erofs/sysfs.c                         |  2 ++
 fs/erofs/xattr.c                         |  9 +++---
 fs/erofs/zdata.c                         | 18 ++---------
 8 files changed, 39 insertions(+), 73 deletions(-)

