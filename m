Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E1A44163B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927810; cv=none; b=aIFE2RukpGf/ejoCG/HhoBdvc/BmZSCPVDgd5nTMlTRvmqyL9W0+y0YZ8t0+tzarjtm/3NbFfZtzoWLpIMJyDhGJkn9FDN2R8VRYkleTrlGEtTFKwaHl8hqtYNcLJQ33H4JlBQg4IYvoEm04DMYiUIk5dYvMf7IRMNiaCqT1iNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927810; c=relaxed/simple;
	bh=ElnfxgFhcmeUn8ZIqa/xzqEbM075lUDvBpB/nd40vQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mTK1JGzogxepOlLtkTiXWbHzeLhMY+27/qdl3v3oiFjn5MiGM4gKMk6h0mhnCqTnElkdKOKd6MkxsirVUhJtx/0NUrp9oVpwUMMgqgccukIQOzkaHz4ZAy04pIElg29lXDinJMvF+oft8Q6OFZs6darsZdBFwboprKITHt4fQIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7l57q+/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7l57q+/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so16997535e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790927807; x=1791532607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=d7l57q+/GVQxDOY6c+ROwiTfg3eZUbQVaRZ4LAe1idXoxep1Jb8d5RjtNiQPGYQtAB
         ko7cS5wOSTKXstXQaBsy0AQEtUB3MvRbWantJ763vQ5wDHjRmmnOfTFYVE5cFwGYzpt0
         VCBJWT2w0v3w7VYGsQCkQyUVU/2yM5IIMdzi4ujXQDzRNbnTeY+I0u/lhpRaULvi8mnA
         metPgRxr9UybwA/iRVuXpNMkKHdHYBfaca+tOT8luOrMfDyNEihdCSbatwyUVxHRjQ7y
         8vtg+CrcR6RPe2htAYQwc/eb4pc67D6T3QdNjUhBRPFH0Ndmar40XsnzKVuVP3lDF1BB
         USUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927807; x=1791532607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=N6xjLMRD4vo0tfc3a8ddxvPaV7UxrI49+CrexBfr5OJj33ti690LUC9u6rNietRbgC
         waFduveC2canZczNcNlZTJLp4wL45aKu578Q+W+dguvSh/I6I7NB3VXqcphf9vA7p9Mj
         bPi/IKD7g0SR7Hu3iW6a0EpVCS2DVoSyDlZTiHHFTV8Trkx6TuSb7jqTJj+WYOCWAvFe
         1Vi9bFcaJUSVFy3FZXxrorfITfO3t5qyPvCvvEEUIMgxZPSi1PIPf6rsBTzcXeAMURl4
         y6DoOq9jeqWOMVAnzDg2QFoy9joG89ozgAaxTz8I/wQI3DljxvaAw0F2tKw3RdMQd7sw
         OrKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnLZRw2pUZ4J2X1O4gvLPTfUj7U8FArH3DGj5yZNcauVDGgUqXLdNgW6/FUl0xNqHYvBxabCZZE5OUERU=@vger.kernel.org
X-Gm-Message-State: AFuF++lOn3iPQcj8f/pluYcX25HNZDrHunrB4UefjrBaCLtBDdazOBT2
	XfLhXgjkRe2dE9HO6UWQx7AJjF1M+xrbyRlQUnsw73cz17xUbU/u88oI
X-Gm-Gg: AYBFou1nn1UqP4KblqE1VCsVGnGizB+NLjoju28yHMKpdOWz0bIWRkmKs0FVaEWLoWJ
	kjT4zIXM22xHWArCGVh9E+940Wgxw/+cs8wcYZjxFBKU/ngk+KJ3GHqiQamJViuEpnOZH8CLrB+
	iLb/f7oCXlWcHaBW7ZPUHW7RYWTgeoQQQaAk8gzajkysJ4/WSmR+IvKXgMJ4w+DD8hPDoBBrplN
	GNcgzHUjye8oVC9q2rzVCSOOaFYVcVG9NzryvSxYc0iT8WuBdsEe1rBRQQsAFXBf1aqbZko2T+b
	dq517504bqxVLhLFA4M44V/QYjKrWj10ia7MPgymg2q/ihiw1vbbb3Zf30qbVw6A0P9FYSeFujt
	E3My2gyxllYV95AWkBiTXrU+83ysAFrxfZUH5qQBNw+ig3fIkxXphk2S81K8coSa4AuT2sTdNgH
	ROhs89xDEblun1h/6OTa883Sl6LMTCk3zW4Q+l++UKsRNmseAuDKDcdVxw6hx7fXBO6aRP1LM9N
	2zcVkapD7MCr4+feJaxkVCGrUHkt60Jp3ps9reoYQEwL23n8FQd9dtk/KIZWyyEzOTpdScV2w==
X-Received: by 2002:a05:600c:548c:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a027534bd7mr31406145e9.5.1790927806666;
        Fri, 02 Oct 2026 00:56:46 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm63635305e9.7.2026.10.02.00.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:56:46 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 09:56:39 +0200
Subject: [PATCH 3/5] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 on-carrier 3.3V regulator
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-smarc-imx8mp-display-submit-v1-3-f578c63fb676@toradex.com>
References: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
In-Reply-To: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the fixed 3.3 V rail of the Toradex SMARC Development Board as
a regulator, like the existing on-carrier 1.8 V rail, so it can be
referenced as a supply by the devices it powers.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index b31de307093c..c28d63293149 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -32,6 +32,13 @@ reg_carrier_1p8v: regulator-carrier-1p8v {
 		regulator-name = "On-carrier 1V8";
 	};
 
+	reg_carrier_3p3v: regulator-carrier-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "On-carrier 3V3";
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;

-- 
2.43.0

