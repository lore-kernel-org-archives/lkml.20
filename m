Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3CC443AAB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141021; cv=none; b=UiruO7dU1L93iwqourFycYfgTrd5rQAir8cKtbyUezOWIXmRNenWdNHW51CpAwewzNCH0ztI3xd/wCPjvy+vFiExi+Mw6Nodz/43QguzWPEIxFW6kPm5+m5xBUoupNyH8kNUB72y1l/nkn3CgfGA1k2OTpz40IhU3neUy7oIVTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141021; c=relaxed/simple;
	bh=YkXszimtwNYxX/s0QEul4OMgnFGKSMEKdd1MDqGTukk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwxk6rJsOMyihV+WQE4BQGCzVzBYznfir8D19dMv+zhh2GYTYndpVP7Vc74wxy+OIP1zrSEjJkX/OmZc81XcFiFfqvCpwP6vr4J74Z2i1nroby/UwB5HGakdBcwIiLjlT/DB9tJCONFeFjQYFanNuJWqz2vbwL31emh/WtmO6Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDa0cDIZ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDa0cDIZ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbe437a530dso369575a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141011; x=1792745811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4t98YFhToVmXSdqpvYlx+jh33cXkNHD7dPs1AUtblco=;
        b=kDa0cDIZn7saGLH+mUmFYZZPGPuj6l14N9qS7GHtuWxiuJ0V1St84dOkhoyq7UB3Ti
         ACn2po+qbNonpbf8n1/56RImUcSHoMAzhq/U1etcyaWStOtKkWcjIkFkNNWAYzGv9I9k
         rNjanC1fmLGG3VheuvwpfKWKinSAUfnzRHwybcWXpM5yg3Omz4Rke9Q2T1MNHUegcC1R
         LCsoJrDJ+qTZyZ7TbVKj8oaKpw9N2Zr5rhMtYq82CvqIO7/xaSIdoFzdGkpKbIBtdoMv
         a87Y8fh5S64BbS/TTAqm+zEqAwIVJFb0FOYJDRO/U5Mrjtq+s7iXP6ju8nOWuEzzyjN9
         6HLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141011; x=1792745811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4t98YFhToVmXSdqpvYlx+jh33cXkNHD7dPs1AUtblco=;
        b=GbSN1M4kUPbVIh2bj3ItT6gFUYuSEZCCm4RdsBvT9bCR4c9djFHbaXkaX2k7JUft16
         srxGfv+ccZFky/xAslhWNtgPbi5hInMmtqIx+LcTe3ABkG35WNXz/5AEbOfzfKE4wPxL
         qGta/KZYMyoiEXmy49Ja/wVr8aJfjN1xd4RXeccCGP1HBeDHPBpDNyktAUIOZLSaIk65
         Sqh4/x1mS4FvzVZmJH/66CjhBBFDoS7rzNFRxn43AsZciIGVIlY06j1Qomj+JeWKBC5K
         7FcrcwISOGjjxiumUiXsoT3O5BR5H9VA1I5O55t99UnHHiPF4wfwPUx1CB6zi6UIRqb6
         M1dQ==
X-Forwarded-Encrypted: i=1; AKwUvByCdoUt4sB3obgt1kUEMxCmvXhJr1H0zUi1moZPGDvFxG5dH/1OQf5qffimb/771+Bo42YKzCdmspt4SBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbSCu/Apif7UfWh8myXqena/7NE9Yl//HfdlajMJFfaYhzIiZ4
	JVkx4YtC4j1aLVWLkZ0aLI2ye8k94rKwnVmdFkutBHYTjrLmMeTwauRm
X-Gm-Gg: AYBFou0b5JrVaiZ4sPeDCNWPd2WboQjAMXnRodNC5I6x5Q8jQAIhPtrEEnfQ6LA0quj
	KboInLYqMzcn3AAt3vhiuluooFUWNgpi9HXoohnnWVd+wOEyxBNmp49x/NvLbUO4GJtAnca7nwc
	JlwFbOHinYx/DMcakckSl1VQ3hvLkbZLvX23Erk0Wv4MqJPTTA/qxwn8ZJDWaQDXeiBUB0pUExh
	+m5Y/SLaUDhnTLD3ZU3UDsIGs+dV3R+M+YHyAqy99sPp5yxIZuTcQ5zBR2F02z+bYbF+HZRpStF
	S+peNkxNQ+HOXvwjPl+jykEAdLBxDMeW9WL0vY6PWjZXRUvRTFic95F7j3BWjia6DeqzBfefpX9
	7GgG/N1hn9Q0LeXD5pD3TB5YsD2AeetN3g1CcO3R3czNMjnvkTJxdUSCHTnP60kcX4RsgVS85sw
	IlaoepUjK2qObOv5sOFK89vwDvLTZy77pW4xi8aSQNO1LPUys1+Vqakpl/9PCEdMj5wV9fh0ai7
	LkTxHZlfUdHh+kSSxmJJAEnTEVtOQ==
X-Received: by 2002:a17:902:dac2:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2e8429a9f89mr307105675ad.3.1792141010736;
        Fri, 16 Oct 2026 01:56:50 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:56:50 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:35 +0800
Subject: [PATCH v5 1/8] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-1-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=1157;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=YkXszimtwNYxX/s0QEul4OMgnFGKSMEKdd1MDqGTukk=;
 b=LEId1ZHxKIWdktOliHM+CAcf07+0pEcd9I8lHvqF1BdgteiRACfEYBQ+XTP3tpx89PFHzEumx
 aaGdm4smqtiD2t/AMT7acnwO3RJ+9CO4aUpskESVMlXGNjLOdrzRAUn
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

A MIPI D-PHY or C-PHY can be a transmitter or a receiver. Some PHY
blocks have one of each and can use them at the same time, so one PHY
node offers two PHYs. The existing cell, PHY_TYPE_DPHY or
PHY_TYPE_CPHY, selects the mode of the whole block, not one of the two
PHYs.

Add PHY_DIRECTION_TX and PHY_DIRECTION_RX for a cell that selects the
transmitter or the receiver. The first user is the Rockchip RK3588 MIPI
DC-PHY, where the transmitter serves a DSI host and the receiver a CSI-2
host.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 include/dt-bindings/phy/phy.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..9ead74d9a172 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -29,4 +29,7 @@
 #define PHY_POL_INVERT		1
 #define PHY_POL_AUTO		2
 
+#define PHY_DIRECTION_TX	0
+#define PHY_DIRECTION_RX	1
+
 #endif /* _DT_BINDINGS_PHY */

-- 
2.43.0

