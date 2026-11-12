Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446929;
	b=uDrf3HU/hQdnR1GH6PnR1WXOV7VLRrMoWv+RIn8fcXgz64hRQ/+7pExVt67AHEjj9vcH
	 R3XVePdrUICQyZIcl3BxI5YLrc/DcRz6ZXMSUdMT/jdx9fQ3dssi9hQ4P+4kPT5fVFrhF
	 m7hdGX19Uo+Zbccz+PVchzRrVbZqK5uVTt2uOUFI3GqSar4yHhJZDgT6omg7+e8KDx9j1
	 hOVVR6pKr7K/fPlY7HBGypDvXNb3EQABesb6zjdGdY7DsK3uTM7CwaBqbEfZE/Y0J7koX
	 Hnbk8xCrP/cMclRNTpQgjn/xiNjhgU6xuwLyCoc6AgBKj6Qk3/uzdFh7/cZkFniE4BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=;
	b=jb+bBVvg/nWRRUt8hsxXDoDs1R5ivKbATE7Z41euinG2U7G6h7AX0D7OPIYKbKoUMTux
	 UMAOP+Bs3R0bN3uQUYjVJarUeDUaYBUk2VGrky76GmbGX82gcT+15muOl9r/k0RHsEV/7
	 fKs3jduE09BBKEI993uwvQv0mZgNKPmCB38XXMd/Rc/vxpEilEtldNu//nGbesJqo9hSn
	 FJpr9y/diSTU67HWyUAWL/LfA54d3cLvuiT9EQJvhdUkj8gc4Ykn2G4Y1Ds11tyrQO+HY
	 ws+IHJE5frRcVZBWW0etBZvKIZcyuJnhJnSRwkKvqMMZWfqhm4Lwz0cVvBQcdS7yAQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=atOHCMfS;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911D760A6F54
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 911D760A6F54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=atOHCMfS
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-53dbe9b8d6eso322172b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446928; x=1795051728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=;
        b=atOHCMfSZhpyrAUTLTg4JOJl9BLly3kSCtgbUXpXoJ1748lG9943ThlBDM1KeKndIY
         SYTxv0dRguU04R3hRvbOyVigROp7y9eDVx5QpyBGYnrayD57MGujUw7E/cJhBOHD7Gmo
         vvULRMObZimdOdsHb5Jj69ZHx8mrPR7JRZoZODc5rXr+yqvJkfHYnxoY1kTTeNIre4rU
         p541Rq1HwrsRxV2f4QO23BhO99M1FSZtDbzw4sGSxwPWcWJ24+tFEwO7H+9bPj5e7JkR
         X+q5QytnwJDKGg78bz85l9/TrcdsaAuIduCw9Xen3uzUrV7uFq43w7irSiB99fs8yHvh
         0IPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446928; x=1795051728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=;
        b=DaHykTs1Pawy9cd/y5mmiRdMkxJ2uvEsFSh65jMZ4ldYmBeDI3j+Y7mpGrCR/MjP7Z
         WR8+41a4jFrTM9QIJ7TL/tADEyP1pGEGVYce0jNvx4vSDj5QYNA1eoOEvqh1eJSUBPdL
         cY9aN+bukTzO4UUayqzj1cuqqN2aU6/5+KDs4pS2Ymc5oFx6yRJBxs32xoIPHy2ZoXNg
         oS9sKscRbJSmOOYEt4Ty2/Lj3dGGbxZKdVIzMmA6rdlM7fX7Zziy5uXAaZu6ZmokTHrK
         mDlONXfLDuD3y1m+ZYFFb9girWdXjaxbKTodMyJtod329iYAcmsROozmGyOIQZV6R+zA
         5sBw==
X-Forwarded-Encrypted: i=1; AL+hErFWHWGqQ0BX9aL5GC2ogVzH2vdVn30JsFnUY3LsSvtKvOFPr+WyFXhESNwstHqnttdBQHXYHYqgSnw8zVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A7qkAQpCoMFJq40bKZ8goVmoyMjX0YcmMGw0mE4YQkViBGGg/
	VmBf7ZN4nsCCDbuRFcyxAZjFVXFiim+G7ghY6ymYaZ7yzbZQNOrjPAVR
