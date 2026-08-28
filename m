Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AF2241686;
	Fri, 28 Aug 2026 15:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929345; cv=none; b=pIDOsDZXd/Rr8nTjvG2VkSt6aBI0faPabaQzumxVidczgCHHbO2pwfT0AEfRft/cJQeAnkmxcLKRXnhTLXMhS/uLfnX7WXmeOVwPfccaNZLDAfQSH/sMAy/RolVoiEmankwyljWYhZHSW7IZDR+/+l/P36J1S32a2NCvbgtCgrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929345; c=relaxed/simple;
	bh=WxZNNhz2t3DrL43M8X0apx8NZaCVLNrcCPPgj9904xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oGG+gUGSIAg0llvAPZ4/W4o2EyS1sxf4OkBYDqZmcLuLKVs0SYx8hkSV1l/GCwatGfgPkq95/CP/rX8b3JkcvZXSQ/37hSKwmz6Wh0DpoGjf+vmlLABLjq5AXS8ENF3ULM4n7GQQHIsnU0wdmn/beja5sJsh2EAuJJQDbreNtfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Uq5xrl3b; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Uq5xrl3b"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 397FB11D0AA;
	Fri, 28 Aug 2026 17:02:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929337; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lgyRAX691+dPee2wS+kYKvMuKZnnQ8dpo3wSmi/bPIU=;
	b=Uq5xrl3beHun1dOTIQsWriWCLv/odlot+SXmeVGN5jCAOIS7o3KZgex6ogOTtOoz1OnpoW
	GfURJ92iGnzXCfCaynyffePhUyPjTjodd59yLNa0AI+a0GnjvhHxxHAbkyl0LTqtfrKhoj
	onmWJV2l5UeuY8khTp+mK+hrLU9z4NHSKuaVAavySWforJ0UxPIEMQSmibihmsBul/Z/RI
	bxRrIswbR0u+j/vJpSFUqJd2qg1mRPvzmqinFg/S3KXrnFiCgfuBN469vjvSQ0BrSFoWAG
	KNh2wbsuiyccQ4wGVHTw+O3gbl1ooVo522bKEegVWpHh2hyItT0ak242Wparig==
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
Subject: [PATCH 3/3] ARM: dts: stm32: Use STM32MP15xx compatible string for OHCI USB controller
Date: Fri, 28 Aug 2026 17:01:28 +0200
Message-ID: <20260828150202.173109-3-marex@nabladev.com>
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

Use accurate STM32MP15xx compatible string for OHCI USB controller in
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
 arch/arm/boot/dts/st/stm32mp151.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index e7fec8b49ae16..c37005c00ad65 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -504,7 +504,7 @@ crc1: crc@58009000 {
 		};
 
 		usbh_ohci: usb@5800c000 {
-			compatible = "generic-ohci";
+			compatible = "st,stm32mp15-ohci", "generic-ohci";
 			reg = <0x5800c000 0x1000>;
 			clocks = <&usbphyc>, <&rcc USBH>;
 			resets = <&rcc USBH_R>;
-- 
2.53.0

