Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.12.53.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792870628;
	b=LADNWLKNAkfd7o7ByF7yvLgAKLrYb6AeE6H3FnLmYqLou97SCi+3Q9ohGx5SkNDuC2Mp
	 A3IT2uCdAZEC6s1h2f//Vig+WCewhW775NfxdvQM3O8l/J6IShWn6btOoqbqT1ST44EAQ
	 HEvu315zTqYB6n3sAT2UYh9n6rIK90HkffZmNRUcuWbxGSeROQ9D21EpUcBq+2/mkJUiU
	 ohDj55frGPxiJt8IAUY0ThGpi7jD+kCTC10Jz5eNeTMO/vX97axQwywKXiQ0mWV+mGZhB
	 NTspwjbtDkgnXAyfSM21BmQON6xNME0/+MS3OQw2W8JYlsCzfkBPnTjJl8TJU85U2tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792870628;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=F3k3PE8AIPekmZigE7766sEXhbFL9LTuTu32Pq+ISLg=;
	b=dzeqKRRRHG9P40aKhhIxAfLa+/AseM5us9PLuUuMuSu51swCNPSSoI06yDbRHW4T17Bu
	 WD4XKWN90CqKaa1cJAukCAEFA1xXUNmiNbPLL40+0Q3ulxMh7KXVPup41+7x/K8AWr6rd
	 ngArrGdTmnNhLWyeRoZEKrUvLyaMh8hcjZyp1W1zXSN90nNzzbvWV/RscX0cqd63UWae+
	 oIJf/HkzIWmeJGDdvLbzyGAyUG6AuOsvatnEJ5W/yCu43/286cy4IDo+2o/hh2+qqXSE/
	 KR+N24lG48sWCramsVAm+JUNAQNOdrfCUmy0p5DWPQbVZStWayooH2bF4V+TmYuCk8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=pOU47Bmy;
	arc=none smtp.remote-ip=52.12.53.23
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66BD606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E66BD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=pOU47Bmy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792870627; x=1824406627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F3k3PE8AIPekmZigE7766sEXhbFL9LTuTu32Pq+ISLg=;
  b=pOU47BmyLYDNk7F0kHzPw9JN/GW7078C2hxd2fvY/f1pBLXZ4xe1v+d5
   8tEML0TKuw6m9kxr77w6k311Lx8hUUfNpjw2fBX5iyPI7bkzOJMbo6JOF
   warid4O3EPP0vOWcafiNFt3lkxgQpc1DVetTfMfNngTEckZ9j8eXvRaH1
   KOAQpA1//qq9FCTb8RhD5HL6itY0JLX7Mq8Z3JTMQZlv/nEaWVhwaMjbI
   oBCXj2UIrMsgov3tmK+1AJDk2FkFE/KqTHBEfAUBxNvoDbJNQjT2nXi3O
   207i+Wb/I2db8ldvoy0HQWRz9ctdfo3JfmDLhwrOt57GgWkljip0Nm1eq
   g==;
X-CSE-ConnectionGUID: YN5gyusgRrOLS5ByTSbayA==
X-CSE-MsgGUID: AgMJ39OuSKia9TG3ZboboA==
X-IronPort-AV: E=Sophos;i="6.27,176,1787011200"; 
   d="scan'208";a="32018400"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:37:05 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:14383]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.136:2525] with esmtp (Farcaster)
 id 2c82021e-6993-44b0-b358-1481f7c2e6a4; Sat, 24 Oct 2026 19:37:05 +0000 (UTC)
X-Farcaster-Flow-ID: 2c82021e-6993-44b0-b358-1481f7c2e6a4
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sat, 24 Oct 2026 19:37:05 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sat, 24 Oct 2026
 19:37:03 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 4/5] irqchip/alpine-msi: Fix format and wording of the registration debug print
Date: Sat, 24 Oct 2026 19:36:19 +0000
Message-ID: <20261024193620.39999-5-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024193620.39999-1-farbere@amazon.com>
References: <20261024193620.39999-1-farbere@amazon.com>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

The "Registering" debug message in alpine_msix_init() prints
priv->num_spis and priv->spi_first, both u32, with %d. Use %u to match
their type, and fix the "msixs" wording while at it. No functional
change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
v2: New patch (Radu).

 drivers/irqchip/irq-alpine-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 8155f63cfd29..fb84b6046193 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -229,7 +229,7 @@ static int alpine_msix_init(struct device_node *node, struct device_node *parent
 		return -ENOMEM;
 	priv->msi_map = msi_map;
 
-	pr_debug("Registering %d msixs, starting at %d\n", priv->num_spis, priv->spi_first);
+	pr_debug("Registering %u MSIs, starting at SPI %u\n", priv->num_spis, priv->spi_first);
 
 	ret = alpine_msix_init_domains(priv, node);
 	if (ret)
-- 
2.47.3

