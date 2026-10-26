Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032202;
	b=eIriwRpn/k348RJYDYE73C5S8CBG24z2sV730MqcImeuDIqShN+0rzdTHDQiKAA4BFgI
	 tjySHU2T2VtuBeSXtc8HNp3WN9G0DJ6o1ZaL4BpcL7Dbh8WTmIyvJWq9m3qGue7/S2/Q6
	 sveIZiVW2vmxZvwkXnMXjMRANXj4bJ2TKOcm9A3RmGM6AHneqwxqXRjYo027IWUuArD5/
	 WYBfE3xx6RxYTulW27PNPv5CUUqeYAdaYHtY9Y9geq7FG7MpR2F9RJ3fpziKOeouPAZVp
	 N6QQ4UfDZ2/SfTlxRdQEIByR8iQRPPkNQq1iXUFliCUuSxg4MRe/jU30GX/sN4n4YQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=uF5HkZQaHf1SCbf7usjf41MIdbklI67YDhm68D8fP78=;
	b=2AYyyMVa0gKGCHUO7qu9CCjV7b8JAKU5gXqlxESHslRQ1AWeCDG5LmrGp6mcxz4ivaBI
	 FQvSA4f8hGbD1Ibv13G5OhLsQzYDZPZfDk2sJg1pPfmq/3xKVPRAMPOnyFY5iFc9ndoeT
	 8S9r1145MGrxnXPv05RNsH2xjjpN1VIaMd7mOrTMeRSjBzYXDifKLjnyc2UuKUnZd6qto
	 53uWceECJLjjLMjRVaJKhpC+z6tXnudekLqZ66Wf28wKHQpXDyWxHpuKdb6poOBl/lcw6
	 6xKBseMlvBPUIj14JLhfinokMqO+t3FhMSH0DHaJYsImxns97VZj7T3BRNpNoleKXwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FOsw1ZWl;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6E860A6F4E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A6E860A6F4E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FOsw1ZWl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956869750eso21291555e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032201; x=1793637001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uF5HkZQaHf1SCbf7usjf41MIdbklI67YDhm68D8fP78=;
        b=FOsw1ZWlC4apQNQ5/kMtL1+StV9MniDxLMQSzrdYpzZfM+HTjQ7Vy3UxOwHETQXwFN
         is0ow5ngAvqPYltMDJOWjQbZjUu0wv0fkB5S1TtwaBT4a9DGAd8KhlOwL1Pnoc5XH0Ns
         komaD10rzSjWz/5nbekvsaFiEhlVPha9yYYYUB3IFFR0pmGBUZCdMxYC88v56lI5QaJa
         watiM4dr5zQTp0Z1CgdHQwkr1htcPsVY8w2ka13O+zVO1p8ZeHUfAxC4evArRPKQ8UBw
         JfZg72AvUey7yzXxQ3SRL2o/4R3cnhJ7BiUAq+CZc9BCjLEC771qzyp4MDRLTtwhJnxL
         NIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032201; x=1793637001;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uF5HkZQaHf1SCbf7usjf41MIdbklI67YDhm68D8fP78=;
        b=FLng/Lovpm06l+cAGb3D8JXjPFnyciD124V/8hAbenkqZ9e7CpGOsE0uxtRq92agIM
         Cy6uCTGGBjJToA1XidQ1frtFCA02OluIYKpfayox5UAdw8lhkGptXh3Ef0mKkc703riX
         1L6HYAVDYYPTiUwVJIHZyi5/EB8D5J01VC+g57eOGsvC5iVy3wz3TAxB3luWQ68VnlxE
         w1065MNEh0bn/uDOyjO7QrQPgyhRwmhS4nO8cvKL1F+6polTl7qdPMKDwdgoktEoNJ0z
         eB6b8jW8ouJIWo1FmMZN9mfjbZ+nxd6Pwj2cHEc5Ia7YL6B+QZatSv4B6WmUeXelFfBW
         cJaw==
