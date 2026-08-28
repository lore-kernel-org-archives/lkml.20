Received: from mta1.migadu.com (out-44.mta1.migadu.com [95.215.58.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D467D43E06A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917573; cv=none; b=Mq/SlLv9NMmMzD5pYwuzPDDf5C/k0r72BB1pR2bj8aGfSfp6agqPeHVWvevfStjEYk0hDipjXyRDbctY8t8ay7YQfaBQqPZrleUW8EOY8lqsx+FLMvGBwo4Wa3dC7b4SGmtk+FrnD013LC5fab3/77bIcm6x4E0WgZqLhT4S4DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917573; c=relaxed/simple;
	bh=uapX6PXhcBGDCmHV05L6QsA4dUHjroApJlX837g50MY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAyZRiBa8YWyAygvOYa4zsKOt6y1khsbSCNVGrldRgUDF0Bfouu1ay5h264ZCYf+Aja3OPsWtB/HMAoHRLQS0kjlmlUIa/XrHL/I18XUskQ5j+PfK4xJgtNDik1kBmj+E+COC7EEMPPNxS1kbPnmQz3uvMNnqgek0iAMRQKTI+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=I2p4hb0S; arc=none smtp.client-ip=95.215.58.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="I2p4hb0S"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uapX6PXhcBGDCmHV05L6QsA4dUHjroApJlX837g50MY=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787917556; v=1; x=1788522356;
 b=I2p4hb0SJ6TaUY31a5B+6yE26Potg1KenkyTVWcMN1iBnk+AN0ncdIVH6qPALitif4YZZ6Ca
 pjkfY7k8NsJZuQIPzlyq4uWeJIEl/GWv/poK8jSLuJGYvLQllTs6KouwXNIIlN8PNnPAoMpggTq
 knCpn3xNY77whepV3hRPTkS/GMVriD8q/5c/mo4A71cz0J4gRCtn9DRjyejfqR0YLBEBsMSI1/0
 x7MotC25z4Ee5u1AacytyI3pFh6S2Esw3P8vHVRzEf2h29xP9nlstKZ+vkHENOEbQ/Y6ZANFPp2
 qrbjyqh9A1PWnZfnv3BeFrDHFra/YkAbOArBOuFWc9Hzg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 071f6fa85d8f0328;
	Fri, 28 Aug 2026 11:45:56 +0000
X-Mizu-Trace-ID: 071f6fa85d8f0328
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 4/7] arm64: dts: rockchip: Don't pull up rtc int pin on NanoPC-T6
Date: Fri, 28 Aug 2026 13:43:04 +0200
Message-ID: <20260828114530.1315798-5-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828114530.1315798-1-diederik@cknow-tech.com>
References: <20260828114530.1315798-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All NanoPC-T6 boards have a pull up resistor for the RTC pin, so there's
no need for the SoC to pull it up.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 84bfb33a4774..2c9390d2968c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -705,7 +705,7 @@ hp_det: hp-det {
 
 	hym8563 {
 		rtc_int_l_pin: rtc-int-l-pin {
-			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
-- 
2.55.0

