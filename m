Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816487;
	b=uyF7L+wfHP7zzGkiDdfMh+p5t5ZvKdTPFs5C6BcUHyaS8YMX2/Nfdbiu1dEpTsXwznGB
	 tqPdDgmOKMDnBfCgUWk5JiptTqU27dP5gryMvnEu7bNQ8FXmMeFdcSrXibXahRgIkxvwN
	 L9kPfmDBlvsstS6i2Id9kemA1qUXclpDKB2CreSV9zh7CBINxe/BJv3tRwS0kLNt+EbOL
	 p8Y5sxNAajbA6HWI6A3N2vw7jWZUg3gHvEqW96LaQqmO4B2rCLmqns67AxvVnG5tekWyq
	 8JxXzo375dDMEozmUELXAicG8g7QiP3pgTg4Cw5nAnYVVZwvSeHpIy+dTyEVMRn4Rig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=A/vQp4Ob6tZK/MQFMF+LZw+BEhdevGHfoc7PehuPwmo=;
	b=4y24pw9jlwoyiM2F4zCxMpF9RrUqoXwufnhjfduS+WgQATMOglNv756txZvt4L2xV8Ma
	 SQD9jU5rvqrplnZpxyDGvqEag5RpUJTXYK7aP18ORt+QZLJ8rz22kgrpVpNJdlwNTM32j
	 AB2aP+9Vgo0/6ybMaZthU0OJkgKrhjbHqAIBoKr7Zh6UFX0saYu1SFSnehfEhsabpjjJw
	 ahAPkU6jLkYrpHHGJUx+9CiyY4gHtNbejoSWku94juZ5ak9Rmie4h2qCvSyqBe6ExmbE1
	 yZoycUgASDAc/8l8QLkH2A/K8sq4boy8TGp8Q5tK9XicWC5KLpr5iAcJxJpRDb9wuEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwbPKIq7;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9647D6083613
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9647D6083613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwbPKIq7
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso896031f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816480; x=1794421280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/vQp4Ob6tZK/MQFMF+LZw+BEhdevGHfoc7PehuPwmo=;
        b=RwbPKIq7zMTbMLWlLYHeKDbhMe+TJSa8Op8YyT7vKpp+3wU4OAdCesEoDRWgVqkKXx
         ldR581ZfsIBClZ33PESVj6+InSbkRoRX0J9zRkxulpzh0xdJlkU2bOBt3NSmPaSLwQR5
         2ddmljiCAQ8rwDjfByTOiH5RxRdr8ghOzfIpJ0UqLWH9atfuAxT0InbkCDtbHTtHAO8e
         OfhQCRXS2m0W41ufCJvtIHRCZzBfffSgtsx9O/fgu6iCkSLBaiSGRo1709m9aLaTi5GN
         Ch8TET5QSaoltqkhw2ma1glWmm3uTQpmY5Z6xZNSM5q79TqtGAxAE0bsPdV4xDYJAvRp
         vvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816480; x=1794421280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A/vQp4Ob6tZK/MQFMF+LZw+BEhdevGHfoc7PehuPwmo=;
        b=FIhEyShKEhNj2SE+d/7UJW+cLeNU24TTfx4XPm/g/it5hovsO+QnRarSJbWSyX3apc
         bPgKxy3uGv14yYhHq1mUFKp5OnfUTOQB59cOZxiPPizjUM8dce34poJTp2skA2BTyqzN
         ZxvBkdN6usT2iA9DkaXvrNadbgDFa1L92g6s61gryvLLfyuj21qdAdB+2SECMYMfysVI
         3VYrViiyLsqe9oiC2aG50FdHodS6CgJ5J52cnD1HRbNAQ1rEdeAtCEGY/LaBenkf15AE
         OWO2geuGxIYb5ubjkGiMnRi+OZXGpbX6MqOfdlHowvQFRnNVADTSg6lrN/JAs8fB3KBp
         rnxg==
