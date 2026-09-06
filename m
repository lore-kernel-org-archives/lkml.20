Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB593AA1A7
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788710330; cv=none; b=r2L8BDdCTXRYp2zJ+1GkyPfE74P/pPBrLP6TRkaACPMQODgw6Hoyp3kSfwnc/j1sHsyZYcy7WF1cYiihfOnllUM2Mrkx4C44Jb8CIQbLfK6sEUoGC6/bYogVSNQ3kCp/bQyZNh3cdv0hYHHkvQomQ91FfWqECWh0sQs81DX8j/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788710330; c=relaxed/simple;
	bh=c57ka5j8TQHkpX5FZRHB8vFerQ2Ws0Z0sbVGbrtSoUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TOeEU4s2pu2wObmea9sP5+9X6mwVMN9OKJGxSvxR3gMr7uNvMjjd/NWdJ696Zdf0F2t5L7M43yWzsKOKdrsoJnXayrqPNSfFYAQKMP2NnzmfWbsbkxF3vrh0wLXarXWthgRp7CVxte1gm3o4W4GeNgO5a+ivGBPMlv8OlZ7lHjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QndspX7y; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QndspX7y"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2077876a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788710326; x=1789315126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViofCTK8v1s13H6Q1s8S3TeyG55pxUNWw4j4G5OCidI=;
        b=QndspX7y6hjuRe/H/QUhfJYShJXqI4dZrVZo2dFYzC3KR6kNTEKX2g1JsaFsBw4TF4
         H2Ovp6zEKv4DWcLOigb4OcgD8Bog7QIEuclE+O5UZ9Ll1lSqw3WaRDrzmFOek/YvPzsK
         yc6jLuswffAGXRKNw2FRUT2e3cIyIUaVE3aMvSQNtRtF5XOQndnqvHZ9s1zg7XvROHtG
         jK9yUT5gAtj3mozjZBc2KMcsVS0UdnV53GOlKSycZsMEp7gALTC5yI5kAk9OoRvqTJQb
         W/tMuS/rqyV3kJ7c3Lm4HvFv2/XA6vHJwA+jPqneVdMSvsnG/azSdamU6KBNeUYV9tEW
         L4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788710326; x=1789315126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ViofCTK8v1s13H6Q1s8S3TeyG55pxUNWw4j4G5OCidI=;
        b=cMFNTvX+PGgyx6U1Nox6olIavbKfC8AdSF2thVo79J/VA8uanJGKdsCj/nJD+YNaUg
         rvA0c5S0S7vXP7EgBZkmyoneE1LaKKf2xMF4hHSbi7S1f6x8R5lHrv/SfsrjiwvRqimW
         9tdyigAswqDq5aOt6MLDh4tAGOaLoXg1SgMMsDMrFHsyyG01iZRXGk36sSgAobEak3z6
         UGq5Tv4gX2hnuySUWaiXu2VIsaeAadOYjhsOV2/EXvyq+72zRtILyABniKbsLGTVJ7UB
         5RmjwQPNMbPrt/qvmy0ItPo+3vi5ucfiRu89tQ9OoKVEsYj0KhkFDIABAkDeu5PI8dX6
         KeTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZdrwJLa2r9+LOmswAGNASacIlo4szHzmABDQAGI5fZ2UingAdpGa+QA6bVZFA8UAJWVmBvnQn+44+8yo=@vger.kernel.org
X-Gm-Message-State: AFuF++m7AJw+HiHQfiQm9MHYi7Xuhoz40orGpiDCVJV6K/GRASl82BvK
	vjUzvWI5rvHKgtb7uNGipC6phfqvP0qSVPMQ527a59Zwe26E7DYF1pCY
X-Gm-Gg: AYBFou0AMwURGOwrdoAl4zLKrns9m6zpKpU0ZD0M5DlNdcAQkJTvZlU3ZJVEtCSpuaL
	xod3cf0cJq1dCu8BrAv9QA/AOoce3ZAfI1XKMbd4B3R7v2uJ0PSTLe2etJ6oGCA4n868I+QB8S8
	poAUzv3tV6+vLxj9d6RY6oc9bqlT2RArKtMm3RxgdwKC+++n8ORrlry+h+wC6beJDw6/OAtUPgG
	8iCGTiwMxTW8ckk5CafVz63bAa1UExxwzpbUvSZEPSMKW/I9mk9wHIxYOVpvH4AruAPKya9f0sB
	pS5L9XL8rEbUPl9YX076O3h41eO8Y2bo46uDLVlK5JFVNmkBdOOI+Za240ocYlRAGgwPSOqXMGI
	8wa/Ce+U00zHffeyAQknl44E9LYHpcEfTjhMNYjzVO/V6NSRChTgcj+jORkjJ8lyU3IUMWp8L7W
	0abWSwVYdYLPfV32QIFLe35UfgKhOPkQwZ4iG9jUKf+sanJFHgL/l30y+b8X0rRkK5yB3M6u6nB
	1SW0GfpKAH3nwYnIUK2qwTiMswpGTj6vqIpHFPBCVIWsVkckevM0QHhP9j29InUMkg=
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr27665796a91.16.1788710325448;
        Sun, 06 Sep 2026 08:58:45 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm15941401a91.8.2026.09.06.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:58:45 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 06 Sep 2026 23:58:34 +0800
Subject: [PATCH 1/2] iio: adc: sun4i-gpadc-iio: drop underflowing
 pm_runtime_put() calls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-gpadc-v1-1-92d3dc8ef355@gmail.com>
References: <20260906-gpadc-v1-0-92d3dc8ef355@gmail.com>
In-Reply-To: <20260906-gpadc-v1-0-92d3dc8ef355@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Quentin Schulz <quentin.schulz@free-electrons.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>, Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788710316; l=1267;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=c57ka5j8TQHkpX5FZRHB8vFerQ2Ws0Z0sbVGbrtSoUw=;
 b=RK5suJBjW/7xSEGUZXgfUBlPW2TReDkIU+aOrloVKr3mhcpiAxpWmhUE7ZU8jgfIYEVZ2MO7Z
 ioAF8OyoqLhARn7gFPEsWticTsfzL14FepGKSvjltcW7wOLyhMyhCXH
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Neither the error path in sun4i_gpadc_probe() nor sun4i_gpadc_remove()
ever holds a runtime PM usage count. So the pm_runtime_put() in both
places always triggers the "Runtime PM usage count underflow!" warning
on every failed probe and every unbind.

Drop both calls.

Fixes: d1caa9905538 ("iio: adc: add support for Allwinner SoCs ADC")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 203459ca9907..85382e435f2a 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -657,7 +657,6 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 	if (!info->no_irq && IS_ENABLED(CONFIG_THERMAL_OF))
 		iio_map_array_unregister(indio_dev);
 
-	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	return ret;
@@ -668,7 +667,6 @@ static void sun4i_gpadc_remove(struct platform_device *pdev)
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
 	struct sun4i_gpadc_iio *info = iio_priv(indio_dev);
 
-	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	if (!IS_ENABLED(CONFIG_THERMAL_OF))

-- 
2.53.0

