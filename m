Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D3E4C9DE0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826716; cv=none; b=bg+GrGlh9eC5sDTNSqDwTZ82UUGni2AAnQaKhbR/wEXXla71lX+SmLV6UCVW+gxMHJEXfuJdeutliwuc/PF1ZuQ4DMayhjB7P1bu8yoV2dmkl9yTN6ozLb1Ad0VjLaj+RsCeUxmEU6qM7JiL/qS13xQszWboOXHOgtyltjS3s7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826716; c=relaxed/simple;
	bh=gQxRqRAcTBBtn+Pdf8s6VE+j9Sm8M1pZxvO62yYs9oE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRJQIxPOuhFO0SEzgQ64fk0xuFz2An/POhaknIruUyNQHW7z5tUTszPGX60i1R0Dg0r1Fe3ujvBKdsJF6+zYrdD0u51F8CiERaNx20L8t+jZnrayx8PHURTKfk5LwdrmmjyqO/LnNDSE6NPGbco4/r8Vk21XTHaHMf4cvOgzxmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=TTCj5AUC; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="TTCj5AUC"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E2F8D82BA8;
	Mon, 12 Oct 2026 19:38:33 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBFwzB_zyDAN; Mon, 12 Oct 2026 19:38:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791826713; bh=gQxRqRAcTBBtn+Pdf8s6VE+j9Sm8M1pZxvO62yYs9oE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TTCj5AUC7fRtR9PmHHfCRIK0SNV/1By2/LFFgNsprNDhAHlL/icMCKML2WrTK7G5z
	 sobDxLcXIvi+CVH+lze4BXwD+JRpuYuT4T9o5/9IYTHpkMCyQqC05qDkLRjZMAR7wG
	 hn091RHeXBBHWxYfmARUk2NmuCejuaOMrA9UpJmBcvoiStpQF1FqmtrZV1hU2d58Ma
	 nRGHHp6hFkZy8J6rronzHA0w6D4uXK3MyGkG+Zs6rDzBzL8yWJD3AgabSxl4FGaleE
	 BoygoXIZ66bwRl5Sr8OGYSPkj+NRCIQ2818XDlYCRyw9vTg+zB3FU/qrWRa3h0LbrT
	 TALMxEz/NW1rQ==
From: Rustam Adilov <adilov@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v8 6/6] phy: realtek: Make configs available for MACH_REALTEK_RTL
Date: Mon, 12 Oct 2026 22:37:39 +0500
Message-ID: <20261012173739.36377-7-adilov@disroot.org>
In-Reply-To: <20261012173739.36377-1-adilov@disroot.org>
References: <20261012173739.36377-1-adilov@disroot.org>
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

