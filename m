Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B42C3DDAE6;
	Fri, 28 Aug 2026 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929335; cv=none; b=pXdt3o6OPqC5onKnsrYo3MOv+glTiy8b0KMXE7XLW17bRUFJ+yi6YsBUH5yoHGAYGYqeRoudYuHk2uk6FSmHEV9XFUiVag1PHNTiH2XkjuwfXDKr0FwrY8DzIv962s9PkO3BAtTRf6iE8TV+pd3Q4K7twsJKyYmmO4cQ8FyTx68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929335; c=relaxed/simple;
	bh=MihG7kw11Ey45dwzuDeFmyav76Q7XFPzMCb2l6WbodI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yx41tEhnSujqaqmN1Z0huzNMhZ5eEJ9XN5jEj+gtemp7IUBkt/OIq57LJuUaVSo++/ynWazOk/OQpG+uWqsAcY0hyJBLQSJBXOG/aT/KNzxsYW3ij1qpzMwWapkpXJkzeF+0az9eclc52y/DbQUwo2wO2KwL+81ZmyslCXLElZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=GjQjpms/; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="GjQjpms/"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0286611AC65;
	Fri, 28 Aug 2026 17:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929328; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=dxEe3bwgfJv6BqUxPGodt52+sYVqWmIvkSGMdRVqqzk=;
	b=GjQjpms/Mdhvu8RQK7EjU4hWFl1hFSUT0+BkxelB5dPTjaP6Iprs8sqZQNC+lI/eIInaps
	4tW7q8bTeQWZnzdjxfHftnmBu/dmS+W1tPvZYhIAa+teGkXNH86UkbEu+U4N3brZwcwe3S
	PIvG3fTTe5lYGltgxQaXKcRD7yfCkgI4ogOrbRQfsIrJXSQPLdSGg3ncIYhQxYf0rd3ydE
	M0Sb19ZgTI4zBEZ/eqybRAa9IXUAMWNJJkfudK4W4pn87NqH8R8NZ3enhjcH8QDp/0ooBf
	0e4G2RXNy3W7GmUDH9Rnn2JJT5aDqpK35nVbQhxQl1Z27Vd7tvWuOWwAeqBKmA==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: generic-ohci: Document ST STM32MP1 SoC compatibles
Date: Fri, 28 Aug 2026 17:01:26 +0200
Message-ID: <20260828150202.173109-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document SoC compatibles for ST STM32MP13xx and STM32MP15xx series of
SoC, so they can be used as more accurate compatible in SoC DTSI. The
SoC DTSI currently use plain "generic-ohci" which is not future proof.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 322808aaa2839..474a84aa32d0f 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -49,6 +49,8 @@ properties:
               - ingenic,jz4740-ohci
               - rockchip,rk3588-ohci
               - snps,hsdk-v1.0-ohci
+              - st,stm32mp13-ohci
+              - st,stm32mp15-ohci
           - const: generic-ohci
       - enum:
           - generic-ohci
-- 
2.53.0

