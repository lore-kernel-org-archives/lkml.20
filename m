Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABED35E1B1;
	Fri, 28 Aug 2026 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932625; cv=none; b=kHriUxakOQ+qJNFGLz5UnuZ+fez73C2Yt35zRF+xev1Q8REhJ5tvpFIbmY2/X5rCJSX+kpIS1NI52KEkhwdgeDnot8um5o+g7frTuFtWuF6oHhSbvnzDdqnynT3NT0k/2TlAOW9jOEfnjGIOn9gAtjKXoCJx9Up82dDPWR6XX74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932625; c=relaxed/simple;
	bh=rHmzyWdMO+eVRObSMp6AFbK9LnaF8s5Fncd7UTj1WgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lPOWk/CDiG14bGV5cnEmQTO1Dfw4BMfPCZvALJJYcFnVne9EG09x4SEAn1oc1tv8XZrBa1TZdyEd3xuQR7KQEOUEp/TC8dJysKePHFmvWd6Z98EPvWsXV6ToHFV11gqZGCfdkUdr/9hs97TXrxIUxko0vuiqpFkjg3tFRq1Plyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=QXHRWS8F; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="QXHRWS8F"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C907411C6A9;
	Fri, 28 Aug 2026 17:56:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787932617; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=1r8mgzapUG70AxS67SmdFCEspk9BAKsN7JCX6Vq1IZs=;
	b=QXHRWS8Ftl/OHc5pQBQZm6WwfyMJS3E+Hd2x5GkNxFYs4VC5WchnsdTD+2AzW/NpVGAHmo
	0fxZkLPt1PaUsp9NMimQf7ACjX9g+cyO/eBRra640jPoaoeEF5rSGqwUW0JK201Z0Tgynn
	kwOOTsslkXUmfUZQSo9zR79z2J2lbdy+7BL06pvLPIkIvg94qclaZ54Z9lgJBlUh3c6Vn/
	/6am0k5KC047K135FHn/I2xGm3vP3rE2Ughnl1hBuCihChi2rl4JHoLc/t0BEtlmrzCPXE
	0bl+vCtDYb58f0JtPA9vy/9tPqelhvVbc1JNNM1W4eOnCLc5TpD7YW9vXlcP6w==
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
Subject: [PATCH v4 0/4] arm64: dts: st: Add STM32MP2 USB support
Date: Fri, 28 Aug 2026 17:55:44 +0200
Message-ID: <20260828155647.353877-1-marex@nabladev.com>
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
  https://lore.kernel.org/all/20260828151216.175020-1-marex@nabladev.com/

Marek Vasut (3):
  dt-bindings: usb: generic-ohci: Document ST STM32MP2 SoC compatibles
  dt-bindings: usb: generic-ehci: Document ST STM32MP2 SoC compatibles
  arm64: dts: st: Add USB nodes on stm32mp231

Pankaj Dev (1):
  arm64: dts: st: Add USB nodes on stm32mp251

 .../devicetree/bindings/usb/generic-ehci.yaml | 21 ++++++
 .../devicetree/bindings/usb/generic-ohci.yaml | 21 ++++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi        | 64 +++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 63 ++++++++++++++++++
 4 files changed, 169 insertions(+)

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

