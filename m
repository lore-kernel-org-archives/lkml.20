Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6072B4F96CB;
	Wed, 30 Sep 2026 16:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785568; cv=none; b=P9t6LinDN7cZDAqPbbq8oUKmQaJbjPim2v6UT1/+6ZOIcBogjFK/yjxWvMTj3esIDFsXhBBx6fZ7sPUA+Ochi5qOFPNtj5G0EQyaBl/x59kdM1sTM9BqUolN8oWqhzlc10VeXA4Up92bDn8V1DvKzXVTSCq5a/DYjvQnZ/rzgZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785568; c=relaxed/simple;
	bh=RoaSAuFkmfIKMerxI0FoRahCi+v7wWzqSFC+cTzlshI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8AFOqA2+qRxtzJvyciJYifbq48pl2KDDdT51Nhq53QDwKWAWSTC6VallwFnRiS5/k//Emn5C/IMNarOo1kgIbXow5jGd+J/sIovQx7TfzXYo56mRSwW6dwltWZkfaKVSAlhKN6NGXaP50g+VFdFl5nKoqaIsQbkD9uGBafAVgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=wO/2gDNk; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="wO/2gDNk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=bvmjk8+3isiEx/PbL0NMnF+Vy0Eg5tTMHHc6McK7PbA=; b=wO/2gDNkwf4hBc6ZMg5S6Ut+Ze
	KmuIjHS6O/UNcjmbgbMNyp9u2XTVf9xEHW9WHErOwYGbIvPb6Fwv+87ChskiZ7Ms+ZBrllDTvCG11
	nJR5s0q5fiaeJTBIx04wLpI5TDc6/Bdn2tFNMkFXmxyHcIF1AWO1edSpGSs7kpmUAYOps+3AcaM+u
	3xjCaBkNjpH2nLBoukmmDPrCxR4P7LcyyWsnUF8fI75FYse2AHsfAkhNUZRgLviEBOxcc8cLfwLZx
	1MWPc9zV/ShKQ+2FISKdVpaUSZsxgC8CmH/eaHFKVX9bToGAsXUR5gf0y8zydBnksOxrb9cjqh4hD
	bdVn1IAA==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	damon.ding@rock-chips.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v5 1/2] dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma Systems
Date: Wed, 30 Sep 2026 18:25:43 +0200
Message-ID: <20260930162545.2357505-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930162545.2357505-1-heiko@sntech.de>
References: <20260930162545.2357505-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The DisplayPort carrier is a very simple baseboard only providing serial,
ethernet and a displayport output.

But its main functionality is that it routes the Analogix eDP controller
to this DisplayPort output, which allows to test that controller simply
by hooking it up to a suitable monitor.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74..3b270690afca 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1336,9 +1336,11 @@ properties:
           - const: tsd,rk3588-jaguar
           - const: rockchip,rk3588
 
-      - description: Theobroma Systems RK3588-Q7 with Haikou baseboard
+      - description: Theobroma Systems RK3588-Q7 with baseboards
         items:
-          - const: tsd,rk3588-tiger-haikou
+          - enum:
+              - tsd,rk3588-tiger-displayport-carrier
+              - tsd,rk3588-tiger-haikou
           - const: tsd,rk3588-tiger
           - const: rockchip,rk3588
 
-- 
2.47.3

