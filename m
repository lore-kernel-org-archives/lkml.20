Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE593CA483
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002422; cv=none; b=jqwG/1RNuNbt9u82Lyr4kA+mT/g3Pe2i9biODaxD+FAjBPUzdwo2LbxeU4kpOWVhAYqFbk05rzLDZBAHP4EhZC0si7RD0Bn7rPFf1VByGoO4Mt6rPvxc84c2pdSf5A0Vu/MOIi5lk7ecP+G1yz72SO/s1eJxUk21vZQ1EUVmjU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002422; c=relaxed/simple;
	bh=rocu/2yiUQErYtrWbo5Fb766lw4uQcZyhJUqnN81NX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mra4uBl68dG4314yLBu1wd6s0gX1XNECh0IIV+ZakN8OFWcWW1EZ0JroiMbwqi3qJPWsEEp3vnNgEYYA3AHT95uro3Ed77/gkn7BT/YTqtq+LmbTGFQKFC+R8M8cTIGhWYg45ij1PrcljWoR11edCwjLd+K6Vhwfm8wFRzscex0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CYywDKnD; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CYywDKnD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7E5BA4E40D86
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:53:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 516145FFB2;
	Mon, 21 Sep 2026 14:53:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A496410329195;
	Mon, 21 Sep 2026 16:53:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790002418; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0XfNnwLyPIHZJJHZc9uvlNXqC+VY2k4WOMmJttsUxZQ=;
	b=CYywDKnDvk9aFqMxlv6rjV8pv7s5pTRKvsjsFHHqklPUkYi4PfsJ7lzV/w71eD6MXdnwLZ
	boV48QUg5Rn7q3avxt6OJ10X6hMiD4qjRVg6rSK6xg6AjYDk68pO/z3+8Dy4zfmE5V6kqg
	6gkJNCoeAXZM1p/RTP/7e2IIfPDnwDFgnKJGbBRFGdpCHCSYfuIZjpLlyFBqJoeriwl3Ta
	wi+x7ybMb8+u20hQvntPNiHsU51HeSFNk4Lr8frWEk603DawjSR0wUk1EHapVGXPSicZg9
	wyu5xVEo2CAF6haDcVI9psOOV2tEm4lmasUJPTMmxR/SJZK9I6DX/rNvSs6i0g==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v4 2/7] remoteproc: k3: skip mapping firewalled lpm-metadata memory region
Date: Mon, 21 Sep 2026 16:53:20 +0200
Message-ID: <20260921145325.300025-3-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921145325.300025-1-richard.genoud@bootlin.com>
References: <20260921145325.300025-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The region lpm-metadata is firewalled by TIFS on Jacinto devices, so it
should not be mapped to prevent speculative access crashes

Just skip this memory region during initialization.

Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 drivers/remoteproc/ti_k3_common.c | 36 +++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 3cb8ae5d72f6..5158e5e7c816 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -471,7 +471,7 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
 	struct device *dev = kproc->dev;
 	struct device_node *np = dev->of_node;
 	int num_rmems;
-	int ret, i;
+	int ret, i, j;
 
 	num_rmems = of_reserved_mem_region_count(np);
 	if (num_rmems < 0) {
@@ -501,30 +501,44 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
 		return -ENOMEM;
 
 	/* use remaining reserved memory regions for static carveouts */
-	for (i = 0; i < num_rmems; i++) {
+	for (j = 0, i = 0; i < num_rmems; i++) {
 		struct resource res;
+		const char *region_name;
 
 		ret = of_reserved_mem_region_to_resource(np, i + 1, &res);
 		if (ret)
 			return ret;
 
-		kproc->rmem[i].bus_addr = res.start;
+		ret = of_property_read_string_index(np, "memory-region-names",
+						    i + 1, &region_name);
+		/*
+		 * lpm-metadata is a firewalled region accessible only by TIFS.
+		 * Skip mapping it to avoid speculative access crashes.
+		 */
+		if (!ret && !strcmp(region_name, "lpm-metadata")) {
+			dev_dbg(dev, "Skipping firewalled memory region %s @0x%x\n",
+				region_name, (u32)res.start);
+			continue;
+		}
+
+		kproc->rmem[j].bus_addr = res.start;
 		/* 64-bit address regions currently not supported */
-		kproc->rmem[i].dev_addr = (u32)res.start;
-		kproc->rmem[i].size = resource_size(&res);
-		kproc->rmem[i].cpu_addr = devm_ioremap_resource_wc(dev, &res);
-		if (IS_ERR(kproc->rmem[i].cpu_addr)) {
+		kproc->rmem[j].dev_addr = (u32)res.start;
+		kproc->rmem[j].size = resource_size(&res);
+		kproc->rmem[j].cpu_addr = devm_ioremap_resource_wc(dev, &res);
+		if (IS_ERR(kproc->rmem[j].cpu_addr)) {
 			dev_err(dev, "failed to map reserved memory#%d at %pR\n",
 				i + 1, &res);
 			return -ENOMEM;
 		}
 
 		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %p da 0x%x\n",
-			i + 1, &kproc->rmem[i].bus_addr,
-			kproc->rmem[i].size, kproc->rmem[i].cpu_addr,
-			kproc->rmem[i].dev_addr);
+			j + 1, &kproc->rmem[j].bus_addr,
+			kproc->rmem[j].size, kproc->rmem[j].cpu_addr,
+			kproc->rmem[j].dev_addr);
+		j++;
 	}
-	kproc->num_rmems = num_rmems;
+	kproc->num_rmems = j;
 
 	return 0;
 }
