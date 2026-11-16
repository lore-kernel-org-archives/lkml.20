Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810649;
	b=LKQ0HKJZZcoUfu1zlm6wqkx5aJXf+PGDmCAAgQFdx3mnsPMsBzfZBGhYy/2Kh6PWxx4U
	 YlAHochp7V0lomeIJoxnDWHezRxcCvn2MqBZs8J7TipBno6KjJqCsgUjDucprPniskKLa
	 PJTF8HoXo/7sFGRD1pD18l6Rxg55uYlkw4FimjXraAw4Zo3QKC8bAzouj5jx0cEZdeeLd
	 xZrkSOVUv+iU4uvdy16DZ4Yk819/Ij2/fm73Cy0scVBJiFHz1UzToyE6BJXecU8j5JcJ4
	 KXbcqiJ3PzRpbYpFk5o6JTONt5ONgsrLVrw3d1+PU0ZWcJnreG+MWIfjdKc9rxBx2Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=;
	b=2LmL7pomszgB0XFybUdsBqyqCXe4vc3LkpEpsDayhrKccRtkSgpZCuSB7TmulzsbFhxO
	 QrL4JvxSWcc/4/ZEdjiQ1D9V3/5qDEnq66YMuVYeURDNkSmU54/Xquv+wAERrQwtCcNz/
	 W9oNGqIrX7eFmIevXCYhkNdf38WGa1iyq4EajDtnUWCycsE4WZ4wv4fQZXPeOvuhRxBgZ
	 m6aqdQXQKGKTR2hlQBIXdMtBB07ITTUvj2h8syNd32ebNSNuEAF4Gye/ufDT4YgMn5qCs
	 ETj362Y61KOCckZYAHup8BaWbocrcwrfYNSsxCvAZuIVxKylTlx0ws0J448KBcXJkqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J4mgJsfW;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649A5606A888
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 649A5606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J4mgJsfW
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71ada4644f8so660596eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810648; x=1795415448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=;
        b=J4mgJsfWw/+/pJUJ3Fdakrnp7kIwgIKRaMfBj+pT7/LnXwjcL/g/3RwhhNAAraCQzk
         Kpniw1hkzbENv/9gQ2wvu9RfdOJaiNpQm4PoRhjj6UaIBjvB8gewVIx99FFE/6A9euIo
         2rTZXJCwCAg+j+at/8+SUEoE5s6EYhkHXTqwsuC8AzKnPD+EkqFCtSEbIZ7xRLOHCTQ3
         PrcsQ1PRp1ARjhyMOFr2bwVg3lygPSlJmKCPVfEoRtBjV7KXHxn4hIVKLdIsgtATJvNe
         zzBwwdkdaDMr3qorr5xUpG8Zzbu1rUR+LMEs0AdWXBD3bVo3zTEQ7cZaHWZ+5uihhksn
         OewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810648; x=1795415448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=;
        b=VIL/I8wkK12PamXnCUccvEIRua9xx/lqX8mbl+WXoXYAXX08XyhsJBXosOM5pyndZM
         M4LBV43dF2b14igEicjcaJ0UfgvWzrzEMP52jg4kOWfC8hJNFnQwv27cpakJ4PNe0iPm
         gIN5xCf+/sTNQL3DoO89KkBCntnAl7JJNwOYOXWyPqpXwgwFzSLtkzwuDgjGlVR8SBOl
         zhC2rOkTgIAQnqkyiruSnrsif+Hs2cb55W5/BZSHs86F7hI1Jh7aOhxnwC7GPpVrA0Zd
         Npyw1LiDHbnlAKqVl8Sfdo8NTJBFMWlVQrMet55XznLKUL2JDleOCkgDn2tXKBsD8Jiy
         uaMg==
X-Forwarded-Encrypted: i=1; AL+hErF4N7RFx7ahPfmtpNWJwCJjZ6zIUweWVr2z+GJb0uKLJgKQtBlmWYujUDsmGD4WeixQBY5GgH3AKvwF/ec=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lzuRC+KAeNjXENysu6NrlnkxtU8s6dFQPQBmk9g2vgW3fcCqC
	DVHaBvstHmhtDLXhvHUVD9IJMXuRzuRgMNzNvcFeS4/t5KzrSLHqk6uw