X-Forwarded-Encrypted: i=1; AKwUvBwTd8Zsg1ksIY7gfBWweWJF7IIfI8ROr3TYQIJbhFi9c/9rU+yyHL7i5j/kFVPtf78BqTre+pfCaNPxp2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsKuFbLJsEZ04F90l+XhckHwGUSLr9hyLBfzABhDBKET/hdHnK
	6Y92se7U2gU8FsFvldAz1lbqzqigLKm2KhFzqLzoYTjspjH4dpxLmM8OPgKxwdjwcgM=
X-Gm-Gg: AYBFou2XZv1mspNAmidRz5glD9d/QKkSYRWu7Y92dVjEtIjP0y7RHqZBtOEPiuqsSV9
	lF8P6xuUy9TheaH+A2fV+AjoO2DjVyqKWzbidecwFp4uuVpEuvujR4zd+ckLY7CqeseK62SxDsR
	wP+t2FLvNdWksrPoDfwf8EGM9Im6rqgiucHzf3fGEsb9LpGv+KG1WfBvAM+/XUTugGVBKrMaW8e
	+ODJhJdCsdeY2EIP8mszbXZ8hwIqeh54w7ls9IsYuxugfxlNOrAvc4vBKRX4Q9eKgFNFa9mncdD
	iAlweO9eTkY7fqzl/pwba3+51aAq10waYYt/8qsikD01+XH3c72wvQwQckGf9qImxsL2rBdUGKc
	sd5wI6Vtehw49mYmkigC/uwHTpJiIBvl6sAgpQAQXsBjAr5Py8GdEoij007Dm7zLv3E6lT2hz3w
	wWUG/8VsU31JdFIQ1UukriQscvWCx3Z3xuBXPCAq7WXXCrqrtMZq+3zVxrUbIQfRGe2UJNH6izO
	8iWt3hnhJE5Vw3VidCk33vGPKu97koe/AdqFwsXpSqNEVLmyeyH0+JmVBynMAm7hGPiYsmXzqMk
	EMpfB+EBhH5Cq1849XTmo825SnYMn89lF/lmk+UsJD4=
X-Received: by 2002:a05:600c:c085:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4a78fe81333mr13150915e9.28.1793032200691;
        Mon, 26 Oct 2026 09:30:00 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a359fbb725sm204105535e9.0.2026.10.26.09.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:59 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 19/22] gpio: max77620: Unify style of platform_device_id array
Date: Mon, 26 Oct 2026 17:28:30 +0100
Message-ID:  <3dbbe9d220521f38906651b13f349336d7b26bda.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=PwZq6cSexLoeh84nIBT27WIhYIRtJCbiT1iCV8GXeTE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33/Q4dFDbCCfp3NThf57gFGSTcF0s1+A0ZzLR 4dLgPCjkouJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/0AAKCRCPgPtYfRL+ TqfzCACF1Y2UKUsuUZYnOgstlOezvxv27Or0D841whThpcdSD8OITXkrBNrBZ10N/p4BOYrYSK9 K0iNJ/YQwqDMzYKJje0kAmb1mDHakLxtzgVnOo/nvngT93xVrDSd16B0/Anyzzk5/r++a1PquvP AzJ8P6b/BIl7PLRiA8Ic/hKfOjyShyVKjLNRXb9TOz5w9z3IrXERPlcsa/qyoeC37l+39CqNWQg CFqk5r+i4RndYhinhE2opzIcmwZTI4nOUypnmR8WRHoSiaTjmLy7z4+nlMcU6duBd/Kyhltvqcv XG2ra1oaLNJBDRnJTUUu1PnNivCk8irYtsr4iCCWddFNK2wU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the platform_device_id array to conform to the most used
and generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the single offender accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max77620.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 2bf3b55a61b5..99ac7ffb650b 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -365,8 +365,8 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77620_gpio_devtype[] = {
-	{ .name = "max77620-gpio", },
-	{ .name = "max20024-gpio", },
+	{ .name = "max77620-gpio" },
+	{ .name = "max20024-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77620_gpio_devtype);
-- 
2.56.0.rc1

