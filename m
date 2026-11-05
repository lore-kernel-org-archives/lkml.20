Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889417;
	b=f34uXHRWe2V5dpRzl6PN8x1KJuzIkucPnxOmykYrnl95KGrmn/oyz3qVBkYfwBWZgdvR
	 Li5KdCaKE4o7anQeqeBD+Iz2GbcuctX7TsD9Kl8RNuwK61k8i+Sg+KuR5ZpwANq5W96/g
	 HtL3QxGHFqrYohF+drNXDh+zZAq31ge2xMyO1Kiw9k2SQjXUr1JxObyJ4ntWnO/izJSm7
	 I8RIWk6gDSEosrvAgg1P6WPmkaCOjXCR2EUa2/R/0Mu9XubyNqcdViZoq85BQzmgthg+x
	 VeW4YdzgtQ9fyp/Los0mWvlYQ2e7AbW2QT/x4ajxRILsmVLLkrwMkW7U99iuS/qeArg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889417;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y2THsAXtPgE/cPVAy9wB9JvP77O7f1H/H0wt8LIVsRw=;
	b=4ED3QOnykhSo2dj+Z2j9PUBZvkOir4zP+dmwNT16I9gczwlWxYK1RbNJWl4XF2nsP7B+
	 +SxlfcV6G+CQrvmItW7jessfAOBty7bEDgkotVzWV/wlz2ufCxJxpNRNMoL3I6d6ZCwm4
	 bN8iITm1SgX1F8zp7xlwng2XJjGlE1XI/GSKCDb52e9xStqHjrY4lD4whn+CvK1pS1L/y
	 ToYfDeuWRBwDIbMDmcn2X+plspcuAbzkQrFiWbiiZU2PLpxUoNImLcv26ob629WmeGtL2
	 52rN2p4tEDY/D1DMjSW+WkNlm6H57rEvhp56fZvRtnEleQSD/6THEeLZXfY3NS+L/Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XyzmRdyF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640D4606A326;
	Thu,  5 Nov 2026 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XyzmRdyF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92791F000C1;
	Thu,  5 Nov 2026 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793889416;
	bh=y2THsAXtPgE/cPVAy9wB9JvP77O7f1H/H0wt8LIVsRw=;
	h=From:To:Cc:Subject:Date;
	b=XyzmRdyFMi2XTIsVGrVSDuaNTzQbK2kiHE/q+TzhQp86/BEd8ZSpPqG4e7ctCADA/
	 rfxiKAZhD+9Wyi88UxzK7Mbac9oJZsDIf7CkuBi9ehqudCauJRs7B9Hg38nR2o34jw
	 FLTfaUpFyxt7x2aJGvUinvF82zVjZDQ79838Hv4DDNlgitwjO/6I62EmjKJyeBp6EG
	 hfuvyXIODZccqXJ6g/ecKihKnEEztaf+cEF70AJSZnB0TqSFrvpouMKSYdLbBSo2S5
	 z/0DUkWf7/P6dCGGw4cBTWWs85qH/kGgnFk4BezjkavUqV2PnBNJYIwjTjVvPS5eW4
	 qXtQT+ZV9Y45A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: power: Remove orphan mt6765-power.h include
Date: Thu,  5 Nov 2026 08:36:47 -0600
Message-ID: <20261105143647.2727937-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 22a77ae9bae2 ("dt-bindings: power: Convert mediatek,mt2701-scpsys
to DT schema") dropped support for MT6765, but missed removing the
include.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/dt-bindings/power/mt6765-power.h | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 include/dt-bindings/power/mt6765-power.h

diff --git a/include/dt-bindings/power/mt6765-power.h b/include/dt-bindings/power/mt6765-power.h
deleted file mode 100644
index d347b4ee9eed..000000000000
--- a/include/dt-bindings/power/mt6765-power.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _DT_BINDINGS_POWER_MT6765_POWER_H
-#define _DT_BINDINGS_POWER_MT6765_POWER_H
-
-#define MT6765_POWER_DOMAIN_CONN		0
-#define MT6765_POWER_DOMAIN_MM			1
-#define MT6765_POWER_DOMAIN_MFG_ASYNC		2
-#define MT6765_POWER_DOMAIN_ISP			3
-#define MT6765_POWER_DOMAIN_MFG			4
-#define MT6765_POWER_DOMAIN_MFG_CORE0		5
-#define MT6765_POWER_DOMAIN_CAM			6
-#define MT6765_POWER_DOMAIN_VCODEC		7
-
-#endif /* _DT_BINDINGS_POWER_MT6765_POWER_H */
-- 
2.53.0

