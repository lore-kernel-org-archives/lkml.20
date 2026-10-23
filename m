Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792787179;
	b=gUjcxjP+YbqapilRYxxwwhADKVVaUdKH8RDThlfsSvYPGLKmoJz5z02244MN1uv92PSm
	 QLTTJt3K9IGgIa/PkUgA9TQHq8hHfggonzbeXaodbpxUHptf0gf5eTgnv8Udojp2RsVKN
	 778DK3S7wy2WDAwvh6EOn3yVe+Z9mbizKmivgHYSzXNH2GLephuvLyzqb6AgcPUiFjLlW
	 fRQ1PKoTF2hZF4DJ6cCx7cLCY3CGA4KDg0/eB1rBvmEZkPZ6g6IL58uqalATk/chBZA7M
	 UWselJ6/EOcsqRELm5TLGBk9gOgWwQImTDh2YL6TNMibQY9czZdsopqaOKC8jvIJOdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jMT/0jRYIKZhw47Q26itdzqUKsUFWhPK7paGQJTSrNA=;
	b=A4n9N5WIqH+WFmblEnEmJbIp2d8t6iUSO2boghE+N1px1oyTXu4IUqVsdDGt3Fa8nbTC
	 fhzlJbMFmSLcdCDB+8Kwi8XiAfIac04jeEZ3UJKjoVToL2y5GcSPyuni0Prjq9MOlPpIy
	 496Ka8QSYoS5M87IFGXR2tveYEkMCMS8LAReQV7i4rHKCVFHDAJBiwdZ8ASc7ksdLV7bu
	 mxCMj6WWRDY/Q6H/jCb2rzi1dNYk3einUpBTKTqA+VIZQzCmhbYLxrXVcXfrbLYtZPv29
	 G2aNlw7PAHUp2yYV53KVUn4OfrRBnzqADQh1A/dV7ga3sG4ar4ayy3ZtAlmT4ROCNuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="brUqs/ru";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69027606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69027606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=brUqs/ru
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so9699095e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792787178; x=1793391978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMT/0jRYIKZhw47Q26itdzqUKsUFWhPK7paGQJTSrNA=;
        b=brUqs/ruabJLhMCyTI1qCB113WGLMZBS6lZo0oDLGSLFgSrKweSNWSJT1wc+D3vUim
         H7ZVosX9ORfTMbN/yU8ouV6dClsHYYcd5l/rQcn7N9fJJEkc2Z1qQI7Ix1J6FDEscgsq
         /qedPqVuf4bnWODa2v8XvHZHSvzD3xxle37jagXf/59xLp/XqVXifdSXvX6L1RJ6kjeg
         rFGxBzv4eo1TxskqrUD23KmEXy8p7En4iSl5XvgAlXHrviDXeDPSsFoadeGqsgzSJDKP
         TDQ0zUgjBWOkln+z7EgAMsep+Oc4VIzsTg5lS9nLAMb7Vxc5ywjm7vafIiDdkz+uz7Dr
         I6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792787178; x=1793391978;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jMT/0jRYIKZhw47Q26itdzqUKsUFWhPK7paGQJTSrNA=;
        b=hnn59Uf/KeX/bk2TysXEOYpR4ZM/RKSqkCq+sjXvrN7jxMjmVNNyMUYOTj3IqC54rQ
         sijF0I52kL8Jm3l4FoxuHjpI4Fd5MwEAGdYqpMguD7Yz+h09oRFY82yEX1zWlS8udTsd
         R76tbNExMM1UcoEsfeST+lYA9vFa/pzPcrJe4Rwwmsd+cWA1nAPtuwHhKDTELgQz4Ysi
         Jk/gFnN6RnVZbS+YNaB7+qLTYnzNpawI2Xk4/CGTQr2B9brI+uFblavmcVi1zZZTQcqK
         5NPyIr+Cxth0FGoZXufSrN43UsrN6Crg0DkUs5/wk1J7hIszWYVrg0hO9wANyFv3iabI
         o/dQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5zKku+RbOKPEOA3YT/8kTls1QLr2+taEiigixeYau0zGsysXS5BA2gzMrEI6KP3zQEvTXxVc+wNqLQkY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRJyJ5DTUQ+9inoUFsh9IINyT3Jx/JBM1u8CwUbAzbFL0zXFzm
	X0ME28t5LOl8CVCioy068+tzZhAIATf5ZbY/apu4eG5xMLMsqg/MY7TS
