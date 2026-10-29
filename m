Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793275438;
	b=mc5a2oIQejcOvTgc3DKRks0K7p/SAcRwUFIorxTaZIsSTSqPB9zAz21Wz4liXOTPxleX
	 Szj+fO4gyC9CYGj7S37pQ4loaPoP/56p6jVEHJOSh3hUK/QN/lu9s8yxs8NdHFJvQ9spA
	 +sADqeGIQl8O8TPUk/Puqzz5oVQeQLshHUKyfHjdam3sM4imWq+6Qo3kkPRJx8rjgEBWu
	 JzjIoNE7JlPa0bvKH9YAdBwse4ZmLXic0LxtECholitFve6lCDn7LEwOeeUl3b3VzOLhM
	 9LJmBvOG4O01u27SKy2e6hEM3gr8epoVEcTHkEJvIK1WtnuR6kKXCBsklORbJlZhqwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R99c13rJmmVI5HHtTBBCwH1hsxjSn5bH0+cO75Pba6I=;
	b=azHWpWVttE52T+Q18EtDObDpnv8Tw3x5wUtmvtfNb6YYyQ1zCt7xnBTEPBbaAhbDT9nS
	 MotVpG+3MjqmWTlhcFvLhbF76VxhYEA0Kf0zR/Xu5x9JthwRz6AAYlY+m1SnwIgENiPiJ
	 4Y3iy1wP79kvrWYhGZwt9NhpUDRilaPjEbBaSKModSnUWO7+AlMVhuOBzq2nf6O0oYZhF
	 YviYuDI1K+LmL5sYBZ11L4RwLEMTr/7nACcu4ZSgvlQ1yQftDHjdVBj+yYWC5KaWOiD36
	 n42CYcNMx3xbDaoSQYeit8zEAjYRRp6rgcEFvxLcEHCIWKITpg0qaGEEnt4YT++/IFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Bas1/oCy";
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D53606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D53606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bas1/oCy
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-881269371acso317359b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793275437; x=1793880237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R99c13rJmmVI5HHtTBBCwH1hsxjSn5bH0+cO75Pba6I=;
        b=Bas1/oCyz1qehEL8K13H3zpuGtpX7Xvg7nETbi2LyQMQq0bKMCoyoJ20TsJyTd4vIS
         tuR6qWORPZmwyR33/RQRvhOxerkJ0vxi7L86QrrX1Gq5UhlTPNBsn9OeBI3sRDrqJnTH
         43gAl9+wwpt7ASsGvRirCnLBapuWIvdSdjasHyEpVBZWDP5bdKu0QEs9KNOPz/K6/Bhk
         wxKQ73DKkesMkSepbjbCNwJG8lwtaYd9qSusxQK/aujgGfj82P3wQ8Xg/SiQ80G8Uscr
         az1ndANFn0sNZ2BLxN4uuOpvnyLgyxEqyKIXhvvfxMQ5eMq4AkJCfwObjWfDT8EfnE7V
         EVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275437; x=1793880237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R99c13rJmmVI5HHtTBBCwH1hsxjSn5bH0+cO75Pba6I=;
        b=ykgvS9UbrRb3HVvBnZYnotw/5JaPOqNpxPFSIQ+CF4mHaRh7XDyQwfNLF5YuQinDKt
         3v52JxhcokrQK4h+WSoYuqOQv5J7J4JGF95a3pl8VnrdsOwWVa7ebDxmCuFLLygrii10
         xNoL6qsqDBhqoUUINJ+97/IPagFsNi46xlaQe3rUxFDWl24toDggRzyY+37ltLLXEVzP
         EeGX/wSVrqt0M2fQX4gLLvls162R6Kd4bKzSN9CHzcnWEtwhd5I6SPHOQcbsXhMu8pdF
         LkpKhHoljhWk0gdH9UPjLIsUGMy/U4dJfTO0g6IuqyCvuZh5njQL9fax6CjVbEmeeeUl
         7fkA==
X-Forwarded-Encrypted: i=1; AKwUvBxcCGJBhAEpnj7g+Mfmq5x/NlxhWhQc/QzQbKk9Ku0yd+RbAZXwrW8JLV+EvM3tJpSFvO8t9wnAXQkwVmA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQT3U8M+Fh9zECn1Rqa+LJyEJtRC9hCNhbVUedYTS/rnFVQJzN
	LPF3ZdWLvti58EpPf99lT1WREGZYoVrf1eeQ+lWpf4tAZpgZA65IGQM=
