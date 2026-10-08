Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B1E3644CF;
	Thu,  8 Oct 2026 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458918; cv=none; b=XEEUqE0LsrgIHupK4lXl1sBet+UnEXt+VGuk0Xvva4sSw1njo4a9O3EFsixezuCjS5f7x7rG/84uALtbl3lBps617/UWNA+iEhKmRD3ysta8+7iJaQxPrXVD/BUV85iDlIahjTTnQpXi9guW65YFo9ORv2YGE6+DjhodCkErlJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458918; c=relaxed/simple;
	bh=iu4Zl2XLhk1c2sygQvsZ6Yp6z//xHF44lf3a3D+enh0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=W37pxdPorxpruhY9FPXXdqRdMB6LbpfB0X4jyXqXDZnnr4QkD/eVp9NfUS35H3+LdT9sP65Zen25ht+8JDwlC7ykQpJxJo4aGPoLY0jTFQsZ5Nh+Z3i5P2yo1zguT4yti8YA/HDYh2P9mCjKXw3fmBLdaUIgncTNP+3FGzxpQCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 8 Oct
 2026 19:28:28 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 8 Oct 2026 19:28:28 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Subject: [PATCH 0/3] phy: aspeed: Add ASPEED PCIe PHY support
Date: Thu, 8 Oct 2026 19:28:18 +0800
Message-ID: <20261008-aspeed_pcie_phy-v1-0-96764937aef0@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJ+x2oC/x3MSwqAIBRG4a3EHSf4CIm2EiGmf3UnJQpRRHtPG
 n6Dcx4qyIxCQ/NQxsmFj71CtQ2Fze8rBMdq0lJbaY0UviQguhQYLm23MJ2yapamtwZUq5Sx8PU
 fx+l9P07DBk1hAAAA
X-Change-ID: 20260630-aspeed_pcie_phy-34161b03863e
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Manivannan Sadhasivam
	<mani@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791458908; l=1483;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=iu4Zl2XLhk1c2sygQvsZ6Yp6z//xHF44lf3a3D+enh0=;
 b=WEva4gZIureOwV8wbKrsmtAfd2JtufHc6mn7kCstj8/nqIh8PqvVumxtDKzG2pskx3VXMDz6L
 iHViDNsxYxrADPJ3jP7f1HmbExdLIosqCQl8al7SFuRz5mUjoDKKNM/
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=

Add the ASPEED PCIe PHY binding and driver for AST2600 and AST2700
SoCs. The PHY provides the physical layer used by the PCIe controller
when it is configured to run in root complex mode.

The driver registers an ASPEED PCIe PHY provider through the generic PHY
framework and programs the SoC-specific PEHR registers from set_mode().
For AST2600 this selects the root complex port type. For AST2700 this
also configures the posted/completion credit values, local scaling,
device type, internal reset selection, and downstream port setting
needed by the controller.

This series also adds the devicetree binding for the PHY provider and a
MAINTAINERS entry for the ASPEED PCIe PHY driver.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
Jacky Chou (3):
      dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
      phy: aspeed: Add ASPEED PCIe PHY driver
      MAINTAINERS: Add ASPEED PCIe PHY driver

 .../bindings/phy/aspeed,ast2600-pcie-phy.yaml      |  49 +++++
 MAINTAINERS                                        |   8 +
 drivers/phy/aspeed/Kconfig                         |  12 +-
 drivers/phy/aspeed/Makefile                        |   1 +
 drivers/phy/aspeed/phy-aspeed-pcie.c               | 237 +++++++++++++++++++++
 5 files changed, 306 insertions(+), 1 deletion(-)
---
base-commit: ea01f446f0682a5e7bd7a275889a890b7e0c6e02
change-id: 20260630-aspeed_pcie_phy-34161b03863e

Best regards,
-- 
Jacky Chou <jacky_chou@aspeedtech.com>

