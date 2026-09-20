Received: from v511.v5ed9ac7d.euw1.send.eu.mailgun.net (v511.v5ed9ac7d.euw1.send.eu.mailgun.net [141.193.32.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC9243DEB5
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.193.32.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912408; cv=none; b=HV8KWJEwcW9Z0BHqOpcPUV2H8CPNeD9n4kPqnqLhlRq1CBTFUiiCcMavIDa8Iq2v8ELz4vTm9IF/lRGb+lGOo/GxzBa8LFwDBisvaXMZfGLfXPt8sv5RlR+3zGvrgtwFlRaIbU7KfjsjIk5uqkjJ2s6jIFmNj5piQEJ8wyCF3bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912408; c=relaxed/simple;
	bh=Yg1O8JfavL0PxQY5ZIpw2vJ2G6ywFz5YqPaYS+C76uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5Z1nu35Qvj3q4WCv0p4gbGpEKpTYXCZoDj1h0flVQkk4xNbGCRQuwHVtdkDPDtWuRwCZN309tWEZKv/meORACVnyIYpgdvfAHteUCpvR0KceKKKk1XOha61MjEVt0OeV9IwaLHG9mBt48yTXnoPTrC6xzmvMsGBBNbufXlBhjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plajta.eu; spf=pass smtp.mailfrom=plajta.eu; dkim=pass (2048-bit key) header.d=plajta.eu header.i=@plajta.eu header.b=AmcAHMFi; arc=none smtp.client-ip=141.193.32.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plajta.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plajta.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plajta.eu header.i=@plajta.eu header.b="AmcAHMFi"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=plajta.eu; q=dns/txt; s=s1; t=1789912401; x=1789919601;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To: Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=mWi2Y+lw/Zrz8B6jaQqE6k/WaWueM2GgF0q6mxDBWnE=;
 b=AmcAHMFismmVLBGZoC7iPFdSojmImKCNix9VlV7Wh2keEklkKzFY4e/Ey7d89lil494Xmoc6k2mErtCKmXWrNLHMRtG9e00EodegELgm+RDihLKo/Qc3scMIw3NVccmR6IOa4qVIAasTqqalv9Be738qjTPPOXzcuKYY3G9RXwLUnR52SAmfsF4QFXGSU1fq1/NJFqakZKpdH02S6EVAa+wAcUxpuUPzO6mLw7WuEcu5i4J/uawb0kzA0S1c7x71QpqjLm+cbXGfJiwuwAIXPe80rIg2qww7hSbhaLsWlFL186ogjyz4B91mE+QkDKsxpZpZ8PCYmdeDVpRVnL69zw==
X-Mailgun-Sid: WyI1ZWFlNCIsImxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmciLCJhOTI0YiJd
Received: from tensor.lan (ip-86-49-238-222.bb.vodafone.cz [86.49.238.222]) by
 62dde763711f91b09babc141eb112fb8433c3bdf14f6a1f222f9cb9a27a17a83 with SMTP id
 6aafe551d0b56df3ba42d2f6 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sun, 20 Sep 2026 13:53:21 GMT
X-Mailgun-Sending-Ip: 141.193.32.11
Sender: andrijsalivon@plajta.eu
From: Andrii Salivon <andrijsalivon@plajta.eu>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrii Salivon <andrijsalivon@plajta.eu>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: add Amazon Kindle 4 (Yoshi)
Date: Sun, 20 Sep 2026 15:53:13 +0200
Message-ID: <20260920135314.3191171-2-andrijsalivon@plajta.eu>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920135314.3191171-1-andrijsalivon@plajta.eu>
References: <20260920135314.3191171-1-andrijsalivon@plajta.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the amazon,yoshi compatible string for the Amazon Kindle 4
non-touch e-reader to the i.MX50 board list.

Signed-off-by: Andrii Salivon <andrijsalivon@plajta.eu>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..ec61f45c351c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -188,6 +188,7 @@ properties:
           - enum:
               - fsl,imx50-evk
               - kobo,aura
+              - amazon,yoshi
           - const: fsl,imx50
 
       - description: i.MX51 based Boards
-- 
2.55.0

