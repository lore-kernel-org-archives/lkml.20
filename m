Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793733821;
	b=yYUz6KgR0cUCbSnLVFAkvrB0iyyMgr+Atib6Hq65SrkUUVIkGyQcv+PhTpvQ5pmaBTA6
	 9XfnQvQPPuzoHe6DOYny/12LJr0gGyFGsAZ81wPfYfjWsp3nDL+AX4C7IX9cP4PR6S2QG
	 U/XJqI9Ypf9UVMO5I1PdQulchlm1SDrwPXAAhXruGGmNL58JTqSNCdzOrgvJ65cmwcnWo
	 Pp8JMJUdJ22aiAp3wOBy+QRv1mKjpyCvhSd5U4dISECEhJCXhTptmr60X+mqQzQ1U7ldh
	 J71y8UC/H8Q0WQl15PblubSD5cVkVgFmhcKWyLvp5Ucnh3IDEfbP6SiJS70uuH0Ugnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VTVjbTeG+iIcoknSp2y3rgvXBTLyVqZrj1BvDpiUQFE=;
	b=GYjl6UrTXHjFi8E7HSt7YjJNxCH0sXOIKy5yzAbilZn+nYGFFCKZQFlk2RmPmSSmycpZ
	 1VdzfqXj3ao2XTFyAAvVFcwlNnXmv0it7s4WlVXtRnB9EMWNTCxNNDvx6mIMHqA9/toMN
	 vjdzjCGDiCC9iBZ0NR44pw+mWICPKKfN0y3ggzbSEHT/OzAboIEEvOM2ztq1gpYaac5BJ
	 kPbgWEO53Tm7kve5P7hhI55ktszt8B7yJikYu8BhlXNIQP8vvyUkvgkHwv+e4SBNebhr3
	 Ywv+Mh8nRQ7yOlnvfORTyVlsE++JDCPeflDwakcF1d5Hc/nQ7IOwZEnu1nR8JCWwoQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UuVY1uYK;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717D7606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 717D7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UuVY1uYK
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-845f3fa7f38so1974847a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793733820; x=1794338620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTVjbTeG+iIcoknSp2y3rgvXBTLyVqZrj1BvDpiUQFE=;
        b=UuVY1uYKWCAEpdR5KDEqV2VJYoWh2HxSRrJvYXyC998J4n5Ckcrdy6MYHXQLlsrDOl
         AobIfLO3alLOa8vSZ53ykyQy9F++ayFlu/YIark/bPOiW9ElPy+Zy4WCqaqq+QBZzmar
         ij/PCSHMUB3YYFymnImP4RN55EWxPiKFtHw4WyNZ0QKlxNUoaJ97v5g3vOQ2FllUd2yE
         tJOM8AqL4LGEvwq6an/8fymCFTD+jktLe0yvBPtIMcnWsj6NpehQlnrv34QJUlG0/a8n
         yxnTzJeynPGYOy3IJH30XR5Y+TZXY+1Rjfr4LcR+I5rZmx8Ec+3Qk95o2BVP9Yj1UHXU
         xk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793733820; x=1794338620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTVjbTeG+iIcoknSp2y3rgvXBTLyVqZrj1BvDpiUQFE=;
        b=tp/g8c+4JvS2GJASDD8tfCF9J2O172eNasVV99mRLIYqzYR0/8sVnAFUgcsXtNLkA7
         RZV4OHDYnMMF8ILnoXyN371C9Cl+t46UZIsbwNx1QNHr7/pfoWxwDp9yxaS9eimwl/XF
         +rUZTkvSvxIX03j3+LxYuqsi8wCE2gOZPC6mBxpbAhYzdPV9fZcI8ubIxpNHPoHipzMa
         2xcGW8kSgrslvNl2uNEe2NyMHduO+1RTWlvaXJWHq8ul6HV3+s7I2NlxoIm1tTlPS5Ce
         pkFVu60rEMJa+u6Z6r8vNJtNApIBnVghQHfgjPak3JY1Aq2vlWHjwEKMY1LPuBgnkJId
         TdIA==
X-Forwarded-Encrypted: i=1; AKwUvBxY6pYqNXMbwKazRy5aR9DJjW3sdMdyTBzAgOXs4SENoQExLYnU59npg5gB1kzK6oU1YnRilS/pwcYmxvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EPvlO2i+VXuDGhXKkIcdxfGp8a8ePbRHsKac2dTxQQtmxjbO+
	fivvqhobl99x6gCqUNCryTAk57LiYH9lsVgEp5Js4UqflAYk2Q+LnoIT
X-Gm-Gg: AYBFou36Tz9EE+fVkAoOuHnen3vPQ+FjlbHZlnbvGTmX5fQWWKOszagaaxH40x8sT1T
	cTQIdWl0iZkEeqcewXXn3z7eho+49z93QXfyzMJYKQvL4pAFsr1pHgwxTxImPzABxRpOqgqqpSQ
	h79A+EZAXataKwnj7G4fAIVAlmpigTP8J+UnY8XUdE9Rwe0CaY42TMesWzBs6HKvJga/WpyH0bJ
	1fUqt0UJYdSUagOtNwTqJgPFiN9iX2lLVIVzzlkcUFU94nofxIT1gkKn2rlRx+zmNyEVHjZEvpE
	vFqjP6tIbkMn8pmx8axg2K5B51frvF9AFw427Vcbh+iVqZ2i1QZY53rEJfbv6Fe0mJ6JfJwWvWg
	S1Vxsmhv6YREpXI4q0NujAqyCPaM+bxdfMO1de0xSvQJWMPZJAw246OZaeteBAnjf0KrnkHEEtn
	pP6j+xL06PO7HBDG+1DPNtaO5GNdbZ/PnDIaD+JdMu30NmV9T2yt28ee/lkEPlIImDIkAFl4rav
	HS3Uj2TIhigEvyxfU2VFQkh5LFVE+8Ztw8rf9dLC6FuqHJQRFIgO9aVGl3wkt162S5GmUbbMLlG
	LDpFCZ0t7nZeWwTVLd4+wh8Us23W4A==
X-Received: by 2002:a05:6830:680b:b0:822:e8ac:7d20 with SMTP id 46e09a7af769-85d3651d32dmr9328662a34.6.1793733820420;
        Tue, 03 Nov 2026 11:23:40 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e16ef1sm43323a34.14.2026.11.03.11.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:23:39 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david@ixit.cz,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	michael.riesch@collabora.com,
	diederik@cknow-tech.com,
	shawn.lin@rock-chips.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	tglx@kernel.org,
	daniel.lezcano@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: Add timer node for rk356x
Date: Tue,  3 Nov 2026 13:23:31 -0600
Message-ID: <20261103192331.394489-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103192331.394489-1-macroalpha82@gmail.com>
References: <20261103192331.394489-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add the timer node for the rk356x. The timer is present at the SoC
level and is register compatible with the rk3288 timer.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 1a4562df20ee..cc3faeb9a86d 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1373,6 +1373,14 @@ i2c5: i2c@fe5e0000 {
 		status = "disabled";
 	};
 
+	timer0: timer@fe5f0000 {
+		compatible = "rockchip,rk3568-timer", "rockchip,rk3288-timer";
+		reg = <0x0 0xfe5f0000 0x0 0x1000>;
+		interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_TIMER>, <&cru CLK_TIMER0>;
+		clock-names = "pclk", "timer";
+	};
+
 	wdt: watchdog@fe600000 {
 		compatible = "rockchip,rk3568-wdt", "snps,dw-wdt";
 		reg = <0x0 0xfe600000 0x0 0x100>;
-- 
2.53.0

