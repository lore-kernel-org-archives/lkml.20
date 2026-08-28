Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A585E306775;
	Fri, 28 Aug 2026 15:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930503; cv=none; b=Xz62EEioL4RWgpjSj8sZPzOCm/xmdwVIBZKZwq9TjyC3DdBOAmA/eX4GXTcGlYVNfNRDLtPEPl3Bn8aYRgiRwQcRjvDYVf0OQeUJi8OeqiZQbX7QMO2vuaAeZC9Qsk/OEMe8cXym7eu/4HaLHRkpJf5qvZk4m3ClEp1wyg+f7M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930503; c=relaxed/simple;
	bh=sA3njYVC28W7mw3gyfP0oATUO0bmd1xuckBZOcY01AI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LQbCNessgPcP2W7cuj+MHWNYKOYRl9U2PpNB+JoaUIg1f6oZjkdvfJ3KsOh01BxvmKJBaurILNq5nhKNX8Uru9/ooc8wk4tM578AshB5F0mHd/qVeJjeHmBxEhA5rUILUnmD+NbuKnh5z3hC09iUXSbUM8ozz0iA0o9UetAu+j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=iyYX//EC; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="iyYX//EC"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A85211C69A;
	Fri, 28 Aug 2026 17:21:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787930495; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=1Lhf28p1KpUv8PgegBMsP1d1gnOFYTeDBzEP/RItsI8=;
	b=iyYX//ECqZvLfseXzTmTgvjkD1MsiuGO7BUIVM0E+5/rABdyJaMbg1N0SCYf+mvByRPOzb
	eTc4lVLeacXAZPJHydblJGzbs6vn7pRv8044aXC7QfeueocOGYX/hAldtW6DF71fFwcnlr
	C1gUJqjXtGeocmqQ1KEcGxq/UufdEBaiXVqdDoyhfocAPXS3DeGGh0kiGBXZpqpb5wvoAN
	q+5Ve+Pfsod7xHrWqJh4vIYmdWaukA5UVkweftd6eSiI7Lc2kBnYdYnFH7MXvQjWx7cjrQ
	d7S8T5YD7wUUeIEyPi0eeR+SeetPdk2IxdXPDpqajQdfhiVZefz03FWyt20YCg==
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
Subject: [PATCH v2 1/3] dt-bindings: usb: generic-ehci: Document ST STM32MP1 SoC compatibles
Date: Fri, 28 Aug 2026 17:21:15 +0200
Message-ID: <20260828152130.176171-1-marex@nabladev.com>
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
V2: Place ST below Socionext
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index ae9fb70d0212c..5d9dfea8e2160 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -55,6 +55,8 @@ properties:
               - rockchip,rk3588-ehci
               - snps,hsdk-v1.0-ehci
               - socionext,uniphier-ehci
+              - st,stm32mp13-ehci
+              - st,stm32mp15-ehci
           - const: generic-ehci
       - items:
           - enum:
-- 
2.53.0

