Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17030486431
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789162883; cv=none; b=u12W2wSGuj9asXqiZ6C9X0CbkLOIYtX2nnGMzYxIFi4xckyel7AoS93vSC1Sf4YLcNjhm4CKjJ5iqwq051944YxYsVh3jXtm9n4hfoDej5xAhfpcC0eXacNbXoGfxXOCaa4q8M1aj6yh9i64a5yq1+shOAjKjUjIQo85e2oV5EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789162883; c=relaxed/simple;
	bh=xOlPiitmYC6iwDZhgM/znKTFkcIpw1/7OHbL23GBpf0=;
	h=From:To:Cc:Subject:Date:Message-Id; b=uzCA9L+v+qzqzsNXzJaixatNV2XY7uFwF+X91RlhEDR1tyXHMB2U+pvHnaSRJcMxhHyCDkdndk4VEiUO/Q3fityGA0xZZZY64ak8HpyOFGaZy8n/tTVsZQN4MW1y7OfT8aePVWMarN3+2zQzxtT8csg4l91u9KY7JAbpWPCt104=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S05MrARr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S05MrARr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729C71F00893;
	Fri, 11 Sep 2026 21:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789162881;
	bh=MudzWTU6X1f+oD76/zRpUCBARSIYYlSG3jryOcVhSYM=;
	h=From:To:Cc:Subject:Date;
	b=S05MrARriBqzo3KhxHnVFCz/DrHBtqVhlqou6srIFK1bHdiB5J7IjCt3JhrTxAstU
	 /583CWj/eAJS6ATFiMGvRzVs3ZierVDR+yewpz6K5VojubL+Im/+YSOCsnLFieVHYw
	 WHBITRTQFrFmi/4BD76gCjgZ/HHb5L0LnAktJfMqxhhuXBvbNBKfWciUPVmUd6e6F/
	 MoIzhvKPsAzKTk+M06UT5gKunzX5wmF4AV/jx+KbpORg+7Pv7ShIkcGp8PmIlxA7HO
	 tYIANieDwqX72zGtaPVPDxDvkByRUcSvG3rBo6Nn746gXLxxmJSCcjJ7Rt+Jrx/mc7
	 ysCjbemS9a0Iw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 2D176DE8ACB; Fri, 11 Sep 2026 22:41:18 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regulator fixes for v7.3-rc2
Date: Fri, 11 Sep 2026 22:41:17 +0100
Message-Id: <20260911214118.2D176DE8ACB@traversing.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.3-rc2

for you to fetch changes up to f3e6ef13e24c9f26dca0d35de57fcdf04f78e378:

  regulator: pf1550: fix which regulator is notified (2026-09-07 18:08:38 +0100)

----------------------------------------------------------------
regulator: Fixes for v7.2

One fix for pf1550 which checked for errors on multiple regulators but
always notified via one of them regardless of which one had the problem,
plus one device ID addition in the fan53555 DT bindings.

----------------------------------------------------------------
Donggeun Yoo (1):
      regulator: pf1550: fix which regulator is notified

Rudi Heitbaum (1):
      regulator: dt-bindings: fan53555: add tcs,tcs4526

 .../bindings/regulator/fcs,fan53555.yaml           |  1 +
 drivers/regulator/pf1550-regulator.c               | 82 +++++++++++-----------
 2 files changed, 41 insertions(+), 42 deletions(-)
