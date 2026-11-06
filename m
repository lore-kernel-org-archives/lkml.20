Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953837;
	b=BSemALpvfpbFtqx+qFpLGz29jR4dIuIFOZTwueoITvb95XEu+QNKM8sNxIFf4j0scz4X
	 jxkMOt0jphIjLhtnLLqnfDMy6wGNvd35SK0/qhsc9opcNJ+8l+XVnRGu0pj+fEGFKkeUj
	 bEvkovBUf94L1acroGIdg5eBDW6t6/RxcjLil6Q7Vt+fuvfNr5pbZ6YyD5fQ4Q1/h3Knw
	 QBg83wlOlMKcNXVWS1rQpO5ycDF3O4wofeZ62qhedqE081ozEBfg61BAXfA4wJI8bLzK6
	 qrUbykE7Dz+ij7lX9Oq23GcG1/SMXO1gPj1tOhFBkLh3rLz+7nbeBfkkH7naDaR/Klw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VLpvOWiOg/0agPCz0eeaXl9nhZwnrqFnecxOWRAu+hE=;
	b=Y7MbO8ButnIWVjZN62YObX1+OJ4bog4/dVC/MqlWMm3M7FU7Hv7Vu2Y9zL1QJAjIGQ9E
	 logIiwcQckdcFmHAwXoTcbfn1Y4puX6X9+WgWmg4ftU4bi1Kyl/RoJRjSZD1kgJWkkctV
	 B5ahBHVciZrVT1X5CgbKclQ0F4tpBDsJRq8FmuaW8dpLqy03Ug4QMYQ6RNK1yQz/N/9j2
	 Ke8mVvPak3eOBvCiSqo4YJSjZWrDgLZLZ1Tg1MJdMptPNFkLJEd2TCZoti9lCgeki3UKo
	 rpKmKiPJlaIMdZsbB5MO+3UGWWOfmecI5UpaR2yWzU9qNLkSYU1xDaCDGM2oNRlmMzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y1eY3KP3;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84362606D80D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84362606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y1eY3KP3
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49134c8509fso309668f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953835; x=1794558635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLpvOWiOg/0agPCz0eeaXl9nhZwnrqFnecxOWRAu+hE=;
        b=Y1eY3KP3gUC2WREteGQ5tKEYe5s3n0BGTbCtGv1+dyHdwaZ0qcXwHLBXys/2W8YHU8
         mMvi7yD9IXYTcxzl7tbSF8l1dcHpigt/dVkgwwENE+ZOlOi4YGsesxOuYcTqT3z5N7qj
         IZZEIYMeLTiaa+PUjI6Bd3QrS/8Ss26PVTAc6TKY8TibOS/HEP7TABU3kI+4ZjU84I39
         7YTLxMctNVlZsWII+ulLTV9dhdGBauvzZSdBbSt/rZ9QfMsmhHDVCFNnWO1iUQ4WFDYJ
         450Hxqyu7Yne3NPJ+Z8hr4+EnNiZyDYYr+L3Z9K1zv8rhjlWpXi3VPsTBoQPwq7bcqU0
         ooQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953835; x=1794558635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLpvOWiOg/0agPCz0eeaXl9nhZwnrqFnecxOWRAu+hE=;
        b=nATfb3j+y6ScdekW285rqsfhHmNbGpjbtejhC8IqfqIipjKAMe3u4z2m6yYsiApkzq
         0s5qa3QOcFRVxHCs0Tg0ZCRUl1UjOEY1Bh7bF+QmKQSYV2m2L6OTtgfbiD0GPyHFei9L
         cNCJujTTWTd/8ik4eSDhyjvZoso1Qv8YhU7FQV+avSK6PECeOUTBNQn+5y3Tqdfo57HM
         XD1+l11K7x+nIq7qo8GVpvDzACjemwkpHBJsHYnxG+JE8nhXyTeswYrcqeSIXu+aj06t
         ubEwKEI6YYE/6NHz5LfFzO0M0yvPHGtOBYz8ff4e3bTaiK25O3UKoVOy1YxmWT0/UsYI
         QihQ==
