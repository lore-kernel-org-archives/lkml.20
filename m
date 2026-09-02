Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B773EC80B;
	Wed,  2 Sep 2026 08:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338069; cv=none; b=srPRsy0bcjmL60TDofGsuVfzeBhI6GMMtMFjZLvSzNHkNpmnZzGnf5teMYQRYMHFksG0GezvAcrd2LKFyJw9uENQJ1lEcbVe+kb90sL56UHhEez06NUWngUQep6uo0zV5ujNIZUzc55coJ1ECphW8nEEe34GEw8FwYhEc0klBP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338069; c=relaxed/simple;
	bh=pvQyvqS9sUtcqSCSR896wbTjEugeM9jmQYJkml1WOl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sSRULgVwQut3/HSh168RrhBQkIcB78b1y8sEXspnugkCCEaSVXyof3QeO+pnTZ3vAvvp2Y/O/PECRaQFpuHZXITjG7XuRH/3OK4je+X08wHx4742akN1taT1mcO3Lei/87x/4+v7nUQJGfk/uFaWl4FUSqDIni1u5u+ITqDP0lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=emjCrp2J; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="emjCrp2J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PYz90TRr0+Fy2EqkgCP2u40jCTa6/ZMbOumw0L8qocQ=; b=emjCrp2JvyczuPrIEBTplKFjtE
	LKCZfjLlFj7phDxV1jGutyp1XnN6fxkulEK9Aon2XwK2r9/oZTgJSdw3zh/Quxx9yEjHHzipN5Y7V
	7dBWJgF16D3QKPlZWJ5A4DfBEwdixEmvU2boH6mcOb6uiFyBNJ/uhi61rkhFEr9km7u4Y72lcmeZY
	8Ir5J0TalNLme14G4ewxrbc7a1N7zSuwN5N2xwJ/BaXCzQkWiXtFAMVqQZ7SO53UHPA6yKBKG/5MW
	EBaEFK/N7zga8MR39BhlHQGEeYIXr56fMa+nkUbTVGM+zxpcLS5CquztF2ogM8IzWOxj14ndC1Ta3
	Atuj2+HQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1fyx-000KR8-1a;
	Wed, 02 Sep 2026 10:06:07 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1fyw-0006It-34;
	Wed, 02 Sep 2026 10:06:07 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 2/2] ARM: dts: imx7-tqma7: sort I2C device nodes by address
Date: Wed,  2 Sep 2026 10:05:38 +0200
Message-ID: <322d6e916243122662e06941ff6b0104cf84fb09.1788335665.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9a916f24b610cc60e0efd13296f281e00b41391e.1788335665.git.nora.schiffer@ew.tq-group.com>
References: <9a916f24b610cc60e0efd13296f281e00b41391e.1788335665.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28111/Wed Sep  2 08:24:01 2026)

Fix order of the nodes to follow convention.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
index 7f49c80fef4c6..353af6b320cb6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
@@ -137,6 +137,12 @@ vgen6_reg: vldo4 {
 		};
 	};
 
+	/* NXP SE97BTP with temperature sensor + eeprom, TQMa7x 02xx */
+	se97b: temperature-sensor@1e {
+		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
+		reg = <0x1e>;
+	};
+
 	/* LM75A temperature sensor, TQMa7x 01xx */
 	lm75a: temperature-sensor@48 {
 		compatible = "national,lm75a";
@@ -144,12 +150,6 @@ lm75a: temperature-sensor@48 {
 		vs-supply = <&vgen4_reg>;
 	};
 
-	/* NXP SE97BTP with temperature sensor + eeprom, TQMa7x 02xx */
-	se97b: temperature-sensor@1e {
-		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
-		reg = <0x1e>;
-	};
-
 	/* ST M24C64 */
 	m24c64: eeprom@50 {
 		compatible = "atmel,24c64";
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

