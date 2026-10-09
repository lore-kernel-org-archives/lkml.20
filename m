Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5052B3D9DD4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791525640; cv=none; b=j0UO3xVDQb7N3C4udHTyuFWZp0X7DOBOxac0qhDwlegTAH+BH0/m34Y4GPtV0OJb06ZiQ6286UkW5X/bXACBNpwJqElnifCLlOOcXhCdRTB5DmNttxXc9yEmpdPLTeGEk0NyT5PD8p8gPyUOL3L4i7CuiKZ9a1H19e9gmjxL60U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791525640; c=relaxed/simple;
	bh=8gjORCUNGj6RMlZVZV30Q5fAOsiQ7M7FBCqKfr5cIB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h04LeA6UHDLB8ieH7O72RcnEzUovTelI5UVr4qhpZxSeVaAUlugc7hMTgTFukWpXW2v/wkX8huRqfTQKP5R+KIv443csVv/zU6Qc/3M7gfbe7DsLl1vjFPf2v/mDD+MQLzhT441NaBHJJKtS+K05xoBsTcvOBAHz5NUvyHOKM1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuibOJiZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuibOJiZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D181F000FF;
	Fri,  9 Oct 2026 06:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791525638;
	bh=Uetyr08EbPxb1/vTxBz/oHKvTpwSsGRtAmxHx+DBRGk=;
	h=From:To:Cc:Subject:Date;
	b=fuibOJiZponbSA6UcUYzC37umoqq9FWCLbdQ9pKce5+bgxjG0z1mKlHwaCoCdLeRc
	 MQsxZMxHhJeiAhlhPawV1bc3aY5gaG5ZRv+doc/ru0MN3pegiYaj1mGyuKiygCkRGd
	 YEo6GMY7ohJObQOUlju3yteSWUrCKNCH9wxBZfmPWGUMbaQ6H/ROt4Ea6DQBCaYjMO
	 vCO1v6C5xnp0n5vw9Ur7t+ST2PSUDWS9G9v7FWMP6zmGOqrcV1nOEMZs9zCiBRDABH
	 FF77WnQ9MZLDVTFKgq90oRED6NvBJUw3CVeocPZPght8Fc/qB9aC/rVWGFS5kXOYQ3
	 EI2keko7HnIeg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH] MAINTAINERS: remove {sbranden,rjui}@broadcom.com
Date: Fri,  9 Oct 2026 08:00:35 +0200
Message-ID: <20261009060035.544789-1-jirislaby@kernel.org>
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

Anyone knows if they care about the entries/what's their new e-mail
address?

Ccing scott.branden@broadcom.com in a hope that one works. If not, v2
will follow to remove that too.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Scott Branden <scott.branden@broadcom.com>
---
 MAINTAINERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ff3bfd42d3f3..d3b4271ca722 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5240,8 +5240,6 @@ F:	drivers/iommu/generic_pt/fmt/*bcm2712*
 
 BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITECTURE
 M:	Florian Fainelli <florian.fainelli@broadcom.com>
-M:	Ray Jui <rjui@broadcom.com>
-M:	Scott Branden <sbranden@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 S:	Maintained
 T:	git https://github.com/broadcom/mach-bcm
@@ -5538,8 +5536,6 @@ F:	drivers/net/mdio/mdio-bcm-unimac.c
 F:	include/linux/platform_data/mdio-bcm-unimac.h
 
 BROADCOM IPROC ARM ARCHITECTURE
-M:	Ray Jui <rjui@broadcom.com>
-M:	Scott Branden <sbranden@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -5576,7 +5572,6 @@ F:	drivers/net/ethernet/broadcom/bgmac*
 F:	drivers/net/ethernet/broadcom/unimac.h
 
 BROADCOM KONA GPIO DRIVER
-M:	Ray Jui <rjui@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpio/brcm,kona-gpio.yaml
-- 
2.56.0

