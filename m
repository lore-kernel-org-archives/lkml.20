Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAFA4746CA;
	Fri, 28 Aug 2026 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929340; cv=none; b=T0H+HDX7P9NZX5N940cOtnv06eZEVynbC/bGh4jMGDBlE/EdPC0/ZHR8LLOHUTRv+GjYxapslBgExCitOjtBL//gAdxTmlgbuCenREQV92dd0D8jV1dh+2AQVka7sfWXLIHd9jJW0/IYyg2LmEHjPuPOGWqJDDhzmCDxvXOlQl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929340; c=relaxed/simple;
	bh=RZyS/K0v11XgDsI+6GwrTSF1n/rdzJr5ASYbAfR6N4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAeDHe2HeiDgCdV4ofLCoYq7ie+ouUxCRy/89xbQtuKZxWz6DH4FdR2YdXJulX5tlVtgUTpDkfyn4HGuSHNu4dZ4zvbpdMQd9WHYmjiVdCMUeGpStDnxGzwEPgQGwNpq+KFCwnuEKIXGj3+wzxiVBAJcWYeSPIwncPnF+F4kjtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=JGmG9ka+; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="JGmG9ka+"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 539CF11C71D;
	Fri, 28 Aug 2026 17:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929332; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9QKKyAD+RKpUraf7qRfHorcMHBOqKlvlmP8To4qB6X8=;
	b=JGmG9ka+2rbZczh4qBCG+sWTHkPGfjADElZhdFStNQT8mx7T/Sg6Exx/8xkzdppPi121Mh
	FISeEuR6A3YsxA09hsZRikMkKkebyRXCQWCHyC4Hve0gElXfNQToC2prNirAZmqwnI5+k5
	sl5hyaoUOsarjlCmPF46+YlHvxzffUbHvG9KDtwULqFjrceJf3sG6ee6SuW8yar+lVqB0g
	xKTlzXjnFGsz5VGbFeU5jrk+GEITAlLG9jjpygJt/JbWqTEHb3FTt7cQbxkeV5v7bQ0YZ6
	nG2vW9v0/Fv536aKehXLzJckG38GUlwajJkk7fzz4Hqeh+Gx1Ws984JNBXruWw==
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
Subject: [PATCH 2/3] ARM: dts: stm32: Use STM32MP13xx compatible string for OHCI USB controller
Date: Fri, 28 Aug 2026 17:01:27 +0200
Message-ID: <20260828150202.173109-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828150202.173109-1-marex@nabladev.com>
References: <20260828150202.173109-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Use accurate STM32MP13xx compatible string for OHCI USB controller in
addition to "generic-ohci" fallback compatible string. This is future
proof, and drivers can match on the accurate compatible string in case
they need to discern this controller from the generic-ohci one.

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
 arch/arm/boot/dts/st/stm32mp131.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 5ae33b26e313f..d1c5afb5f89aa 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1128,7 +1128,7 @@ crc1: crc@58009000 {
 		};
 
 		usbh_ohci: usb@5800c000 {
-			compatible = "generic-ohci";
+			compatible = "st,stm32mp13-ohci", "generic-ohci";
 			reg = <0x5800c000 0x1000>;
 			clocks = <&usbphyc>, <&rcc USBH>;
 			resets = <&rcc USBH_R>;
-- 
2.53.0

