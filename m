Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362693F5BE4;
	Wed,  7 Oct 2026 06:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791353649; cv=none; b=iWSXO8Ke8QlhGu7G8yhOJLM1fz+DFWhnHYiJIlL+44UTSDYdYATrirr98Y7Iv62RhRV4XD0mqisVcnoNXo55v1nCa4tDs/HOjwEH5FZXHcFozMIRWe2prFSdxGGJzDpgaMDvUviZQAFZRw1Qyj8tG60vXj7GwpdvlrzRMo6PDsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791353649; c=relaxed/simple;
	bh=LYFEmXl4HyqBF1GE7XwgGlf36UgST4KWwZLQ7JCh+oI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NJXvAdbYtSDqyl8awcdfLdHqXutFbv9v/aC9Io9X7z3u0UbSPyCoLd5p1BACUza/Hmb4mmBWvrNZwF154wesCPfT2+ftC8EB8bg/q8jAOq7v4RpXBHS+Ex5cjH3ltgShlJz54KTzSEv6hqxLfmut3FSPhxH1pLIj89bpYH0iccw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 7 Oct
 2026 14:13:20 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 7 Oct 2026 14:13:20 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 7 Oct 2026 14:13:26 +0800
Subject: [PATCH v5 9/9] MAINTAINERS: Step down as Aspeed AST2500 EDAC
 driver maintainer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261007-edac-v5-9-5c31fc5df4cf@aspeedtech.com>
References: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
In-Reply-To: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791353599; l=2899;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=bDs78TovOiEla5SjPmAGjuluwjR862LQa8Dvh1qFJ6U=;
 b=iJI5S86hmwv4qvKvUcIM3lFjKMoRFbkmbTC2kFDjUIulT0PBF8xF1sV49SVSv08vAZ9PmmVP+
 5Nm+nCS9sPIAUF/ABG/Z5sbzekLvbhwQ9gaP8Kk7CIUAeIc4goTPUz9
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
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Link: https://lore.kernel.org/r/20260920225846.4039017-1-sschaeck@cisco.com

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
index 091412875a66..28e5b274bc28 100644
--- a/CREDITS
+++ b/CREDITS
@@ -3655,6 +3655,14 @@ D: I2O kernel layer (config, block, core, pci, net). I2O disk support for LILO
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
index d413dac5c8b3..2001466fd6da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9283,7 +9283,7 @@ F:	Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-sdram-cont
 F:	drivers/edac/armada_xp_*
 
 EDAC-AST2500
-M:	Stefan Schaeckeler <sschaeck@cisco.com>
+R:	Ryan Chen <ryan_chen@aspeedtech.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
 F:	drivers/edac/aspeed_edac.c

-- 
2.34.1

