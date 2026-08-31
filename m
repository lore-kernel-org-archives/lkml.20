Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA6C335564;
	Mon, 31 Aug 2026 23:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218307; cv=none; b=Gah1JkDHGzE+EigRv22hdBt4z2tqDIixGxmRSkJ8/b1o2FvEYtvLdue2ZxevY4Ex2a9o75h5W7K9Rk3dJMbIfD+nvIfHTwkqtj0FRXr7zmBsoCI/c3JYTowJa3AtFGgcoqwx0qLtuR5/l0Ep7lRcWAPOUKtmozo1g+umiBKsyTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218307; c=relaxed/simple;
	bh=CA0BsvG5MU8vmgNuKk4vbeK2abo0g/5hs5ykktK9VyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q7PscIfpHwX8aHOG87xjjRVKUSfYSz+Yt2besq+qNDaZTL0SMFHOmFlSDhvQrDcAoyt9fBmJr1Qhh4kbRFDgV3BPbIAPisd6pZQq745eCTJI2tFM89b39qUFY3EjZJgYhdSKxLZd2dQNuYFPRisJmPNP1dRs5SKSdS8DSucxBtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=JCPBi3WZ; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="JCPBi3WZ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D19D11C757;
	Tue, 01 Sep 2026 01:18:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788218299; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=h31VU+R5UPSga0UvhcM5lnBnLp5VXrWzv1ka1JR7q+E=;
	b=JCPBi3WZdTtIt78Td+gg97FO2qxleHJqq+HDx/8RsSIzoCPdlHbnXtZQwNrdbitVUkl2X9
	O927rJNbbr9Vd1QqrexFtaEi6KaTNwrbsWQ933C2VEMy3mKn7RG1s5m1w0Xj/1acFGe+43
	Rs2ecy1rJcKUKBpxYSMpDBKVbRnmV12w0UGGjLiDx6K0nR5Tusdkq4K1Z8drSv7gHUMET9
	910gJUAhdS6E9NYt/2HDiryyOp7+fdeKmVmwJ/OBsCQWuZ6CS8vVv8J7xTlV2OMm2UEbLD
	gKUCQmKapZ8hKTsBcdldjA7UMBXX6EI5ONtI9phbBSrHeSWPA6fjXOOvSIV9fQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 0/4] arm64: dts: st: Add STM32MP2 USB support
Date: Tue,  1 Sep 2026 01:17:31 +0200
Message-ID: <20260831231814.137120-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add USB support for STM32MP23xx/STM32MP25xx SoCs. This includes USB 2.0
FEMTO-PHY driver, DWC3 glue code and DT adjustments. Parts of this are
taken from ST downstream kernel fork, reduced, or rewritten, since not
all of the content there was useful and bits which might be missing and
are useful can be added later.

Unlike the downstream implementation, the DWC3 glue code is using plain
dwc3-generic-plat, the EHCI and OHCI controllers are instantiated as
plain generic controllers without any wrapper glue driver, and the USB2
PHY driver is simplified.

Both USB 2.0 Host controller and DWC3 super-speed controller are tested.

Depends:
- dt-bindings: usb: generic-ohci: Document ST STM32MP1 SoC compatibles
  https://lore.kernel.org/all/20260828150202.173109-1-marex@nabladev.com/
- dt-bindings: usb: generic-ehci: Document ST STM32MP1 SoC compatibles
  https://lore.kernel.org/all/20260828152130.176171-1-marex@nabladev.com/
- dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO PHY
  https://lore.kernel.org/all/20260828150739.174460-1-marex@nabladev.com/
- dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller
  https://lore.kernel.org/all/20260828150937.174735-1-marex@nabladev.com/
- dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes and cells
  https://lore.kernel.org/all/20260831231359.136475-1-marex@nabladev.com/

Marek Vasut (3):
  dt-bindings: usb: generic-ohci: Document ST STM32MP2 SoC compatibles
  dt-bindings: usb: generic-ehci: Document ST STM32MP2 SoC compatibles
  arm64: dts: st: Add USB nodes on stm32mp231

Pankaj Dev (1):
  arm64: dts: st: Add USB nodes on stm32mp251

 .../devicetree/bindings/usb/generic-ehci.yaml | 22 +++++++
 .../devicetree/bindings/usb/generic-ohci.yaml | 22 +++++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi        | 64 +++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 63 ++++++++++++++++++
 4 files changed, 171 insertions(+)

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

-- 
2.53.0

