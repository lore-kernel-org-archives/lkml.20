Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558752;
	b=Qd1MFL0dmcep74vz5N+76IpIZeyVhIcUVD+ZHRFoxe2gbaS67goyI55rpdX70otMHNHg
	 VRxOmSlkwLwGHwcFWydUZhT8J91W5fGhQy4VqOK+QtQYsVFEiIXRHHo2t+zQSXxkKDaFD
	 oRukDSghLN20xEbPJ3ukn0voXjO1RlVm536ZcBUORCWdOCnl6/HbGux34dBcbklna5yW+
	 8YJeNoUcoWHaJvd+tuqPmBEB/PKDEmiO5NU+NsNIULXMTU6/ty9WSiT2bOTy//Q32LE1P
	 N0u2Ml68rmvtzP8RDbg5z3/JIGH21YXGIJzsnZjwZ32rbJafiFQU6rJRKdfukhLVG2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iSU38EcMZfIIXouCuIDccJH8EhhzfGLu0Vv+v6R4YDQ=;
	b=SIusoqWWcY1G00CJKYFTRKjMVQX0eSkzlSyG267vi/RtHQJcg8Ig3vB9P5Lzjc9HrE30
	 I30LOgBFcmNpyQdN0ydceruJ0Q9GMdi+D0clGOxk2H/Vls8Bz8V+NCXwxQBpTG6d/brXl
	 xnFWnLYbVuJOUE32vm5IWsvsNPB5fqB1lhxKAinMw9JdznN5nltdRwZSas5HLqWuPjw8w
	 TdlW8hHfvbtZdQlTtNT7uUM0P2PNDCIVt0hzo5PF/HqzFGtRuvIqPYzmLlSu0a9PTUvSn
	 bHsf4iMeC/yS6BtvhDQES/PtPj6j5rSJwy4WGVvr6Do5NlQkiEq1ezlsY3IYUXcQb4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QCnqB7Qa;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BA4606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2BA4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QCnqB7Qa
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso90559b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792558751; x=1793163551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iSU38EcMZfIIXouCuIDccJH8EhhzfGLu0Vv+v6R4YDQ=;
        b=QCnqB7QaEQOw+6rI0X7E8ZaIqfc1YdvX+5dUjvduWaQI9agXq/UfU0HaW9/RDQgOjM
         qB+Avv33iFu+4WQb2ZkEFPFUMj4nffOJ5TztpUeK8eBqnLeOzUgWjbce72ZGyz2QmTVK
         +f7dNz7eziJ84QT+H5mafLjeqeUHP8FrmcBtTQf9UFSF2mpouQviRHPpuNHdAw/3Ccdx
         a1/qabzriMy1BP394FHUWXKxqYV4yI7573RJ73nyiRZaFNuSpQ/nuMI0+t1mKFtn34Vm
         IjoEDVe60LNtjj7LnJpgeyR7Sx/DTp6l0xyeIPfucZ53tFGieQmMsIBwsdHEZU2zX7yZ
         sybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792558751; x=1793163551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSU38EcMZfIIXouCuIDccJH8EhhzfGLu0Vv+v6R4YDQ=;
        b=zAbFc91TkFDZMZziJlPqXmF5e1crVuNdF5MgzohQqsdV8lJ1XA5kZql+uqgPtF+uDB
         NYpjlHfWndcZEzlilJseXZVTXbZs4CR/cDvSHaHhI002LSlf1EfUILkbXKRYWftrrof8
         x1alI90aQ1cSCpz2ohlCJK8NlJIjcJff6igN0JE98u80dje7+CnP2jYLz0aUG2Q2ON51
         3wRA2UZE2gNo9HgiNChLG7E1gx3OU1lAaUxkWM/gl59fTBu4sBBJDrYyxwTG0nqqzI2t
         MJaJi561aR2ZGxlYVZe0ZBuzzYvUuJUkWk0TS5ZwDEbTf6pC+h1YGHNAyEZeaoOjUn5B
         SXHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLmNE5v4558OpxTIvNdn+5x5q9+E1OAN6kXsaH6OqE3hM/acP22gkG5xRyxGsuGDVP//slVlyELf4sGvk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlBuIEr/xrj8nPnytOkAincB1ZgF4XxQ7dmeC6jJrOiHsuifns
	UB6TPMS9QuSe1Pd6R/nt+odNvWYB+cY/AE9h/inUdBpoR4++8gdpuWOI
