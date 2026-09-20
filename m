Received: from v54.v54282eed.euw1.send.eu.mailgun.net (v54.v54282eed.euw1.send.eu.mailgun.net [185.250.239.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40783E557C
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.250.239.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789932139; cv=none; b=D8pOoQjg1qYGHDdA2y2PC67X23x6rRjShLSnyGc7Z0q5Vq62Byy7UCsoyOSrVSzhz//ppdJnXrYW56k0D41NkmuJoxpSPJ2FaWS8gywRIXAVJKFsHOcYVUqQUa03HifTxqAZBAOhVUBPTZZT+snnCZqje9+je+CA4H2OxLd6R2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789932139; c=relaxed/simple;
	bh=u+vIZ43JfLZ8LkHmfHQtXl/8U0Cx9xVLlobAbbpN84c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxOHvqpAQNq9DisL7W+5l51E1irgeeundK8R17ycunufnXjNFmY7XcV0m5Nb2DWJa82pmWfXQr3O7sWx4hMylN9hDhj/ZoJu72vZ/Ia9OL1qa33hsrFHVFmVvwPhwLSkt0PHX75z8JctGvWNU7iooanFZJCqFFA3smT0LZ2HRb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plajta.eu; spf=pass smtp.mailfrom=plajta.eu; dkim=pass (2048-bit key) header.d=plajta.eu header.i=@plajta.eu header.b=BW7UphDD; arc=none smtp.client-ip=185.250.239.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plajta.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plajta.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plajta.eu header.i=@plajta.eu header.b="BW7UphDD"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=plajta.eu; q=dns/txt; s=s1; t=1789932135; x=1789939335;
 h=Cc: To: To: In-Reply-To: References: Message-Id: Content-Transfer-Encoding: Content-Type: MIME-Version: Subject: Subject: Date: From: From: Sender: Sender;
 bh=RtwQwsbRFeW7bEqLw+ZYZ90U9CWGFLV7cHxo0QOPLks=;
 b=BW7UphDDM9G9o2RdoeQA5j7rnHw/84zYogbPiE7iXH4vNDoO5XeNJy7GkuM/cYd1NEZEmQinu2qioGOB5uXifEvtBskAGP8xG7w1jiYLX9QvxGUMUlrAlYgLhSQWcNPQC82CvVY7uPVcus86YySMrkresCzf9VwrUZibkoSwW2cx27PdYNHD3H7lVx47w722scNHiaLUZwvmr2dxcUYegI7pcOXmDJeOLvLdvjKAk5yKY0wmiCqtaB7yhbLCT4N5j+t22EXm9kjG+VwX7pM/kU62KeGCSJOoSXs43qix5gUadugAqjZDay06prxpLBC20UpfoH0yctDZZ1d4tZ6l4A==
X-Mailgun-Sid: WyI1ZWFlNCIsImxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmciLCJhOTI0YiJd
Received: from [192.168.1.219] (ip-86-49-238-222.bb.vodafone.cz [86.49.238.222]) by
 62dde763711f91b09babc141eb112fb8433c3bdf14f6a1f222f9cb9a27a17a83 with SMTP id
 6ab03267b0e292dfde225353 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sun, 20 Sep 2026 19:22:15 GMT
X-Mailgun-Sending-Ip: 185.250.239.4
Sender: andrijsalivon@plajta.eu
From: Andrii Salivon <andrijsalivon@plajta.eu>
Date: Sun, 20 Sep 2026 21:21:37 +0200
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add Amazon Kindle 4 (Yoshi)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-imx50-yoshi-v1-1-b8a46b3a972f@plajta.eu>
References: <20260920-imx50-yoshi-v1-0-b8a46b3a972f@plajta.eu>
In-Reply-To: <20260920-imx50-yoshi-v1-0-b8a46b3a972f@plajta.eu>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Andrii Salivon <andrijsalivon@plajta.eu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789932134; l=773;
 i=andrijsalivon@plajta.eu; h=from:subject:message-id;
 bh=u+vIZ43JfLZ8LkHmfHQtXl/8U0Cx9xVLlobAbbpN84c=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgRPkrbhoPH7FSvHGDzrn6ac5XixtTH
 LGWklZFOfCUTc8AAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCGNxb76DDkKsA2EIEB+PpDylCtpW9VAHZctg/fF1JJ8079slVTPtJxwcYqGbz5u/+f0Ld8/dSJ
 qfu6ycZ1dawM=
X-Developer-Key: i=andrijsalivon@plajta.eu; a=openssh;
 fpr=SHA256:NIrmQeSA8iZxz4K2sBePBO20E3POR1tDuMtfPGdgY+k

Add the amazon,yoshi compatible string for the Amazon Kindle 4
non-touch e-reader to the i.MX50 board list.

Signed-off-by: Andrii Salivon <andrijsalivon@plajta.eu>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..dfc91bcf9384 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -186,6 +186,7 @@ properties:
       - description: i.MX50 based Boards
         items:
           - enum:
+              - amazon,yoshi
               - fsl,imx50-evk
               - kobo,aura
           - const: fsl,imx50

-- 
2.55.0

