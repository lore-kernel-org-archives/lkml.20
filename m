Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446936;
	b=39oBIIl5lKZ3QUq+W0iaCJlgzZXVe70Yg/4qV+lBcXucyZMCBtQMefqIrwPq9t2yOh2z
	 GTCoHmDJYETKuHQNiyMw1cWDy1W6TygBIFFLjlLAZsvmh0qyJeYsTaSNZ1wnlFV52V6+8
	 Fn1jE8aw+pSgIoehN2ERrCNiPQ+dIuho5jcMDza1pPnlZ6csJtXzhi3zvAoZaqsICjlD6
	 EkCiOY6oJiPs7NzirjmuJLZkAOmgnI97R+q18ptk/pIyl+zyDyIFmLnpjXQRbbxkr5j11
	 3GHqMwOQPzlfD6VYyC4Weln97U9gO5KaflGFyPHhrkosa1pQCdu4fov3+21f09XTApw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=;
	b=g7ax4FhuvyNks4iim+gU6xYdkTYM+0Za48FhUBocLaLjoOOCemIyX+jd13Avu3VBCov2
	 BB+LHmHfEy5bTeDBrAg1gpGPCgp0Xrwd5uwJXTSAOe8usY0cxTGDRnVJe77QPJPN98cc+
	 HxqLcufSbVbpacHH+G03g0vtib1lD8PLAaH089+naaeHmIW5kgx7n3bWSluXEHFhQQovV
	 yocu4KQIe3qoK95lWpGHuS15z53ftvywg+mmDxMgLwIZuHA3qEVtYMlRNaDizBgJ/RxpP
	 6A47FKyZ1OBJn/2qq7O+8jje0MD6GKe95csOEx6TMX67U2BAB9dMDCOOf9KUqSWH6mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I7ZQJAj+;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3114606E13B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3114606E13B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I7ZQJAj+
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4b28d7c729fso2411071b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446935; x=1795051735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=;
        b=I7ZQJAj+0XLuO39vhzXlviHa0SwO0WLhG/F53zSgtGIGkvlLov6UvOJjPkHbcEtrsI
         WXC4RIVvkBaU3g1yLY2UJYmMOSWTz2kAj1Q+m9Uuu0QskBozQZ+dQuojw0m4fHDZk2u8
         WyPQi+PScA90FEGfDg8b1SwTjpmTO+QnMZFFB9nppDbMt8WVZT9MUBHC/5055Aw2CM4T
         LwKYZkSrltEHtqe1UL4Y3qNJq37/2xaRm6ugvvMxpofyT2S1yAQFWPj+FU2B6WpR+Qgq
         Fgt3JNPc/fQA1Gh4d/lPTlOkeiYDQQpYBM5cKKxTdTAvZOhAGwZNJnnALRYmk45M3wqx
         NRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446935; x=1795051735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=;
        b=1nCRX38YouFV7tdgwKbpvqL7VXpcynoTwhH+PYMNmtkNHBvO3zdy64zNr46PHGRsng
         x7N8WiIsA+2t2h/VKQXAmpvVbs2zKD7NSaAgpvXNcaPk7d6h4n+ACfRDELOkfPhe7SCv
         iH9PekWwlBreb10XOas9SChu43YMCPnPdfICWt9APzlN3B43tkGl4k53O2sVyMWlghWu
         uHOr986aSToZAeyoDqNTGXuZ/IGnZUHvbUT3XyOSwKb7IBgwE9GuZCMlUeLcSh26zX5J
         e/u6Ek8VhFt8bKCXjuPSV8bQMbbF3gVadoeqw+HBp1T+K0ivbCM3v5HHNCeo0sVkY6+d
         75Nw==
X-Forwarded-Encrypted: i=1; AL+hErFwNNtguT0uU6/U3/gsmNpiTdBuPvocN8DAuP3G0Yg7nA+IOUHFDfnKq0pgHHd0MkKOm/H7Kur5CuDEkY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hu28OTiH+qXBmxmref9F9HNtFAI4FXpunXLQ7WC6w+sv61xaB
	L4HcwhpGJhGoc6hNJkutEIkjObK7xGk4uthoAFexMuA4toNwFbvqwAKD
X-Gm-Gg: AYBFou1+mDyf4YMVWNIFwKNnbcQKOLS2FH1pOyt5/iGyuo9EYi1aXNw7iZo0xBYd56U
	cPhqYIo0oWhRYE3D7WY2xhMXxlUJwHP72/iKg3APrNH/FXu4cthZEeRkFBBHQFUKspMms5WbVGA
	JgrnWDd9Sbss1qvV0Te5xfyru1BIGrLrg8yBMT+drEx5hc58nqwoXTA2FiQRSVXXJAvbZw6VuoC
	N2sQgZt6HDydPPgwLnVITg1QXUC7t0k1lndidp0yNoOWOHN71IbYAozb9fUbvtsChxfwK33OXlu
	TP8SXAZHsCF86GN/sKHLAbMJp+qxgkAliYe/qFc2lsDx5ZlUznrHCmy5XRgoQRI6gn8ldI70hWJ
	3v/L3OmVqIxXU+z2T9JWUtLlCPI3O8V4Smq0wj0Wc3ReLqwVnD+SnnTl0vNHPWpgrR/LvvLYxye
	BJvKqUd4erjkpW72id2SIvVtYpFfd0HgmxpAmLoAf+mvSn49t1vWaT1DK9+XuMn6fqir4MowErn
	nPsYlkMtTRvitjyRcKN7vDr4mmXXnigREV9zZsMWPUGi7iRhAbG1eG27DrN81xRB30Y8PW5TZmk
	0Cj3/J92GT7hg/EyUHcTMNrMLFDg1uPgHIC8N8pM2jobrIsapM8ecIwwtiilLERLnMW+DqA4CrD
	gcEJKAGA1mO9ELMim/k1vEPh7yZahU7mj318RLw2Wl3Xltdijyw/XbGbN8j6gBpx9X4GV+x6Kul
	C81B1neT2g/USWiU20YfkmWMZpmiGPfv9BZPpJtKdgKKYt78pu1mjo
X-Received: by 2002:a05:6808:ec2:b0:4f1:9d5b:3113 with SMTP id 5614622812f47-56b98c18b0amr3223347b6e.67.1794446930074;
        Wed, 11 Nov 2026 17:28:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:58 -0700
Subject: [PATCH v3 19/58] mtd: rawnand: orion: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-19-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded chip and its copied name through the shared
allocation.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 2a1dba2931dc ("[MTD] [NAND] Marvell Orion device bus NAND controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 6cec25425710..1b1cf3b31fb3 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -106,15 +106,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	info = devm_kzalloc(&pdev->dev,
-			sizeof(struct orion_nand_info),
-			GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, info);
+	if (ret)
+		return ret;
 	nc = &info->chip;
 	mtd = nand_to_mtd(nc);
 
-	nand_controller_init(&info->controller);
 	info->controller.ops = &orion_nand_ops;
 	nc->controller = &info->controller;
 
@@ -186,9 +186,16 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		return ret;
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret)
+	ret = nand_set_lifetime(nc, NULL);
+	if (ret) {
 		nand_cleanup(nc);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
+	if (ret) {
+		nand_disconnect(nc);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
 }
@@ -202,7 +209,8 @@ static void orion_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

