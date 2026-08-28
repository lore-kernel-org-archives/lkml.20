Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EB72F8E8E;
	Fri, 28 Aug 2026 15:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930512; cv=none; b=bX2J5JFINzALRqg13QHPAigv5cTH+hMRY2mzamjiylepSQ2kFYe0qgk/EU/UGDwwjwZc7ZILbkQEnfpj682cPeMUFogIbq6Gv3vDqUNts84C2XPS8d3m+F+xgv9Th8zeL3Uus0FzsNJMv1/LX9gENF0pl5y9uJOF5xssDWehPII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930512; c=relaxed/simple;
	bh=bAOrGPwoOtTWtghXkVk1YuY6egbjiFRtjGpTIcERbkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XkftJHhLw5WBOq/7mpv5ZkVLq9xDShJLX8Ot8y2/5hWRrSuBl7/eDmWdp11DsZ7c5tB586ccXUBPkaYj9QSJRUE4QJjnm33+eiYx6NnFLTim6BtziEgCYJiDm8y+huTev+cNpaCdJd43o83277krl1Qla3XJap4QyuRkVCf45Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=NBu6wa5M; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="NBu6wa5M"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD13E11C69C;
	Fri, 28 Aug 2026 17:21:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787930505; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5wd5RZteDM8cztZDuaavwp4X1CI2+8REQybg3boMoN8=;
	b=NBu6wa5M4IHoTlYZCYrLOuB+G4taASb4AH+xyfXjVpqBgtLUrEcrNh54Yt1q+yogqVnjsn
	smjTRiHGDXlP3dV0OzVWAaItUSyRej/QS/H67kV2bAJVtPrgZxP4laOsbLjp4Wh3H1fMlS
	KM9JdgtLhEmHMT7+ycqCKx3EXUK0EgIy+6mJpP7RhYrWHJNDEktTH8NgOcfDP42ZYBZ5xc
	7/dtOR+Sn2Hyr93bZ/wD8f4DZzuCZQ+nM7YCMTkKvpTJePn0wM6Es7o/4SqEkzXNJxHPU4
	ULVGu5W+XFE4tZN4MfBzHzEsLUF6layiS4sFPqoDvpWLLRTylOUmXj/q4DSmEQ==
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
Subject: [PATCH v2 3/3] ARM: dts: stm32: Use STM32MP15xx compatible string for EHCI USB controller
Date: Fri, 28 Aug 2026 17:21:17 +0200
Message-ID: <20260828152130.176171-3-marex@nabladev.com>
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

Use accurate STM32MP15xx compatible string for EHCI USB controller in
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
 arch/arm/boot/dts/st/stm32mp151.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index c37005c00ad65..ae31883732388 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -515,7 +515,7 @@ usbh_ohci: usb@5800c000 {
 		};
 
 		usbh_ehci: usb@5800d000 {
-			compatible = "generic-ehci";
+			compatible = "st,stm32mp15-ehci", "generic-ehci";
 			reg = <0x5800d000 0x1000>;
 			clocks = <&usbphyc>, <&rcc USBH>;
 			resets = <&rcc USBH_R>;
-- 
2.53.0

