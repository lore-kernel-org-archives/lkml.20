Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243199;
	b=tE8yPdq2sI9xSfVZLk+Ul/UmIIThSbrvm4h5zaATZoQVZZ+B+s6gF37KXXgACGrosZAV
	 D5pr/m3+KJZFQSh6Qy0d+sVpfXCXb2Q/miVWJ56j/RJfj5627QvxAf5DvRisJWcrGnzux
	 0xdAi45+dd8MTbuh8CYxZeb88nTvdzgOTIUBs/TfBwwLIRv+1GsNduOj6NtZ1D3Z7/2ec
	 As1Jii9M+3XOW3DHw46LDzlFUF+LSn/UprsuuHf9pmkARad7gbo2+dqs09wDuieqYufgv
	 x3iCuvSHXPmdgW1eLQuhZ+z+GahGb3EAd6Fi50gOHhDreXZh5R2IR3CZ2DVstWKQ45w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ShbzkIQa6iD3Yh19E6sZ/yyHbNgJ2H3YfWH0hJZQ8kw=;
	b=apJokLW7A6TqrV6KAptwrckBss8Vtu7MEpUNThC5pz2XInX9VT9gL7LXqvqbtmfBEnMS
	 3JT/x8GpqNYLyTJdv+OEETuOSLuvo7SjlB/bzAnkaHPUpHRmFUfRQoYa78cPNOHfQeItM
	 Iq7hVK4/rqHEfrugCAPTfzxybH6PTmjvmP4QZeFBJZvX81iiPqmlyNvtBjCCZ0IFRXILR
	 /MSkQDAZur6ZExgPXaZmFQMxP4R/6z4jiSOrb/fKR4Yx78Km7rK8g+OPvzOquvJQ+vXUj
	 wj+Po9hAa2P13qeS+yRVF0NiiOeh7BDOJKQEugpNVVSOKgg4/JkjOeEaOHjhrEHmMHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RGTFNMJY;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8539F606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8539F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RGTFNMJY
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso588196a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243199; x=1794847999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShbzkIQa6iD3Yh19E6sZ/yyHbNgJ2H3YfWH0hJZQ8kw=;
        b=RGTFNMJYdBS0cgQ88AMNk04K6Mq2fSu/WyCzOqNVC1BWznq6UgHyli2qvP+nPZPMMT
         dK5OVThC7yr34Ald/BV9e1D/n4H3TrencJ1i81wmuvwfWckHCY90ex6T0Ucb9i4gf8+f
         1ZkHmWUE1A3DcmaoquK2ekNDTk/QYfVz6+pjCIKeaF2YV+WPAVNl4Ra23hQy/KU1xehR
         40nb13lhYswzOC9AUz7NNm0WEytabQqbOMoj6c0GWp8XioV2gUmju5OGCXr4JL1dxSiH
         O1tx1aTrSMAZnqRI1XncjurNQhUhDE2tViSn4okW4MMC2T+TuUou89wdDnGz5oQaCbRH
         r+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243199; x=1794847999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ShbzkIQa6iD3Yh19E6sZ/yyHbNgJ2H3YfWH0hJZQ8kw=;
        b=RWZ+aRLhuaLBkgiQJfBXgUhWGLr2yhWbr7/SkbHL75WmGNFJs0ZfeMgHLCdRKzISr1
         Ej11mz1pWYtVGW5sBbSlYG21WqD5nVNRR+RdWT1i8CZ23rat1FMP4tExqwKjIjYTVu7x
         bX2Mh7nzWQzTAhd4+zlURuUZPM4b9xH5h1htUq8emzkigcWCF3ZhxxmEmaRrreIav0SA
         YqMlIAy+Zr0eDBF0aQ1zASkxjGPMKnR29KnDRK7VL2OleuCa/qhiBXawoFpsyvqO7ir1
         xPMf9eurKZ3aGJai9k1o6Glw41nRtswRdPkdO7jk1m9vUt5oEvb6nhUMseNZkYv0RFL8
         kZrg==
