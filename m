Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D074F55C3;
	Mon, 28 Sep 2026 21:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629713; cv=none; b=n+zxHR5sIO3GdVhdkJ/XxCDKSGtv/qho7Kv3rGebAqbMNquzwtq1xGaXtfOsxpcIN2KcDQu/kNMfmtZ1HcVehxEQ9nb/7YAtdt1OPBXBWbCGmhif3+JllxBffTl6imfgXwkEYseViLEIxRXwswpeVGADO5qTGB7ABg1CbHMaWvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629713; c=relaxed/simple;
	bh=ubCLZOqyKtAsDaeaTiwxQToK3l52AquCJw2Wy54Kq+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Rl10dYh+Btyb8SCo76LWAIx6EQkrTi2PkwCdNiTD05N+L4dn7cRmKdK+GJvvKHbyMl+8bwMTAfWBB0299lJzdqj9BhRgr8ayDySGU1GABkXCrCi7F+IIbdIqbE3RLfjUDK33IBAkpgap5vj6PCRXzc0yFyZAzR08jmS4v0Wxjlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=scFcWAFP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scFcWAFP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C41FCC2BCB3;
	Mon, 28 Sep 2026 21:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790629712;
	bh=ubCLZOqyKtAsDaeaTiwxQToK3l52AquCJw2Wy54Kq+w=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=scFcWAFPzVwlgk6Mfuy4dGt/T10sb3XTyF8CZvofpLpfICykWRUzpp5Nv0QPzvo5d
	 2spSQHugSGLmjwWgUQsmrDnYCrkJiDPEYY2/oZTRMrGaQeLYWEV+22AvFUnL5X3hHj
	 H2/xU+ojjPIcLxRjonDJN7A8Sh0xmSlEnEVdfgQ8rlk/rnt1KQLUbcdyRy29ZItgmh
	 g6ikvlvyMCTA9y2IWYXcn+UTg5wkYrqm0WmraLOuqQgD9UUQk6F8tIX3jcNeZm8d0K
	 SZkNDbvYk0zhz8w5TzvODjbo+7BtKL+zFUtEDyqQ7YIPl3KeOVOMG0FjWZweuT6iZZ
	 /CWyG53GgaK7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E792CA5FA1;
	Mon, 28 Sep 2026 21:08:32 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 28 Sep 2026 23:08:28 +0200
Subject: [PATCH v2] arm64: dts: lx2160a: set #pinctrl-cells on the pinmux
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-for-upstream-lx2160a-pinctrl-cells-v2-1-1227b2e897d3@free.fr>
X-B4-Tracking: v=1; b=H4sIAEvXumoC/5WNSw6CMBBAr0K6dgwdPhZX3sOwqGUqk1QgUyQYw
 t2t3MDle4v3NhVJmKK6ZpsSWjjyOCTAU6Zcb4cnAXeJFeZY5w0a8KPAe4qzkH1BWFHXuYWJBzd
 LAEchRLhgUxWFNvgwlUqhScjzekzubeKe4zzK53gu+mf/yi8aNJTeWmOLUruuu3khOntR7b7vX
 ySey0bSAAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790629711; l=1258;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=MLG+A3X72Uzk7Ufcvox/+HKIq9Wjjn1mtqOgeCdt28M=;
 b=Kg5Dd4el+o3eMbJo2GVlTwYzVEDdR0ZdS9fQGXKBUZ0xTpYc1C8lDtrgVM07nHcjhgFnBKUlJ
 +PQXpdJPPEPCf6JomddSRVqbGzuQO4hkdwxruh1kqSVsU6J4+eG2jIl
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

The below message shows at boot time:
  pinctrl-single 70010012c.pinmux: please update dts to use #pinctrl-cells = <2>

Add missing #pinctrl-cells = <2> to fix it.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v2:
- Reword the commit message (thanks Frank Li)
- Rebased on imx/for-next
- Link to v1: https://lore.kernel.org/r/20260928-for-upstream-lx2160a-pinctrl-cells-v1-1-4faa8a341cdd@free.fr
---
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
index bccf2d673023..2085362ab0ea 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
@@ -1536,6 +1536,7 @@ pinmux_i2crv: pinmux@70010012c {
 			reg = <0x00000007 0x0010012c 0x0 0xc>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			#pinctrl-cells = <2>;
 			pinctrl-single,bit-per-mux;
 			pinctrl-single,register-width = <32>;
 			pinctrl-single,function-mask = <0x7>;

---
base-commit: 5d034f17b24642b2a764c0e3a68b4c6937c9ba75
change-id: 20260928-for-upstream-lx2160a-pinctrl-cells-729533182b85

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


