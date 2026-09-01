Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FE44766A7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268824; cv=none; b=RMnAbn/njRQm6O0t0pTgVoPqVp8OLe1aooC7l1gjBHrULNZ+cCLFjZH4/UCIQTw0x+YZQECG2mAue0mC5Q2wlbGmCoeYqLtcRM0tP2q1UqZP6WUKYyZKTOzuSYlYdh0MU7lk2xke5Hu6JYjCKYx4U/wybszKB5hHkwosNiuO7m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268824; c=relaxed/simple;
	bh=otjLY8M+I6ZgbZOeUnR9kBIt/DE5V0fH5Sljc8GFFI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c63hykQfhxzS15V6dN11z3A/1hesBwrxYE0gV5v8KLcAmnH5Z9AacF4UWT9OylxhyoYVQ7kSnTuFE5h5+adtE31nitS7wMQH0KOuBO2JtamZUdTxGrPXrfilvkvoNydHzRzo74hWU3b8cngbH+fk7H7Qp255NK0SiIrH589VJNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lt8GSh42; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lt8GSh42"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1c52d920b8so121720766b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788268821; x=1788873621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=lt8GSh42dhDmLaoec6DHaW6bK6D/AdnKx1xR+UDrzcaYOLZQgQhTSx0h+jgUjc211M
         dwvYRldhke0bl04Ptxzh2ErPrvW6HftqYeWkeZcF8dYL+r2CCpxfPlMkTeyf//v2RHJZ
         17fZYKv54fs0TuEgCDzE1WUYd/XJSiy04wBmMvBJb9vbBEOXuU0DOsY2vvL/w9UR0ySg
         aYlMgApOCDB7RkxYgu6grkh6lLSk3Ah7Bp775vWfiLnEnzrqz1bTvYIAHZu77EnUOZLg
         RlmSauZu5epfZfxwBeMNBHrWXXsG2cwbqLU8GsmMt8GaRFPHUUujsZ9gYdNAF8wupIFZ
         IeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268821; x=1788873621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=Y/eVevRHSUeRXbrEWcxQo/2aub6BTaoiBZHb0w6mq5hwf0RVHU/Cq8GfF0GIUjavZ+
         RkqUYOq0okp9XMbXVmSzMraEJyt1rMue55FDm9FDzWz6g2ce974oZ2+oVMsgeuoR65Xo
         UfhB+DXffs0VUp2keAair0MueIXLdRqnoR2k0SMyAmD65QwyXQhf60InKdwmHccini14
         ebv7EZA4egnn2bM2YtGmZMLkoeXu+TM7cZaylSGaMnee5kjauyoT/eUJsSGJcGINi56K
         As+RGSC2BxvwHuJdEPS5XJx4gveVVz7ffvqllmASOZfo4gFKLcC0HGNZaIbszinxTGMb
         8++w==
X-Forwarded-Encrypted: i=1; AKwUvBxqcks7qWMSvQ1yRfSrL8LTHGCP3PI776e3NgqvmU1kzv37ghIjkA08J9QoATxVMZqAN6jISs/LVeVmrPY=@vger.kernel.org
X-Gm-Message-State: AFuF++lhuZlvrPSRof8T9RMo4dRJcQRE1MnRTPd3B4F5G9yjV7UDSOeP
	U9oqYGNnEYEk6cTzuM7tYP5vsmwR6I/0jfU/Hof76R3uW638sUddIX9N
X-Gm-Gg: AR+sD106GC6j+jUcPnjYrFjCLNlzkXzZNuj0NRQnG6bn2X5eCwUe1mjyS3mXAOhgXJm
	t1DlThAaORuANoWFwW+zSM3iamiklTtmSdhn0hh6vr7ImVitDaLwivWrFe6sV6uAHmy0TMN5EpY
	laXDBgbo/JKyqCk/fmMgGMGBV9RFwZB/yFGvqizw5WUMT+e3TVF4iFhEG7q5dDYTTdBvHSQb0Zc
	RLdENe6C6khTAFr5bd+HNNj3c1oDTOCxVs2gnQhKFM6GKY5Cy5XWTqonrelzPGiM5vBereaMxWR
	gTVsrWxH0aEdwM25dooEHVc2IWtQNRcMq1JoNI1+BawXUVR/uGqm1yibj7mOImpFTsaaxjLW/n2
	0+ReHWkvF6q8T+wiqhPLt8UIW3cC0TMF185Su+OUESjn6G5KMCYzF0frIU99+BQJHBuV8jhUak5
	OlGHaAWJ5/T8HzWb7LZpB1UfBYbuczVj7DPj51I7MPnh9W0+2V+y6eCiV/XQEzg8Yklgknz8Yii
	cTK0q7wgxHy+/+d
X-Received: by 2002:a17:907:9618:b0:c24:457b:86fc with SMTP id a640c23a62f3a-c25571d3b0dmr2071588666b.21.1788268820741;
        Tue, 01 Sep 2026 06:20:20 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25618430fasm580304366b.22.2026.09.01.06.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:20:20 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Tue,  1 Sep 2026 06:19:17 -0700
Message-ID: <20260901131918.1189-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901131918.1189-1-laurentiumihalcea111@gmail.com>
References: <20260901131918.1189-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the MR-NAVQ95 board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..5d9da745b715 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1535,6 +1535,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0

