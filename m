Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227040;
	b=xiLbkIJ8UKrOgW5Ufzkn9BG+rQCA0gGTs63CdMjjkz6MBZWpv/SMgvMm+DdEiLDwdkih
	 w2A7t+Lq9D7z6eOJve3+oErbVo9PDFkvBXOXB3HqdHn0ljASHklIY08Pw0OWs5XsuHlJn
	 Hptu0z50DgeDiyBojfFvM0miMF0sw7WS/FU69GNoX47MmLJAgGdnOoFM1by4WSOz3Y/+i
	 rBAzJGZWPP6sjgvnD2PcDRKeJR1p79uoVBrn++D2lrb0HT4EaZlRg6k4IxTfq+8wtao3P
	 lrIhwx9ZeiXHkGMv1h9Ru4VLqLivjSD+4BLprDfrK9KiP4EPO2EvDUt7FtRXRBpIOuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ypL2grVntT+7ecU5ZYny6pR+6RbN0Ef9pRnQMEBx9Ng=;
	b=cmB0i97TPJzV4g3KNbGfdCvKWoLcCXtIAPq1F5WAKRVcDuUYwvlK/EyhCB8gkiLG3eog
	 lA02ubzpT6xZjx5efB4zPNhjNQw0bQomQsjb5VJKAcposfXeokBSTgXEfhu9YQuEUZwX9
	 /VYSrOBXbpPdwIx2p/aHtgxR/L0mB/0WgBa9o4Ku/Nk1grNVGoe/9rYZzERVTwD2Ig3bH
	 7p09PWK4a1whPcycImbWCXjoiabxfyx81doOaYxdDYVxQxtmJGp01PHQWAOib5tThDCwI
	 FL8Hp6jiUBrbiFVhhnvP+E+K8uoRz2tTCBGpdf1O235VeBvKmjQ3K1QVMiblkPyjS2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Llh3Zhni;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97EC606EE9C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D97EC606EE9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Llh3Zhni
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso6416295e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227037; x=1794831837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypL2grVntT+7ecU5ZYny6pR+6RbN0Ef9pRnQMEBx9Ng=;
        b=Llh3ZhninOo5lJzJxM6gigKSI5ZEtS1u/dVU2HlUp8JckOS8+NFZQj4GJzxgzcbyP8
         GbhVb1tYWKiWLmQUqVj959tf19bXwmp/LsVYqtmCobexCP5/X8h0oi0pQznDmhE+bwB0
         m4dsO38EOR3DL/EKKi1mTFdRmRNqm7NlgXAF7+D3gb0IZVkrPq5pOHTslK0QbcwE969u
         kuHwvGVyHH/Goc/ncXSLhEtajn7U5qveIrF2mBIAm0b9zFCldRbza7yNtX+FGKFE4uXF
         XgVFsosovIY5GFiXWhHoIkW98o6G6GULF0+mFDM/vuC5LJtIq+1/ntDD6h6Nt7zNXyZ5
         ATwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227037; x=1794831837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypL2grVntT+7ecU5ZYny6pR+6RbN0Ef9pRnQMEBx9Ng=;
        b=ofrqU+VG1SkNkLS1ePxhacGKH8vVYmPn1TcfJXLVvcMDl0s2pTzt75mBS+2BIgpo3A
         bzOVYF3Zug9pcR/yspbUbYVCFunpFiJ+A+mABfeb7KMe3bsFTDQR+KqvVmevYSBLKMUU
         Gbx3RAUHiW2H3xzacwYDt7k4CPs6nKgTVUA/zae0xLtELxarmlj1gJblQLJ5h5hjMWjO
         3ag5hKFTz47mWkp/miE6F1YlxAP/KB2ix6HQAzykLs7buChCG7EuMRxDi+wgqIVIBULc
         ues4Wo3ckQYmvlf7kFT0MFs90Of1bZcZ54eq2HlcLzN8TbR29apVZM5/UIdNh2SCUC31
         1mbA==
X-Forwarded-Encrypted: i=1; AL+hErEiA45b3ahYsEuNtH2WVrNb2we0EB0tloQmqnN+n5VRvQG7yIjP0v7omnhE/5y6f6cs6/3O3SKkTiM2bbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oT6lL8fFcthx7PH6rTyPRc6O/pVoBWLcISPA3XyS1d86K2rwg
	FS5dPdXv/p1syG36e9+05myOpN1rqhRwQgetiVXzi5slyRkfcsKXSFHXgExnpUL+//c=
X-Gm-Gg: AYBFou1WJSx1NFH6EmjIRHxzzKwbr+PZH9mwBnw/9iydwqJIiIMysModaXw4ysF1od9
	LaR4mE77Y0cWyY3oxFWv0HpziyxoxEiDrVPQzszl3NiXlK6AeOTUer24d7XhGWwsA+hSUccELzq
	UM7Gr3KgS2uz9QoSyISRqXhl97LHl4JNIGX9VLrjgR0JBmLPzorOK/VsiMO2UySStq5/0ad5syG
	LjJNzAjyqQsyR9Do1CfkYr19y2N9aJck4BlpkunQcHykUYVnC2HTxxOdjK1cyTlLNuQryltSV6W
	9Vw0ialudU66zhL5GWTNaSDwSgIpElY1P2xfD/nOSF1geyQQc4jFx1BSLW7YTH1ghcNnrfnvbVi
	+HnRpC8ICpLyKM6saWfcRhVppE/hInppMOaKHIFwMjenK5Lya8TViepeZ5KnriyjmInwsw2C91v
	KGRrBvMsfgJKXi6QJ7aX9bMp5SQ0f8xeKx7ZUpBbuAqdJv6zsMMPABUkcSW9+L6vEqyLnOGI6Zu
	gm6d4xp314+fypHl63vXvpWjGb45FYH6cDf3z2A81k4eldWl7XqN+64/QflBsKpEoc4DkNqHBuT
	Xanv9eU6D0g1O3e+1JOsIyLbjtbFGvEgodf7ts2XD/BIxslrdDXnr9R9vPYd8Y26LWXoHD1G1H6
	HEnvP85o8qg==
X-Received: by 2002:a05:600c:3e0e:b0:4a1:cfa7:e968 with SMTP id 5b1f17b1804b1-4b963c75b42mr68468965e9.21.1794227037216;
        Mon, 09 Nov 2026 04:23:57 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:23:56 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add Youritech ILI9806E
Date: Mon,  9 Nov 2026 13:22:46 +0100
Message-ID: <20261109122250.720757-2-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
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

Add youritech panel as a compatible

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml      | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index 2080d9e0ffac..6f29ddc1fd09 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -19,6 +19,7 @@ properties:
           - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
           - rocktech,rk050hr345-ct106a
+          - youritech,ili9806e
       - const: ilitek,ili9806e
 
   reg:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..ac2f54adde73 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1979,6 +1979,8 @@ patternProperties:
     description: YSH & ATIL
   "^yones-toptech,.*":
     description: Yones Toptech Co., Ltd.
+  "^youritech,.*":
+    description: Shenzhen Youritech Co., Ltd.
   "^youyeetoo,.*":
     description: Hong Kong Cybodev Tech Limited (youyeetoo)
   "^ys,.*":
-- 
2.47.3

