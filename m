Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3D23E95AE;
	Wed, 16 Sep 2026 05:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789536669; cv=none; b=N2MPGMa3RDK/Wl7MndtXq9D34G/59il6aiQXe8e/JCnJesxk1A8dOphX6py4AZGcUVxA48DW2O3iXJg8kzTdi2EabftIG6Kd4zIc4VjS0BUUEsgsdDpzPNbgM4af6Jl1cG18bsGRRDpAkS7USAuyCHUIXwXxa+NllGm4zVOCZVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789536669; c=relaxed/simple;
	bh=w8T0hgmEG8Qfrn667ljaWu8sAzWzj8Ca/Lo8h8/IWDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cah8XKD68xsNwQ0AQ9RAjf6EhccRbt8368Hp/Mu2kwzEQlwuZd95v2AAJV0yl9+GKlt0FOLAYD9BxLzibWPeCldQQuo/tCHvWjpaRR9bDJfsIKxfSEHTBuwRb83708zr4BhgHBOFrpM8kM7i+Rmyh3Y1jzZ02cPws11GGmOfwDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Sep
 2026 13:30:40 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 16 Sep 2026 13:30:40 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 16 Sep 2026 13:30:46 +0800
Subject: [PATCH v3 9/9] MAINTAINERS: Add a reviewer for the Aspeed EDAC
 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260916-edac-v3-9-23e9ed2fbdf9@aspeedtech.com>
References: <20260916-edac-v3-0-23e9ed2fbdf9@aspeedtech.com>
In-Reply-To: <20260916-edac-v3-0-23e9ed2fbdf9@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789536639; l=629;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=w8T0hgmEG8Qfrn667ljaWu8sAzWzj8Ca/Lo8h8/IWDA=;
 b=ldCLmciBR1ODuMPQ0Ij0lrTVtU6qNgoqih4XP2N1MgHt2Z5RuqAs50ybQ1LoKs48sOV2BCf4c
 rYcw5j0WwE7D0tQx8p8goZeRFFmIv7IA4rX6nYccL7snKNwjjMAmZCI
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

Add myself as a reviewer to be copied on changes to the driver.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

---
Changes in v3:
- New patch.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d413dac5c8b3..5bd0109f0f1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9284,6 +9284,7 @@ F:	drivers/edac/armada_xp_*
 
 EDAC-AST2500
 M:	Stefan Schaeckeler <sschaeck@cisco.com>
+R:	Ryan Chen <ryan_chen@aspeedtech.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
 F:	drivers/edac/aspeed_edac.c

-- 
2.34.1

