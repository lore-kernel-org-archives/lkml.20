Received: from out-2uec-a113.jellyfish.systems (out-2uec-a113.jellyfish.systems [63.250.43.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D59385D7E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575393; cv=none; b=lnXJYSx5Eg/BGe3ROsQJj1NNJnccVltkOpOAhPsDBIt2VsIhFLn28jvrZGEKzE2MUWbEm1jxpzQD3KQ5dfHScPVtXQ4w4jI9d4cs6QPDba6e4NXqQx//Y+qmrP6bauCs74JVsCTJNmImNnqOtlpegkgpOI4XjLchMEnr3ySYjO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575393; c=relaxed/simple;
	bh=8suKIJJD2wbPmjAZH2NRSynJ6ApV2d+bYRpDPzaFylk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9NUxLT7WW3y8NpY2DphbyaaDB0HDbHj3k1YlTboBNDNAsdhj5BPud8jz5gNpP+T0+y1ggedocB2fEEJ9c/HiuwmwpamU0xIULIZZlD+WP/63aUbDQS2rjDrQ5hr+Ela7yDgd83z4Rg2WOpenuFHEF4EorYK2Z40TgF2xfWw//A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=mGG6lVB8; arc=none smtp.client-ip=63.250.43.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="mGG6lVB8"
Received: from fedora (unknown [117.147.120.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hlP5J2g0yz8sWt;
	Wed, 16 Sep 2026 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1789575077;
	bh=SmXuwsjaElzcBy3cwomr2oW9QZmnugnFOvebRFqKdOo=;
	h=From:To:Cc:Subject:Date:From;
	b=mGG6lVB8NxNSGeDC9BFk5vYiA6hVgh+GAkJbwKCzfEryrBGLW6ZcgE9AbEw3DGz9o
	 zSNr9+clF1LJL561yjk4vHMQPTGsNR45DwhXDk8fuKY5ZjMGV0JSYIHEvlwmFPaqKK
	 1YzYoCkvAPBbzcAfIQQK4caKuTYi2ibY5P94QIHI06sz8kRiHxrgBE5v+7Nhzass7D
	 H97Raxv87Ue5N3QzbzwkaK23VOI21XWKYJR+Z7XocnwU6EqMGdedo3cgzusmISw/QW
	 GZJTHO2A9OPajZOlKB7NQim/aubERJJjCTOn0sRY+ps9GjJRFaFioYHOtK1LdipRzC
	 8miYGIVWQktMQ==
From: Tianyi Chen <hi@tychen.cc>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] memblock tests: fix BUILD=32 address conversions
Date: Thu, 17 Sep 2026 00:11:03 +0800
Message-ID: <20260916161105.2548281-1-hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

Fix two BUILD=32 failures: truncating a physical address before freeing
it, and sign-extending simulated memory addresses. Existing assertions
cover both regressions.

The runner passes with GCC in both allocation directions across 32-bit
builds, 32-bit phys_addr_t, and NUMA configurations. BUILD=32 NUMA=1 also
passes with Clang.

Tianyi Chen (2):
  memblock tests: use physical free for the maximum-address check
  memblock tests: zero-extend simulated memory addresses

 tools/testing/memblock/tests/basic_api.c | 6 +++---
 tools/testing/memblock/tests/common.c    | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)


base-commit: 5728d3523f12826a2b180c1c5738f74e33197e14
-- 
2.55.0

