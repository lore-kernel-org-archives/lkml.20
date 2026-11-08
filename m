Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794140250;
	b=IkwMkZrC/PZUf+YfqicA6ZxCgULr4d57yePxi9TUGOUWDKe9R8rgoBfvT7do8DBdHPFX
	 ijvkuO+e/79cOHxMdVeLntTOgUQEMCKkFslG9k6qYvRKZNCoMdV88mnWE/rZ5sQ8bseDJ
	 5fGBg0EygqX3LlxaE8zj8iQKwp4SUQ5a+QrOau8hbbrj2ekBRMSQAsK2mEQnF7M/A6GMc
	 JkWqHH+rTpUTCXl7j91zoKaE+n7QBODVHFNycm9hykEXsQHC6A8OIjy+djmXZ5yoJcZQV
	 CXlgayvXX6OCHEL3WyFdiSxlhQqZk2xlbQQMvJpKNz5hynaCJROAVwGPyzVN2u4ZI8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140250;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=sfAcSXvCIWLtRP0JfN9GEy/0H7/GL09pVpjbAM0coBY=;
	b=XvOs2iCtsTWfRSNY4iCuvjdNPqj+f3whujkSTTmoYVY4845SXq5JCB4IDp6p/RQ9/if3
	 Ohfu6xhiM78rfsNyqe97PDvLam3YjfT6Ln8rs7XVbxHAFeuh3sDaHoxa+TAsnNONsAXFT
	 XhcEH835wuhXmbzDn4cSkFrNVvY6afLoRXUVvAQQmPXGnlUzkzA2ePnI7vxN/+1Rmeetf
	 MxZfIXT8wsLNnbeElyxQ7j9HMYHX/Ex52iBzKMiBoTPwROmbHGfPsKaiNu3CgoyWBwfc3
	 ieedREiO5dBMLXF9QV69xwSktflf47yLw2e+ihEH3fUMqpi5YqkBs16gBMmdE/gR57Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lv5Zqm7J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7D3606A334;
	Sun,  8 Nov 2026 12:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lv5Zqm7J
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794140249;
	b=tL6SKMALEwQKEpFR1LHMM1DShXCLCFMODJxzydVscaDYJgKXxmjzAsajj/min2RcbyuC
	 D+A3kSAPBaRf3mYKX+2WsRPkNORNKUurA3gf9XhHohMeaPvWj2MF+ZetiL4vZo8jBV+Di
	 +5zY53p27HxBgVXZqNsqloArRL4P/pfMwh4jMtcXisfC3GRnajJscOBS+McCQZiyGj9WJ
	 rAnElrmf+V4WXnmI2VvHXlQjnlIKawcIH0h+A1A3nWf/NpjPtTLvbEcib1N2Nx7x76CHs
	 i1i5wi1GIni8vQA+wiWHWAIEBrp17kcRPmDcNC0mCK8D6N2atj8g6mO/DrYU0xB4ukQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794140249;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=sfAcSXvCIWLtRP0JfN9GEy/0H7/GL09pVpjbAM0coBY=;
	b=ovjMPiPJ5lAMw26lT+QYoRZd5zQyTVwft4uKir2LuLea+YtEF0Zi2l2VSeoBcDGZmp7W
	 9jZnwmLhkd9OJX7L5oclPEP6tOEO6e/aF3LesIIUppBT1aSf4MntoyKMkR/Z2ZpdI6WQt
	 Vup6d4jR8OVjlSnxjPCeKpqgq9CE2YhcogGCJCorf8fvJydFI81H3FslZg/dW9VRxveWo
	 xgnZLa/pqNZpb06m6stLfXUG8p3fa/k3fKpJJqmvXw66D6ApuLDZwHQIkt8JCwEUgq2Xw
	 kClsMOW+Fy6ShU2mvhuDEdSPYHbNDVd7pjxqxJ50ObjJjvZw475ac9koUu7iHgUFkxQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F66B1F008A4;
	Sun,  8 Nov 2026 12:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140249;
	bh=sfAcSXvCIWLtRP0JfN9GEy/0H7/GL09pVpjbAM0coBY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=lv5Zqm7JBTp+JjQk5F9g5adMUNW05zdcY+HyNNW3kXSXzmc9r0eieURW2X2qHbpAF
	 tbD1AMNjTPewvJoDMoD2bJYBuL7iFMxJQTsLBzY7Kg/4ppd0hgp3TZ5ajMT4a3icAm
	 zENfhRMJ4HG4hpp+rtuwizYDc70twtecOmMgsSvFgNnHWxJtzjfhuue90h4FNSM3Du
	 Ut9Bx4wm2D/rSpTVMIVVZKywVUOhPExYvoesYK/6LzP1XFRWaN8wxHuSb50QJkpJW7
	 9Y30IYADeb5ta87ahAJRVe2pw+ixXQNv4AfGiIfF/hAwNl5ybGQySlVolov15q4OpO
	 QPfnlQ1eBymtg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E1ACB47F4B;
	Sun,  8 Nov 2026 12:17:27 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v3 0/2] ccsify imx355 and imx258