X-Gm-Gg: AYBFou1SKS6HNM6ozPUAMgDbvs+EIZ08v4ID7phIsVuyqIg5hh66EyYMNMXHGeEgI0V
	xmrCD9tSSPK7zD3MqbnAdI8an00NbbCBeH3VzstMLghNj6SOXBD3ygFYv1+zwSuBh+olNGzxNyI
	b2kSrl25+wfOwImizySwrQSEjmBRBRp7iRwBoLqdK4R1uY0AV3aNB2e5ysSHRGEBlV75LlmTWs1
	jTH4suXb/qdHp7BF6BLbN1DgqHGEAK64LDAzsasL8qyLKv2fj1x2TZc+D3UiF2VSL+TKae93f0N
	a5dno7kRd6ttq6uLNCKVeozbnbSG62Xow8Caux41IV2JPWsF1p908x4rLIOJEnv/K4dFwKR3UhH
	O0UHKBtBFxDx2jGhLWtGK8KAN0bpk5YPX2H7iwcj+X/cPPlCKNe6uTKNHswavzYGYL630KDH8yt
	JK4cwBiwvmkDuqqYTifDH/+dHCevg5k0RlEWDfgMzMi6ttVMUgNKIfXw0S2px4Vh/gkuCB6FwyV
	6PaLCZreG28uyTxJNQKyTRSzF/Om++QJYinPHqkCF9NX+amhrDCbDk8WjY9MKVdxnL6WPlpkU4e
	RzXOPQ==
X-Received: by 2002:a05:600c:a45:b0:4a1:e11f:b2e1 with SMTP id 5b1f17b1804b1-4a35aca4bbbmr269895e9.15.1792787177630;
        Fri, 23 Oct 2026 13:26:17 -0700 (PDT)
Received: from legion.. ([5.43.81.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a573f65sm5674945e9.10.2026.10.23.13.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 13:26:17 -0700 (PDT)
From: =?UTF-8?q?Adi=20Kadu=C5=A1i=C4=87?= <kadusicadi1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Adi=20Kadu=C5=A1i=C4=87?= <kadusicadi1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Miao Li <limiao@kylinos.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	"Rafael G. Dias" <rafael.guimaraes.dias@usp.br>,
	Pan Chuang <panchuang@vivo.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: light: stk3310: replace sprintf() with safer sysfs_emit()
Date: Fri, 23 Oct 2026 22:25:40 +0200
Message-ID: <20261023202543.144563-1-kadusicadi1@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch replaces sprintf() with sysfs_emit() safer alternative
with no functional changes.

Signed-off-by: Adi Kadušić <kadusicadi1@gmail.com>
---
 drivers/iio/light/stk3310.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index 0a16e326e939..e751e7c97bc1 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -18,7 +18,6 @@
 #include <linux/pm.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
-#include <linux/sprintf.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
@@ -180,7 +179,7 @@ static ssize_t stk3310_read_near_level(struct iio_dev *indio_dev,
 {
 	struct stk3310_data *data = iio_priv(indio_dev);
 
-	return sprintf(buf, "%u\n", data->ps_near_level);
+	return sysfs_emit(buf, "%u\n", data->ps_near_level);
 }
 
 static const struct iio_chan_spec_ext_info stk3310_ext_info[] = {
-- 
2.43.0

