Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497594;
	b=KGOgREqaZHHLLFV+a/vA3c88yxGZgypK+nD2R+Ca/+bpYzErXyqaTYkaPzkQdRQV4pAh
	 EAyFQhe1npQeB5C9XummKr0YAclX3o9EDISwSdZyB9f7eIaQGM8J9FHohmu1mi9I+bfDp
	 Q+MdJOGfDaKSbanTauMCbAZxwJl8OaN6RZKEmgz3lyTEH2G9O7OxS6TBHkEMNFXLPIFRs
	 +MURQxhxsu2YgQAalkKFGFmNJF/vxuQBI3C7MESbN9QkYUJcekmjJEo3vsvIKYkNwRKxg
	 uoMGdVEybsElrIUM63IogjvmOpPixi5atnYSu7ETKjuflvllEjOBiJ3aJ6/aAcAB7WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497594;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=i4oGaJQV3XJqsm/hWoRJNMCRGKUS59OxQJLz4fnNv00=;
	b=ALV+gK8fwCtMA3oxMDHJsYTwwxPdKU0u1JugDxOyMvXQ77VG7ZV5izXoTLdBvVo5RR12
	 8rJk+ZhoussNORqgK/D1CNNY37UH+nb1ps/26kR4wH+o0HOb2ZYp8o4rs6tICygfJXUu0
	 LyTHOhwO5BqTZJx/j03MOM5CAtmYe3hMIbPnyK2YlCRzBnHB2qqk+ldtqAmvhWETYql2U
	 fbgn3f3xPdBkUmhV+pB+rcaf8Je5TyThoTUthrCZWvQZ3Elhww5CvTM4sik7E386jXm3k
	 M4GGuaPLDEBvqwdysGYCVm3jhsmaIndq+9KCrN3Eb0Z4O29HG34Zf+LeRm05p0fsl1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7188C60A2604;
	Tue, 20 Oct 2026 11:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7188C60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Oct
 2026 19:59:50 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Oct 2026 19:59:50 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Tue, 20 Oct 2026 19:59:51 +0800
Subject: [PATCH v10 3/3] MAINTAINERS: Add ASPEED PCIe PHY driver
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261020-upstream_pcie_rc-v10-3-fba209af8656@aspeedtech.com>
References: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
In-Reply-To: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792497590; l=878;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=YHD/I/0JKp9KeOT+Xzp15SjhKbuwAUqqCo+GFOfkoDI=;
 b=LzzTR9aoi8dc341tveSjtXD/pvQogGJy+/xDpgGPzrm+LJ1UXgPOd0bY3szbF2jH3Bvp6u18k
 HiEUQoOGcekBJ0o8IYprf1oaxzK/jmVjGiEBEb3xnnZlRjjgxS1dFcP
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=

Add maintainer entry for ASPEED PCIe PHY driver.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0570815ee980..33a0336110a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4044,6 +4044,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/aspeed,*
 F:	drivers/crypto/aspeed/
 
+ASPEED PCIE PHY DRIVER
+M:	Jacky Chou <jacky_chou@aspeedtech.com>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+L:	linux-phy@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
+F:	drivers/phy/aspeed/phy-aspeed-pcie.c
+
 ASPEED PECI CONTROLLER
 M:	Iwona Winiarska <iwona.winiarska@intel.com>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)

-- 
2.34.1