X-Forwarded-Encrypted: i=1; AL+hErF9FsV8d4yQkK50rDW1HzFkFBX7/UFy/FVxwnXbm229y0SofSP7JAO0xVo6JS0+ITfpb2IZlPFtBVZqzdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9ab4Qz8QJ1nguHm+reYhYPQ+Ldn237ChzyHIEvjXk07vp3ITZ
	rhw9ZvxT+/ieHyQmsjaetP6PjgmgFLR8RSrchmip6x2GhbH0HbgvENxt3n+WaSJtEr4=
X-Gm-Gg: AYBFou0r2B8/8w2Y5z3yVW4UKE7XdKNPpjF9MLuafOqo+hgOalsS6KPQ6loWoejscZc
	P01JHa35p+8aWhPxytb8tMSZlb8KCFFYedW5pLfGSUk1RS2OKtI7Wd5Glf4i+EMKeQHu/nuGtCZ
	taAM+PuN3+9/nGobmc9WbzAsW0x1UXSwotnDOa+IOeHGHwHA2uijc2gwCcRvgY/LbmuBKr2tu93
	9hRC0B2S5R2MftowJJB/IAjxhrpYA7bhu2FIS3TP3s2lN2I7ScmCZOyjjvx9z967xhJj+mSMpE0
	Vx73Vb5aefHP0vwFPc6qJsMiNPal778f9DyCji9E5DUFGR4icieIxcPAWLECDnju8FAJEALVMiN
	UKegYyDVKM5xANMuy6BbXhce7DigKmmyt7fvz4DTx5eMpxFQ7YlsB3eHHMhCMtGSc48q0CJcpdj
	dU6rXZvBveLc/B1J8lY5G6DLcLI724aCAq7B3D7gVsnMBTZ2AfWZn4Httj27dvCWZ2U5B2psEZA
	EPgPXjyQTVolUXg39ANiYvM+NhM2nOXJ7cFE8JV+SZa4mLJnzCfHzGQ3isO3toy+4YuycHqMyH0
	lMIiKFRAdeVOicVURBv24OH3dKFcOW0yPhqU27ThbBJ6aHo4cVAgT+cdpjWNVDLSkk6j2Erk9Hd
	JUbWEZX+sv8MEc75VmiUqkNQ4JYondNcCxtmHZ1kwhnEIEA==
X-Received: by 2002:a05:6000:2384:b0:492:b880:53a7 with SMTP id ffacd0b85a97d-492b8805664mr3030579f8f.5.1793953834697;
        Fri, 06 Nov 2026 00:30:34 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:34 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:25 +0100
Subject: [PATCH 2/7] clk: meson: pll: Support PLLs without a pre-divider
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
Message-Id: <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

The common PLL code assumes that every PLL has a pre-divider. This
does not hold for the S7 HDMI PLL, and the S7 GP0 and HIFI PLLs are
meant to run with theirs set to 1.

Make the pre-divider optional so these PLLs can use the common
implementation.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..44b33051405f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -76,7 +76,9 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 	unsigned int m, n, frac;
 
-	n = meson_parm_read(clk->map, &pll->n);
+	n = MESON_PARM_APPLICABLE(&pll->n) ?
+		meson_parm_read(clk->map, &pll->n) :
+		1;
 
 	/*
 	 * On some HW, N is set to zero on init. This value is invalid as
@@ -174,7 +176,7 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
 	*n = index + 1;
 
 	/* Check the predivider range */
-	if (*n >= (1 << pll->n.width))
+	if (*n >= (MESON_PARM_APPLICABLE(&pll->n) ? 1 << pll->n.width : 2))
 		return -EINVAL;
 
 	if (*n == 1) {
@@ -437,7 +439,8 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (enabled)
 		meson_clk_pll_disable(hw);
 
-	meson_parm_write(clk->map, &pll->n, n);
+	if (MESON_PARM_APPLICABLE(&pll->n))
+		meson_parm_write(clk->map, &pll->n, n);
 	meson_parm_write(clk->map, &pll->m, m);
 
 	if (MESON_PARM_APPLICABLE(&pll->frac)) {

-- 
2.56.0

