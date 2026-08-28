Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D05E472F84;
	Fri, 28 Aug 2026 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929376; cv=none; b=hWMnvOh34TjFwdaWsXaXI9dNqjD3MhiIPhflR/+BkCtqiyFbmOXv8qvtfbMqCHlnARyKRovrixbGUiK5Z4CKHIcsFJXyhL65OKmnxUTNk2r+DrixCxNPBgaZI83dryvsuGYlBr9c5a6PuFrHA9hi09GRdTmJe04djiC7Yp9Mn+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929376; c=relaxed/simple;
	bh=w5BzCYxL3cS87Gx2qBEmLtViub31k0M3vydzzzVyq+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QyQ6T2fKNi77ZVlFht3vvgHuVj839cZpVneeulOYsLCR0UKYHkOrWBsgn3gyFxpzhwJ8I0Qe/kAWg31R/pKQBECrH2ajHthSp+TdSBT/4v1hkOEpgxYuHy1kF3b9KH+K3bovZ8vWUgY/G/MAA/F0fnC2TcKBvJAYutlAgF0tQps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=FZJm/uE0; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="FZJm/uE0"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BE9311C623;
	Fri, 28 Aug 2026 17:02:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929369; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=6U//SMUXKttZ6dq7phfLN3OMy+cbhaVE5LFNf2l4lvs=;
	b=FZJm/uE0zRvCIMzy6elJyi+Xm5TX21j71THhWTJyAvmbrGTdS64Lr7UnAusScVmQ/iMsNO
	f35MKAl+mX/u8BdZG1EnSCcJIMZLXvdzLvwZEE2LFRjFvrmV10lhJlkz9JxngLqMWdtBwX
	boaTBZb9f+q1+ziyRBGpVwSaBXoEgBmPdb8rE4BXe061JGYACxrVZ+2jUCtdouydq9rzP4
	hhj9IeM2/SHKr2MBD1dxY/bVgCQDxfTuJzMuhwfInQpK2mOvTJvkc3BvgXJme8xWweCzGb
	PDjTzRoDzbZdf+6GhajBwMf6y+lqheM+4neF3xnyyd+7yVNRAAbRYGa+fPdcow==
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
Subject: [PATCH 1/3] dt-bindings: usb: generic-ehci: Document ST STM32MP1 SoC compatibles
Date: Fri, 28 Aug 2026 17:02:25 +0200
Message-ID: <20260828150245.173147-1-marex@nabladev.com>
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
SoC DTSI currently use plain "generic-ehci" which is not future proof.

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
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index ae9fb70d0212c..fb6d6b312ab2f 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -54,6 +54,8 @@ properties:
               - qca,ar7100-ehci
               - rockchip,rk3588-ehci
               - snps,hsdk-v1.0-ehci
+              - st,stm32mp13-ehci
+              - st,stm32mp15-ehci
               - socionext,uniphier-ehci
           - const: generic-ehci
       - items:
-- 
2.53.0

