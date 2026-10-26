Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975401;
	b=RJXsqip5JDxGGy49lStpG98b/aFXmidgXFrHWneJZ9h45WSyiy5n1veQbiqk6UTta+wR
	 WHJRxGzTsPm53ScAiG6KTFUcv0BcQKmiohLHD+i77KQaTSY6AdrM3WwHDGXm7SgEfYLvx
	 hIskKUsufjwDcnHr+rcJN4tG3/QjsBJxjJd/xl7hOL7YnVfc95SbUXHEOThktJeNtTAj2
	 xab2on3WTGS77IQdnqh1i2FlTMWY1O4MzGAPhV1xWS3BJSm/u04frzNqwGnnf/ZlxiQzE
	 YCf4E060a3VNbRhiabBA6LYG8M2CWHwJiC6/1SEYH8lGm8DsPp8M5UZrZ9kOQz76cJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mdvyCnUTqtKZWJP8Qz2Rtn+aEZNUKTGAttllLV0iXqI=;
	b=uBJn1A6T2IMHLjXrkZ32Lj3fG0xT9lrHFfIfwWmE/cif6Vlnw+mJUF63bXWOxwQORYsd
	 j5xjvaoeCRN1Yip0Axd2yTdUcg7UemI6rXxNpZS6VuXeLbyt0GOIT32L4D5OZ85U8VCi/
	 tFMjsL8PrE/MZTJLIqVTlHKarzKHmlfwR6tRvK57dK/FutrzD3+uKD870oY/GHPhWm0vk
	 gRGx1Rj8kaebHlriKJx13atHmSXx07tH3MPR7A1vjO5VJJrj0kOgs33WxEgtOEBP1bHWc
	 4UGnUemtCvaXQXk2/u53JVquuapSZ+bRRhrqVkWZIz3O45c5tM+2Bup2UU/g/XdUqQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhHjseQF;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A15606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A15606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhHjseQF
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso9344545e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975399; x=1793580199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdvyCnUTqtKZWJP8Qz2Rtn+aEZNUKTGAttllLV0iXqI=;
        b=qhHjseQFxPohnXGosRRx/o7M2PLm1bfjxu3ALxwY1b1hfJ/c1GtwK+2xu7/q3VlV0J
         HYct1VN6Jp1wj4Bta7FfxZ/oyC7OFqGw/a8wI9caJXy8grnIYuCgBd8mAs8bsDWS6sX2
         9agAK9Eszln109iOZV7sJkxSMlfhCo5NsWAKI9f3yuMwPLUBXnInZiMNLKmZCoTf5jPo
         XOX/2ZmHyyVbSQcgHLytv9q231mHYYnN0Hq1Gi/XGLjs0ner9SyHFRuf/DbrcB3w+0Jl
         ku6fNRrOKoJnerHHCRFK9JfWQfs6KUNBrKZEneQfUfzDU3+VDSX6ZSMWu5uUYBq8NsnO
         HR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975399; x=1793580199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mdvyCnUTqtKZWJP8Qz2Rtn+aEZNUKTGAttllLV0iXqI=;
        b=HOZvRlREmIXgBsj6o+c524EWeH0RaMyrqp98YIHENMUGGyS3rnoUMTNZpRGaKKNzox
         55mxvNrXJBqbLqYj85I8OHsLgH07l8noy50xOuAE1t6P89zw7bpD1efWQvKjFgEoqlYj
         BiOHw6b19sYbYHy8gT9fUirAsa+K1zSKr89sY5i2qpZd462MJfW/nhQSew2t+nGuXm03
         6dnIOMbpZ+t4679iChlqmCqulXfLsF8PC0Wfmk5pJwAVa96/9TFX84HVqZzP8P9srDYm
         zsvINRZA3IZBRiRldo/7jG17nZqozFC7g02AEbX+T186RRpbaIc3sKQxrbHpDiG0HYzm
         dQGA==
X-Forwarded-Encrypted: i=1; AKwUvByWPYHQ8VDZcjDTQ+Wv6cgzrMSIWxUb4NC7JS8xrCwGBTvwOXDlFJH9/Rf/ImHjo3hdzM/krd/wtRTIgZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnm6gFTnkgzIwoXu+UDMgZ6zvByKarM7q9qVDZwFnBJLHtDCDG
	TiowTy6DhL2QevL8OAIdlZgbIzDr6kovArOgFn4ArtjAphFIGEG44hls
X-Gm-Gg: AYBFou0G9u4VK8Ytz+19m6Nm0SJOt1eCGbsEUwXPjlhnJfdee3HmmdpAssHM2h5OFT/
	U4TXyLzOCENZh2S7GruB3cLXlO3gziU4XA0o1npGsjfM0t97ofBs+daaczeIa/LJZVYeU38GOGw
	bTvaf88eUPB4zQyosycX5kBqqDahM+ls51gZ3dlGWdlLCb6FhaDYH5aMQfTUlCk6OXPjZ/HScAI
	X0Wv4Zb9BhBt0oZldKZDVC7l9C/vtQLOBEDUN72kTFqQxDDgdaByGJmwL8JZU9Hg39q9r36ltWv
	V2NyqZFMAv4F69g4cpVKtcYTyC7dK3nAzjP+gyDnN4ivkgMaBY8WNoB7cR/RG04Rsqp/YGYjPTu
	y3MKiBP4P3gotu5OSRrrrCOUP2KSW7EQDjPWrBC5P79P4aMwdyS9fRBiQpCyWTruSiUtgu/xwCZ
	kj3f1BCO85RKBKj9E49eWmIWZToYUSe6RcsdugXSXDdo969vQtYmqEnhjfw7DLyTTks7K60e6kB
	qk6KiETux1CMaOMNebyk8X3X3a1oBndLrNIdJBXci4rPSTj7pYt1IwmPWFhyw94r4hN8fUTj0cm
	wWQniesPLVpTZA==
X-Received: by 2002:a05:600c:3b2a:b0:4a1:71e5:9420 with SMTP id 5b1f17b1804b1-4a35aca4e4emr92594645e9.13.1792975399138;
        Sun, 25 Oct 2026 17:43:19 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:43:18 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] ARM: imx_v6_v7_defconfig: drop the SY7636A MFD and hwmon options
Date: Mon, 26 Oct 2026 00:39:18 +0000
Message-ID: <20261026003918.155321-8-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026003918.155321-1-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
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

The SY7636A regulator driver now covers the whole chip.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 6ac42c06c1e9..bd1f692dd7b2 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -223,7 +223,6 @@ CONFIG_SENSORS_IIO_HWMON=y
 CONFIG_SENSORS_JC42=m
 CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_PWM_FAN=y
-CONFIG_SENSORS_SY7636A=y
 CONFIG_THERMAL_STATISTICS=y
 CONFIG_CPU_THERMAL=y
 CONFIG_IMX_THERMAL=y
@@ -238,7 +237,6 @@ CONFIG_MFD_DA9062=y
 CONFIG_MFD_DA9063=y
 CONFIG_MFD_MC13XXX_SPI=y
 CONFIG_MFD_MC13XXX_I2C=y
-CONFIG_MFD_SY7636A=y
 CONFIG_MFD_RN5T618=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_ROHM_BD71828=y
-- 
2.52.0

