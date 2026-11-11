Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364354;
	b=N/KDNHNZqCc0c/LOhhrO/iXSWPQr6aTWE2/k7VcGNUr3V+QUM8WfOxiKrz4v+to8X8ZU
	 p7dPt4UInyb+3B5cR6pyiSJ9Om6iBgFmsPmP2djjIUnyFUT70uUz/qEDCtuHS7hTXVPGu
	 InhR66sXPzZ/tJ+hZP7/aN7D6nmh7gcOBEJAO9tWc0gBFWIYBs1xAYWcL0S2gFHPq9SEu
	 v21PCrsTVceZYKxbcTPyd94zm21i+XrcPHNqVIVihai8lWUz538U1xuUKVInMnYqHcIIe
	 X2egwMa3R+ztCC0zrorabK7vNoikGYycHyUlLZzkS5wt097MEZOMv4K7NOpq7YBiW1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LDdiip4JC5hPOAy/PQcmBPBdRiD+HONG44FBf5k6Tfc=;
	b=YP8qdMO/SXIQQ4W52uDpndzn02/ZlZZZOwb07C+WpgrpLn/0LoIaXkbqhb05XQd7331I
	 y2EHnkeFVm/2zo10Y8OS22zOMs5v+WapZ3LHc19FAwY3bOWukS5aIOCqSV2k6n8iQfdH0
	 uZnrpGxf8Wjy6Rxi7IgvKIx8m9zRtA7GoEpRUdnAdky4kh+/xxzqzGAYoi5LOKpB25Z2k
	 VlYJTed9g8NRQkK5a21BbOPcnurz59sopUHeVdxM4GhD5EBe4BiyVfGdG3SFbjh3GQ9mF
	 7LAviU22z1fJlh6ypSi/iqct7VUd6XR3wZyLS+p70ACDOeERzZuW+0nfO2/inPani7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ewb6ltT0;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F90606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F90606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ewb6ltT0
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-55650fe1f0dso1408045b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364353; x=1794969153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDdiip4JC5hPOAy/PQcmBPBdRiD+HONG44FBf5k6Tfc=;
        b=ewb6ltT0oNcgOET9OClEThGLAWDJfZnrUIdUAN8Ir8iQ5AuAS46cbgxdsJ264rm8Jb
         yMqgeKBeF6EdhjGjGHX0FUXsXacGGCpCFtUw85AiH2yL36Vxi7BhgHloWfGQ4aGIpKMl
         kaXaKIo+M8Udnd9mMLGrZuiki1iCJ1r9MZV8vBZPJeOpR5bEQfcrrY/v/oVuGdEy2uOq
         EZrH9xhUnbEIvpYci3SHnAA7/GstkBActbFZmaD88hT4ZThs4HeL4Bo4nyP+16Ggy/2O
         z8AKMjXFgaKfZfUHpuN6bYZiW2gLsWxuy347qCEOKZM+5MFWtYcb9ExpmWEgRxYOwGiH
         8A6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364353; x=1794969153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDdiip4JC5hPOAy/PQcmBPBdRiD+HONG44FBf5k6Tfc=;
        b=cL3CwaaGzvNFoVMoJCyU0st+8KmQt9emXts9zU9oKlI7RwhfXvchQB5c3Z34DzvAe8
         Uw11RZYhvKg3zuBuldf6beABqSrNtSNgYJVJWTEPyI7dWoiS1uq/egUcykS+BwN6aweH
         fM/1ntQPyA41qbzgCkc70er4u1MsNf1r+1BZZEYymZ4wyhSCZGz8YsANXbw/ybLleBjp
         5QkOJi04BTWgTjLft4kPEaCyrC9fTHSMZTyiWiy4+r/impHZbe5FNHvcHm/Rpp7ggBC+
         ZUjD9FNLbXysy8gHsBbtp/XqQuXjKr0rZxiWtU1XpmmJc/xuFsGMBxQbFDhBSzyNxAK+
         Lm3g==