X-Gm-Gg: AYBFou3g6el+M0gTI/D5zbJqBZ2x3ctTxOrSc9TSIlo6zsdLbNkwJMI9P67oNzw31I6
	HpvNq82tfQri+yErvHuENRgw5VpPA1Dce1K3TxXFvOyVVhM5s16dLgYryk5O74QNCUwPmcKKxH9
	RrwVxqrtXhP7QrzrzcxBWI1ItBVGf/VDg9m9uiww8D3KiUitUOUAyJDyI9aXznpj9XaTjXcrboK
	6heXKkot+8a6gm8TDDpivfEFumt3IIQVDKioiPg/bTC2j9hahkGu1bfecyty3OeS2W78aij5RQ5
	+zSE+iYrcp0KIbHkiJS7I+nVg3bG+Sn6RFPfgTUxQVIo+ydulrmmagDOgUwGqyAegGVusSEmv1i
	I4o5FsRMUfjRECieCeqtlwN/YITC8NG/8HdjJy1alcc7UV/fgg25lgj3/9dC5wrvFeH4sy3Ml3h
	tb3EWcrSdzX3djKjgGdH8pi0EEqXXG6rtw3gHskpnyX1wduzOIJQYk3jNS7/3vKbHlPljoDa0r4
	E/My3uoff0x0RiOEQj7DyDyMq45rJoxSuNlFswV/6osYAUMn+mdcfp11tyj5O8teaFtMWkJcBza
	phPjhzUxhD7Sc9E5dDN9F29LChI/1FIXxWPyK5JizM21xL1aowf3hX8jHarlxZ57PQs0PzYmhH1
	EZ4Ry7EdFxCXT0bJCNMtzgKvWcArl1FGgH5TpVlRty9ZdYeAmNkw4eq8ZzYDgGRiLlETDUvIfww
	N9b6j5kd2PgPVD0RaiPuvfi30BaSa/govGgYLroOQvqsQUNPBvrIDJ
X-Received: by 2002:a05:6808:16a6:b0:4f1:7609:3428 with SMTP id 5614622812f47-56cd8ed2df8mr1107159b6e.49.1794446923858;
        Wed, 11 Nov 2026 17:28:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:53 -0700
Subject: [PATCH v3 14/58] mtd: rawnand: intel: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-14-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: b4 0.15.2

Disconnect NAND operations after unregistering MTD and before disabling
the controller or releasing DMA channels. Retain the embedded chip,
controller lock and NAND metadata until the last MTD reference is
released, including references obtained during a partially successful
probe.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index d8071180cc0d..42a1d85b1cd4 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -585,12 +585,14 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	int ret;
 	u32 cs;
 
-	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
+	ebu_host = kzalloc_obj(*ebu_host);
 	if (!ebu_host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ebu_host->controller, ebu_host);
+	if (ret)
+		return ret;
 
 	ebu_host->dev = dev;
-	nand_controller_init(&ebu_host->controller);
 
 	ebu_host->ebu = devm_platform_ioremap_resource_byname(pdev, "ebunand");
 	if (IS_ERR(ebu_host->ebu))
@@ -692,9 +694,16 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_nand;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(nand, NULL);
 	if (ret)
 		goto err_clean_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		ebu_nand_disable(nand);
+		mtd_put_master(mtd);
+		goto err_cleanup_dma;
+	}
 
 	return 0;
 
@@ -717,9 +726,10 @@ static void ebu_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
 	WARN_ON(ret);
-	nand_cleanup(&ebu_host->chip);
+	nand_disconnect(&ebu_host->chip);
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
+	mtd_put_master(nand_to_mtd(&ebu_host->chip));
 }
 
 static const struct of_device_id ebu_nand_match[] = {

-- 
2.53.0