X-Forwarded-Encrypted: i=1; AKwUvBz1ynNJG+fq405DZvNyywefOFRlm+ezMTBkRGa2EvqRizHhSVTNTTiGzEVoADJSHpulWHixGJ9M7erMhGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I7/uTxDk56On9uDHV6/Yrduei+h22MhBBWnqZby7/xacXRDXo
	54woCmS5JR+AyO4KTGQzFVwutiwzuzzIpytnb9UrAnp7g9+AyKYJdjIJ
X-Gm-Gg: AYBFou2q4hiNLHFSFVh/jQUiX9QZbl8OdRvts60ExMAhWZJQYpf6pGcnKPx8feazbFB
	ANvjyP/9TOwFiT1IlgsZfrjF36cnhiDCCbn0zWb+Jr7CqCpOZba8QlcZVdh8fS9NzZ3D2woMfKF
	2TdprIwsUh0LRM+d6u3EwThRLdDju0e5LBAHn/JFnc+0eGJN8vUqlWpa28jmNvJGIreQ4pTKT/l
	SjiYLSc9oVI8hXPlbdrkB+fX2xfalJMCkwJGV0ErBYHup8mGCbn40zkVEnNo6W/xBjWr47KBv2H
	FMybj9KG9+pdh9U5qGDjAOFN0uSGCz7+GjBVnMDPID3RtuilrRg3mcBnVSNdj/8/+/vkfjsoGxB
	ZFPuAWRiOlds4jBD7K4L80p4kXxv7e77xw/uAHq/ePi7wpnTd0qd1gcFCgD22bbF7S0DitR6N2A
	MLD9ZJavPdigAybJabd6NiKDmsjkD24/g+oI9FJawblQ2xU8aMzjKCllTMxfF6LbErLPPpWbtDW
	+EcEi6Fe3dFxJe/u3UhvQFn1ZfPnVrXxD5CC2yHLH5HWysvDmIQEsP7b6t0vWxERf9p375/B9se
	ngJ17mXaniNFoYtNXz7N+54pELOApO11Z6Qlm9Mmgp8++jvOWBGj3gAMBRlkKEpCUg2DVRkAWgZ
	FJVVRZvJc5TFi59IRNGPPp0nnnqY5uOMTQM0bvQ==
X-Received: by 2002:a5d:584d:0:b0:488:8525:4979 with SMTP id ffacd0b85a97d-48e6e50b5f4mr35431995f8f.45.1793816479972;
        Wed, 04 Nov 2026 10:21:19 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:19 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 08/14] net: dsa: rzn1-a5psw: Add support for optional timestamp clock
Date: Wed,  4 Nov 2026 18:20:56 +0000
Message-ID: <20261104182105.1102555-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for an optional "ts" (timestamp) clock to the RZN1 A5PSW
driver. Some SoC variants provide a dedicated clock source for
timestamping or time synchronization features within the Ethernet
switch IP.

Request and enable this clock during probe if defined in the device tree.
If the clock is not present, the driver continues to operate normally.

This change prepares the driver for Renesas RZ/T2H and RZ/N2H SoCs, where
the Ethernet switch includes a timestamp clock input.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 9daa5d8245df..846216f22bc3 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1212,6 +1212,7 @@ static int a5psw_probe(struct platform_device *pdev)
 	struct device_node *mdio;
 	struct dsa_switch *ds;
 	struct a5psw *a5psw;
+	struct clk *ts;
 	int ret;
 
 	a5psw = devm_kzalloc(dev, sizeof(*a5psw), GFP_KERNEL);
@@ -1245,6 +1246,13 @@ static int a5psw_probe(struct platform_device *pdev)
 		goto free_pcs;
 	}
 
+	ts = devm_clk_get_optional_enabled(dev, "ts");
+	if (IS_ERR(ts)) {
+		ret = PTR_ERR(ts);
+		dev_err_probe(dev, ret, "failed get ts clock\n");
+		goto free_pcs;
+	}
+
 	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(reset)) {
 		ret = PTR_ERR(reset);
-- 
2.56.0

