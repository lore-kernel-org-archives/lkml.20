Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1669A44E66C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772456; cv=none; b=A9BvGNBnW3pfwqbT9hAsXASDUJKQ4G4GK8rnBKC0ArUZ3gufHPL7WenIs/v4BWaEJeJvf675KKA4jKKnR+Hbk5AfOoZF5ApeeW7ty8lQD2DGVXaF3vn4jwAmDiqZxqElLW+ARBmXmbtFSVCukHRvKFnBF1mw1LbMmKBGBDEG1r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772456; c=relaxed/simple;
	bh=GA6wvcj1HWiIJ0AOwtZSlOKX4RxLOBFB44mQLeyFXzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Plb8fYXdHaVKmnghEuUvIIEXDfsBULxwCXU8TvR8mHI5I3LwceA0QKLpzakWc17S3LJMEzRzfwx4n6Qoc2FXyG8DoEoTExp9KBCH5cvKTNtqwo3tnZL3Eg09/44ChMc/bS/fyKHJsZOY75cTOM0FyvR6ZxR/udj42lfBkj4tiHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=lwaaZOtU; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="lwaaZOtU"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id BA562240104
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1788772451;
	bh=gzRNn/9KqahwkYAHP+82Y0/1urrH953paNl1KnHy+O8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=lwaaZOtUt5IYQVcP3ggg//m00AxpvTBE3cFvwXABha8ddWNMGlGmVJX1KOUhomAXu
	 G4gpLqMApjmq/diD18D9HWijXuzwVdJXBdmhoBbKY/AHMPMTepVHY2kiFn5MRruCvb
	 YHXuzKpCEzQhyCqf/GR7rs3wvDwxYJstzD3ysQBvwYiouXZ7bhW2VLHg25wAKLgDTU
	 5vG/cnT1sS+SilorICaRxT7vx8WMBvj8RksQlwbOxch3KGAzkqegxXCvB5ncK/Aqw5
	 HYyyBEFn2vsdSmkY7mGAVSmrxxxiUewCzYOKScZ+l2paJRRJfFTjvxBw1svH2qbFeD
	 RHlyCMeGUVJRg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hdhG95QPSz6v2H;
	Mon,  7 Sep 2026 11:14:09 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: alexandre.torgue@foss.st.com,
	mcoquelin.stm32@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lionel.debieve@foss.st.com,
	amelie.delaunay@foss.st.com,
	patrice.chotard@foss.st.com,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on stm32mp2
Date: Mon, 07 Sep 2026 09:14:11 +0000
Message-ID: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OP-TEE implements the STM32MP2 watchdog SMC service with function ID
0xbc000000 (CFG_WDT_SM_HANDLER_ID), not 0xb200005a. With the current
value the arm_smc_wdt probe fails with -EIO and the IWDG started by the
bootloader is never refreshed.

Fixes: 89fca38168c9 ("arm64: dts: st: add arm-wdt node for watchdog support on stm32mp251")
Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..35e247af957c 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -35,7 +35,7 @@ arm-pmu {
 
 	arm_wdt: watchdog {
 		compatible = "arm,smc-wdt";
-		arm,smc-id = <0xb200005a>;
+		arm,smc-id = <0xbc000000>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..2dcbba65e298 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -36,7 +36,7 @@ arm-pmu {
 
 	arm_wdt: watchdog {
 		compatible = "arm,smc-wdt";
-		arm,smc-id = <0xb200005a>;
+		arm,smc-id = <0xbc000000>;
 		status = "disabled";
 	};
 
-- 
2.55.0

