Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253710;
	b=AD367UuT9ImCAJTeNI++A6yRybTXWIfte8c18OElVE42Q2kda9u1LsR3xL0/fdBWwnpx
	 lJbM9eyqKJJQhTXP5uBM0Ty/50zq7ct0GqSb3qKplYzlSepJ5RazDudWmw3P0CzARYtAe
	 rnYQYtEOzTjh//CFBU3jG2PvdrgI+X52SWd640xwibiSeeY0CpJ18TIQD5PI7WItCH+pB
	 RGQpZEgmKcvR7UJAEn94f1L5OF/kHElh7F7Ftyxa+jFjaBGBkMlAPptEirYZn/BmlwVfV
	 duVE0kj1QMdQch9G7wLFtme7zOhwYEeM03OotZXqrlSIVYn47U5jag0nKO9MCMYlobQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SaR5dI4b3/Avv5qRMJv+1R+v76FBZqVUZp4EUUEM99Y=;
	b=haCENtAotU5is7C4m79c6n3GWX0lmED/KUHOvWvQEi5RWqXd3E9+1/Ca7rdXZMiWxyNN
	 E4+h2UfVfC+OpY3yKukCOUiWBbl2wq0XnbZAVvlPs90fVRlY9DpirGim9u2EKteqy4Bpm
	 bKbNm+iPxHvWWsoseXF1wuWkbMm1T31XZkdLwW6eMSC/qDFAyFSQONH7jWs2KMGVCdpyl
	 qaNaQzRcsaXvFMrqooVkhxPgVG+8UUGrLuhdLVsQ2V457PLZHW4R/2lZnCsP6JWpP/9Yv
	 PbET7vQnUJ3mZELE7ipwOUOzBCh4FKCMGEXBsVvbktNPXScLtqGaku01YfJq2AF/ybA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKIbML9Q;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E14606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99E14606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKIbML9Q
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so2700272eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253710; x=1794858510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaR5dI4b3/Avv5qRMJv+1R+v76FBZqVUZp4EUUEM99Y=;
        b=IKIbML9QoVHmXbOCw/sLvnmHHB9xNCpflfz3IKRPm9CrVGrDaaapS+GzvxDU4si6R9
         rVlO3a6ygJCfJqrzxX/LnDR4AJ7QN9NqpbwoKKZHoMBekbqk3xen/j7PLANsSJBknu66
         N0uZfJy4Rv0FxqKvbeAUUZmsHAgyBEotNmb1XHluj4Zu8hKKW40R2+Ge71Fb2d49BsNk
         LMhj/7NMN5VDJLmZl/mLHT/ST3bH3L875JRxNjBUN8droi5WbLmGM6Myf/jhxmNeHxQD
         EWwoRFwJYEdtIZTd5khSGNC2jNobEFbxMp2dvZEU4JZm4VSDcOjrUg3XlITqNkppEQ3m
         +y1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253710; x=1794858510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaR5dI4b3/Avv5qRMJv+1R+v76FBZqVUZp4EUUEM99Y=;
        b=xmYwhlTB9VZvDNsEuUQ2smvxTD/Q6k+xiNi0yizTlfyJuq/R7R99XVrq6p0XAq2TwF
         L2WlOu9CAPjikEyt23PHK3SRF6JG85sTVpHQfxlyztWfN66OuMCRSGxpMxxitWWyWtXn
         kwf8sePqYWvRdj+1q536GvdnJgpue6Pyim3uW3klnDg4Fsx2ZPYnUPMNTH8hgq6vVT94
         bdpEtpgygeOQxExlpwXIgulOQiGUj6sOhfcssWDsDtPGx+WHN9aakYJ7juKTApI5qWOk
         5baUkFWpMGwbzuMyv+0+w9TV+umlVmuUMDiHUr6TwGV/SAXiaANe1OvPXqdGW3b1JzxB
         X+3Q==
X-Forwarded-Encrypted: i=1; AL+hErGQ5PnhiGZtSKb/u7x2DV09LUuzzT9pFceShCSz4YadBXlgE3nVs8nwVYBxe2YXsLQ8Hp+Fz1vc499lHGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F6FWmZUc4zUJzOeyfZImXcXUDB3+ElXyiZAjQFsozRQIavhm3
	5IbOJpya/jjwo1O9ZzRdOmLc81Yvv5ikv8rr4Mz98IEdVCkVulmizKx+
