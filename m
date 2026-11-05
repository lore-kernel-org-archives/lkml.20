Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889403;
	b=Cs2aJM+RtVWLKS70AfHE0QWHmPmy2Q61LWkkf//Vbfmm3HzxGIk5Qtj1XwYZLHNERTs9
	 Gkb8GUiUynytgrDeq13TuUxBvw41omTGc/9ySEQGY8P1SZM/YVuoNYdkcEeh6WQutDcjl
	 dJB4ZTJFCK9tgInHcjGCQRIc0BmoDZQDIbzkFKcUmfQl317HoCSPw9shO/4C5tmrM0hq4
	 blONlOCWrz6f7nKTYtjGqR7Gy2LhHajmehj3/XE1a65vPWfCbviNwPoSKLQKTyKZuQzQL
	 MiO8exIJxN/uMTYqJ4zJqcBzhf7nCna/epMbfKAqDgGFdD2+YxzjDDiNS6HK6FARp0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889403;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GcMP2OP16WIxrYvxN2uda09n3+mrRQRVJ25RVvdRwNY=;
	b=Qx2uyPQ9QylDAyS3t4GnQBLwjY6h/8Min/DAtyHtpffBCgqrZzOuGv08wwjFKRxtZh25
	 +ME+9oWD+yGmVGKjJwAKfjRHBbb9r4nzOMsUSfBgwgS5AXGI33ulALvYfZrHwgQyueAsZ
	 1Y682uDkMgVa4NSxkvT3Ui1s+loioHuEuB0Ri2PrfVrlV/g8dDvEtAsPjylC8IMMoxFzO
	 r22PQ2Qet960LplI8hPXtjR+GhrAtdacVQLrNWc8e5btdY+yvfg2RanoioYkP+DlTgcCr
	 ALFL0oagwf1Gbm28n+rRZamUco7z2jNliyCW26fQQXTj40FTub+hVFgI1KZD73yy9aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dBr7dt4T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A16D606A31B;
	Thu,  5 Nov 2026 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dBr7dt4T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEC01F000C1;
	Thu,  5 Nov 2026 14:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793889403;
	bh=GcMP2OP16WIxrYvxN2uda09n3+mrRQRVJ25RVvdRwNY=;
	h=From:To:Cc:Subject:Date;
	b=dBr7dt4Tk0yoZ6PllavTIF2wayIuGlFVF+Uf36jF9HX7Bcz3NPAkwmsGbHYSeRNGo
	 BTM0M/yizJRE8QWgMEIa+P3DX/pSXBSafr4x66pbFW2bvRWlGudylrmfOnMnvuZz2q
	 jHc4Dxg84ys0X4sAEo0bljvsRvMaEnlGmcvdW19fzD/zZMg3B9WoDdQt1JafpHu+nl
	 eOUGzjwjLQZ4WzGh4b2kqNEownhCLdIt0sIoCQe4YmnFbCEm5iK2BrNjqP3HMpnKYs
	 wRAJ8k3a+9tScyOGdoZOWBMW8VU3xDuY/KyFAqMHR60rVxzNWDyehEtn3T9xUc0YzT
	 af6T1qRqkCHhg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: reset: Remove orphan bt1-ccu.h
Date: Thu,  5 Nov 2026 08:35:41 -0600
Message-ID: <20261105143542.2716484-1-robh@kernel.org>
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

The Baikal-T1 platform was removed, but the reset/bt1-ccu.h include was
missed. Remove it now.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/dt-bindings/reset/bt1-ccu.h | 34 -----------------------------
 1 file changed, 34 deletions(-)
 delete mode 100644 include/dt-bindings/reset/bt1-ccu.h

diff --git a/include/dt-bindings/reset/bt1-ccu.h b/include/dt-bindings/reset/bt1-ccu.h
deleted file mode 100644
index c691efaa678f..000000000000
--- a/include/dt-bindings/reset/bt1-ccu.h
+++ /dev/null
@@ -1,34 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
- *
- * Baikal-T1 CCU reset indices
- */
-#ifndef __DT_BINDINGS_RESET_BT1_CCU_H
-#define __DT_BINDINGS_RESET_BT1_CCU_H
-
-#define CCU_AXI_MAIN_RST		0
-#define CCU_AXI_DDR_RST			1
-#define CCU_AXI_SATA_RST		2
-#define CCU_AXI_GMAC0_RST		3
-#define CCU_AXI_GMAC1_RST		4
-#define CCU_AXI_XGMAC_RST		5
-#define CCU_AXI_PCIE_M_RST		6
-#define CCU_AXI_PCIE_S_RST		7
-#define CCU_AXI_USB_RST			8
-#define CCU_AXI_HWA_RST			9
-#define CCU_AXI_SRAM_RST		10
-
-#define CCU_SYS_SATA_REF_RST		0
-#define CCU_SYS_APB_RST			1
-#define CCU_SYS_DDR_FULL_RST		2
-#define CCU_SYS_DDR_INIT_RST		3
-#define CCU_SYS_PCIE_PCS_PHY_RST	4
-#define CCU_SYS_PCIE_PIPE0_RST		5
-#define CCU_SYS_PCIE_CORE_RST		6
-#define CCU_SYS_PCIE_PWR_RST		7
-#define CCU_SYS_PCIE_STICKY_RST		8
-#define CCU_SYS_PCIE_NSTICKY_RST	9
-#define CCU_SYS_PCIE_HOT_RST		10
-
-#endif /* __DT_BINDINGS_RESET_BT1_CCU_H */
-- 
2.53.0

