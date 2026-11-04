Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808975;
	b=M32b74P/C/sFUGLAok75Upy5qdL9Q84CiWd3PsUM+mahIossO7kD/ryE5Gi1Mb2udw43
	 /scVrUaDwbl+SUE2q6Nm0l2FrcUe4eanJpWC3dZ9+I0tbQNBRLva2ddawTJVHV6H/evfJ
	 Deu3tJeplpDjnD9xq3g1satNu8tUr0DpscX3XRz/IxriVbN3wFnNzxTNN2eXLBK6N1NbY
	 xfsZhYqPWeNHDia6h/1zn0KxMAr8lUhBk1o/q2iW9giczrfHiq5AuRDq4QLwWNtd4fiAD
	 YNJ/liKGKJwuAgggE6GVmcBDOjn4U8BQGh37xyyqihdAamYyvj6C921qCv5QfSjg0xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HJM7/PuFDUDOwqvZxCE1CMPyZQc4Y2DCZuVTcSLNH0M=;
	b=VHn20dgMSXFMOSC1MF+/UEVI0BOguwPd8bYdy21YBrNIBXEph5ligledUGl79/Za3FbL
	 PYSVLnuTgq2rkhLObpWo+15joKDXYtg1KblJXfqPT+l75vKzXErM+FDu6ZDHHN5PTrreD
	 u7AZh++5A3ZeezSQ6lz9880K0AVx7SX9vutpkKDVTgwjoqW2N/Yab2NeLpfLncfGEXt2t
	 GG4AHBdl7p83GQehtQ2owrj0hf3tyOTladh4uX9kSKY6KwNDxVXlJ0tqws8cSeeM/V+n0
	 h6uRanWYYB6oIhvpyVkxfAKlN+fAs2JyiocXJV1drnAwViSzvsm2BZ61FpoY1/4bJyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.net;
	spf=pass smtp.mailfrom=posteo.net;
	dkim=pass header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=bWYCGMD0;
	arc=none smtp.remote-ip=185.67.36.65
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D80606D835
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D80606D835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=bWYCGMD0
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id AC44824002A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:16:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793808972;
	bh=HJM7/PuFDUDOwqvZxCE1CMPyZQc4Y2DCZuVTcSLNH0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=bWYCGMD0qJP+YwmDPWOA+XFnLEjJLabifZ/qVezj8x28+07HdAXuPlPE38aNz0+Es
	 njakRp7uW8MqLGLcvdXB8uIThbmyIkcX5Df9ndhLj5vTVPwr9X2Lz3HEzXURpdcP/T
	 lK2k7L1yud5POYULLH4HMcXeHF/1ARE07+i9veXB1QLLCOmKQKFiuzlWtSoCV2/I+v
	 ZmbpobO6RvHSXp+6E4qX+VEfcU6Gd93blhbP7LqznnUnTNXHaTcoY89s3RtZJwvt9j
	 85C1jM3CpNGEZgjREDgOv/O7tL7oPPrpIpYiN841dMwOR2sdHCy266bwcozhMtMx7t
	 FrjRqsA2QY2qA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKVtG5m16z6tyK;
	Wed,  4 Nov 2026 17:16:06 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Cc: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	Julius Werner <jwerner@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Marek Vasut <marex@nabladev.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] arm64: dts: st: list both watchdog SMC ids on stm32mp23 and stm32mp25
Date: Wed, 04 Nov 2026 16:16:08 +0000
Message-ID: <20261104161553.30115-4-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ae4d08bbe3f4 ("arm64: dts: st: fix arm,smc-id of the SMC watchdog
on stm32mp2") changed the watchdog SMC id from 0xb200005a to
0xbc000000, the OP-TEE default for the platform. That fixed the watchdog
with such firmware but broke it on boards whose firmware still uses
0xb200005a. List both ids, the driver takes the first one the firmware
accepts. Kernels that read a single id keep using 0xbc000000.

Fixes: ae4d08bbe3f4 ("arm64: dts: st: fix arm,smc-id of the SMC watchdog on stm32mp2")
Reported-by: Marek Vasut <marex@nabladev.com>
Closes: https://lore.kernel.org/all/1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com/
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index fefbf6f4f153..7526e86f5a1d 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -35,7 +35,7 @@ arm-pmu {
 
 	arm_wdt: watchdog {
 		compatible = "arm,smc-wdt";
-		arm,smc-id = <0xbc000000>;
+		arm,smc-id = <0xbc000000 0xb200005a>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index dac3d2d23ff0..143d83216530 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -36,7 +36,7 @@ arm-pmu {
 
 	arm_wdt: watchdog {
 		compatible = "arm,smc-wdt";
-		arm,smc-id = <0xbc000000>;
+		arm,smc-id = <0xbc000000 0xb200005a>;
 		status = "disabled";
 	};
 
-- 
2.56.0

