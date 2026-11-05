Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893098;
	b=RGnUFSlc/T3Rx+WyUo+nJwIHDm84vpERaNdcPx0r37STdNDd8aRLuVTFcYpRNBOvrOT5
	 nLXNLOWt9B8U1Vzl/lO6JJpC/mKRnOX2jTBF91+HEo437OnZQELMWmqXkqgOGQJaO9hvv
	 +8ImUNVvMFCX/sQ6oUfHPCR8jJ5SrhKDyAoLkBIDbKNv+d1Gvxp2pB2ukDDon8J9yP9nl
	 4wBFQ1au0wo4/OYVXfIH9FhQuFUER0VCxgAKIfmtDNHuE/ZnxopKWZ3xhx57+9uSc3tcU
	 Z7Mtv8biyyuvHrIahQjtyPjiClour0zQGKtUVtI0RoJmQI4Myd04aCcshv/IvizAKKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5nwBNd9yUUsPIoz1aKyDtvky4U2vOuqkRzqvPOH8T5s=;
	b=1XXpatdU3YkA9Z2MVgEOgSDT1FTUQF71v2w+qme18l7RFXCDGenwNMFYlsJYtdMlSj6b
	 sKJgLo8wBRZksbjz5woDm4gazNhr7c8f83VkSpEW128oLY+usY5hqH/yRqZ0Vps1tJZrJ
	 HOf6HRl+ug/c4JbHZLBwbjmhxjxeO+ryLqSOIh2F6VDKoGBgRBdWm1KZR8URqICiT55JG
	 jIWq2xB7OQCMWnKnjAao3rYLFuRKXKo2iT/CGKmHwaxsPKYwWTDHnqacSdtDbZTaz/VWD
	 KdkaIKYLRJ3lMs10DSgZFPNSzRXaBpTC4M3lp77P7P+IIFbnoww1bMFnh+UvruGbTNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=RzErGQWX;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E514606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E514606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=RzErGQWX
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-53ec9237600so1126160b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1793893097; x=1794497897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5nwBNd9yUUsPIoz1aKyDtvky4U2vOuqkRzqvPOH8T5s=;
        b=RzErGQWXWtDnyIbyy3GTxW9gj5vi0VMVFINajMWK8dv+li28qECAg64FfIXnY/8w1Y
         1Ipbecb3x4TYKK3ruVo+UuA92bD9fhOacV97hmDZB7/0r8oIqlaHw0TmINmHeYDS4Sil
         3rG7b37+xKZRVgqhwr9w0em37IFnh5YgrfdJYSBi277DGvdeK9B2cQZiM5odv4TQWnfF
         zVcjxDT3GdRZ4HF7Dq8ZbLq4HTwkLYAKJ/CMRGEIiAx1bsrwzWTHwXYc+esLQIYdF8VJ
         cNv4Kc1a/+PYUJnUkzQSpg28cTgB8uzcWHfx34vLCalu/TReYTEg/1XcsAYgZGChXrts
         kFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893097; x=1794497897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5nwBNd9yUUsPIoz1aKyDtvky4U2vOuqkRzqvPOH8T5s=;
        b=GlzsQd7V6fW/PJbcKo3Kh8K36ELbmDdGzXhYt3CarpbFb0nMMrGFyRjeZ4ULu8pS9Q
         2kZ8bi9rZsbgZPU/we61lDJ8e+zLcXjksKACgG8XeyQs7As+Lp65I9q9zVUCNYwdGho+
         +9AkpKV5sORqpAgtYz5DVFtBFQZnO0VziT8c6CPo6LOUUZCwpv2mwaS5gnfZwtnJqFrt
         7QcgA+mcWNNXfVBL4VyQmjA+Gh3kpn+1yTIy65G48iDRI0BmHzfj2wri1GWR2YmOAwzu
         GEIcAHu9rzzYZ2SGIGvNJ8GfMWm9ezSYuLCt55JRZjkO4JLvlk5w90YFO8HKLxyN4LOc
         GZCA==
X-Forwarded-Encrypted: i=1; AKwUvByeJ+mOPUFLZyyFi8JlNw0Jfe0KhFTBcEa2v0Wg0We2QO71ysfAiYyshz5acPBi3T1P1ww0IG0+ioUlQxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z++UYpSEsVaE5B9qu3k0SK4c902B9mt+tKXZwTPI4e2Rua8iigB
	fhoihOB/7t8lcedTGoPR78Kezm2XERVpG4XbQbDS/XkEtiO10scb9oONPFTMHgQlxIo=
