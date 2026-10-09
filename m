Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C379249E138
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538664; cv=none; b=EUzvdhVJJPwlwBEqokRa9szkcqtx+aoEpge82GxND3GCbv9gVAaye1kz6F32J2dzW21r+LpUh7dep8MA4Qfa1FNAt95/HFkAc1SzFM7OadV3sbVLW1QyUGlGuzbR6TzxTuTZ9ytb4Vs+zu40KJBziCa8lKVdI2rL6XKBoU6cT4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538664; c=relaxed/simple;
	bh=dRb+wHKU6Odz7DI5Yc43zePOzCwqX+mTCaStqapO7sI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fIFgxSh4OXB1JYrmF0PtRYHw9DK8tfGLFwW7FdJG/apOQ88UU8pZVmS4xRYC1UjDmdasB9UXxCvifNJxvGeK+LSE9Oj3p+7GKlRVcSQxQgqXfsHZWjnc4UsKC/j+xtfUF9+yMDVgmpk5JGRiGj+I2e9JPK0s+whHeN6GON1/OdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=j+35i+9g; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="j+35i+9g"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 305BB24010B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:37:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1791538639;
	bh=ZJ4Upg1kLDpt6VtqbRdlMoDn76OY0lfMTsNgv+VL3nw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=j+35i+9g+vIo8mtvMkFjgssgQweIQ4rbKev6iZUT/IbdetWJjamLpD5AB8F3z/xBM
	 0U9Juam73h2l3wkDKQyQwWySBPT2NC3Y//VuDMI1L3Q0PXE8YBY+FTkuLCcnEQD8rB
	 ZGvBhZBKmaeua7bpAM+z7alb5E0ylu5M0xznr9dem2DGcaIZRl/OMIejSkMPdJIwJj
	 d/UUqo7Yf82JlAZuqLgX1JJxEl7/YguIVTnbymMkNmCZR/jChv7BoRz3IRd4fsBH+u
	 Wk1qIawtYlemKqwElR5Gn7no5I4TZ6xzz5wyGsd7MAufFKeNGL+PWQVWFbfwGolKLh
	 3tTbCbP4lrMlg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4j1MG45kllz9rxD;
	Fri,  9 Oct 2026 11:37:16 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH v2] arm64: dts: st: add thermal zones on stm32mp251
Date: Fri, 09 Oct 2026 09:37:18 +0000
Message-ID: <20261009093709.19907-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a CPU and a SoC thermal zone for the two DTS sensors. The sensors
have no interrupt, so both zones are polled.

Each zone has a critical trip point at 122 C (Tj max 125 C minus
3 C sensor tolerance).

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
Changes in v2:
- Set critical trip to 122 C with 1 C hysteresis (Tj max minus sensor
  tolerance), as suggested by Patrick
- Add polling-delay-passive, the sensors have no interrupt

Link to v1: https://lore.kernel.org/r/20261004121200.64034-1-mateusz.nowicki@posteo.net/

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index b624f998b87c..da75e02f7c8f 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -158,6 +158,36 @@ RET_PD: power-domain-retention {
 		};
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&dts 1>;
+
+			trips {
+				cpu-crit {
+					temperature = <122000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		soc-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&dts 0>;
+
+			trips {
+				soc-crit {
+					temperature = <122000>;
+					hysteresis = <1000>;
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