X-Gm-Gg: AYBFou1MVmFWIErF9Jt/uP91rhQcDiqRyoC7Y2hPDO/SXgiBPbSLUuKQmbnx3hVRuG5
	JnRi6xmhAmr4NMUxLxQIfJVwcnlCMYjsZu3WKmDbCjIMuKOCbKO7z3uiW5uC/82N6Kmg2e2a08V
	xDBauYd6m8kc4D/aHcbMwhf5G26LM9QTzv7JfUrwrK+fdRDGT1393VdcKPMfkiazA3glBKbT2Zi
	l4/WaPpoKhv5UlsE2ndU8Qcx/uFtiDknGcfz9pvXONAJQ2AILQkHE368hPRosxNLbzt9prwWyjN
	mSiEwoYMXGergsGuVr9GcKwfLklbNnC/cONIcZDUMcLGT7y5/vXylwzTeZFJrk17/vzf0Rz0mwt
	F8FNT5e18x+cHL1ppSdl7WXOqomb1fSR2Hb9T7bgs63xHTuYiQdW+NC0ONoFKcPyo4eWKqMP1qo
	/mBgJGGh4NVbmqRg4WZ6NdKlTS9LPI4HEZYQw9foy785WDQnk+FYLgdyy9hA6dwFD+jrrl1Oolx
	9rTu8jBohn3ClEgeFLpXouFkiaFNMdY4rFi4SodZ+hotqqplWA+VyadqqLcVxgGPqP0M68EhJ1g
	9uRPqatH4q0pj4Z64nAmrfvBvLT2tAhA5tqmvoxEOtNM0fO6F6b5asIO8uvIwA0FWFRlNYQ=
X-Received: by 2002:a05:6a20:3d09:b0:3e0:bb59:7fc0 with SMTP id adf61e73a8af0-3e287e7e807mr824422637.52.1792558751116;
        Tue, 20 Oct 2026 21:59:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6a871dbb9sm313903a12.24.2026.10.20.21.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:59:09 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 1/2] leds: lm3532: Propagate enable GPIO errors
Date: Wed, 21 Oct 2026 11:58:31 +0700
Message-ID: <20261021045832.16356-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() returns NULL when the optional GPIO is not
present, but may return -EPROBE_DEFER or other errors.

lm3532_parse_node() currently treats GPIO lookup errors as if the GPIO
were not present.

Check the return value and propagate errors from the enable GPIO lookup.

Fixes: bc1b8492c764 ("leds: lm3532: Introduce the lm3532 LED driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1 : 
https://lore.kernel.org/all/20261007104915.507801-1-phucduc.bui@gmail.com/
Link v2 : 
https://lore.kernel.org/all/20261009091059.25729-1-phucduc.bui@gmail.com/

Changes in v2:
 - Capitalize the first letter of the commit message subject 

 drivers/leds/leds-lm3532.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index b51496910b08..a3bc9680dc4c 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -560,7 +560,8 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 	priv->enable_gpio = devm_gpiod_get_optional(&priv->client->dev,
 						   "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->enable_gpio))
-		priv->enable_gpio = NULL;
+		return dev_err_probe(&priv->client->dev, PTR_ERR(priv->enable_gpio),
+				     "failed to get enable GPIO\n");
 
 	if (priv->enable_gpio) {
 		ret = devm_add_action(&priv->client->dev, gpio_set_low_action, priv);
-- 
2.43.0

