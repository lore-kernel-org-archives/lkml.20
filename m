Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB45547066;
	Sun, 20 Sep 2026 23:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.37.86.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789945237; cv=none; b=nBFEweoENFgdol++KsT0iU2tEIwtH5sLq8/LNUX7XwMDSNDZ7vC13x9yVZ83xszQZL+ci8b2hYngPFpXaRHSF44yCWpnTc075haFeZVqnqggyFwnL2u35TDdKy0XMku30uiVD/epRx9EPzqmmKkicLHJ31NltzCEarevALBZNFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789945237; c=relaxed/simple;
	bh=OmenY/1+FfqbXgYaxclj6yxlJKwIotAL6Ortn1Osm0I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NVlNNV1/U32ezYIdbIw3KBBPD91fxomIGseAa8rRP9eNfaHRQ5mm0nncIaSoBEeY+ITNZhJvv6L3kur+vm3uiOauWR90FInp5OA8S4+k/uhtWcMsZRRFSvy1Tp/EZJ/p1XGFc7WciJyuSWuR+msYKz3UGz7IQflimB0v8Svmv9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b=RZRg2UyU; arc=none smtp.client-ip=173.37.86.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b="RZRg2UyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1543; q=dns/txt;
  s=iport01; t=1789945235; x=1791154835;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PeCJ/I1PdEw1RjxBJnX7Wbykw70ob0SuJBXockTrBMU=;
  b=RZRg2UyUaDSqidcNDG3B8Pc2uYEGe7ktffPImmnJkhxPQoF2ER7A5Vfr
   l3oekr1j5xVAIVd1QCRt+EMeu19I5kFwonO/7ZSJh2LGNIbUl4J46VT16
   Hg1T+m1feK+WJIzyY8E1+eZgslhdWIJS6rhsXIRr7z199QFl8MGi0Wkij
   wUcu9d+Xl+1vU+NashfwwvzSKcGMOFSCUmhVUgr29MVHRsayMiRp+gnvP
   wjwrmArLVQh8mYEsRFjt12Mql8Ve59k2mcIs/iNkw+QA8rF06zZYjLhR7
   cdwAVstlFtvMvBSlR3zvUm7GRLpjDpSWBsT7bTpEGBkuf19BiTr/vG/H4
   g==;
X-CSE-ConnectionGUID: rRjhFsH3RC2KHa3h04LoeQ==
X-CSE-MsgGUID: 2hz6x2SsTkOn6SByqFAQ2g==
X-IPAS-Result: =?us-ascii?q?A0A/AgAWZLBq/5H/Ja1aHgEBCxIMggULgleBVkJJtGiBf?=
 =?us-ascii?q?gwDAQEBD1EEAQGFBY4JAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZckBU2AUaBDDISgwKCOwM3AgHEBQJNgiyBAd5IgWgBCxQBL4EJj?=
 =?us-ascii?q?WF2hHwnFQaBSUSBFYJ6b4EFgRqCcYV4BIMulEVIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?yoLEhIYFTI8Mh2BIz4XgQcbBgWBHYEnghojGTZ6gQlegSspYAEQF4EHgggCg?=
 =?us-ascii?q?lSCAQIBSUMOB0VTCSdBChJHKSIIEgkBExowC34YDUgRLDcVGQQ+bgePSh+CO?=
 =?us-ascii?q?yCBDgGCaKVloQ+EKKFcGjOqbAGZCCOkN4RpgWg8gVlwFYMiUxkPjjnQJCQ1O?=
 =?us-ascii?q?QUBBwIHDwKBc5F+AQE?=
IronPort-Data: A9a23:OifekKymAg/NOQEBVaJ6t+crxyrEfRIJ4+MujC+fZmUNrF6WrkVTx
 2sdXT+POf2JZDH2c913YYy0pBwDvcDSmtQ3HQNv+1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWYlaDpMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFsMP4024cYsO0oU1
 twRczBVMjSEitvjldpXSsE07igiBNPgMIVavjRryivUSK52B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPnWjOX9PYH46tPyzjXn2fjZbgFmUvqEwpWPUyWSd1ZCwaYWJJYHSHJ89ckCw/
 GLUoXSjOQomN/uZlwGv42uCr9aVknauMG4VPPjinhJwu3WZ3kQaDBwbUwv9rfTRolW1W9tSI
 FcS0iUrve40+VDDZsX6WQz+pGOPvTYdXcZdF6sx7wTl4q7V5RuJQ2UIRzVpdtMrrok1SCYs2
 1vPmMnmbRRrsbuIWTee+62SoDeaJycYNykBaDUCQA9D5MPsyLzflTrVRdplVarwhdrvFHSok
 3aBrTM1gPMYistjO7iHwG0rSgmE/vDhJjPZLC2ONo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:mGZlO6EK3P397ZMBpLqE3seALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPId+rJBLK8gcaVbSC09QYLcT1X
X-Talos-CUID: =?us-ascii?q?9a23=3ACwSSpGvRpdX9tKfIC1yZqJ2b6Is/SH/d4mzweHW?=
 =?us-ascii?q?TU0VJQeaVEQO0/65dxp8=3D?=
X-Talos-MUID: 9a23:ete/AQrcBEuU7p2Tju4ez2tiJpl4uZ+1NEMql8s9kdidGwVJYTjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,112,1787011200"; 
   d="scan'208";a="517475012"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Sep 2026 22:59:26 +0000
Received: from sjc-ads-3426.cisco.com (sjc-ads-3426.cisco.com [171.68.249.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 05F7218000455;
	Sun, 20 Sep 2026 22:59:26 +0000 (GMT)
Received: by sjc-ads-3426.cisco.com (Postfix, from userid 292853)
	id 9F1BACC1282; Sun, 20 Sep 2026 15:59:25 -0700 (PDT)
From: Stefan M Schaeckeler <sschaeck@cisco.com>
To: bp@alien8.de,
	tony.luck@intel.com
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	schaecsn@gmx.net,
	Stefan M Schaeckeler <sschaeck@cisco.com>
Subject: [PATCH] MAINTAINERS: Step down as Aspeed AST2500 EDAC driver maintainer
Date: Sun, 20 Sep 2026 15:58:46 -0700
Message-Id: <20260920225846.4039017-1-sschaeck@cisco.com>
X-Mailer: git-send-email 2.35.6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3426.cisco.com [171.68.249.124];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.124, sjc-ads-3426.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com

I am stepping down as a maintainer for drivers/edac/aspeed_edac.c and
Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml

Move my entry from the MAINTAINERS file to CREDITS to reflect my past
contributions.

Signed-off-by: Stefan M Schaeckeler <sschaeck@cisco.com>
---
 CREDITS     | 8 ++++++++
 MAINTAINERS | 6 ------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/CREDITS b/CREDITS
index a0bd941ca5dd..f45a7477902b 100644
--- a/CREDITS
+++ b/CREDITS
@@ -3686,6 +3686,14 @@ D: I2O kernel layer (config, block, core, pci, net). I2O disk support for LILO
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
diff --git a/MAINTAINERS b/MAINTAINERS
index c77d63d9dfb8..75bbccb99793 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9360,12 +9360,6 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-sdram-controller.yaml
 F:	drivers/edac/armada_xp_*
 
-EDAC-AST2500
-M:	Stefan Schaeckeler <sschaeck@cisco.com>
-S:	Supported
-F:	Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
-F:	drivers/edac/aspeed_edac.c
-
 EDAC-BLUEFIELD
 M:	Shravan Kumar Ramani <shravankr@nvidia.com>
 M:	David Thompson <davthompson@nvidia.com>
-- 
2.35.6

