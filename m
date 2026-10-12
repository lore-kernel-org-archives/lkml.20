Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CF64E0B73
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839368; cv=none; b=N+sIa5vqaJuw7P1CAN9xqyA+LvPqFafM13yNPbA4bKjCo1Ia9/cBOqJ9ci8xR++2lWYoTXtCeoKVKr0ktjdQcbOqh8CxYzr3vO++ny2g1ewSD8BY5XK5bGipeHk6rkc7Pzz8PrhoF3IPPf/5EBkOJ8xpp2yxgL7qttUHbXeg9JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839368; c=relaxed/simple;
	bh=7DVYb2ltQlJEsmU+wKHSezO+nazVXLatQgr73KxmXDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dYDfIy59q2jqfOvaKfyfRbzQ9/LTzY0qY8A0ERj42NSfy9IKfMmlDqoYyuEsQealdK5AKIkTYADv34nTCzELEpfiR/XahxRKo35Qhtp0HDTZxptNdzBvZ8A7AVYA4x2HcE+E6vtTz59iE73qBHtZSenZ3Y88fnOV0iRz76rSlJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 1EAB071FB459; Mon, 12 Oct 2026 23:09:24 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] nvmem: enable COMPILE_TEST for more drivers
Date: Mon, 12 Oct 2026 23:09:15 +0200
Message-ID: <20261012210920.911354-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series was spun off from a previous version of my series fixing a
case of missing const in an internal API.  I found out about those
missing COMPILE_TEST while writing that series, but fixing that could
actually be handled as a different series so here it is.

A bot also reported some missing HAS_IOMEM dependencies, so I fixed them
in all drivers which do MMIO accesses.  Maybe I missed some, I wasn’t
sure if the drivers using regmap should also depend on HAS_IOMEM or not,
but that could eventually go into a future series too.

I also fixed a random eight spaces of indentation I found in the same
file, but again this could go into its own series if needed.

[1] https://lore.kernel.org/lkml/20260920111000.2404131-1-linkmauve@linkmauve.fr/T/

Changes since “v1”:
- Link to “v1” (actually v6 of an unrelated series):
  https://lore.kernel.org/lkml/20260920111000.2404131-5-linkmauve@linkmauve.fr/
- Add missing HAS_IOMEM from drivers which use readl() or writel()
  family of functions, to access MMIO.
- Also fix indentation in the Kconfig.

Link Mauve (3):
  nvmem: add missing HAS_IOMEM depends on some drivers
  nvmem: enable COMPILE_TEST for more drivers
  nvmem: Replace eight spaces with a tab in Kconfig

 drivers/nvmem/Kconfig | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)


base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
-- 
2.56.0

