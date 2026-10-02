Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B0146E007;
	Fri,  2 Oct 2026 14:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949821; cv=none; b=thvh0dAZefgEDPSjcT9TtrroZMnxZc8dnlgeyApueWNj1wdINFS1ikTzEqc177eTTTNNERFRFDTPZTqJqglGKK9tbuss8C7lw8w+ucwk0pRQINvQtf+kmFwMAMaR+ieApbR++3auk5lIjAvJAPGbRLc5BmqDzTo6clXwUvzryKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949821; c=relaxed/simple;
	bh=RoaSAuFkmfIKMerxI0FoRahCi+v7wWzqSFC+cTzlshI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVqMlECfIR4OKpDTnvBqxOtX8F32/MSAEwFWDEl8KFhiceG5WfRqQYZ4e9TJwb1n0EIlN5OBk5Xb97yIrfnwdJuE0lnu/Aj/M0kHYZF6hcOxgy0CMr0MGgg1W5RCL0mI2aifKE+8P/Lq26LleEwQRLY8+ne+tyeZabSkfRBHUuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=qmqbRWZ0; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="qmqbRWZ0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=bvmjk8+3isiEx/PbL0NMnF+Vy0Eg5tTMHHc6McK7PbA=; b=qmqbRWZ0QowXq2Swaa/U2k2OC7
	71mnCUypmoTjQCix0mXwDK6JT31JOQDc1ouX+aOp6vhjXkDPK6W0IwKfMx292qVRgdRX2vO/23mCo
	5HBtIRaWMQ7rKofXm/JPx3i+NODHDdbQLDU2gZL1BOlnLqFccx1OdeGb8gGYpGPGUtXtNAsQMnMtr
	rpFqV2NN0WqegvvRximHTrD+NCf7QI7Ew4Seus2T/d3OSleUAzbgvobbebkdbCPE6GvUZPs5lIkD8
	EZ6nDzUfYE4mhP0xsyBsGhVtciLe3O+iOIbguwdI9QeWze4QR1ePCpuUiXZ8B1RnJvRGl21q8Ewpx
	hw3JBlVA==;
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
Subject: [PATCH v6 1/2] dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma Systems
Date: Fri,  2 Oct 2026 16:03:29 +0200
Message-ID: <20261002140330.2904616-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002140330.2904616-1-heiko@sntech.de>
References: <20261002140330.2904616-1-heiko@sntech.de>
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

