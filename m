Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B873438BE;
	Sun, 11 Oct 2026 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791739042; cv=none; b=V8gJbcEZ4ycRcypA3eWRH3ob9xLISnwxOJ4oVFqGehZP2Ex6bl+znSXqACYaZp9EIebobhjrrHvJ6ClOo2/7c9Z8TWFLEV/ag1tUyOKlRJc6dF40/P4Lv+Pf8zei8tiRMZB5pebeOtxtqsIbv/iJSlq6EnEMO17MZs233YT69fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791739042; c=relaxed/simple;
	bh=tHAjot59ik/pFMnrkyzLDoiJ7i/INHlUfN0wlrZOdMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGMcLIPH7B3mo3iigTAaIfrLd8L4ny+xP0/4f2PhmBpZKHlSbNhtJpz0SOSS+3cha/5wt355kqmc5G1V3mCpgJQ9swikYNaYuL5//8LYwJrNHClThocXQbZlcEUBr7WLkiTXwZedryPLb90it7d3WoGo1c9bj3b78QwnSyCgyD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5eNqf12; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5eNqf12"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD499C2BCFC;
	Sun, 11 Oct 2026 17:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791739041;
	bh=tHAjot59ik/pFMnrkyzLDoiJ7i/INHlUfN0wlrZOdMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o5eNqf12eZyJrfqNirHklANgxmOlovEDUCP+Y7DZ26W3eV8vb8n56We1lyPGDfxdz
	 w0XYWQCWkfa8MgGwx3MYLlB3OE3z/Xl+ZmtFgArtg9efSIB63WlypsqRcygEVsBACe
	 dafMNRue5T2VMpDO/apGsakpEQbqCFQU1VI0PvU43dc07hx9L+wUVemdXLxtsDuCPe
	 1WXEWaPPJXrOuo0MBQze/agUf4TGFp37TJyhiNlytVgqKtFjxiQ3kM3LsRksXPIXIQ
	 vsljKtsvBRhHh0os2R3o4nQ+5fyi98hXyNIADoQjWOp8aSB2n1PkeVEQRH00iCaMYz
	 5SLdN15EH8fVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE3FCA9EC7;
	Sun, 11 Oct 2026 17:17:21 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 11 Oct 2026 20:17:21 +0300
Subject: [PATCH 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet MAC
 address from eFuse
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-odroidc2-dts-v1-1-f9f0e779af88@gmail.com>
References: <20261011-odroidc2-dts-v1-0-f9f0e779af88@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v1-0-f9f0e779af88@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791739040; l=1170;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=R7e0aTjiNftlxIP1/5F0ydA79ruy5B9DDk0CJljLEms=;
 b=iPE8SJB5MzWCe9Yh8R9RdzmL5sAZ4DtJAaiPDPSw+ODkKm1rsEkElCljy4/M8OICurkyL48Fm
 OSJvRcEW4l5Ax8wYS0r2P5Q738SAIGM+GStXrz5erHBuJ8mpjN1BnAv
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com

From: Fil Dunsky <filipp.dunsky@gmail.com>

The vendor programs a unique factory MAC address into the SoC eFuse at
offset 0x34, which is exactly the eth_mac nvmem cell that meson-gx.dtsi
already describes.  Reference the cell from the Ethernet controller so
the kernel picks up the factory address itself instead of depending on
the bootloader to populate local-mac-address, or falling back to a
random one when it does not.

Verified on an ODROID-C2 booted with a mainline U-Boot that does not
set ethaddr: the interface comes up with the factory MAC address.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 5943bc810..639b97ad5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -230,6 +230,9 @@ &ethmac {
 	phy-handle = <&eth_phy0>;
 	phy-mode = "rgmii";
 
+	nvmem-cells = <&eth_mac>;
+	nvmem-cell-names = "mac-address";
+
 	amlogic,tx-delay-ns = <2>;
 
 	mdio {

-- 
2.53.0


