Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810629;
	b=iPJlu8amkSF9s/mbx7OvcCoCTPuA81HT6ku4sfbTMn9mpDRmO/KGzXqGX/ne/nyey4tQ
	 trELWeqgD9YgA6qBI1+NEyHNu+nlsDhsvT4u+zywsuYcf11mRxiuEAHerDputBh3R/fF8
	 u4hQLEv4KsHFK6jnD9FneoBxma0RMzEA2eKCwss5OHyUD5xnLETXS3Vk19pLJaFRyCYbG
	 bUzd0qyG091f6bgHJHLApEG7FDIZdEtlxQ1GTNJtcCWz8FoN14YU+ES9EJYvBB90oCxEG
	 4hFsQUkl/BLIUQ1AkblFVRW3cd3LCw6hLwWvH+qTd1Af8BaXacbcQWYWQxHvBATmFgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=;
	b=jENlCQw3KcfXxNQPJB4zd6L2/BkYQsi2vOKlcni/JiL7iTJ3U6uIKKkSkdDoTH4CHzhi
	 iaFt+bgPUwpTnI1IJV5Nuu/XwG8T1vPnR6quUteaTpE17GZffgpTCu3fhE9LBWlhcv8j9
	 suEuPiRFUw72yclBg/qY0GSSeqz/YRMyiTSkBhDqiTtw3RVvKaEdgXRR66myY1BUuDX7j
	 HuOUJqwL751wbcZFl2AEIj8PaZi8ZjSnmUH/Po66g/dv8JZqFqNJAvpHzODG8CaSEPXD1
	 gDcWpjAj69RxUN0wekgj4vBYFhZ5BL82TKUbKpA5nkbbhYMvxHopscAUd3DNaPtNcfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DbmThgtU;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930EC606C48F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 930EC606C48F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DbmThgtU
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-71ab5e64742so2622457eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810627; x=1795415427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=;
        b=DbmThgtU6mbIxBxeNorRmyd+j05l3nW4vcbX66h1l9htzYqKt8OcK2m2Wr/EZumq2p
         k0J1mBDBfovRB5gE07qr6QXsQc8huHHJXi5mhfDgZ7CpeFUMpQhbxLZ+nMmBNcoARPeC
         P6R0PmTZ3q8RTPQE7QtmOTBuZKqp3ylaWdSDQ0lzE3vkTlPGR+99Hb5bmZKu4jttz+Ry
         Hgfd/xHfLJHlNazAUSDh4MMW6n+Ia1ESLHUYNKPSd+yyR37ZhgKT6xPNXvYIjKWXcppo
         fKB9B8cB+1iSNqw1gFiRuPsgt3XODr8E4rWip9iqe0e7Cp/wRt8mLIyqgevX16E5DVoI
         uLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810627; x=1795415427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=;
        b=oR1rm9h9sjQuIjnDTHI25Vr39M/e8lVTENyDAmPFp7TxMCrdYijjGyEa6O8uDMrptS
         /p7o3vgcJFSBBRaVrD9UelmCmiyJQgGHHDKRbbMIROvO6ygLlQQeQNTWBdIZFIG8OJMV
         QqFl+SqWBKCixxaJaSZv+7EvRNjuuz/+ZPNkKOk+n5jlDlDYIqN7Hp1MCq8N8ql1/M4V
         wn5vDxwf7qdAGzCSFtaqZ1VhNO1D8mwCKNM/RdpB3xgUz1+72vYwZBe/Jfw4dZA29Vcg
         pSF6ykWBPXNFIn2EjO7ILT47/lPEaV/GHsjFzc48+ilFT5j4uBwcVX100Mvci/lG+/hC
         z/qw==
X-Forwarded-Encrypted: i=1; AL+hErETa+UiXb1x+8QFnu5ER7jQLiU2GTsLDJVhJJvVPxXw2xu5AAXY3nc0qan2zVPnv4xfDgOYkkM29bAJJBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Kg5ddtwjMUo9NmFziZ5+QgL52Bws56+VNtRF6i5xstc7MBmE9
	LSQZorThPKek+2S35QJT9Qazv7l7wI6Sec0DbNX/pus/YJbMvmhKzNoQ
