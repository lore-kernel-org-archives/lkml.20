Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594376;
	b=Onczg2+NrdNEFvhem5msYaYbaLZpbTg9WacYydaH/aHF++u9U/wEidLbbh15GGyt5J6v
	 FwEGjKoybfAvMd/HbWo7aA4zIwcqv0s11R/eemq9hiI9qblWPr6kvYBP89RLAdqDXg81I
	 BsLtpWIkIWWyag3eVdVYpuocfTUNv3T2UrEtCXb8tWZnc0nkJK5DO7uKrdwbxfkifG/ky
	 qM16HuvZ3xB89oZe/QIPyh7kl3LuG21O0fojMmFs0WAEOVPzOWg9W3Kk9oa7wXmV30EIk
	 fZkukMj/Hwt1JYpqR1SYTuiwvuk7KlS2H9WoSCSxIVqS+JLP+TVywAwDfIGTTB6ElRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=;
	b=OJKSHCqihhjVaCIFphsdjB4UEag62Nxiz6lkUs8OddW3APzsSLDVnxWfDxXlAkOypthV
	 xh6p+xSIwlAEjGI4GTwSQ2Er/pNOZsa6Q9HUfunAf3IdzQCUTqbKtWT6gHD0L9uq9Sl0y
	 Y8xplbB5Y49Iydk32CrJ8RPbzwgOuo1ElZ+7ltaFcU/o1gx6w4gnaip84QLKRaVF36Fgr
	 RGzDdWXUbUwOwfogqIrXEK4HgWazPerpEpcWViSKOdwQO3Cf5q7Le/gZj4QBOT5qrF1NJ
	 CNQxHvbyLDSZyo03OLCDvbFE5MEUfyLTwnNo15yGhaMGMk9zXf7YtAmiv1gCG2kv0oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkIHq+Gm;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E693360A3817
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E693360A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkIHq+Gm
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71ac9e15640so384756eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594375; x=1795199175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=;
        b=hkIHq+GmYHcjl3bokx2I3WQqPl6A03Qce2BjrM6ATvm/f+VOWP9Xj1KBH7+9XzUW6h
         RoIWnO8/ctGu62A3tb2V0ZGyRsRm//paum4PoLUb6crtFULNWknXMEPSDo/GHqXivch6
         YCqNyawqwAvbZfjtQMaUduD9/4xCVO3M/dUnxCQ28P9YoxqTy+XpOH5VzrlcsiyUV5LB
         2J2kg7CqvZQ7Z1wwFR9R36dQqKjgZeiAt77KRRY1iCMEskSJbRNdR4Yh6Ec7cIX9io3y
         SkEng0dEdUG8fDmtJ12H+MSqGWrQh1APhm5LZhtGzZl+yreknz8F14Bo/glwQlZjOldo
         kkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594375; x=1795199175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=;
        b=II80tUfbalwDpLJCpL51urWHpJbV7KvBPsUK70zwe3PETm59uXG88iSckgZTipfajr
         LdGiDKBg/+r44uYvty0p1N+GH+2D8nUyypOMDNseirVxG98sZ9TquxIodvZY6/659L6K
         mxXCnNrHc2LwDWDSuL5DtOshahm7eUzmr+f84WppxCVCa8iwONTOrgN/5JSneZlkKjQ3
         uQ2G5mdgIn3en3YdqqYygokPmcO+1gKBWvLx5Togq9fK14ag0VT5hW20BhZLgifHi/at
         wnLw5S6uV+LTYgKYUkhx4iHSYd1TsP3/lfWeclDj+8GGh721uHyh/5waMg1JKkt+uHH6
         XIWg==
X-Forwarded-Encrypted: i=1; AL+hErEqoNNM+V5RGES79U4SOnF2DLzV+2YOCl68a6zfQ+gm0HNenJjlcfpt5TexdV+Kmp4Gd8OcwC2oFwYZkoU=@vger.kernel.org
X-Gm-Message-State: APuU4Z93ycQ87qZuv9oSFXp4OFr/YXjq5dVwWs9xTzo/pGPuPd9joFCX
	6TOZcT1lPhsPiWUNjT5AjNBLJa7geEb5GwcIdpxUH7bAGghfkpmpcI1r
