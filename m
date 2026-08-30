Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FF73BC687
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105804; cv=none; b=GCnWC3AFSWLDBOgC+wMCVGnwYBhcTetfo/8HQJt8q1kxByAazFVhMB7VxPgZL3IeUhZpYUKPy27DcswRw01Munqw2NDYzu/cdOB5WCRv8fgYyBatQH/d+jIknhEswNH90H3YGIwK3VQ8h5YJdN2EFn6XleOeAiDtT+blL8wRQec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105804; c=relaxed/simple;
	bh=oiC51w1NPaioikE1Hg9uEJxGeYzaTROkH+16a9WiVbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJ9PFuiaUz5KBeK/dCPjQs91RZWAJwv680X+dbhwu5w0YgfkJxV77W4vwZXp0I8jON2TDE5LYoxnLM4wHtR5/y7NzCW27qnrXlf7hUMpRjaZsWeq1gahg7Wd8lnM1wy6q1/EqYu7JGn6Wnw44cMKhtPyIsw+ehNHp2zOsoBzFvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQg3q7jG; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQg3q7jG"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so2732926a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105802; x=1788710602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y55JaARfg3EV2mur3cWs7k4GhU5c80X4HvQLCTJYTYs=;
        b=KQg3q7jGb6UFORf0io0LV15mwS62/21ABDqJ/PJu1NzsDvZ7Hnmqis+PtErW7saHqU
         HacYZyeD/zKaqTfRLrb0vWHfsYwUqCT8K0u4QDYI7pwEzYCf0mJ/eCUtJT34WCu0tSk8
         I31Tz6Fo9JyNwuvXEpp+BLt1P/OFfVI3ejCn+8LcThlKlDrwjztSMVwVvwJT/o8IvPKO
         eLAijPZdd50ueC1d+lEfzlFoZ4t/vVa4ZntHctEnqMtNM7Mf+Q+Ahq/vXXNYhzIz2Y6S
         KJ2+V/zw1aZ5Wn0vPeSSQmxMToVgftG3aH6EwM/v2CwH14/++B3kBkdNaQpFIRK0fyRn
         cEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105802; x=1788710602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y55JaARfg3EV2mur3cWs7k4GhU5c80X4HvQLCTJYTYs=;
        b=M6R827C+IUJAVb+UJmw4aBBOilK7yDuBoc3keIqC/pkvOG5c8FrVPWlKE2oAYJe3gU
         tMXck5ET5wL7utp/v+AVwSJgkJhc7kEkYQRwjPUVXEr3/SQZ8/nt5qegiOO8aIKE9A+4
         FqKlpc53HAywVUzRFJDh/Lhhjhr3L2QYmebtg+bK7qO1dLibdrcXpYz8ExsCAmp/gjd3
         WqgmRKAHVVHMMOnrhMZ9yws09XD2hxgk2ZOaPJ4PLM5rE5JL7hVRk9rFBeLtKVEBS1km
         v7znbBCwfbYJYN/izQt9Wz0INA+K3gvwYs+mXKs1UOwgdjY9ptYGznILrKDGToN4iP0e
         9FRg==
X-Forwarded-Encrypted: i=1; AHgh+RoOlN8phIOww4sYMS0tYhEtodRBWpjn51T5wWn4QwboywFGpnmn6xGxs8LJbw+MeOOUnRh1Xb/dFpTBcdo=@vger.kernel.org
X-Gm-Message-State: AFuF++nuobH3eCeUmUdOELRl64SdfffHqb72z0XevMPLjCS7K9cvre0g
	yd/QZZ04wcNNjL+GPGuwdQJbg+SE9O2WPrGunqAj4Y4uN6ByikIGuUdI
X-Gm-Gg: AR+sD12K/dxhzI0WtCT2UyKA1DSOyr2hj8GEl65YAkPulRimC3KCx3n4XYg4JcqTcfi
	bqqCMi73RcXrUn/G3Qzi/71vzbL5kYUaxXzn4vjXdhvZdtfEbSEBTb0tPyHEwWMWIp0xWmtlX8m
	7Ttsfu4BQZShGARBEJqyAyWA+t6vkwUlnhxV7aZyJ/Wh251bTlHpGRKvG0naxTchyq8OzZuqIqM
	Mnskr0GWOCo9/xwCC6IlFjiNLKFZIlwJ2egvQGveBW/tzvKNrmJAmxYonUb5Hb3uvb3NLaMhIBS
	Qp+jO8sbD6ZlIAkZcO/8Pm9FPL8CPFU4VaCXpJJtUjYxYcPOvQ102hBIQaKlzaZgNf608VIlMzA
	tAWM53DF02R0Kdq4ciunTK3vxZ94BkSftM4zXYdg3WdGS36vMN8wkSro5phY0oiSNLk9WG7Nzg1
	Gw8GbzoAhYZNXP2v4nv8jkIpOu50XIH40k6YobVh4DzWOty6M+ZXSZ322btyAgwHDe2tHRRaCui
	xUIz+c95cLDVqblHKfPlon4+BuXHojLHmcn2HAff5fsoQdwpe3a
X-Received: by 2002:a05:6a20:a124:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3d2633a1e56mr31289054637.0.1788105802212;
        Sun, 30 Aug 2026 09:03:22 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:03:21 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 5/5] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Mon, 31 Aug 2026 00:00:25 +0800
Message-ID: <20260830160025.211384-6-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830160025.211384-1-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / mipi_clk_div1 / mipi_clk_div2 =
25Mhz / 3 * 90 / 2 / {1,2} = 187.5Mhz, 375Mhz

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v5:
- Rename post_div to mipi_clk_div
- Correct div1 number from 1 to 2
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..cc5604172192 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1122,7 +1122,7 @@ port {
 			camera1_ep: endpoint {
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64
-					<80000000 200000000 300000000>;
+					<187500000 375000000>;
 				remote-endpoint = <&mipi1_sensor_ep>;
 			};
 		};
-- 
2.55.0

