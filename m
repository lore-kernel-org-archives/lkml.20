Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570200;
	b=HDlj0ENXXdcpYvQecE0NSFRUnMwUBlB8xvVQqbg5dYzjfJrKzaJpHaQ2vUufnbfsU9PV
	 4izF5SPRLLpX8qde03xJ3oSdKnE/VVLjSsFU2dL1FIo0bnb4+rnM04OWHxF3BIKOcrdPN
	 A6hpRuXk/hKU1kcWTE6LaS0mkSbwGGutAJ7+vFCLI3lyKEgI7z/62PycRY4KObfHx60HZ
	 jQfyqAdFDNyM+5j5/b8XSGHcQP4LatMnMHR17ETXPMRnHHadUP3SQb3NkACqeZ3QjR16e
	 JgYttScDq9WXk5SQaEmv2v4vjfAYYdbwzkOww1WF+8QP7GZHtBB3rvJdFzAat1edaWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570200;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=km6joHkwcxH7CACYh2zbb3xiLfYHLA+77WxK652vDwg=;
	b=wEM4hkp8lF8m+8l0QOmgl5ruI6pfexVnKjpQ0ssaQ+u4Gw118QPgjMqcU7L1tltuTTtG
	 793a5KFwKBCeoW7oEU81xmR1CVf0tq0GEE56c0LYonwvPegxUFXxeh2+53pgAVB0Zeu4F
	 RoRvsgOzw3oW14o+Ei9ICj7M4kN8vsQ/eFqL28S642ZiJHfpj8pZ87lk2yeFzRoZowZj4
	 bByHMfxG2qmolDRza83T95sGy/cB6KVMCo2yXHPk7leeuTtRgdrkfQEv1cW7HsxI9kH/j
	 rXfygVXWfNQsD7LZGSh7nq/XQz4jqNs92vD8/o1C6C9vysJVER9BU46hSfJStFrlOmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fM6fAgeh;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BC9606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2BC9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fM6fAgeh
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D477D1A12AD;
	Wed, 21 Oct 2026 08:09:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A8520606E3;
	Wed, 21 Oct 2026 08:09:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0339D10328D61;
	Wed, 21 Oct 2026 10:09:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792570196; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=km6joHkwcxH7CACYh2zbb3xiLfYHLA+77WxK652vDwg=;
	b=fM6fAgehrLndt57TzGIEIEpR1UIsINEzVwMBNBQr5yVRmpO145/0JiGtSMERL2WLTRdRXN
	xyl2Xaglj7w9mPTC3kHUloeMZ7cm42ldkMAImlyaTVg31l9nSKtVHjiDGKExCbVqv4+hzp
	UESISZau6NB0FkcDLgm+HJ/xOB+DM5xXzJXQZL1DJkKqSF9LGqOod1wvGhjWyAAGvfazr8
	/kRFVb6TeKGjzda278kNQbXkcLN8RtFqPY9UzYngXdWO1M+EdrjprbiB5mFVxrxasNSELG
	WLTJFrX45UEzPFGYSITDYFqe4J0/jAAS8Ej+6TTAMwpN/IVObtKJW4fA1tdmWg==
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
Subject: [PATCH v5 2/6] remoteproc: k3: skip mapping firewalled lpm-metadata memory region
Date: Wed, 21 Oct 2026 10:09:43 +0200
Message-ID: <20261021080947.3747284-3-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021080947.3747284-1-richard.genoud@bootlin.com>
References: <20261021080947.3747284-1-richard.genoud@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

The region lpm-metadata is firewalled by TIFS on Jacinto devices, so it
should not be mapped to prevent speculative access crashes

Just skip this memory region during initialization.

Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 drivers/remoteproc/ti_k3_common.c | 36 +++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 3cb8ae5d72f6..baebb5de56f8 100644
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
+			dev_dbg(dev, "Skipping firewalled memory region %s %pR\n",
+				region_name, &res);
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
