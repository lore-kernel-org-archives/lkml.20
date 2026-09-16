Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDBE3783AD;
	Wed, 16 Sep 2026 00:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789519435; cv=none; b=k3HtYdjNXdiI9qE/JdbMXJR2R45IDCpbOgdaGh/e8kEwQGtn79lc/1hkIF7AEXvAUL5cMqsSfH2x1IieLEK15FPXUeufkZOWLGk6ZN8536gvRU2eKa+2xbGC7d124GusRCjoAeXRI+GCt8pUR9UqBudMEGcvvAHTO//hx0sEBJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789519435; c=relaxed/simple;
	bh=EVwN71wwvZW6YXvP8NIxr+H0Thmoc9M41v8NtPW4CyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RFdjp8n0fDSRIWqE05vqaOxDawkYHQeDc9dDvWe7oKY4RphpgAh1S3HmfobWk68k0Yr/qbAei5hFXIG7gryzPty2SO4PLTdOCso/9ycMNWsi3C0qUCcfU3KCihuQKYSCi/3uHhWrd2K5WygIbiu7sAy15Th1hShP87UXMzU/UOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Sep
 2026 08:38:02 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 16 Sep 2026 08:38:02 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 16 Sep 2026 08:38:03 +0800
Subject: [PATCH v4 3/3] MAINTAINERS: Add ASPEED USB3 PHY driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260916-upstream_usb3phy-v4-3-812e76037d01@aspeedtech.com>
References: <20260916-upstream_usb3phy-v4-0-812e76037d01@aspeedtech.com>
In-Reply-To: <20260916-upstream_usb3phy-v4-0-812e76037d01@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, Manivannan Sadhasivam <mani@kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
CC: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789519082; l=938;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=EVwN71wwvZW6YXvP8NIxr+H0Thmoc9M41v8NtPW4CyY=;
 b=I3XcJ6lH056nVbxCeR1AxRKmCn1q+W8ECtAu22NciH6/1pPCvrxWPWjdJ6i3B62pvkhUqtiIu
 2Jd9r6PTMcLAwQ7G9JEpgatjVC5/q8FgQOIuFqn7aXhlkmbx90MtML4
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

Add maintainer entry for ASPEED USB3 PHY driver.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe10d29b7657..01d893612abb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4096,6 +4096,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml
 F:	drivers/usb/gadget/udc/aspeed_udc.c
 
+ASPEED USB3 PHY DRIVER
+M:	Ryan Chen <ryan_chen@aspeedtech.com>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+L:	linux-phy@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/aspeed,ast2700-usb3-phy.yaml
+F:	drivers/phy/aspeed/phy-aspeed-usb3.c
+
 ASPEED VIDEO ENGINE DRIVER
 M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-media@vger.kernel.org

-- 
2.34.1

