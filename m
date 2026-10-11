Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43868405C27
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791708780; cv=none; b=mQ/OPrXZRYIlApYzE2u0mcLtGraAVJJy0++zWE5DiSQ0H3HmtUEVPTU9fMC0sy7mM7dF6BZTB/exV4U3OP4Bxl2KNPMx5nBOfuy+IWXedMBRPmi+AlhWXkh/SMoJDy/kWf3egBKuOpiyjlLpPWEbCHG92qA6lf76P4NUYukHdX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791708780; c=relaxed/simple;
	bh=8pe1ToHwVx2XERNp1EpkO5XosfQTBftDW7wP3HK90vU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3bH46S/B7dDqMv0dNxJWOLAqDp8MQwiUS0OnkX0Zl6IxCqSskReAH7oVHfHn6RWivCKdsbV9BZcfz7DA4ALY+ltaMYILcap+d+wKBHSLhYj6pQDZNOVxrSw8gqzkcsuxmp6aurOaE/8ZuU0e6A6GgeaixvNxjdSkXfLAdtjiEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmqFqvXB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmqFqvXB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7C61F0089B;
	Sun, 11 Oct 2026 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791708778;
	bh=LD0h3iIgO7PZyfjdVnhwEIhyBqfxijYlB+A8FPxw+aY=;
	h=From:To:Cc:Subject:Date;
	b=bmqFqvXBoNLyzZg0SuKBE9/swCDpTS6y+TEBBphqp4Qsb2g6klh4nfhpPPxwrihzu
	 myaRirrO1iNFMeha0yjfpSv5qjKrMhmeoG6Qb+fmRnzAZnvJvSPIZTe3ylwKFqVmQ4
	 WigBBg07Iq+oiqPn4fqMgP8+SlqFmIeVzayr7oG8otXTXXHDgtm6ZZwqhtD/RHy3Xz
	 mwzQVh0Cd3xmPnFPftCXGOBzlHx3dVjdMvPhdJoWx1YoFyz2l9eT9yzjv1ZU9pnzaJ
	 CPjw6CXEfXpwhJCKqeRz6F5pgAm5zGI8+wScQ4HRNCdvHzNZoOOG1JkIQl8gmbdfCD
	 ch4//yg9PKkOA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>,
	Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH v2] MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com
Date: Sun, 11 Oct 2026 10:52:54 +0200
Message-ID: <20261011085254.603765-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both are bouncing:
  Final-Recipient: rfc822; rjui@broadcom.com
  Action: failed
  Status: 5.1.3
  Diagnostic-Code: smtp; The email account that you tried to reach does
    not exist. Please try double-checking the recipient's email address
    for typos or unnecessary spaces.

According to Florian, it should be first.lastname@broadcom.com.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Link: https://lore.kernel.org/all/688738af-100b-48af-bee1-4bcbe4422f94@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Scott Branden <scott.branden@broadcom.com>
Cc: Ray Jui <ray.jui@broadcom.com>
---
[v2] fix instead of remove
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ff3bfd42d3f3..752775f2371e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5240,8 +5240,8 @@ F:	drivers/iommu/generic_pt/fmt/*bcm2712*
 
 BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITECTURE
 M:	Florian Fainelli <florian.fainelli@broadcom.com>
-M:	Ray Jui <rjui@broadcom.com>
-M:	Scott Branden <sbranden@broadcom.com>
+M:	Ray Jui <ray.jui@broadcom.com>
+M:	Scott Branden <scott.branden@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 S:	Maintained
 T:	git https://github.com/broadcom/mach-bcm
@@ -5538,8 +5538,8 @@ F:	drivers/net/mdio/mdio-bcm-unimac.c
 F:	include/linux/platform_data/mdio-bcm-unimac.h
 
 BROADCOM IPROC ARM ARCHITECTURE
-M:	Ray Jui <rjui@broadcom.com>
-M:	Scott Branden <sbranden@broadcom.com>
+M:	Ray Jui <ray.jui@broadcom.com>
+M:	Scott Branden <scott.branden@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -5576,7 +5576,7 @@ F:	drivers/net/ethernet/broadcom/bgmac*
 F:	drivers/net/ethernet/broadcom/unimac.h
 
 BROADCOM KONA GPIO DRIVER
-M:	Ray Jui <rjui@broadcom.com>
+M:	Ray Jui <ray.jui@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpio/brcm,kona-gpio.yaml
-- 
2.56.0

