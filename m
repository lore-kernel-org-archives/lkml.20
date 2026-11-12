Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446943;
	b=K1vtMi9rrp9jtOgiBrp8rilR+eVrRlHhlx4anBdEu+8J65On4ZOaeJvJiTU79IvP1nos
	 Zbt/UeB6sKsvmyiZTAim6AZIDmh6lASvYA2D4ERLDViH8It9V1FzJNZOPFgir3V3OGChl
	 2jm5n9aNX9D7MDQ8vxFh91EYSReMC/SzyCv3FxACG6bNhc0MZqlCmYdNesVw8nK7i9tvQ
	 AFvigMAnRqs3ew4R8u/R/I1pqPZO6qSXmV7S7lNqaCh9n0gqdtQjylrueMbkFaKXT7QBG
	 /Ef0D+KAqKbE67IcuC9HVC2oIo4EnXCa+VP45niFIzBHJ4t23VxQQc7FR5AqIN1Czuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=;
	b=2a0jPgfOhf844QOQuxG7igVlwY/udk4kXAwE7fsmUw4jmJANOXybOv/+O66blBvm1PFU
	 IeZqNZ7y8+1vDJZyXpElx0zzCOUMSKOYxwRE5sdwkEZkqZSat3Bnxai8yQYuZyEyhnWy5
	 DvQ2/Iex67O0/havskmqM+NxStblsfLPpRqWUjFkHiSnT2+0c/fIkq963C63uKEz8hgkt
	 /XyiXHBj8hNsIPwxe5wdzcQqBYgLUHkr1P+Z0leOKZMqweZQMs83GQP7lVk+UC1LFvyzq
	 tMZFjv5n/fPFh/33WZJv2GhBdfTAmubBUhubFXjgcP+qQV38Q4kqEPUUHK5e/5U7TCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UTC9srvf;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D505606C1B5
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D505606C1B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UTC9srvf
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-5642e0910a3so1563163b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446942; x=1795051742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=;
        b=UTC9srvfq1vqfM1QccFulqLXzrQwcXCmfDu+677UvHAQmc5mF6uCMZBaWbNOCFHkff
         NNzEdYQ8WPfqxLA87ViQKf7YBL3oN72iAOC3QbIdPG1kJe45FOuCSaHncgDyUvOpcukn
         Q+nsae+QRn4qPS48YGO1aUctR0ikJKf9w/NKpv94woAfVxlmOaujPbaaZ90nzF8ImABn
         Ja+pFO5WbVvCJYO7ql6hn2stjwGfjJe5Ml4Zkn8O5vYv5lekxugoCeUVDhDtGgMk2wl/
         QXc9qMYqXXnXAfYbv6n4HkzZNJon2o346zFzVXofmde2G3cw5+6a+42SDdKmV6beTM3J
         R1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446942; x=1795051742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=;
        b=C5LXZYqj2D2v3qAp2j2T7EAaaA2jXaLgtKqBEiIIizlnOaBz3g/ejb/C4KuRrJHe5J
         MH0dnwN6EnO9ImbdtHOXPdT8sE6wMf/blGE5KaOrmVS5VZDVABLT8pHUkkKua4431X5I
         EzthieTUb8bLVssW1AQ0svC5neDyXwzm3hvXm4OlJE92J8bsGeCLTCWfKYMaENdCxDwK
         O0On8YMLMFw7lW7aGvbWFYgv6etgQmlJPbTYac4rJcTpgtD1N0rhl31pkFYjU1QPQsu+
         +kDhXmguckRZpT1xmDd4o1ISpcvgn39xe9tG+fDiJopYiBeWRG44Srgkjh9h3hGfgOMy
         78Kg==
X-Forwarded-Encrypted: i=1; AL+hErGWpf+rqd9izjiKRamS6CJmk8hf3b0ttDrGebA7MyQ+JTxJFJR6jtbcq1TZHHZ6x9I0vn1N+i0pZv625HE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tMHcAssKeQk4DeLLDAYyA0hZieYVZ54ItBv2uOUS1SUba4c1E
	BwBmfh8Ba60GAb7UFizzW7SgZIU/8HvQWNZyLXD/MoF2sml0Q8T7Yb5G
X-Gm-Gg: AYBFou0yDu798znamM2cdKNGOY9/bPGxiQ4LvbQD0diOceJZkNUZL/FVOCFoIKGDQQ7
	DJF3c0DyGZ90b+QSu4+R3aPk9zHN6pUDg3FQ6sc/X9ddjQMlc6IQLNQpA8g4fHHaHzFTPDRovoT
	PWiTksiQC44kwsF+ViGBgyXmGsp4PeNXdAUGG/kcT+t/pZhaNAVr1OxQEphkOrfv+IXEdh/aLiX
	qrGVB9D2pRyOkGJrQpaC5jWVgoRrGXfSpXDZ1MNrr3z9pLMYzLF+Ab8zJDNtXm5I8FT1O1qOM+u
	taI0tVw7TX4cjXJiV9oIHBE/oNXt4RM1D/d9qugxbN7PZ+3JCqhQd6EQn9CeWbTr9XSQzzlhCCg
	+M06GVRcaxpZWD6UwYlUp2iBGamt7An85a9BWMg8PVkqhI0RcwESrE2L08qAlmtdMS/8BlLCIgB
	X1fXgpk+2Nbqc6kk1+573PoWb8GKOw3JYWQBhqBZiUh27juUiwcYe/NMX70zaFTfSypWZsAfQ9b
	OvSBMc9RoG94LVyr+WyTopJcZVczYQQdqRgwueIectc2nihaSAKKtipQMsaqjAn9TdLFSeeRfZ6
	ur5j66ZFzi8LWDn1ZxBxLb+Q1WxxKDk51OvhKQHG0uXHYioIFgAaZYBh3lG0rzYt12YFlZgm3bs
	ZyUHNZQ9JMCsoS290SNii3sf3W2TrT/s0SImDnd7/V00/zNNJ1K66R2vc634+T+5yDA8vogen89
	YQZkKYg3uYARoY6tMnLx3cBDG8O0urnSUypzyK5W/BKuHmZhQI47BrVojKm/ULOASw6/1DIl7ke
	g==
X-Received: by 2002:a05:6808:538a:b0:55b:f8cc:aef1 with SMTP id 5614622812f47-56b968c25c3mr4273774b6e.15.1794446937779;
        Wed, 11 Nov 2026 17:28:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:05 -0700
Subject: [PATCH v3 26/58] mtd: rawnand: vf610: retain open-handle state on
 removal
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-26-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, Stefan Agner <stefan@agner.ch>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep managed register, IRQ and clock teardown after chip disconnection.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 57da9eab940e..16e84ade92db 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -813,15 +813,17 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, nfc);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
 	mtd = nand_to_mtd(chip);
 
-	mtd->owner = THIS_MODULE;
 	mtd->parent_dev = nfc->dev;
 	mtd->name = DRV_NAME;
 
@@ -873,7 +875,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +886,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_lifetime(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +910,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

