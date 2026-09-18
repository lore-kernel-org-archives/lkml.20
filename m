Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442183CA4BB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789698026; cv=none; b=km1szPpplK38ZjZ3iCxV5RU+mv8c+hWFUj0oes15gpVf8zkHPgaO2uSEwB41FZCtB+dyMrx4H2jWuQC5OQ7N7abk8r0P+u/yeTgc9ce7ZgZqN2sTJqj5QQfe2DnlGkkrn4PLdNwhnfTrIYctLQLwP0Rx9gkDTmASJTLKxD1wx8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789698026; c=relaxed/simple;
	bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AEF0cI8dxZ0GTet4p6IUJjlS8GSHKCeniE/8a2NhXYCU8oOpYmdaBb63mgfq9ERfogNeAaqgs2f11On+aHDrFPkBiCTYMs8wpd+2Ua+bKpuXkH2VE9LQG+XWwsR0NayY9Uy8O8eK7Q1sLzOiNUh3YKYldj+lgxoPW+ai6AooWds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmZgAq0h; arc=none smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmZgAq0h"
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4c3bb46aaf0so125463b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789698015; x=1790302815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=hmZgAq0hFCl4Fd5zm2GTghfOilvCvZLL6bR2TV5c2JXjjNHkbUgoPSULN17tzwf5dn
         7TuoJ7pmq4pnxGrlYx30/rXjRy086CypdtLnbqEYfp+bbWwqWrM1oTDCXOLeMftUOBDX
         bEKwHtHhkFgP1ohfu4FSHk88cM29yZBELBFMwtrXu2sATt+BdksQpiSLzcOQuSWJsupT
         V3aAl+nncjOXbNWVHX4tQ2GtG7tB1IyNZH4Nh7x+0JI9usZdaR/LKJSMtH7uu5opuk46
         7bN1yvzNCbr063i1RX4SEmfSyEUF7tQFeBAx+GQcjFRTalshZD62slsvILKk7T1lFaz2
         GsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789698015; x=1790302815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=sE9J2JzylronSn8PNVXNpF8wvrogS4LRY2N9iK+8/yeNKKZkOmVQ8Dl7XMORw5LVjr
         YqF4m0p9M4Sta0uVI7bNyn/jp9hyLRQuuxF1C1C0JXdOnCUTHLaXG3XmWlQO/+V/D1kp
         xfmVMmBzJJP5V4JBvG9rLF26Z9b35mJ/absJMofDXDPKONn95tOfTmoA5sdAdi/uvftp
         1Wzt/GYe62RxIs9kfovL6MUEt0NsB3RMqZ6HBMmSn1F8uKYtdBs+i1eBmL8f5VzIvnqq
         dvYYqQgcnIJ07aTQgrHnZKU50mSnU84uaHG5H2GNaY9QETNdlasTI+TDnoJIblIAWkm4
         vr7w==
X-Forwarded-Encrypted: i=1; AKwUvBxchl43HVt3EqD0avA2RCWzPAulu4+hxJSN+bi5g780mwrOWOpvz6DL26uyY+HbcEASh7rddsd5HowgmVg=@vger.kernel.org
X-Gm-Message-State: AFuF++m3XZGRqHd3roOk4FQHtgFNJSN06ZTCl5WWXsCktMgm4dTtDphS
	yr+LLmWihmiix9leaPaoJiRAbiEiFNCZsDDeCp9ZfnVzdpE/7pgL9Qjg
X-Gm-Gg: AYBFou3OX1pBNNLoIvx/vt25cZRLcFgzsEbFrKFQO8aC/5vZTFurP3g6MqVgf8hWWjg
	h1g8YpSGApUWgw3s/+3qkQdPJhkKKhVDHm2ODulPiGjENKmJAhH/eMWXUNkOdSyPMb+/Gaavp5B
	EaSyqwM1ECa6/YIfgNAsIVHFRIVyHvKpywyeE4Zu+8gc6554+lK/Ml5ubIf1WuoZQJYyponF8tS
	PdxiVXmOjHtq2r73t+lp1l/Sh6BqhgvDf/YjwQooHiinDN9kjBfITyDOOmy8nTVGyK1BnBfjp0S
	5WYiQk82YCDBjv3RNpr0lypCmXWWoRmPyY2GTtmByTr1LGnh0/iRDpN9lcIn2dc2eib+Xddd4Qk
	aoHC3UkawGjUKxu3vkXjmV72YVMZ7+KsMzAngvAVY0vVtZ2CsibrjvPtoggyNnmZrDuhQCd3IsJ
	9N1S7BqA4Gq4gsFA2jfyyUbxzfXZdNGLJAWcXDrB2Eyy9sOiDVKrWis1o43OztWV9xrw==
X-Received: by 2002:a05:6808:bc2:b0:4cb:f21b:6f98 with SMTP id 5614622812f47-4ccf9b8f79bmr1640523b6e.43.1789698015057;
        Thu, 17 Sep 2026 19:20:15 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e5226786csm295476a34.22.2026.09.17.19.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:20:14 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Thu, 17 Sep 2026 21:19:52 -0500
Subject: [PATCH v2 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-3-db35882a6080@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789698008; l=822;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
 b=5AvlTzf3l8b4LLef4GkI1AU4KWt0gDt38qriJ2bzdYxbLUme++T/DOctXG9bxd6ylcEF2KKoj
 2xObESmwo23CDAaFIvEw6+yWIBFc38l1dxVsxUSc08ka11Xc1GqGfja
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..5d5f816492aa 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
 
 static const struct mfd_cell mt6397_devs[] = {
 	{
+		.name = "mt6397-auxadc",
+		.of_compatible = "mediatek,mt6397-auxadc",
+	}, {
 		.name = "mt6397-rtc",
 		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
 		.resources = mt6397_rtc_resources,

-- 
2.55.0

