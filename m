Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626455;
	b=CVAZRl8CBKUH7q29hHl+YJ6DZnz+UN0KDkRuKaEDY3giggv13oOAQb/FvNT83c1aohwJ
	 N9/Ae8RGnGhZSxe4n/LMF9nlFX5tOQB1AGTC2lDCB32+A2CzIx5YQAO+g0Y4jYBl5oncB
	 yx9ZVOxXA6yK2cpwGv95yX/V4iPNFQcsl5aF+x/OEIO0+gHdMGXWPhoPx5PkZmRkMw6hR
	 La0Y8kvmjr9+EaHnzEzwxJkzAvvlpcC8ydENgSYD1TLbvDl+7TOHH2StbNUd6iatbFMMH
	 +7lCkFFD9rERQFmH7cVC1BNBEtZaJAYQCARDLht4hYLIYGYUhAhFRk9r9H1OBdUI8YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626455;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=zRvvd/YokVriiQ2VOVt57RI27Q3ijuDbxDuzLaJI+A0=;
	b=ma3ATqhe3WZqDGgqYBnnS6cIa4Ac3A7O35xcmlNgeEzHMFNQcUguuqS3KmSGZaZ+mVym
	 dZX9X0B08eFwOu6vXcEtrqENR/bdXZccI6czP3WPg54oJw7cHYwCLNfXlDsVbuIwwl6zZ
	 bQ6e9iKdudjX/c/yNHy1EzhdzNcfuFAqi6RxI56UaQJzurp9OMntqXYHtE6lD+Z0f/i+7
	 x9F7YKfE8KBEqpALQ7rY1huets81UyXePxDh/RhtttbP5HfdWt0vJ4yAlCk5PvCPnCc8P
	 gYRWwli63jabyeIYQNadioWFP8YiS1ULIpDfSWrHmLeyLPx73i6OXzl4TZrXp0dUt/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ugA7XNyF;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C69860A3812
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C69860A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ugA7XNyF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5D3A1595;
	Mon,  2 Nov 2026 05:34:11 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80F453F632;
	Mon,  2 Nov 2026 05:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793626454; bh=FinUPkAoVZpYc3piTVdTKrvIQOoQFfMpjjnaiPNCUHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ugA7XNyF6I+A6XtMadyCWKvL75M2bLnFIOtgrBs5l9TvwFA59Tfi+NDRrMoUdxNj+
	 BnutvWBmd8FYakW+MwcUMvReMuBMvC6F8I4R1M9BtM/oWi0K4krjW9GfHZ6diw8PtA
	 9DbUHXeq4Zj5l9aL9uaehs3eDE5I89AqIZKlv07E=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Mon, 02 Nov 2026 13:33:03 +0000
Subject: [PATCH 10/10] irqchip/gic-v5: Release ITS MMIO region on DT probe
 failure
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
Message-Id: <20261102-host_gicv5_fixes-v1-10-743b61626fc5@arm.com>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
In-Reply-To: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Bischoff <sascha.bischoff@arm.com>
X-Mailer: b4 0.15.2

of_io_request_and_map() reserves the ITS configuration frame region.
If ITS initialisation fails after mapping it, the error path only
unmaps the registers and leaves the region reserved.

Keep the resource description and release the region on that path.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index c0f3982229194..91abe63cb5cf9 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1188,6 +1188,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
 
 static int __init gicv5_its_init(struct device_node *node)
 {
+	struct resource res;
 	void __iomem *its_base;
 	int ret, idx;
 
@@ -1197,6 +1198,11 @@ static int __init gicv5_its_init(struct device_node *node)
 		return -ENODEV;
 	}
 
+	/* Save the region to release if ITS setup fails after mapping it. */
+	ret = of_address_to_resource(node, idx, &res);
+	if (ret)
+		return ret;
+
 	its_base = of_io_request_and_map(node, idx, of_node_full_name(node));
 	if (IS_ERR(its_base)) {
 		pr_err("%pOF: unable to map GICv5 ITS_CONFIG_FRAME\n", node);
@@ -1213,6 +1219,7 @@ static int __init gicv5_its_init(struct device_node *node)
 
 out_unmap:
 	iounmap(its_base);
+	release_mem_region(res.start, resource_size(&res));
 	return ret;
 }
 

-- 
2.34.1