X-Gm-Gg: AYBFou2RRvZylQLuW+CCSDilU6GmODwd43E08yVDC0H5n8XhZywC1k1Z80WC1luSs8l
	GY4qRZdDP/NPKExifGCI3LBGaePr3IYuAEvYa4tOiT7j+hWhjumnyBQsVZCy3DzDeSdROVzg96n
	YSS3A2PtaweoNWqox7f5Cp/7fvtv85SgroBLWhAy8rs/7x5L95KuJdSR3a6Jqoe8Q7f4ua3Tp50
	YkXqwvz3aZzBNukD+4diPPKK6qFN8Mi9XFfB08jXqa+GCcaDPOExxw0kPWepEeyGj0936UrYs5Z
	gTgtXZpY/pl++a7V/nGcfIK3C9lZZ6t7IX/mcw9cEVL5nMo0SPhIQ81qKjX7CwD54L4KZkGVXjU
	Zj9nYrJe63N64RWDFwajpF2wgc8yWbQU/vIibmmi/Lge3Ehq6WSX43y64WGoLK0WNhGS7k7BrVl
	i0idfuCy2gd76j2z4w2FDIFeqmaW/i4qy5vKTAIy2ZZFfMAQpuLzUFl7fLY3ThcJ1zk5JlWmozG
	CX/sUHsPmCZvkdvm/uu2T8GM7pFRCyYHVNPVLIjXjWh5oJ2S1OW1jqz1yUbE/biwmN8wxuEDjxk
	U+g297r2gJNNGBTeYPDE6uWYoiIfT8YoZpr4jQvbFsc0yY7a0PeVmZ5WsGf7ejkmJibVLFL0IfM
	KNhVYJG3KZgAZ0isuha4qauOD6Mb1pJqVbf38hLsSmtr1ghG8oa+7van7w3B8eiXIgeaQ4aixcA
	GdpWy/Rs76LPdHtDdIX1/TQCezHaE7JhpKoA+FRGl88Uswy7L/m98=
X-Received: by 2002:a05:6820:a711:20b0:716:f300:648e with SMTP id 006d021491bc7-71ab4cfcad9mr4542175eaf.5.1794810627415;
        Sun, 15 Nov 2026 22:30:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:49 -0700
Subject: [PATCH v5 34/58] mtd: rawnand: omap2: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-34-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep the shared GPMC lock for bound devices and separately retain each
device's allocation. Disconnected handles return before touching that
lock. Finish software BCH cleanup before releasing DMA and driver code.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/omap2.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index aee7df4d768f..12a978f5f724 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -142,6 +142,7 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 
 struct omap_nand_info {
+	struct nand_storage		storage;
 	struct nand_chip		nand;
 	struct platform_device		*pdev;
 
@@ -2218,10 +2219,12 @@ static int omap_nand_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	void __iomem *vaddr;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(struct omap_nand_info),
-				GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	err = devm_nand_storage_init(dev, &info->storage, info);
+	if (err)
+		return err;
 
 	info->pdev = pdev;
 
@@ -2282,9 +2285,16 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto return_error;
 
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_shared_lifetime(nand_chip, &info->storage);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(nand_chip);
+		rawnand_sw_bch_cleanup(nand_chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	platform_set_drvdata(pdev, mtd);
 
@@ -2294,11 +2304,11 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_cleanup(nand_chip);
 
 return_error:
+	rawnand_sw_bch_cleanup(nand_chip);
+release_dma:
 	if (!IS_ERR_OR_NULL(info->dma))
 		dma_release_channel(info->dma);
 
-	rawnand_sw_bch_cleanup(nand_chip);
-
 	return err;
 }
 
@@ -2308,12 +2318,13 @@ static void omap_nand_remove(struct platform_device *pdev)
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 
+	WARN_ON(mtd_device_unregister(mtd));
+	nand_disconnect(nand_chip);
 	rawnand_sw_bch_cleanup(nand_chip);
 
 	if (info->dma)
 		dma_release_channel(info->dma);
-	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(nand_chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id omap_nand_ids[] = {

-- 
2.53.0