X-Gm-Gg: AYBFou0qk2fovkNFCXz2W5QQsDqRxZY3oAEXUtGwvVmO2/iZ6RQvaMlfuzRVWThQCyi
	HNAFRygJ2VpZAXJuI2Z7nH75X1IDGMVTMFVMja5P6ptOt1DnnY2rqUeEu6B+d/jvKtzkx4y5x2F
	AFCKZ+9rfHdL6HJUdnRW7HbAcLobKkasZ7cRgCEUBSXRxlx14iH8Oz8FNSNPK2ZsQfYCeuHneYA
	FroFdz4vTMDiNrgTmwWiQIG0eT1A/xFWjwDKFHoJinI47bTPhY+sngJpQ/H5IUbegSOlcz5iJDN
	sK5FilD11wRHQgWMegV3fEvnvVeop9Dxkl8AKjhHhN0cVo96ktdhqibLFHqotB5CmoPHCanvP+W
	tewRjlwdtUZpbhL2QjRV/YkUHe7QEQgWg1SeNOlx1WYYpH850IjSkkNqQo05du0Q5y57cI8Zf2p
	vWvgxHOsHHwbF6Ck6gswKdJcY96JfB3EDoCMKysxRfjuKaMLAPvpi4wQ3tKIXlTMD10769gAO1q
	is/+n2Q3Aa8XhtQehXxkaDA+qj6YRq8e3tNWsgTdABOkjjRECDatW3UR4CguWesCDODcYsL/Dma
	9FsjQBVsdR5LHEOXimVydsE7eN8TjBM+B5+s74zZmz+T7WhJ4RIA+vb3d/ooXV3PAFdeq2t691U
	Z3Mug3nTmB2FtbxBGJ2MsCO4mEvQKv5ZTk1J2fMCCkZdHh7uXV40ZU8bE28EYR+GxrktQN4sV+m
	Yj6d9kwEiWvE+IOWkECZBr1np1mCtIvpPU6Po7+JztSBx/lZDyU8nwCnStcZVhrDXHYpe3PJq/
X-Received: by 2002:a05:6820:1c98:b0:71a:17b:11e0 with SMTP id 006d021491bc7-71ab4f7665emr5897927eaf.42.1794810648221;
        Sun, 15 Nov 2026 22:30:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:07 -0700
Subject: [PATCH v5 52/58] mtd: rawnand: bcm47xxnflash: retain chip state
 across removal
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-52-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Disconnect the scanned chip on removal before the BCMA-backed hardware
state becomes unavailable. Retain the embedded NAND controller and chip
until the final MTD put, including registration failure cleanup.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/bcm47xxnflash/main.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/main.c b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
index 4cccf00f67f7..fac96ec596bc 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
@@ -26,9 +26,13 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err = 0;
 
-	b47n = devm_kzalloc(&pdev->dev, sizeof(*b47n), GFP_KERNEL);
+	b47n = kzalloc_obj(*b47n);
 	if (!b47n)
 		return -ENOMEM;
+	b47n->nand_chip.controller = &b47n->nand_chip.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, b47n->nand_chip.controller, b47n);
+	if (err)
+		return err;
 
 	nand_set_controller_data(&b47n->nand_chip, b47n);
 	mtd = nand_to_mtd(&b47n->nand_chip);
@@ -48,9 +52,16 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, b47n);
 
+	err = nand_set_lifetime(&b47n->nand_chip, NULL);
+	if (err) {
+		nand_cleanup(&b47n->nand_chip);
+		return err;
+	}
 	err = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (err) {
 		pr_err("Failed to register MTD device: %d\n", err);
+		nand_disconnect(&b47n->nand_chip);
+		mtd_put_master(mtd);
 		return err;
 	}
 
@@ -65,7 +76,8 @@ static void bcm47xxnflash_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver bcm47xxnflash_driver = {

-- 
2.53.0