X-Gm-Gg: AYBFou3zBYMd8TeuRmWAxsOHGWIEemHQaz13e8jTSfQ6Jo/Jw7R83s/608F/GrJ4uoP
	GVD6mWy4ObcCmlibLdYj3sBcEIurF3YTCOM81Ij67Oue/wQO2L4zuJm3wyp3qDxP+RnIPp+pGIp
	7j9gXUje+bPKUym5hQVJB9afWrb/IYSt1SQ8zl2sMwDtwpmxquYg0a7hYFM2EVMd7owfLafIFra
	dcjI/CT75pOLWdO3EPOPdEUWIyZGeUvVIbchZ/LkD3K29PaU3hJNKR1AyDExTuL3CbuIOpkBmoe
	gQMWk8b88wqwyZPuajr5TTUj2cArR1XFkd6sSDnuS2eaVsySLZOArdNETm5T3dtmGFsR4PAvPjT
	ZqdNLtm2LzIjodk08o+N4GKNXw0PW9G8GfeHEvmzitgZr/dokm36LYDMmhiEauAMZ4rbE3X4Kxx
	VBaN8q1D1jcuR7kSt7BTLS3Ozs4fFc53jT/gdDnLF0YdyWxHmtJrGVcZMJHPjgwiLFf5SHROvDo
	Y2ZC0d1ubKjcgFmkLBRjI5km0BWEs3VL7OAmUmFbkIvPzMpuum5uQdu4uIwze9GNmd7XQ7KdxF0
	3mSn62pRqs4D0TkHtoebZlIDSzQq5n9EkA==
X-Received: by 2002:a05:6808:6ec3:b0:4eb:80c0:f4bc with SMTP id 5614622812f47-5640deeb2a2mr15565977b6e.10.1793893097040;
        Thu, 05 Nov 2026 07:38:17 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef6e3bsm4435329b6e.5.2026.11.05.07.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:38:16 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/4] PCI: of: drop the reg_num argument to of_pci_set_address()
Date: Thu,  5 Nov 2026 09:37:59 -0600
Message-ID: <20261105153801.435566-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105153801.435566-1-elder@riscstar.com>
References: <20261105153801.435566-1-elder@riscstar.com>
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

The reg_num argument passed to of_pci_set_address() is always zero,
so get rid of it.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/pci/of_property.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index d351f500c2ce1..6236dfaaae628 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -52,7 +52,7 @@ enum of_pci_prop_compatible {
 };
 
 static void of_pci_set_address(struct pci_dev *pdev, u32 *prop, u64 addr,
-			       u32 reg_num, u32 flags, bool reloc)
+			       u32 flags, bool reloc)
 {
 	if (pdev) {
 		prop[0] = FIELD_PREP(OF_PCI_ADDR_FIELD_BUS, pdev->bus->number) |
@@ -61,7 +61,7 @@ static void of_pci_set_address(struct pci_dev *pdev, u32 *prop, u64 addr,
 	} else
 		prop[0] = 0;
 
-	prop[0] |= flags | reg_num;
+	prop[0] |= flags;
 	if (!reloc) {
 		prop[0] |= OF_PCI_ADDR_FIELD_NONRELOC;
 		prop[1] = upper_32_bits(addr);
@@ -135,7 +135,7 @@ static int of_pci_prop_ranges(struct pci_dev *pdev, struct of_changeset *ocs,
 			continue;
 
 		val64 = pci_bus_address(pdev, &res[j] - pdev->resource);
-		of_pci_set_address(pdev, rp[i].parent_addr, val64, 0, flags,
+		of_pci_set_address(pdev, rp[i].parent_addr, val64, flags,
 				   false);
 		if (pci_is_bridge(pdev)) {
 			memcpy(rp[i].child_addr, rp[i].parent_addr,
@@ -168,7 +168,7 @@ static int of_pci_prop_reg(struct pci_dev *pdev, struct of_changeset *ocs,
 	struct of_pci_addr_pair reg = { 0 };
 
 	/* configuration space */
-	of_pci_set_address(pdev, reg.phys_addr, 0, 0, 0, true);
+	of_pci_set_address(pdev, reg.phys_addr, 0, 0, true);
 
 	return of_changeset_add_prop_u32_array(ocs, np, "reg", (u32 *)&reg,
 					       sizeof(reg) / sizeof(u32));
@@ -470,7 +470,7 @@ static int of_pci_host_bridge_prop_ranges(struct pci_host_bridge *bridge,
 		/* PCI bus address */
 		val64 = res->start;
 		of_pci_set_address(NULL, &ranges[ranges_sz],
-				   val64 - window->offset, 0, flags, false);
+				   val64 - window->offset, flags, false);
 		ranges_sz += OF_PCI_ADDRESS_CELLS;
 
 		/* Host bus address */
-- 
2.53.0

