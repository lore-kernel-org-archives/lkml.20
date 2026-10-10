Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0085FDA7
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791676118; cv=none; b=kVYZV6WSEsZkRZalU33INlCh2czM/f7ZxrwnMNa1ueoAuO+kiijNffF7XvyNO4UnX73MJNUFEiq/hf3yQ1hBp8HIUT/kTRPlYQa5keGOKVngTAlIq/+vQcz+nG3ziH4Y9+p/8c1ctKFxeulRRJZ2ouUtx0zuiH8gp0Ds/kuJXSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791676118; c=relaxed/simple;
	bh=J97Qb34XTPXUWZwwWoSCRUb48BZb3Kp523yR4FLJgss=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Kngdu8ntTBxJBV939f/xnbtEFcp0C2pxhcsKABu16sJh5Aqt5kkPnGzjVtzYuGkHct9ej57QsjZbFqypFRCmDnXKLvpvJeiwvojAfkMMzK/wjaCctyNl1vh8QAIjM0FwH98i1kIsGlrQ8IsXN+CfN02Xs+YXklf9rVDKWEBwoz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EstaSF7I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EstaSF7I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368511F000FF;
	Sat, 10 Oct 2026 23:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791676117;
	bh=VLeTmpzjiaGT5Z5LD/PY+WXI5pNj8dEL23mKqEJoCHA=;
	h=From:To:Cc:Subject:Date;
	b=EstaSF7IZG+NviRMAtHIqNCNKaesCo4K5VIlBR3qavGw9uerEb9CXt+AiGsMbpJ90
	 Dv1PnLOtN6JCDcaw1NnvCSBAOltIZerga3WzgsQ2wN5F/HN73iOjPWVn/Td+juDCoC
	 oqYbsH17WhCAXZD5t8BtT64RaEbjmpET3+oJR3DbWzVTuevQqVAx8etYOKgKXSkUha
	 YZyE3y24BeMF/4+8Pb+5guoLZTVCRgqal+JymvPm+eWvWDPldF6oJoInuPp/t9QffH
	 hKcRx+Ly+6DlWPri7J33x+uI9L/dCotc9i39EU32QJOQnkD8T7A9qC433wXIejNnno
	 azhvDnPscRUlA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6C7001AC57D0; Sun, 11 Oct 2026 00:48:34 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regulator fixes for v7.3-rc6
Date: Sun, 11 Oct 2026 00:48:12 +0100
Message-Id: <20261010234834.6C7001AC57D0@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.3-rc6

for you to fetch changes up to 28c2388ee24cdbefbcc458fa41ef7bffaaa1cc83:

  regulator: ltc3676: don't read the write-only HRST and CLIRQ registers (2026-10-06 17:59:42 +0200)

----------------------------------------------------------------
regulator: Fixes for v7.3

There's a couple of core fixes here, there were a couple of issues with
of_regulator_bulk_get_all() not behaving consistently with the other
bulk regulator APIs which caused memory leaks and error handling issues
in users.  We also have a of fairly standard driver specific fixes.

----------------------------------------------------------------
Abhishek Ojha (1):
      regulator: ltc3676: don't read the write-only HRST and CLIRQ registers

Alexey Charkov (2):
      regulator: of: fill in supply names in of_regulator_bulk_get_all()
      regulator: of: state who owns the array from of_regulator_bulk_get_all()

Mark Brown (1):
      regulator: of: Fixes to of_regulator_bulk_get_all()

Ridham Khurana (1):
      regulator: tps6594-regulator: Fix n_linear_ranges for TPS65224 BUCK2-4

 drivers/regulator/ltc3676.c           | 15 ++++++++++++---
 drivers/regulator/of_regulator.c      | 29 ++++++++++++++++++++++-------
 drivers/regulator/tps6594-regulator.c |  6 +++---
 3 files changed, 37 insertions(+), 13 deletions(-)
