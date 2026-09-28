Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1786B4D1790;
	Mon, 28 Sep 2026 13:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603393; cv=none; b=U1up4hSGNmUchR6FI5oAbYieqacU/QNhwHnmhFt0hj2sid0rmsessmcTVv7G7DhtNvUD0nR2V8pL84tSlwNnncHvjkWG+z5OVFguuX4P1Xc44nJc5QD8mK1Y19ZDg5H991wo9wV9gqD5iXlRmxnxlAJ17hd3HtbcWf25vA9vnuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603393; c=relaxed/simple;
	bh=6c3Ov9/W6SQNfFxGr+9p4dhjPVm+YEtqa/HcaGKCd5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Zt3Jlovg3Oxqp+ui7Td8Hbg5xb7FxgzBPTMeXMthKeXe8OId1DaoE1BwF22KBh7EGBbPmCsbek+QPO2jjjTkd+0VvGcJsZjwURLhSpF06wC1f+3oVQpempJakeGCOUIcny+xuVYKvwShIOse6jh3WDdp/ORQByCgTcWT31P4JA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7ouKAB4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7ouKAB4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A84D2C2BCB3;
	Mon, 28 Sep 2026 13:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790603392;
	bh=6c3Ov9/W6SQNfFxGr+9p4dhjPVm+YEtqa/HcaGKCd5Y=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=O7ouKAB4YSDZ1dhd+C0+8bIkqBdnj1b0IyKgQC0eEtB9IpJ66VmvDHNC0OprXfPad
	 Zc3bRNOcWpaI5CpvINTTgRDB9bb2Dzm4v/9uIoGVWAQ1WzoFlzH6f7mHWudqwdrHQh
	 5Mkavg+jWN7LU9DVp2JItpi7CVqbyko3rcf/qNVWpz8U3RQhueU33ix56Gn9j4BISD
	 vjUo4rCFSk/fZSzfLKJUvA1OcfEgAqOkZgNQEssEgOSPWd6U9ASBy08WyaRSWdJDHG
	 eDVwdws6QHcmL6tNsJLVRBxCqEejDnDwaABqWKNXicTrAP+M6g/kfyxxmZ2ItVYCIF
	 4FqD9KSi+oZ1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91780C9833F;
	Mon, 28 Sep 2026 13:49:52 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 28 Sep 2026 15:49:49 +0200
Subject: [PATCH] arm64: dts: lx2160a: set #pinctrl-cells on the pinmux node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-for-upstream-lx2160a-pinctrl-cells-v1-1-4faa8a341cdd@free.fr>
X-B4-Tracking: v=1; b=H4sIAHxwumoC/x3NwQrCMAyA4VcZORtoMzY7X0U81JppoHYlmTIYe
 3eLx+/y/zsYq7DBpdtB+SsmS2nwpw7SK5YnozyagRyNbqKA86L4qbYqxzfmjfzoIlYpadWMiXM
 2PNM09L0PdA8DtFBVnmX7T6634/gBemrjAXQAAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790603391; l=1124;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=F0blJHgPfcv2wZhfmtzs3uZ/BwHnx9s7GUCpxGKKE58=;
 b=irunWbeaCOH99oscPjVx+F1HEvnbOdO2seB4xYU9BDCB3RpM5+MKE0iparZordCaXVEHrSPhv
 6zGF3LvVep2Bpkr1OqmwgSdKeL9pdVIwYWpV8D1vQJ/p3nUBcRWYG5M
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Currently, we have this message at boot time:
  pinctrl-single 70010012c.pinmux: please update dts to use #pinctrl-cells = <2>

Let's declare it in the DT instead, the value is the one the
driver already uses, so nothing else changes.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
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
base-commit: bf184a29ad1b33bd8922029eb0ca3f2866007258
change-id: 20260928-for-upstream-lx2160a-pinctrl-cells-729533182b85

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


