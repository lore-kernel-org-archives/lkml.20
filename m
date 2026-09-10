Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73F03B47E5;
	Thu, 10 Sep 2026 10:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035392; cv=none; b=YfV8T0qFpuklW3m19MjIKl9Ce/JAPd3HIattuYvQntkmK14q+FCrjiMRbhxWA5siSuFYUs9H2jjGkke4ZEUejH5O/IdEICMxhHxRDH7u6B3T0Ec2PeOg6ryVfKFJ2ppwza5sJmPln8F1qz6Jeme8He7+JiT9P89c6WKROwfl6ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035392; c=relaxed/simple;
	bh=uWf4itylZNdvPEQg+ynmTMRoOnBb3ZY5PVibdMBFWto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KWUvWSVz5OVhdxaTDIe7VBLk5q5sJ6v93EyuYErIVKpTWv9Jej2zReFaqjwFfRdPjWAy9zk2Gm0pXg6HSQ8d3RRdukp9artC+bXSewSNnX6XMvNkM754CKyRpvrsEwjfmjwg5wjT/lPXZhOroF7ZyW+ETJ33QeBU6Jg/zx5cH7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=m7gPW7Nt; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="m7gPW7Nt"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id ED93C1FABC;
	Thu, 10 Sep 2026 12:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789035385;
	bh=0vgXszPk/6A9hDxAaTn3qwjWdJafIMQkMqMjKyfDlNc=; h=From:To:Subject;
	b=m7gPW7NtRCmInN/+cDwXBsh6HZmnx5527R8uFtMbd9UHVwKQijvclnnq7zgbkTtjJ
	 7Bwik7qDIHZ9XWLGrqTdGPRwCe9/VXmJwhYHX6/+JRsZG8um3HFzeH83rS6ZVWDLN7
	 ytEVSDSTm+Z3b4fVZhPK0VmrqgO0YvH0JCvqzE9o4o0IftB8VTiU9c+8VfCaZhY+UG
	 eVnIFhWM3ChrU/5DjbKOlkFDpscNzEB0COr6wFIAH0//+8BBhqgLhjY2mFQZKZXkbK
	 zynOThSCNBCiF0FNe6Gl9QqHsmIIdzRG9GW/EkL1v7B7c4ZP3eegasa5S5a4s+86hK
	 PgYTpyMC97cFA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/7] dt-bindings: arm: fsl: Add Lino iMX91/iMX93
Date: Thu, 10 Sep 2026 12:16:07 +0200
Message-ID: <20260910101616.139270-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910101616.139270-1-francesco@dolcini.it>
References: <20260910101616.139270-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add bindings for the Toradex Lino iMX91 and Lino iMX93 SoMs, based on
the NXP i.MX91 and i.MX93 SoCs, respectively.

Lino SoMs use two board-to-board connectors to interface with a carrier
board. They can also be mounted on the Lino-Verdin Adapter, which
converts the Lino interface to the Toradex Verdin family pinout and
allows the SoM to be used with Verdin-compatible carrier boards.

The Lino-Verdin Adapter also provides a Wi-Fi/Bluetooth module, an
Ethernet PHY and a GPIO expander.

Add compatibles for systems consisting of a Lino SoM mounted on a
Lino-Verdin Adapter and connected to either a Verdin Development Board
or a Dahlia carrier board.

Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx91
Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
Link: https://www.toradex.com/accessories/lino-verdin-adapter
Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 338dd9eafb17..a32f779f02e4 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1511,6 +1511,15 @@ properties:
               - fsl,imx91-11x11-frdm-s    # FRDM i.MX91S Development Board
           - const: fsl,imx91
 
+      - description: i.MX91 boards with Toradex Lino Modules and Verdin Adapter
+        items:
+          - enum:
+              - toradex,lino-imx91-verdin-dahlia # Lino iMX91 Module on Verdin Dahlia Board
+              - toradex,lino-imx91-verdin-dev    # Lino iMX91 Module on Verdin Dev Board
+          - const: toradex,lino-imx91-verdin     # Lino iMX91 Module on Verdin Adapter
+          - const: toradex,lino-imx91
+          - const: fsl,imx91
+
       - description: i.MX93 based Boards
         items:
           - enum:
@@ -1522,6 +1531,15 @@ properties:
               - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
+      - description: i.MX93 boards with Toradex Lino Modules and Verdin Adapter
+        items:
+          - enum:
+              - toradex,lino-imx93-verdin-dahlia # Lino iMX93 Module on Verdin Dahlia Board
+              - toradex,lino-imx93-verdin-dev    # Lino iMX93 Module on Verdin Dev Board
+          - const: toradex,lino-imx93-verdin     # Lino iMX93 Module on Verdin Adapter
+          - const: toradex,lino-imx93
+          - const: fsl,imx93
+
       - description: i.MX94 based Boards
         items:
           - enum:
-- 
2.47.3

