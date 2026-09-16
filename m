Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C393B4908DB;
	Wed, 16 Sep 2026 22:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789596498; cv=none; b=UCFV103r/qaaAR72rK19cJuRzzYYxHd+IMkPcGa/s+2LQjpMrz0msFnbchqJ3eOJ1UERF4F6CKKN9bFwHi4yhj7FnIRo5w5lhLJrq2Ni9PcK7lrXcRvKD75Sspy/AW6zBcQtkJ3jN5zjxhX9iSBQLwXHGboKPJTPV+bynKcWVM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789596498; c=relaxed/simple;
	bh=nxkGyeHtsrQzaOcEkCVLY02vkgpdX290P3BFs1DueJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Inl2uN0H4cMVJVRC4IRzPUYGPtxPAxPn2twsymCK8nQlQD/mK+reMw3rFtE9gNch3ve5y4mOU2JoD3bFSrjy4O8xJWXbJfmUC7k4fVmSyglV/jtih+Ja6zHkJO4ai6pmTwgkZSpKTc5cWr5i+ibnIQ+RuUfQZtzxBpccFe3q5iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Tvn5BVv1; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GTRVOv6c; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Tvn5BVv1";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GTRVOv6c"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hlY1255bnzKnRx;
	Thu, 17 Sep 2026 00:08:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789596486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fiPjcCfrZDpkJa9XggDDghz/xr0MLnU4sclLIpuyUTI=;
	b=Tvn5BVv1h8c17a+fi2zeZYQeAMX8ihT4R2nuaWZKmho8kAuX9dHwvwQvYZeeSzFAH5baki
	8eVfL5wBRlETcIqKXRQdxCH/vxrknU9MwDn42BKOMTQmNMgJE0oWOP+kxsH8e3hBKq/brf
	ELGmNWSlqIV774Q6WzkVoeofRxPI73NMRJsqULVg7elw6ebNU0bd15ZCO+cP0fo8pdvH4y
	E8NsFNkxqSD/oxMVMQvaNz17zCn3ImYtvps2GVfpkqtxyQnseOIZzotZYz8pI9e/L7clVK
	ysT3+aptVMPH8u5zTFbrbgC2sw86zwNUillvp6klXMNjALeU8gEF3bnkfQqsDQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789596485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fiPjcCfrZDpkJa9XggDDghz/xr0MLnU4sclLIpuyUTI=;
	b=GTRVOv6cqtQ1UV+EdzjVKukp2M1CnIycMBElJ6FoxZgjnCA9DiZZetJHxkaLkXs1nn6XIB
	eG8Ydm1GjP0CXXEE8px/tZIwLLMrQ8aPljMdTS0LO2TOTGr/Y0mOGp3nvsEgzZrEtQLDUc
	6Bayr39kOIb4tfFT1MclCIivknVKKu5MoGgfYYKKaomyTMir2TGo+Hdb5n03n0ZqAgqa9v
	tSle3+39nxSZQrUbt08Og16/lWP3Qo/xhVxE76B8QClgZ1pm/JcHU9I3g3dQiKirKpZAhx
	HNZQ3upOR8bej2dAulFW9x+K+j5GV7UIyYamTa5Wmc9zlDcW5RVzVEj5bvGG6Q==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: ironhide: Align inline ECC carveout sizes with bootloader settings
Date: Thu, 17 Sep 2026 00:07:45 +0200
Message-ID: <20260916220801.240796-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bd14e6954791015599b
X-MBO-RS-META: dj669y3ffcji7xcyikz3xcy5jjri9fua

The DBSC5 DRAM controller protects DRAM content using inline ECC. The
current set of carveouts follows SoC documentation, which describes the
three trailing carveouts as larger than the rest.

Both the downstream IPL and mainline U-Boot on RSIP configure the ECC
carveouts to the same size for all eight carveouts. Align the carveout
sizes with the controller configuration set by the bootloader.

This makes 1638 MiB of DRAM available for each of the three carveouts,
which adds up to a total of 4915 MiB of newly accessible DRAM on this
platform with this fix.

Making this memory available does not pose a danger, since the current
set of carveouts were carefully set to a larger size to prevent any
possible issues until a confirmation from the hardware team become
available, that it is safe to apply these less restrictive settings.

Fixes: 6fa6ee724d8d ("arm64: dts: renesas: ironhide: Describe inline ECC carveouts")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index 8e68266bb0ab0..239175c54b937 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -161,18 +161,18 @@ ecc@18cccc0000 {
 			no-map;
 		};
 
-		ecc@1a66660000 {
-			reg = <0x1a 0x66660000 0x0 0x999a0000>;
+		ecc@1acccc0000 {
+			reg = <0x1a 0xcccc0000 0x0 0x33340000>;
 			no-map;
 		};
 
-		ecc@1c66660000 {
-			reg = <0x1c 0x66660000 0x0 0x999a0000>;
+		ecc@1ccccc0000 {
+			reg = <0x1c 0xcccc0000 0x0 0x33340000>;
 			no-map;
 		};
 
-		ecc@1e66660000 {
-			reg = <0x1e 0x66660000 0x0 0x999a0000>;
+		ecc@1ecccc0000 {
+			reg = <0x1e 0xcccc0000 0x0 0x33340000>;
 			no-map;
 		};
 	};
-- 
2.53.0

