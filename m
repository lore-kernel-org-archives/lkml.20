Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97FD4AF9C5;
	Tue, 13 Oct 2026 06:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872476; cv=pass; b=eZF3+v8oI5l0etRtFI7WL7ByboIx3xsiRqTEcWfoZT6aeC9i13s1RD7inzEUXEIQRknUvYqW1ikTgwK7OywNk0jnqO97zLgCFx34/DVDz57tbX66OjgEPtutesX7SHchzWnL67DT7M+pdaELdQXaLxJpGMlvB4qXZIDDXfS1qUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872476; c=relaxed/simple;
	bh=nZBa6AonUag7BVGD69Cp5RFNERuQJ1C1Cp8onbxhXgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=utlt6+23UeuYJ/2NYNBGd1SJ05e9V3hZuHj12NaXkho9krPLyaFGa6X13XfPkW2viR7fCW6BjlgUWBrpLVNklTlQNSth/Xw0laKA5RO4b9sg20DS+8pSkx+vfXWvj0lZi6uaGk2YGe7tPSKiprFRlfM37Q6HaaYVPAkvI2gTcC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=B9/UeEsm; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="B9/UeEsm"
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BDAA62021ED;
	Tue, 13 Oct 2026 08:21:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791872473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wlCTTzhEmqwNRCCk2BDRDkJcEczD//wMLoJIXIrJ0M=;
	b=B9/UeEsmMuN5ZWalyMX4IDLKP7k6gp3ntBuhudM1CXpp2sDRi+5FOrZD/nsu0D1B4WmPJh
	uzOaHFIX1Gt4Qh/jJNFIjXbqPTDSlsW+vLfAlxnSJn/iyXegI1QOMxe7IUfMRYE43JAftY
	KJu8XsDhsz0Lq+rnbqWDR/XsBBnYb2eP8vSUTl/gobR4y6Y5DChAHI6QJ7McPk37uaKXt/
	Pz0Y/Cl1fpGQwqVcZIQFXhNbpj9/ziqNuNIhgMPPRccJVJMK1UZ0O32i42eRYfAtDdDvrN
	541t+UzqwthunHgbZknKUqCPNd+eFruGH5cX+i4xsPAWvcFvoA5L3PBMeOVzOQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791872473; a=rsa-sha256;
	cv=none;
	b=L4iVYsLwas9ejisd/KbU3Z00bTIDdev5ZmaKzKOkZgw2P9jqC+b0pfUFO/10l1NADVaErH
	oYHy+mqsF7MbDSqr6Fzjadj4u9A5pSP8hv4yehYOfL9Pru7giqfUgPVpnt2G/IBIS5/yFV
	Db4WLeL8Z/ePJqbVpQ/qCIkShojI4QLRWjl/h9pGyWO1AWpXV9NFzya09iuTQmn9ZfPd1P
	85B1hy2cl+8Ln5jit9xY6wUhKjwjQkXSjoRJVMBoA5FQOLPGTr8ZEvb3PINAhnXK05oC7S
	KAlQCSG2FGRH3blhumZiu38mWuwjGk5n3UkhUUtDHIhQHLg512/CtWM0Hda0zw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791872473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wlCTTzhEmqwNRCCk2BDRDkJcEczD//wMLoJIXIrJ0M=;
	b=fEuYkWlaWKe+uQv6nVvfJLaargTTkVJyEE0zcShoJYD/B83iGeQfzP4cbH98r/REa9RKpM
	MfWRMNY5D4LVqUry2bJuTC7CbeKphxI//WFKd+8uxAwxJEHokaLcz4bDPirvRKNq/9RJCA
	xoFupj2yZ1s7HCM+4bgOs1lHxwdf2xIMYzG6dJZ01RfgIOUTvKXM3vN/5GSfeXJiNrb7V8
	QCNCxPlYgMKt31ni5YqGX/I+WMDxfwc2n/vGtSLEbpcONpWEkENWilWcpegu/rwGpK8zB7
	fQJrE1yxGPoNi/ZWNnA7JpKfkEzYHLQ6KQ6/WuBX/3HE2ADC/feOKyqhSREF5Q==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 13 Oct 2026 08:21:09 +0200
Subject: [PATCH v11 2/4] dt-bindings: arm: fsl: add compatibles for Skov
 i.MX8MP boards
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-2-b97ad841598b@pengutronix.de>
References: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-0-b97ad841598b@pengutronix.de>
In-Reply-To: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-0-b97ad841598b@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=nZBa6AonUag7BVGD69Cp5RFNERuQJ1C1Cp8onbxhXgg=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bZs9dt7J/v3iD05XrMFv+rOQd9FrlK7FZavkR+8qVFC
 e83WL393VHKwiDGxSArpsiisrCCT9Tjg2fkNBEumDmsTCBDGLg4BWAia78w/PetvGMYU+Q9j9/J
 5VadOOeko+ucnqatv3/0VPSyJ++rjpozMvRJs7+qzH0+2S+65weTrSSraWDIdIETVaukEp9u0wg
 vZwAA
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622

Add a compatible for all revC-based Skov boards with a touch panel.

Also, in preparation for adding a new device tree variant with a
different 7" panel than the already mainline ones, also describe that DT
compatible in the binding.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index cb99fb74805bc..3ff8cd69b0830 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1153,8 +1153,10 @@ properties:
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
               - skov,imx8mp-skov-revc-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
+              - skov,imx8mp-skov-revc-jutouch-jt070tm041 # SKOV i.MX8MP climate control with 7" JuTouch panel
               - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP climate control with 10" JuTouch panel
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
+              - skov,imx8mp-skov-revc-touch # SKOV i.MX8MP climate control revision C with touch panel
               - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board
               - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
           - const: fsl,imx8mp

-- 
2.51.0

