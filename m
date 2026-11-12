Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794517539;
	b=g66zwt4S+xDgSLhHrahXE3sD7fAbOC8jhz8Lw9uX3s6I69G2oSDx8OEz8JksFRS0P6Ho
	 f6GYi4y870Eq5mzT5hfddbIcjRdstWJmUilpEevr3j2lgo+rNs7XoHb6ItUfRuY7sodC1
	 buuiuDVmcSOu0sjXeyY6Dd4CAJoxrJFZgi8OTkZz9rQDutyojNGE5wFyx5s6CB4GlKBoj
	 j5jciF4AH9o5v4xWN5DdXmXmtxMCQyVttm97qLd80r2zwVBVMF7nW0i5qS2bWzZUM4/Ut
	 yWyBRrZsMsiYEFBXRtIpic2AePZosPBjryDurvazs+vwq1zJ4dXM9M682CZ/9iWJTzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517539;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:MIME-Version:Content-Type:Content-Disposition;
	bh=Nnihpci5dvzV4RG5w4j5rrlOdcTEXO4ytfQ14nCnRqw=;
	b=0ENHSsGyepxJKjOOMA0Gwd+jkMERvzQ6JeBkjepeDoG4DsaEhiXmq0bSsCxe38EK7Cf8
	 YgABNIjJRp1kp9IvTchsPXfSpu7BTfKhIzWk74avxlNayK6vf9lzy9DP5UpsxrfN3nV0W
	 zl0DhLpInFcI84AB2TAFVMLd3H/jr9kASOgd+j+VPR4vBb7Q0bbMxu1C7VMJSQqljRGLP
	 D7nnai0Qa/c1xq9vNKoL2Qkeao0BKcaUSXuqclm5hpMEqlwi2cpmGFCDTaX+mkif3Oqso
	 0/vmHbYCxwVd0zbLVM8fR1xlYqI1X0kvF423wO/1j5ND4FfMB2Sb7kzGOMOmd2GFLcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NlpcSvnq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7583E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NlpcSvnq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7121F000C4;
	Thu, 12 Nov 2026 21:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794517539;
	bh=Nnihpci5dvzV4RG5w4j5rrlOdcTEXO4ytfQ14nCnRqw=;
	h=Date:From:To:Cc:Subject;
	b=NlpcSvnqYM03smxCXoTR3BZduo9UmbLB6uaR9Pg8Y/oJjnI2MVyuLnY1Sa1F8sbct
	 GzcpGdE3ncJSM55SsHjp4nvvSIOGJYb2XjBi/OTr+X0cM0vF3xDMKnvwpDucYPXvC3
	 11KgN7vBTAKoU3bt5IgT8KzEYw+CdFXmP6dKxKlA+E61pEMUiijJBC1k4Y7kvf/Zsj
	 +mX+4YWnfMSVW9KbJRFY/+7V2yDD1X5GTpqwaPi37hBlj7s12ef9piSngcbqw+L+5A
	 dLuPGk26NN3in/Y+zk40V0fXzbP3i32qYJOSj2tZhLJgNVRw6gYhCXaHTqZPiV4INF
	 UdvgyIBXpZ7LQ==
Date: Thu, 12 Nov 2026 22:05:25 +0100
From: Gao Xiang <xiang@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Daejun Park <daejun7.park@samsung.com>,
	Zhan Xusheng <zhanxusheng@xiaomi.com>, Chao Yu <chao@kernel.org>
Subject: [GIT PULL] erofs fixes for 7.4-rc3
Message-ID: <avYqFWIxinR9JB0O@MacBookPro.fritz.box>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Daejun Park <daejun7.park@samsung.com>,
	Zhan Xusheng <zhanxusheng@xiaomi.com>, Chao Yu <chao@kernel.org>
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

Could you consider these fixes for 7.4-rc3?

There are some recent random fixes (shown below) and a Documentation
update on on-disk format high-level overview.

Thanks,
Gao Xiang

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-7.4-rc3-fixes

for you to fetch changes up to 7906eac042a4d6facd3b2dcebfe7179fedfcf1f2:

  docs: erofs: refine the on-disk overview (2026-11-12 10:31:25 +0100)

----------------------------------------------------------------
Changes since last update:

 - Fix stacked fs check for file-backed mounts with extra devices

 - Disallow file-backed mounts on shared backing inodes

 - Reset metadata offsets when fsoffset= is used to fix xattr reads
   inside and outside the metabox in ont shot

 - Refine on-disk format summary

----------------------------------------------------------------
Daejun Park (2):
      erofs: apply the stacked fs check to extra file-backed devices
      erofs: treat files shared by inode_share as stacked

Gao Xiang (1):
      docs: erofs: refine the on-disk overview

Zhan Xusheng (1):
      erofs: reset buf->off in erofs_init_metabuf()

 Documentation/filesystems/erofs.rst | 120 +++++++++++++++++++++++++++---------
 fs/erofs/data.c                     |   1 +
 fs/erofs/super.c                    |  23 ++++++-
 3 files changed, 112 insertions(+), 32 deletions(-)
