Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CE547D470;
	Tue,  1 Sep 2026 12:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264943; cv=none; b=hGXHn/9U3iEGmVQG6CmWMdXSB/Yk382fzzABkY36W5W5cLL864cyci7Mtye96zyL21t8Pb+ywGb9g/XNwS6mtljwrLzjkCCbzw9Nf8m0Y0Wu/saJS/lly51uNO6COnIYKbyop+CVuKQR7DTbkOYOX/w3ABOlvIk2gbiAGlDfCMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264943; c=relaxed/simple;
	bh=nLtePXYENm7NHGSWbCsuDcLkBfW5HOLPz4P0eN7JISM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6q95luFL9eoJpU4mPjtuiouydIOZmL9CjL1mgvUMJr7U66YDkCdImmo9Y6S/UuxnRDJ7tHBDfyMesS1rv4NzAzG5gwE2wCBPAfvATD3Q3eeRuVU1yGm804/uNda72aYxl0WKEej6+7JezmaF9Vz2dwWeoSRVrkO4GCS/N7P0BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pooBuwYF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pooBuwYF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB69EC32782;
	Tue,  1 Sep 2026 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788264942;
	bh=nLtePXYENm7NHGSWbCsuDcLkBfW5HOLPz4P0eN7JISM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pooBuwYF+3uhA/orhnYs7yb4I/U3WwmcfYZXXbCj9/emrIHguFFRt+1DrFqXmilhf
	 omdqR7LoDDjj+ovDHlk+EDHihc7UvRXUv0WNRwP3MXDYhIsAWculTF9CJNlzj2ftHG
	 5lb0Qph0QIMSlUD6T022cdXCLkWQWGCWQOvEt5EB4tqRUGbM44FpoZCgXiOA7Hznj7
	 Woz3FhQz2nAAkqAx7pvsn2OpFFM80BBu7fA4t++octG7kHkuZCkbisbQJOQX2Ll0gf
	 MXncZ3nKRAWKK3i2Cd00FFD0uJiXIciBFr6fVDwQue/f0wKKkwsgxMJaRXRQmqppXN
	 4FCYm2dVE6AAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E2FC624D4;
	Tue,  1 Sep 2026 12:15:42 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 01 Sep 2026 20:15:19 +0800
Subject: [PATCH v7 04/11] ARM: dts: aspeed: anacapa: Add additional EEPROM
 node for SCM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-anacapa-devlop-phase-devicetree-v7-4-0bd71d2e0105@gmail.com>
References: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
In-Reply-To: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788264931; l=1234;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=GjfjnpwE0tmhDKN4idVs7q9lvt+oOtXIm3xFGJyXtAY=;
 b=Xjyj/YLgnxmwvUG2EhkLAICBwMcmiu0PNukR8Dn+YySCsoeSBHer5ExcGt1nrjDMqJ4Kkndn2
 UATSXoO6RtdDHgZj+20c2BxO3mekWoae7CTzBwAXuf04gjN7lJrXQtT
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

The SCM FRU EEPROM I2C address differs between SCM revisions:
- Rev B uses address 0x50
- Rev C/D/E/F and later use address 0x51

Add an additional AT24C128 EEPROM node at 0x51 on i2c9 so the same
device tree can support multiple SCM revisions.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
index be7f17ad5f8e..77126418a702 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
@@ -3,6 +3,20 @@
 /dts-v1/;
 #include "aspeed-bmc-facebook-anacapa-evt1.dtsi"
 
+// SCM
+&i2c9 {
+	// SCM FRU
+	// | DC-SCM Rev        | Slave address of eeprom  |
+	// |-------------------|--------------------------|
+	// | Rev B             | 0x50                     |
+	// | Rev C/D/E/F/above | 0x51                     |
+
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+};
+
 &sgpiom0 {
 	gpio-line-names =
 	/*in - out */

-- 
2.34.1


