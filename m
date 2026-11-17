Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936530;
	b=OgglldcvfHWlFnBYvdkuKDi2Uzsp5PO3/Qo6bxwQnfwObuRFOOJihZlVpy/8pto7iiOn
	 1LsOTsh2vqUN0FMcRM10t+omZv0jcTpVcAPoTaUKOca35icrhycvM2j7mlYFLXKdi+YVB
	 rmAI/SgFZYwQLZyiowOyxyInf9Ez8kEOiRvtep643KHGrGkMPpMNp432DOyndACKGecXr
	 NoB6DAMH8J3M8kiZS7b55ZFZ+zaRpeLXthvfmZNbqhcbl+xV2J/4Wu4032wL7U9qRIOlX
	 z/jp6t8hBz8kGSJN39P3mEFasRLlWtVvjTTzXTjpNvDLSctaA3Jr3+iLLzsytbdDZXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A1I4z1aUO9/p85/RlMfw5TI5KhCmT/Op6gBboD1szzg=;
	b=OxQ1WbUOq0w0ELCtps2ysOUPmZnyyuQ9Duo/q5htyD612L+pSrYbALdId9+cRjwlIILS
	 kg81L9SGhyFPbBttvNJJY3BkLE/eRfnRjcW6bJSFmgGiGEvLgxZ3NjE4crHs4BDJP0bpr
	 StTTsZSpAjC3cEqmzppYOU14h+y8bP/8y+ha63UsaCMCLZbS+C6/qSKeHXjONagrPojqM
	 epqeX/S/+Mh1cElY7elPWcHmI4Fx1Tn257a36ELYyzWagXn/PYdmQUpuy8E4FdqFZiBYa
	 Ep/yUqZTYbIdwQziKBL1EvXO/VNviMUpUK0yHbjXHqUWMN/sB2pRzcqyCvAvLsjOxNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PD14KbCb;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC0C606A336
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC0C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PD14KbCb
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-48ed0b68895so44320fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936529; x=1795541329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1I4z1aUO9/p85/RlMfw5TI5KhCmT/Op6gBboD1szzg=;
        b=PD14KbCb3IBMdSQHnWBJAQaO38QghirT8CO3wdpYoHbiwqYq159qlJp6r7we8D9WF+
         jUXEe1o9zC/0uiLYLkPnhkJXN63z5OgO85F61Dc8uUKo/F+DxS3XVDxBbi0Y8csqppv2
         FHMshgjVEg2oebQOsXoFllnuLRX0eNX52ODnXUoCRSknUsuGxzPZLYZkBqfmnm+i2cVs
         K/RvKhwem5UiBphM+qxmFGiKlBFvd/REVSmleq4j/2PgIWbMTC4GsvqD4bWK9Kra6P0k
         lnIrWCjKj+9IFOHRPwjHQlxeR6I/E9o4IHcJVWCgjpRtmVhMXGgUeNbTqKIRiLoXYIq1
         luTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936529; x=1795541329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A1I4z1aUO9/p85/RlMfw5TI5KhCmT/Op6gBboD1szzg=;
        b=D257bw8I0qx/3H6Gw/B3Ptt9zOnAr8u/gzp0y/Zk9zfrxNHHk8J5hH51cMYZ2Rv/bO
         xkLQGrAfZVcraSQlPCbTi8yWgNl1JhxNtIAG+EvfmEV08jFLhfgDGh9gmGSc0D8rUw1F
         /iZLHWODm3wRLyPnSrywL+pMgVZqp1PhNpzVmN6D0ui3NeNh8/hYg7MVCvR/TzrK2MN+
         v8MXRZqbofP4bTNWYzGX3euNbx8UTTuC5+G+b/wpQCoqi8AntKm5hg4f7lBU8xug183e
         xbqNF7oF3+LHa8eDqkJjZ5U94KLmTHRepkkHSl9b3hvWqniMKxldYUKhMPQ43nQQY0/F
         1tEw==
X-Forwarded-Encrypted: i=1; AL+hErE0AKLD25wqxJqKwNd3gKSr9ZaCncrZ0j6j84o+6kKmjn8NXVVrcaT1yBAQNBwkvD3yifa2uz8uwDXWj7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0zIWEr/cjFyA0uc+YLkrPU9LIqMseig1A7WUsRH+HHaOQdNYs
	MB+cgzb1ZqIGTOi7eSZ5vG15g6QNI4jG03lggZSXmgp8XB/zCOuNKtfu
X-Gm-Gg: AYBFou06f/sYoRRAmjT3eJc/ow5PyUWKyWdxQN6VHJ+Vp7HlfDJdKQs8ewqXhUNhTp0
	e832gUvi3FTVX8+GahlaO+QSpTPFWoiZiuV0SjUsCMR4htd0KE1DMwnm5AsRVN+0MhLnFWa15KS
	RaE2P2rUm/eeLgMZsoOs3+klQZXwi8REyjwAoky8wKWucxR58mH01BoBY8m8knk07VrwjsII7om
	Rjvoipsol0b4iK5Gp+plcqfPFL2TAe/R7YpNSUgZzRfYM8XFH/XGQxfHR3jD21zGnRu5dgc1+Kv
	l7RiTySQHLrs3XyHkq7sAySngVIhWlqbYOOHoHHBcnYCnRqFUCKHN1jvls4fn7b5EFiHk1J4QI2
	eRZf5K3J8Pg2iHZfotwoJZvP47Ajrp8+D2O3cAGjOVCFtsmPfqc0bq2kgXXL8iyNAgclHBUsg0Z
	I7gvd3sDY9vyamvG5uPrJaOLiB1zPHBrpV+t5umQiMcMsoQi1Nax6NuNKoqS/KoVY1oNJWZgyNl
	B+yDwTAug7GZRCpUFiCnyMMBlrGk0S1mP/93hDb0lPAPGjokDuQ7bGh6mcd0Wlh9gW55/Nfi4wt
	Xw2gKBX96pgeEohuF5r00KVV7CXvvA==
X-Received: by 2002:a05:6870:1707:b0:4a6:9418:da4e with SMTP id 586e51a60fabf-4afdf7d9f45mr11592986fac.60.1794936528546;
        Tue, 17 Nov 2026 09:28:48 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70d5b1c64sm148358fac.14.2026.11.17.09.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:28:48 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shawn.lin@rock-chips.com,
	diederik@cknow-tech.com,
	michael.riesch@collabora.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	daniel.lezcano@kernel.org,
	tglx@kernel.org,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	david@ixit.cz,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 2/2] arm64: dts: rockchip: Add timer node for rk356x
Date: Tue, 17 Nov 2026 11:28:42 -0600
Message-ID: <20261117172842.65346-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117172842.65346-1-macroalpha82@gmail.com>
References: <20261117172842.65346-1-macroalpha82@gmail.com>
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
index 7e23f6983448..3c7178b013a5 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1389,6 +1389,14 @@ i2c5: i2c@fe5e0000 {
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

