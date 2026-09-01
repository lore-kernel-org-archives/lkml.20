Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4218F47D93B;
	Tue,  1 Sep 2026 12:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264943; cv=none; b=YvVcIhzRPjGixBPqsqDiUHg+5gWEd+Xc+PdedXYyVC8/njV/eHhDHMgidSIN5Q2ToOtcxYqaDwWiFU1dS8ZjgFfIpPQ4bd+8K6br/rps28SGHW/Fni2zzR7WKqBVhmSz/lkPMi/PlyzCkIBHYzsMrevU715xJ0nzo2CpQi2jm28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264943; c=relaxed/simple;
	bh=6s6cTO6Yn6yN3vSCDT7z8LoUbh5iLlboNe1Uq+mkWZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jebn62QSMKc+Ym7VMSxRzDsdnxIXcJbrCeb/ND6HWowjUrAWQfGHlbMwXH1mKtUbcjKPqSnWMijdTC7RXX3e+Hv0VcbY/UVxCDSZDBQkr4PkmDCpyAQMTddKB++wZB2Thfb5fh4DXhWOhmvNxiLBELRi/lHgOsbOsD9oVaXjO1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PU/e26RE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PU/e26RE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC8F6C4AF0F;
	Tue,  1 Sep 2026 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788264942;
	bh=6s6cTO6Yn6yN3vSCDT7z8LoUbh5iLlboNe1Uq+mkWZw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PU/e26REpqh8GV+fS7q+cbJhyj4/T0khUKuNpb2uFxn8sLXsif/zn3BrM3AjEn5HT
	 ayiqziLHDWQNEld+6GzDjPMU4Itjxn+du76foygg+w/OKGtO9NruL4CDRjWAdhSOaq
	 6SjBcHVG4tCjqUpHiqRSA+D5bqVHpvzLpqh2BlpyS/9z9Ky49kiSAVN4ZOt2VDBVjy
	 pPpPHlVkijt6bjRP9z9SRbHhyQDYG7lGu66A1N3dBi+mZxgzG04bKwz41GUGlALtbp
	 KKPlEDPmGD8NOFbRLZXr2SHQh3sznXe/+feIc4+8d3KWbj1KZeQzFS8YeUxhvvm3e9
	 fOEYt87aRONHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA313C624D2;
	Tue,  1 Sep 2026 12:15:42 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 01 Sep 2026 20:15:20 +0800
Subject: [PATCH v7 05/11] ARM: dts: aspeed: anacapa: Add eeprom device node
 for NFC adaptor board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-anacapa-devlop-phase-devicetree-v7-5-0bd71d2e0105@gmail.com>
References: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
In-Reply-To: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Carl Lee <carl.lee@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788264931; l=833;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=26fq2T2FsHohRgFb+8YUKBwoq82KVZ3EC93yHvrPJAI=;
 b=yNkBMl4M29kDge5+o3YGAzEKsBkwqW5oKMeb0jK6wxscwfH9GRuDHhX8Bvo639x3wzQYaVPWP
 rKj12fgNdetCGs8iuZfHoK4PtEvj19Qi4YgKS+G2/HDjj+fwf9fPqgc
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Carl Lee <carl.lee@amd.com>

Add eeprom device node for NFC adaptor board FRU.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
index 77126418a702..ed46a53aab24 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
@@ -17,6 +17,19 @@ eeprom@51 {
 	};
 };
 
+// MB
+&i2c13 {
+	i2c-mux@70 {
+		i2c@7 {
+			// NFC adaptor board FRU
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+		};
+	};
+};
+
 &sgpiom0 {
 	gpio-line-names =
 	/*in - out */

-- 
2.34.1


