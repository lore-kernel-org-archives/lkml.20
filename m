Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FC0485951
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364919; cv=none; b=tEg24/jDHxts93ZPG7qhfYaAEC7tG4bNonNKZYaUVm4udwCzLwvoj8mLmqCQQLCeO17D9DkO0RunBXOJlfHpez+z77iIGFgGDzAtnPAkVU3kwpwPlb2cuFA0d8bxre6qNvGik//cwGG1SCEvR/IhClYXPvb/DMFSt2TyAZudG+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364919; c=relaxed/simple;
	bh=Dpq+FO5QbLndF4YnGvOsuU+Pnen1hEqYaV9KK3NgiQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GqkzsCAgXigfDEF6HVyBXMdtIdK39hsp8s0R4sTUOJLxPH6/wlLUCwOdYMqLsvacd6ZlQYQjeNTCuKiGq7YLg15rWm1pTtttmpZNL3jo2I9AlLoT7cNh2RYvpGP6i8iZDYmdvWLTB4iLdIZ/ok0a1wTivN5U78B0WwzcXUfhXIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3MK+Zf7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3MK+Zf7"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e60f9af6e6so2947555ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364882; x=1791969682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1J1BmnMCHIN1mCq8wvdeA2+rRcjtrkkpWyNZuKl0xQ=;
        b=Z3MK+Zf7APYobFc2IwOnyisZeGC/MmecXpB5IO10qhJkRak/W8kKIuGZk/ksqf9qLt
         zh9JQ59fUd1NUwk/Ga/bnnevJjZinE3uNUxvaDAd8LRCqrRZRsIxUwBIrZQ08WzBjG52
         2KqBA/ylDZylKOyWoc4vYOH8DhBHrhgUguSVQ9pC17jWcA3KyrF16P6/TatLJn1hAgGt
         X4DEO6HMu42WzG5uHKf2oh3fd2A8vW4Xjo/3RQn56xBZSrWa5SSbs9JE8yy27j4ZIYT5
         ZYf1oW6XHWsntDFrJwjxSdQDdehshNo/JOTnRxU0NOG4domfsjt7UNKHD/zus2OpPInY
         TU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364882; x=1791969682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1J1BmnMCHIN1mCq8wvdeA2+rRcjtrkkpWyNZuKl0xQ=;
        b=h5tP//9HsplYXx3hkaVruX+MLd2LuH5X7woLpfswxLlqt0dursICIVh95HM2RcYPxZ
         QEtwXF052t7gjQofcTAlSE1f37teGJxaWPCuCNhEpj7QnYRt5V+PcBRboj2Kwb+oiVrI
         3FBreyxdop7hDgUKt2GhbThXJtIMZrg9lbG1NGmjHgbSPUn9nzfcpM+r04jy3e16NHcz
         WyIfY6BlKuOPLljZiStS9gioHB9Swr1clKduaMyKfel0JL+O0cALq3FpJHPlUKcPv5TV
         Qnpd6TBig7dKe7S6tl2mBQGpsfMSAvOvft+IjsPg2njtcsj5zoxFBhPF0kydqisWkjbt
         kx1w==
X-Gm-Message-State: AFq9FYKVA6PBBtaoSbzhgvfLUtip3W3XFh1Zr/pJT+QS512Qis1h95HK
	1kuvDs8LaGDO+/NBaZybdmnSU4LsL+wIdpGWEK4tCqI/uTVVebCaxm5IYjJgOQ==
X-Gm-Gg: AYBFou0Jp5cA2qLaJky7iTkBOJvd3GEq8hFbRgEeDLa01zPS7BTvc3Hu3nBtqPl0L3q
	stLT6S7kicUUeHanquicTsv9FA+xj/8Xd3JZ+OWGJXRKjkGXYKm2q5RG+wM3IhDB35NW2bfsSkz
	CdtvOdJMWUDeROqc3CnZKf77AFW4EM9xiZPBCkrvB0HUd8Et9P3igGzZCM3Zn/zqvg1MuxQo1Cp
	fqvZJ6Ohb1Y5/MAOU71cnWsLoTht9E0U5oxAvk6gTSn5hxYsdIMmq8xRYAxOHdvqunL9CNxlcOB
	F3d93w9AnprtgBu5za3A8Lf6o6Qr/SS3EF1XL08tDpo9Sm9pA0oELNAW/l8weFCuJteefltcX9T
	cqwI+UK+g9zLb+FOeljeI/U7s9d3Rgb8CKTGoj4Q7x8+ykFu6eHWn9a4/3YZFIg3M9FAYXyXCV6
	oGMaYnSDgj5Xa+Mj7h+JwYBy0/05XHlPut1KfEuGLpy0PVV/JIxxwH9smpsmu2e5rQHhyT2EynL
	vygncXFOFgwyG1xTLVPRXRaUPb3WGguny6VsRpX
X-Received: by 2002:a17:903:1a87:b0:2e5:d33a:88da with SMTP id d9443c01a7336-2e5ffc3bc98mr17065405ad.16.1791364882232;
        Wed, 07 Oct 2026 02:21:22 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:21 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v8 01/13] gpio: nct6694: Mark the GPIO controller as sleeping
Date: Wed,  7 Oct 2026 17:20:50 +0800
Message-Id: <20261007092102.3768818-2-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007092102.3768818-1-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

The GPIO callbacks take a mutex and issue USB transfers, so this GPIO
chip must not be used in atomic context. Change the can_sleep switch in
struct gpio_chip to true.

Fixes: 611a995e8ae1 ("gpio: Add Nuvoton NCT6694 GPIO support")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- New patch. Set can_sleep, as the GPIO callbacks sleep on USB I/O.

 drivers/gpio/gpio-nct6694.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct6694.c
index a8607f0d9915..a38add1cde29 100644
--- a/drivers/gpio/gpio-nct6694.c
+++ b/drivers/gpio/gpio-nct6694.c
@@ -444,7 +444,7 @@ static int nct6694_gpio_probe(struct platform_device *pdev)
 	data->gpio.set_config		= nct6694_set_config;
 	data->gpio.init_valid_mask	= nct6694_init_valid_mask;
 	data->gpio.base			= -1;
-	data->gpio.can_sleep		= false;
+	data->gpio.can_sleep		= true;
 	data->gpio.owner		= THIS_MODULE;
 	data->gpio.ngpio		= NCT6694_NR_GPIO;
 
-- 
2.34.1

