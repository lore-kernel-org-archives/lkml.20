Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909239;
	b=YfVz1Jr3QKSVEsX6c3Vzi1/B3EpHMVWHFMzsL7MzYcruFKh/epzVBoEgDV/7moJm/95k
	 sfe6QMCO2kPJcVy1YNa3Pfg0IhGu5oxt8uhjSu6zsh/OCQmxgV9zdex216Gvur71jMS3T
	 j9UDrRGSAulhzhS5lTKFOSffxjjuveG72XUjkn6kD6R+n1VaqDT7EQaB4lqmZHy0C9HjB
	 VvVjJKtvG0tGDLYc+g9tsXiScB+eoQtoeKAxyNEd1aIunKbroJLrAYOOGTH6jmuvoMb28
	 JVF9L9t/QJoiJxACfo9MqitC57INeG8IeWmHraMynKD1p7ngnmi2IGCa60ja2sjYokQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M8yk4UoM0PWyZhp628ipm0Nb1+FaTd9tnw6+7GjamRk=;
	b=bXG8zeR2Z2IQbWoYuzCOmdk16Jn/c4gkItHsl2A2Hg4V6qpDB5C/EXpCEwZmLHyFPjV3
	 L+C5gdB6gKqn1F5t74FyjLfRJUyrUmidq2iNfN9r7OCN5nbVe5NVVQNKa0DWuTOKQA5AL
	 P4bvwY5pZrhnYUsNHyXiBr6kcx3L7jo27lNhjG3jILNPZ/bgFAIpX9gYoCVxqj/XWJ4pu
	 VU+Ug7dnSCMgHN89l2aF9R9tD0BvXoTDq+wlsinqsB1d+1V4g74O6X/Xwpy0OTUKsS+FH
	 rtOay8fowBX4rpb924uxe92QF2sicjubj8AYlGML3cpp9mUUgFCSCXMXKafOjODG6Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ub1ox8GP;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8265E606D813
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8265E606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ub1ox8GP
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so16925455e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909238; x=1794514038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8yk4UoM0PWyZhp628ipm0Nb1+FaTd9tnw6+7GjamRk=;
        b=ub1ox8GPhezjPHlk9Iw0X1EMDdUJXux+i9QRQ7wB/kyUmsRoRwEtaWe2krP5upbaz9
         Hbxlh9pZL+ZsPFL1WzxOGEXjUs7coUW8OlvXL/CyZ9P4jRSNwCsp8+ITtJchShWjobLS
         VS4jqDWatzVBi5x0J9R2aYUGhWARactIEuNQA5hGwCRJBxPeMt4cUf5AgcQmaiCJzbcE
         63VPl+CKEaQ+Y51TybM7udRIgteXEsgBMhrcdhsAeifodq8QUhC+P41aIfqQ03+J4xUm
         9UnEw483xSJmburH9EKf2VI2ZG7cPzJRZ3VYnFtGGDiHD71LbauDl98eFNnRHS/dEAv2
         rAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909238; x=1794514038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M8yk4UoM0PWyZhp628ipm0Nb1+FaTd9tnw6+7GjamRk=;
        b=rqDTG6uBN8H10JAjJdcxuBcUXxxlJ8ZuX/Be38yQhg2oR4z+i0Xcn+5qTR+5Fcrohz
         HzjZ8RIYimmRZ3Fc0YnSyaKhEpspVrGQstWc42p9I8TAh/R581qNEdPuPFSrwvJYJaU+
         ry8INUNhp25ArnJEuKxshl7MfBZo4UkUh8HGAxH/67wOYaUPb8tvUaiN7wS0070w/XI3
         /QxGtwhSFmz0qlRV9uDDJo1mlfNFHAzrCOg7GtfdQ6wItRgjqUj4A1/9QrQav9QkuN6t
         7pXUGDCLxZCdURCDCS1iMKcskX+w+6FrQEqjOXEFGlC1c0qXDsljo/tBooH5JZiHsZl7
         jjMA==
X-Forwarded-Encrypted: i=1; AKwUvBxOVr9JIv0d0jkhuGt/KCz2ueKe6wCkYYU5hrdQ65llXXAIYbNKjPgGAMict+VKiAijWQbqwuEGOgalSTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NzB8gKeP2w6fMkaRMajVSFWhDU7dca4JbUK37WttavavefyGc
	SQF9uxiu6lKz613tt8jYOIjPmwgcr/UJ8inOiuPfZrTwK+m0HnEuf93j
X-Gm-Gg: AYBFou13hhWoUCQ0rwmHHic1HtXaJwygf/CSnmO92ld3juXXNkoDklgqsXhcUq82jYK
	uH87IAcWv9p5tShfriEA+mCOa9idxAWz44k9srehm0cc0yxLmcwGQn5Vtud2ygUQseBIcWo4+LR
	M25JhJktSLPqsyTnqzLSA6ipbBig/rZdJIJhSJtYlds5JSnCdQQ3s6CB9TCgS2DW22tgR9yq9WO
	fGj9St5Vld7DeoxR0UFzpzpCcMFG41sWyALEPIZzy5qkXKK9QEH23Vew0VLo5yUWtHMkejKud1v
	6LiCFxIEVYG++YOx+Q+D+xXvmyzajH66tj/v9fnt4G6lCHFkC+Ziy7wPCMsM8MWaGzyfKTABxBZ
	MeyAheAiqs/ZgT+IELlXcRpLCnLkxuABgWO+M4DIaylI0Zn/RfW6219+vH5Qsj9RqDIgziSahLK
	prjUAPw6m7PYQCz2+wVM8rRSbiJ7UmS12Br7mIOCDTvaGBe/voLtAfSAwMXfH+P5vcm8BQNpVs4
	yAis7h1TWuM04s/nIPUONUlMGwc5OVKWgmlb5QD5kt+XpmutxunKPDWc24SyPfintCOHfg/bgLu
	sf1w5Xzed1fiH5loGqIwBTulCUIPDY5gUi1wOPCWHJpjmhGdx9mFCwVj4EQ=
X-Received: by 2002:a05:600c:138c:b0:4b6:5dac:b61e with SMTP id 5b1f17b1804b1-4b6df6df5d9mr3339265e9.32.1793909237922;
        Thu, 05 Nov 2026 12:07:17 -0800 (PST)
Received: from antoniarch (78-212-29-45.subs.proxad.net. [78.212.29.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm131671835e9.3.2026.11.05.12.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:07:17 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH 2/3] ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
Date: Thu,  5 Nov 2026 21:05:53 +0100
Message-ID: <20261105200556.34240-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105200556.34240-2-apokusinski01@gmail.com>
References: <20261105200556.34240-2-apokusinski01@gmail.com>
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

The i2c0 and i2c1 controllers on AM33xx support TX and RX DMA
requests. Add the EDMA request mappings and DMA names for
both controllers.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index 57a45609f9f5..89fb1d1eb049 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -239,6 +239,8 @@ i2c0: i2c@0 {
 				reg = <0x0 0x1000>;
 				interrupts = <70>;
 				status = "disabled";
+				dmas = <&edma 58 0>, <&edma 59 0>;
+				dma-names = "tx", "rx";
 			};
 		};
 
@@ -1189,6 +1191,8 @@ i2c1: i2c@0 {
 				reg = <0x0 0x1000>;
 				interrupts = <71>;
 				status = "disabled";
+				dmas = <&edma 60 0>, <&edma 61 0>;
+				dma-names = "tx", "rx";
 			};
 		};
 
-- 
2.56.0

