Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930310;
	b=ayPPg9qxbd79yIwDjGHDAm7D3H/W6JmkFiA163w8uXINpOCbgUvGsRyDYG6DDmtZOxmq
	 qEt5QbdIT+UYCJb5/gV458AtQ+HDSp+EeDVRxKcogbXamJYtxggve7KZ/atmIHy59twXh
	 t0wPiDqp3bX6cl2wYEcME20nB3WbRdMAjiFnX9oP8c4B/FzLrTFayYfPZPMStUo4venPh
	 Fh3VbVAMXY6/z3gwQgnynUGUqhYJcmdAVGN2KddhvEKbhuIsWkthq8mncicazL1sq/ez1
	 M0oNeQjXoPlC0WWJPMGcneKyMZpq8IToTaLfVY5YFKTOay0nFckKlASb/aBtZSFYByg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930310;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=A8nrZNesO9VLezCFBss71uBRpn9fM/JhgyAtVyrelME=;
	b=pqPO8uH3XR2jizvT3AELTRnDkdNWHX/YxoKRpWHQBu7GoHaPOKZ8sOA90jz/xeVa+lpy
	 EYbQeN8Pbgy3fsqWC+15q73koGklCRSsdR/tKTkQCBlxOEh4qcIVgDi2eLUPdNWpYX3xP
	 9/EXLP2wy4F3kGduKUEnqCY4aG7alXW/rLaJpjb8O+y9Yzv9wCSlGZXUUnAaMiuXnfC3e
	 OX0dpiBmsHgSdrRB4aZYKDkmgEsHpb6Z+PTMIddRqtaGnnBNQttORG71BCcYcfFIKLdTS
	 Dzk/wQ4fBkv273T2+FK7pqblpbokregC37I6cP9jGZJz+/J9g9IIcwK89MYWEvvkoKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=bMyX7dQ3;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE5D606A31C;
	Tue, 17 Nov 2026 15:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=bMyX7dQ3
Received: from francesco-nb.. (93-41-19-23.ip79.fastwebnet.it [93.41.19.23])
	by mail11.truemail.it (Postfix) with ESMTPA id EA3E21FAD2;
	Tue, 17 Nov 2026 16:44:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794930299;
	bh=A8nrZNesO9VLezCFBss71uBRpn9fM/JhgyAtVyrelME=; h=From:To:Subject;
	b=bMyX7dQ3wYrLehzQAWo5jATDdKgQu3k7LcAXyKDdCovr4y/ziIiu5t1HODtiMytG9
	 KxZxUh+ZMITBTynT228gU9DLHoLp0BO6cRnU3aVF3gdPVOYyEPxbYoKWfPvjvlVSYY
	 v2iFNOrdGCGX5m8+wvtqoBqHciVk6PQ4G8gZOMAJ3eYsfoCFIDvSCVcLwiYIOHUJ9t
	 uzJ4OMuZThyv+ZPB/WC7/3GfZl7h6c95pKXdSXJOel33wa0i2iJ4n3WZzK/VHxflSy
	 qZQyK3vkTJtGVRbp0dQVOWpOP/Jznor1bqxXG3RjNMBvUFgpbBYAzl7FZ3Hw1zwPMh
	 JpT1Iv6FOMMuQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] ARM: dts: imx6ull-colibri: Add RTC aliases
Date: Tue, 17 Nov 2026 16:44:48 +0100
Message-ID: <20261117154450.461570-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Colibri Evaluation Board and the Iris carrier board have an M41T0
RTC backed by the carrier coin cell, besides the SNVS RTC of the SoC.
Without aliases their numbering depends on probe order, alias the
carrier RTC as rtc0 and the SNVS RTC as rtc1 as on the other Colibri
modules.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-eval-v3.dtsi | 5 +++++
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi    | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-eval-v3.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-eval-v3.dtsi
index 692ef26fbab3..a296454641e9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-eval-v3.dtsi
@@ -4,6 +4,11 @@
  */
 
 / {
+	aliases {
+		rtc0 = &m41t0m6;
+		rtc1 = &snvs_rtc;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
index 5e408e54b335..e0eacd0b6928 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
@@ -4,6 +4,11 @@
  */
 
 / {
+	aliases {
+		rtc0 = &m41t0m6;
+		rtc1 = &snvs_rtc;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-- 
2.47.3

