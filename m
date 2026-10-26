Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032186;
	b=F6TKs5Lrla0FOhE4dSHn3CALC3iGDIvAFv+SRggxsxMRJPgeXmnNMnL6zASxv5i3ZOYj
	 3xtIhflT2y3sTPVqsf/uLaPVPl30Cq568UGHcwZmQF6xBiCKiDLUsbp7r3So9Kr4xoWRP
	 NJ162/ubYGLwSRuIXfYCzAwcpxCK1BwXmxpnaZBkTuxH8fmPMwSE5MVAIroUrc+lfajYV
	 cQmO2EIpQFfWqaxEuDrb/QqUIoAPJdoZrCOW2k9ijAl/gpsmFBaukvJOpYY3rEK/t1lfH
	 jUIqKbptlRFaaVr1ZMDhZs4Fztcxkzxl6Lai5wwtpn1ts0wCRMsLPJu+azxZoqrWXSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=KYicqebf9EjrinyN51JvCt3VsTjS8J0EC5zey8IGKsU=;
	b=j72lzwzv5ykYIHlf69HvQmHykZ3YH3Xik8C9zi+Zht3mu0MqBP+4lM6EOqAQ0atk/p/W
	 nlG03w4K+8Cpf5eyREhZH+3q2y4/dnZVerNdHPcPd2I7rXNRHV0LgJI41SK95tObodeeX
	 pb4oHNbD8W5GjqRLZoD5BXv9NKhgkbCZ/OmS6AKaVWcU1yJ5PAcCG2hm0xiEE8AWm6yuQ
	 tZl3rTDF1TgpzBIAQDGAsz8lJosb378Tmm/U4NHCxxsDSBo0WZQ94c0eE77LQMlQHJ0F3
	 KN0IkpEbrKxknX6vJxa6D4hmQkF6rre8NPHK9vQePMCHcIhxlCwzG4lReGrPS4nOKkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V7GNI24r;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F8B60A3804
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F8B60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V7GNI24r
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfb76b304so322381f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032184; x=1793636984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KYicqebf9EjrinyN51JvCt3VsTjS8J0EC5zey8IGKsU=;
        b=V7GNI24rchupu9qh2hxZXm3Kh+XCVPIfkJgU6U+r5cnsDKgszsX0NBMMcddgNRc/J5
         DKtZ90SLqiwTepwMZnX3H4iQZKb/pPRhS7U0yyXmfSoCBqIABNFksRpI0Swl1oHmiaEz
         ZUlSn24Biz9wGBFSnr5W6nNffOBE4PR2jCFTqlmulHbYze6l1NaSbidFMz9myEgV1dJ8
         Ani4yobOydkiTGvgMjSacgI6/U9uQa1+3oqgqy6GWGW6imEWfySbzOrgiq85emFkMuPl
         btll0oqHC8gYS2NcXFWLpjwcbSRZ5C/2d1lk7eMYSyhZdiO4IA3u92hN7jIEhrQEj3Xg
         pK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032184; x=1793636984;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYicqebf9EjrinyN51JvCt3VsTjS8J0EC5zey8IGKsU=;
        b=na8uwN4p1g9aLYhKb0Ih/i+qap0hp+7KPzdNQ1Of+SmKhH711bqIMbED+fQWD6430m
         14baciDMTkNqejsENLfQhMsi8evFlpZP6UjRHtM21mpwPEKRPkOnPtesiIbr2ZN1s5uV
         XcGKMFBnUM8I8z+aPiPFAS9rBgWSevI++zKGfINIv8gzaRMsqhbfTcDPPBzPi3S3HE1S
         BORqqnZRwbfrlPiJBhPMl+Vxaw4w1O/gCh7om1KeArFgvzhaGf8MxSeoapIZ/N++Po0E
         AAihGC8LtpLB99UFoPwA7jHZOBGKOA6xcoJzyaIBswiYC3WdTahv18DAPo3zOluJp0Mu
         /yNQ==
