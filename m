Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130594;
	b=PKio/UrMt+asylIWMgHvydXjbsvldBc4Vdbx58xEBo+5BsqnM6MrYYu6OxzLsKEFmgNI
	 ireJiSv9dG1Zv2iqA8h9eUBrquy7s8Xar1P12aSja9Z7pevCWImn1s0mBVlDgq2kLBUtQ
	 Wwsul/lr2LkyVR9ck1UT2FmiRHotM7f7dhfRWYqemIqj0OjH7wCDeczQRQf6+rPcYafge
	 GrZM81Zw8vQuoLF38VtfnDS5ns0c9tsaIEYO+egKBJGpieMsmU1NVhrlM8TSN6AysZCw4
	 lwPQ0UKxHvRh16ly5ZXhWF1zP03lVUTzg1HXRgDRvuDZi/PCDigWEyL6jj7VUcc7g/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yd3r5u89C1nws23u6cOazWo8yNsN7RjySlD0iOTIu7A=;
	b=P0A2suzxWSs0XKq0LTez+TMnAm6y++qlx7XOWy/15oZ7m6AGZ2NiaaockIokfKIcf9by
	 DuOOdkqPXYqrs17JGXDD3TfgAIw4A1g4JFRPq0Al75MoFjqX8MVmT3itnGp+6DzeJqqT4
	 ncXCO/ka73AuvyXTHqB59h3HWtDa4WztkfcBxIxudrqefJ/z6MdyVpy0jINgJN5xP3C6U
	 Pq8IZp006PR8zjZR2YXKSTNh30s4xSyGd8FSN6tvJ/NQOTOxSQiBx1/dSgO/zcG4VVIMs
	 W9NgWi0yaYegGtVWIaWAeHy+AEEkkG7hZvfbTlntlArtrHg+tmvBZZo3lWor5ijLgtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EgA2D0PX;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908C9606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 908C9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EgA2D0PX
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so1208915e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130592; x=1794735392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yd3r5u89C1nws23u6cOazWo8yNsN7RjySlD0iOTIu7A=;
        b=EgA2D0PXjr5OVlOJ1qJdKWvqfNChTeLZaIutWFc7i8ppMT9c893UfwWDqREGn+aonr
         EMQTl30ad4OcYKQz1CVV2qUMU7vySG2WdwOhACUd3c6jKIwAsT9pwzFif18soBpqicYx
         zC1sjqfonn1LU1yqxyXyVwMClYrwkMbOs/ixZbhRjFTlSMno7fTw+Jvlc4SxUmbLAGke
         jLgI+3fNs8/8WjUR13CHqogb+9kf1LqpThzldouMeG7bw8Ev4ExuF69OGZ0ZfRlZR190
         TKl6a94eJSoSQxuzNMp77ln5sqpYEPL2mAwGXrIQTvabxqCAXXpry+YItLTGtqn+X9Nl
         aIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130592; x=1794735392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yd3r5u89C1nws23u6cOazWo8yNsN7RjySlD0iOTIu7A=;
        b=Gs0I3oX+z8AL7zqQVFiqqdcixNF88ppRo4TFQnQMIMnVdWJkxc5UgZOFRsDgAzViSD
         0BxURgOsEGCpsEFGe/zcCyOtHEsb/t3yHNHBdlSYa9amiB6/Pf73FlfJN+En/pxLK+lq
         FDgWLkei7q+zqz86FO30IEheqDsoRrwQw4BNnMHEwv8wQGeqrgXbF/pruIgvtZA762UN
         P0yZ0SB22Z+J5+1F3Sqrndv+h+LT2wKZkxGL/M16U7ou9CjGNtMU6qjfkC0+SwnOWBrb
         PLiEvE2zRzlhO1jVFU4mYaT9xMdsWSr2UUxcCt/J0T4kxBI3K04NAp41eipARfH06gRP
         9kvg==
X-Forwarded-Encrypted: i=1; AL+hErFmSJcNgzdV2+68l2DNzO4sGFcxCu4GOk/eH98Eh9lGwATz50wWnVNtOoz/faM5pmn+e284Ya04z/m2eZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DyVxbdmz+hheALp3aOY9d/FGQqeWatt52SWH9Egt4VRkCSM5I
	vy43r7YZhBL0eMK2ZSCWAnvkYe/jl2JWakubOF+TTr5T/jWqhLe4OKXy
X-Gm-Gg: AYBFou3FdCQm7Iyh1IdiBkChIOqZW8FzdRSrnbPhqbve1oE0tbFfbgirPtgbldD1bmj
	X7WJdxr+KyF5qYjk9TzbcWnGGm+Ij5sxgkoEIxPmsRNbCpZ8znCBsqdedSKiIhDjp7rCaFenXcC
	x175gAc12vhEo5JZQg+7MR2oVRHGKjWnKI44cKuNv/KT/BAJm9AMNIuFOjYSjtAkLaVdTTKkaRg
	MNpD0uYsbD+xY19rVh+GOxSE/XVXmEiJzvGARCpIjx0sk1JAz4ka8Kk6f17W4fxJuVTCwd7MQhT
	qUmklFrFDrEVx1+9Ra5gtaLzIvDkYaq6Dh5FXRDynyztY3vuCzLF8lTQwu08b4O9gzU8D6CJv0N
	D9d/NWq3duVYuUyGszHtIbKWKPGIyGAAdMbkgZkHgHewWtr4LYhOIY+/aOQtdFOOB3juUeY9k8m
	INCUDWt2pfBasEuCo8qwiQi9rsEBaqZ5YFGwn27LghmAz2KQCeklnH/RrYr0EgucDOkHQdFJpRx
	Wg1fpMpqFpGkxmoqxBNYr0dxbIKlgERD5iP2fHB6lUKZFNJ2c3PVcuSixvDHhxQOKV3/kjuAx5i
	wOEDNL4Zqc3nzacZLB9XtKlD3dP4oXWpDcw20n38xDBb2P00+ZrAnhglDUJ0B6IW
X-Received: by 2002:a05:600c:34d6:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4b963c6c2d3mr19662015e9.6.1794130591941;
        Sun, 08 Nov 2026 01:36:31 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm141650355e9.7.2026.11.08.01.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:36:31 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] hwmon: sy7636a: fix negative temperatures
Date: Sun,  8 Nov 2026 09:35:59 +0000
Message-ID: <20261108093602.329554-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108093602.329554-1-pmazzini@gmail.com>
References: <20261108093602.329554-1-pmazzini@gmail.com>
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

The thermistor readout is a signed 8-bit value in degrees Celsius.

Fixes: de34a4053250 ("hwmon: sy7636a: Add temperature driver for sy7636a")
Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/hwmon/sy7636a-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
index d51daaf63d63..f01f368d68e5 100644
--- a/drivers/hwmon/sy7636a-hwmon.c
+++ b/drivers/hwmon/sy7636a-hwmon.c
@@ -29,7 +29,7 @@ static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
 	if (ret)
 		return ret;
 
-	*temp = reg_val * 1000;
+	*temp = (s8)reg_val * 1000;
 
 	return 0;
 }
-- 
2.52.0

