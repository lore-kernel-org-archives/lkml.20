Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593792;
	b=s0akck8f9he0BttLAA0/W8rEYx32ra7FDgv6xcZEbyDFVTUF8qtjVr5yJraoLqAPIhzM
	 DvoTssnGTgKGJ2hCMdTl/bS0U1M5CMuMkrVliJLNH8Bktgkx194ACrGtrIYX+utu63EWB
	 CuJIvxEJqWXWhwOrB4eWparhsc73e2Ny9vxF5N/VA0XK4uWQWH+XV9xbMVWT5KYXoswkn
	 wi3HDDdrlHIhb0hYtewzrWXLuR3cukU2/UnChI8dcCvXLusF8dD8pKlIWmOecKvknXkOH
	 j3jGRS8y6H896G1Q+kGRnVtuNF4EXioEo1eubMYP0tbuFUS1Dt6rL1W9tTEvSjGjOfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
	b=GG05FoA993WF8bOQk4QQCw/UbalUwS39ou8TdQ/++TuM7hS6jNLvSvg2jCxGa8nhkpHe
	 hao+Y19HuDpUOhy7/Ewr3JHdVwRUli5Wf7xTYrBG7myWVA1NZs9KJNJLhjReKmL0bZ3Jm
	 avADbu9pYXA78YOUcsLiwbaTW6SMo9FpdSpjYoecwyhaemIHwxXf74puDdZU+ODEyjI7O
	 Bur5KIKTdcrKQU9aLKfuk+ZiCLXfU0/D6+Ff4AcX8eSWs8UqiPuEvwWABTOocJZLiR7hW
	 LXZgOBkWk98ofEPIaqQmoi5DTcbJaFJjfPBf2HAaCiLXQveRd4NbSzo2ibJQsQh9nHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bwzILiuO;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE5560A5BE1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AE5560A5BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bwzILiuO
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8628b63dd60so390395a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593791; x=1795198591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=bwzILiuOux7ediQfNZI5Xukz+bL3OAJivchA8Xr2tclEC6HH+sNPVxu0F+gsZrENq+
         GFt3XP/kyCw78fwRn9ispcRtqsbUmUjsbIVz9+4V/hYoqXK1+m03QrHfYO0XS9h11P9t
         Lvx/4IV4sCx2QIfEX9q8Y22jT21nC8Fzx3GK9cKfSleQvZehXEqOnAZ1+Ye/8qWbP4N8
         hkVCnBcM536cXMiN8SIjCu83UVkWeyOAcIhUTCzsHG07f/N1Dg8htwHUnlFWEwKVswPI
         fpriaUYrlQZncF8b60zXafKwERhNvIkxnMSaJ59RAcQkbvgyrY5V7KEfSG9P/WdbtYJK
         IM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593791; x=1795198591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=W1aqkhKENqP9XAaEoLewG+LJGXABaXLXB62GSA873ZkVkmeXIeQSfRQxMyjANxIr4d
         +sJRd+bJmONuJ9SB3O2UWzEzTYCDbkj1Q5PksZY4UPsSmxreT05rBb8Yw+IpMa6ORAsZ
         TLqGzfbipZd6m7SMTTS5paUh9h9EzsVlJbqWLgeP6cnnx8rjqcWb5O1hM4IIqaxqSm37
         zFAVoO/VWvCOC/rQo9a3mVCjBkqmQrDeG7Sqeo0KOy427ggGkGLJQutoICxcxu1O/ihX
         o6PHIjn95uDBh8Sz/d9tACG1zhZbaDlnbTN7VDo14HFc9wxjkOnt56Cr0ft6Gywwiwcn
         XOCg==
X-Forwarded-Encrypted: i=1; AL+hErFrIRjidlDIUGZgkuyqphFrwHJAI++qJvrW2M79hLo1SYBgWMLfHQoKkj0DQ9Wp1I+kJvrszSVC1qMi3es=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wwd3o4V4o/zdCmhU2ATqh4TMQhXyJ7xi5nt7ijo8vyb/1voJc
	xtpn5P46+6BlQYlITpqUPWFEzv459go7a7QH9PkNBPp1qFkDUl4O/PhGACSvZAVD
X-Gm-Gg: AYBFou0PU9X87z0+k0vv6gl5o/KtyGGIHJOhxGISuBeC2GDWlKDldFLl9BO71MspVDQ
	cx7UW8T2qNRNL3fzYpjYQcDW6nh9jCShcT+8MOc3FtM4K12ivBX4+rQRydfHgF3AfbbbkosimbE
	CVX8IYvyYveVGm9/gBdnxBXhBPf5xpgS2u0ZkYZv8RfOv27oo1hPKOLYWl9SjQGNdx1zh4Wf0ea
	zQrW0OGprvQNN9F1qCMN7oYy3zTay0+NcdSN7vDpujd8pWficyXmiZGztYSFwFUkO4OUeC43XCv
	eEiqCtHIbjqmTAKQfPqZZsOC8SdW9x6zKrMz02ct4kklWRmjEjPPqvWVSrFjXBMnetdOzIB3WXE
	SRnGOl64pEwm0k8fhvefEiKVcfhoA5KTkQcFfh1SyM8SyxFO+LneTX5KbhOHh4ejybOjD8k9Uxz
	/qJ6JBJCl23e2jqceeSgvnPZf2iwqaESsUNeZxfNnbMrdKkrBC1vsziVBeZBU+fKhFHqhZyFiHl
	S3jaco1YOMcVngPdxoAsaGCXn0iIzOBJM5AaJZvmop2/slRJ8WYkL9huPhwxkzFDCRekR2eZ/57
	HShCY6HA18lwextqOECon2+opmIK+zZpnHPU+e7CNnmeT5GpRU3mXDO73NgFB0bu+FWI4hv+1Ld
	qAXL5+iMMlcpPfxIHb/C8o+zMDw7P9+x/hclEDg5G/1gSFrIrwb8Y92ZuA1M6mtSLvZSJimrJ3x
	o9r9BauNfzOEkgss9gQMEKNUmr11tv3RgF264rjhcN6vENGs5sbCQ=
X-Received: by 2002:a05:6830:640e:b0:861:5b84:4fab with SMTP id 46e09a7af769-862899619c8mr3027224a34.27.1794593791193;
        Fri, 13 Nov 2026 10:16:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:03 -0700
Subject: [PATCH v4 47/58] mtd: rawnand: lpc32xx_mlc: retain chip state
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-47-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.15.2

Drain chip operations before releasing interrupts, DMA and controller
resources. Retain the embedded NAND chip and controller until the final
MTD reference releases their metadata.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 408b2aba2fdd..633d09471760 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -687,9 +687,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	nand_chip = &host->nand_chip;
+	nand_chip->controller = &nand_chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, nand_chip->controller, host);
+	if (res)
+		return res;
 
 	host->pdev = pdev;
 
@@ -794,10 +799,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	mtd->name = DRV_NAME;
 
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_lifetime(nand_chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto free_irq;
+	}
 
 	return 0;
 
@@ -830,7 +841,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	free_irq(host->irq, host);
 	if (use_dma)
@@ -841,6 +852,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	lpc32xx_wp_enable(host);
 	gpiod_put(host->wp_gpio);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0

