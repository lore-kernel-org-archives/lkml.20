Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987771;
	b=TbfjX9RZcLjSvlBfHnrKnXjraW7nM9vc0UXSLcCYAthiYhUVWEL544i2lZOhwQW/oWQS
	 ptzZ9T1KMA5Bs9YWodoEkiyCxI8w+UQR/fE7e+fjtLBEqcC7IzhPj5/AVop+tsnzo8kMM
	 Z/XcvrEMr7OY7XYyJPdUdmJdwPuoV3vkPNBY2m4DyFIINqxWmdNO2clDBhuqYD2uGqRxi
	 QHqIWQWmVavB6Q8WN1liITrYoTMDmynknCi5ITmzBuHSAtGtjI5v3AJPxlc6mlDWsyqTk
	 Jqqr0Zp07MHSMR1zOWsNRyVkzHfRfjcoAgAu7J/86NWPkGFe3CU7xjSVZdBG/207mPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
	b=gnPN05kOIvtyqQ45uL74qP/T3snazKU5X0hfno4WIGqO0TJo7rsLSYY+TNd+vUPqycUc
	 j58FwT6qZUeaDnWE93TLN5FRygvc0v37HEYWrrlPiAoj409hg8U6HSkzaiZrbGEokJnpr
	 oNH8H8B9znl//XtlznTC9rpHhI37nELNaODivvNB5qpwf48yHCzzfyBzOllHfvSf2X9IM
	 IaWjTIo9/5Fka4n+fsGg5xlNar5XC0zKa1xgn79QLgRjneQ0jUblZBjTahqki3TO7XTMg
	 4nvgALK4s7j8D7nnkYseil3STFsqm2ekOjo4kq7wRCaaCPR8rTOk0YkViCI76HeukWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uUH3TMPQ;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CCE606D805
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3CCE606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uUH3TMPQ
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490f38e9688so766364f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793987769; x=1794592569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
        b=uUH3TMPQ1yqfOWZH+L4gSxy7Y4FwnccmDu+viIbWjbFBsqr2yT6Ezee+DbBKjRYoMN
         ih1K0n439/4ZxaaqUDFl5ArkGZbA3xrp2apW06jk1AP9CylzuXHb4cVlYysr0HR1m60V
         7Ef5ZG5ssw+DpmXOwrLdQTXg0A4CbtRdTbdSyHx68BF9ZVsrhcA6RWeSkvoCv+8dtjck
         UaqhfL2c9aNZoIqCPJQQDtS5//2IhVS7ANlnFLzW32EyaZJf41NtuSnmzjkEKTMWT0qJ
         6f0BhMvrrx7LrdQQFP8Oy2F1kn3/7Nq1Zd03gHEdxZkJKyj3INzYXh+8Q75IiO5uJl4j
         f7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987769; x=1794592569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
        b=hAsOWTGQMR0WgW9PIEEf1IZbxsXMIhxaZFLZxvcm9YcsCpVi3hQdyWbtmv0oe6B0p5
         SqnptCNGjr3CAc4whX4ywVcd1yAfayOapHFeZ0L9v+gQs8Y5f2XF0lNJCqoyfJlNAaPT
         ruijx0HvNJh5sFz7n/D2APRJ7Uxb6oXrOo2QxQ+odecuebYtYwr8DA3JlpMuNphDqpgm
         xwMqC4mU96o2vDeSBAwp/kPr2b5naJYLuUsSVOYKB7RHZ/MuQIjz8gOjJOSYuRBWuQ3M
         Ag97KHO/BM5PzXn5KNmzcFlVmKAzT3aybBYSN6FK8vgrj2Iyg+/Hsa2Qz6yNRGvy/Msw
         aOLQ==
X-Forwarded-Encrypted: i=1; AL+hErF83KFO1LX3mdfH1M6sAe8GNsJIAc01KPGHERRPt5+V5owB7paUBsgUioq+0QwipnVbDpwa1JnVOk7Ib9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dGfJS/IvwMDh5l+K0F9v6+2292V/WJFtX9NKJw9y6/DGB+d94
	Q3sYzgTZktzliDX/vmgTGAa+SVIQjYDzOPH/lPOFok7bhtYt5D/CUIZT
X-Gm-Gg: AYBFou1ai4GrbjgPVRezHcgz7F+KJIhQNvYXrMxptmD3wMlUZvAD49zsLT+atfisUDx
	Q92hvRUPo4ILrfldxes1BTMKTiRNHoZ4zrofDJw2L/HFfgSyCX1LdeHkKLsiD0tgSjQEg6vKESB
	YHXFKXevds/rFP8jqvuQlzG9nzBggEnGXeytmM+E5EmHhnpIUPvMNkIqQnLf4Mlkng51BFFKrxc
	jhX4kCqD2dzXm8tyqDMTmzp9OnotdNVQMhys/IzfvVxAFKsrWCamS0MVPdV90dT6kp/foE+uY7G
	gYhQeteezdN/DBI61V8xCChx732BIzMPUaD0CJ/Iqt43DtetbmlstSGxs4tW5jNRpbjOt67Stgu
	W9Z+vgl0QGiuIrcoZ0AM45aMlaGHfkADjt4jF/k4GsLSX7NHt32NClygKThs8ZkSNbFAUfWx+1S
	xf48E9A5Xm2K21FFNXS6kyHzmPqwAXUmQ0D0CAfbVaZ5dHN8xgJpdWEmv6UgLMvJdwDQ3JQbiJs
	s3xSihAxT8+RuLngSdeW7W9KosWfmzqT99/TAfh8Dx0kKA69p7uqxII6YmKm96vEMimCv+Kai4p
	JNHF3nRrYskRULEbbOx2f9Vxj3Y+QpY=
X-Received: by 2002:a05:6000:2c09:b0:488:8347:a110 with SMTP id ffacd0b85a97d-492777dc1fcmr7593332f8f.7.1793987768982;
        Fri, 06 Nov 2026 09:56:08 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723283dsm4649612f8f.23.2026.11.06.09.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:56:08 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH 3/3] riscv: dts: starfive: jh7110: Add the RTC node
Date: Fri,  6 Nov 2026 17:56:00 +0000
Message-ID: <20261106175600.3877614-4-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106175600.3877614-1-oo.hehir@gmail.com>
References: <20261106175600.3877614-1-oo.hehir@gmail.com>
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

Tested on a VisionFive 2 v1.3B.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 82ea63f71..14f92b942 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -1206,6 +1206,20 @@ pwrc: power-controller@17030000 {
 			#power-domain-cells = <1>;
 		};
 
+		rtc: rtc@17040000 {
+			compatible = "starfive,jh7110-rtc";
+			reg = <0x0 0x17040000 0x0 0x10000>;
+			interrupts = <10>, <11>, <12>;
+			interrupt-names = "ms-pulse", "sec-pulse", "rtc";
+			clocks = <&aoncrg JH7110_AONCLK_RTC_APB>,
+				 <&aoncrg JH7110_AONCLK_RTC_CAL>,
+				 <&aoncrg JH7110_AONCLK_RTC_32K>;
+			clock-names = "apb", "cal", "32k";
+			resets = <&aoncrg JH7110_AONRST_RTC_32K>,
+				 <&aoncrg JH7110_AONRST_RTC_APB>,
+				 <&aoncrg JH7110_AONRST_RTC_CAL>;
+		};
+
 		csi2rx: csi@19800000 {
 			compatible = "starfive,jh7110-csi2rx", "cdns,csi2rx";
 			reg = <0x0 0x19800000 0x0 0x10000>;
-- 
2.43.0