Date: Sun, 08 Nov 2026 12:17:23 +0000
Message-Id: <20261108-imx355-ccsify-v3-0-366ce7ae1bef@ixit.cz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBQFf4V0bU0flhZX/odxAddWrolgWmxAw
 r/b4kJj4nKSM3NmEqxHG8i+mIm3EQP2XQK5KQi0dXexFM+JiWCiZIZXFG+jVIoCBHQTNaoEo5j
 SynGSnLu3Dse1dzy9OTyaq4UhR/KixTD0floPI8+7f+3IKaesKcE6ra3csQOOOGzhSXI5ii9X6
 F9XJFfWlW5AMyO5+rjLsrwABfzFDfYAAAA=
X-Change-ID: 20260819-imx355-ccsify-856c850575f1
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=929; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=3EIQBo5WgMeq0yNIV477sq8iF/Ojcq5glNWFNlrvfBc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq8GhXQO/ENKAmC7Mj6xu2FtnT/QvxKcTMCO95y
 nISJhq3ZhiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCavBoVwAKCRBgAj/E00kg
 cq/RD/49h7eaqSt6NRvq+NBoOHKq1M5PSMm9TyMi71VS1WgMyouBJxPuYJANVjqKBoK8spfQyh9
 qayGQ84Tn0fQJqxqaQWZF2cYaFCo/ReF+BQ1D8EI8ZzZr/NSpU/YoWoXGQFOoVwsaJpcDBDkSKk
 fhp04t+iAAkwfkm8UbVIZGEfhH4p1Hzo3t6Hn/jmm2yQZHGQsw+VlAWBDRqQFqcgbHLq5w/4a+J
 hFPA6NVeIWWU92J2DV0p1N24Y1SC8U3MHUJ68eMAdr6BPG8yEEmMy4X83SF5UG8L2a2pQPf8Cqa
 xNxJvD8Ru4U7WyLBu2GbG9r1khF3dPUFtyTmr94cdQsS920hFbK7qVlj8GHZard+Q4LIUxBlqIW
 GTbDiFhzxqUP8pADXrdMQ4w6Y1gCMi3Wpk1LdeQ9RTQymNUfFvIUds1LpAPwz+GRNMWMkuBVNW6
 lMEFT2GarpbSfEFh4m4KDnhKce052JGxE9tYV3LKKfX0C2qHYq+lXltyZGFhNacY4ulTiglY0oH
 bPm7oPej0lyIhdBy3/NdkIv1lVuT/gV5kuis66iwNU8SCvlgfloEIds15A/Q2RluzpTnf0dvGO2
 tEIOFQLd6SATFPgYHpVjjZaXIwWkv9szw7Xpj+RxlHi902ID6BsqnW+lUHVQVgV2R0RmLzNSXuw
 Uvgsglq9J4g1TEQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Makes grepping easy. Makes stuff more unified and deduplicated.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v3:
- Use the ccs regs on imx258 too.
- Rebase on top of next-20261105.
- Link to v2: https://patch.msgid.link/20260827-imx355-ccsify-v2-1-3a97bc708315@ixit.cz

Changes in v2:
- Replaced all occurences with CCS ones.
- Link to v1: https://patch.msgid.link/20260819-imx355-ccsify-v1-1-0b6cef77e340@ixit.cz

---
David Heidelberg (2):
      media: imx355: Reuse existing CCS defines
      media: imx258: Reuse existing CCS defines

 drivers/media/i2c/imx258.c | 218 +++++++++++++++++++--------------------------
 drivers/media/i2c/imx355.c |  84 ++++++-----------
 2 files changed, 115 insertions(+), 187 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20260819-imx355-ccsify-856c850575f1

Best regards,
--  
David Heidelberg <david@ixit.cz>


