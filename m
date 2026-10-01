Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703DA26ED40;
	Thu,  1 Oct 2026 19:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883364; cv=none; b=Vox0m2go4ThcIruU2mxSiGpidsgGqwz7+3xzrY1oHrWeaRGQLJ3Hq7u/krepaVLtaNWQS4a3a88rTPM6hezy/gMOOY+kkz+vd2ljBnz8/VfxNJwvOjHpAscIcdvIrmvXnYvAzdTql2oKzt89osaJslHd2n//8IRrWvPdM3kia9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883364; c=relaxed/simple;
	bh=fKs4SGsppJWUftH/vs9/UIx/4B1sMiRPSR5uEmjJ4TY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iZN7GIwRkGaaNT0v92AJkyo30A4PTdHcoHvAGHrUI8Ia//ltjBLtXcnt01DQELFYrfELu8kLq6toj8y84DfZfGP4v7HZpcsmm9eTul2Ng2TNHiD4pXsYIaxJEqL/onuvA9xkTW7Ga76iipovvUc9bfQQVXykjT0tXHfzSbsRci8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcKLQdsU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcKLQdsU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900D01F000FF;
	Thu,  1 Oct 2026 19:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790883362;
	bh=kHWRsuTfZjw8tWGrOeY/8OgFuHVLZCaCBl2Cx3jPC9A=;
	h=Date:From:To:Cc:Subject;
	b=FcKLQdsUAklZKMCyJfTx/cpqflRgYvMiMja2OvWQRSUBsV4xixbbL8mxNdWq8WdcU
	 ugftHXc4L1oDy4mOfqTlQ/0HlIJ3/Pxq0txHqeB5OAg8sMFp4xWYMbJMtqQFDPVcih
	 XRq3E2PR37RxzN+9RW+FvSAiqHQjewTmVvEuJcx99HZZdY9FdHiKxSqAnsbN599keZ
	 ey7pn583Wza6eVHpPkHYUKthRYptjqZj3jwqXoIoMWPDk5TJ3bB0X3qIPFBG7fYcgC
	 h1atbaUjVLaUNcdhb3bTq80PXm8/zRRkvqvghFiUV+sbc0FGdY0NF5UIdibHn/lJyv
	 bS1DfPu3t1tpw==
Date: Thu, 1 Oct 2026 14:35:46 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] Devicetree fixes for v7.3, part 2
Message-ID: <20261001193546.GA1670288-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull a few more DT fixes for 7.3.

Rob


The following changes since commit 5bb01c657ff9fc807c2c592ca18af34c4fc3bc6f:

  of: fix out-of-bounds read in of_alias_scan() stem parser (2026-08-27 09:36:05 -0500)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-7.3-2

for you to fetch changes up to 30724547b221e0e670ddfef140fc7d816b2aaec6:

  of/irq: Fix remaining refcount leaks in of_irq_init() (2026-09-30 16:09:13 -0500)

----------------------------------------------------------------
Devicetree fixes for v7.3, part 2:

- Fix another case of refcount leaks in of_irq_init()

- Avoid refcount leak in coreboot node check

- Fix overlay handling of a root node target path

- Various error path fixes in the overlay code

----------------------------------------------------------------
Abdurrahman Hussain (4):
      of/overlay: put property on deadprops only after changeset add succeeds
      of/overlay: only treat a positive changeset id as registered
      of/overlay: don't leak fragment references when changeset init fails
      of/overlay: don't create "//" paths for fragments targeting the root

Wentao Liang (1):
      of/irq: Fix remaining refcount leaks in of_irq_init()

Yuho Choi (1):
      of: Put coreboot node after compatibility check

 drivers/of/base.c    | 10 +++++++++-
 drivers/of/irq.c     |  2 ++
 drivers/of/overlay.c | 17 +++++++++++++----
 3 files changed, 24 insertions(+), 5 deletions(-)
