Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173323;
	b=QD/J1MN7zfVMfHAgmI6cRFAUC4kcIJWJwLFitK/Pt2Yw/8ZwwcPtZiC9HBl7lJT0WXm1
	 gwJpxb2OwW2xt/tdNFwQN9TsKTkRTsJAPlpEZHAhwaljtvzIdLuliLTvRITsPihZ3n+OH
	 q6rOujDzw0TgiQty20+6aWuku15GZcNyIa5vhdPWZsUZrOprW9+TD6OrynZQFID5F9pIs
	 vnsDNmjN5bM8PHlzKQpINUENH4+GsfGIQRj0oeR3KjlGsmu1vjfo07wEYXKFuONU/FIVu
	 dgRR5x+YEBpEq1N1Zk3201+fx40BWC5Rr3gEAZ9vm2UGVVlmo/fFgHJVjsry7giZKvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
	b=0RScJGEFudigsXRcvGWo59Nc9Tek27fPvTQDcGilw6cH6pZVGsBL0TvoJXqE/cq0IVYt
	 ol4TsXCxhplF7pzYqBNhk7Yh196aRxnHqyfYUi0yL2id2bzY3Bzev+C3IoKlSiwo84B53
	 ygEmXlzpbydR5dYXbtUqZimW5nPoK4RBx8QJMbjh8Xuj5avpHrH5Zy+7krkz1rBwAhWQJ
	 k37ntAJBhAY6YqOEbMENfDxyhxf0jKfj45FoWlF0mhaXUe+xC7t5QDrMOQLQC3tZsUEqn
	 EwkURspJvANJmOU0AxXSP1lippMau7mZDp4Uu7GAGHlm0CPXpIBu3Nl9HM+ceep+K1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2sdlhZW;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB72A606A332
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB72A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2sdlhZW
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490f38e9688so195693f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173321; x=1794778121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
        b=b2sdlhZW8w85oBCsA3i2XSm11Bp7EQX90FfsBM2fFcwD/1m/F3LOE4zVmSG76SJZ39
         BmtZEkdbfgCWZsHGnHUxMGdY9/CY5sluFkQ0lhvas64nB+a5v6+ynPgQFgTdD5MDylUF
         UhMK0m60tdLxo/3eUlYr73b7B8XQnZBPN+9//fnvSVVD+TbMCw1NsG1jyRp1WK4lclKN
         eLQnssbdjUDdKSP5TNp9ZMmlfCdpqDlzYfEfWA6wZqDqs66fZ5jLSqHO8OXynN1t4WLJ
         MQdsYfZka0ayuKbjOLMj6//jra0iW42njmxppjWDFlVQlXjqG4BIfOcW3vjzf7zIpopB
         SdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173321; x=1794778121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
        b=u2KqCAcH1VcwrLCaJScn/Ib9a3dmuQGgfrorZQ2FLREZr5janPUEHs5B7URVkbSoIv
         /0VML13EBYe/wn5x0e+d2+1aptoMT9F6RIfA54Kdt8jD6bpLe8zx8U7y4eDBac2Ohhym
         zFCIYteAR4ysYNPpsoeHKucZlJmJJOKJy7hgIsekBPf7/mCWw9sktTx/IEd7XoKcBRd2
         9qTAmRb/elFWGomY+65n06KSIPWDjy2jobvVTAtrqH3usUHQ8dHbj92/mxiEnFoednE6
         xANRnIBvVl1k29NiPLSQsFSc6PvEsQk1W2s8caOXWH7mnIkXWqNOys0OS4IROehpyKdK
         M21w==
X-Forwarded-Encrypted: i=1; AL+hErHbruYqfMuDqHcbffFhVl6RCRejV0RxbsedW/gEaWkAcWBEWMpURadhC3BhQnROeCg1QG8T1TbM1CBz7O4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pvYNNE4nxD/ucvsSsm8tnQLoUwiOS+lfuvwXb5OmKUTfIiDvZ
	cRid6L6PrbSdRAC0x1owPtNaUnLcFo4Ks2SySYRAfzwM8+HgGlwOCu4o
X-Gm-Gg: AYBFou3U8uCaZwW3u8NuZ47ztJcAMnDU5tmRtlYc3g4b587VLIH+JBmNPSzkznM5KkE
	GyIjWpX3OdMyYLWIySUi7dK4IC554c1q4/qChDiene1wjeoE0/UmVqIAEEdk+3wS1Qa6TEUP2L5
	s4VKJRfoNnkWYyWwDWpVV8yALS0l7bYNu48+9UBCUUjHWBSRU5g6e0Lk++C81Idk/1UJUm4DyX/
	SJwuOzRh+PrBkuhiTaqYb8HQrkSQX0QtLbcFYbUpkRpAsQm85LaAu2wbblcTFdSIqZSpqvZZxSS
	uJRkUMa5QxmgeDhVM/2+y3RS24RbEvRtO628xPtcM0Fmj5IfPZSbsgXB9ZzSFhKvC8GLSQ+C4a4
	bVvBOqXtXq2YaTsM0ZWdTz6LN93Vsjvqf4zCTwNk/IktixqDeuR9b/DV9lxdfXBIulA3tzlr4Je
	6IpXW03x/U+U8rgI9JGM8LIEmUDHf45zwOyjU1NZbaE+26z6QZI0Od/+Fz2Ks/7u/Dd2kU4pGEE
	4wsTpAP3s5Fu96GqrLGPrOUTX4YLLQdkjCEyJtaoBzQy60WINW8j8WHCHADbeLLza4bmUVV0SqD
	mvs5ok24KzZR16vSzY5Q7ZGWSxozLQVoUQ==
X-Received: by 2002:a05:6000:4808:b0:491:eb12:e133 with SMTP id ffacd0b85a97d-49589c3e6damr4580107f8f.11.1794173320934;
        Sun, 08 Nov 2026 13:28:40 -0800 (PST)
Received: from hp-z640.fritz.box ([109.76.148.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597091400sm5692050f8f.32.2026.11.08.13.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:28:39 -0800 (PST)
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
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 4/4] riscv: dts: starfive: jh7110: Add the RTC node
Date: Sun,  8 Nov 2026 21:28:26 +0000
Message-ID: <20261108212826.15890-5-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108212826.15890-1-oo.hehir@gmail.com>
References: <20261108212826.15890-1-oo.hehir@gmail.com>
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