X-Forwarded-Encrypted: i=1; AKwUvBygG+TgWLxV/ri7tIO9VwYmzPjn39jH/KOJuge8iyeRy6Bv9nEAYZnscFKn/XhNcq36d8SqWTtsoZfkaII=@vger.kernel.org
X-Gm-Message-State: AFq9FYLllSaVCZY57rtXuXyRfxQXoEWFAfTU5+tQNeAqmvITVNz1dmPU
	1Hh0AC/jlk5mn3eTPtr6yOFjXSHzS2PgQwTYnkg6/9XTuVu7acQlN188bSJxgs2Tg64=
X-Gm-Gg: AYBFou0hnFj6tnAob0SXd3y9OETyG5w/zg2uHlLvT0O0PtINQDlhDTno6ExRXfP/w62
	ce0G4KRGdJc4yawiNbmPhZ91ZE6i7dACIPFK/5oqoPta/Frexa5ShH6jK7m32Xi+yx3q8ArvP4c
	B59dQQLrusZnFp/tmGogLMXg7t7sT0GWQoQFsBgYgjqYLryi7oleNjjlvqJ3qNNAf4gUcEX574B
	mH82xvMzqAWgmN+kwBd7/b8mG0XaNTl2Ad5nxS+XrElCCGjGnWiNB8TlwCHNJh+gVx4wgINyoEE
	NV52+65a2xddQJYZhvDfxHdcesSvA3Nzc9XozZmbN5FiiKGnkokyf2bA6ICRES0/tdDrG8Z/tXN
	UZ/nCdgAq+pS9dgT/3yc0+Q6sJpXQZfDpu7nTvbUAVDAY1KgZATRty4wf/uz1OwhlAZ4kVMKtUb
	a5nF9aN7PBisIm/eFfm+kntHI79BDwj/1Gri8NlZ2sjxw10GJJMYz59noPuuMcSIQAOeb4Ld1ML
	lBcHvEkaOr3TOcZUGvsfPJxmfhQPtfQoHYqFXQkxvHwxnk/mtI6GI0omjHPb2PchegWCs2rM98i
	Db/IGkghmPc8thEKyYZIKeBSTLqmVV/7/4yI7GFpgb0=
X-Received: by 2002:a05:6000:188b:b0:48d:f6d2:9c8d with SMTP id ffacd0b85a97d-48e3eba1212mr14731597f8f.46.1793032184005;
        Mon, 26 Oct 2026 09:29:44 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3eb8f36asm17611801f8f.1.2026.10.26.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/22] gpio: pxa: Add missing platform module annotations
Date: Mon, 26 Oct 2026 17:28:21 +0100
Message-ID:  <f5c8fcf9a24b9259974fbf6c8c9e4659c992818d.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=836; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=0N+lDmQgRDGBU1BCwydX6YgET7LObGjwfjhS8sLguR0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+0jHn4dx1Y8sKXbjtzi+lsdHrF8HtDVZTca OkHl0k6XqKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/tAAKCRCPgPtYfRL+ ThJICACfPyKIlQ5jWHFYTvw5ECfbeqgUFfEsD7kh8/mmqOTTGbnvDtp7mxSD6Bc8HeQyjoEyxtf uKC8LLsV2LMfCvBPFAogp3ILWmTmmJbMx4oYpRDlk1fIBMh5i6q0dJtV8Pl6IOj/vuL2HsVWfIe bKMuRuZMpcs/esTZ/fArR0sefEmv3HJPoPNku/UFVdr92cx6/FPV+I7NSTvQD3BV0HgKBGxG14X cmGimPOBjyQDOjbrPitRGzLAQwXE6KWr/m0P4RmEYXd8W3Re71ABvpmMbZTrzHodcb9yabF00n4 yq4OD+eXmuRhAGJfz9/LmqUyamuKrS0ItofPcCWqPFvleCW7
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using a platform device id table is
supposed to declare that in the module's metadata. Add this information
for the gpio-pxa driver that failed to declare this.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pxa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index fa2087acc025..d241fd4c3d31 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -719,6 +719,7 @@ static const struct platform_device_id gpio_id_table[] = {
 	{ .name = "pxa1928-gpio",	.driver_data = (unsigned long)&pxa1928_id },
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, gpio_id_table);
 
 static struct platform_driver pxa_gpio_driver = {
 	.probe		= pxa_gpio_probe,
-- 
2.56.0.rc1