X-Gm-Gg: AYBFou1So+HlyPs9kfn2vOW+HN3PT9RB6vnEDVzgrlC1N1GQv8eNy5e+bQCCFq2D79k
	UCPq4CsBbUxGErkVGeqyO289z1nR5RfEtF/98DfjIxIjcurDRUbxOCEMRBJoShAcr9UpgYao7pB
	vkN73EgwSPrbYtpxybrbFdVTQZCKE+40eMAMoYFOAeT7fsqpel80utnTqiYuOuPvzU0g/AnE2Ic
	NXVpI/oHeCYwbgtT5BOzJB0v8zlCV4UvX5JSC+CX9RAoYAgsgF4Nd0++zCpoQo7M1knuIfXaaNG
	3WMYO+ASGA3y0y47fycBgDVIoax2HUGnIOv+EQrA3AGMw44Zif68IsLXeTxarkjywIL4PrxEzQ/
	BEW25xcumKk5nm25MqAFQwdY75Hf5uIjHtzdbVKccqFqh3jwdt8jWPMB5YUGCHXcvbAuj+HQ2VA
	c3O/J689DXV/awrpR4Xj/6WH7UWEKY7Lkcgpeu/EMRo9fXVI1M7DtbGfEx7p3HZ51vcCTfFkyyg
	AofG3WxxQu5qWMEb1XkNtBWBKG2Jvsh6lRNjkudeEcvq3pGa9sBpH2oeWn/4ENHoUqlz0OKiSKk
	3+cl8uge2nNJ7dXgyf/wYUempb/fB1049sk0+5GRc77CSgDCs5RZauijPSvQxUfctE4f
X-Received: by 2002:a05:6a20:3c8e:b0:3e5:5ba7:2e7e with SMTP id adf61e73a8af0-3e913da5fdfmr1811507637.51.1793275437374;
        Thu, 29 Oct 2026 05:03:57 -0700 (PDT)
Received: from localhost.localdomain ([2406:3003:2002:639c:7583:67d7:1072:ccc0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cccbaaa9sm5188758a12.23.2026.10.29.05.03.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 05:03:56 -0700 (PDT)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] mtd: rawnand: omap2: release the ELM device node reference
Date: Thu, 29 Oct 2026 20:03:47 +0800
Message-ID: <rc-review-20261029-ai12-12-5b57d6320701@gmail.com>
X-Mailer: git-send-email 2.50.1
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

omap_get_dt_info() acquires an ELM node reference through ti,elm-id
or the legacy elm_id phandle, but never releases it. The existing
put_device(info->elm_dev) releases a separate device reference.

Register a managed of_node_put() action immediately after parsing the
phandle. This releases the node on later parsing and probe failures
and after NAND cleanup on unbind. If action registration fails,
devm_add_action_or_reset() releases the reference immediately.

Fixes: c9711ec5250b ("mtd: nand: omap: Clean up device tree support")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261016 (2efb7a11f1aa).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
The object was built from this exact base with the patch applied.
No full kernel or module-link, hardware or runtime test was performed.

 drivers/mtd/nand/raw/omap2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 4fa89aee934ebed9d04dd37e441243b6779af042..25414390af6174bc5f5e4b6b6c4fe516ac646cb8 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -1669,6 +1669,11 @@ static const char * const nand_xfer_types[] = {
 	[NAND_OMAP_PREFETCH_IRQ] = "prefetch-irq",
 };
 
+static void omap_put_elm_node(void *data)
+{
+	of_node_put(data);
+}
+
 static int omap_get_dt_info(struct device *dev, struct omap_nand_info *info)
 {
 	struct device_node *child = dev->of_node;
@@ -1691,6 +1696,10 @@ static int omap_get_dt_info(struct device *dev, struct omap_nand_info *info)
 			dev_dbg(dev, "ti,elm-id not in DT\n");
 	}
 
+	i = devm_add_action_or_reset(dev, omap_put_elm_node, info->elm_of_node);
+	if (i)
+		return i;
+
 	/* select ecc-scheme for NAND */
 	if (of_property_read_string(child, "ti,nand-ecc-opt", &s)) {
 		dev_err(dev, "ti,nand-ecc-opt not found\n");

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