X-Gm-Gg: AYBFou1lx4Az4pGTwCj+Xra30pkAcGxIFtcoDPjhoPzR1vKKbfHIyjqZ8bbANPlykGE
	fOAnBie46UkdVcS58rufHeuh1cI8LhCZlCxrkpqGeNoQIyuczxANny+XY2k4S9L50O0uuFTy6Rg
	EgPleUMuyQyoZv56wK/DSfgjsTnDDxJ6RU2wP0JzCu9HqTmPq+hp5NrLNFkmpAXTa7Fgbh8tBqY
	KiJsJNiYVkMQw0OJ9rB4b+wzHegjW8NA0OdAGt7opT0KWxBibJy6Lch+KBUOdA4YRodftnFCN+j
	ldTvNwbBrRzoJ0au+OAS7WKDbLJs4/mOljHadWflMQrX2yhICMlr7RQUVbxNH4gadATvSNusWZG
	DWOrMJu8Ocg22ohndxsD4B+gLGA28Xbx74y3yZhFqGDt+622ovMYMdVevsHLCcB5ZzqnldBgamX
	ambLO66vcTAp5ZPgSJ5Ezm6YTL9bzwxIodXDe/H3FBZF+644vDOHqMl+s8ZVJwCTuR15WUFypYD
	09OMh9dVAQVYSvhbEwPSgYIfiDGPxRJIXRmG/lsPR1fBAO5ANGxN20mY5B/sPYKDgPp++oyxPbk
	sFK/CoweBD97spg5q+kQrs4TYinEJ2HgIFxQ9E953EazE7GvhyZJvxDvMUFvCqYv
X-Received: by 2002:a05:7301:5081:b0:36d:d0f2:7c83 with SMTP id 5a478bee46e88-3751fc35fa5mr358653eec.32.1794253709662;
        Mon, 09 Nov 2026 11:48:29 -0800 (PST)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm530164eec.8.2026.11.09.11.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:29 -0800 (PST)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: Sahaj Chaudhari <sahaj123.sc@gmail.com>,
	j-keerthy@ti.com,
	nsekhar@ti.com,
	prabhakar.csengg@gmail.com,
	avinashphilip@ti.com,
	sujithkv@ti.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpio: davinci: use controller-specific MMIO for BINTEN
Date: Tue, 10 Nov 2026 01:19:09 +0530
Message-ID: <20261109194910.2282454-2-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109194910.2282454-1-sahaj123.sc@gmail.com>
References: <20261109194910.2282454-1-sahaj123.sc@gmail.com>
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

The file-global gpio_base can be overwritten when probes for multiple
DaVinci GPIO controllers overlap. The later IRQ setup can then write the
BINTEN register of a different controller.

Derive the BINTEN address from the current controller's mapped bank
instead of shared global state.

Fixes: 118150f22d6b ("gpio: davinci: move to platform device")
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 drivers/gpio/gpio-davinci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index f7c3b644e0e3..caeecfc3df20 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -43,7 +43,6 @@ typedef struct irq_chip *(*gpio_get_irq_chip_cb_t)(unsigned int irq);
 
 #define BINTEN	0x8 /* GPIO Interrupt Per-Bank Enable Register */
 
-static void __iomem *gpio_base;
 static unsigned int offset_array[5] = {0x10, 0x38, 0x60, 0x88, 0xb0};
 
 struct davinci_gpio_irq_data {
@@ -168,6 +167,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	unsigned int ngpio, nbank, nirq, gpio_unbanked;
 	struct davinci_gpio_controller *chips;
 	struct device *dev = &pdev->dev;
+	void __iomem *gpio_base;
 
 	/*
 	 * The gpio banks conceptually expose a segmented bitmap,
@@ -588,7 +588,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	 * BINTEN -- per-bank interrupt enable. genirq would also let these
 	 * bits be set/cleared dynamically.
 	 */
-	writel_relaxed(binten, gpio_base + BINTEN);
+	writel_relaxed(binten, chips->regs[0] - offset_array[0] + BINTEN);
 
 	return 0;
 }
-- 
2.43.0

