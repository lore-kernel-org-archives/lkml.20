Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF1C3C81B9;
	Fri, 18 Sep 2026 14:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742345; cv=none; b=qyjY88rX9y3sl3TWJDvl3ZjMwAmMrF+yEkFnyhYwpXvRP46fKL7ftQNRniiplA1vLslhQR7KKBieJyuyBE6YVZkTgNphnVoAHWJD/8vxiH9smYTH3WOqhZ4QikbvvD3hV4zMOzaiNdkB6Os730g7VkpVFZBh77RUyzMlC/eByw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742345; c=relaxed/simple;
	bh=+aAPBX4jAGxuxiVtroCeQgwmZugb/0T+PyVsI3w0KPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NBOb/AI/nlPoNB6fSIXm7yoFD0Hv7+llc+HB+oey5mcncKTKcerzDrH+rDPanwBcKQOzzlSLjOfMzN5kZ/SdQIfOjxIIm/QQuzDiZoa9QT28c95Qkg8/irgTnux+iNiw4RBpqZhcSjVaKPgngKVrX9hcvw95Z3yUvq20TErVEcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=DIczmh1Q; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="DIczmh1Q"
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 4997A6106A;
	Fri, 18 Sep 2026 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1789742334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dmIt+nC5rd2B63RrYxnYEeZwslXtM3bAeP8pd+OZ6w4=;
	b=DIczmh1QW3CrmlJdYweGLBd27MfDRxSr3sP8ngyBTsVk+rKApQ1IStr0zI8xU9hngM/Fss
	o36+TSC1S2dIkNpw2LZsT6U1y4ZL9kpHIf79QwUGxNl5NkofsTeO7Q5tXUXEt6JPlJrp+p
	rVxoq+zXyY2XROrjhVAW8VmS3C/qdA4=
Received: from frank-G5-5590 (fttx-pool-80.245.73.6.bambit.de [80.245.73.6])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 11D4E120181;
	Fri, 18 Sep 2026 14:38:54 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] arm64: dts: mediatek: mt7988a-bpi-r4pro: add names for i2c-to-gpio chip
Date: Fri, 18 Sep 2026 16:38:42 +0200
Message-ID: <20260918143846.30458-2-linux@fw-web.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918143846.30458-1-linux@fw-web.de>
References: <20260918143846.30458-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frank Wunderlich <frank-w@public-files.de>

Add line-names for the PCA9555 i2c to gpio expander to have more
information in debugfs.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
index 1eeb72108b9b..f54787fbbc71 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
@@ -315,6 +315,24 @@ pca9555: i2c-gpio-expander@20 {
 				reg = <0x20>;
 				gpio-controller;
 				#gpio-cells = <2>;
+
+				gpio-line-names =
+					"BKEY-A-PDN",	/* GPIO0 */
+					"BKEY-A-Vset",	/* GPIO1 */
+					"BKEY-B-PDN",	/* GPIO2 */
+					"BKEY-B-Vset",	/* GPIO3 */
+					"BKEY-C-PDN",	/* GPIO4 */
+					"BKEY-C-Vset",	/* GPIO5 */
+					"SIM_SEL",	/* GPIO6 */
+					"mPCIe_AB_Vset",/* GPIO7 */
+					"mPCIe_A_PDN",	/* GPIO8 */
+					"mPCIe_B_PDN",	/* GPIO9 */
+					"BKEY-A-RST",	/* GPIO10 */
+					"VBUS_AB_PDN",	/* GPIO11 */
+					"BKEY-B-RST",	/* GPIO12 */
+					"BKEY-C-RST",	/* GPIO13 */
+					"SYS_LEDB",	/* GPIO14 */
+					"SYS_LEDR";	/* GPIO15 */
 			};
 
 			rtc@51 {
-- 
2.53.0

