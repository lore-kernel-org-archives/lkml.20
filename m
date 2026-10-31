Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417565;
	b=0DL/9cBx+/gpEZemoLTQLkjbHmM4noN0uRPmj/qO7DziU7B39rcRkCoaitfj53yc+bPI
	 3bh6Rkb/j/vzose2xS2QKuY5GzARIf/Q56uB57g+181hpwEVRB5VAH8fxnyRaVOEVKSip
	 n/TiijPeCh5+Db04M3rTbnAFGsl8LwRsDTJ2KO2i60wm3tieGV0qMTOMSx5zUhoZLaFsJ
	 XFHWB67McBOK4DSTo5+0sY9u7htHd3g1vvyFSThYpNuzNYAN2UxrMYCmsHqZ3Stkz3EUi
	 NiBIlxneYFO1SEmjl1dED3M7kLHTayLZl6gLonAtoDhrvF17HN8CjQFaaBTlYozR/OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FGHv4YKoijyM41+FMl7kNSX2OQQ8v6dgSsciG/L0QxM=;
	b=5Cr4xIVx3n7xqqqmit7Kmi+/mimOqjHlOqrTxDwvAkQK5JsJF8K7YZNChJuZ+wwd3kVo
	 tUJrRC1XoFpMerMcxZ6UzPiS603pZK+AQdQuTryK8JqNP4X7ZJC/44YDxGuMlSnC3Dosq
	 GkDeqKWssdLhU7dZUXg5ET+fRuQMBn2E2v8wgQgGHaBfm2Har2uVnDWPvCKAb8JN7L2BA
	 hOhX7sQ1D4m9S4p++GDSZrL2MG99VzLYYIfoc6MOmywjFV8TYXjSpaKw4m9WTWcbycnSX
	 obvJDAJDN0NHLXTOH0/b9R4EdvDICMR5JrhpuzK7Rd0ug2kqXOY+5TnHzBfxdk4OR6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yH/lhlPY";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E69D606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E69D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yH/lhlPY
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso735191c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793417564; x=1794022364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FGHv4YKoijyM41+FMl7kNSX2OQQ8v6dgSsciG/L0QxM=;
        b=yH/lhlPYC4BYxzURy572YkQGTX7lR7bNq6OUeSqAKnolFcmblaGnmtLozxVfc1vFQ+
         Nu9HYjjRxpuwFZH1wb9+hUY+LwRdzyOeiZyL6+HvpxQozudWO3+KM9TTl+I7Fw2R3lnV
         ySjIpUeK4mFpP8hIEPv8iPo+8iOsjkUbXUD7CWmTyipzHSxNruIyWAm75M2HKEdceVAd
         3E+YSSfteFntTc77qGGFqW2LdoJQpengipoTqRUmMxQqbYf522Fu0OejTkAOpAP6P+N7
         M9rdpOMEagk82zkiWj579bA7uxcVIIFSLfoPn3fTvO4mTWSmHJVQRDoGZmo7ppm9MaXn
         ZUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417564; x=1794022364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGHv4YKoijyM41+FMl7kNSX2OQQ8v6dgSsciG/L0QxM=;
        b=CJ1gi26nKakfNBEWL+NHDj6Jkyqr+3267H/6KJIz/iQTz0X5V6cyBOF7voOhewl/zV
         o1MEOGhOJzihhAMmBFO33SBP90bxr0GsKo83VBj60hspvIQw02ki3tSH91Ara5F0jhq1
         dWvS1g5bMhpMXHmbm7zlaBMI8PcSDPVRgi+eFnQMjtYFzBjJjvX+BISGPn4bnZfxMQBj
         mZTwdMLWqJOiYpGkLHznwspshVU9eSclFTIG5DdDNhiVOYGL9GP1lJhqVeixixgFN4NW
         ONmzYBFtf25mIW1+eWRr9QoS93QFhfpM9lvkci0SjFVlQqZu5InK0TKymugTO/mB9z1e
         rg0Q==