X-Forwarded-Encrypted: i=1; AL+hErHPLAffp+pYQjY1ZQD0SpLVOJ1KvORqWkN6P2ZJR0io2g2vqv14sthOjwUfsgbIkMu6k20toKEYMl78ewI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+X5KW2Q7x/ytVLqNwYjl6w1a+VaVJMoEjzanb5jZ3V9BRbsnY7
	aCYAZrZQ4J7CGuBiU/gfttv//+lFog9Nm6BP/0XoxquPIHTFShhr6+un
X-Gm-Gg: AYBFou1Yg/um7mRQOCMEmkI1jNdlanyy+IZKdZaDGTAnQw+1VWXNE7Nhxs54hGwxWb6
	C0ao0Rxuy/6NrFwifxVAP2DJMPElsXm2wUjj5yjXnuYY9AJY7dPSVBjypVqbkuA/hw2d+evU4H9
	4PwEG53+rSGpjwY9iTJPS0Zd8VBDqiuYhsOAzE7fZcBS8HFiUw25+STojIl2yvZkkcGG1e8FfsR
	/eNI472GId2bqgcX4Cmdq1Jz8z1ctR/BPvFpXQD06V+OU6/K6lHVAuvf/Emb/TYfCCLSwHTquu3
	axkK52e3tRGAqcU2XeT4JhisidwrxkKoFfjsiZ5b4uKsFo70hWPA/CTn2PjfW7rUAyNp1a3dQFg
	pGaxyAKxS02D/9GBd6VYMmw1n2mOa7RxlzpvPrgpg8/4viGrgDusftkEUl72IxMAoomqIkIP3NZ
	/2HPtf67SwLTni4Z8omhQKwHaKdviPKaoNNmN6vcRxMU7EbrF2Xnlg7NVXTjSjkMZ7dPEwVnBg3
	KkFPee91FJZmirpjCJN/rWwud+xapN5uno6KPLRNSoXNTVxg7rMQC3wwKe/e34MMGEKSKZSnYSG
	Qc5T+eBLDqgYDx2Y3qRmtxywNsyBaiyrsZI0ApWED2ja+9+gcdGy93Wx8qqVNsWPia+OR+HL1jN
	ESP8jhlQg4q6fI+VrpBZUTGIFDCHWPZ2YF/y3DFWz/JjxEYN7mmUBbBmuuv6DTEuuzzOu6O1LGv
	HOvw==
X-Received: by 2002:a05:6808:5391:b0:4d6:90d3:e183 with SMTP id 5614622812f47-56b97b1de0dmr793806b6e.44.1794364353319;
        Tue, 10 Nov 2026 18:32:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm3917813b6e.3.2026.11.10.18.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:32:32 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: udc: snps_udc_plat: use platform_get_irq for IRQ lookup
Date: Tue, 10 Nov 2026 18:32:21 -0800
Message-ID: <20261111023221.70102-1-rosenp@gmail.com>
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

Replace irq_of_parse_and_map() with platform_get_irq() and move the
IRQ acquisition to the top of the probe function, before any resource
allocation. This provides proper error propagation including
-EPROBE_DEFER support and removes the need for a manual error message.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/gadget/udc/snps_udc_plat.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/snps_udc_plat.c b/drivers/usb/gadget/udc/snps_udc_plat.c
index 3687690ca33d..38aa077a56b5 100644
--- a/drivers/usb/gadget/udc/snps_udc_plat.c
+++ b/drivers/usb/gadget/udc/snps_udc_plat.c
@@ -102,8 +102,13 @@ static int udc_plat_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	struct udc *udc;
+	int irq;
 	int ret;
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	udc = devm_kzalloc_obj(dev, *udc);
 	if (!udc)
 		return -ENOMEM;
@@ -130,11 +135,7 @@ static int udc_plat_probe(struct platform_device *pdev)
 
 	udc->phys_addr = (unsigned long)res->start;
 
-	udc->irq = irq_of_parse_and_map(dev->of_node, 0);
-	if (udc->irq <= 0) {
-		dev_err(dev, "Can't parse and map interrupt\n");
-		return -EINVAL;
-	}
+	udc->irq = irq;
 
 	udc->udc_phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
 	if (IS_ERR(udc->udc_phy)) {
-- 
2.56.0

