Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.150.161.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763290;
	b=y0w9A3YVKZ1FRUnmSDfrECSfca3OdIZRIfsHbS+umtTcECwKLwpqq3ZG2IcbYPwTd17v
	 Mh7A+RX3TShjc38p33FeHm07eYFFI5445v9DeJ968lGibd0CdZqwyezrEBqVAKFusccEJ
	 vmdGP7Oek+OhrBWGlPVxzCDrMlsKje6DhC2IL5H5+Nq4eCrHEnpCUFoprjj4oX7JCHKqI
	 UA9Cp7j7Q2pUyUzYn+cLMSimhn9zpncmi4wWZDRorGizvFDaM+mz2yxK3VDmZpsiGb+8+
	 ZO7QtY+OnlUmq0UXXXpOdqRmkQVWEN/VRh3WAodSY6Thf+Z+K3jG5yN7rTwEPQfZ89g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763290;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-OriginalArrivalTime;
	bh=AKN0NGQ+vVruKbIpxCAzudsaBfTY19Lc9bB37nCu7yc=;
	b=r4h7dcfZjx1n4lVeFtmAYv8Wgk62MycLlyB4NOjLrsqaI/0dtZUCppO6uIuXwqdz50jk
	 3I2IFvsh54d1d935PRwQrkXcvWxP36EqIA4c6PRZlh5alaAUrhgj5ETI68XN+1UfGb0Zt
	 UjP7CjJ30RmFQIr87mmSCPB/kxR/+hIlLasLHv5Kw9HOoZUiWR07lzEtUD8wVB6VWcURj
	 ixl7jkwiHux8dTpPrEQGZSEn1n+6p6EKIgY/Zjc+CR5kg4HmaA2JZ46VhwYXlus+e4uUv
	 G5Uimzyjyh93D+Lg7ITA4BEDZqupXK+pNw6JRuotdF1/SuX8iazYBy2+KeIf0+noREg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=einfochips.com;
	spf=pass smtp.mailfrom=einfochips.com;
	dkim=pass header.d=einfochips.com header.i=@einfochips.com header.a=rsa-sha256 header.s=NAESA-Selector1 header.b=esjAULad;
	arc=none smtp.remote-ip=216.150.161.24
Received: from naesa04.arrow.com (naesa04.arrow.com [216.150.161.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EE660A2604
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2EE660A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=einfochips.com header.i=@einfochips.com header.a=rsa-sha256 header.s=NAESA-Selector1 header.b=esjAULad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=2544; q=dns/txt;
  s=NAESA-Selector1; t=1792763290; x=1824299290;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AKN0NGQ+vVruKbIpxCAzudsaBfTY19Lc9bB37nCu7yc=;
  b=esjAULadQwwe2q3bYLq0JofNX8CiHlKLs+3BXBkx+k4hSnRcbkSa5HsF
   KBy9ztB8//SfdfXamPHS46CdLJPrvT7c+vivTdIgl0hMjGZ/ZYxPR5DSU
   zwoM3dgcoZ8qmN+YQQAk25qnf0bdJEZre1GKU/ZaRoeRz3HtC8q5VTGXy
   a6vat/PdYxoPrJmCGJAySjcEnbR23dnzBezBLduUr9lMZXrUFqgbwDzTM
   4HDPZ5z/GNSLzMJvq5EUYUnaflGNKvTdunMNtDtnpMTKu4dDbwFILB81k
   lc+ngqWBO+Q4YrK1i9dZFzJaXTG89qxCZCeGguwEuf/6/t5Atdy5c7bgK
   g==;
X-CSE-ConnectionGUID: Q5eFZN7kRiOrosDgs2hECA==
X-CSE-MsgGUID: jw1jxanpSXqpDxRTvNt4Uw==
X-IronPort-AV: E=Sophos;i="6.27,174,1787032800"; 
   d="scan'208";a="125767232"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa04out.arrow.com with ESMTP; 23 Oct 2026 07:48:03 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Fri, 23 Oct 2026 19:18:02 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Subject: [PATCH v2] cache: sifive_ccache: Enable all ways on EIC7700
Date: Fri, 23 Oct 2026 19:18:01 +0530
Message-Id: <20261023134801.108890-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 23 Oct 2026 13:48:02.0238 (UTC) FILETIME=[1F4925E0:01DD62F5]

EIC7700 firmware leaves only way 0 enabled when no LIM is reserved, so
Linux can use only one of the implemented cache ways.

Add an EIC7700-specific quirk that reads and validates the implemented
way count, then enables all ways when the cache node has no
memory-region property. Leave WayEnable unchanged when the property is
present because enabled ways cannot be returned to LIM until reset.

Keep this behavior specific to EIC7700 because firmware on other
platforms may have already configured the cache/LIM partition.

Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
Changes in v2:
- Restrict automatic way enabling to EIC7700 using a device quirk.

Link to v1: https://lore.kernel.org/all/20261021130906.2501060-1-pinkesh.vaghela@einfochips.com

 drivers/cache/sifive_ccache.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index e1a283805ea7..b4eac620ad0b 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -68,6 +68,7 @@ enum {
 enum {
 	QUIRK_NONSTANDARD_CACHE_OPS	= BIT(0),
 	QUIRK_BROKEN_DATA_UNCORR	= BIT(1),
+	QUIRK_ENABLE_ALL_WAYS		= BIT(2),
 };
 
 #ifdef CONFIG_DEBUG_FS
@@ -117,9 +118,25 @@ static void ccache_config_read(void)
 	pr_info("Index of the largest way enabled: %u\n", cfg);
 }
 
+static int ccache_enable_all_ways(void)
+{
+	u32 config, ways;
+
+	config = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
+	ways = FIELD_GET(SIFIVE_CCACHE_CONFIG_WAYS_MASK, config);
+	if (!ways) {
+		pr_err("Invalid cache configuration: zero ways\n");
+		return -EINVAL;
+	}
+
+	writel(ways - 1, ccache_base + SIFIVE_CCACHE_WAYENABLE);
+
+	return 0;
+}
+
 static const struct of_device_id sifive_ccache_ids[] = {
 	{ .compatible = "eswin,eic7700-l3-cache",
-	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS) },
+	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS | QUIRK_ENABLE_ALL_WAYS) },
 	{ .compatible = "sifive,fu540-c000-ccache" },
 	{ .compatible = "sifive,fu740-c000-ccache" },
 	{ .compatible = "starfive,jh7100-ccache",
@@ -317,6 +334,13 @@ static int __init sifive_ccache_init(void)
 		goto err_unmap;
 	}
 
+	if ((quirks & QUIRK_ENABLE_ALL_WAYS) &&
+	    !of_property_present(np, "memory-region")) {
+		rc = ccache_enable_all_ways();
+		if (rc)
+			goto err_unmap;
+	}
+
 #ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
 	if (quirks & QUIRK_NONSTANDARD_CACHE_OPS) {
 		riscv_cbom_block_size = SIFIVE_CCACHE_LINE_SIZE;
-- 
2.34.1