X-Gm-Gg: AYBFou1K12vvML69oQXuAL+aeZfRJutETGuQ9GcsOIfahf7fJqA00/ylBlWkegdrar5
	P4ncuL5XYHWijO7X7nA1DELa9moT526QP2i4Op//I48k1LkvckEjVYQ6GUmwycevpn3S+5wgjTn
	QXBIA0Q2BElWpzdh9FGao53iUsotwMfoolD1nSrPms73utT8G+z6Mty9vLybv7RsdFHPMmCZbNs
	IO0Ot2WQx4+VhcVJqFT14slSu/jAb0Q2R4tLl/Jxw3GQi6Ewjk/O0oHdMBqrsWde91h0HK9ZLb8
	9fwOAomsgRBdxozzDawVw/ickxKMRbCD6v4n5uOdWWfdl0IJSnhvdFGIZdF211+11vPHCzBZKGd
	DDw8xVkNGnh9iS6N+trmfhaaYzniD4Ol8M/3DZNhWHwDJh1krtqRWjiAPSBhHsiyrZWH8zDdH3S
	L/WHxCzWSKEOn/+0/Wcxsfz9Rv8DjQGQCU1msaU1xs5AYKwdo4NJcJeePDLD1x7WhC5ZfASMx8p
	qAVbnzBsIMymq738N4YIG1nEiQXmSaq/ZdDeAPSEZ1Y/C+MEvaU0/2alLmjMA9Eaze26ilTR0Fz
	CjoL0hTew4FJ/Mo/Ji1nl9k5O9YOf5KX7KBIBgi0Qx2Gw0Nzepx62QOjqE9a07cb1OPEXzaYvdG
	HUpVpcSCjUlsstoic2IP09VihgXgZkEn6A58VeMZgIc3oKuLoDv1Hj01kolwgpg9fBbfrD5LT2t
	Bjdk/LhYVM7XM2WtvHYG5jN1I6pDJ5UVLUDax1Tt5xucNOx/t49Po=
X-Received: by 2002:a05:6820:a285:10b0:716:f44b:2dd6 with SMTP id 006d021491bc7-71ab4fe1152mr1411891eaf.25.1794594374727;
        Fri, 13 Nov 2026 10:26:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:05 -0700
Subject: [PATCH v4 49/58] mtd: rawnand: txx9ndfmc: retain chip state across
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
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-49-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Retain each chip and its shared controller while MTD references remain.
Unregister and disconnect before dropping driver ownership, and check
MTD registration failure without publishing partially initialized chip
slots.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/txx9ndfmc.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 6fd6e530c38b..bd0cc30ab820 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -276,17 +276,28 @@ static const struct nand_controller_ops txx9ndfmc_controller_ops = {
 	.attach_chip = txx9ndfmc_attach_chip,
 };
 
+static void txx9ndfmc_chip_release(struct nand_chip *chip)
+{
+	struct txx9ndfmc_priv *priv = nand_get_controller_data(chip);
+
+	kfree(priv->mtdname);
+	kfree(priv);
+}
+
 static int txx9ndfmc_probe(struct platform_device *dev)
 {
 	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
 	int hold, spw;
-	int i;
+	int i, ret;
 	struct txx9ndfmc_drvdata *drvdata;
 	unsigned long gbusclk = plat->gbus_clock;
 
-	drvdata = devm_kzalloc(&dev->dev, sizeof(*drvdata), GFP_KERNEL);
+	drvdata = kzalloc_obj(*drvdata);
 	if (!drvdata)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &drvdata->controller, drvdata);
+	if (ret)
+		return ret;
 	drvdata->base = devm_platform_ioremap_resource(dev, 0);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
@@ -306,7 +317,6 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 	dev_info(&dev->dev, "CLK:%ldMHz HOLD:%d SPW:%d\n",
 		 (gbusclk + 500000) / 1000000, hold, spw);
 
-	nand_controller_init(&drvdata->controller);
 	drvdata->controller.ops = &txx9ndfmc_controller_ops;
 
 	platform_set_drvdata(dev, drvdata);
@@ -361,7 +371,20 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-		mtd_device_register(mtd, NULL, 0);
+		ret = nand_set_lifetime(chip, txx9_priv);
+		if (ret) {
+			nand_cleanup(chip);
+			txx9ndfmc_chip_release(chip);
+			continue;
+		}
+		kfree(txx9_priv->mtdname);
+		txx9_priv->mtdname = NULL;
+		ret = mtd_device_register(mtd, NULL, 0);
+		if (ret) {
+			nand_disconnect(chip);
+			mtd_put_master(mtd);
+			continue;
+		}
 		drvdata->mtds[i] = mtd;
 	}
 
@@ -376,18 +399,16 @@ static void txx9ndfmc_remove(struct platform_device *dev)
 	for (i = 0; i < MAX_TXX9NDFMC_DEV; i++) {
 		struct mtd_info *mtd = drvdata->mtds[i];
 		struct nand_chip *chip;
-		struct txx9ndfmc_priv *txx9_priv;
 
 		if (!mtd)
 			continue;
 		chip = mtd_to_nand(mtd);
-		txx9_priv = nand_get_controller_data(chip);
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
-		kfree(txx9_priv->mtdname);
-		kfree(txx9_priv);
+		nand_disconnect(chip);
+		drvdata->mtds[i] = NULL;
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0

