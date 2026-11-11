Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377455;
	b=xwxcDnnxSRXMGg5Jjmb/jW0DjHyjDp5BZKLLFZj4zM4Aqd5LlOC5V1NhbhG6Z3pm5PR8
	 1bwijxHtGZBL2vHiXTwYRnLxNZSR9Xxy2vE4hmiUt9tNu+S3l0GK5SGg5mA4JbRssOvy6
	 VWRS/43xdH3WalJF3/vVLvCY5muD5GDH2eiRUZ72qezKfvrrj/5T6Ta7d4BxqrhybHNTw
	 3ixNnirz9pkNolkBeuIJjBE/D9lUfEdmS7pM5we1QpvxveGysKj4bLDcwibBuGKEIRkgS
	 3ZnPjYJIQ1JebTSVILFjdoE24N0tWQgYbjZTZGToKjSdc9OB7oCluIPcqCoFVciNjQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=adTF7M2gMHj7eJOUoZHUfGntqMgezvSTHYPTjsdEjag=;
	b=IuylhIAbSlAonuFBRcpPH4tpA9LVyvX+zFzIwjOby7LlHIwKbrzHCBAxCrJ81Yfn6Y0D
	 LkKhOVwUCYiTxVwFoWVqrf/5Ovg6M8GorE1sVDHywWNtRllQs7kKo6PcdTY0eNrd7cn7d
	 Gqi1Zyi82nBa9XmkRbjGMPBG9BtlezNBlJwN31eTAbgvgr1fWf3lMUUwLBRY9uOqBmxxj
	 h3aPvSCY/MwmiJpMVB2UjYANZDRLhZf7Nb5AiV6rqkD3cBRHaUcwW6KLxs6fWfS4YGZMx
	 HXr7cX96Cl+sxPkg3iT1UeyHCQVu1/5xTcM3p9DffM2PSPfIFHzZeTCO5lic4KRsoZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6e40DwZ;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F088A60A2624
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F088A60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6e40DwZ
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso1111362a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377454; x=1794982254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adTF7M2gMHj7eJOUoZHUfGntqMgezvSTHYPTjsdEjag=;
        b=S6e40DwZvBCO0GbODW1XBQuJZ/WBGA3yYbGNklf+dwxcqnKhdg0NvTCzlAKhoEqFA4
         ogE+xzPC6h6ENz3xFYpdYRMqSNF6TXW8UP0l5DlKOssRfdzZvpw6Mz3kHIvEsT0OIJdg
         OByZW8qeQxjwdqcGBRwQJgm3kpKAiuuIXmzghOG+00Zjxp5YG/CUc9KsAMSHbAwQF/a8
         LCPYgi8XVEZZazWGDtzRswF7fzBRR4BatWZ7f72eI94e8SBWEAIxtZUgckGqNWzlQmUg
         BisVZQ05drgoOQewG76GRY7L9hdluqqfsJXOpeMjeVIaYVznPxEbm0JTAceJYYSRgwaI
         pQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377454; x=1794982254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=adTF7M2gMHj7eJOUoZHUfGntqMgezvSTHYPTjsdEjag=;
        b=RgC/6WOW9VQqKzw1mK+aJxP8xflQ64rr6PTZsz5dSqNSXvpPq0IEqngqQdTB4RFAgt
         EoYk6VrPcCn5Dm6ItNcRAR9wbpLvdZCVGI+ND5xm0xgjYmJ6Qui6NK7NDtJjLHXjbsf7
         qAkRX7CXDFTcqDUIWojLBHCvRmo6jG77QaVgjdGqk3/FUljJveK9s16L4vf/yKuP32K0
         87SMdnm2JMr96+JInFreZkhCO7IF0AWltlLo4q+g4yNTBMXm6Kz9rDc4oZtemckiw616
         fj3hXTzuGceORnxjgBXraYXylFpnfvDvGZJMscCd8KQhjWsSYS6qSN/twLTogEL/ftzY
         Dpiw==
X-Forwarded-Encrypted: i=1; AL+hErHDq3RmGzWsakZuP5AWvO5RVY3tQzy3luDGxoH89RtlUyw83qXgWQvwzfR41Z65jaTFiXQaXyuS/QFhCCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YLVNtiMP2FSZQ6JF/pNUvCY2Vx/inagjFnSKxy2yzvK8rKtqU
	3QZgahu4rycZhR9nxpQBhzYUlW53WRVEvXBMmBEye1avXQmZdnZvIo51
