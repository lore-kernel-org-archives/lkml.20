Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534C0393DE6
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791115939; cv=none; b=JrnXBCOzDFte85HYHM7HfQOt9O4A2OxMppr/jKLXTfsCkQlwVo0chWY/mkhlcdLN/F3dDYVVKA2GLripvgB1UTJNCq4/SLpwDlLc3Xwn92Ju82uLmhQtdcr8M2dzeNBQNY91DzJbPx2BXRqCveVg9ftqgkrEv4cK7lTz+/zP8+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791115939; c=relaxed/simple;
	bh=zCRlaYRtiDZ0106Dt1rzDgnHMMWwyyGWM6ftU3+1Vr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O9WniIlJsh+CoI51JL9/dQ2ncc0uQDvP5TgwUqmC5EhyFL9bWDJ5t6zzsWmPCMgpyyA0+IUAZV6oCFNwlMuy0YmaxUaujLCd8ffaPW8Rnjx7vvw1NZEuWaATdAdmkX1nwudb0UuLW9MKIWjOQJGNnTKD8yAeSRPOYXiP6BiS6/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=PgC0y9P6; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="PgC0y9P6"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 1432C240106
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:12:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1791115930;
	bh=AG556z8R1LKXoPo0/Jo0pWxC6V+wNFmVQqR/a0fBV58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=PgC0y9P6AL+Hjdl2vXEQ9pAQyYhK/vtSmQr3DJC5nfDEEaKkk+QZVAms1zRQZM2GP
	 Fse8GY1m0GVQyc414aEn6EUo8OW5c5+lLDlcVDJLKxaBl2AtN+5HOHKW4101t0NDlM
	 tZsX8+E0dSUKiErG9KPiFTHjcxyk7NGVdkKyv+gCKlscE/vlNbk7ztQshlXs4kcm8s
	 whyNdUJtQEMSWKparH5cM8QeNRN7Tc2x3c9eptObx/2lzs5yDkKyg2WICT4J/6Qha2
	 Zgf6sj2ExdgDqq60PPMWnt+xFerSEA8rLaYoquGwix1H44WAwFghXpo5BTSVUFTh3z
	 h4ACwWWVVYvVA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hyLx45Qn5z9rxB;
	Sun,  4 Oct 2026 14:12:08 +0200 (CEST)
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
Subject: [PATCH] arm64: dts: st: add thermal zones on stm32mp251
Date: Sun, 04 Oct 2026 12:12:09 +0000
Message-ID: <20261004121200.64034-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a CPU and a SoC thermal zone for the two DTS sensors, each with a
critical trip point at 120 degrees Celsius, below the 125 degrees
Celsius max junction temperature of the STM32MP25.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index b624f998b87c..fd174c88b26d 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -158,6 +158,34 @@ RET_PD: power-domain-retention {
 		};
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay = <1000>;
+			thermal-sensors = <&dts 1>;
+
+			trips {
+				cpu-crit {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		soc-thermal {
+			polling-delay = <1000>;
+			thermal-sensors = <&dts 0>;
+
+			trips {
+				soc-crit {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&intc>;

base-commit: f831584128ac2a36fb4fa62fe106793d08c2dbf1
-- 
2.56.0

