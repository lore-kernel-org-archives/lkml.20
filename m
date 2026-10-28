Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793183932;
	b=L6wZERRKaXDCxGECsANqRHipN8+QmtuNQxv7sR/xN9ZALxAHI3YkO2eusSniPy5Hrpyo
	 o6o6L6b5DFePKG789iaMB+52WUE5sIBTjWicsNOqnxTByuIun3WKUOsy+aLlZWLS0rFNh
	 PWatdkfTkq0mnnpzMRXXpNbXhNpkCHjD9HEx/8kPvf4tQ+k0O2O7cUTtngG5bvU+zzw3H
	 HEDichkRuMC1AMTI15oJykqDeUh1eer+bBkcTjFmZgh1ZPoN54fF/7EbPxSZ4pPitaVF7
	 CCNuJhCvgo/qfAgf1eiDGR9Tp9C9NFql4NdnZZo/gD9cu4IlOtvjHvlU+XURzimZFoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183932;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zSo7JvJNI/JguBbCpoc8/XQ2FeCStMcqYZXPJJsVfxk=;
	b=pyAUT1aK3vUX2rAWLcwYL4Xqm1aGC1BpINiOCj0KEEHJ2e4kDwbPxtW2N/vhk/ugCEkg
	 eZtoaGjJif9oTh212GslirlYEz/a7O5s128GbHor0dKZ9FSUjamAN3yQiKeyCfM67Pmde
	 mjL2hgqz1iWwftAWkAa6k8fjd+8zfNIXv9kG/CmGLR9PmjWXcG2jL1hGAmdjhZFRexlXv
	 b326XZ7gPoScblKzE1+XXUiQIGWIzjLojECOE2ZUDBktzu5LIOHuAV6SxP+O2oKu052ik
	 pJw4L+DjAJ0s4uQF8Zuobl2x3wUG4LhPqhIz71ZBFZHukMV1QL/xKT3OGTmIHaoqRsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZOuFMjo4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E36606A32A;
	Wed, 28 Oct 2026 10:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZOuFMjo4
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793183932;
	b=yxChS4jIGPlq9LJg7vFX4t0MnZtoVJzOnNX8HCtW8nxIERtGyNLqqBFoq5t3/pLRPlR+
	 bEOHjsI1I1Gfj25HP3utSmLonBc3j13l2wxdLHQha4UryDv1Vd989fHKGc4pmlKxrb/YG
	 fRzlEh/iDWTvyDPAQCz5JPlIV40eWZyg2Ae5S/Eya/R0hWU6IXozeC3N/yTP5qrPcjSAD
	 4SZhLL7lB8ICFZwe27Cnc4JTzwTVRASQS2r0UJzV9AP4nUuDcHF4ojelheZ/XcjjvxJ5w
	 8zAndeftxHyjcz148sf2eiERwIEunxW0ymVvVubBuanywDY7yKkA7OL3kXIQXUyG3OA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793183932;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zSo7JvJNI/JguBbCpoc8/XQ2FeCStMcqYZXPJJsVfxk=;
	b=LXBXfxtplh21X/jphWbz4W2HaQC4yWNkjCEFHkiYhAJFqtOg6yehmMlHvdDdqcWNH+vc
	 TaiFxDW/adnXs78p92K8E9Al/o6O/VnPpiuS5B+v0Pj9Es5DCeqABjhbeQJy5TNa0WTIY
	 r1Lrv4NKPiFd3zLWSSELIL4lA9xzJvy/F+eab2VMJZ1iCpy7G6xORLvOlwtLxPQ21fQP4
	 EB6CZDgoEofhufy5mq9gh/i92ff/FOW1wydvSEVQaQqOnxfq+pRRAAtanmwIDPYAY18jd
	 wcTyXuLV2ihrOV8pL0vPo45PWEEGAMXxioRc4MdR9BlIrvZT7QdkwpfNlhfw6A7gJnQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CC191F031EB;
	Wed, 28 Oct 2026 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793183932;
	bh=zSo7JvJNI/JguBbCpoc8/XQ2FeCStMcqYZXPJJsVfxk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZOuFMjo4SbZVenZdHdtiVSsgKONF7mbSzTTDGGCzLGYa5gqYdLEuMH3eCanMBSpBK
	 OP1cep/rif98tXCrUPmDUo86zp1cj9i8M9h+hoR5uqc1slcpezLc4xeBZSgnnlE8MX
	 2e/65uzU0XjXX67RJ8iuLx8Gox7HijLhvQ+q/rTiVI8O5qXqoRhYzx3VWhFfgnzP7U
	 DjEJYA/ReaWHdzkUie39XctcbMnJL6MvaYVsWADi1aceVheBLi/KZY0zvj5MTYO8ww
	 aP04iBbyrBVfxrcgRdA3ij/yQpBs0vLtbsVbvE/WFziC0tDU2B5RDUuWKDf3vZKZsT
	 9o5hRTNlhJQrg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 82510453F7;
	Wed, 28 Oct 2026 10:38:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 28 Oct 2026 12:37:51 +0200