X-Gm-Gg: AYBFou3m+RPUKZsKHdgLNuCrrClOcwm6ix90CEr1csWK2XKGw9k4WoQuwFPFq+pbkLX
	7LZ96J1b1Jr85a/51sd+NQFbdwcS1pjGfYx3tM8mYmivcrMOXvwZcEtdPTpLaXnUQ9+DpcMl7a9
	h9Lq3SgglCEDFzvss8nDNf4J1rhRPWgwEl9NKGoTCz8zeji6SthhRsM6PAY14jhdLNywyerJlEq
	emmMElAV2AZULLfbJ4MK6CEcZ6uCdme69f8a1mGweR7OcGx3zmQjyQLKtxIAZOGhT9MjUOnn4JM
	+N3+PY8MVh6Rb0BHY7Z35iwuv6yKVW9+E3F+xNRBM6JyQ6o7PFQMXGgC5q661EWa1cS2QBBWkD9
	zd1lF0FMSFn8smb6tadfsQRptniL0+vFewY8U4y32tSjVI5FgWASmf+xV+J6SqDQMpuwowFZx0W
	QSizlt36odmOnOXWQSw59KB0hPdGGm8FdOKBhcAtty+grEZu11tA0YyOn/mV2CouxNPh/noG76h
	kJbb99gzi3TzymoIb6wkP1Yl0XAMjengckyIB7YWv/ff45NvP/3lql/kqHd/LKzo/PbVCVYsHCI
	7rpLUVPfbiHLQ3CKmkklzw4XaXbojlCtEquCrbi2wGAI4zhc2IpNURsAZGOXcDU0fNMQ
X-Received: by 2002:a17:90b:5910:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3b182e12787mr1641552a91.3.1794377454347;
        Tue, 10 Nov 2026 22:10:54 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:53 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 14:14:45 +0800
Subject: [PATCH v2 4/5] ARM: dts: aspeed: ventura2: Name the USB-UART
 bridge reset GPIOs
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-ventura2-dts-update-v2-4-bce5b5dafc1f@gmail.com>
References: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
In-Reply-To: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=uxlzFpBewTlOUpIvaHC+sQHRHy1iC/2nchos0sKDaSA=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af1Y75M000yKvj+EmMiYb+D2UqM+Gjo5QTY+
 aYZCRbqbnKJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9QAKCRClg0K3CVbE
 gVrfCACO+o3U98bHLfj9ft+SUDV7IbCt3mftqCSoznSCfIaMiRMu1dIttWlQN2p/TX6BzUrsEcK
 ax4g91upkLZ/tHwX0pDAHawfcgNbviAQsmglRgvCNxhlk5ZvzQgAYqrDAzZkj/oxX4hx8yrPimE
 UJTsTTFHDLqBAVOGQ5pcPvnnW/j7NM+lOctLzK6kdFPWb7fedDRM10xaj9es9NJLMrx5LNONiD8
 TRq/DBbh4x2C5EOhPo9nfdKuvOsl1JqZo4i7J84arpRwXTVzAMGjlyQgpr6vr5mqd0RPCSd8CaL
 8xUw8eJFejqLyk0H2J2K0Hd4AtvI/XZknibcG3HHZD9vUdNz
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Lines 2-4 of the PCA9555 at address 0x20 on I2C bus 6 drive the reset
of the three USB-to-UART bridges. Name them RST_FT4232_{1,2,3}_BMC_N_R
after the schematic nets so userspace can reset the bridges.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index c683ac19aba3..a5e6cc94b280 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -1937,8 +1937,8 @@ gpio@20 {
 
 		gpio-line-names =
 			"", "",
-			"", "",
-			"", "PRSNT_FANBP_0_PWR_N",
+			"RST_FT4232_1_BMC_N_R", "RST_FT4232_2_BMC_N_R",
+			"RST_FT4232_3_BMC_N_R", "PRSNT_FANBP_0_PWR_N",
 			"PRSNT_FANBP_0_SIG_N", "PRSNT_POE_PWR_N",
 			"PRSNT_POE_SIG_N", "",
 			"PWRGD_P3V3_ISO_POE_BMC_R", "",

-- 
2.34.1