X-Forwarded-Encrypted: i=1; AKwUvByvgs/BhiQh0ERqLljpx7+y2F77Tgu/CFeARwya8Cv+Xp7QGLtdvbV0MqssghGsCoN8nCI4GO3IR8jWTq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHPDGBYHgkKrsiZFibc5pVA8QUkAspC4OAn9vD0ZgdONkFi4BW
	lvF8kB82+y1wwDjE85UdbB/fPlkoMe2s82qHXuwFWaFe0tmoJTEPEbjiIfIzUG0b35o=
X-Gm-Gg: AYBFou38kWrSnaieIfBo/f2gxJP8wsPJmAFYl+iJqUjC5LVePAf5DED1PtNLMZLJl8n
	fCOWAQ9zbw7MCQk/gi+BOpF4rrPEnarbHIh+A0jDvfWN0OgWU7wrb2u5rM6kB1ud7jvEhGUzbXS
	7ctpEvtdGw9vIRYxQkwiOtdQXldEg8WiTvKL0sSCp5yrwYMyTVPh3hBDUw+IRZfp7K1khBhySyD
	biuTp8ywy0H9WHVPwINzdkDVsx8Y4rSVxZSrqFX3zP4h/vAKHs2X01Xf/vY7Nhq+kl6kN3uM2q5
	arUoFKpQFLzo7Jec8u50oUsXRs8CyvYoo274IdxBbcTNWC6c5StGFww0bNh+2gkUMAsijwZ7+f6
	wUt/eHR6rt7uBhEGUhczXywrtIXX7cGARN62lJzMzlLxWaQUlMXaigVWT57fXdKB12JM5wFYOBQ
	pTXtaQm9Z1+q0yHj/4ZVwTHzmCEX99NTzTYuT0hygwUoM6rePf04PT89HQr0djsuvaZKt1EDua4
	SQa11Ii4WX7RWDDbkeoZhM1lH3IKTYbz87mq22ZsqshI3znxoxDrMOjj/SHnESIsfdpOY6zMoBX
	vCdPvFSLmbxTub37Wrp9Ju5F+z1mP1J+vxlWRCXNm0uPOkpeUCnvAMlgShz+BFwpYupb2RXs3dJ
	AJ/nv28P0NMrsk+cp7QkwegY0PX9LhiTGVfm4QCtR943jZhxnYnL2jhThTFYpzgeMElnkHNTaZ1
	GEY5w+cBLwvk966pX2ai6N5MtC2QwgaGOdqT0=
X-Received: by 2002:a05:7022:170c:b0:145:287:ce91 with SMTP id a92af1059eb24-1ac59dd30ebmr6048776c88.14.1793417564179;
        Fri, 30 Oct 2026 20:32:44 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4a04esm11229136c88.15.2026.10.30.20.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:32:43 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: ocores: delete adapter before disabling controller
Date: Sat, 31 Oct 2026 11:32:40 +0800
Message-ID: <20261031033240.2491016-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
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

i2c_del_adapter() unregisters child devices, and their removal
callbacks may perform I2C. Delete the adapter before disabling the
controller so those transactions still work.

Found by Sashiko AI review.

Link: https://sashiko.dev/#/patchset/20260813153155.3953577-1-ruoyuw560@gmail.com
---
 drivers/i2c/busses/i2c-ocores.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 2d18c1035837..ff024cf5f92d 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -720,14 +720,15 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 static void ocores_i2c_remove(struct platform_device *pdev)
 {
 	struct ocores_i2c *i2c = platform_get_drvdata(pdev);
-	u8 ctrl = oc_getreg(i2c, OCI2C_CONTROL);
+	u8 ctrl;
+
+	/* remove adapter & data */
+	i2c_del_adapter(&i2c->adap);
 
 	/* disable i2c logic */
+	ctrl = oc_getreg(i2c, OCI2C_CONTROL);
 	ctrl &= ~(OCI2C_CTRL_EN | OCI2C_CTRL_IEN);
 	oc_setreg(i2c, OCI2C_CONTROL, ctrl);
-
-	/* remove adapter & data */
-	i2c_del_adapter(&i2c->adap);
 }
 
 static int ocores_i2c_suspend(struct device *dev)

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
prerequisite-patch-id: 44b1c2680cb029871e123eb11eab7764a807ef24
prerequisite-patch-id: f4dfbbaaec2d208ac255451cf032c22f0e7fed2d
-- 
2.56.0