X-Forwarded-Encrypted: i=1; AL+hErFgwmB3xDLKPZAZJ9wdRqLtkKqYDuGkw3M9MuDCmYIvEWzS+vH0vAYUxPICPlGUcPnlCdio2vuk+jBBQdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DalET50KEt/zpdBNkcxmQnwCHrgzecXXYWdu4RcnAssNc17ya
	RebYfBslaUa/tQ3yOc5vHqTA9DQ8Yd4Zn8whTID8VatSvsAAHlkSXXDz
X-Gm-Gg: AYBFou38P14AU35LP6y1C4CkQTdqB0QcLJjxWdrPvHeNBTSkGw+fRNUY0bp5FQnpgwO
	0qVtXeUMfCBuBEHlWm8bW9TslsPyklq7nOuOjH9qEbgCmdCH3BMw25hnVI9c33RjT75v4oUYd/p
	5Vqwp87KbPx8VRsUwd0apmLJZ+5FfuhIqeEAqrMEShWqx+iSi+/55eUFsIK54YT/xMzd3NHYDbu
	Vbi6OIhYniWctZwopFxFjMK3n0jRp0mr9V4+rYkxYiPtez4VuG8t+vxr71TPdcX1/NxqafllJyd
	AkXCGwWRu1vyEumtb2oqlYXVm1O+kSN8Nxi1V17Z2tErrVCbndjFSsphmBNvxHv8CaNYsrYQgo0
	ema29SdbRz0wra152XNVxrMQeH5yQ9XFboDBlxE07rbxh4C/0NOjSAVE9Df7V//5aqPTwSSWItl
	ge1C5nwMJK7P0G24VlJ3p8sDwTeRT7GUiTmm8O4MScWtJSTtheGsYrb5lCNaDEjyBMZANdrep6s
	7LW/iIS23RwDi5Ger0Tb6g8/taMEuoqn//EHZEqnJgktCja02TQZuksMFfnXtpaUQi25UaZxkJI
	4tdYI7mjbRnG2HzzThex8o9mArrsfUvGhH4kKbmQ1a20xvCyAKFT5INfD0k0Pt2OL/1yTeyMq2p
	G7AK90DzTjpq4h/y+AUVgknEaSCY=
X-Received: by 2002:a17:90b:5604:b0:3ac:b6eb:e0de with SMTP id 98e67ed59e1d1-3b1678cf082mr61000a91.4.1794243198803;
        Mon, 09 Nov 2026 08:53:18 -0800 (PST)
Received: from debian.ari ([152.56.156.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1034718f8sm6455688a91.4.2026.11.09.08.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:53:17 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v6 02/11] iio: adc: ti-ads1015: Sort headers alphabetically
Date: Mon,  9 Nov 2026 22:21:30 +0530
Message-Id: <20261109165139.30803-3-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261109165139.30803-1-architanant5@gmail.com>
References: <20261109165139.30803-1-architanant5@gmail.com>
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

Reorder include headers alphabetically to comply with the preferred
coding style and improve maintainability.

Drop the redundant linux/iio/types.h include, as its definitions
are already provided through linux/iio/iio.h.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 7211cefc731d1..3c2f27f41093c 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -11,24 +11,23 @@
  *	* 0x4B - ADDR connected to SCL
  */
 
-#include <linux/module.h>
 #include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/irq.h>
-#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
-#include <linux/pm_runtime.h>
-#include <linux/mutex.h>
-#include <linux/delay.h>
 
+#include <linux/iio/buffer.h>
+#include <linux/iio/events.h>
 #include <linux/iio/iio.h>
-#include <linux/iio/types.h>
 #include <linux/iio/sysfs.h>
-#include <linux/iio/events.h>
-#include <linux/iio/buffer.h>
-#include <linux/iio/triggered_buffer.h>
 #include <linux/iio/trigger_consumer.h>
+#include <linux/iio/triggered_buffer.h>
 
 #define ADS1015_DRV_NAME "ads1015"
 
-- 
2.39.5

