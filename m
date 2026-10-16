Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B789C44AB6C;
	Fri, 16 Oct 2026 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173855; cv=none; b=AhFKxRFQxzNYovvWjz4D2ZOAOQYSMFaIiE5AeKpuhPsZmfE1VZnHM9f13XdDzg+ryLBE8RSida0/isuamqBmUTkKivgnzA6wV7wxNo2ZhekbjsWUi0a1ewJ/yKbsOsJXjxL5YMCdKb6QU3BjkzNI+n/ilf+h0gaU3HKZdWS2NTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173855; c=relaxed/simple;
	bh=gQxRqRAcTBBtn+Pdf8s6VE+j9Sm8M1pZxvO62yYs9oE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCiEQVjkq+GgPBhkjaf9+Azgwh9r21Tsr5dZ6XGCP6Hc7t+zxpEt0qJ1nUotLBwWi8fzQdJT8uXg6CG9UI41QA41TwJ5q3t6wpyNOkTpw+xuIli6nIKef1HbCaAhhuU4/AYIv3zmVcUZ9stCj2iXSkn2UZocJ+MTHI+lb7krhJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Wl9iBqhZ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Wl9iBqhZ"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D858B807C2;
	Fri, 16 Oct 2026 20:04:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTAlrEeAuC64; Fri, 16 Oct 2026 20:04:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792173846; bh=gQxRqRAcTBBtn+Pdf8s6VE+j9Sm8M1pZxvO62yYs9oE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wl9iBqhZITXp/tXTCIW9fRLHOcjidAy1NdHfh/akFgG9J2GxxJW9XROPR5saZZLAr
	 ILxj3CCIpExEC8Mr1c0q/nhCP9bm4b0OuNVAxMf5xb1w7Y0C6x0kHb8jAUh2k0qUFo
	 eBrXThKkzOyCwCZXa8WzcZveVLPqshfezj+oZ74Rdo6ig3LqnWsrgux8k58FNDJh0f
	 5LuZApVE5s4Yq//KkkstGuSaAg8w+tCgctS0CSxwkNUcztkcVaRw4YDQjdBqNVp6zM
	 6y4HTW+gnGUNB6uj9bPDBGgXUYb6Zj/Mijr0P/7CvCVLcLTRKb5tzwfNoD7Mc19KL0
	 QYeF1V9C3VPhw==
From: Rustam Adilov <adilov@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 6/6] phy: realtek: Make configs available for MACH_REALTEK_RTL
Date: Fri, 16 Oct 2026 23:03:14 +0500
Message-ID: <20261016180314.31760-7-adilov@disroot.org>
In-Reply-To: <20261016180314.31760-1-adilov@disroot.org>
References: <20261016180314.31760-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MACH_REALTEK_RTL to the if statement to make the config
options available for Realtek RTL SoCs as well.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/phy/realtek/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/realtek/Kconfig b/drivers/phy/realtek/Kconfig
index 75ac7e7c31ae..76f9215d8b94 100644
--- a/drivers/phy/realtek/Kconfig
+++ b/drivers/phy/realtek/Kconfig
@@ -3,7 +3,7 @@
 # Phy drivers for Realtek platforms
 #
 
-if ARCH_REALTEK || COMPILE_TEST
+if ARCH_REALTEK || MACH_REALTEK_RTL || COMPILE_TEST
 
 config PHY_RTK_RTD_USB2PHY
 	tristate "Realtek RTD USB2 PHY Transceiver Driver"
@@ -29,4 +29,4 @@ config PHY_RTK_RTD_USB3PHY
 	  DWC3 USB IP. This driver will do the PHY initialization
 	  of the parameters.
 
-endif # ARCH_REALTEK || COMPILE_TEST
+endif # ARCH_REALTEK || MACH_REALTEK_RTL || COMPILE_TEST
-- 
2.56.0

