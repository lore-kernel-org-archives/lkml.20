Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0663AA1BF;
	Fri, 28 Aug 2026 07:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787902553; cv=none; b=RV0ujBLXxBafzb/IAoZmcTUDrtkue0hpn4mVNjplCE3t7LQFj7AXX6FnLgRwteAp/lBJ7GHvlxaFD1yrILgFDSPwfUrnJQ5DGYUsuTTSmx36DZ6wI6vLLGifJ9DXPCuYtn//V+bJu2bWYtSU6/ec8JRmapier+OKGSy0HjzOZfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787902553; c=relaxed/simple;
	bh=ZOBCA19VLQ1IKCeBijN70gbTvNCwCmZyIOxmk5n/RS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ED65gQuWSrxyNoIzR4LqRfuCzOwcWia/XVaNYUbEEx49Jehq9idK2v5EuXeoD4F72/5TFBYPG80L9jU53ZvBW4OaPFgp/cXbO1uujTFkjDYQdGyrTt1i4C4Qu7xYP3Ycs4ydmfMGQdXTGw/kZ8TRL+iLiFPrzirRUjYJv/ifmxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6fcJnYB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6fcJnYB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBA88C2BCC7;
	Fri, 28 Aug 2026 07:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787902552;
	bh=ZOBCA19VLQ1IKCeBijN70gbTvNCwCmZyIOxmk5n/RS0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=P6fcJnYBFAFPNb+rLD734AKtJZcm1UY1AB47GGgxYNn4IbpsJSChO+h5+D5yJlZse
	 RIAWAI0xYunON7sNE00ky5MVvuK7wJyfEXeJ3CbLzjCBZPUD2Mu5AR1bsFLW6ufFRV
	 x0jdeRZhGN+f5/AGL3NDJxAvma3nYOG27SN9zo3gpV3u0b3yk8CQUw1s341F9rg1TP
	 cYkWPTlHp9qGMcritB4wmWw4wupiVMVckfHJKgeSGekD4TOnrRWmXBDzHaLUlYMl2E
	 mV+rkDDq1qMiKYU2bhuB8hCatrtWC8wApefGpj3/C0YQkP+P4M3c2+lMG4PstWkZTE
	 lrZU0yfETzXEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99041C61DCD;
	Fri, 28 Aug 2026 07:35:52 +0000 (UTC)
From: Dirk Chen via B4 Relay <devnull+dirkchen.amd.com@kernel.org>
Date: Fri, 28 Aug 2026 15:35:38 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: Add MCTP I2C controller node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-anacapa-dts-amc-v1-1-463eb4e6a6a2@amd.com>
X-B4-Tracking: v=1; b=H4sIAEk6kWoC/x3MPQqAMAxA4atIZgO2hfpzFXEINWoGa2lEBPHuF
 sdveO8B5SysMFQPZL5E5YgFpq4gbBRXRpmLwTbWN53tkCIFSoTzqUh7QN8aG9reO14clCplXuT
 +j+P0vh9XFmTzYQAAAA==
X-Change-ID: 20260828-anacapa-dts-amc-6712c7963ef3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Dirk Chen <dirkchen@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787902540; l=1212;
 i=dirkchen@amd.com; s=20260202; h=from:subject:message-id;
 bh=rEGeEm+ATZyoe3HxKSYL2gspIoEHBpWwgs2ytKBM6Z4=;
 b=Z63sFH/O7K+hj/ourvWsfKtVprO2gAFZc2jSHH6Tbxnbat8MpVQlRfpYi3XVYZFUWaSrvasBs
 +1b7UiNVonCDvhTqDRb4Ig/k6pcCe5oU0prhRBDgXib5zdgVH7BKUkW
X-Developer-Key: i=dirkchen@amd.com; a=ed25519;
 pk=NBIyLsVg/YYtGLruq9XLdLWx2PP/1MH4jDDQ1V+7wes=
X-Endpoint-Received: by B4 Relay for dirkchen@amd.com/20260202 with
 auth_id=622
X-Original-From: Dirk Chen <dirkchen@amd.com>
Reply-To: dirkchen@amd.com

From: Dirk Chen <dirkchen@amd.com>

The Facebook Anacapa BMC uses I2C5 as an MCTP (Management Component
Transport Protocol) bus. This patch enables the controller by
adding the mctp-i2c-controller node under I2C5, with multi-master
support.

Signed-off-by: Dirk Chen <dirkchen@amd.com>
---
The Facebook Anacapa platform uses I2C5 as an MCTP (Management
Component Transport Protocol) bus for communication with the AMC.
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 1fddf3a5d138..6073a643ea80 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -433,6 +433,14 @@ i2c4mux0ch7: i2c@7 {
 // AMC
 &i2c5 {
 	status = "okay";
+
+	mctp-controller;
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 };
 
 // MB

---
base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
change-id: 20260828-anacapa-dts-amc-6712c7963ef3

Best regards,
-- 
Dirk Chen <dirkchen@amd.com>


