Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593728;
	b=y8WffZclBuSiuwM8a6yN4Ih4qHwryRZHkI5D6JhNCHdyEnR3rtB0iNgxRHXL7oxpLCgj
	 ezHuhcrJBPeiwyPN1NT0b39dBnNGx92skDDhtxUC2NGC+Zt29ryVeZeVdDP8i6TyfJ5yc
	 8/Sgb7ixKVBi1YRyPczPM50tvh3eUhhIZMlprzvs2ODD4uTRCE2pOD55iofYL8ys/oGM9
	 Tv3zK2qMN+QSeLmx1Bm100mOyaVw/0/q+d8co5cz57NVJS1OKh1qCrb+UBQZi7m0ysPUm
	 zFK9RqZdD/AjK8VqCUS2TL+wxV/rOcK8iRfEK/Z4hO9KTtXttkmaGGQhHovJS9DGgYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
	b=Pj4+yCcvG/IeJN08/vIOu/vmfcjDulqAbS60g9/rvGLZoldAuuB+PvW3jjDAa2oQkILA
	 T8m3/7Ah+gyjRfHoZaTdkD7JA/eqdRq4DndQaZTDFKGzxQDRu1pmmJcL4ijwEIJi0zymY
	 UwkKEpnY0R92uLejWD9LA562u5ha2r0kuns1FlUL0rJNUe2h3TiGUXIToc82LJV32E6+k
	 +sRLShkHU30WyOGeRduTpxtVjYacoqqi1THfK3/7G3ArXsP/NN5dpTCsUKEDMOGrFcZz4
	 qULSWXpbnX9n9EaMNAU7H9pv/krAB8wRzYr5HOWBPUMwvDhnRW2Gon9x73iH7s087ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfy8NEs+;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1F160A3823
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A1F160A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfy8NEs+
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8628b63dd60so389934a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593727; x=1795198527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=sfy8NEs+Pto62Hfs/FKPx7wW3mNyfhMT6TfiaQ0Ue2IMsAQcyKJm7o0UjqpcJVmLRb
         nOqA9Y925BrUyIfJOKTChz/75uf3eYhw7aWs+0z7eZ5H9ZmtB6e7x7b/MO/ByPb5DHMC
         DTJZKiRz3nSdpA2ZYf/YrGAY0ljHL+B8KNBg/PNuboRi/JeJl1P6fblS8f63DqZTMppN
         o8j3DSXL4aig6FKFrlAXMBj7/7j0Oy3E3k1HgtU91zf3DMuni3tVejhA0Z8jS9Os3GCB
         nh9XsFw3xXLOhnbgnoV103gXxAxpyYzfovtzJ8quiA/et6o6hM7yFZgOhGR9lZQ0aB0+
         BJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593727; x=1795198527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=rt1nvRm+gRtMZyFF/sHLEKUb6qqGwg1YobQQ+E07RBZVmxLDh6vBze6VIQ31ryCAiS
         lub19djZy1OW4S1k4qVMKuddq4xU4a08KCnw+a9AOwkNpmCcz6I7To0DKjJBqx3LZYyR
         RKj3NFXQcMHahyAIVOcpKTyyxaoM4e8PEGnS8tBpPXqKAI+DZ5teXfJ/X3U0gAlUbXam
         IT0hgtELGrkznylP85d5yviyPKJxUj/99536mkhsXYLqVoWvpV7NXElL6TH23qT2W5AP
         vp0Gvsl6o1iS3/oVNi1t8XA0x8cYABVBdKLFrycN7ldz22ZgM/Aeusz87xZX94cDcRNl
         1qwQ==
X-Forwarded-Encrypted: i=1; AL+hErFSz8B9k9uE+m/2BVRPx0xi2wvPXUnEaXtBCC5i8GF7/ImH0OiUN0y5H6pFL01zhXsoQXk2zC4/XBvyX6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z96Ki+NTQS+aMubdQAPdRerq4At4JZIPamuE9a3jHRVym/sJUTq
	Oi+Klt4USRMlb1Fd/E8jlZkvg1gWR3DOLjR5Zmi8cRkU1+RiAbas05b4aHos9PgR
X-Gm-Gg: AYBFou1DpSfMIdEYlnydDETgdXXCYMG+ICF3Xv81sWjkyGOI+Vu6O3eB1JnX54tq4a4
	kth7bvun27YZws1drkuUBxRj0h7hUjSOUbTIRF76aykxeiFXz6/tHfU3HtNuVOmBIq2kw3QSru4
	b7qhOUIIuAeaWeLRG+5zrcT4fOZE/RyH+PAaC1j2vtmgujgnM9er6k18tqw0oI32enVxzIZlV7C
	aX1yHp+F+bVWegdIQgQnJkUDI5xEO0yE/3pam5C4a4bJ9w6BmWFyWCgq/Nv+MeFFsQe98V+PPMS
	vtqJNNPebkn4VWv8Pl+YyelzRBHo3V2iatwXhJkbnWuc9AUfemF5UH1EJ+bRCUgpVTPLyPswmtN
	g2/0D/cYxuUvo4dmru0XttY/Pa+WSl/Q84CukLaiy11oAkjcljgy9Y3r99VTNHyLPTzvLlcznlj
	J9t8cDK8oYvXQGV4/uX9IUJlFQ3INJ0LarGCG09v8COAkWmTLxL9AWuMpPIE36WYkZ0cQfpP0zV
	MkRRdfvaH4wzA1hauoFyseo8jXAOhLQzx7QQOHUvTz4VcmOd5i7HVbYRxRKnoYV+Qw3avJQ/M8r
	UKUWonGwVsyK6cLJWMkI5u2prb9h3cWcPXiRx5rR+0I2+5ErE1LuGa9AG+RvVl7pPXUEA1voEEu
	SEgVRGOgHIe9Hp4uzAklO9/yF2PRaCbImJYSLSZb2SUy7rFs/wpHaAhCkBex1unVtMeJyyAKZ03
	Za8GsOocyjKhXDl+NOdmP1LHSh6jqiiH/XVTdPm/fZhxrZXqLAVA4=
X-Received: by 2002:a05:6830:924:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-862895381c3mr3936909a34.0.1794593727221;
        Fri, 13 Nov 2026 10:15:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:26 -0700
Subject: [PATCH v4 10/58] mtd: rawnand: stm32_fmc2: retain open-handle
 state on removal
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-10-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.15.2

Keep the embedded NAND chip and controller serialization state alive for
MTD references that survive unbind. Disconnect operations before
releasing DMA channels and scatterlists and asserting write protection;
run NAND cleanup during disconnection and retain the core-owned layout
and controller storage until the final reference.

Preserve immediate cleanup before publication and use the retained
lifetime after MTD registration has been attempted.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Christophe Kerello <christophe.kerello@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 78af58d87960..2b8c0b467f7b 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1915,12 +1915,14 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	int chip_cs, mem_region, ret, irq;
 	int start_region = 0;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->base, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
 
 	nfc->data = of_device_get_match_data(dev);
@@ -2024,9 +2026,15 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wp_enable;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_wp_enable;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -2061,7 +2069,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	if (nfc->dma_ecc_ch)
 		dma_release_channel(nfc->dma_ecc_ch);
@@ -2074,6 +2082,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	sg_free_table(&nfc->dma_ecc_sg);
 
 	stm32_fmc2_nfc_wp_enable(nand);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int stm32_fmc2_nfc_suspend(struct device *dev)

-- 
2.53.0

