Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DC9315D40;
	Fri, 28 Aug 2026 15:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930507; cv=none; b=oqHMkFbI+eyLlqUsMk1M1HC89RnF0qFKuyuAqdWYZpEdKdOjuFXUo5Y4QQims8G8ucLpKloXPKb/i6kksC4caDg/BpudDd8erZqhMZfcfOCpeOUusrwdN6+0EBkW9H1iBl6m6/oKVsDriZq5htLysZ2o8LEPbVoSVk3l8vzAHDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930507; c=relaxed/simple;
	bh=zBr1MfN7PC5+YPOJJXOZ4RajlR5B5be+l4IBroazAzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWAX/0danUfgSbwqJS2Wme/cCP9bO0NDSlsCabk3pPE08CI/2xjcowrKXCD6Cm5lnJ0Y3Y+6vqBQv2ovlSy84dmhaYkt9ap4cSGFSi580SYXMXMzgtFWo9SwbiIWIOHjZHnO4ztu8WyPpaLywV2Ur7+EAtJLXRuDQFzst7kz91A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=DVUOoBfa; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="DVUOoBfa"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C492911C6A9;
	Fri, 28 Aug 2026 17:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787930500; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zDuoZeD/14kWvkIt2iJv+zU8zp9s5Btcy4vourr3PaA=;
	b=DVUOoBfaNgQCYOI5ZXN1/TznFoAo9doAG0YdaqCowNl43beO7hYHkw6lrnQCVUfzJInWzR
	IdooIIMGvdhQC6BXBFbjBnMdqB+VjQ6luMR0S7IjraY1nWwWyclcB5kcDvClwhl1iDWKgs
	VhWmHr4BDNkg4IvLHPbka5AC04uE0M1Ffxj3eTbU8XoPWLYRzrHJu4t2J/npHw6Vk9KhK1
	5aY0bAXr0KWtOOipEnOuxcDQXOjI73PqAJsK6bwovjBoh59z2Uz+vg3P/9NgqS/bhD1os4
	ofLXWZIysMn9cF+1YK9Ge0wUS2L5WCC37C/yx1fEU2q8vrlqXTqxj1F3jkHHMw==
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
Subject: [PATCH v2 2/3] ARM: dts: stm32: Use STM32MP13xx compatible string for EHCI USB controller
Date: Fri, 28 Aug 2026 17:21:16 +0200
Message-ID: <20260828152130.176171-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828152130.176171-1-marex@nabladev.com>
References: <20260828152130.176171-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Use accurate STM32MP13xx compatible string for EHCI USB controller in
addition to "generic-ehci" fallback compatible string. This is future
proof, and drivers can match on the accurate compatible string in case
they need to discern this controller from the generic-ehci one.

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
V2: No change
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index d1c5afb5f89aa..ae45c2023afeb 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1137,7 +1137,7 @@ usbh_ohci: usb@5800c000 {
 		};
 
 		usbh_ehci: usb@5800d000 {
-			compatible = "generic-ehci";
+			compatible = "st,stm32mp13-ehci", "generic-ehci";
 			reg = <0x5800d000 0x1000>;
 			clocks = <&usbphyc>, <&rcc USBH>;
 			resets = <&rcc USBH_R>;
-- 
2.53.0