Subject: [PATCH v4 2/3] soc: mediatek: pwrap: use correct log level
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
Message-Id: <20261028-6572-pwrap-v4-2-1780c58d2097@protonmail.com>
References: <20261028-6572-pwrap-v4-0-1780c58d2097@protonmail.com>
In-Reply-To: <20261028-6572-pwrap-v4-0-1780c58d2097@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
 soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183929; l=3556;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=Gd3C5DsMSS+5ZpC9XjgZCXGVsNoJcZ5h2EveeHMmhTY=;
 b=A1C1+2WqvhCtLWLrAC+ySEuWDt2MiMfoMcM1bCjSJ9tDi6ets+IaeKNIuMJ9E/qkbnh4MYSLO
 rez6o9EyT61ABnevcVz7KVhFm1cin8yA7hZPzJswo7ADrtlJGTvpygV
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com
Content-Transfer-Encoding: 7bit

From: Roman Vivchar <rva333@protonmail.com>

Error paths should be dev_err, not dev_dbg. Replace all dev_dbg in error
branches to have the correct log level. Also simplify dev_err and return
with dev_err_probe.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 45 ++++++++++++++----------------------
 1 file changed, 17 insertions(+), 28 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0bcd85826375..a4b10b0a97cb 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2475,10 +2475,9 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (np->child)
 		of_slave_id = of_match_node(of_slave_match_tbl, np->child);
 
-	if (!of_slave_id) {
-		dev_dbg(&pdev->dev, "slave pmic should be defined in dts\n");
-		return -EINVAL;
-	}
+	if (!of_slave_id)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "slave pmic should be defined in dts\n");
 
 	wrp = devm_kzalloc(&pdev->dev, sizeof(*wrp), GFP_KERNEL);
 	if (!wrp)
@@ -2496,11 +2495,9 @@ static int pwrap_probe(struct platform_device *pdev)
 
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_RESET)) {
 		wrp->rstc = devm_reset_control_get(wrp->dev, "pwrap");
-		if (IS_ERR(wrp->rstc)) {
-			ret = PTR_ERR(wrp->rstc);
-			dev_dbg(wrp->dev, "cannot get pwrap reset: %d\n", ret);
-			return ret;
-		}
+		if (IS_ERR(wrp->rstc))
+			return dev_err_probe(wrp->dev, PTR_ERR(wrp->rstc),
+					     "cannot get pwrap reset\n");
 	}
 
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_BRIDGE)) {
@@ -2510,12 +2507,9 @@ static int pwrap_probe(struct platform_device *pdev)
 
 		wrp->rstc_bridge = devm_reset_control_get(wrp->dev,
 							  "pwrap-bridge");
-		if (IS_ERR(wrp->rstc_bridge)) {
-			ret = PTR_ERR(wrp->rstc_bridge);
-			dev_dbg(wrp->dev,
-				"cannot get pwrap-bridge reset: %d\n", ret);
-			return ret;
-		}
+		if (IS_ERR(wrp->rstc_bridge))
+			return dev_err_probe(wrp->dev, PTR_ERR(wrp->rstc_bridge),
+					     "cannot get pwrap-bridge reset\n");
 	}
 
 	ret = devm_clk_bulk_get_all_enabled(wrp->dev, &clk);
@@ -2535,10 +2529,8 @@ static int pwrap_probe(struct platform_device *pdev)
 	 */
 	if (!pwrap_readl(wrp, PWRAP_INIT_DONE2)) {
 		ret = pwrap_init(wrp);
-		if (ret) {
-			dev_dbg(wrp->dev, "init failed with %d\n", ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(wrp->dev, ret, "init failed\n");
 	}
 
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
@@ -2548,10 +2540,9 @@ static int pwrap_probe(struct platform_device *pdev)
 	else
 		mask_done = PWRAP_STATE_INIT_DONE0;
 
-	if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & mask_done)) {
-		dev_dbg(wrp->dev, "initialization isn't finished\n");
-		return -ENODEV;
-	}
+	if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & mask_done))
+		return dev_err_probe(wrp->dev, -ENODEV,
+				     "initialization isn't finished\n");
 
 	/* Initialize watchdog, may not be done by the bootloader */
 	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
@@ -2593,11 +2584,9 @@ static int pwrap_probe(struct platform_device *pdev)
 		return PTR_ERR(wrp->regmap);
 
 	ret = of_platform_populate(np, NULL, NULL, wrp->dev);
-	if (ret) {
-		dev_dbg(wrp->dev, "failed to create child devices at %pOF\n",
-				np);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(wrp->dev, ret,
+				     "failed to create child devices at %pOF\n", np);
 
 	return 0;
 }

-- 
2.56.0


