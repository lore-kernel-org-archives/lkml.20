Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6473B3EFFA6;
	Thu, 24 Sep 2026 10:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244838; cv=none; b=gE0in60PBBNiOIonuV2jjzppWnI2eEjdgkMkoAx/C2I7dnLvIKwlGFbVmY4eOfc0EwWPLlS5G/OJFxW/GLf/DryxcFSDZhI7urcwsf33OM3xEx1HZdGsbXDn2sXJ4mVf3lmi0LxXMVQFPlFV55benpPzgKNZDjAOHvJsZTy/7X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244838; c=relaxed/simple;
	bh=bD2T2T6JRhV5FDHEZsRf2iCj6z4GFCkBQKBGgjONr5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pllVL2wmniXqkBhKvkfUWQ1KPZE9ZBegLjsX4oBrQTTyrFU/4ixOVeYw5QwuPA/TA7mFZpx+wXd6xxeJsAxmrWYu3rNiBW6GjCOgcQv5bSsNCzAzZ72QNVOxcQPFz1NhOtsjXZp7C6pg50wwsBd9AAFNSiuvgNIHzV26eyP/jjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkBYsCjZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkBYsCjZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D5C1F000FF;
	Thu, 24 Sep 2026 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790244828;
	bh=siGN9S98cmnCTctOmyBaIkTesjbPVm0z1aN3AxPvTiY=;
	h=From:To:Cc:Subject:Date;
	b=mkBYsCjZjlpGZ62/fqonnoEJMAqe99hqWMziY6y0JkrHljQ7vbq/3ohDov9pHQp+U
	 8MNDse1Bbgf63dNUbVL2O6dsQBGXi3du8DA3ToX2wAsGs8f7+QWDY2mi8jYcMr4n23
	 E2XvorQHod20GoliLIn0gFtumUpwtUn9XntqXIRqQ8Vf8GUwkrOT71Fk0T0VG2/2wG
	 9Woi0QvNQSRovZ9+v/cg83n5FC6UG1CJ86U+iw38p9Ci6fslpJk0n03Y5RdXF7mZX+
	 jzl4GKlr21jsslbHqGh2PN0WsnK62CBS53YBf+hesjE8PpPWgdwKz+ibxTNhPFIv2f
	 0pqvheHXp6h6g==
From: kaloz@kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linusw@kernel.org,
	arnd@arndb.de,
	soc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: update my email address
Date: Thu, 24 Sep 2026 12:12:45 +0200
Message-ID: <20260924101245.5011-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Imre Kaloz <kaloz@kernel.org>

Switch my contact address to kaloz@kernel.org and update .mailmap.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 11750e582d09..88fc3f466aba 100644
--- a/.mailmap
+++ b/.mailmap
@@ -484,6 +484,7 @@ Juha Yrjola <juha.yrjola@nokia.com>
 Juha Yrjola <juha.yrjola@solidboot.com>
 Julien Thierry <julien.thierry.kdev@gmail.com> <julien.thierry@arm.com>
 Justin Iurman <justin.iurman@gmail.com> <justin.iurman@uliege.be>
+Imre Kaloz <kaloz@kernel.org> <kaloz@openwrt.org>
 Ira Weiny <iweiny@kernel.org> <ira.weiny@intel.com>
 Iskren Chernev <me@iskren.info> <iskren.chernev@gmail.com>
 Kalle Valo <kvalo@kernel.org> <kvalo@codeaurora.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 140eafcbbd78..13609b3a1f03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3012,7 +3012,7 @@ F:	arch/arm/boot/dts/ti/omap/omap3-igep*
 
 ARM/INTEL IXP4XX ARM ARCHITECTURE
 M:	Linus Walleij <linusw@kernel.org>
-M:	Imre Kaloz <kaloz@openwrt.org>
+M:	Imre Kaloz <kaloz@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
-- 
2.47.3

