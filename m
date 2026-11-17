Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907612;
	b=4LupleApgUjixvNxs2hbqJaPZbpXvUghMt1GDOmNzcoS9lpRuCOkEwwofJgJmJDqT3km
	 3/L1BVcgYKrD7FbD+DRLnd2dhkcZzZtQ9B7/v7F+jxxcs0Ze9OEo4YzJcTV56w8qGMIhi
	 yco3j9mbw+G4W0HCwjA8/Zjyx5QAOFgA0WW2pgIylnH3cqqxNDOzlBNr9Jc/C/3QDRK7a
	 CVCXkNgzx6t1vZHZT3frLh9QgvHy5me/tofWPZIk6oxfOQ/VwLK1yWHua6w8M5gTIHJM8
	 JRRugR6sF71f3cLYjrqZL0+PiQk6e3Bpm4xOiDiA0RO1rmeMdhy2JTVKb3zPBcut14A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907612;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tCNcpdYzS1h9z75uWV4JWMmPtilPLs2wyFyWlzfH1ro=;
	b=aNQVMJbKSQQmoedQYK3FFhBiUenl9gDkjhH2lfCfrXMEgev/3B4agM5lIRXx2wI81G3E
	 o2Na46cjXP4AmUiCIAjyBztMH4eNiLk0x3LnXwXs9R2pmnRIRAlbYd2GU4g1DWKPRMAxa
	 Zqa6+m22/tfkyQVOwAh730a35Rds4/rujW5Z9BEeOUbd0reGPJ5Fytqoe6JDmttWMMWMK
	 yGAcI+qxJAw1E7BRFVQOQ0He1Oan3rpvLfNzLVlXrGjLaVaAOkcmodJ9UIYMV5F7dzB+b
	 5Jjy7CV32/pdDuwA6ImaqTILhu/Kr997wUAEFIoWDd0jzlHgkSje2JIjet+ai8DeHzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C77606A889;
	Tue, 17 Nov 2026 09:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1C77606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 17 Nov
 2026 17:26:40 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 17 Nov 2026 17:26:40 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Tue, 17 Nov 2026 17:26:41 +0800
Subject: [PATCH v6 4/4] MAINTAINERS: Step down as Aspeed AST2500 EDAC
 driver maintainer
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
Message-ID: <20261117-edac-v6-4-a2a747b95c3f@aspeedtech.com>
References: <20261117-edac-v6-0-a2a747b95c3f@aspeedtech.com>
In-Reply-To: <20261117-edac-v6-0-a2a747b95c3f@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794907599; l=2944;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=G3PC/QkgRIYDVHFsxEsU/LG3WHjKg5hH8g0SdTPjZw4=;
 b=KMCJnXPhve+kYZ2DEpKVTeP88yz8bHQQ2oNWm+Tsdn2iOFU7AHBCeaG+NRY5VT99nP4Jva8/K
 bxwD9zb/AsZDdNMWMe7KrRJoH0cDAqGE3FCBerM4Iikv3O5mpa4k5Bv
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

From: Stefan M Schaeckeler <sschaeck@cisco.com>

I am stepping down as a maintainer for drivers/edac/aspeed_edac.c and
Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml

Move my entry from the MAINTAINERS file to CREDITS to reflect my past
contributions.

[ ryan: keep the EDAC-AST2500 entry and list myself as its reviewer
  rather than removing it, and take over the binding's maintainers
  field ]

Signed-off-by: Stefan M Schaeckeler <sschaeck@cisco.com>
Link: https://lore.kernel.org/r/20260920225846.4039017-1-sschaeck@cisco.com
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v5:
- Also hand over the maintainers field inside the binding, which
  get_maintainer.pl reads directly for .yaml files.

Changes in v4:
- Merge Stefan's step-down patch into this one, keeping the MAINTAINERS
  entry alive with a reviewer instead of removing it.

Changes in v3:
- New patch.
---
 CREDITS                                                           | 8 ++++++++
 .../devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml       | 2 +-
 MAINTAINERS                                                       | 2 +-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index c6c7b173b064..855062c309fe 100644
--- a/CREDITS
+++ b/CREDITS
@@ -3696,6 +3696,14 @@ D: I2O kernel layer (config, block, core, pci, net). I2O disk support for LILO
 D: XScale (IOP, IXP) porting and other random ARM bits
 S: Portland, OR
 
+N: Stefan Schaeckeler
+E: sschaeck@cisco.com
+E: schaecsn@gmx.net
+D: Author and initial maintainer of the Aspeed AST2500 EDAC driver
+S: 2253 Anna Dr.
+S: Santa Clara, CA 95050
+S: USA
+
 N: Eric Schenk
 E: Eric.Schenk@dna.lth.se
 D: Random kernel debugging.
diff --git a/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml b/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
index 685b6815f293..971d4c862fe7 100644
--- a/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
+++ b/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Aspeed BMC SoC SDRAM EDAC controller
 
 maintainers:
-  - Stefan Schaeckeler <sschaeck@cisco.com>
+  - Ryan Chen <ryan_chen@aspeedtech.com>
 
 description: >
   The Aspeed BMC SoCs support DDR memory with and without ECC (error
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..323b2f90536d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9607,7 +9607,7 @@ F:	Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-sdram-cont
 F:	drivers/edac/armada_xp_*
 
 EDAC-AST2500
-M:	Stefan Schaeckeler <sschaeck@cisco.com>
+R:	Ryan Chen <ryan_chen@aspeedtech.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
 F:	drivers/edac/aspeed_edac.c

-- 
2.34.1

