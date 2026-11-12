Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446967;
	b=TBmHs9CmZcObRnZL61MPQ0is+pVA4AgXwIKNYqV0O80HEjCjlTWKA2w1R8WyL4ujquCC
	 3anKvk4B1/v4B0QMdSdJELry3d6LEd1hOGnW75ggYDkCqpRjg8i5/oCQ5PYstAYXLpYXj
	 i5tp5IC8IEsTnHFQj4zHeiCartI3aXf628/ljXvXYxtp/SuoYzr6ZwkmEtdjd5YplHNnt
	 moPzBU7H0xMOOFJlrI06+yMC6XhOzpfXuP6OSyhFLrbaW+DUGD4pLddnLuXngMfLV/bGm
	 JxHd3BHitdXpvjMwHGBCwYR+MDlhrdM9qg12k8hL+g75ozVLqsk3qploOAGDm7nUgVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=;
	b=5cc/P5GxrZtwj7unr+X4KrQpO8w9Y8FZmdzP4gq0TLsWBOOVgiyBsJbNhEWLhPBuOou7
	 QwrSAE6K96BlQnZkCM25aKgQt8qCeQ4O3FV0ZWYw6o73687BViFv112fLpA5a0DobIxtX
	 iPw4uKIZp1o/jaaDDyxLLKD6DuR4GX4BGWvjDoWmF0cPJQXQ3S0d3HDFSGKXnSZGcnO8z
	 lBNSO/GmYwTl5NMvO16w8AOsrryRz2WbOarjSBnjgGYBCp29j6qYTzcocj2KxZ6x2q68B
	 DOW2gH6Fp1qAFnyg1PXdAHQoftzqqXTWqSHJzpl3CWnoSu/6HOsVsBXjLkJXyyIZq+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sAuEaq8X;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD0D60725EF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD0D60725EF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sAuEaq8X
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-53a448f86e0so2102601b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446966; x=1795051766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=;
        b=sAuEaq8XPqdjLEosUfCgNuNvejs99eHsBVIFkstUho2ADWho2bV27XG/huFKLdikeK
         47kVbbS0HyUucOi4wQ1xkws1rSsR/T3KCXFt/188cnoL/wAhSt+wgXib+rEcSDTMlMG1
         RF6xN1qheQKLh+XCvo3clRbJqmj9mDKtVD9FDvMO4uvRek6xyCrPF8MhwC07tlSUVm/s
         tE+xxShCgHAprBXSj6m0eislZQ42NYugzEX6HDromOKd5C3uaSYzmkul/Rq9nDDf80lF
         1A/h/F115XWsybIZbR01HT7q2MiVMS39aBoYVdNlk5SbP6/ZJXrlraQb8XL1Y7SUShWU
         5DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446966; x=1795051766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=;
        b=bEpYiRoDZR4u9rIo4UeW1zrPSYzFRFDcabP+ZyipjbgUWI4+Kt3AOw9igWG8hI5RPb
         7N9qPPg6vb8F2+3YHefNuvELMLr8AwuRcDV/IbasIF8kSk1n/HfpJSMRojU828GwFgRy
         BT0j9eoSVC1byHMtsibc95AjQNFyP8g1XN9T5Le5hxVuEoJGS1aOlTPZAExIUGVgWpc7
         nlDqqGSYYJqfIRWFTwl5IvMEhf2syWJz5z/HW8Fj0nA1oEyuR1QWK1Qt7cYVzb5YKgrJ
         ZFaYs0tvKgC5WvN7OdLD+m8QAnfOXwDrFVYLSfXjWsytkXFHhAuoVQRWMIZPulr5/LH3
         tTCA==
X-Forwarded-Encrypted: i=1; AL+hErEJOczat39o8t+vndhDW5PdOthemX/nfvjZX2FZS8s4XVamEjOm4dbBU7YL6S2qzMDjXLs/LPUaf4mZ4fY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r5fLksmq9zodyXLNBR7bxsEBTgCg/kBoSFcQR+qmOJMVZYO1j
	w6cgmUbUKh30XE3DjEm99Llgter7oCjE6dLltgmld+i9Oxh1jWZgV55R
X-Gm-Gg: AYBFou3MkW/sMMy7OlXcwA0u8EsBen4QhmRMdctLKMOjjN2V2rUQGkTdXjpZcw9Xc2Y
	yJjOKJu6xYFpmoHD538Q42CNoZHltkGsLN1c7i9yUp5bmNDmBBRh8kjjEnelkTIMzRZz4BZ4sT1
	bC6uYJWDTutWwLJgj58EZwaloApOlxnWl0jusZCsq8oKpq7cP+6xQTz/TDchMc9uffsEss6N5e2
	YmgMiLZtMsbUBJqrVKerbyH/W5ErwlhfYfzXk2iN61FVTW85F/rSe7XoDkmQFl73iDKeyywQnZM
	A5IPPHEaAt/RtfdtKtYG6k/0FHw4Z6mIjkhubqUwrA/5eYv3cMofjQtL6WDGFZBIGiTeKQBL93k
	Rx/GSMBM2+ADsDhQyGD4BUkL2msiAAstiTeZCZfgrBNOJZQzPH3wSlrFEOWhn6f1En7H6AmmflC
	Ao34N72/zwWct+Sb9s6d1de7UfdfVwV9tG9HhttW9h/MWLdIAI/CSpB4P2pe9eKoJgkTyniCgDm
	t7P30eHmndGOSI1MbB/GEr8IbGWNXcp/xwwepTDL/0xOS5jjVVItRS85GtksrY2ynouX+vuFIwd
	Gok82NNyh/ZiKKEjsm7wnrGPA+sf9ZHtsPGLFvGJy6ftTEA4xdv6MsHHm2hfch+6cv5B3slsAK6
	qO6KY23tnPUt2XsXVfA8PuA8CpG6mSn8t5q5MhyFZRGWOL0crFiYq58m+gewabEg4hrCxjePdVk
	d12/tAgM75ey5B1pXR6k7cXoj707Fp20RQMnbqnTxrrtRRIFf/0UoUzA==
X-Received: by 2002:a05:6808:16a8:b0:4f7:867a:bfa with SMTP id 5614622812f47-56b92845782mr4040150b6e.5.1794446965567;
        Wed, 11 Nov 2026 17:29:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:31 -0700
Subject: [PATCH v3 52/58] mtd: rawnand: bcm47xxnflash: retain chip state
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-52-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

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

