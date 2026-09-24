Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC614B7167
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277794; cv=none; b=M34MJ/lK0NlPWIonWFFRwD56MvouX4nZ7u2PnKn+5UcLAKY6YizTdc0K+bI6zCaMAoSO9IHDmWuGTQSdbjJL9FAuJJVPtO1tGs4uqo/YEe6INn3fsheqWcpeTEKbKhTs9sjwtC9tFdjveFG4IJFCzJrVufPXUAa1ybp3BfsvCxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277794; c=relaxed/simple;
	bh=HDcwmQfop+W4ETH7CpXLuJvh/CpnjelFS0BKftZWwf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tYxzbGeReVzbx87SsgYsPqxb0On1kQkcK5Au2E13sXV+vKc3kQxS835F4nczvW+Wv7vIEBDcQp94bNcfaJvn+/btRqZFpjw3cXSMWNm337s2NAZdIOufpmxAntJfLmUJrGkPoYWaFQx7eXC6hXTUzE0z8kCkd2/B37FLT/WPDFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=X9/jM1rs; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="X9/jM1rs"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 65FDC240104
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790277789;
	bh=kRgZzjPDxUsOZkrpQ66HXkRaP0ywQYyfK2o+++cNpXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=X9/jM1rsvyLSU49znepuQ9lH1cdDU96YAD4yxC2Tc4gV1kLUAdXilFaUHhDdNagEX
	 6PSxPkJOpoN5pFvQSvIa/gg8eQYQ5FpWzTEq9P3V/80Ttj4QRuS/8H836s2wwc2sD3
	 rVqQP+wD8zSdA0MshQmdHOSGoPCrzan46ta8wTVRXRfm7MYhyfji514e8XdhR5usvf
	 AKp62nAivGU2ggL8GV9bKky5E4AoFekh5nvAj47gFoPTNZEWCH2ZLrKoXWlt6nrCDT
	 IZsl+WGlg6iVaBedds34DQ/1AnCPVf0U3KCG8w/LZx01o2tnXb2RbijjVFSI2cXbXu
	 PLvHzAmFNC81Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hrNyz1nWVz9rxD;
	Thu, 24 Sep 2026 21:23:07 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH 0/2] arm64: dts: st: add digital temperature sensor on stm32mp25
Date: Thu, 24 Sep 2026 19:23:08 +0000
Message-ID: <20260924192259.20517-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series describes the digital temperature sensor (DTS) of the
STM32MP25, a Moortec MR75203 PVT controller, and enables its hwmon
driver in the arm64 defconfig. Thermal zones will follow in a separate
series once this one is applied.

Tested on the STM32MP257F-DK. Temperature sensor 1 follows the CPU
load. Two voltage monitor channels, in0 and in2, read about 815 mV. The
other 14 read 1 mV.

Questions for ST:
- The process detector and voltage monitor blocks are not in the
  reference manual. Are they at offsets 0x180 and 0x400, as found on
  the board? The downstream kernel places the process detector at
  0x200, where no register responds on the DK.
- Which supplies are connected to the voltage monitor channels? With
  this information, moortec,vm-active-channels could be added.

Mateusz Nowicki (2):
  arm64: dts: st: add digital temperature sensor on stm32mp251
  arm64: defconfig: enable Moortec MR75203 PVT controller

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 15 +++++++++++++++
 arch/arm64/configs/defconfig           |  1 +
 2 files changed, 16 insertions(+)


base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
-- 
2.55.0

