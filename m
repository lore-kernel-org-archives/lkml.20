Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC54E3A451D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 15:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788710335; cv=none; b=VYAj2yV5F7nAP++xXtqCXRfuJyb/CmCsT4LiQS+cENKgIg00zNFcXCSCb88HSNZp7k6Z9ILDgz7Ea7Dfon8/Os9VmAY+IvmJLRMe9TgTRA7soNLEdefdCCS2PewzJyN4MP3WrmPCXXeXF30LdReBVTwSrwWmBvQTVxPwbqlF1p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788710335; c=relaxed/simple;
	bh=Wt89mC38z1SB+RdqE6/iGje4kTh6KTtVF8QpLkUZBJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RzfGScvWUgAq4joBedgFE9hZ8U4OUNTnQ7SwjIBqq0tWEjSIcZIIDb2FhyKgpys3Acn8BAjO7oWP27Jf9bLeNchJCdoUWPlNDoXzPnzUX+HtN+1GhY21/RKskPPSP/lgp74oYnEoD4l19ibBu8v5fkcNA7cHpi+6sBHNAJ4SwSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4kEOpBJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4kEOpBJ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d6efd73032so31745895ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788710330; x=1789315130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0nEO3AVU8BdN0/yPVQNPwgB0D96TiBKB6Di1KmEt1I=;
        b=m4kEOpBJVcVA5TBL+zxuxQwOOzRL6+7e/3ac+YBixfvtuW8EvUzooukKmAqEYxY2cX
         KqIDhRmj9aspBcs9XHIZEMAh88C6N3N1ioLmj5yoWyMJSkM0Z1xJNbuiw3KabM2X0XCW
         FzJk5cdRocC7yzo/0DzLBHtpMX7C/rOJvmX/ScmoFH2VbxBWlLlWheCh3d9uG9CWrCUp
         JiBL9CbxLrol8hVkOZablsDEswPwweAbhgTsVX8bYMfxSgR19QJCNGGtRGPgxcpZSckI
         KbIXbmB5UVtv13+s6kWTxgN3nj4g8O7nFB/46/CLrzHLIJRjT7sdO5LBbvmIvbpEK2CC
         +xrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788710330; x=1789315130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0nEO3AVU8BdN0/yPVQNPwgB0D96TiBKB6Di1KmEt1I=;
        b=chGSJz0z/pwjCH1j9sG1rlW5Sq8RW9sSLhbPZ315aOSoakI0ewM/M9v5EPt+QIHAXJ
         /caeyezq7hxPrpFH3mcLAl42oEbQd+5uAUmw0/DHKbx0RdzAQ0c02QhRJcTuFJT64S9A
         dDL5BF8OiqgExsfmYgCV+NpWyfGBFveu/P595oZLNHaSz/1KgF6PHZ8xIXgCVzb+DEed
         DVOd6akFsKP+4CEZY9pvi/VW6/Vl3FY2UGjGYuDBm+iSrtoHUBP4YRGPmacivDjxNnxm
         XKfX92wIfHyNq/RG2IAQW2bBrRHCKB+QxSa3NJaM0EykTFUBiaBnOinFrhr5iWayRmjR
         jqCg==
X-Forwarded-Encrypted: i=1; AKwUvBy5QYadtLnO++wUkdVUD8BvSuh2IPmqtoFOSo6wVzA+0UUlOIOqvatv+zGFtmnH9WtRUfZrTwjAHY1jI78=@vger.kernel.org
X-Gm-Message-State: AFuF++nAkq3SiKeQdRbIL63lHDZGPZ4euEZsG3xVVgHNyOnl6WKQtcBt
	2nltKzW9GCxNlWTI1HNgkxTgV++7kJkRCS/6tFOhUinnw7PM93fvtmpT
X-Gm-Gg: AYBFou1AI9qHq6xxt85RWCfA83yG4MwwWwj2Tzr3FgudxaHof/HRk08KigssI/11MUN
	ruEvkGfXfRYGhXR3fdMdYjnDcEGv2gkFeDF3/0+IFAWA5gsaEeY1THkQl6sTrzLZLlXD8XM5w9u
	FSPHPEESfjLYIUGB9gSiHHt/9/pOpCRMCp4VfKJMttdo0UBLq29RzuTNbIXl92JMqiZcDIxJmrv
	Ffo0ZPTgUo/32saiiV/wnwH20y/QVYD+PQAWyKN5eyjmsUv1KuBeFnmpKV8pBpUqiLRHEwAVrWO
	eqUXmTgUwVqSY90/3qO1jfv4LV913Q4uxNPUnJfckBdFYaFv6rU+dyRIadLwK4B1m/Rc/Tl409H
	ghKfOpYZnMCaP9jcP91MOsIHmnEDAWnQDGH+7qc9299DfXUfixGxbaIJu0/AR0a6dHEXV+9N+24
	D6+sy1QF1SFUXZp1n6PelafxObIcdhWQwv6urIBW4XvjPZhN/wUgQPaFYVT0HXVUglfxpZPo8M+
	DiVDUSdTdQxHIl03SKwV1Hq/Us3q/5pX8O1ZR7nlHFqTwiOm1id4XEd
X-Received: by 2002:a17:90b:5484:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-39b27c0fa43mr13496195a91.1.1788710329826;
        Sun, 06 Sep 2026 08:58:49 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm15941401a91.8.2026.09.06.08.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:58:49 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 06 Sep 2026 23:58:35 +0800
Subject: [PATCH 2/2] iio: adc: sun4i-gpadc-iio: clean up on thermal zone
 registration failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-gpadc-v1-2-92d3dc8ef355@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788710316; l=1124;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=Wt89mC38z1SB+RdqE6/iGje4kTh6KTtVF8QpLkUZBJ8=;
 b=oha1atVR2mqFYHAgjPpNIY23PNkzfXFXSgJrMheeJEnqaNoYl3svWtK+Ma/SC+uR/OUo2QZH3
 3h/DIP34cd5CTKVMzJcWpueUg07gLh1FmVc3T4LYCLOKHZWRSurCtUr
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

If devm_thermal_of_zone_register() fails, probe returns without
unregistering the IIO map array or disabling runtime PM.

Jump to err_map to release them.

Fixes: b0a242894f11 ("iio: adc: sun4i-gpadc-iio: register in the thermal after registering in pm")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 85382e435f2a..ac5ba76b979e 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -638,10 +638,10 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 		 * thermal because no thermal DT node is found.
 		 */
 		if (IS_ERR(info->tzd) && PTR_ERR(info->tzd) != -ENODEV) {
-			dev_err(&pdev->dev,
-				"could not register thermal sensor: %ld\n",
-				PTR_ERR(info->tzd));
-			return PTR_ERR(info->tzd);
+			ret = dev_err_probe(&pdev->dev,
+					    PTR_ERR(info->tzd),
+					    "could not register thermal sensor\n");
+			goto err_map;
 		}
 	}
 

-- 
2.53.0

